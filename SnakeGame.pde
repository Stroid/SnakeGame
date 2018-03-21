//Snake

final float scl = 20;
color bgColor = color(0);

int rows, cols;
int headX, headY;

int moveState; // 0 = up (0, -1); 1 = left (-1, 0) ; 2= down (0, 1); 3 = right (1,0) 

ArrayList<Character> keys = new ArrayList();
void setup() {
  size(600, 600);

  rows = height / (int)scl;
  cols = width  / (int)scl;

  headX = rows / 2;
  headY = cols / 2;
}

void draw() {
  background(bgColor);

  rect(headX * scl, headY * scl, scl, scl);
}

void keyHandler() {
  if (lastkey('w'))      moveState = 0;
  else if (lastkey('a')) moveState = 1;
  else if (lastkey('d')) moveState = 2;
  else if (lastkey('s')) moveState = 3;
}

Character laskey(){
  return keys.get(keys.size() -1);
}
void keyPressed() {
  if (!keys.contains(key)) {
    keys.add(key);
    println(keys);
  }
}

void keyReleased() {
  if (keys.contains(key)) {
    keys.remove((Character) key);
    println(keys);
  }
}