int in_count = 0;
int out_count = 0;
int count = 0;
float pi = 0;

void setup()
{
  size(400,400);
  background(255);
  ellipse(width/2,height/2,width,height);
}
void draw()
{
  float x = random(width);
  float y = random(height);
  
  float d = dist(x,y,width/2,height/2);
  
  if(d<=width/2)
  {
    stroke(255,0,0);
    in_count++;
  }else
  {
    stroke(0);
    out_count++;
  }
  
  point(x,y);
  count = in_count+out_count;
  pi = 4.0 * in_count / count;
  
  if(count % 100==0)
  {
    println("n="+count);
    println("pi="+pi);
  }

  if(count == 1000000)
  {
    println("ブッフバック終了します");
    exit();
  }
}
