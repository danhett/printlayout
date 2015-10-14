/**
 * ALGORAVE LAYOUT
 * @author  dan hett (hellodanhett@gmail.com)
 * @date    October 2015
 * A simple Processing sketch to create a print-ready piece
 * from a set of generated algorave screengrabs.
 */

PGraphics print;

void setup()
{
  print = createGraphics(3508, 4961);
  print.beginDraw();
  print.line(20, 1800, 1800, 900);
  print.endDraw();
  print.save("output.png");
}
