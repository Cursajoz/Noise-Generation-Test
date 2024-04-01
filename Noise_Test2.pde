int squareSize = 1;
int res = 1;
void setup(){
  size(800, 600);
}
void draw(){
  noStroke();
  noiseDetail(10, 0.65);
  GenerateMap();
}
void GenerateMap(){
  for(float x = 0; x < width/squareSize; x++){
    for(float y = 0; y < height/squareSize; y++){
      //fill(noise(x / res, y / res) * 255);
      fill(SetColour(x, y));
      rect(x * squareSize, y * squareSize, squareSize, squareSize);
    }
  }
}
void mousePressed(){
 noiseSeed((long)random(0, 1000)); 
}
void mouseWheel(MouseEvent event){
  int wheelCount = event.getCount();
  res -= (wheelCount);
  if(res < 1){
    res = 1;
  }
  //squareSize -=(wheelCount);
}

color SetColour(float x, float y){
  float noiseValue = noise(x / res, y / res);
  if(noiseValue < 0.2){
   return color(0, 255, 0); 
  }else if(noiseValue < 0.4){
    return color(0, 75, 0);
  }else if(noiseValue < 0.5){
    return color(0, 90, 0);
  }else if(noiseValue < 0.6){
    return color(0, 155, 0);
  }else if(noiseValue < 0.69){
    return color(200, 200, 100);
  }else if(noiseValue < 0.7){
    return color(0, 0, 20);
  }else if(noiseValue < 0.8){
    return color(0, 25, 200);
  }else{
    return color(0, 0, 100);
  }
}
