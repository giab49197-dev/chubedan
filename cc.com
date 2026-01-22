<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Click Box Game</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        background: #222;
        color: white;
    }
    h1 {
        margin-top: 20px;
    }
    #score {
        font-size: 24px;
        margin: 20px;
    }
    #gameArea {
        width: 500px;
        height: 400px;
        background: #333;
        margin: auto;
        position: relative;
        border-radius: 10px;
    }
    #box {
        width: 50px;
        height: 50px;
        background: red;
        position: absolute;
        border-radius: 8px;
        cursor: pointer;
    }
</style>
</head>
<body>

<h1>🎮 CLICK BOX GAME</h1>
<div id="score">Điểm: 0</div>

<div id="gameArea">
    <div id="box"></div>
</div>

<script>
    const box = document.getElementById("box");
    const scoreText = document.getElementById("score");
    const gameArea = document.getElementById("gameArea");

    let score = 0;

    function randomPosition() {
        const maxX = gameArea.clientWidth - box.clientWidth;
        const maxY = gameArea.clientHeight - box.clientHeight;

        const x = Math.random() * maxX;
        const y = Math.random() * maxY;

        box.style.left = x + "px";
        box.style.top = y + "px";
    }

    box.addEventListener("click", () => {
        score++;
        scoreText.innerText = "Điểm: " + score;
        randomPosition();
    });

    randomPosition();
</script>

</body>
</html>
