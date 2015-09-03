/**
 * Regular Polygon
 * 
 * What is your favorite? Pentagon? Hexagon? Heptagon? 
 * No? What about the icosagon? The polygon() function 
 * created for this example is capable of drawing any 
 * regular polygon. Try placing different numbers into the 
 * polygon() function calls within draw() to explore. 
 */

void setup() {
  size(800, 600);
}

void draw() {
  background(102);

  int buildingWidth = 200;
  int buildingLength = 200;


  drawBuilding(buildingWidth, buildingLength, (width/2) - buildingWidth/2, (height/2) - buildingLength/2 ); 


  float cornerX = ((width/2)-buildingWidth/2);
  float cornerY = ((height/2)-buildingLength/2);
  
  pushMatrix();
  
  drawCamera(cornerX, cornerY, 100, 45);
  popMatrix();
  //drawCamera2(200, 100, 100, 45);
}

void drawBuilding(int length, int width, float x, float y) {

  color c = color(200);
  fill(c);

  beginShape();
  vertex(x, y);
  vertex(x+width, y);
  vertex(x+width, y+length);
  vertex(x, y+length);
  endShape(CLOSE);
}


void drawCamera(float x, float y, float range, float fov) {

  color c = color(200, 100, 100);
  fill(c);

  float theta = radians(fov / 2) ;

  float x1 = -1 * tan(theta) * range ;
  float y1 = range;

  float x2 = tan(theta) * range;
  float y2 = range;

  pushMatrix();
  translate(x, y);
  rotate( frameCount / 200.0 );
  beginShape();
  vertex(0, 0);
  vertex(x1, y1);
  vertex(x2, y2);
  endShape(CLOSE );
  popMatrix();
}



void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}