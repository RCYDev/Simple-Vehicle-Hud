window.addEventListener('message', function(event) {
    const data = event.data;
    const hud = document.getElementById('hud');

    if (data.action === 'toggle') {
        hud.style.display = data.display ? 'flex' : 'none';
    }

    if (data.action === 'update') {
        hud.style.display = 'flex';
        document.getElementById('speed').textContent = data.speed;
        document.getElementById('gear').textContent = data.gear === 0 ? 'N' : data.gear;
        document.getElementById('fuel-bar').style.width = data.fuel + '%';
    }

    if (data.action === 'hide') {
        hud.style.display = 'none';
    }
});
