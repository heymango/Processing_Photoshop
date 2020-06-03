import java.io.File;
PGraphics[] background = new PGraphics[10];
DraggingPic[] dragging = new DraggingPic[10];
Object[] layerarray = new Object[10];
int [][] filtermode = new int[10][1];
//1 threshold 2 gray 3 invert 4 posterize 5 blur 6 erode 7 dilate
int[]  layertype = new int[10];
int[] dragmodeb = {0,0,0,0,0,0,0,0,0,0};
  int[]  showlayer = {1,1,1,1,1,1,1,1,1,1};
  int[] posx = {0,0,0,0,0,0,0,0,0,0};
  int[] posy = {0,0,0,0,0,0,0,0,0,0};
int imgcount=1;
int currentimg=1;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage saveall;
PImage icon;
PImage layer;
PImage save2;
PImage brush;
PImage paint;
PImage circlebrush;
PImage nobrush;
PImage plus;
PImage minus;
PImage geometry;
PImage eraser;
PImage eraser2;
PImage draw;
PImage picture;
PImage view;
PImage pprivate;
PImage eraseall;
PImage layers;
PImage move;
PImage save;
PImage layerset;
PImage folder;
PImage bucket;
PImage success;
PImage bucket1;
PImage trans;
PImage imagefilter;
PImage blank;
ColorPicker cp;
int currentC;
int countdrawlayer=1;
int countlayer=1;
int currentlayer=1;
int brushmenuon=0;
int pickeron=0;
int brushmode=0;
int brushon=0;
int brushsize=5;
int erasemode=0;
int paintmode=0;
int editmode=0;
int tintmode=0;
float tscale;
int txpos=0;
float bscale;
int bxpos;
float pscale;
int pxpos;
PGraphics pg1;
PGraphics pg2;
PGraphics pg3;
PGraphics pg4;
PGraphics pg5;
PGraphics b1;
PGraphics b2;
PGraphics b3;
PGraphics b4;
PGraphics b5;
PGraphics b6;
PGraphics b7;
PGraphics b8;
PGraphics b9;
PGraphics b10;




