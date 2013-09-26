/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

void textfield1_Enter1(GTextField textfield) { //_CODE_:field_lat:482487:
  println("field_lat - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:field_lat:482487:

void textfield2_Enter1(GTextField textfield) { //_CODE_:field_long:619268:
  println("field_long - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:field_long:619268:

void textfield1_Enter2(GTextField textfield) { //_CODE_:field_r:250151:
  println("textfield1 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:field_r:250151:

void slider1_Change1(GHorzSlider horzslider) { //_CODE_:slider1:706536:
  println("slider1 - GHorzSlider event occured " + System.currentTimeMillis()%10000000 );
  field_r.setText(str(slider1.getValue()));
} //_CODE_:slider1:706536:

void textfield1_Enter3(GTextField textfield) { //_CODE_:field_a:860907:
  println("textfield1 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:field_a:860907:

void textfield2_Enter2(GTextField textfield) { //_CODE_:field_wp:251796:
  println("textfield2 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:field_wp:251796:

void slider1_Change2(GHorzSlider horzslider) { //_CODE_:slider_2:741869:
  println("slider1 - GHorzSlider event occured " + System.currentTimeMillis()%10000000 );
  field_a.setText(str(slider_2.getValue()));
} //_CODE_:slider_2:741869:

void slider2_Change1(GHorzSlider horzslider) { //_CODE_:slider_3:537686:
  println("slider2 - GHorzSlider event occured " + System.currentTimeMillis()%10000000 );
  field_wp.setText(str(slider_3.getValue()));
} //_CODE_:slider_3:537686:

void textfield1_Enter4(GTextField textfield) { //_CODE_:field_n:464284:
  println("field_n - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:field_n:464284:

void slider1_Change3(GHorzSlider horzslider) { //_CODE_:slider_4:548689:
  println("slider1 - GHorzSlider event occured " + System.currentTimeMillis()%10000000 );
  field_n.setText(str(slider_4.getValue()));
} //_CODE_:slider_4:548689:

void textfield1_Enter5(GTextField textfield) { //_CODE_:field_b:457131:
  println("textfield1 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:field_b:457131:

void slider1_Change4(GHorzSlider horzslider) { //_CODE_:slider_5:670244:
  println("slider1 - GHorzSlider event occured " + System.currentTimeMillis()%10000000 );
  field_b.setText(str(slider_5.getValue()));
} //_CODE_:slider_5:670244:

void textfield1_Enter6(GTextField textfield) { //_CODE_:textfield_file:493456:
  println("textfield_file - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield_file:493456:

void button1_Click1(GButton button) { //_CODE_:save_kml:450625:
  println("save_kml - GButton event occured " + System.currentTimeMillis()%10000000 );


  float nook_number = int(field_wp.getText());  //number of points per hemicircle
  int start_angle = int(field_a.getText());     //the angle from ground where the hemicircle begins
  int circle_number = int(field_n.getText());   //number of hemicircles
  float rad = float(field_r.getText()); //get the radius of the hemicircle in m
  int angle_north = int(field_b.getText()); //get the angle towards the north
  int wp_number = int(nook_number) * circle_number;

  //preparing the kml output string
  kml_output = new String[28+wp_number];

  kml_output[0] = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
  kml_output[1] = " <kml xmlns=\"http://www.opengis.net/kml/2.2\"> ";
  kml_output[2] = "  <Document> ";
  kml_output[3] = "  <name>Paths</name> ";
  kml_output[4] = " <description>mAngle Path</description> ";
  kml_output[5] = "     <Style id=\"yellowLineGreenPoly\">";
  kml_output[6] = "     <LineStyle> ";
  kml_output[8] = "        <color>7f00ffff</color> ";
  kml_output[9] = "        <width>4</width> ";
  kml_output[10] = "      </LineStyle> ";
  kml_output[11] = "      <PolyStyle> ";
  kml_output[12] = "        <color>7f00ff00</color> ";
  kml_output[13] = "      </PolyStyle> ";
  kml_output[14] = "    </Style> ";
  kml_output[15] = "    <Placemark> ";
  kml_output[16] = "      <name>Absolute Extruded</name> ";
  kml_output[17] = "      <styleUrl>#yellowLineGreenPoly</styleUrl>";
  kml_output[18] = "      <LineString>  ";
  kml_output[19] = "        <extrude>0</extrude> ";
  kml_output[20] = "        <tessellate>1</tessellate> ";
  kml_output[21] = "       <altitudeMode>relativeToGround</altitudeMode>";
  kml_output[22] = "        <coordinates>";

  kml_output[23+wp_number] = "</coordinates> ";
  kml_output[24+wp_number] = "      </LineString> ";
  kml_output[25+wp_number] = "    </Placemark> ";
  kml_output[26+wp_number] = "  </Document> ";
  kml_output[27+wp_number] = "</kml>";


  //at an unknown point of the calculation lat and long is mixed up. Till the problem is found itÂ´s reversed here
  float centerLat = float(field_lat.getText());   //get the latitude of the center point
  float centerLong = float(field_long.getText()); //get the longitude of the center points
  int counter_kml = 23;



  float angle_steps = (180-2*start_angle)/(nook_number-1);  //setting the step width between each angle
  boolean dir_switch = false; //setts the direction of the horizontal hemicircle to optimize the flight time
  
  for (float i = start_angle; i<180-start_angle+angle_steps-1;i=i+angle_steps) {
    
   if(dir_switch){
    for (int n_bows = 0; n_bows < circle_number; n_bows++) {
      float[] newKoords = newkoord(centerLat, centerLong, cos((i)/180.0*pi)*rad, ((180.0/circle_number)*n_bows+angle_north)/180.0*pi);
      float alt_over_ground = sin(i/180.0*pi)*rad;
      kml_output[counter_kml] = newKoords[0] + "," + newKoords[1] + "," + alt_over_ground;
      counter_kml++;
    }
    dir_switch = !dir_switch;
   }
   else
   {    
    for (int n_bows = circle_number; n_bows > 0; n_bows--) {
      float[] newKoords = newkoord(centerLat, centerLong, cos((i)/180.0*pi)*rad, ((180.0/circle_number)*n_bows+angle_north)/180.0*pi); 
      float alt_over_ground = sin(i/180.0*pi)*rad;
      kml_output[counter_kml] = newKoords[0] + "," + newKoords[1] + "," + alt_over_ground;
      counter_kml++;
    }
    dir_switch = !dir_switch;
   }
  }




  saveStrings(textfield_file.getText()+".kml", kml_output);
  save_label.setText(textfield_file.getText()+".kml  saved");
} //_CODE_:save_kml:450625:

void button1_Click2(GButton button) { //_CODE_:Save_UAV:713825:
  println("Save_UAV - GButton event occured " + System.currentTimeMillis()%10000000 );
  
  
  float nook_number = int(field_wp.getText());  //number of points per hemicircle
  int start_angle = int(field_a.getText());     //the angle from ground where the hemicircle begins
  int circle_number = int(field_n.getText());   //number of hemicircles
  float rad = float(field_r.getText()); //get the radius of the hemicircle in m
  int angle_north = int(field_b.getText()); //get the angle towards the north
  int wp_number = int(nook_number) * circle_number;

  //preparing the kml output string
  String[] csv_output = new String[1+wp_number];

  csv_output[0] = "WP#;Latitude;Longitude;Height;Heading;Time @ WP;Desired pos. accuracy;Flags;Camera tilt angle;";
  
  float centerLat = float(field_lat.getText());   //get the latitude of the center point
  float centerLong = float(field_long.getText()); //get the longitude of the center points
  int counter_csv = 1;



  float angle_steps = (180-2*start_angle)/(nook_number-1);  //setting the step width between each angle
  boolean dir_switch = false; //setts the direction of the horizontal hemicircle to optimize the flight time
  
  for (float i = start_angle; i<180-start_angle+angle_steps-1;i=i+angle_steps) {
    
   if(dir_switch){
    for (int n_bows = 0; n_bows < circle_number; n_bows++) {
      float[] newKoords = newkoord(centerLat, centerLong, cos((i)/180.0*pi)*rad, ((180.0/circle_number)*n_bows+angle_north)/180.0*pi);
      float alt_over_ground = sin(i/180.0*pi)*rad;
      int camera_tilt = int(i);
      int heading = ((180/circle_number)*n_bows);
      if(camera_tilt > 90) {
        heading = heading-180;
        camera_tilt = 180 - camera_tilt;
      }
      csv_output[counter_csv] = counter_csv + ";" + newKoords[1] + ";" + newKoords[0] + ";" + (alt_over_ground) + ";" +  (180+heading+angle_north) + ";" + "2;1;55;" + camera_tilt + ";";
      counter_csv++;
    }
    dir_switch = !dir_switch;
   }
   else
   {    
    for (int n_bows = circle_number; n_bows > 0; n_bows--) {
      float[] newKoords = newkoord(centerLat, centerLong, cos((i)/180.0*pi)*rad, ((180.0/circle_number)*n_bows+angle_north)/180.0*pi);
      float alt_over_ground = sin(i/180.0*pi)*rad;
      int camera_tilt = int(i);
      int heading = ((180/circle_number)*n_bows);
      if(camera_tilt > 90) {
        heading = heading-180;
        camera_tilt = 180 - camera_tilt;
      }
      csv_output[counter_csv] = counter_csv + ";" + newKoords[1] + ";" + newKoords[0] + ";" + (alt_over_ground) + ";" +  (180+heading+angle_north) + ";" + "2;1;55;" + camera_tilt + ";";
      counter_csv++;
    }
    dir_switch = !dir_switch;
   }
  }

saveStrings(textfield_file.getText()+".csv", csv_output);
save_label.setText(textfield_file.getText()+".csv  saved");
  
  
  
} //_CODE_:Save_UAV:713825:



// Create all the GUI controls. 
// autogenerated do not edit
void createGUI(){
  G4P.setColorScheme(this, GCScheme.GREY_SCHEME);
  G4P.messagesEnabled(false);
  field_lat = new GTextField(this, "50.904593", 40, 8, 192, 24, false);
  field_lat.addEventHandler(this, "textfield1_Enter1");
  field_long = new GTextField(this, "6.397777", 40, 41, 192, 24, false);
  field_long.addEventHandler(this, "textfield2_Enter1");
  label1 = new GLabel(this, "Lat", 8, 8, 32, 24);
  label2 = new GLabel(this, "Long", 8, 40, 32, 24);
  field_r = new GTextField(this, "10", 40, 72, 40, 24, false);
  field_r.addEventHandler(this, "textfield1_Enter2");
  slider1 = new GHorzSlider(this, 88, 72, 144, 24);
  slider1.setLimits(50, 8, 200);
  slider1.addEventHandler(this, "slider1_Change1");
  label3 = new GLabel(this, "r [m]", 8, 72, 32, 24);
  field_a = new GTextField(this, "0", 40, 104, 40, 24, false);
  field_a.addEventHandler(this, "textfield1_Enter3");
  field_wp = new GTextField(this, "7", 40, 136, 40, 24, false);
  field_wp.addEventHandler(this, "textfield2_Enter2");
  slider_2 = new GHorzSlider(this, 88, 104, 144, 24);
  slider_2.setLimits(0, 0, 89);
  slider_2.addEventHandler(this, "slider1_Change2");
  slider_3 = new GHorzSlider(this, 88, 136, 144, 24);
  slider_3.setLimits(7, 3, 64);
  slider_3.addEventHandler(this, "slider2_Change1");
  label4 = new GLabel(this, "a [Â°]", 8, 104, 32, 24);
  label5 = new GLabel(this, "WPÂ´s", 8, 136, 32, 24);
  field_n = new GTextField(this, "2", 40, 168, 40, 24, false);
  field_n.addEventHandler(this, "textfield1_Enter4");
  label6 = new GLabel(this, "n", 8, 168, 32, 24);
  slider_4 = new GHorzSlider(this, 88, 168, 144, 24);
  slider_4.setLimits(3, 1, 32);
  slider_4.addEventHandler(this, "slider1_Change3");
  field_b = new GTextField(this, "0", 40, 200, 40, 24, false);
  field_b.addEventHandler(this, "textfield1_Enter5");
  label7 = new GLabel(this, "b [Â°]", 8, 200, 32, 24);
  slider_5 = new GHorzSlider(this, 88, 200, 144, 24);
  slider_5.setLimits(0, 0, 360);
  slider_5.addEventHandler(this, "slider1_Change4");
  textfield_file = new GTextField(this, zeit_file(), 56, 240, 176, 24, true);
  textfield_file.addEventHandler(this, "textfield1_Enter6");
  label8 = new GLabel(this, "Filename", 8, 240, 48, 24);
  save_kml = new GButton(this, "Save KML", 16, 272, 96, 32);
  save_kml.setTextAlign(GAlign.CENTER | GAlign.MIDDLE);
  save_kml.addEventHandler(this, "button1_Click1");
  Save_UAV = new GButton(this, "Save UAV", 128, 272, 96, 32);
  Save_UAV.setTextAlign(GAlign.CENTER | GAlign.MIDDLE);
  Save_UAV.addEventHandler(this, "button1_Click2");
  save_label = new GLabel(this, "", 15, 318, 208, 28);
}

// Variable declarations 
// autogenerated do not edit
GTextField field_lat; 
GTextField field_long; 
GLabel label1; 
GLabel label2; 
GTextField field_r; 
GHorzSlider slider1; 
GLabel label3; 
GTextField field_a; 
GTextField field_wp; 
GHorzSlider slider_2; 
GHorzSlider slider_3; 
GLabel label4; 
GLabel label5; 
GTextField field_n; 
GLabel label6; 
GHorzSlider slider_4; 
GTextField field_b; 
GLabel label7; 
GHorzSlider slider_5; 
GTextField textfield_file; 
GLabel label8; 
GButton save_kml; 
GButton Save_UAV; 
GLabel save_label; 

