int numBolas = 20;
int numColores = 4;
float elastico = 0.05;
float friccion = -0.9;
//Bola[] colores = new Bola[numColores];
//color[] colores = new color[numColores];
Bola[] bolas = new Bola[numBolas];

void setup() {
  size(640, 360);
  for (int i = 0; i < numBolas; i++) {
    bolas[i] = new Bola(random(width), random(height), random(20, 85), i, bolas);
    //colores[i] = color(random(100, 255), random(100, 255), random(100, 255));
  }
  //for(int i = 0; i < numColores; i++){
    //colores[i] = new Bola(random(100,255), random(100, 255), random(100,255));
  //}
  fill(255,100,0);
  stroke(255);
  strokeWeight(1);
  //for(int i = 0; i < numBolas; i++){
   // cRandom[i] = color(random(100, 255), random(100, 255), random(100, 255));
 // }
}

void draw() {
  background(0);
  for (Bola obj : bolas) {
    obj.colision();
    obj.movimiento();
    obj.dibujar(); 
    //saveFrame("frame-#####.png");
  }
}
