/**
 * ALGORAVE PRINT LAYOUT
 * @author  dan hett (hellodanhett@gmail.com)
 * @date    October 2015
 * A simple Processing sketch to create a print-ready piece
 * from a set of generated algorave screengrabs.
 */

// off-screen image render, as this piece is bigger than my screen
PGraphics print;

// print dimensions (currently set to A3 at 300DPI)
int canvasWidth = 3508;
int canvasHeight = 4961;

// margin around the outside of the page
int bleed = 100;

// gap in between images
int gap = 10;

// required rows and columns (8x19 = 152 total images)
int cols = 8;
int rows = 19;

// our dimensions per thumbnail (worked out when we start)
float imageWidth;
float imageHeight;

// path to the images, and an offset to start from
String path = "../../print grabs/session1/";
int offset = 1;

void setup()
{ 
  print = createGraphics(canvasWidth, canvasHeight);
  
  startCapturing();
  
  imageWidth = (canvasWidth - (bleed * 2) - (gap * cols)) / cols;
  imageHeight = (imageWidth / 16) * 9;
  
  int index = 1;
  
  for(int i = 0; i < rows; i++)
  {
    for(int j = 0; j < cols; j++)
    {
      PImage image = loadImage(path + (offset + index) + ".png");
      print.image(image, 
                  bleed + (gap * j) + (imageWidth * j), 
                  bleed + (gap * i) + (imageHeight * i), 
                  imageWidth, 
                  imageHeight); 
                  
      index++;
    }   
  }
  
  stopCapturing();
}

void startCapturing()
{
  println("starting");
  print.beginDraw();
  print.background(255);
}

void stopCapturing()
{
  println("finished!");
  print.endDraw();
  print.save("output.png");
}