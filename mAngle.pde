//12.04.2013 tested and seems to work

// Need G4P library
import guicomponents.*;


float turning = 0;
float pi = 3.141592653589793238462;

String[] kml_output; //holds the output strings for the kml file
String[] UAV_output; //holds the strings for the drone waypoint file


void setup() {
  size(480, 360);
  createGUI();
  customGUI();
  //smooth();
  // Place your setup code here
}

void draw() {
  background(172);
  fill(0);
  rect(245, 5, 230, 350);

  turning += 0.5;

  float nook_number = int(field_wp.getText());  //number of points per hemicircle
  int start_angle = int(field_a.getText());     //the angle from ground where the hemicircle begins
  int circle_number = int(field_n.getText());   //number of hemicircles
  float rad = float(field_r.getText()); //get the radius of the hemicircle in m
  int wp_number = int(nook_number) * circle_number;

  //preparing the kml output string
  


  //from here starts the drawing of the visualization on the right
  line(260, 120, 460, 120);
  for (int num = 0; num < circle_number; num++) {
    bow(nook_number, start_angle, turning+(180.0/circle_number)*num, 360, 120);
  }

  ellipse(360, 245, 200, 200);
  for (int num = 0; num < circle_number; num++) {
    top_view_line(nook_number, start_angle, turning+(180.0/circle_number)*num, 360, 245);
  }

  north(turning+(int(field_b.getText())), 360, 245);
}

// Use this method to add additional statements
// to customise the GUI controls
void customGUI() {
  field_lat.setFont("T", 15);
  field_long.setFont("T", 15);
  field_r.setFont("T", 15);
  field_a.setFont("T", 15);
  field_wp.setFont("T", 15);
  field_n.setFont("T", 15);
  field_b.setFont("T", 15);
  textfield_file.setFont("T", 15);
}



void bow(float nooks, float starting_angle, float rotation_angle, int pos_x, int pos_y) {
  stroke(255);
  rotation_angle = rotation_angle/180*pi;
  float bow_width = 100;
  float steps = (180-2*starting_angle)/(nooks-1);
  for (float i = starting_angle; i<180-starting_angle-1;i = i+steps) {
    line(cos(rotation_angle)*cos(i/180.0*pi)*bow_width+pos_x, (-sin(i/180.0*pi))*bow_width+pos_y, cos(rotation_angle)*cos((i+steps)/180.0*pi)*bow_width+pos_x, (-sin((i+steps)/180.0*pi))*bow_width+pos_y);
  }
}

void top_view_line(float nooks, float starting_angle, float rotation_angle, int pos_x, int pos_y) {

  rotation_angle = rotation_angle/180*pi;
  float steps = (180-2*starting_angle)/(nooks-1);

  for (float i = -90+starting_angle; i<90-starting_angle+steps-1;i=i+steps) {
    point(sin(rotation_angle)*100*sin(i/180.0*pi)+pos_x, cos(rotation_angle)*100*sin(i/180.0*pi)+pos_y);
  }
}

void north(float rotation_angle, int pos_x, int pos_y) {

  rotation_angle = rotation_angle/180*pi;


  for (float i = 0; i<95;i++) {
    point(sin(rotation_angle)*105*sin(i/180.0*pi)+pos_x, cos(rotation_angle)*105*sin(i/180.0*pi)+pos_y);
  }
}


String zeit_file() { //provides an date_time timestamp

  String stamp = str(year());

  if (month() < 10) { 
    stamp =stamp+ "0"+str(month());
  }
  else {
    stamp = stamp +  str(month());
  }

  if (day() < 10) { 
    stamp =stamp+ "0"+str(day());
  }
  else {
    stamp = stamp +  str(day());
  }

  stamp = stamp + "_";

  if (hour() < 10) { 
    stamp =stamp+ "0"+str(hour());
  }
  else {
    stamp = stamp + str(hour());
  }

  if (minute() < 10) { 
    stamp = stamp + "0"+str(minute());
  }
  else {
    stamp = stamp + str(minute());
  }  

  if (second() < 10) { 
    stamp = stamp + "0"+str(second());
  }
  else {
    stamp = stamp + str(second());
  }

  return stamp;
}


float[] newkoord(float latitude, float longitude, float distance, float angle) {
  
  float earthoutline = 40074000;
  float earthradius = (earthoutline /(2* pi));
   
  float      dx = cos(angle)*distance; // #Berechnung der X Strecke abhaengig vom Winkel 
  float      dy = sin(angle)*distance; // #Berechnung der Y Stecke abhaengig vom Winkel
  float      latx = (earthoutline / 360) * latitude; //  #distance from equator [m]
  float      longy = 2 * pi * earthradius * ((cos(((latitude)/180)*pi))/360)*longitude; // #distance from greenwitch [m]
  float      n_latx = latx + dx;
  float      n_longy = longy + dy;
  float      nLat = n_latx / (earthoutline/360);
  float      nLong = n_longy / (2 * pi * earthradius * ((cos(((latitude)/180)*pi))/360));
 
 float[]  koord_out = {nLong,  nLat}; 




  
  return koord_out;
}