void setup(){
 
  b1=createGraphics(800,800);
  b2=createGraphics(800,800);
  b3=createGraphics(800,800);
  b4=createGraphics(800,800);
  b5=createGraphics(800,800);
  b6=createGraphics(800,800);
  b7=createGraphics(800,800);
  b8=createGraphics(800,800);
  b9=createGraphics(800,800);
  b10=createGraphics(800,800);
  background[0]=b1;
  background[1]=b2;
  background[2]=b3;
  background[3]=b4;
  background[4]=b5;
  background[5]=b6;
  background[6]=b7;
  background[7]=b8;
  background[8]=b9;
  background[9]=b10;
  
  for(int i=0; i<10; i++){
   background[i].beginDraw();
  background[i].background(color(255,0));
  background[i].endDraw();
 
 }
  
  layertype[0]=0;
  background(40,40,40);
  size(1920,1080);
  icon = loadImage("icon.JPG");
  layer= loadImage("layer.JPG");
  brush=loadImage("brush.png");
  paint=loadImage("paint.png");
  circlebrush=loadImage("circlebrush.png");
  nobrush=loadImage("xbrush.png");
  plus=loadImage("plus.png");
  minus=loadImage("minus.png");
  geometry=loadImage("geometry.png");
  eraser=loadImage("eraser.png");
   eraser2=loadImage("eraser2.png");
   draw=loadImage("art.png");
  picture=loadImage("picture.png");
  pprivate=loadImage("private.png");
  view=loadImage("view.png");
  eraseall=loadImage("eraseall.png");
  folder=loadImage("folder.png");
  layers=loadImage("layers.png");
  layerset=loadImage("gears.png");
  move=loadImage("move.png");
  save=loadImage("save.png");
  bucket=loadImage("bucket.png");
  success=loadImage("success.png");
  trans=loadImage("trans.png");
  bucket1=loadImage("bucket1.png");
  imagefilter=loadImage("imagefilter.png");
  save2=loadImage("save2.png");
  //saveall=loadImage("blank.png");
  cp = new ColorPicker( 20, 600, 300, 300, 255 );
  img1=createGraphics(800,800);
  pg1=createGraphics(800,800,JAVA2D);
  pg1.beginDraw();
  pg1.smooth();
  pg1.endDraw();
  layerarray[0] = pg1;
  pg2=createGraphics(800,800,JAVA2D);
  pg2.beginDraw();
  pg2.smooth();
  pg2.endDraw();
  pg3=createGraphics(800,800,JAVA2D);
  pg3.beginDraw();
  pg3.smooth();
  pg3.endDraw();
  pg4=createGraphics(800,800,JAVA2D);
  pg4.beginDraw();
  pg4.smooth();
  pg4.endDraw();
  pg5=createGraphics(800,800,JAVA2D);
  pg5.beginDraw();
  pg5.smooth();
  pg5.endDraw();
 
}
  void draw(){
 //  println(currentlayer+" and "+countlayer+"and"+countdrawlayer);
   uidraw();
   if(brushon==0&&erasemode==0&&paintmode==0) cursor(ARROW);
 
    if(brushon==1){
     if (mousePressed==true) {
       if(mouseX>500&&mouseX<1300&&mouseY>150&&mouseY<950){
         drawlayer(currentlayer);
         
       }
     }
    }
    if(paintmode==1) cursor(bucket1);
    if(dragmodeb[currentlayer-1]==1) move();
    println(dragmodeb[currentlayer-1]);
   image(layer,500,150,800,800);
   fill(40,40,40);
   noStroke();
   rect(1300,150,100,900);
   rect(500,950,800,100);
   rect(500,80,900,70);
   noFill();
   for(int i=0; i<countlayer; i++){
    // println(i+" "+showlayer[i]+" "+countlayer);
     if(layerarray[i]!=null&&showlayer[i]==1){
       //image(background[i],500,150);
        if(tintmode==1) tint(currentC);
       if(layertype[i]==1) {
                // if(tintmode==1) tint(currentC);
         if(((PImage)layerarray[i]).width>800&&((PImage)layerarray[i]).height<800)image((PImage)layerarray[i],500+posx[i],150+posy[i],800,((PImage)layerarray[i]).height*800/((PImage)layerarray[i]).width);
         else if(((PImage)layerarray[i]).height>800&&((PImage)layerarray[i]).width<800)image((PImage)layerarray[i],500+posx[i],150+posy[i],((PImage)layerarray[i]).width*800/((PImage)layerarray[i]).height,800);
         else if(((PImage)layerarray[i]).height>800&&((PImage)layerarray[i]).width>800){
           
           if(((PImage)layerarray[i]).height>((PImage)layerarray[i]).width) image((PImage)layerarray[i],500+posx[i],150+posy[i],((PImage)layerarray[i]).width*800/((PImage)layerarray[i]).height,800);
            else image((PImage)layerarray[i],500+posx[i],150+posy[i],800,((PImage)layerarray[i]).height*800/((PImage)layerarray[i]).width);
         }
         else image((PImage)layerarray[i],500+posx[i],150+posy[i]);
       }
       else image((PImage)layerarray[i],500,150);
     }
     noTint();
     }
 
 
  }

void imageChosen( File f )
{
  if( f.exists() )
 {
    if(imgcount==1){
      img1 = loadImage( f.getAbsolutePath() ); 
      layertype[countlayer]=1;
      layerarray[countlayer++]=img1;
    }
    else if(imgcount==2){
      img2= loadImage( f.getAbsolutePath() );
      layertype[countlayer]=1;
     layerarray[countlayer++]=img2;
    }
    else if(imgcount==3){
      img3= loadImage( f.getAbsolutePath() );
      layertype[countlayer]=1;
       layerarray[countlayer++]=img3;
    }
    else if(imgcount==4){
      img4= loadImage( f.getAbsolutePath() );
      layertype[countlayer]=1;
       layerarray[countlayer++]=img4;
    }
    else if(imgcount==5) {
      img5= loadImage( f.getAbsolutePath() );
      layertype[countlayer]=1;
       layerarray[countlayer++]=img5;
    }
    imgcount++;
  }
}



