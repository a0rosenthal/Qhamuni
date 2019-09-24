// Space to generate hexaglyphs


float scale = 20; //percent scale of glyphs
float r = 100; //distance from center of each hexaglyph to the next
int numGlyphs = 300; //Number of hexaglyphs
int border = 50; //space on edge of screen

//don't touch these
PImage triangle;
float glyphWidth = 167;
float glyphHeight = 220;
float centerx; 
float centery;
PImage[] glyphs;

void setup(){
  size(1200,1200);
  background(255);
  
  glyphSize(scale);
  
  float leftEdge = border + glyphHeight;
  float topEdge = border + glyphHeight;
  float rightEdge = width - leftEdge;
  centerx = leftEdge;
  centery = topEdge;
  
  boolean offset = true;
  //draw six glyphs around current x,y position
  for(int i = 0; i<numGlyphs; i++){
    drawGlyph(centerx,centery);
    centerx += r;
    if(centerx >= rightEdge){
      centerx = leftEdge;
      if(offset){
        centerx += r/2;
      }
      offset = !offset;
      centery += (sqrt(3)/2) * r;
    }
  }
  
}

void draw(){
}

//Draw glyph at position (x,y)
void drawGlyph(float x, float y){
  
  glyphs = new PImage[6];
  for(int i = 0; i < 6; i++){
    int gIndex = int(random(4,100));
    glyphs[i] = loadImage("glyphs/Artboard " + gIndex + ".png");
  }
  
  pushMatrix();
  translate(x, y);
  
  for(int i = 0; i < 6; i++){
    rotate(PI/3);
    image(glyphs[i],gx(0),gy(0),glyphWidth,glyphHeight);
  }
  
     //Hexagon lines
  //triangle = loadImage("glyphs/Artboard 0.png");
  //for(int i = 0; i < 6; i++){
  //  rotate(PI/3);
  //  image(triangle,gx(0),gy(0),glyphWidth,glyphHeight);
  //}
  
  popMatrix();
}

//Keyboard input
void keyPressed(){
  if (keyCode == ' '){
    setup();
  } 
}

//set Glyph dimensions based on scale variable
void glyphSize( float scale ) {
  scale = scale * .01;
  glyphWidth = 167 * scale;
  glyphHeight = 220 * scale;
}

float gx(float x){
  float newx = x - (glyphWidth/2);
  return newx;
}
float gy(float y){
  float newy = y - (glyphHeight);
  return newy;
}