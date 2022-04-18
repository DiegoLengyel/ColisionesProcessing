class Bola {  
  float x, y;
  float diametro;
  float vx = 0;
  float vy = 0;
  float r, g, b;
  int id;
  Bola[] esferas;
 
  Bola(float xin, float yin, float din, int idin, Bola[] ein) {
    x = xin;
    y = yin;
    diametro = din;
    id = idin;
    esferas = ein;
  }
  
  //Bola(float r1, float g1, float b1){
    //r = r1;
    //g = g1;
    //b = b1;
  //}
  
  void colision() {
    for (int i = id + 1; i < numBolas; i++) {
      float dx = esferas[i].x - x;
      float dy = esferas[i].y - y;
      float distancia = sqrt(dx*dx + dy*dy);
      float minDist = esferas[i].diametro/2 + diametro/2;
      if (distancia < minDist) { 
        float angulo = atan2(dy, dx);
        float targetX = x + cos(angulo) * minDist;
        float targetY = y + sin(angulo) * minDist;
        float ax = (targetX - esferas[i].x) * elastico;
        float ay = (targetY - esferas[i].y) * elastico;
        vx -= ax;
        vy -= ay;
        esferas[i].vx += ax;
        esferas[i].vy += ay;
      }
    }   
  }
  
  void movimiento() {
    x += vx;
    y += vy;
    if (x + diametro/2 > width) {
      x = width - diametro/2;
      vx = vx * friccion; 
    }
    else if (x - diametro/2 < 0) {
      x = diametro/2;
      vx = vx * friccion;
    }
    if (y + diametro/2 > height) {
      y = height - diametro/2;
      vy = vy * friccion; 
    } 
    else if (y - diametro/2 < 0) {
      y = diametro/2;
      vy = vy * friccion;
    }
  }
  
  void dibujar() {
    //for(int i = 0; i < numColores; i++){
    //fill(r,g,b);
    //}
    ellipse(x, y, diametro, diametro);
  }
}
