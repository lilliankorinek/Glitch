import processing.video.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.sound.*; 

Minim minim;
AudioPlayer player;

Movie m;
Movie sad;
 

void setup() {
 // size(640, 360);
  fullScreen();
  m = new Movie(this, "finalPowerStation.mov");
  m.loop();
  
  minim = new Minim(this); 
  player = minim.loadFile("glitch.mp3");
  
}

void draw() {
image(m, 0, 0, width, height);


}
  

void keyPressed() {
  player.play();
  m.read();


  m.loadPixels();

  for (int y = 0; y < m.height; y += 10) {
    for (int x = 0; x < m.width; x += 10) {
      //how do we create a mirror image?
      int i = x + y * m.width;

      color c = m.pixels[i];
      
      float newX = map(x, 0, m.width, 0, width);
      float newY = map(y, 0, m.height, 0, height);

      fill(c);
      noStroke();
      rect(newX, newY, 20, 20);

      //ellipse(x, y, 20, 20);
    }
  }
  


  //image(cam, 0, 0);


  }
  


// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
 

}


void keyReleased(){
  player.pause();
}
