int modeSwitch = 0;
String [] lines1;
int lineCount;
FloatDict sales;
FloatDict days;

int ROW_HEIGHT = 48;
int HALF_ROW_HEIGHT = 200;


void setup() {
  size(600, 800);
}

void draw() {
  background(255);
  processFiles();
  sales = new FloatDict();
  days = new FloatDict();

  for (int i = 1; i < lineCount; i++) {
    String[] dataParts = split(lines1[i], TAB);
    String game = dataParts[0];
    float salesData = parseFloat(dataParts[1]);
    float daysData = parseFloat(dataParts[2]);

    sales.add(game, salesData);
    days.add(game, daysData);
  }
  sales.sortValues();
  days.sortValues();

  for (int a = 0; a < sales.size (); a++) {
    for (int b = 0; b < days.size (); b++) {
      if (sales.keyArray()[a].equals(days.keyArray()[b])) {
        smooth();
        fill(0);
        textSize(15);
        textAlign(CENTER);
        text("Sales of Games", width/2, height/2 - 350);
        text("vs", width/2, height/2 - 330);
        text("Days from Console Launch Date", width/2, height/2 - 315);
        textSize(12);
        text("Sales (in Millions)", width/2 - 150, height/2 - 250);
        text("Days from Console Launch", width/2 + 150, height/2-250);
        fill(0);
        strokeWeight(5);
        stroke(0);
        line(width/2 - 125, height - 600, width/2 - 125, height-600 + sales.size()*44);
        line(width/2 + 125, height - 600, width/2 + 125, height-600 + sales.size()*44);

        if (sales.keyArray()[a].indexOf("Nintendo") > -1 || sales.keyArray()[a].indexOf("Gamecube") > -1 || sales.keyArray()[a].indexOf("Wii") > -1 || sales.keyArray()[a].indexOf("WiiU") > -1) {
          fill(255, 0, 0);
          stroke(255, 0, 0);
        } else if (sales.keyArray()[a].indexOf("Playstation") > -1) {
          fill(0, 0, 255);
          stroke(0, 0, 255);
        } else if (sales.keyArray()[a].indexOf("Xbox") > -1) {
          fill(0, 255, 0);
          stroke(0, 255, 0);
        }
        float salesY = a*ROW_HEIGHT + HALF_ROW_HEIGHT;
        float daysY = b*ROW_HEIGHT + HALF_ROW_HEIGHT;
        textAlign(RIGHT);
        textSize(8);
        text(sales.keyArray()[a], width/2 - 130, salesY-12);
        text(sales.valueArray()[a], width/2 - 130, salesY);
        textAlign(LEFT);
        text(days.valueArray()[b], width/2 + 130, daysY);
        strokeWeight(2);
        line(width/2-125, salesY, width/2+125, daysY);

        if (modeSwitch == 0) {
          textAlign(CENTER);
          textSize(15);
          fill(255,0,0);
          text("Nintendo 64, 9/29/1996", width/2, height/2 + 300);
          fill(0,0,255);
          text("Playstation 1, 9/9/1995 ", width/2, height/2 + 320);
        } else if (modeSwitch == 1) {
          textAlign(CENTER);
          textSize(15);
          fill(255,0,0);
          text("Gamecube, 11/18/2001", width/2, height/2 + 350);
          fill(0,0,255);
          text("Playstation 2, 10/26/2000", width/2, height/2 + 370);
          fill(0,255,0);
          text("Original Xbox, 11/15/2001", width/2, height/2 + 390);
        } else if (modeSwitch == 2) {
          textAlign(CENTER);
          textSize(15);
          fill(255,0,0);
          text("Wii, 11/19/2006", width/2, height/2 + 350);
          fill(0, 0, 255);
          text("Playstation 3, 11/17/2006", width/2, height/2 + 370);
          fill(0,255,0);
          text("Xbox 360, 11/22/2005", width/2, height/2 + 390);
        } else if (modeSwitch == 3) {
          textAlign(CENTER);
          textSize(15);
          fill(255,0,0);
          text("WiiU, 11/18/2012", width/2, height/2 + 350);
          fill(0,0,255);
          text("Playstation 4, 11/15/2013", width/2, height/2 + 370);
          fill(0,255,0);
          text("Xbox One, 11/22/2013", width/2, height/2 + 390);
        }
      }
    }
  }
}

void keyPressed() {
  if (modeSwitch < 3) {
    if (key == ']' || key == '}') {
      modeSwitch++;
    }
  }
  if (modeSwitch > 0) {
    if (key == '[' || key == '{') {
      modeSwitch--;
    }
  }
}

void processFiles() {
  if (modeSwitch == 0) {
    lines1 = loadStrings("g1Data.txt");
    lineCount = lines1.length;
  } else if (modeSwitch == 1) {
    lines1 = loadStrings("g2Data.txt");
    lineCount = lines1.length;
  } else if (modeSwitch == 2) {
    lines1 = loadStrings("g3Data.txt");
    lineCount = lines1.length;
  } else if (modeSwitch == 3) {
    lines1 = loadStrings("g4Data.txt");
    lineCount = lines1.length;
  }
}
