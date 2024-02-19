# Pong Online Game

Adding dynamic elements to traditional games is a common way to increase player engagement and introduce new challenges into familiar games. This report presents an analysis of PONG game using using Processing, a programming language tailored for visual arts and design. The game embodies the classic PONG concept, entailing two players manoeuvring paddles to deflect a ball across the screen. The report evaluates the implemented features, the fundamental operational dynamics of PONG, and proposes potential improvements to enrich the gaming experience. 




## Game Overview
The implemented PONG game consists of two paddles, one for each player, represented by rectangles on opposite sides of the screen. It mimics a basic online game of ping-pong or table tennis. Like a tennis court or table tennis table, the game is played on a two-dimensional rectangular court that is divided by a dotted line. Two players operate paddles, sometimes referred to as bats that are placed on opposing sides of the screen in the game Pong. The ball is a small, square-shaped item that oscillates between the two paddles. In order to score points by getting the ball to pass your opponent's paddle, you must use the paddles to strike the ball back and forth in an effort to stop it from reaching your side of the screen.

Using basic controls like buttons or arrow keys, players can manipulate the movement of their paddles along the screen's edge in a vertical or horizontal direction. The player can intercept the ball and alter its direction by moving the paddles in connection with their input. The ball changes direction as a result of bouncing off the paddles themselves, the top and bottom edges of the screen, and both. The ball's speed may rise as the game goes on, making it harder for players to respond and keep control. Usually played in rounds, pong is a game where players gain points every time the ball crosses their opponent's paddle and lands on their side of the screen.

Until one person reaches a predefined score or until a certain number of rounds are finished, the game goes on. The winner of the game is the person who finishes with the highest score.



## Screenshots

[Screenshot] (https://drive.google.com/file/d/1GgM62ptqpIKdQIJ7plgbMUw33coZuBFY/view?usp=drive_link)


## Features
1. Two player mode
In this game, two players compete against each other.

2. Fast Ball Movement
The dynamic actions of the ball are central to the game. The velocity of the ball will gradually increase if it remains within the boundaries of the game table, causing players who score to return to its original velocity. 

3. Collision Detection
The ball moves across the screen, with its velocity adjusted upon collision with various game elements. A robust collision detection mechanism ensures accurate interactions between the ball, player paddles, and moving obstacles, maintaining fidelity to the laws of physics within the game environment

4. Paddles/ Bat Control
Players control their paddles using designated keys. These controls facilitate both vertical and horizontal movement, allowing players to strategically position their paddles to intercept the ball. Boundary constraints confine paddle movement within the game screen boundaries, ensuring adherence to established gameplay parameters. Players can control their paddles using designated keys ('w' and’s’ for Player 1, 'o' and 'k' for Player 2).

5. Integration of Moving Obstacles
Moving obstacles are seamlessly integrated into the game environment, introducing an element of unpredictability and strategic complexity. Each obstacle possesses unique movement parameters, including velocity and direction, contributing to varied gameplay scenarios and challenges. The collision resolution algorithm accounts for interactions between the ball and moving obstacles, resulting in dynamic alterations to the ball's trajectory upon impact.

6. Power up feature
The game also features power-ups, which are added at random during gameplay and give players instant advantages when they collide with the ball. Increased paddle size, quicker ball speed, and momentary invincibility are some of the power-ups used. When the player collides with a power-up, the associated effect is applied to them for a predetermined amount of time.

7. Score Tracking
Real-time score tracking provides players with continuous updates on their individual scores, fostering a sense of competition and progress.  The game keeps track of each player's score and displays it on the screen.

8. Rounds system
The game concludes upon the completion of a predetermined number of rounds, with the winner determined based on the cumulative score. In the event of a tie, the game acknowledges parity through a drawn outcome.


## Game Controls
Players control their paddles using designated keys:

	Player 1 (Left Paddle):
-	Vertical Movement: 'w' (up) and 's' (down) keys
-	Horizontal Movement: 'i' (left) and 'l' (right) keys
  
	Player 2 (Right Paddle):
- 	Vertical Movement: 'o' (up) and 'k' (down) keys
- 	Horizontal Movement: 'a' (left) and 'd' (right) keys



## Lessons Learned

While the integration of moving obstacles adds depth to the Pong game experience, there are several areas that could be further improved to enhance game play. One potential improvement could involve introducing different types of obstacles with unique behaviors and effects, such as obstacles that temporarily invert controls, slow down the ball, or create temporary barriers. Additionally, implementing power-ups that spawn randomly on the screen and grant temporary advantages to players could add excitement and unpredictability to the game. Furthermore, enhancing the visual and audio effects, introducing an AI opponent for single-player mode, and implementing online multiplayer functionality could further enrich the gameplay experience and broaden the game's appeal.
