PFont myFont;
float[] x = new float[2000];
PImage bg;
PImage BuN;
int sy;
float[] y = new float[2000];
float segLength = 5;
float bx;
float by;
int boxSize = 3;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0;
float foodX = random(635);
float foodY = random(95);
int score = 0;
boolean start1 = false;
boolean start2 = false;
color o = #FFC524;
color mouse;

String time = "0:30";
int t;
int interval = 30;

String time2 = "0:30";
int t2;
int interval2 = 30;

int sizezz = 10;
//int sizezz2 = 10;

void setup() {
  size(640, 360);
  bg = loadImage("Grass.jpg");
  BuN = loadImage("BuN?.jpeg");
  strokeWeight(9);
  stroke(255, 100);
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS);
}

void draw() {
  start1();
}

void start1() {
  noStroke();
  fill(0);
  rect(0, 0, width, height);
  fill(255);
  myFont = createFont("Hobo STD", 50);
  textFont(myFont);
  textSize(50);//"Ringbearer"
  textAlign(CENTER);
  text("Level 1 \n Click to continue", 320, 180);

  if (keyPressed == true || mousePressed == true) {
    start1 = true;
  }

  if (start1) {
    background(bg);

    fill(255);
    textAlign(CENTER);
    text(score, 580, 50);

    t = interval-int(millis()/1000);
    time = nf(t, 3);
    if (score >= 20 && t != 0) {
      noStroke();
      fill(0);
      rect(0, 0, width, height);
      fill(255);
      textSize(50);
      textAlign(CENTER);
      text("Level 2 \n Click to continue", 320, 180);
      t2 = interval-int(millis()/1000);
      time2 = nf(t2, 3);
      start2();
    } 
    if (score < 20 && t <= 0) {
      gameOver();
    }

    textSize(30);
    text(time, 590, 100);

    noStroke();
    fill(255, 0, 0);
    rect(foodX, foodY, 5, 5);

    strokeWeight(9);
    stroke(o);
    dragSegment(0, mouseX, mouseY);
    for (int i=0; i<sizezz; i++) {
      dragSegment(i+1, x[i], y[i]);
    }



    if (mouseX+2.5 >= foodX-2.5 && mouseX-2.5 <= foodX+2.5 && mouseY+2.5 >= foodY-2.5 && mouseY-2.5 <= foodY+2.5) {
      foodX = random(635);
      foodY = random(95);
      //segLength += 9000;
      sizezz += 10;
      score++;
    }
  }
}

void start2() {
  if (keyPressed == true || mousePressed == true) {
    start2 = true;
  }
  if (start2) {
    background(BuN);

    fill(255);
    myFont = createFont("Arial Bold", 50);
    textFont(myFont);
    textAlign(CENTER);
    text(""+score, 580, 50);

    noStroke();
    fill(255, 0, 0);
    rect(foodX, foodY, 5, 5);

    strokeWeight(9);
    stroke(o);
    dragSegment(0, mouseX, mouseY);
    for (int i=0; i<sizezz; i++) { //sizezz2
      dragSegment(i+1, x[i], y[i]);
    }



    if (mouseX+2.5 >= foodX-2.5 && mouseX-2.5 <= foodX+2.5 && mouseY+2.5 >= foodY-2.5 && mouseY-2.5 <= foodY+2.5) {
      foodX = random(635);
      foodY = random(95);
      //segLength += 9000;
      sizezz += 100;
      score++;
    }
  }
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void gameOver() {
  fill(0);
  rect(0, 0, 640, 360);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
}