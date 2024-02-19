// Set the width and height of the screen
int width = 800;
int height = 600;

// Declare variables for the ball and bats
Ball b1;
Bat s1, s2;

int player1Score = 0;
int player2Score = 0;
int rounds = 0;
int maxRounds = 10; // Maximum number of rounds per level
boolean gameOver = false; // Creating a boolean to track game over state

// Variables for power-ups
boolean powerUpActive = false;
int powerUpX;
int powerUpY;
int powerUpType; // 0: Increased paddle size, 1: Faster ball speed, 2: Temporary invincibility
int powerUpDuration = 500; // Duration of power-up effect in frames
int powerUpTimer = 0;

void settings() {
  size(width, height);
}

void setup() {
  // Create a new ball at the center of the screen
  b1 = new Ball(width / 2, height / 2, 20); // speedX and speedY
  
  // Create bats for player 1 and player 2
  s1 = new Bat(0, height / 2 - 50, 20, 100); // y position
  s2 = new Bat(width - 20, height / 2 - 50, 20, 100); // y position
  
  // Initialize power-up
  resetPowerUp();
}

void draw() {
  background(0);
  if (!gameOver) { // Check if the game is not over
    b1.move();
    checkPowerUpCollision();
  }
  // Bat1 Movement  
  s1.move();
  s2.move();
  s1.plot();
  s2.plot();
  
  // Draw a dotted line to separate the players' sides
  drawDottedLine();
  
  // Display the ball
  b1.draw();
  
  // Display player scores
  displayScores();
  
  // Check if 10 rounds have passed
  if (rounds >= maxRounds) {
    displayWinner(); // Display the winner
    gameOver = true; // Set game over state to true
  }
  
  // Display "Game Over" if the game is over
  if (gameOver) {
    displayGameOver(); // Display "Game Over" after 10 rounds 
  }
  
  // Display power-up if active
  if (powerUpActive) {
    drawPowerUp();
  }
  
  // Update power-up timer
  if (powerUpTimer > 0) {
    powerUpTimer--;
    if (powerUpTimer == 0) {
      resetPowerUp();
    }
  }
}

// Draw a dotted line to separate the players' sides
void drawDottedLine() {
  stroke(255); // Set stroke color to white
  strokeWeight(2); // Set stroke weight
  for (int i = 0; i < height; i += 10) {
    line(width / 2, i, width / 2, i + 5); // Draw the dotted line
  }
}

// Display player scores
void displayScores() {
  fill(255); // Set fill color to white
  textSize(32); // Set text size
  textAlign(CENTER, CENTER); // Set text alignment to center
  text("Player 1: " + player1Score, width / 4, 50); // Display player 1 score
  text("Player 2: " + player2Score, 3 * width / 4, 50); // Display player 2 score
}

// Display the winner of the game
void displayWinner() {
  String winner;
  if (player1Score > player2Score) {
    winner = "Player 1 wins!";
  } else if (player2Score > player1Score) {
    winner = "Player 2 wins!";
  } else {
    winner = "It's a draw!";
  }
  fill(255); // Set fill color to white
  textSize(48); // Set text size
  textAlign(CENTER, CENTER); // Set text alignment to center
  text(winner, width / 2, height / 2); // Display the winner
}

// Display "Game Over"
void displayGameOver() {
  fill(255); // Set fill color to white
  textSize(48); // Set text size
  textAlign(CENTER, CENTER); // Set text alignment to center
  text("Game Over", width / 2, height / 2 + 50); // Display "Game Over"
}

// Draw power-up
void drawPowerUp() {
  fill(255, 255, 0); // Set fill color to yellow
  noStroke(); // Remove stroke
  ellipse(powerUpX, powerUpY, 20, 20); // Draw power-up as a circle
}

// Check collision with power-up
void checkPowerUpCollision() {
  float distance = dist(b1.x, b1.y, powerUpX, powerUpY);
  if (distance < 20) {
    applyPowerUpEffect();
    resetPowerUp();
  }
}

// Apply power-up effect
void applyPowerUpEffect() {
  // Choose a random power-up type
  powerUpType = int(random(3));
  // Apply power-up effect based on type
  switch (powerUpType) {
    case 0: // Increased paddle size
      s1.h += 20;
      s2.h += 20;
      break;
    case 1: // Faster ball speed
      b1.dx *= 1.5;
      b1.dy *= 1.5;
      break;
    case 2: // Temporary invincibility
      powerUpTimer = powerUpDuration;
      break;
  }
}

// Reset power-up
void resetPowerUp() {
  powerUpActive = true;
  powerUpX = int(random(20, width - 20));
  powerUpY = int(random(20, height - 20));
}

