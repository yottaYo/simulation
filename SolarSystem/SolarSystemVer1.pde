Planet mercury, venus, earth, mars, jupiter, saturn, uranus, neptune;

void setup()
{
  size(2000,1000);
  mercury = new Planet(1.88,0.3,color(169, 169, 169),"mercury");
  venus = new Planet(1.38,0.723,color(255,255,0),"venus");
  earth = new Planet(1,1,color(0,255,0),"earth");
  mars = new Planet(0.81,1.524,color(255,0,0),"mars");
  jupiter = new Planet(0.44,5.24,color(139, 69, 19),"jupiter");
  saturn = new Planet(0.33,9.582,color(255, 223, 128),"saturn");
  uranus = new Planet(0.23,19.201,color(173, 216, 230),"uranus");
  neptune = new Planet(0.18,30.047,color(0, 0, 255),"neptune");
}

void draw()
{
  background(0);
  fill(255,0,0);
  ellipse(width/2,height/2,15,15);
  textAlign(CENTER);
  text("sun",width/2,height/2-17);
  mercury.update();
  venus.update();
  earth.update();
  mars.update();
  jupiter.update();
  saturn.update();
  uranus.update();
  neptune.update();
}

class Planet
{
  float velocity,distance,theta;
  color clr;
  String name;
  
  Planet(float v,float d,color c,String n)
  {
    velocity = v/30;
    distance = d*30;
    theta = 0;
    clr = c;
    name = n;
  }

  void update()
  {
    theta += velocity;
    
    float x = distance * cos(theta) + width / 2;
    float y = distance * sin(theta)+ height / 2;
    
    fill(clr);
    ellipse(x,y,10,10);
    textAlign(CENTER);
    text(name,x,y-17);
  }
  
}
