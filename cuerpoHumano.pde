import processing.sound.*;

PImage cuerpo ;

ArrayList<Parte> partes; 

String parteActual = "";
final color cVerde      = #005505;
final color cVerdeClaro = #1EA227;

void setup () {
  size (374,600);
  cuerpo = loadImage ("cuerpo-humano.jpg");
  partes = new ArrayList<Parte>();
  partes.add( new Parte("Kupäjk",       new SoundFile(this, "voc/cabeza.wav" ),    new Area( 136,0  , 160,180)));
  partes.add( new Parte("Anäjy kë'ë",   new SoundFile(this, "voc/brazo_izq.wav" ), new Area( 0  ,230, 160,115)));
  partes.add( new Parte("Akää'ny kë'ë", new SoundFile(this, "voc/brazo_der.wav" ), new Area( 267,229, 100,196)));
  partes.add( new Parte("Maats",        new SoundFile(this, "voc/torso.wav" ),     new Area( 161,181, 106,163)));
  // Pie Izquierdo
  partes.add( new Parte("Anäjy teky",   new SoundFile(this, "voc/pie.wav" ),       new Area( 0  ,425, 160,175)));
  // Pie Derecho
  partes.add( new Parte("Akää'ny teky", new SoundFile(this, "voc/pie.wav" ),       new Area( 206,425, 158,175)));  
  
}

void draw () {
  background(0);
  
  image(cuerpo, 0,0);
  // Texto que describe la parte del cuerpo humano seleccionada
  textSize(20);
  fill (cVerde);
  text(parteActual,20,40);
  
  testHover() ;

}  

// Desde el draw, en base a las medidas indicadas de la parte del cuerpo
// dibuja un rectángulo para resaltar la parte apuntada 
void testHover() {
  for (int i=0; i <partes.size(); i++) {
    Parte parte = partes.get(i);
    if (parte.hover()) {
      strokeWeight(5);
      stroke(cVerdeClaro);
      noFill();
      rect (parte.area.x, parte.area.y, parte.area.ancho, parte.area.alto);
      break;
    } 
  }
}


void mousePressed() {
  
  for (int i=0; i < partes.size(); i++) {
    final Parte parte = partes.get(i);
    if (parte.hover()) {
      parteActual = parte.nombre;
      if ((parte.pronunciacion != null) ){
        try {
            parte.pronunciacion.play();
        }
        catch (Exception ex) {
          println ("No se pudo reproducir el audio");
          ex.printStackTrace();
        }
      }
      return;
    }
    
  }
  parteActual = "Seleccione..."; //<>// //<>//
  
}
