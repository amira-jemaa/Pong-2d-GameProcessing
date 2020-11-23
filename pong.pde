PFont fonte32;
int score1,score2;
Puck puck;
Paddle left;
Paddle right;
boolean gameOver;
void setup() { 
     size (1000,500);
     background (38,50,56);
     fonte32 = createFont("joystix.ttf", 32);
     textAlign(LEFT,CENTER);
     textFont(fonte32);
     frameRate(50);
     right= new Paddle(false);
     left= new Paddle (true);
     puck= new Puck();
     }
void draw() {
     background (38,50,56);
  //texts parametring
     fill(255);
     textSize(22);
     text ("Hello pong!",width/2-100, height/9-6, CENTER);  
     textSize(100);
     text(score1,width/2-150, height/3, CENTER);
     text(score2,width/2+90, height/3, CENTER); 
     textSize (20);
     text("Press space bar to Exit",10,height-15);
     puck.checkPaddleRight(right);
     puck.checkPaddleLeft(left);
     
     left.show();
     right.show();
     left.update();
     right.update();
     puck.update();
     puck.show();
     puck.edges();
     fill(255); 
     control();
    
}

void keyReleased(){
     left.move(0);
     right.move(0);

}
void keyPressed(){
     if (key =='a'){
       left.move(-10);
     }
     else if (key=='z'){
        left.move(10);
     
     }
      if (key =='j'){
       right.move(-10);
     }
     else if (key=='m'){
        right.move(10);
     
     } }

 void control(){
   if (key ==' ') {
      exit();
     } }
 
 

     
     
     