void drawlayer(int currentlayer){
    if(layerarray[currentlayer-1] instanceof PGraphics) drawOnLayer((PGraphics)layerarray[currentlayer-1]);
}

void drawOnLayer(PGraphics pg){
        pg.beginDraw();
        if(brushmode==1){
        pg.stroke(currentC);
        pg.fill(255);
        pg.strokeWeight(brushsize);
        pg.line(mouseX-500, mouseY-150, pmouseX-500, pmouseY-150); 
        
      }
       else if(brushmode==2){
         pg.noStroke();
         pg.fill(currentC);
         pg.rect(mouseX-500,mouseY-150,brushsize,brushsize);
      } 
  pg.endDraw();
  }

void eraseFunction(PGraphics pg) {
  color c = color(0,0);
  pg.beginDraw();
  pg.loadPixels();
  for (int x=0; x<pg.width; x++) {
    for (int y=0; y<pg.height; y++ ) {
      float distance = dist(x,y,mouseX-500,mouseY-150);
      if (distance <= brushsize/2) {
        int loc = x + y*pg.width;
        pg.pixels[loc] = c;
      }
    }
  }
  pg.updatePixels();
  pg.endDraw();
}


void mouseReleased(){
  if(countlayer<10&&mouseX>1510&&mouseX<1550&&mouseY>855&&mouseY<895){ //lyaer b
    countlayer++;
    countdrawlayer++;
    newlayer();
  }
  //brush b
  if(mouseX>15&&mouseX<55&&mouseY>390&&mouseY<430){
    if(brushmenuon==0) brushmenuon=1;
    else if(brushmenuon==1) brushmenuon = 0;
  }
  
   if(mouseX>15&&mouseX<55&&mouseY>345&&mouseY<385){
    if(layertype[currentlayer-1]==0) clearGraphics((PGraphics)layerarray[currentlayer-1]);
    else layerarray[currentlayer-1]=null;
  }
  if(mouseX>190&&mouseX<260&&mouseY>0&&mouseY<50){
   if(editmode==0) editmode=1;
   else editmode=0;
    
  }
  
  if(mouseX>15&&mouseX<55&&mouseY>435&&mouseY<475){
    if(pickeron==0) pickeron=1;
    else if(pickeron==1) pickeron = 0;
  }
  if(mouseX>15&&mouseX<55&&mouseY>255&&mouseY<295){
    erasemode=0;
    brushon=0;
    //println("on");
    if(paintmode==0)paintmode=1;
    else paintmode=0;
     
     }
     if(editmode==1&&mouseX>190&&mouseX<300&&mouseY>58&&mouseY<108){  //1
        //println("hh");
         ((PImage)layerarray[currentlayer-1]).filter(THRESHOLD,tscale);
        
     }
     if(editmode==1&&mouseX>190&&mouseX<300&&mouseY>108&&mouseY<158){  //2
        ((PImage)layerarray[currentlayer-1]).filter(GRAY);
       
     }
     if(editmode==1&&mouseX>190&&mouseX<300&&mouseY>158&&mouseY<208){  //3
        ((PImage)layerarray[currentlayer-1]).filter(INVERT);
       
     }
     if(editmode==1&&mouseX>190&&mouseX<300&&mouseY>208&&mouseY<258){
        ((PImage)layerarray[currentlayer-1]).filter(POSTERIZE,pscale);
       
     }
     if(editmode==1&&mouseX>190&&mouseX<300&&mouseY>258&&mouseY<308){
        ((PImage)layerarray[currentlayer-1]).filter(BLUR,bscale);
       
     }
     if(editmode==1&&mouseX>190&&mouseX<300&&mouseY>308&&mouseY<358){
        ((PImage)layerarray[currentlayer-1]).filter(ERODE);
       
     }
     if(editmode==1&&mouseX>190&&mouseX<300&&mouseY>358&&mouseY<408){
       
        ((PImage)layerarray[currentlayer-1]).filter(DILATE);
     }
     if(editmode==1&&mouseX>190&&mouseX<300&&mouseY>408&&mouseY<458){
      
       if(tintmode==0)tintmode=1;
       else tintmode=0;
     }
     
     if(paintmode==1&&mouseX>500&&mouseX<1300&&mouseY>150&&mouseY<950){
    
      ((PGraphics)layerarray[currentlayer-1]).beginDraw();
        ((PGraphics)layerarray[currentlayer-1]).fill(currentC);
        ((PGraphics)layerarray[currentlayer-1]).rect(0,0,800,800);
        ((PGraphics)layerarray[currentlayer-1]).noFill();
       ((PGraphics)layerarray[currentlayer-1]).endDraw();
     }
     if(paintmode==1&&mouseX>65&&mouseX<155&&mouseY>255&&mouseY<295){
       
        ((PGraphics)layerarray[currentlayer-1]).beginDraw();
        ((PGraphics)layerarray[currentlayer-1]).background(color(255,0));
       ((PGraphics)layerarray[currentlayer-1]).endDraw();
     }
  if((brushmenuon==1)&&mouseX>70&&mouseX<100&&mouseY>395&&mouseY<425){
    brushon=1;
    brushmode=1;
    erasemode=0;
    cursor(brush);
  }
  if((brushmenuon==1)&&mouseX>70&&mouseX<100&&mouseY>430&&mouseY<460){
    brushon=1;
    brushmode=2;
    erasemode=0;
    cursor(brush);
  }
   if((brushon==1||erasemode==1)&&(mouseX<170&&mouseX>140&&mouseY<460&&mouseY>430)){
     brushon=0;
     erasemode=0;
     
   }
   if(mouseX>120&&mouseX<190&&mouseY>0&&mouseY<50){
     
      selectOutput("Select a file to write to:", "fileSelected");
   }
   if(mouseX>260&&mouseX<350&&mouseY>0&&mouseY<50){
     saveall = get(500,150,800,800);
    selectOutput("Select a file to write to:", "fileSelected2");
   }
   if(mouseX>105&&mouseX<135&&mouseY>395&&mouseY<425){
     brushsize=brushsize+3;
   }
    if((brushsize>=3)&&mouseX>105&&mouseX<135&&mouseY>430&&mouseY<460){
     brushsize-=3;
   }
   if(mouseX>140&&mouseX<170&&mouseY>395&&mouseY<425){
     brushon=0;
     erasemode=1;
     cursor(eraser2);
   }
   if(mouseX>50&&mouseX<120&&mouseY>0&&mouseY<50){
      openfile();
     
   }
   if(mouseX>1500&&mouseX<1800&&mouseY>330&&mouseY<380){
     currentlayer=1;
     
   }
    if(countlayer>=2&&mouseX>1500&&mouseX<1800&&mouseY>380&&mouseY<430){
     currentlayer=2;
   }
   if(countlayer>=3&&mouseX>1500&&mouseX<1800&&mouseY>430&&mouseY<480){
     currentlayer=3;
   }
   if(countlayer>=4&&mouseX>1500&&mouseX<1800&&mouseY>480&&mouseY<530){
     currentlayer=4;
   }
    if(countlayer>=5&&mouseX>1500&&mouseX<1800&&mouseY>530&&mouseY<580){
     currentlayer=5;
   }
   if(countlayer>=6&&mouseX>1500&&mouseX<1800&&mouseY>580&&mouseY<630){
     currentlayer=6;
   }
   if(countlayer>=7&&mouseX>1500&&mouseX<1800&&mouseY>630&&mouseY<680){
     currentlayer=7;
   }
   if(countlayer>=8&&mouseX>1500&&mouseX<1800&&mouseY>680&&mouseY<730){
     currentlayer=8;
   }
   if(countlayer>=9&&mouseX>1500&&mouseX<1800&&mouseY>730&&mouseY<780){
     currentlayer=9;
   }
   if(countlayer>=10&&mouseX>1500&&mouseX<1800&&mouseY>830&&mouseY<880){
     currentlayer=10;
   }
  if(mouseX>1850&&mouseX<1879&&mouseY>330+(currentlayer-1)*50+10&&mouseY<330+(currentlayer-1)*50+29){
         if((showlayer[currentlayer-1]==1))showlayer[currentlayer-1]=0;
         else showlayer[currentlayer-1]=1;
      }
      
   if(layertype[currentlayer-1]==1&&mouseX>15&&mouseX<55&&mouseY>300&&mouseY<345) {
     if(dragmodeb[currentlayer-1]==0){
          dragmodeb[currentlayer-1]=1;
          dragging[currentlayer-1] = new DraggingPic(0, 0, (PImage)layerarray[currentlayer-1]);
           
     }
     else if(dragmodeb[currentlayer-1]==1){
       dragmodeb[currentlayer-1]=2;
      dragging[currentlayer-1].x=0;
      dragging[currentlayer-1].y=0;
      dragging[currentlayer-1].sample=null;
       
     }
     else if(dragmodeb[currentlayer-1]==2){
       dragmodeb[currentlayer-1]=1;
       dragging[currentlayer-1].x=posx[currentlayer-1];
      dragging[currentlayer-1].y=posy[currentlayer-1];
      dragging[currentlayer-1].sample=(PImage)layerarray[currentlayer-1];
       
     }
     

   }
  
    if(dragmodeb[currentlayer-1]==1) dragging[currentlayer-1].draggingpicMouseReleased();

}
  void mouseDragged(){
      if(layertype[currentlayer-1]==0&&erasemode==1&&mouseX>500&&mouseX<1300&&mouseY>150&&mouseY<950){
        noFill(); 
       noStroke();
        ellipse(mouseX,mouseY,brushsize,brushsize);
        eraseFunction((PGraphics)layerarray[currentlayer-1]);
    
    
   }   
   if(editmode==1&&mouseX>310&&mouseX<400&&mouseY>64&&mouseY<84){
     
     tscale = norm(constrain(mouseX,310,400),310,400);
     txpos =constrain(mouseX,310,400)-310;
     
   }
    if(editmode==1&&mouseX>310&&mouseX<400&&mouseY>214&&mouseY<224){
     
     pscale = map(constrain(mouseX,310,400),310,400,2,225);
     pxpos =constrain(mouseX,310,400)-310;
     
   }
   if(editmode==1&&mouseX>310&&mouseX<400&&mouseY>264&&mouseY<284){
     
     bscale = map(constrain(mouseX,310,400),310,400,1,50);
     bxpos =constrain(mouseX,310,400)-310;
     
   }
  }
  void mousePressed() {
  if(dragmodeb[currentlayer-1]==1)dragging[currentlayer-1].draggingpicMousePressed();
 // dragmodeb[currentlayer-1]=2;
}

  void move(){
    dragging[currentlayer-1].display();
    dragging[currentlayer-1].mouseDragged();
  }
  
