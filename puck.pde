class Puck {
      float x=width/2;
      float y=height/2;
      float xspeed= 5;
      float yspeed=1;
      float r=12;
  Puck() {
    reset();
    resetgame();
  }
 void checkPaddleLeft(Paddle p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x - r < p.x + p.w/2) {
      if (x > p.x) {
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xspeed = 5 * cos(angle);
        yspeed = 5 * sin(angle);
        x = p.x + p.w/2 + r;
        //xspeed *= -1;
      }
    }
  }
  void checkPaddleRight(Paddle p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x + r > p.x - p.w/2) {
      if (x < p.x) {
        //xspeed *= -1;
        float diff = y - (p.y - p.h/2);
        float angle = map(diff, 0, p.h, radians(225), radians(135));
        xspeed = 5 * cos(angle);
        yspeed = 5 * sin(angle);
        x = p.x - p.w/2 - r;
      }
    }
  }
 
 

    
   
  void update(){
    x=x+xspeed;
    y=y+yspeed;
  }
  void reset (){
      x=width/2;
      y=height/2;
  }
  void edges(){
       if (y<0|| y>height){
        yspeed*=-1;
        }
       
        if (x>width) {
          score1++;
          reset();
        } 
        if (x<0) {
          score2++;
          reset();
        } 
        else if ( score1>=10) {
           background(38,50,56);
           pushStyle();
           textAlign(CENTER, CENTER);
           textFont(fonte32);
           fill(255);
          text("GOOD GAME PLAYER NUMBER 1 YOU WON!!!", width/2, height/2);
          textFont(fonte32);
          text(" Press R key to restart", width/2, height/2 + 30);
          popStyle();
          if ((key=='R')||(key=='r')) {
         resetgame();
       } }
        else if ( score2>=10) {
           background(38,50,56);
           pushStyle();
           textAlign(CENTER, CENTER);
           textFont(fonte32);
           fill(255);
          text("GOOD GAME PLAYER NUMBER 2 YOU WON!!!", width/2, height/2);
          textFont(fonte32);
          text(" Press R key to restart", width/2, height/2 + 30);
          popStyle();
          if ((key=='R')||(key=='r')) {
         resetgame();
       }
       
        
        } }

 void resetgame() {
      score1=0;
      score2=0;
 }       
 void show(){
    fill(255,0,0);
    rect(x,y,r*2,r*2);
 }


}
