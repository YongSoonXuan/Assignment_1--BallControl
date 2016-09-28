Eye leftEye;
Eye rightEye;
float eyeOffset = 220;
 
void setup ()
{
  size (800, 400);
  smooth();
  background(255);
  Point p1 = new Point (width/4, height/2);
  Point p2 = new Point (width/4+eyeOffset, height/2);
  leftEye = new Eye(p1, 200, color(50,200,250));
  rightEye = new Eye(p2, 200, color(50,200,250));
}
 
void draw()
{
  background(255);
  leftEye.drawEye();
  rightEye.drawEye();
  
}
 
 
 
class Eye
{
 
  private Point loc;
  private float eyeSize;
  private color c;
   
  
  Eye (Point locPoint, float sizeValue, color cValue)
  {
    loc = locPoint;
    eyeSize = sizeValue;
    c = cValue;
  }
   
 
  void setLoc (Point p)
  {
    loc = p;
  }
   
  Point getLoc ()
  {
    return loc;
  }
  void setEyeSize (float sizeValue)
  {
    eyeSize = sizeValue;
  }
   
  float getEyeSize ()
  {
    return eyeSize;
  } 
  void setColor (color eyeColor)
  {
    c = eyeColor;
  }
   
  color getColor ()
  {
    return c;
  }
   
  void drawEye()
  {
    pushMatrix();
    fill(250);
    stroke(0);
    translate (loc.x, loc.y); 
    ellipse (0, 0, eyeSize, eyeSize); 
 
    fill (c);  // set eye color
    if (dist(loc.x,loc.y,mouseX,mouseY) < eyeSize/4)
    {
      ellipse (mouseX-loc.x,mouseY-loc.y, eyeSize/2, eyeSize/2);
      fill (0);
      ellipse (mouseX-loc.x,mouseY-loc.y,eyeSize/5,eyeSize/5);
    }
    else
    {
     
      rotate(atan2(mouseY-loc.y,mouseX-loc.x));  
      ellipse (eyeSize/4.2, 0, eyeSize/2, eyeSize/2);  
      fill (0);
      ellipse (eyeSize/4.2, 0, eyeSize/5, eyeSize/5); 
    }
    popMatrix(); 
  } 
}
 
class Point
{
  private float x;
  private float y;
   
  Point (float xValue, float yValue)
  {
    x = xValue;
    y = yValue;
  }
   
  void setPoint (float xValue, float yValue)
  {
    x = xValue;
    y = yValue;
  }
   
  float getX ()
  {
    return x;
  }
   
  float getY()
  {
    return y;
  }
}
