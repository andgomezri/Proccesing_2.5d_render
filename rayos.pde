float rot = 0;
int det = 0;



void setup(){
  size(500,800);
  background(255);
  
  fill(0);
}

float posx = 0;
float posy = 250;
float r=0;


void draw(){
  background(128);
  posy=mouseY;
  r+=0.05;
  
  pushMatrix();
  fill(0);

  translate(width/2, height/2+200);
    rotate(r);
  /*for(int i=0; i<10; i++){
    rect(0, 0, 100, 10);
    translate(i*50, i*20);
    rotate(i*0.5);
  }
    */
  rectMode(CENTER);
 // rect(0,0,50,150);
 // rect(0,0,150,50);
  ellipseMode(CENTER);
/*
  ellipse(-50,200*cos(r),20,20);
  ellipse(200*sin(r),50,20,20);
  ellipse(50,-200*cos(r),20,20);
  ellipse(-200*sin(r),-50,20,20);
*/

  ellipse(-50,200*sin(r),20,20);
  ellipse(200*cos(r),50,20,20);
  ellipse(50,-200*sin(r),20,20);
  ellipse(-200*cos(r),-50,20,20);
  
  popMatrix();
  
  
  for(posx=0; posx<width; posx++){
  
  fill(255,0,0);

  PVector centro = new PVector(posx, posy);
  PVector rayo = new PVector(posx, posy+1);
  rayo.sub(centro);
  rayo.normalize();
  rayo.rotate(map(posx, 0, 500, 0.9, -0.9));  
  rayo.mult(10);
  

  det=1;
  int col=0;
  
while (det<600){
  rayo.normalize();
  rayo.mult(det);
  det++;
  if (red(get((int)(rayo.x+posx+3), (int)(rayo.y+posy+3)))==0){col=det; det=600;}
}

  stroke(255,0,0);
  line(0, posy,width, posy);
  line(posx, posy, rayo.x+posx, rayo.y+posy); //linea de escaneo
  stroke(map(col, 25, 600, 200, 50));
  //line(map(rot, 0, 2*PI, 0, width), map(col, 0, 255, 0, 50), map(rot, 0, 2*PI, 0, width), 100-map(col, 0, 255, 0, 50));
  line(posx, map(col, 0, 600, 20, 50), posx, 100-map(col, 0, 600, 20, 50));
  noStroke();
  
  
  }
  
  rot+=0.01; //rotación de vector
  if (rot>PI*2) rot=0;
  
  //translación de vector
  
  



}