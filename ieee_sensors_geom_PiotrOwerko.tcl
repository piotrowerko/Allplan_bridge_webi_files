#-------------------------------------------------------------------------------
# Program version Allplan Bridge 2022-0-1
# Database version 1.01
#-------------------------------------------------------------------------------

ABM BEGIN
	
	#---------------------------------------------------------------------------
	# General project settings
	#---------------------------------------------------------------------------
	
	PROJECT BEGIN
		
		UNIT       SETDB ANGLED     "\[deg\]"    ""      "Degree to Radians"
		UNIT       SETDB ANGLE      "\[rad\]"    ""      "Radians"
		UNIT       SETDB LCROSSD    "\[m\]"      ""      "Meter"
		UNIT       SETDB LCROSS     "\[m\]"      ""      "Meter"
		UNIT       SETDB LSTRUCTD   "\[m\]"      ""      "Meter"
		UNIT       SETDB LSTRUCT    "\[m\]"      ""      "Meter"
		UNIT       SETDB STATION    "\[m\]"      ""      "Meter"
		UNIT       SETDB TEMP       "\[°C\]"     ""      "Celsius for temperature "
		UNIT       SETDB AREINF     "\[cm²\]"    ""      "Square Centimeter to Square Meter"
		UNIT       SETDB ASTRAND    "\[mm²\]"    ""      "Square Millimeter to Square Meter"
		UNIT       SETDB EMOD       "\[N/mm²\]"  ""      "Stress to Kilonewton per Square Meter"
		UNIT       SETDB STRESS     "\[N/mm²\]"  ""      "Stress to Kilonewton per Square Meter"
		UNIT       SETDB FORCE      "\[kN\]"     ""      "Kilonewton"
		UNIT       SETDB MOMENT     "\[kNm\]"    ""      "Kilonewton Meter"
		UNIT       SETDB DEVIATION  "\[rad/m\]"  ""      "Radian per Meter"
		UNIT       SETDB LSMALL     "\[mm\]"     ""      "Millimeter to Meter"
		UNIT       SETDB GAMMA      "\[kN/m³\]"  ""      "Specific weight Kilonewton per Meter³"
		UNIT       SETDB ACC        "\[m/s²\]"   ""      "Acceleration Meter per Second²"
		
		PORIGIN                 0.000                0.000
		RADIUS+    LEFT
		
		STANDARD   "PN_EN"
		
		#-----------------------------------------------------------------------
		# Recalculation settings (analysis)
		#-----------------------------------------------------------------------
		
		RECALCULATION BEGIN
			
			STRUCTURE BEGIN
				
				ANALYSISMODEL                 OFF
				
			STRUCTURE END
			
		RECALCULATION END
		
	PROJECT END
	
	#---------------------------------------------------------------------------
	# Standard EC2
	#---------------------------------------------------------------------------
	
	STANDARD "EN" BEGIN
		
		MATERIALS "Concrete" BEGIN
			
			MATERIAL "C50/60" BEGIN
				
				TEXT        "Bim+: Polish PN-EN"
				FOREIGN     ""
				
				VALUES BEGIN
					
					VALUE   EMODUL    "E"            37300                    "\%0.0lf" ""
					VALUE   GMODUL    "G"            15541.7                  "\%0.0lf" ""
					VALUE   POISSON   "Ny"           0.2                      "\%0.1lf" ""
					VALUE   ALPHAT    "Alpha-T"      1E-05                    "\%0.6lf" ""
					VALUE   GAMMA     "Gamma"        24.5166                  "\%0.1lf" ""
					VALUE   FCK       "fck"          50                       "\%0.0lf" ""
					VALUE   FCM       "fcm"          58                       "\%0.0lf" ""
					VALUE   FCTM      "fctm"         4.1                      "\%0.0lf" ""
					VALUE   CAGGREGATE "Concrete Aggregate" QUARTZITE         ""        ""
					VALUE   GCEMENT   "Cement Content" 0                      "\%0.1lf" ""
					VALUE   GSILICATE "Silicate Content" 0                    "\%0.1lf" ""
					VALUE   AGS       "Aggregate size" 16                     "\%0.0lf" ""
					VALUE   CEMENTCLASS "Cement Class" 1                      "\%0.3lf" ""
					
				VALUES END
				
			MATERIAL END
			
		MATERIALS END
		
	STANDARD END
	
	#---------------------------------------------------------------------------
	# Axes definition
	#---------------------------------------------------------------------------
	
	AXES BEGIN
		
		AXIS "Axis 1" BEGIN
			
			BIMPLUS         "" ""
			
			SSLOPE          ASC
			SBEGIN                           0
			
			PLAN BEGIN
				
				POINT       ABS                   0               0               0
				LINE        DS                 23.5
				
			PLAN END
			
			PROFILES BEGIN
				
				PROFILE "Profile" ACTIVE BEGIN
					
					SCALE       10
					
					POLYGON BEGIN
						
						POINT            0.000000     0.000000
						POINT           23.500000     0.000000
						
					POLYGON END
					
				PROFILE END
				
			PROFILES END
			
		AXIS END
		
	AXES END
	
	#---------------------------------------------------------------------------
	# Calculator - Formulas, Functions, Tables 
	#---------------------------------------------------------------------------
	
	CALC BEGIN
		
		TABLE      "tab_szer_srod"   ""
		TABLE      "tab_gr_pl"       ""
		TABLE      "tab_gr_pl_boki"  ""
		
		CURVE "tab_szer_srod"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "0.45"
			LINE            "6.30"  "0.45"
			LINE            "6.30"  "0.65"
			LINE            "17.20" "0.65"
			LINE            "17.20" "0.45"
			LINE            "23.50" "0.45"
			
		CURVE END
		
		CURVE "tab_gr_pl"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "0.25"
			LINE            "6.250" "0.25"
			LINE            "6.300" "0.35"
			LINE            "10.350" "0.35"
			LINE            "10.750" "0.550"
			LINE            "12.75" "0.550"
			LINE            "13.15" "0.35"
			LINE            "17.20" "0.35"
			LINE            "17.25" "0.25"
			LINE            "23.5"  "0.25"
			
		CURVE END
		
		CURVE "tab_gr_pl_boki"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "0.5"
			LINE            "6.250" "0.5"
			LINE            "6.300" "0.5"
			LINE            "10.350" "0.5"
			LINE            "10.750" "0.550"
			LINE            "12.75" "0.550"
			LINE            "13.15" "0.5"
			LINE            "17.20" "0.5"
			LINE            "17.25" "0.5"
			LINE            "23.5"  "0.5"
			
		CURVE END
		
	CALC END
	
	#---------------------------------------------------------------------------
	# Cross sections
	#---------------------------------------------------------------------------
	
	CSECTIONS BEGIN
		
		CSECTION "regular" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				PARADIR     "L1"                0.43500   NEG  LINE   "Zloc"   LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARADIR     "L2"                2.45500   NEG  LINE   "L1"     LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L3"                0.25000   POS  LINE   "L2"
				PARALLEL    "L4"                0.50000   POS  LINE   "L2"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARALLEL    "L5"                3.30000   POS  LINE   "Yloc"
				PARALLEL    "L6"                3.30000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L7"                0.45000   NEG  LINE   "L5"
				PARALLEL    "L8"                0.45000   POS  LINE   "L6"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARALLEL    "L9"                7.33000   POS  LINE   "Yloc"
				PARALLEL    "L10"               7.33000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L11"               1.80000   POS  LINE   "Yloc"
				PARALLEL    "L12"               1.95000   POS  LINE   "Yloc"
				PARALLEL    "L13"               1.80000   NEG  LINE   "Yloc"
				PARALLEL    "L14"               1.95000   NEG  LINE   "Yloc"
				PARADIR     "L15"               0.25500   NEG  LINE   "L1"     LDIR   "Yloc"
				PARADIR     "L16"               0.23500   NEG  LINE   "L1"     LDIR   "Yloc"
				LSECTION    "L17"                              LSECT  "L12"  "L15"  LSECT  "L11"  "L1"
				LSECTION    "L18"                              LSECT  "L14"  "L16"  LSECT  "L13"  "L1"
				ABSANGLE    "L19"               1.14576        LSECT  "L15"  "L17"
				ABSANGLE    "L20"              -2.00000        LSECT  "L16"  "L18"
				PARALLEL    "L21"               1.65000   POS  LINE   "Yloc"
				PARALLEL    "L22"               1.65000   NEG  LINE   "Yloc"
				RELANGLE    "L23"             -11.30993        LSECT  "L4"   "L22"     LINE   "L22"
				RELANGLE    "L24"              11.30993        LSECT  "L4"   "L21"     LINE   "L21"
				PARALLEL    "L25"               0.50000   NEG  LINE   "Yloc"
				PARALLEL    "L26"               0.10000   NEG  LINE   "Zloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				ABSANGLE    "L27"               1.14576        LSECT  "L25"  "L26"
				ABSANGLE    "L28"              -1.14576        LSECT  "L25"  "L26"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L29"               3.95000   NEG  LINE   "L25"
				PARALLEL    "L30"               3.95000   POS  LINE   "L25"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				ABSANGLE    "L31"               1.43210        LSECT  "L29"  "L28"
				ABSANGLE    "L32"              -1.43210        LSECT  "L30"  "L27"
				PCART       "P1"                0.00000     -0.55000   LSECT  "L6"   "L28"
				PCART       "P2"                0.00000     -0.18000   LSECT  "L10"  "L31"
				LSECTION    "L33"                              POINT  "P1"   POINT  "P2"
				PCART       "P3"                0.00000     -0.55000   LSECT  "L5"   "L27"
				PCART       "P4"                0.00000     -0.18000   LSECT  "L9"   "L32"
				LSECTION    "L34"                              POINT  "P3"   POINT  "P4"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				BOUNDARY "Boundary 1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L5"    "L34"
						BPOINT       2  LSECT   "L5"    "L2"
						BPOINT       3  LSECT   "L2"    "Yloc"
						BPOINT       4  LSECT   "L6"    "L2"
						BPOINT       5  LSECT   "L6"    "L33"
						BPOINT       6  LSECT   "L10"   "L33"
						BPOINT       7  LSECT   "L10"   "L31"
						BPOINT       8  LSECT   "L28"   "L31"
						BPOINT       9  LSECT   "L27"   "L28"
						BPOINT      10  LSECT   "L27"   "L32"
						BPOINT      11  LSECT   "L9"    "L32"
						BPOINT      12  LSECT   "L9"    "L34"
						
					POINTS END
					
				BOUNDARY END
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
			CUNITS END
			
		CSECTION END
		
		CSECTION "regular (1)" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				PARADIR     "L1"                0.43500   NEG  LINE   "Zloc"   LDIR   "Yloc"
				PARADIR     "L2"                2.45500   NEG  LINE   "L1"     LDIR   "Yloc"
				PARALLEL    "L3"                0.25000   POS  LINE   "L2"
				PARALLEL    "L4"                0.50000   POS  LINE   "L2"
				PARALLEL    "L5"                3.30000   POS  LINE   "Yloc"
				PARALLEL    "L6"                3.30000   NEG  LINE   "Yloc"
				PARALLEL    "L7"                0.45000   NEG  LINE   "L5"
				PARALLEL    "L8"                0.45000   POS  LINE   "L6"
				PARALLEL    "L9"                7.33000   POS  LINE   "Yloc"
				PARALLEL    "L10"               7.33000   NEG  LINE   "Yloc"
				PARALLEL    "L11"               1.80000   POS  LINE   "Yloc"
				PARALLEL    "L12"               1.95000   POS  LINE   "Yloc"
				PARALLEL    "L13"               1.80000   NEG  LINE   "Yloc"
				PARALLEL    "L14"               1.95000   NEG  LINE   "Yloc"
				PARADIR     "L15"               0.25500   NEG  LINE   "L1"     LDIR   "Yloc"
				PARADIR     "L16"               0.23500   NEG  LINE   "L1"     LDIR   "Yloc"
				LSECTION    "L17"                              LSECT  "L12"  "L15"  LSECT  "L11"  "L1"
				LSECTION    "L18"                              LSECT  "L14"  "L16"  LSECT  "L13"  "L1"
				ABSANGLE    "L19"               1.14576        LSECT  "L15"  "L17"
				ABSANGLE    "L20"              -2.00000        LSECT  "L16"  "L18"
				PARALLEL    "L21"               1.65000   POS  LINE   "Yloc"
				PARALLEL    "L22"               1.65000   NEG  LINE   "Yloc"
				RELANGLE    "L23"             -11.30993        LSECT  "L4"   "L22"     LINE   "L22"
				RELANGLE    "L24"              11.30993        LSECT  "L4"   "L21"     LINE   "L21"
				PARALLEL    "L25"               0.50000   NEG  LINE   "Yloc"
				PARALLEL    "L26"               0.10000   NEG  LINE   "Zloc"
				ABSANGLE    "L27"               1.14576        LSECT  "L25"  "L26"
				ABSANGLE    "L28"              -1.14576        LSECT  "L25"  "L26"
				PARALLEL    "L29"               3.95000   NEG  LINE   "L25"
				PARALLEL    "L30"               3.95000   POS  LINE   "L25"
				ABSANGLE    "L31"               1.43210        LSECT  "L29"  "L28"
				ABSANGLE    "L32"              -1.14576        LSECT  "L30"  "L27"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
			CUNITS END
			
		CSECTION END
		
		CSECTION "regular (2)" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARADIR     "L1"                0.43500   NEG  LINE   "Zloc"   LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARADIR     "L2"                2.45500   NEG  LINE   "L1"     LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARALLEL    "L3"                0.25000   POS  LINE   "L2"
				PARALLEL    "L4"                0.50000   POS  LINE   "L2"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARALLEL    "L5"                3.30000   POS  LINE   "Yloc"
				PARALLEL    "L6"                3.30000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARALLEL    "L7"                0.45000   NEG  LINE   "L5"
				PARALLEL    "L8"                0.45000   POS  LINE   "L6"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARALLEL    "L9"                7.33000   POS  LINE   "Yloc"
				PARALLEL    "L10"               7.33000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L11"               1.80000   POS  LINE   "Yloc"
				PARALLEL    "L12"               1.95000   POS  LINE   "Yloc"
				PARALLEL    "L13"               1.80000   NEG  LINE   "Yloc"
				PARALLEL    "L14"               1.95000   NEG  LINE   "Yloc"
				PARADIR     "L15"               0.25500   NEG  LINE   "L1"     LDIR   "Yloc"
				PARADIR     "L16"               0.23500   NEG  LINE   "L1"     LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				LSECTION    "L17"                              LSECT  "L12"  "L15"  LSECT  "L11"  "L1"
				LSECTION    "L18"                              LSECT  "L14"  "L16"  LSECT  "L13"  "L1"
				ABSANGLE    "L19"               1.14576        LSECT  "L15"  "L17"
				ABSANGLE    "L20"              -2.00000        LSECT  "L16"  "L18"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L21"               1.65000   POS  LINE   "Yloc"
				PARALLEL    "L22"               1.65000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				RELANGLE    "L23"             -11.30993        LSECT  "L4"   "L22"     LINE   "L22"
				RELANGLE    "L24"              11.30993        LSECT  "L4"   "L21"     LINE   "L21"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L25"               0.50000   NEG  LINE   "Yloc"
				PARALLEL    "L26"               0.10000   NEG  LINE   "Zloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				ABSANGLE    "L27"               1.14576        LSECT  "L25"  "L26"
				ABSANGLE    "L28"              -1.14576        LSECT  "L25"  "L26"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L29"               3.95000   NEG  LINE   "L25"
				PARALLEL    "L30"               3.95000   POS  LINE   "L25"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				ABSANGLE    "L31"               1.43210        LSECT  "L29"  "L28"
				ABSANGLE    "L32"              -1.43210        LSECT  "L30"  "L27"
				PCART       "P1"                0.00000     -0.55000   LSECT  "L6"   "L28"
				PCART       "P2"                0.00000     -0.18000   LSECT  "L10"  "L31"
				LSECTION    "L33"                              POINT  "P1"   POINT  "P2"
				PCART       "P3"                0.00000     -0.55000   LSECT  "L5"   "L27"
				PCART       "P4"                0.00000     -0.18000   LSECT  "L9"   "L32"
				LSECTION    "L34"                              POINT  "P3"   POINT  "P4"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				BOUNDARY "Boundary 1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L5"    "L34"
						BPOINT       2  LSECT   "L5"    "L2"
						BPOINT       3  LSECT   "L2"    "Yloc"
						BPOINT       4  LSECT   "L6"    "L2"
						BPOINT       5  LSECT   "L6"    "L33"
						BPOINT       6  LSECT   "L10"   "L33"
						BPOINT       7  LSECT   "L10"   "L31"
						BPOINT       8  LSECT   "L28"   "L31"
						BPOINT       9  LSECT   "L27"   "L28"
						BPOINT      10  LSECT   "L27"   "L32"
						BPOINT      11  LSECT   "L9"    "L32"
						BPOINT      12  LSECT   "L9"    "L34"
						
					POINTS END
					
				BOUNDARY END
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				BOUNDARY "Boundary 2" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L7"    "L19"
						BPOINT       2  LSECT   "L4"    "L7"
						BPOINT       3  LSECT   "L4"    "L24"
						BPOINT       4  LSECT   "L3"    "L24"
						BPOINT       5  LSECT   "L3"    "Yloc"
						BPOINT       6  LSECT   "L3"    "L23"
						BPOINT       7  LSECT   "L4"    "L23"
						BPOINT       8  LSECT   "L4"    "L8"
						BPOINT       9  LSECT   "L8"    "L20"
						BPOINT      10  LSECT   "L18"   "L20"
						BPOINT      11  LSECT   "L1"    "L18"
						BPOINT      12  LSECT   "L1"    "Yloc"
						BPOINT      13  LSECT   "L1"    "L17"
						BPOINT      14  LSECT   "L17"   "L19"
						
					POINTS END
					
				BOUNDARY END
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
			CUNITS END
			
		CSECTION END
		
		CSECTION "regular_final" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
				VAR         "szer_srod"                0.45000  LENGTH  ""
				VAR         "gr_pl_dolnej"             0.25000  LENGTH  ""
				VAR         "gr_pl_do_boki"            0.50000  LENGTH  ""
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARADIR     "L1"                0.43500   NEG  LINE   "Zloc"   LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARADIR     "L2"                2.45500   NEG  LINE   "L1"     LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARALLEL    "L3"           "gr_pl_dolnej" POS  LINE   "L2"
				PARALLEL    "L4"           "gr_pl_do_boki" POS LINE   "L2"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARALLEL    "L5"                3.30000   POS  LINE   "Yloc"
				PARALLEL    "L6"                3.30000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARALLEL    "L7"           "szer_srod"    NEG  LINE   "L5"
				PARALLEL    "L8"           "szer_srod"    POS  LINE   "L6"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARALLEL    "L9"                7.33000   POS  LINE   "Yloc"
				PARALLEL    "L10"               7.33000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L11"               1.80000   POS  LINE   "Yloc"
				PARALLEL    "L12"               1.95000   POS  LINE   "Yloc"
				PARALLEL    "L13"               1.80000   NEG  LINE   "Yloc"
				PARALLEL    "L14"               1.95000   NEG  LINE   "Yloc"
				PARADIR     "L15"               0.25500   NEG  LINE   "L1"     LDIR   "Yloc"
				PARADIR     "L16"               0.23500   NEG  LINE   "L1"     LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				LSECTION    "L17"                              LSECT  "L12"  "L15"  LSECT  "L11"  "L1"
				LSECTION    "L18"                              LSECT  "L14"  "L16"  LSECT  "L13"  "L1"
				ABSANGLE    "L19"               1.14576        LSECT  "L15"  "L17"
				ABSANGLE    "L20"              -2.00000        LSECT  "L16"  "L18"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L21"               1.65000   POS  LINE   "Yloc"
				PARALLEL    "L22"               1.65000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				RELANGLE    "L23"             -11.30993        LSECT  "L4"   "L22"     LINE   "L22"
				RELANGLE    "L24"              11.30993        LSECT  "L4"   "L21"     LINE   "L21"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L25"               0.50000   NEG  LINE   "Yloc"
				PARALLEL    "L26"               0.10000   NEG  LINE   "Zloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				ABSANGLE    "L27"               1.14576        LSECT  "L25"  "L26"
				ABSANGLE    "L28"              -1.14576        LSECT  "L25"  "L26"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L29"               3.95000   NEG  LINE   "L25"
				PARALLEL    "L30"               3.95000   POS  LINE   "L25"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				ABSANGLE    "L31"               1.43210        LSECT  "L29"  "L28"
				ABSANGLE    "L32"              -1.43210        LSECT  "L30"  "L27"
				PCART       "P1"                0.00000     -0.55000   LSECT  "L6"   "L28"
				PCART       "P2"                0.00000     -0.18000   LSECT  "L10"  "L31"
				LSECTION    "L33"                              POINT  "P1"   POINT  "P2"
				PCART       "P3"                0.00000     -0.55000   LSECT  "L5"   "L27"
				PCART       "P4"                0.00000     -0.18000   LSECT  "L9"   "L32"
				LSECTION    "L34"                              POINT  "P3"   POINT  "P4"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				BOUNDARY "Boundary 1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L5"    "L34"
						BPOINT       2  LSECT   "L5"    "L2"
						BPOINT       3  LSECT   "L2"    "Yloc"
						BPOINT       4  LSECT   "L6"    "L2"
						BPOINT       5  LSECT   "L6"    "L33"
						BPOINT       6  LSECT   "L10"   "L33"
						BPOINT       7  LSECT   "L10"   "L31"
						BPOINT       8  LSECT   "L28"   "L31"
						BPOINT       9  LSECT   "L27"   "L28"
						BPOINT      10  LSECT   "L27"   "L32"
						BPOINT      11  LSECT   "L9"    "L32"
						BPOINT      12  LSECT   "L9"    "L34"
						
					POINTS END
					
				BOUNDARY END
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				BOUNDARY "Boundary 2" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L7"    "L19"
						BPOINT       2  LSECT   "L4"    "L7"
						BPOINT       3  LSECT   "L4"    "L24"
						BPOINT       4  LSECT   "L3"    "L24"
						BPOINT       5  LSECT   "L3"    "Yloc"
						BPOINT       6  LSECT   "L3"    "L23"
						BPOINT       7  LSECT   "L4"    "L23"
						BPOINT       8  LSECT   "L4"    "L8"
						BPOINT       9  LSECT   "L8"    "L20"
						BPOINT      10  LSECT   "L18"   "L20"
						BPOINT      11  LSECT   "L1"    "L18"
						BPOINT      12  LSECT   "L1"    "Yloc"
						BPOINT      13  LSECT   "L1"    "L17"
						BPOINT      14  LSECT   "L17"   "L19"
						
					POINTS END
					
				BOUNDARY END
				
				COMBINE     "Boundary 1"    MINUS     "Boundary 2"
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
				SBEAM       1    LSECT     "L1"      "Yloc"
				
				SBEAM       1    BOUNDARY  "Boundary 1"
				
			CUNITS END
			
		CSECTION END
		
		CSECTION "regular_final_z_dziura" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
				VAR         "szer_srod"                0.45000  LENGTH  ""
				VAR         "gr_pl_dolnej"             0.25000  LENGTH  ""
				VAR         "gr_pl_do_boki"            0.50000  LENGTH  ""
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARADIR     "L1"                0.43500   NEG  LINE   "Zloc"   LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARADIR     "L2"                2.45500   NEG  LINE   "L1"     LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARALLEL    "L3"           "gr_pl_dolnej" POS  LINE   "L2"
				PARALLEL    "L4"           "gr_pl_do_boki" POS LINE   "L2"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARALLEL    "L5"                3.30000   POS  LINE   "Yloc"
				PARALLEL    "L6"                3.30000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARALLEL    "L7"           "szer_srod"    NEG  LINE   "L5"
				PARALLEL    "L8"           "szer_srod"    POS  LINE   "L6"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARALLEL    "L9"                7.33000   POS  LINE   "Yloc"
				PARALLEL    "L10"               7.33000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L11"               1.80000   POS  LINE   "Yloc"
				PARALLEL    "L12"               1.95000   POS  LINE   "Yloc"
				PARALLEL    "L13"               1.80000   NEG  LINE   "Yloc"
				PARALLEL    "L14"               1.95000   NEG  LINE   "Yloc"
				PARADIR     "L15"               0.25500   NEG  LINE   "L1"     LDIR   "Yloc"
				PARADIR     "L16"               0.23500   NEG  LINE   "L1"     LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				LSECTION    "L17"                              LSECT  "L12"  "L15"  LSECT  "L11"  "L1"
				LSECTION    "L18"                              LSECT  "L14"  "L16"  LSECT  "L13"  "L1"
				ABSANGLE    "L19"               1.14576        LSECT  "L15"  "L17"
				ABSANGLE    "L20"              -2.00000        LSECT  "L16"  "L18"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L21"               1.65000   POS  LINE   "Yloc"
				PARALLEL    "L22"               1.65000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				RELANGLE    "L23"             -11.30993        LSECT  "L4"   "L22"     LINE   "L22"
				RELANGLE    "L24"              11.30993        LSECT  "L4"   "L21"     LINE   "L21"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L25"               0.50000   NEG  LINE   "Yloc"
				PARALLEL    "L26"               0.10000   NEG  LINE   "Zloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				ABSANGLE    "L27"               1.14576        LSECT  "L25"  "L26"
				ABSANGLE    "L28"              -1.14576        LSECT  "L25"  "L26"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L29"               3.95000   NEG  LINE   "L25"
				PARALLEL    "L30"               3.95000   POS  LINE   "L25"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				ABSANGLE    "L31"               1.43210        LSECT  "L29"  "L28"
				ABSANGLE    "L32"              -1.43210        LSECT  "L30"  "L27"
				PCART       "P1"                0.00000     -0.55000   LSECT  "L6"   "L28"
				PCART       "P2"                0.00000     -0.18000   LSECT  "L10"  "L31"
				LSECTION    "L33"                              POINT  "P1"   POINT  "P2"
				PCART       "P3"                0.00000     -0.55000   LSECT  "L5"   "L27"
				PCART       "P4"                0.00000     -0.18000   LSECT  "L9"   "L32"
				LSECTION    "L34"                              POINT  "P3"   POINT  "P4"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L35"               0.40000   POS  LINE   "Yloc"
				PARALLEL    "L36"               0.40000   NEG  LINE   "Yloc"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				BOUNDARY "Boundary 1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L5"    "L34"
						BPOINT       2  LSECT   "L5"    "L2"
						BPOINT       3  LSECT   "L2"    "Yloc"
						BPOINT       4  LSECT   "L6"    "L2"
						BPOINT       5  LSECT   "L6"    "L33"
						BPOINT       6  LSECT   "L10"   "L33"
						BPOINT       7  LSECT   "L10"   "L31"
						BPOINT       8  LSECT   "L28"   "L31"
						BPOINT       9  LSECT   "L27"   "L28"
						BPOINT      10  LSECT   "L27"   "L32"
						BPOINT      11  LSECT   "L9"    "L32"
						BPOINT      12  LSECT   "L9"    "L34"
						
					POINTS END
					
				BOUNDARY END
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				BOUNDARY "Boundary 2" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L7"    "L19"
						BPOINT       2  LSECT   "L4"    "L7"
						BPOINT       3  LSECT   "L4"    "L24"
						BPOINT       4  LSECT   "L3"    "L24"
						BPOINT       5  LSECT   "L3"    "L35"
						BPOINT       6  LSECT   "L35"   "L2"
						BPOINT       7  LSECT   "L2"    "Yloc"
						BPOINT       8  LSECT   "L36"   "L2"
						BPOINT       9  LSECT   "L3"    "L36"
						BPOINT      10  LSECT   "L3"    "L23"
						BPOINT      11  LSECT   "L4"    "L23"
						BPOINT      12  LSECT   "L4"    "L8"
						BPOINT      13  LSECT   "L8"    "L20"
						BPOINT      14  LSECT   "L18"   "L20"
						BPOINT      15  LSECT   "L1"    "L18"
						BPOINT      16  LSECT   "L1"    "Yloc"
						BPOINT      17  LSECT   "L1"    "L17"
						BPOINT      18  LSECT   "L17"   "L19"
						
					POINTS END
					
				BOUNDARY END
				
				COMBINE     "Boundary 1"    MINUS     "Boundary 2"
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
				SBEAM       1    LSECT     "L1"      "Yloc"
				
				SBEAM       1    BOUNDARY  "Boundary 1"
				
			CUNITS END
			
		CSECTION END
		
		CSECTION "regular_final_bosarze" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
				VAR         "szer_srod"                0.45000  LENGTH  ""
				VAR         "gr_pl_dolnej"             0.25000  LENGTH  ""
				VAR         "gr_pl_do_boki"            0.50000  LENGTH  ""
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARADIR     "L1"                0.43500   NEG  LINE   "Zloc"   LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARADIR     "L2"                2.45500   NEG  LINE   "L1"     LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARALLEL    "L3"           "gr_pl_dolnej" POS  LINE   "L2"
				PARALLEL    "L4"           "gr_pl_do_boki" POS LINE   "L2"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARALLEL    "L5"                3.30000   POS  LINE   "Yloc"
				PARALLEL    "L6"                3.30000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				PARALLEL    "L7"           "szer_srod"    NEG  LINE   "L5"
				PARALLEL    "L8"           "szer_srod"    POS  LINE   "L6"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				PARALLEL    "L9"                7.33000   POS  LINE   "Yloc"
				PARALLEL    "L10"               7.33000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L11"               1.80000   POS  LINE   "Yloc"
				PARALLEL    "L12"               1.95000   POS  LINE   "Yloc"
				PARALLEL    "L13"               1.80000   NEG  LINE   "Yloc"
				PARALLEL    "L14"               1.95000   NEG  LINE   "Yloc"
				PARADIR     "L15"               0.25500   NEG  LINE   "L1"     LDIR   "Yloc"
				PARADIR     "L16"               0.23500   NEG  LINE   "L1"     LDIR   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				LSECTION    "L17"                              LSECT  "L12"  "L15"  LSECT  "L11"  "L1"
				LSECTION    "L18"                              LSECT  "L14"  "L16"  LSECT  "L13"  "L1"
				ABSANGLE    "L19"               1.14576        LSECT  "L15"  "L17"
				ABSANGLE    "L20"              -2.00000        LSECT  "L16"  "L18"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L21"               1.65000   POS  LINE   "Yloc"
				PARALLEL    "L22"               1.65000   NEG  LINE   "Yloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				RELANGLE    "L23"             -11.30993        LSECT  "L4"   "L22"     LINE   "L22"
				RELANGLE    "L24"              11.30993        LSECT  "L4"   "L21"     LINE   "L21"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L25"               0.50000   NEG  LINE   "Yloc"
				PARALLEL    "L26"               0.10000   NEG  LINE   "Zloc"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				ABSANGLE    "L27"               1.14576        LSECT  "L25"  "L26"
				ABSANGLE    "L28"              -1.14576        LSECT  "L25"  "L26"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L29"               3.95000   NEG  LINE   "L25"
				PARALLEL    "L30"               3.95000   POS  LINE   "L25"
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				ABSANGLE    "L31"               1.43210        LSECT  "L29"  "L28"
				ABSANGLE    "L32"              -1.43210        LSECT  "L30"  "L27"
				PCART       "P1"                0.00000     -0.55000   LSECT  "L6"   "L28"
				PCART       "P2"                0.00000     -0.18000   LSECT  "L10"  "L31"
				LSECTION    "L33"                              POINT  "P1"   POINT  "P2"
				PCART       "P3"                0.00000     -0.55000   LSECT  "L5"   "L27"
				PCART       "P4"                0.00000     -0.18000   LSECT  "L9"   "L32"
				LSECTION    "L34"                              POINT  "P3"   POINT  "P4"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				PARALLEL    "L35"               1.00000   POS  LINE   "L2"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound ext"
				
				BOUNDARY "Boundary 1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L5"    "L34"
						BPOINT       2  LSECT   "L5"    "L2"
						BPOINT       3  LSECT   "L2"    "Yloc"
						BPOINT       4  LSECT   "L6"    "L2"
						BPOINT       5  LSECT   "L6"    "L33"
						BPOINT       6  LSECT   "L10"   "L33"
						BPOINT       7  LSECT   "L10"   "L31"
						BPOINT       8  LSECT   "L28"   "L31"
						BPOINT       9  LSECT   "L27"   "L28"
						BPOINT      10  LSECT   "L27"   "L32"
						BPOINT      11  LSECT   "L9"    "L32"
						BPOINT      12  LSECT   "L9"    "L34"
						
					POINTS END
					
				BOUNDARY END
				
				ACTIVATE   DRAWLAYER   XML   "bridge bound inter"
				
				BOUNDARY "Boundary 2" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L7"    "L19"
						BPOINT       2  LSECT   "L7"    "L35"
						BPOINT       3  LSECT   "L8"    "L35"
						BPOINT       4  LSECT   "L8"    "L20"
						BPOINT       5  LSECT   "L18"   "L20"
						BPOINT       6  LSECT   "L1"    "L18"
						BPOINT       7  LSECT   "L1"    "Yloc"
						BPOINT       8  LSECT   "L1"    "L17"
						BPOINT       9  LSECT   "L17"   "L19"
						
					POINTS END
					
				BOUNDARY END
				
				COMBINE     "Boundary 1"    MINUS     "Boundary 2"
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
				SBEAM       1    LSECT     "L1"      "Yloc"
				
				SBEAM       1    BOUNDARY  "Boundary 1"
				
			CUNITS END
			
		CSECTION END
		
	CSECTIONS END
	
	#---------------------------------------------------------------------------
	# Model structure
	#---------------------------------------------------------------------------
	
	STRUCTURE BEGIN
		
		GIRDER "Girder 1" BEGIN
			
			TEXT            ""
			REFAXIS         "Axis 1"
			CSPLANE         NORMAL
			SBEGIN                 0.000000
			
			STATIONS BEGIN
				
				SLOCAL s001            0.000000    BEAM
				SLOCAL s002            0.650000    BEAM
				SLOCAL s003            2.265000    BEAM
				SLOCAL s004            6.250000    BEAM
				SLOCAL s005            6.300000    BEAM
				SLOCAL s006           10.350000    BEAM
				SLOCAL s007           10.750000    BEAM
				SLOCAL s008           11.150000    BEAM
				SLOCAL s009           12.350000    BEAM
				SLOCAL s010           12.750000    BEAM
				SLOCAL s011           13.150000    BEAM
				SLOCAL s012           17.200000    BEAM
				SLOCAL s013           17.250000    BEAM
				SLOCAL s014           21.250000    BEAM
				SLOCAL s015           22.850000    BEAM
				SLOCAL s016           23.500000    BEAM
				
			STATIONS END
			
			SPOINT            s001              CSECTION   "" "regular_final"
			SPOINT            s002              CSECTION   "regular_final" "regular_final_bosarze"
			SPOINT            s003              CSECTION   "regular_final_bosarze" "regular_final"
			SPOINT      [XFTS s004   s007   1]  CSECTION   "regular_final"
			SPOINT            s008              CSECTION   "regular_final" "regular_final_z_dziura"
			SPOINT            s009              CSECTION   "regular_final_z_dziura" "regular_final"
			SPOINT      [XFTS s010   s013   1]  CSECTION   "regular_final"
			SPOINT            s014              CSECTION   "regular_final" "regular_final_bosarze"
			SPOINT            s015              CSECTION   "regular_final_bosarze" "regular_final"
			SPOINT            s016              CSECTION   "regular_final"
			
			SPOINT      [XFTS s001   s016   1]  ZROTATE    0.00000
			
			SPOINT      [XFTS s001   s016   1]  YROTATE    0.00000
			
			SPOINT            s001              VARIABLE   "gr_pl_do_boki" ""                   "tab_gr_pl_boki(\$s)"
			SPOINT      [XFTS s002   s016   1]  VARIABLE   "gr_pl_do_boki" "tab_gr_pl_boki(\$s)"
			SPOINT            s001              VARIABLE   "gr_pl_dolnej" ""                    "tab_gr_pl(\$s)"
			SPOINT      [XFTS s002   s016   1]  VARIABLE   "gr_pl_dolnej" "tab_gr_pl(\$s)"
			SPOINT            s001              VARIABLE   "szer_srod"  ""                      "tab_szer_srod(\$s)"
			SPOINT      [XFTS s002   s016   1]  VARIABLE   "szer_srod"  "tab_szer_srod(\$s)"
			
			SPOINT      [XFTS s001   s016   1]  NODE       "1"               0   STEP     0
			
			SPOINT      [XFTS s001   s015   1]  BEAM       "1"               0   STEP     0
			
			SPOINT      [XFTS s001   s015   1]  MATERIAL   "1"          "EN:C50/60"
			
			SPOINT      [XFTS s001   s015   1]  GROUP      "1"          ""
			
			GRILLAGE "OFF" BEGIN
				
				MATERIAL         ""
				GROUP            ""
				CSECTION         ""                0.00000
				ELEMS                 0      0
				
			GRILLAGE END
			
		GIRDER END
		
		#-----------------------------------------------------------------------
		# Geometrical positions of structural members
		#-----------------------------------------------------------------------
		
		GPOSITIONS BEGIN
			
		GPOSITIONS END
		
		#-----------------------------------------------------------------------
		# Topological connections of structural members (Analysis)
		#-----------------------------------------------------------------------
		
		CONNECTIONS BEGIN
			
			
		CONNECTIONS END
		
	STRUCTURE END
	
ABM END
