/**
* @ Author Elyse Ayala
* @ Version: 1.0
* @ Date: 5/17/19
*/

PImage backImg;  
PImage playerImg;
PImage wallImg;
PImage startImg;
int gamestate = 0, score = 0, highScore = 0, x = -200, y, vy = 0, wx[] = new int[2], wy[] = new int[2]; 
void setup() {
  
  backImg = loadImage("./backImg.png");
  playerImg = loadImage("./playerImg.png");
  wallImg = loadImage("./wallImg.png"); 
  startImg = loadImage("./startImg.png"); 
  
  
  size(600,800);
  fill(0);
  textSize(40);
  fill(255);
  
}
  
void  draw() { //runs 60 times a second 
 if(gamestate == 0) {
    imageMode(CORNER);
    image(backImg, x, 0);
    image(backImg, x+backImg.width, 0);
    
    x -= 6;
    vy += 1;
    y += vy;
    if(x == -1800) x = 0;
    for(int i = 0 ; i < 2; i++) {
      imageMode(CENTER);
      image(wallImg, wx[i], wy[i] - (wallImg.height/2+100));
      image(wallImg, wx[i], wy[i] + (wallImg.height/2+100));
      if(wx[i] < 0) {
        wy[i] = (int)random(200,height-200);
        wx[i] = width;
      }
    if(wx[i] == width/2) highScore = max(++score, highScore); 
    if(y>height||y<0||(abs(width/2-wx[i])<25 && abs(y-wy[i])>100)) gamestate =1;
    wx[i] -= 6;
}
image(playerImg, width/2, y); 
    text(""+score, width/2-15, 700);   
  }
  else {
    imageMode(CENTER);
    image(startImg, width/2,height/2);
    text("High Score: "+highScore, 50, width);
  }
}
void mousePressed() {
  vy = -17;
  if(gamestate==1) {
    wx[0] = 600;
    wy[0] = y = height/2;
    wx[1] = 900;
    wy[1] = 600;
    x = gamestate = score = 0; 
    gamestate = 0;
  }
}