void openfile(){
  selectInput( "Select an image", "imageChosen" );
   
}
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    ((PImage)layerarray[currentlayer-1]).save(selection.getAbsolutePath());
  }
}
void fileSelected2(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    saveall.save(selection.getAbsolutePath());
  }
}


  
  

void newlayer(){
  if(countlayer<10) drawlayermenu(countlayer);
  if(countdrawlayer==2){
    layertype[countlayer-1]=0;
    layerarray[countlayer-1] = pg2;
  }
  if(countdrawlayer==3){
    layerarray[countlayer-1] = pg3;
    layertype[countlayer-1]=0;
  }
  if(countdrawlayer==4){
    layerarray[countlayer-1] = pg4;
    layertype[countlayer-1]=0;
  }
  if(countdrawlayer==5){
    layerarray[countlayer-1] = pg5;
    layertype[countlayer-1]=0;
  }
 
  
}


void drawlayermenu(int num){
  stroke(255);
  strokeWeight(0.3);
  for(int i=1; i<=num; i++){
    
    if(showlayer[i-1]==1){
      image(view,1850,330+(i-1)*50+10,29,29);
      
    }
    else image(pprivate,1850,330+(i-1)*50+10,29,29);
  line(1500,330+(i*50),1900,330+(i*50));
  if(layertype[i-1]==1)image(picture,1510,330+(i-1)*50+10,29,29);
  else image(draw,1510,330+(i-1)*50+10,29,29);
  }
 }

