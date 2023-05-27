final int GRID_SIZE = 40;

int [][] GRID = new int[GRID_SIZE][GRID_SIZE];

void setup() {
  frameRate(10);
  size(800, 800);
  
  for (int x = 0; x < GRID_SIZE; x++) {
    for (int y = 0; y < GRID_SIZE; y++) {
      GRID [x][y] = int(random(0, 2));
    }
  }
}

void draw() {
  display();  
  update();  
}

void display() {

  for (int x = 0; x < GRID_SIZE; x++) {
    for (int y = 0; y < GRID_SIZE; y++) {
      if (GRID [x][y] == 1) {
        fill(1);
        rect(x*20, y*20, 20, 20);
      }
      if (GRID [x][y] == 0) {
        fill(255, 255, 255);
        rect(x*20, y*20, 20, 20);
      }
    }
  }
}

void update() {
  int [][] newGrid = new int[GRID_SIZE][GRID_SIZE];

  for (int x = 0; x < GRID_SIZE; x++) {
    for (int y = 0; y < GRID_SIZE; y++) {
      int counter = neighbor_count(x, y);

      if (GRID [x][y] == 1) {


        if ( counter == 0) {
          newGrid [x][y] = 0;
        }
        if ( counter == 1) {
          newGrid [x][y] = 0;
        }
        if ( counter == 2) {
          newGrid [x][y] = 1;
        }
        if ( counter == 3) {
          newGrid [x][y] = 1;
        }
        if ( counter == 4) {
          newGrid [x][y] = 0;
        }
        if ( counter == 5) {
          newGrid [x][y] = 0;
        }
        if ( counter == 6) {
          newGrid [x][y] = 0;
        }
      }
      if (GRID [x][y] == 0) {
        if ( counter == 3) {
          newGrid [x][y] = 1;
        }
      }
    }
  }
  GRID = newGrid;
}

int neighbor_count(int x, int y) {
  int counter = 0;

  if (x > 0 && x < GRID_SIZE-2 && y > 0 && y < GRID_SIZE-2) {
    for (int i = -1; i < 2; i++) {  // i - x offset
      for (int j = -1; j < 2; j++) { // j - y offset

        if (!(i == 0 && j == 0)) {
          counter = counter + GRID[x+i][y+j];
        }
      }
    }
  }
  return(counter);
}

void mousePressed() {
  GRID [mouseX/20][mouseY/20] = 1;
}
