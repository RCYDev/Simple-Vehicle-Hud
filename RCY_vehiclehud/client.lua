local display = true

RegisterCommand('togglehud', function()
    display = not display
    SendNUIMessage({
        action = 'toggle',
        display = display
    })
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100) 
        local ped = PlayerPedId()
        local inVeh = IsPedInAnyVehicle(ped, false)

        if inVeh and display then
            local veh = GetVehiclePedIsIn(ped, false)
            local speed = GetEntitySpeed(veh) * 3.6
            local gear = GetVehicleCurrentGear(veh)
            local fuel = exports['LegacyFuel']:GetFuel(veh) or 0

            SendNUIMessage({
                action = 'update',
                speed = math.floor(speed),
                gear = gear,
                fuel = math.floor(fuel),
                display = true
            })
        else
            SendNUIMessage({
                action = 'hide'
            })
        end
    end
end)