void clearGraphics(PGraphics pg){
   
    pg.beginDraw();
    pg.background(color(255, 0));  // transparent white
    pg.endDraw();
}


void uidraw(){
  noStroke();
  fill(40,40,40);
  rect(0,0,500,1080);
  fill(83,83,83);
  rect(10,80,50,400); //menubutten
  rect(0,0,1920,50);
  image(icon,5,5,40,40);
  
  noStroke();
  fill(40,40,40);
  rect(1300,100,620,980);
  fill(83,83,83);
  rect(1500,300,400,600);
  image(layerset,1505,305,18,18);
  stroke(255);
  strokeWeight(0.3);
  line(1500,330,1900,330);
  
  line(50,0,50,50);
  rect(50,0,70,50);   //upbox1
  image(folder,68,8,40,40);
  line(120,0,120,50);
  rect(120,0,70,50); //upbox2
  image(save,137,8,35,35);
  line(190,0,190,50);
  rect(190,0,70,50); //processingbox;
  image(imagefilter,205,5,45,45);
  image(save2,277,8,35,35);
  if(editmode==1){
    fill(83,83,83);
    noStroke();
    rect(190,58,110,400);
    rect(305,58,100,20); //e1 scale
    rect(305,208,100,20); //e2
    rect(305,258,100,20); //e3
    fill(255);
    rect(310,66,90,4);
    rect(310,216,90,4);
    rect(310,266,90,4);
    fill(50);
    ellipse(310+txpos,69,12,12);
    ellipse(310+pxpos,219,12,12);
    ellipse(310+bxpos,269,12,12);//drag
    noFill();
    stroke(50);
    
    rect(190,58,110,50);  //e1
    
    rect(190,108,110,50);  //2
    rect(190,158,110,50);  //3
    rect(190,208,110,50);  //4
    
    rect(190,258,110,50);  //5
    rect(190,308,110,50);  //6
    rect(190,358,110,50);  //7
    rect(190,408,110,50);  //8
    textSize(15);
    stroke(255);
    fill(255);
    textAlign(CENTER, CENTER);
    text("THRESHOLD",245,83);
    text("GRAY",245,133);
    text("INVERT",245,183);
    text("POSTERIZE",245,233);
    text("BLUR",245,283);
    text("ERODE",245,333);
    text("DILATE",245,383);
    text("TINT",245,433);
    noFill();
  }
  line(260,0,260,50);
  line(1500,850,1900,850);
  noStroke();
  //fill(255);
  rect(1510,855,40,40); 
  image(layers,1510,855,40,40);//new layer
  noFill();
 
  noStroke();
  fill(currentC);
  rect(15,435,40,40);  //currentcolor b
  noFill();
  stroke(255);
  strokeWeight(0.3);
  noStroke();
  rect(15,255,40,40); //paint
  image(bucket,15,255,40,40);
  if(paintmode==1){
    fill(83,83,83);
   rect(65,255,90,40); 
  // rect(67,253,84,34);
   image(trans,67,258,84,34);
    noFill();
    
  }
  noStroke();
  strokeWeight(3);
  if(dragmodeb[currentlayer-1]==1) stroke(36,254,225);
  rect(15,300,40,40);//drag
  noStroke();
  image(move,15,300,40,40);
  rect(15,345,40,40);//menubox3 eraseall
  image(eraseall,15,345,40,40);
  rect(15,390,40,40);
  image(paint,15,390,38,38);  //paint box
  drawlayermenu(countlayer);
  stroke(36,254,225);
  strokeWeight(3);
  rect(1500,330+(currentlayer-1)*50,400,50);
  noStroke();
  if(brushmenuon==1){
    fill(83,83,83);
    rect(65,390,115,75);
    strokeWeight(0.5);
    stroke(255);
    rect(70,395,30,30); //box1
    image(circlebrush,78,403,15,15);
    rect(105,395,30,30); //box3
    image(plus,108,397,25,25);
    rect(70,430,30,30); //box2
    image(geometry,73,435,25,25);
    rect(105,430,30,30); //box4
    image(minus,108,432,25,25);
    rect(140,395,30,30); //box5
    image(eraser,143,398,25,25);
    rect(140,430,30,30); //box6
    image(nobrush,145,435,20,20);
    noStroke();
     fill(150);
     rect(105,330,50,50);
     fill(0);
     ellipse(130,355,brushsize,brushsize);
     noFill();
     noStroke();
  }
  if(pickeron==1){
    
    rect(15,580,315,360);
     cp.render();
  }
  noStroke();
}






