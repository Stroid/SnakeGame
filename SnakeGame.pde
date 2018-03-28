//Snake
//A*
final float scl = 10;
color bgColor = color(0);

int fps = 10;

int rows, cols;
int headX, headY;
int foodX, foodY;
int bodyLenght = 3;

ArrayList<Integer> body = new ArrayList();

boolean kill = false;

int moveState; // 0 = up (0, -1); 1 = left (-1, 0) ; 2= down (0, 1); 3 = right (1,0) 

ArrayList<Character> keys = new ArrayList();
void setup() {
  size(600, 600);

  rows = height / (int)scl;
  cols = width  / (int)scl;

  headX = rows / 2;
  headY = cols / 2;

  foodX = (int)random(cols);
  foodY = (int)random(rows);
}

void draw() {
  frameRate(fps);
  background(bgColor);

  fill(255, 0, 0);
  rect(foodX * scl, foodY * scl, scl, scl);

  eat();

  keyHandler();
  move();
  showSnake();

  if (headX < 0 || headY < 0 || headY >= rows|| headX >= cols ) kill = true;

  if (kill) {
    reset();
  }
}

void showSnake() {
  fill(255);
  rect(headX * scl, headY * scl, scl, scl);

  updateBody();
}

void updateBody() {
  while (body.size() > bodyLenght * 2) {
    body.remove(0);
  }
  for (int i = body.size() - 1; i >= 0; i -= 2) {

    int bodyX = body.get(i - 1);
    int bodyY = body.get(i);

    if (headX == bodyX && headY == bodyY) {
      kill = true;
    } else {
      rect(bodyX * scl, bodyY * scl, scl, scl);
    }
  }
}

void eat() {

  if (foodX == headX && foodY == headY) {
    foodX = (int)random(cols);
    foodY = (int)random(rows);
    
    //fps++;
    //bodyLenght += 3;
  }
}

void reset() {
  kill = false;
  fps = 10;

  headX = rows / 2;
  headY = cols / 2;

  foodX = (int)random(cols);
  foodY = (int)random(rows);

  body.clear();
  bodyLenght = 3;
  moveState = 0;
}

void move() {
  body.add(headX);
  body.add(headY);
  if (moveState == 0) {
    headY -= 1;
  } else if (moveState == 1) {
    headX -= 1;
  } else if (moveState == 2) {
    headY += 1;
  } else if (moveState == 3) {
    headX += 1;
  }
}
void keyHandler() {
  if (keys.size() > 0) {
    if      (lastkey('w')) moveState = 0;
    else if (lastkey('a')) moveState = 1;
    else if (lastkey('s')) moveState = 2;
    else if (lastkey('d')) moveState = 3;
  }
}

boolean lastkey(char c) {
  return keys.get(keys.size() -1) == c;
}
void keyPressed() {
  if (!keys.contains(key)) {
    keys.add(key);
    //println(keys);
  }
}

void keyReleased() {
  if (keys.contains(key)) {
    keys.remove((Character) key);
    //println(keys);
  }
}