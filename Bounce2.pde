PImage DVD;
PImage Screen;

float x = 300;
float y = 300;
int dvdWidth = 61;
int dvdHeight = 36;

float xSpeed = 2;
float ySpeed = 2;


float boxWidth = 600;
float boxHeight = 600;
float boxWidthSpeed = 0.5;
float boxHeightSpeed = 0.5;
float boxPosX = 300;
float boxPosY = 300;


float radius2 = 600;

void setup(){
  size (600,600);
  DVD = loadImage("DVDlogo.png");
  Screen = loadImage("oldtvSmall.jpg");
}


void draw()
{
  
  background(200);
  
 

  
  imageMode(CENTER); //Når du tegner firkant, så skal de angivne positioner være i centrum
  image(Screen, boxPosX, boxPosY, boxWidth, boxHeight);
  
   imageMode(CENTER);
  DVD.resize(dvdWidth, dvdHeight); 
  image(DVD, x, y);
  
  boxWidth -= boxWidthSpeed;
  boxHeight -= boxHeightSpeed;
  
  
  
  if(boxWidth < 100 || boxHeight < 100){
    boxHeightSpeed = -abs(boxHeightSpeed);
    boxWidthSpeed = -abs(boxHeightSpeed);
  }

if(boxWidth > 600 || boxHeight > 600){
    boxHeightSpeed = abs(boxHeightSpeed);
    boxWidthSpeed = abs(boxWidthSpeed);
}

  x += xSpeed;
  y += ySpeed;

  //Hvis jeg er gået ud til højre, gå mod venstre (negativt)
  if (x + dvdWidth/2 > (boxPosX + boxWidth/2)) {
    xSpeed = -abs(xSpeed);
  }
  //Hvis jeg er gået ud til venstre, gå mod højre (positivt)
  if (x - dvdWidth/2 < (boxPosX - boxWidth/2)){
    xSpeed = abs(xSpeed);
  }

  //Hvis jeg er gået nedenunder, gå opad (negativt)
  if(y + dvdHeight/2 > (boxPosY + boxHeight/2)){
    ySpeed = -abs(ySpeed);
  }


  if (y - dvdHeight/2 < (boxPosY - boxHeight/2)) {
    ySpeed = abs(ySpeed);
  }


}
