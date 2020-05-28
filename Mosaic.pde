PImage img;
PImage smaller;
PImage fake;
int scl = 8;//what size little images should be
int w, h;

void setup () {
  size(640, 640);

  img = loadImage("Bigimage.jpg");
  fake = loadImage("Littleimage.jpg");
  fake.resize(scl, scl);
  img.resize(640, 640);

  w = img.width/scl;
  h = img.height/scl;

  smaller = createImage(w, h, RGB);
  smaller.copy(img, 0, 0, img.width, img.height, 0, 0, w, h);
}

void draw () {
  smaller.loadPixels();
  //image (fake, 0, 0);

  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      int index = x + y * w;
      color c = smaller.pixels[index];
      image(fake, x*scl, y*scl, scl, scl);
      tint(c);
      //fill(c);               
      //rect(x*scl, y*scl, scl, scl);   
    }
  }
}
