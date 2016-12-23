// Moving Lines 
// by Wei Wei Chi (Oct 3th 2016) 

class BouncingBall { // Creating a template for Bouncing ball (Setting Class)

  float x; // declare x
  float y; // declare y
  float d; // declare d
  float xspeed = 5; // Speed of x movement
  float yspeed = 5; // Speed of y movement
  float xdirection = 0.0; // Movement direction on x axis
  float ydirection = 0.0; // Movement direction on y axis
  int id; //identification of the circle
  BouncingBall[] others; // identification of other circles 


  BouncingBall(float tempX, float tempY, float tempD, int tempId, BouncingBall [] tempB) {
    x = tempX; // Substituting tempX with real x value
    y = tempY; // Substituting tempY with real y value
    d = tempD; // Substituting tempD with real d value
    id = tempId; // Substituting tempId with real id value
    others = tempB; // Substituting tempB with others value
    // keep trying a new random number until we get somethign that is not == 0
    while (xdirection == 0) {
      xdirection = random(-1, 1);
    }
    while (ydirection == 0) {
      ydirection = random(-1, 1);
    }
  }

  void lines() { // setting up lines
    for (int i = id+1; i < numBalls; i++) { 
      float dx = others[i].x - x; 
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy); // distance between two circles from center
      float sw = map(distance, 0, 1700, 0, 8); // mapping the distance with strokeWeight
      strokeWeight(8 - sw);
      stroke(255); 
      line(x, y, others[i].x, others[i].y); //making line between one circle and another
      println(sw);
    }
  }

  void move() { // setting up motion
    x = x + (xspeed * xdirection);
    y = y + (yspeed * ydirection);
    if (x > width-d || x < d) { // Making sure x coordinate fit in the box
      xdirection *= -1; // Changing x direction
    }
    if (y > height-d || y < d) { // Making sure y coordinate fit in the box
      ydirection *= -1; // Changing y direction
    }
  }

  void display() { // setting up circle for display
    noStroke();
    fill(255);
    ellipse(x, y, d, d);
  }
}