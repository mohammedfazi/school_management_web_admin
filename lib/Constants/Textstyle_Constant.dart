import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle commontextstyle({double size=12,Color color=Colors.black,FontWeight fontweight=FontWeight.w400}) {
  return GoogleFonts.poppins(
      fontSize: size,
      color: color,
      fontWeight: fontweight,
      letterSpacing: 0.25
  );
}

TextStyle drawertxt(){
  return GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15
  );
}
TextStyle drawertxt1(){
  return GoogleFonts.poppins(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15
  );
}

TextStyle headingtxt18(){
  return GoogleFonts.poppins(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15
  );
}