public class ColorPicker 
{
  int x, y, w, h, c;
  PImage cpImage;
  
  public ColorPicker ( int x, int y, int w, int h, int c )
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    
    cpImage = new PImage( w, h );
    
    init();
  }
  
  private void init ()
  {
    // draw color.
    int cw = w - 60;
    for( int i=0; i<cw; i++ ) 
    {
      float nColorPercent = i / (float)cw;
      float rad = (-360 * nColorPercent) * (PI / 180);
      int nR = (int)(cos(rad) * 127 + 128) << 16;
      int nG = (int)(cos(rad + 2 * PI / 3) * 127 + 128) << 8;
      int nB = (int)(Math.cos(rad + 4 * PI / 3) * 127 + 128);
      int nColor = nR | nG | nB;
      
      setGradient( i, 0, 1, h/2, 0xFFFFFF, nColor );
      setGradient( i, (h/2), 1, h/2, nColor, 0x000000 );
    }
    
    // draw black/white.
    drawRect( cw, 0, 30, h/2, 0xFFFFFF );
    drawRect( cw, h/2, 30, h/2, 0 );
    
    // draw grey scale.
    for( int j=0; j<h; j++ )
    {
      int g = 255 - (int)(j/(float)(h-1) * 255 );
      drawRect( w-30, j, 30, 1, color( g, g, g ) );
    }
  }

  private void setGradient(int x, int y, float w, float h, int c1, int c2 )
  {
    float deltaR = red(c2) - red(c1);
    float deltaG = green(c2) - green(c1);
    float deltaB = blue(c2) - blue(c1);

    for (int j = y; j<(y+h); j++)
    {
      c = color( red(c1)+(j-y)*(deltaR/h), green(c1)+(j-y)*(deltaG/h), blue(c1)+(j-y)*(deltaB/h) );
      cpImage.set( x, j, c );

    }
  }
  
  private void drawRect( int rx, int ry, int rw, int rh, int rc )
  {
    for(int i=rx; i<rx+rw; i++) 
    {
      for(int j=ry; j<ry+rh; j++) 
      {
        cpImage.set( i, j, rc );
      }
    }
  }
  
  public void render ()
  {
    image( cpImage, x, y );
    if( mousePressed &&
        mouseX >= x && 
        mouseX < x + w &&
        mouseY >= y &&
        mouseY < y + h )
    {
         c = get( mouseX, mouseY );
      
    }
    currentC=c;
    fill( c );
    rect( x, y+h+10, 25, 25 );
  }
}



 
 
 class DraggingPic {
 
  int x;
  int y;
  PImage sample = null;

  // controls whether we are dragging (holding the mouse)
  boolean hold; 
 
  // constructor
  DraggingPic(int posx, int posy, 
    PImage img)
  { 
    x=posx;
    y=posy;
    sample = img;
    //sample.resize(img.width, 0);
  }
 
  void display() {
    //sample.filter(100);
    //image(sample,x,y);
   // println(x,y,posx[currentlayer-1],posy[currentlayer-1]);
  }
 
  void draggingpicMousePressed() {
    if (mouseX>500+x&&
      mouseY>150+y&&
      mouseX-500<x+sample.width && 
      mouseY-150<y+sample.height) {
      hold=true;
    }
  }
 
  void draggingpicMouseReleased() {
    hold=false;
    
    //
  }
 
  void mouseDragged() 
  {
    if (hold) {
      x=mouseX; 
      y=mouseY;
      posx[currentlayer-1]=x-500;
      posy[currentlayer-1]=y-150;
    }
  }//method
  //
}
