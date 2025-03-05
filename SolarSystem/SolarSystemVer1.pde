Planet mercury, venus, earth, mars, jupiter, saturn, uranus, neptune;
float scaleFactor = 1.0; // 拡大・縮小用の変数
float centerX, centerY;

void setup()
{
  size(2000,1000);
  centerX = width / 2;
  centerY = height / 2;
  
  // v,d,c,n,r
  mercury = new Planet(0.2408, 0.39, color(169, 169, 169), "Mercury", 0.383);
  venus = new Planet(0.6152, 0.723, color(255,255,0), "Venus", 0.949);
  earth = new Planet(1.0, 1.0, color(0,255,0), "Earth", 1.000);  // 基準
  mars = new Planet(1.8808, 1.524, color(255,0,0), "Mars", 0.533);
  jupiter = new Planet(11.862, 5.204, color(139, 69, 19), "Jupiter", 11.21);
  saturn = new Planet(29.457, 9.582, color(255, 223, 128), "Saturn", 9.45);
  uranus = new Planet(84.0205, 19.201, color(173, 216, 230), "Uranus", 4.01);
  neptune = new Planet(164.8, 30.047, color(0, 0, 255), "Neptune", 3.88);
}

void draw()
{
  background(0);
  
  translate(centerX, centerY); // 中心を基準に変換
  scale(scaleFactor); // スケール適用
  translate(-centerX, -centerY); // もとに戻す
  
  fill(255,0,0);
  ellipse(width/2, height/2, 10, 10);
  textAlign(CENTER);
  text("sun", width/2, height/2 - 17);
  
  mercury.update();
  venus.update();
  earth.update();
  mars.update();
  jupiter.update();
  saturn.update();
  uranus.update();
  neptune.update();
}

// マウスホイールで拡大縮小
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  scaleFactor *= (1 - e * 0.05);
  scaleFactor = constrain(scaleFactor, 0.1, 5); // ズーム範囲制限
}

class Planet
{
  float velocity, distance, theta, radius;
  color clr;
  String name;
  
  Planet(float period, float d, color c, String n, float r)
  {
    velocity = TWO_PI / period * 0.01;  
    distance = d * 100;  
    theta = 0;
    clr = c;
    name = n;
    radius = r * 10;
  }

  void update()
  {
    theta += velocity;  
    
    float x = distance * cos(theta) + width / 2;
    float y = distance * sin(theta) + height / 2;
    
    fill(clr);
    ellipse(x, y, radius, radius);
    textAlign(CENTER);
    fill(255,255,255);
    text(name, x, y - 17);
  }
}
