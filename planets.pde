import gifAnimation.*;
float ang, ang1, ang2, ang3, ang4, ang5, angS, cepeX, cepeY,cepeZ;
PShape sol, planet1, planet2, planet3, planet4, planet5,entorno;
PShape alien;

PImage fondo;
PImage sol_text;
PImage cepe_text;
PImage planet1_text, planet2_text, planet3_text, planet4_text, planet5_text;

boolean mode = false;
void setup ( )
{
  size (999, 999, P3D) ;
  noStroke();
  
  // I ni ci a l i z a
  fondo = loadImage("universo.jpg");
  sol_text = loadImage("sol.jpg");
  cepe_text = loadImage("cepe.png");
  planet1_text = loadImage("planet1.jpg");
  planet2_text = loadImage("planet2.png");
  planet3_text = loadImage("planet3.jpg");
  planet4_text = loadImage("planet4.jpg");
  planet5_text = loadImage("planet5.jpg");

  sol = createShape(SPHERE, 100); 
  planet1 = createShape(SPHERE, 5);
  planet2 = createShape(SPHERE, 10);
  planet3 = createShape(SPHERE, 15);
  planet4 = createShape(SPHERE, 10);
  planet5 = createShape(SPHERE, 25);
  entorno = createShape(BOX, 6000);

  sol.setTexture(sol_text);
  planet1.setTexture(planet1_text);
  planet2.setTexture(planet2_text);
  planet3.setTexture(planet3_text);
  planet4.setTexture(planet4_text);
  planet5.setTexture(planet5_text);
  entorno.setTexture(fondo);
  ang=0;
  ang1 = 0;
  ang2 = 0;
  ang3 = 0;
  ang4 = 0;
  ang5 = 0;
  cepeX = 0;
  cepeY = 0;
  cepeZ = 0;
  alien = createShape(SPHERE, 25);
  alien.setTexture(cepe_text);
}
void draw ( )
{

 
  
  pushMatrix();
    translate(-1000, -1000, -500);
  
  
    shape(entorno);
  popMatrix();
  if(mode){
    
    camera(cepeX,cepeY-20,cepeZ+200,cepeX,cepeY,cepeZ + 100,0,1,0);
    globalView();
    
  }else{
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0),width/2,height/2,0,0,1,0);
    
    globalView();
  }
  if(keyPressed){
    if (key == 'w' || key == 'W') {
      cepeY = cepeY - 5;
    } else if (key == 's' || key == 'S') {
      cepeY = cepeY + 5;
    } else if (key == 'd' || key == 'D') {
      cepeX = cepeX + 5;
    } else if (key == 'A' || key == 'a') {
      cepeX = cepeX - 5;
    }
   }

  
  
  
  
  
}

void mouseWheel(MouseEvent event) {
  cepeZ = cepeZ + event.getCount() * 5;
}

void keyPressed() {
  
  
  if (key == 't' || key == 'T') {
    if(mode){
      mode = false;
    }else{
      mode = true;
    }
  }
  
 
   
    
  
    
  
}




void globalView(){
 
  pushMatrix();
  translate(cepeX, cepeY, cepeZ);
  
  
  shape(alien);
  popMatrix();
  
  // SOL

  
 
  
  pushMatrix ( ) ;
  translate ( width /2, height /2, 0 ) ;
  
  rotateX ( radians (-45) ) ;
  // SOL
  pushMatrix ( ) ;
  rotateY ( radians ( ang ) ) ;
  
  
  shape(sol) ;
  
  popMatrix ( ) 
  ;
  
  
  // Resetea t r a s gi ro completo
  ang=ang + 0.25;
  if ( ang>360)
    ang=0;

  // Planeta 1
  pushMatrix ( ) ;
  rotateY ( radians ( ang1 ) ) ;
  translate (-width *0.15, 0, 0 ) ;
  shape(planet1) ;
  popMatrix ( ) ;
  // Resetea t r a s gi ro completo
  ang1=ang1 + 2;
  if ( ang1>360)
    ang1=0;

  // Planeta 2
  pushMatrix ( ) ;
  rotateY ( radians ( ang2 ) ) ;
  translate (-width *0.23, 0, 0 ) ;
  shape(planet2) ;
  popMatrix ( ) ;
  // Resetea t r a s gi ro completo
  ang2=ang2 + 1.25;
  if ( ang2>360)
    ang2=0;

  // Planeta 3
  pushMatrix ( ) ;
  rotateY ( radians ( ang3 ) ) ;
  translate (-width *0.32, 0, 0 ) ;
  shape(planet3) ;
  popMatrix ( ) ;
  // Resetea t r a s gi ro completo
  ang3=ang3 + 0.99;
  if ( ang3>360)
    ang3=0;

  // Planeta 4
  pushMatrix ( ) ;
  rotateY ( radians ( ang4 ) ) ;
  translate (-width *0.38, 0, 0 ) ;
  shape(planet4) ;


  popMatrix ( ) ;
  // Resetea t r a s gi ro completo
  ang4=ang4 + 0.79;
  if ( ang4>360)
    ang4=0;

  // Planeta 5
  pushMatrix ( ) ;
  rotateY ( radians ( ang5 ) ) ;
  translate (-width *0.45, 0, 0 ) ;
  shape(planet5) ;

  pushMatrix() ; 
  rotateZ(radians(angS)) ; 
  translate(40, 0, 0) ;
  fill(255, 0, 0) ; 
  sphere(10); 
  popMatrix() ;

  angS=angS+5; 
  if (angS>360) angS=0;

  popMatrix ( ) ;
  // Resetea t r a s gi ro completo
  ang5=ang5 + 0.25;
  if ( ang5>360)
    ang5=0;

  popMatrix ( ) ;
  textSize(20);
  text ("Pulse las teclas w, s, d, a y la rueda del raton \npara mover a cepeda.\nPulse t para cambiar de modo\n", 20, 25) ; 
  
}
void mousePressed() {
}