void keyPressed() {
  if (key == 'w') {
    s1.dy = -5;
  } else if (key == 's') {
    s1.dy = 5;
  }
  
  if (key == 'o') {
    s2.dy = -5;
  } else if (key == 'k') {
    s2.dy = 5; // Fixed to positive value
  }
  
  if (key == 'a') {
    s2.dx = -5;
  } else if (key == 'd') {
    s2.dx = 5;
  }
  
  if (key == 'i') {
    s1.dx = -5;
  } else if (key == 'l') {
    s1.dx = 5;
  }
}

void keyReleased() {
  if (key == 'w' || key == 's') {
    s1.dy = 0;
  }

  if (key == 'o' || key == 'k') {
    s2.dy = 0;
  }
  
  if (key == 'a' || key == 'd') {
    s2.dx = 0;
  }
  
  if (key == 'i' || key == 'l') {
    s1.dx = 0;
  }
}

// Class for the Ball
class Ball {
  float x; // x-coordinate of the ball
  float y; // y-coordinate of the ball
  float dx; // Speed of movement in the x-direction for the ball
  float dy; // Speed of movement in the y-direction for the ball
  float d; // Dimensions of the ball

  // Constructor
  Ball(float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.d = d; 
    this.dx = 5; // speed of ball horizontally 
    this.dy = 5; // speed of ball vertically
  }

  // Method to update the position of the ball
  void move() {
    x = x + dx;
    y = y + dy;

    // Ball collision with top/bottom of screen
    if (y <= 0 || y >= height - d) {
      dy = -dy;
    }

    // Ball collision with bats
    if ((x + d / 2 >= s2.x && x + d / 2 <= s2.x + s2.w && y >= s2.y && y <= s2.y + s2.h) || 
        (x - d / 2 <= s1.x + s1.w && x - d / 2 >= s1.x && y >= s1.y && y <= s1.y + s1.h)) {
      dx = -dx;
    }

    // Ball out of bounds
    if (x < 0) {
      player2Score++; // Player 2 scores
      resetBall();
      rounds++; // Increment round count
    } else if (x > width) {
      player1Score++; // Player 1 scores
      resetBall();
      rounds++; // Increment round count
    }
    
    // Increase ball speed if it stays within the borders
    if (x > 0 && x < width && y > 0 && y < height) {
      dx *= 1.001; // Increase speed in the x-direction
      dy *= 1.001; // Increase speed in the y-direction
    }
  }
  
  // Reset the ball position and speed
  void resetBall() {
    x = width / 2;
    y = height / 2;
    dx = 5;
    dy = 5;
  }

  // Method to draw the ball
  void draw() {
    fill(255, 255, 255); // Set fill color to white
    ellipse(x, y, d, d);
  }
}

// Class for the Bat
class Bat {
  float x;
  float y;
  float dx;
  float dy;
  float w;
  float h;

  // Constructor
  Bat(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.dx = 0; // Initialize bat movement speed in the x-direction
    this.dy = 0; // Initialize bat movement speed in the y-direction
  }

  // Method to update the position of the bat
  void move() {
    x = x + dx;
    y = y + dy;
    
    // Ensure the bat stays within the boundaries of the screen
    if (x < 0) {
      x = 0;
    }
    if (x > width - w) {
      x = width - w;
    }
    if (y < 0) {
      y = 0;
    }
    if (y > height - h) {
      y = height - h;
    }
  }

  // Method to draw the bat
  void plot() {
    fill(255, 255, 255); // Set fill color to white 
    rect(x, y, w, h); // Draw the bat
  }
}


// Class for the Obstacle
class Obstacle {
  float x;
  float y;
  float dx;
  float dy;
  float w;
  float h;

  // Constructor
  Obstacle(float x, float y, float w, float h, float dx, float dy) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.dx = dx; // Horizontal speed of obstacle
    this.dy = dy; // Vertical speed of obstacle
  }

  // Method to move the obstacle
  void move() {
    x += dx;
    y += dy;
    
    // If obstacle goes out of screen, reset its position
    if (x > width) {
      x = -w; // Reset to the left side of the screen
    }
    if (x + w < 0) {
      x = width; // Reset to the right side of the screen
    }
    if (y > height) {
      y = -h; // Reset to the top of the screen
    }
    if (y + h < 0) {
      y = height; // Reset to the bottom of the screen
    }
  }

  // Method to draw the obstacle
  void draw() {
    fill(255, 0, 0); // Set fill color to red
    rect(x, y, w, h); // Draw the obstacle
  }
}
