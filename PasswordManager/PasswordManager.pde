/*
  Password manager, med kryptering af passwords.
  
  Dette program er til at opbevare og holde styr på sine passwords.
  Passwordsne bliver opbevaret i en JSON fil, hvor de er krypteret.
  
  Udviklet af Jeppe Rønnow og Kristoffer Nielsen.
*/


// impotere og definere ControlP5 bibilotek
import controlP5.*;
ControlP5 P5;

controlP5.Textfield Input;
controlP5.Button Newpass;
controlP5.Textlabel Header;
Textlabel myLabel;
controlP5.Button Logout;

// Initiere JSON
JSONArray users;
JSONObject user;

// DIverse globale variabler
String decoder;
String input;
String[] inputs = new String[3];
boolean boInput = false;
float x = 200, y = 200;
String temp;
int n = 0;

void setup() {
  // Loader data fra JSON fil
  users = loadJSONArray("ytgefheu827848089urhfudj8e7234eujds/ataDssaP.json");
  
  // Starter ControlP5
  P5 = new ControlP5(this);
  
  // Diverse funktioner for elve vinduet.
  size(800, 800);
  background(0);
  
  // Starter password skærm
  startFunktion();
}

void draw() {
  
  // Dekryptering af passwords og tegner dem på skærmen.
  if (input != null && decoder == null) decoder = input;
  if (decoder != null){
    Input.hide();
    Header.hide();
    Newpass.show();
    Logout.show();
    background(0);
    drawPass();
    y = 200;
  }
  
  // Indtast nyt password
  if (boInput) {
    newJSONObject();
  }
  
  
  
}

public void controlEvent(ControlEvent theEvent) {
  if (theEvent.getName() == "newPass") {
    temp = input;
    n = 0;
    boInput = true;
  }
}

// Input void
public void Password(String theText) {
  input = theText;
}

void reset(){
  input = null;
  Input.show();
  Header.show();
  Newpass.hide();
  Logout.hide();
}
