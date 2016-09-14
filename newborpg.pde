//fix physics
//make sprite small
//add perspective scaling, scale()
//hit boxes to work

float x, y, baseline;
PImage hannahRight, hannahRightWalk, hannahLeft, hannahLeftWalk, currentSprite, newBoMap;
boolean walkingLeft;

void setup(){
  newBoMap = loadImage("map.png");
  size(600,600);
  x = width/2;
  y = height/2;
  baseline = x;
  hannahRight = loadImage("Walking right 1_2.png");
  hannahRightWalk = loadImage("Walking right 2_2.png");
  hannahLeft = loadImage("Walking left 1_2.png");
  hannahLeftWalk = loadImage("Walking left 2_2.png");
  currentSprite = hannahRight;  
}

void draw(){
  background(newBoMap);
  if(walkingLeft) x = x - 2;
  image(currentSprite, x, y);
  checkHitBoxes();
}

void keyPressed(){
  if(key=='a'){
    walkingLeft = true;
    if(currentSprite == hannahLeft){
      currentSprite = hannahLeftWalk;
    }
    else{
      currentSprite = hannahLeft;
    }
  }
  if(key=='w'){
    y = y - 2;
  }
  if(key=='s'){
    y = y + 2;
  }
  if(key=='d'){
    x = x + 2;
   if(currentSprite == hannahRight){
      currentSprite = hannahRightWalk;
    }
    else{
      currentSprite = hannahRight;
    }
  }
  if(key == ' '){
    if(currentSprite == hannahRight || currentSprite == hannahRightWalk){
      currentSprite = hannahRightWalk;
    }
    if(currentSprite == hannahLeft || currentSprite == hannahLeftWalk){
      currentSprite = hannahLeftWalk;
    }
    baseline = y;
    y = y - 20;
  }
}


void keyReleased(){
  if(key=='a') walkingLeft = false;
}

void checkHitBoxes(){
  if(x>53 && x<115 && y>256 && y<295){
    println("DAB");
  }
}
