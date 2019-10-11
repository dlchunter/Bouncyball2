int rad = 60;        // Bredden af ellipsen
float xpos, ypos;    // Start positionen af ellipsen  

float xspeed = 2.8;  // Farten af ellipsen i x-aksen
float yspeed = 2.2;  // Farten af ellipsen i y-aksen

int xdirection = 1;  // Til venstre eller højre
int ydirection = 1;  // Top eller bund
float skaermX;
float skaermY;



void setup() 
{
  size(690, 690);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Start positionen af ellipsen
  xpos = width/2;
  ypos = height/2;
  skaermX = width;
  skaermY = height;

}

void draw() 
{
  background(102);
  
  // Opdater positionen af ellipsen
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test for at se om ellipsen går ud fra skærmen
  // Hvis den gør, så gang med -1 for at sende den i den modsatte retning
  skaermX--;
  skaermY--;
  
  
  if (xpos < rad+(width-skaermX)/2) {
    xdirection = abs(xdirection);
  }
   if (xpos > skaermX-rad+((width-skaermX)/2)) {
    xdirection = -abs(xdirection);
  }
  
  if (ypos > skaermY-rad+(height-skaermY)/2) {
    ydirection = -abs(ydirection);
  }

  if (ypos < rad+(height-skaermY)/2) {
    ydirection = abs(ydirection);
  }
  // Tegn ellipsen
  ellipse(xpos, ypos, rad, rad);
}
