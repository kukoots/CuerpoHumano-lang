import processing.sound.*;

class Area{
  int x;
  int y;
  int ancho;
  int alto;
  Area(int x, int y, int ancho, int alto) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
  }
}

class Clickeable {
  Area area;
  boolean hover() {
     if (mouseX > area.x && mouseX < (area.x + area.ancho) && mouseY > area.y && mouseY < (area.y + area.alto))
       return true;
     return false;
   }
}
  
class Parte extends Clickeable{
   String nombre;
   SoundFile pronunciacion;
   Parte (String nombre, SoundFile voc, Area area) {
     this.nombre = nombre;
     this.area = area;
     
     pronunciacion = voc;
   }
  
}
