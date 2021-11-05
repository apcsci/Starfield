PImage img;
Particle bob [] = new Particle[1000];
boolean explode = false;
boolean showImage = true;

void setup() {
  size(400,400);
  img = loadImage("https://content.app-sources.com/s/03735395907782131/uploads/Images/Pinata-8723095.png");
  background(0);
  for(int i = 0; i < 200; i++) {
    bob[i] = new OddballParticle(); 
  }
  for(int i = 200; i < bob.length; i++){
    bob[i] = new Particle();
  }
}

void draw() {
  background(0);
  if(showImage == true) {
    stroke(255);
    line(200,0,200,200);
    image(img,100,100,width/2,height/2);
  }
  for(int i = 0; i < bob.length; i++){
    if(explode == true) {
      bob[i].move();
      bob[i].show();
    }
  }
}

void mousePressed() {
  explode = true; 
  showImage = false;
}

class Particle {
  double myX;
  double myY;
  int myColor;
  double mySpeed;
  double myAngle;
  int mySize;
  
  Particle() {
    myX = 200;
    myY = 200;
    myColor = color((int)(Math.random()*100)+120, (int)(Math.random()*50)+60, (int)(Math.random()*180)+90);
    mySpeed = (double)(Math.random()*20);
    myAngle = Math.random()*2*Math.PI; 
    mySize = 10;
  }
  
  void move() {
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed);
  }
  
  void show() {
    fill(myColor);
    noStroke();
    ellipse((float)myX,(float)myY,mySize,mySize);
  } 
}

class OddballParticle extends Particle {
  OddballParticle() {
    myX = 150;
    myY = 200;
    myColor = color((int)(Math.random()*250), (int)(Math.random()*180), (int)(Math.random()*230));
    mySpeed = (double)(Math.random()*10);
    myAngle = Math.random()*2*Math.PI; 
    mySize = (int)Math.random()*20;
  }
  
  void show() {
    fill(myColor);
    noStroke();
    rect((float)myX, (float)myY, 15,10);
  }
}
