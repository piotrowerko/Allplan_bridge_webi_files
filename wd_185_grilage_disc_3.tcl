#-------------------------------------------------------------------------------
# Program version Allplan Bridge 2022-0-1
# Database version 1.02
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
		UNIT       SETDB TEMP       "\[°C\]"     ""      "Celsius"
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
		
		#-----------------------------------------------------------------------
		# Recalculation settings (analysis)
		#-----------------------------------------------------------------------
		
		RECALCULATION BEGIN
			
			OPTION   TIMELINE                 ON
			
			STRUCTURE BEGIN
				
				ANALYSISMODEL                 ON
				OPTION   AUTOENUM             ON
				OPTION   AUTOTASKS            ON
				OPTION   AUTOINFL             ON
				OPTION   ANALYSIS             ON
				
			STRUCTURE END
			
		RECALCULATION END
		
	PROJECT END
	
	#---------------------------------------------------------------------------
	# Standard EC2
	#---------------------------------------------------------------------------
	
	STANDARD "EN" BEGIN
		
		MATERIALS "Concrete" BEGIN
			
			MATERIAL "C40/50" BEGIN
				
				TEXT        "Bim+: Standard EN"
				FOREIGN     "EN_Eurocode:C_40/50"
				
				VALUES BEGIN
					
					VALUE   EMODUL    "E"            39000                    "\%0.0lf" ""
					VALUE   GMODUL    "G"            14666.7                  "\%0.0lf" ""
					VALUE   POISSON   "Ny"           0.2                      "\%0.1lf" ""
					VALUE   ALPHAT    "Alpha-T"      1E-05                    "\%0.6lf" ""
					VALUE   GAMMA     "Gamma"        24.5166                  "\%0.1lf" ""
					VALUE   FCK       "fck"          40                       "\%0.0lf" ""
					VALUE   FCM       "fcm"          48                       "\%0.0lf" ""
					VALUE   FCTM      "fctm"         3.5                      "\%0.0lf" ""
					VALUE   CEMENTCLASS "Cement Class" 1                      "\%0.3lf" ""
					VALUE   CAGGREGATE "Concrete Aggregate" QUARTZITE         ""        ""
					VALUE   GCEMENT   "Cement Content" 0                      "\%0.1lf" ""
					VALUE   GSILICATE "Silicate Content" 0                    "\%0.1lf" ""
					
				VALUES END
				
			MATERIAL END
			
			MATERIAL "C30/37" BEGIN
				
				TEXT        "Bim+: Standard EN"
				FOREIGN     "EN_Eurocode:C_30/37"
				
				VALUES BEGIN
					
					VALUE   EMODUL    "E"            32800                    "\%0.0lf" ""
					VALUE   GMODUL    "G"            13666.7                  "\%0.0lf" ""
					VALUE   POISSON   "Ny"           0.2                      "\%0.1lf" ""
					VALUE   ALPHAT    "Alpha-T"      1E-05                    "\%0.6lf" ""
					VALUE   GAMMA     "Gamma"        24.5166                  "\%0.1lf" ""
					VALUE   FCK       "fck"          30                       "\%0.0lf" ""
					VALUE   FCM       "fcm"          38                       "\%0.0lf" ""
					VALUE   FCTM      "fctm"         2.9                      "\%0.0lf" ""
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
				CIRCLE      DSR                61.8          100000
				
			PLAN END
			
			PROFILES BEGIN
				
				PROFILE "Profile" ACTIVE BEGIN
					
					SCALE       10
					
					POLYGON BEGIN
						
						POINT            0.000000     0.000000
						POINT           61.800000     0.000000
						
					POLYGON END
					
				PROFILE END
				
			PROFILES END
			
		AXIS END
		
	AXES END
	
	#---------------------------------------------------------------------------
	# Calculator - Formulas, Functions, Tables 
	#---------------------------------------------------------------------------
	
	CALC BEGIN
		
		TABLE      "tab_wyszerz"     ""
		TABLE      "Spectrum_1"      "EQ-Event 1 - general"
		TABLE      "Spectrum_2"      "EQ-Event 1 - EC horizontal"
		TABLE      "TableGrillage"   ""
		VAR        "ExpressionGrillage" ""
		
		CURVE "tab_wyszerz"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "0.5"
			LINE            "25.90" "0.5"
			LINE            "30.90" "0.8"
			LINE            "35.90" "0.5"
			LINE            "61.8"  "0.5"
			
		CURVE END
		
		CURVE "Spectrum_1" BEGIN
			
		CURVE END
		
		CURVE "Spectrum_2" BEGIN
			
			LINE            "0.0"   "0.666666666667"
			LINE            "0.15"  "2.5"
			FREE            "0.4"   "max(1.0/\$_x_, 0.2)"
			FREE            "2.0"   "max(2.0/(\$_x_*\$_x_),0.2)"
			LINE            "3.162277660168" "0.2"
			LINE            "4.0"   "0.2"
			
		CURVE END
		
		CURVE "TableGrillage"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "1.31"
			LINE            "0.7"   "1.31"
			LINE            "1.4"   "1.31"
			FREE            "1.4"   "1.31"
			LINE            "1.45"  "0.25"
			LINE            "4.315" "0.25"
			LINE            "7.230" "0.25"
			LINE            "10.145" "0.25"
			LINE            "13.060" "0.25"
			LINE            "15.975" "0.25"
			LINE            "18.890" "0.25"
			LINE            "21.805" "0.25"
			LINE            "24.720" "0.25"
			LINE            "27.635" "0.25"
			FREE            "30.50" "0.25"
			FREE            "30.550" "1.31"
			LINE            "30.830" "1.31"
			LINE            "30.970" "1.31"
			FREE            "31.250" "1.31"
			LINE            "31.250" "1.31"
			LINE            "31.30" "0.25"
			LINE            "34.165" "0.25"
			LINE            "37.080" "0.25"
			LINE            "39.995" "0.25"
			LINE            "42.910" "0.25"
			LINE            "45.825" "0.25"
			LINE            "48.740" "0.25"
			LINE            "51.655" "0.25"
			LINE            "54.570" "0.25"
			LINE            "57.485" "0.25"
			FREE            "60.35" "0.25"
			FREE            "60.400" "1.31"
			LINE            "61.100" "1.31"
			LINE            "61.800" "1.31"
			
		CURVE END
		
		DEFINE     "ExpressionGrillage" "TableGrillage(\$sf)"
		
	CALC END
	
	#---------------------------------------------------------------------------
	# Cross sections
	#---------------------------------------------------------------------------
	
	CSECTIONS BEGIN
		
		CSECTION "kapa_l" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				ACTIVATE   DRAWLAYER   XML   "road"
				
				PARADIR     "L1"                0.24000   POS  LINE   "Zloc"   LDIR   "Yloc"
				PARALLEL    "L2"                2.00000   POS  LINE   "Yloc"
				RELANGLE    "L3"              177.00000        LSECT  "L1"   "Yloc"    LINE   "L1"
				RELANGLE    "L4"                1.14576        LSECT  "L2"   "L3"      LINE   "L2"
				PARALLEL    "L5"                1.65000   POS  LINE   "Yloc"
				PCART       "P1"                0.00000      0.00000   LSECT  "L2"   "L3"
				PCART       "P2"                1.00000      0.00000   POINT  "P1"
				LSECTION    "L6"                               POINT  "P1"   POINT  "P2"
				PARALLEL    "L7"                0.65000   NEG  LINE   "L6"
				RELANGLE    "L8"                1.14576        LSECT  "L5"   "Zloc"    LINE   "L5"
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				RELANGLE    "L9"                1.14576        LSECT  "Zloc" "Yloc"    LINE   "Yloc"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				ACTIVATE   DRAWLAYER   XML   "road"
				
				BOUNDARY "Boundary 1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "Zloc"  "Yloc"
						BPOINT       2  LSECT   "L3"    "L9"    LINSYMM      0.04000
						BPOINT       3  LSECT   "L2"    "L6"
						BPOINT       4  LSECT   "L7"    "L4"    LINSYMM      0.04000
						BPOINT       5  LSECT   "L7"    "L8"
						BPOINT       6  LSECT   "L5"    "Zloc"
						
					POINTS END
					
				BOUNDARY END
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
			CUNITS END
			
		CSECTION END
		
		CSECTION "kapa_p" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				RELANGLE    "L1"               -1.43210        LSECT  "Zloc" "Yloc"    LINE   "Yloc"
				PARALLEL    "L2"                0.65000   NEG  LINE   "Yloc"
				PARALLEL    "L3"                0.35000   NEG  LINE   "L2"
				PARALLEL    "L4"                0.24000   POS  LINE   "Zloc"
				RELANGLE    "L5"               -1.43210        LSECT  "L3"   "Zloc"    LINE   "L3"
				RELANGLE    "L6"                1.14576        LSECT  "L4"   "L1"      LINE   "L4"
				PARALLEL    "L7"                0.30500   NEG  LINE   "Zloc"
				RELANGLE    "L8"               -1.43210        LSECT  "L2"   "Zloc"    LINE   "L2"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				BOUNDARY "Boundary 1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "Zloc"  "Yloc"
						BPOINT       2  LSECT   "L4"    "L1"    LINSYMM      0.04000
						BPOINT       3  LSECT   "L5"    "L6"
						BPOINT       4  LSECT   "L7"    "L5"
						BPOINT       5  LSECT   "L7"    "L8"    LINSYMM      0.04000
						BPOINT       6  LSECT   "L2"    "Zloc"
						
					POINTS END
					
				BOUNDARY END
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
			CUNITS END
			
		CSECTION END
		
		CSECTION "wd185_with_road" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
				VAR         "wyszerzenieDZ"            0.50000  LENGTH  ""
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				PARALLEL    "L1"                0.25000   POS  LINE   "Zloc"
				ABSANGLE    "gora plyty"       -1.14576        LSECT  "L1"   "Yloc"
				PARALLEL    "os odw"            3.60500   NEG  LINE   "Yloc"
				PARALLEL    "koniec wspP"       4.37500   NEG  LINE   "Yloc"
				PARALLEL    "dol plyty"         0.25000   NEG  LINE   "gora plyty"
				PARALLEL    "os dzL"            2.17500   POS  LINE   "Yloc"
				PARALLEL    "os dzP"            2.17500   NEG  LINE   "Yloc"
				PARALLEL    "dol dzA"           1.31000   NEG  LINE   "Zloc"
				PARALLEL    "dol dzB"           1.39000   NEG  LINE   "Zloc"
				PARALLEL    "L2"                0.50000   POS  LINE   "os dzL"
				PARALLEL    "L3"           "wyszerzenieDZ" NEG LINE   "os dzL"
				PARALLEL    "L6"                0.20000   NEG  LINE   "L3"
				LSECTION    "L7"                               LSECT  "dol dzA" "L3" LSECT "dol plyty" "L6"
				PARALLEL    "koniec wspL"       4.37500   POS  LINE   "Yloc"
				PCART       "P1"                0.00000     -0.20000   LSECT  "koniec wspL"  "gora plyty"
				PARALLEL    "L5"                0.20000   POS  LINE   "L2"
				PCART       "P2"                0.00000     -0.35000   LSECT  "L5"   "gora plyty"
				LSECTION    "L8"                               LSECT  "dol dzA" "L2" POINT "P2"
				LSECTION    "L9"                               POINT  "P1"   POINT  "P2"
				PARALLEL    "L10"               0.50000   NEG  LINE   "os dzP"
				PARALLEL    "L11"               0.20000   NEG  LINE   "L10"
				PARALLEL    "L12"          "wyszerzenieDZ" POS LINE   "os dzP"
				PARALLEL    "L13"               0.20000   POS  LINE   "L12"
				LSECTION    "L14"                              LSECT  "dol dzB" "L12" LSECT "dol plyty" "L13"
				ABSANGLE    "gora wspP"         1.43210        LSECT  "os odw" "gora plyty"
				PCART       "P3"                0.00000     -0.20000   LSECT  "koniec wspP"  "gora wspP"
				PCART       "P4"                0.00000     -0.35000   LSECT  "L11"  "gora plyty"
				LSECTION    "L4"                               LSECT  "dol dzB" "L10" POINT "P4"
				LSECTION    "L15"                              POINT  "P4"   POINT  "P3"
				PARALLEL    "dol pop"           0.15000   POS  LINE   "dol dzA"
				
				ACTIVATE   DRAWLAYER   XML   "road"
				
				PARADIR     "road_upper"        0.09000   POS  LINE   "gora plyty" LDIR   "L5"
				PARALLEL    "road_left_edge"      1.65000 NEG  LINE   "koniec wspL"
				PARALLEL    "road_right_edge"      0.65000 POS LINE   "koniec wspP"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				BOUNDARY "Boundary 1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "dol dzA" "L3"
						BPOINT       2  LSECT   "os dzL" "dol dzA"
						BPOINT       3  LSECT   "dol dzA" "L2"
						BPOINT       4  POINT   "P2"
						BPOINT       5  POINT   "P1"
						BPOINT       6  LSECT   "koniec wspL" "gora plyty"
						BPOINT       7  LSECT   "os dzL" "gora plyty"
						BPOINT       8  LSECT   "L1"    "Yloc"
						BPOINT       9  LSECT   "dol plyty" "Yloc"
						BPOINT      10  LSECT   "dol plyty" "L6"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary 2" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "os dzP" "dol dzB"
						BPOINT       2  LSECT   "dol dzB" "L12"
						BPOINT       3  LSECT   "dol plyty" "L13"
						BPOINT       4  LSECT   "dol plyty" "Yloc"
						BPOINT       5  LSECT   "L1"    "Yloc"
						BPOINT       6  LSECT   "os dzP" "gora plyty"
						BPOINT       7  LSECT   "os odw" "gora plyty"
						BPOINT       8  LSECT   "koniec wspP" "gora wspP"
						BPOINT       9  POINT   "P3"
						BPOINT      10  POINT   "P4"
						BPOINT      11  LSECT   "dol dzB" "L10"
						
					POINTS END
					
				BOUNDARY END
				
				ACTIVATE   DRAWLAYER   XML   "road"
				
				BOUNDARY "Boundary 3" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "road_left_edge" "road_upper"
						BPOINT       2  LSECT   "road_upper" "Yloc"
						BPOINT       3  LSECT   "Yloc"  "gora plyty"
						BPOINT       4  LSECT   "road_left_edge" "gora plyty"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary 4" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "road_upper" "Yloc"
						BPOINT       2  LSECT   "road_right_edge" "road_upper"
						BPOINT       3  LSECT   "road_right_edge" "gora wspP"
						BPOINT       4  LSECT   "os odw" "gora plyty"
						BPOINT       5  LSECT   "Yloc"  "gora plyty"
						
					POINTS END
					
				BOUNDARY END
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				BOUNDARY "Boundary 5" EXTREF BEGIN
					
					REFERENCE    "kapa_l"            "Boundary 1"
					SYSTEM       "Boundary 1" CENTER "road_left_edge" 2   POS   POS
					OFFSET       0.00000
					MULTIPLY     0.10000     1
					
				BOUNDARY END
				
				BOUNDARY "Boundary 6" EXTREF BEGIN
					
					REFERENCE    "kapa_p"            "Boundary 1"
					SYSTEM       "Boundary 2" CENTER "road_right_edge" 1   POS   POS
					OFFSET       0.00000
					MULTIPLY     0.10000     1
					
				BOUNDARY END
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
				SBEAM       1    LSECT     "os dzL"  "gora plyty"
				SBEAM       2    LSECT     "os dzP"  "gora plyty"
				SLOAD       3    LSECT     "road_upper" "Yloc"
				SLOAD       4    LSECT     "road_upper" "Yloc"
				SLOAD       5    LSECT     "koniec wspL" "gora plyty"
				SLOAD       6    LSECT     "koniec wspP" "gora wspP"
				
				SBEAM       1    BOUNDARY  "Boundary 1"
				SBEAM       2    BOUNDARY  "Boundary 2"
				SLOAD       3    BOUNDARY  "Boundary 3"
				SLOAD       4    BOUNDARY  "Boundary 4"
				SLOAD       5    BOUNDARY  "Boundary 5"
				SLOAD       6    BOUNDARY  "Boundary 6"
				
			CUNITS END
			
		CSECTION END
		
		CSECTION "wd185_zpop" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
				VAR         "wyszerzenieDZ"            0.50000  LENGTH  ""
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				PARALLEL    "L1"                0.25000   POS  LINE   "Zloc"
				ABSANGLE    "gora plyty"       -1.14576        LSECT  "L1"   "Yloc"
				PARALLEL    "os odw"            3.60500   NEG  LINE   "Yloc"
				PARALLEL    "koniec wspP"       4.37500   NEG  LINE   "Yloc"
				PARALLEL    "dol plyty"         0.25000   NEG  LINE   "gora plyty"
				PARALLEL    "os dzL"            2.17500   POS  LINE   "Yloc"
				PARALLEL    "os dzP"            2.17500   NEG  LINE   "Yloc"
				PARALLEL    "dol dzA"           1.31000   NEG  LINE   "Zloc"
				PARALLEL    "dol dzB"           1.39000   NEG  LINE   "Zloc"
				PARALLEL    "L2"                0.50000   POS  LINE   "os dzL"
				PARALLEL    "L3"           "wyszerzenieDZ" NEG LINE   "os dzL"
				PARALLEL    "L6"                0.20000   NEG  LINE   "L3"
				LSECTION    "L7"                               LSECT  "dol dzA" "L3" LSECT "dol plyty" "L6"
				PARALLEL    "koniec wspL"       4.37500   POS  LINE   "Yloc"
				PCART       "P1"                0.00000     -0.20000   LSECT  "koniec wspL"  "gora plyty"
				PARALLEL    "L5"                0.20000   POS  LINE   "L2"
				PCART       "P2"                0.00000     -0.35000   LSECT  "L5"   "gora plyty"
				LSECTION    "L8"                               LSECT  "dol dzA" "L2" POINT "P2"
				LSECTION    "L9"                               POINT  "P1"   POINT  "P2"
				PARALLEL    "L10"               0.50000   NEG  LINE   "os dzP"
				PARALLEL    "L11"               0.20000   NEG  LINE   "L10"
				PARALLEL    "L12"          "wyszerzenieDZ" POS LINE   "os dzP"
				PARALLEL    "L13"               0.20000   POS  LINE   "L12"
				LSECTION    "L14"                              LSECT  "dol dzB" "L12" LSECT "dol plyty" "L13"
				ABSANGLE    "gora wspP"         1.45760        LSECT  "os odw" "gora plyty"
				PCART       "P3"                0.00000     -0.20000   LSECT  "koniec wspP"  "gora wspP"
				PCART       "P4"                0.00000     -0.35000   LSECT  "L11"  "gora plyty"
				LSECTION    "L4"                               LSECT  "dol dzB" "L10" POINT "P4"
				LSECTION    "L15"                              POINT  "P4"   POINT  "P3"
				PARALLEL    "dol pop"           0.15000   POS  LINE   "dol dzA"
				
				ACTIVATE   DRAWLAYER   XML   "road"
				
				PARADIR     "L16"               0.09000   POS  LINE   "gora plyty" LDIR   "Yloc"
				PARALLEL    "road_left_edge"      1.65000 NEG  LINE   "koniec wspL"
				PARALLEL    "road_right_edge"      0.65000 POS LINE   "koniec wspP"
				PARADIR     "road_top_right"      0.09000 POS  LINE   "gora wspP" LDIR   "koniec wspP"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				BOUNDARY "Boundary 1" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L1"    "Yloc"
						BPOINT       2  LSECT   "dol pop" "Yloc"
						BPOINT       3  LSECT   "dol pop" "L7"
						BPOINT       4  LSECT   "dol dzA" "L3"
						BPOINT       5  LSECT   "dol dzA" "L2"
						BPOINT       6  POINT   "P2"
						BPOINT       7  POINT   "P1"
						BPOINT       8  LSECT   "koniec wspL" "gora plyty"
						BPOINT       9  LSECT   "os dzL" "gora plyty"
						BPOINT      10  LSECT   "L1"    "Yloc"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary 2" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L1"    "Yloc"
						BPOINT       2  LSECT   "os dzP" "gora plyty"
						BPOINT       3  LSECT   "os odw" "gora plyty"
						BPOINT       4  LSECT   "koniec wspP" "gora wspP"
						BPOINT       5  POINT   "P3"
						BPOINT       6  POINT   "P4"
						BPOINT       7  LSECT   "dol dzB" "L10"
						BPOINT       8  LSECT   "os dzP" "dol dzB"
						BPOINT       9  LSECT   "dol dzB" "L12"
						BPOINT      10  LSECT   "dol pop" "L14"
						BPOINT      11  LSECT   "dol pop" "Yloc"
						BPOINT      12  LSECT   "L1"    "Yloc"
						
					POINTS END
					
				BOUNDARY END
				
				ACTIVATE   DRAWLAYER   XML   "road"
				
				BOUNDARY "Boundary 4" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "road_left_edge" "L16"
						BPOINT       2  LSECT   "L16"   "Yloc"
						BPOINT       3  LSECT   "L1"    "Yloc"
						BPOINT       4  LSECT   "road_left_edge" "gora plyty"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary 5" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L16"   "Yloc"
						BPOINT       2  LSECT   "L1"    "Yloc"
						BPOINT       3  LSECT   "os odw" "gora plyty"
						BPOINT       4  LSECT   "road_right_edge" "gora wspP"
						BPOINT       5  LSECT   "road_right_edge" "road_top_right"
						BPOINT       6  LSECT   "os odw" "L16"
						
					POINTS END
					
				BOUNDARY END
				
				ACTIVATE   DRAWLAYER   XML   ""
				
				BOUNDARY "Boundary 3" EXTREF BEGIN
					
					REFERENCE    "kapa_l"            "Boundary 1"
					SYSTEM       "Boundary 1" CENTER "road_left_edge" 2   POS   POS
					OFFSET       0.00000
					MULTIPLY     0.10000     1
					
				BOUNDARY END
				
				ACTIVATE   DRAWLAYER   XML   "road"
				
				BOUNDARY "Boundary 6" EXTREF BEGIN
					
					REFERENCE    "kapa_p"            "Boundary 1"
					SYSTEM       "Boundary 2" CENTER "road_right_edge" 1   POS   POS
					OFFSET       0.00000
					MULTIPLY     0.10000     1
					
				BOUNDARY END
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
				SBEAM       1    LSECT     "os dzL"  "gora plyty"
				SBEAM       2    LSECT     "os dzP"  "gora plyty"
				SLOAD       3    LSECT     "L16"     "Yloc"
				SLOAD       4    LSECT     "L16"     "Yloc"
				SLOAD       5    LSECT     "koniec wspL" "gora plyty"
				SLOAD       6    LSECT     "koniec wspP" "gora wspP"
				
				SBEAM       1    BOUNDARY  "Boundary 1"
				SBEAM       2    BOUNDARY  "Boundary 2"
				SLOAD       3    BOUNDARY  "Boundary 4"
				SLOAD       4    BOUNDARY  "Boundary 5"
				SLOAD       5    BOUNDARY  "Boundary 3"
				SLOAD       6    BOUNDARY  "Boundary 6"
				
			CUNITS END
			
			CGREF BEGIN
				
				POINT       "P1_left" LSECT     "os dzL"  "dol dzA"
				POINT       "P2_right" LSECT    "os dzP"  "dol dzB"
				POINT       "P3_center" LSECT   "dol pop" "Yloc"
				
			CGREF END
			
		CSECTION END
		
		CSECTION "grillage" BEGIN
			
			TEXT   "Grillage, cross members"
			
			CVARS BEGIN
				
				VAR         "height"                   1.31000  LENGTH  "Cross member height"
				VAR         "wleft"                    0.00000  LENGTH  "Cross member width to left"
				VAR         "wright"                   0.31722  LENGTH  "Cross member width to right"
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				PARALLEL    "bottom"       "height"       NEG  LINE   "Zloc"
				PARALLEL    "left"         "wleft"        POS  LINE   "Yloc"
				PARALLEL    "right"        "wright"       NEG  LINE   "Yloc"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				BOUNDARY "Beam1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "left"  "bottom"
						BPOINT       2  LSECT   "right" "bottom"
						BPOINT       3  LSECT   "right" "Zloc"
						BPOINT       4  LSECT   "left"  "Zloc"
						
					POINTS END
					
				BOUNDARY END
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
				SBEAM       1    LSECT     "Zloc"    "Yloc"
				
				SBEAM       1    BOUNDARY  "Beam1"
				
			CUNITS END
			
		CSECTION END
		
		CSECTION "ExpressionGrillage" BEGIN
			
			TEXT   "Grillage, cross members"
			
			CVARS BEGIN
				
				VAR         "height"                   0.25000  LENGTH  "Cross member height"
				VAR         "wleft"                    0.00000  LENGTH  "Cross member width to left"
				VAR         "wright"                   0.35001  LENGTH  "Cross member width to right"
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				PARALLEL    "bottom"       "height"       NEG  LINE   "Zloc"
				PARALLEL    "left"         "wleft"        POS  LINE   "Yloc"
				PARALLEL    "right"        "wright"       NEG  LINE   "Yloc"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				BOUNDARY "Beam1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "left"  "bottom"
						BPOINT       2  LSECT   "right" "bottom"
						BPOINT       3  LSECT   "right" "Zloc"
						BPOINT       4  LSECT   "left"  "Zloc"
						
					POINTS END
					
				BOUNDARY END
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
				SBEAM       1    LSECT     "Zloc"    "Yloc"
				
				SBEAM       1    BOUNDARY  "Beam1"
				
			CUNITS END
			
		CSECTION END
		
	CSECTIONS END
	
	#---------------------------------------------------------------------------
	# Model structure
	#---------------------------------------------------------------------------
	
	STRUCTURE BEGIN
		
		GIRDER "Girder 1" BEGIN
			
			TEXT            ""
			IFC  OBJTYPE    "IfcBridgePart:SUPERSTRUCTURE"
			REFAXIS         "Axis 1"
			CSPLANE         VERTICAL
			CSCALC          PHI0IYZ0
			SBEGIN                 0.000000
			
			STATIONS BEGIN
				
				SGLOBAL s001           0.000000    BEAM
				SGLOBAL s002           0.700000    BEAM
				SGLOBAL s003           1.400000    BEAM
				SGLOBAL s004           1.450000    BEAM
				SGLOBAL s005           4.315000    BEAM
				SGLOBAL s006           7.230000    BEAM
				SGLOBAL s007          10.145000    BEAM
				SGLOBAL s008          13.060000    BEAM
				SGLOBAL s009          15.975000    BEAM
				SGLOBAL s010          18.890000    BEAM
				SGLOBAL s011          21.805000    BEAM
				SGLOBAL s012          24.720000    BEAM
				SGLOBAL s013          27.635000    BEAM
				SGLOBAL s014          30.500000    BEAM
				SGLOBAL s015          30.550000    BEAM
				SGLOBAL s016          30.900000    BEAM
				SGLOBAL s017          31.250000    BEAM
				SGLOBAL s018          31.300000    BEAM
				SGLOBAL s019          34.165000    BEAM
				SGLOBAL s020          37.080000    BEAM
				SGLOBAL s021          39.995000    BEAM
				SGLOBAL s022          42.910000    BEAM
				SGLOBAL s023          45.825000    BEAM
				SGLOBAL s024          48.740000    BEAM
				SGLOBAL s025          51.655000    BEAM
				SGLOBAL s026          54.570000    BEAM
				SGLOBAL s027          57.485000    BEAM
				SGLOBAL s028          60.350000    BEAM
				SGLOBAL s029          60.400000    BEAM
				SGLOBAL s030          61.100000    BEAM
				SGLOBAL s031          61.800000    BEAM
				
			STATIONS END
			
			SPOINT            s001              CSECTION   "" "wd185_zpop"
			SPOINT            s002              CSECTION   "wd185_zpop"
			SPOINT            s003              CSECTION   "wd185_zpop" "wd185_with_road"
			SPOINT      [XFTS s004   s014   1]  CSECTION   "wd185_with_road"
			SPOINT            s015              CSECTION   "wd185_with_road" "wd185_zpop"
			SPOINT            s016              CSECTION   "wd185_zpop"
			SPOINT            s017              CSECTION   "wd185_zpop" "wd185_with_road"
			SPOINT      [XFTS s018   s028   1]  CSECTION   "wd185_with_road"
			SPOINT            s029              CSECTION   "wd185_with_road" "wd185_zpop"
			SPOINT      [XFTS s030   s031   1]  CSECTION   "wd185_zpop"
			
			SPOINT      [XFTS s001   s004   1]  ZROTATE   25.00000   STRETCH
			SPOINT      [XFTS s005   s013   1]  ZROTATE    0.00000
			SPOINT      [XFTS s014   s018   1]  ZROTATE   25.00000   STRETCH
			SPOINT      [XFTS s019   s027   1]  ZROTATE    0.00000
			SPOINT      [XFTS s028   s031   1]  ZROTATE   25.00000   STRETCH
			
			SPOINT      [XFTS s001   s031   1]  YROTATE    0.00000
			
			SPOINT            s001              VARIABLE   "wyszerzenieDZ" ""                   "tab_wyszerz(\$sr)"
			SPOINT      [XFTS s002   s031   1]  VARIABLE   "wyszerzenieDZ" "tab_wyszerz(\$sr)"
			
			SPOINT      [XFTS s001   s031   1]  NODE       "1"             101   STEP     1
			SPOINT      [XFTS s001   s031   1]  NODE       "2"             201   STEP     1
			
			SPOINT      [XFTS s001   s030   1]  BEAM       "1"             101   STEP     1
			SPOINT      [XFTS s001   s030   1]  BEAM       "2"             201   STEP     1
			
			SPOINT      [XFTS s001   s030   1]  MATERIAL   "1"          "EN:C40/50"
			SPOINT      [XFTS s001   s030   1]  MATERIAL   "2"          "EN:C40/50"
			SPOINT      [XFTS s001   s030   1]  MATERIAL   "3"          "EN:C40/50"
			SPOINT      [XFTS s001   s030   1]  MATERIAL   "4"          "EN:C40/50"
			SPOINT      [XFTS s001   s030   1]  MATERIAL   "5"          "EN:C30/37"
			SPOINT      [XFTS s001   s030   1]  MATERIAL   "6"          "EN:C30/37"
			
			SPOINT      [XFTS s001   s030   1]  GROUP      "1"          ""
			SPOINT      [XFTS s001   s030   1]  GROUP      "2"          ""
			
			GRILLAGE "AUTO" BEGIN
				
				MATERIAL         "EN:C40/50"
				GROUP            ""
				CSECTION         "grillage" "ExpressionGrillage"
				ELEMS              2001     10
				MEMBER           "1"       "2"       3
				
			GRILLAGE END
			
		GIRDER END
		
		SUPPORT "Soil support 1" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1101
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.00000E+00  0.10000E+09  0.00000E+00  0.00000E+00  0.00000E+00
			
		SUPPORT END
		
		SUPPORT "Soil support 2" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1201
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.00000E+00  0.00000E+00  0.00000E+00  0.00000E+00  0.00000E+00
			
		SUPPORT END
		
		SUPPORT "Soil support 3" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1301
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.10000E+09  0.10000E+09  0.00000E+00  0.00000E+00  0.00000E+00
			
		SUPPORT END
		
		SUPPORT "Soil support 4" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1401
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.10000E+09  0.00000E+00  0.00000E+00  0.00000E+00  0.00000E+00
			
		SUPPORT END
		
		SUPPORT "Soil support 5" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1501
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.00000E+00  0.10000E+09  0.00000E+00  0.00000E+00  0.00000E+00
			
		SUPPORT END
		
		SUPPORT "Soil support 6" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1601
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.00000E+00  0.00000E+00  0.00000E+00  0.00000E+00  0.00000E+00
			
		SUPPORT END
		
		#-----------------------------------------------------------------------
		# Geometrical positions of structural members
		#-----------------------------------------------------------------------
		
		GPOSITIONS BEGIN
			
			SPRING2SMEM "Soil support 1"        CGREF   "Girder 1"      s002    BACK    "P1_left"
			SPRING2SMEM "Soil support 2"        CGREF   "Girder 1"      s002    BACK    "P2_right"
			SPRING2SMEM "Soil support 3"        CGREF   "Girder 1"      s016    BACK    "P1_left"
			SPRING2SMEM "Soil support 4"        CGREF   "Girder 1"      s016    BACK    "P2_right"
			SPRING2SMEM "Soil support 5"        CGREF   "Girder 1"      s030    BACK    "P1_left"
			SPRING2SMEM "Soil support 6"        CGREF   "Girder 1"      s030    BACK    "P2_right"
			
		GPOSITIONS END
		
		#-----------------------------------------------------------------------
		# Topological connections of structural members (Analysis)
		#-----------------------------------------------------------------------
		
		CONNECTIONS BEGIN
			
			RIGID       "Soil support 1" FRONT              TO   "Girder 1"     s002    BACK  "1"
			RIGID       "Soil support 2" FRONT              TO   "Girder 1"     s002    BACK  "2"
			RIGID       "Soil support 3" FRONT              TO   "Girder 1"     s016    BACK  "1"
			RIGID       "Soil support 4" FRONT              TO   "Girder 1"     s016    BACK  "2"
			RIGID       "Soil support 5" FRONT              TO   "Girder 1"     s030    BACK  "1"
			RIGID       "Soil support 6" FRONT              TO   "Girder 1"     s030    BACK  "2"
			
		CONNECTIONS END
		
	STRUCTURE END
	
	#---------------------------------------------------------------------------
	# Traffic definition
	#---------------------------------------------------------------------------
	
	TRAFFIC BEGIN
		
		LANESET "LaneSet 1" BEGIN
			
			TEXT       ""
			ZPOSITION  NONE              ""            3.30000
			LOADDIR    VERTICAL
			LANEDIR    MIRROR
			
			LANE       1        WIDTH                  2.75000
			
			LANE       1        TRPOS    WREL          0.66500
			
			ASSEMBLIES BEGIN
				
				ASM        *  MEMBER    "Girder 1"    BEAM  2    SGLOBAL   *              SGLOBAL   *
				
			ASSEMBLIES END
			
		LANESET END
		
		LANESET "LaneSet 2" BEGIN
			
			TEXT       ""
			ZPOSITION  NONE              ""           -2.40000
			LOADDIR    VERTICAL
			LANEDIR
			
			LANE       1        WIDTH                  2.75000
			
			LANE       1        TRPOS    WREL          0.82000
			
			ASSEMBLIES BEGIN
				
				ASM        *  MEMBER    "Girder 1"    BEAM  1    SGLOBAL   *              SGLOBAL   *
				
			ASSEMBLIES END
			
		LANESET END
		
		TRAIN "Load train 1" GENERAL BEGIN
			
			TEXT       ""
			
			ITEMS BEGIN
				
				FLOAD           40.0                       1
				DISTANCE                 1.94     1.94     1
				FLOAD           40.0                       1
				DISTANCE                 2.81     2.81     1
				FLOAD           55.0                       1
				DISTANCE                 1.38     1.38     1
				FLOAD           55.0                       1
				DISTANCE                 3.00     3.00     1
				FLOAD          110.0                       1
				DISTANCE                 1.38     1.38     1
				FLOAD          110.0                       1
				DISTANCE                 2.81     2.81     1
				FLOAD           80.0                       1
				DISTANCE                 1.94     1.94     1
				FLOAD           80.0                       1
				
			ITEMS END
			
		TRAIN END
		
	TRAFFIC END
	
	#---------------------------------------------------------------------------
	# Superposition definition
	#---------------------------------------------------------------------------
	
	SUPERPOSITION BEGIN
		
		LEADING        DISPL   UX   UY   UZ   RX   RY   RZ
		LEADING        FORCE   NX   VY   VZ   MX   MY   MZ
		
		ENVELOPE "Envelope 1" BEGIN
			
			TEXT            ""
			
			SUP    INFLINE  VERTICAL    "LaneSet 1" 1   1
			SUP    TRAIN    "Load train 1"
			
		ENVELOPE END
		
		ENVELOPE "Envelope 2" BEGIN
			
			TEXT            ""
			
			SUP    INFLINE  VERTICAL    "LaneSet 2" 1   1
			SUP    TRAIN    "Load train 1"
			
		ENVELOPE END
		
		ENVELOPE "Envelope 3" BEGIN
			
			TEXT            ""
			
			SUP    ADDENV   "Envelope 1"
			SUP    ADDENV   "Envelope 2"
			
		ENVELOPE END
		
	SUPERPOSITION END
	
	#---------------------------------------------------------------------------
	# Combination tables
	#---------------------------------------------------------------------------
	
	COMBTABLE "Combination Table 1"   GENERAL   ACTIVE BEGIN
		
		TEXT        ""
		
		HEADCOL     1     "Permanent Loads"
		HEADCOL     2     "Pre-stressing Loads"
		HEADCOL     3     "Time Effects"
		HEADCOL     4     "Variable Loads"
		HEADCOL     5     "Settlement"
		
		GROUPCOL    1     "Group 1"
		GROUPCOL    2     "Group 2"
		GROUPCOL    3     "Group 3"
		GROUPCOL    4     "Group 4"
		GROUPCOL    5     "Group 5"
		
	COMBTABLE END
	
	#---------------------------------------------------------------------------
	# Dynamics
	#---------------------------------------------------------------------------
	
	DYNAMICS BEGIN
		
		EARTHQUAKE "EQ-Event 1 - EC horizontal" ECHORIZ BEGIN
			
			TEXT          ""
			
			SPECTRUM      TABLE       "Spectrum_2"
			
			PARAM         TYPE        1
			PARAM         GROUNDTYPE  A
			PARAM         S               1.00
			PARAM         TB              0.15
			PARAM         TC              0.40
			PARAM         TD              2.00
			PARAM         Q               1.00
			PARAM         BETA            0.20
			
			DURATION          0.00
			GROUNDACC         0.00
			DAMPING       CONSTANT        5.00
			SUPRULE       SRSS
			
		EARTHQUAKE END
		
	DYNAMICS END
	
	#---------------------------------------------------------------------------
	# Construction
	#---------------------------------------------------------------------------
	
	CONSTRUCTION "Construction 1" BEGIN
		
		TEXT       ""
		DAYBEGIN   1
		OPTION     CALCULATION       ON
		OPTION     LCSUMTOT          OFF      "SUMTOT"
		OPTION     LCSUMSW           ON       "SW-SUM"        "SW"
		OPTION     LCSUMPT           OFF      "PT-SUM"        "PT"
		OPTION     LCSUMCS           OFF      "CS-SUM"        "CS"   36500    7
		OPTION     LCSUMSDL          ON       "SDL-SUM"       "SDL"
		
		PHASE "structure activation" BEGIN
			
			TEXT       ""
			DAYBEGIN   1
			HUMIDITY   75.00
			TMEAN      20.00
			
			ASSEMBLIES BEGIN
				
				ASM        1  MEMBER    "Soil support 1" UNIT  * SGLOBAL   *              SGLOBAL   *
				ASM        1  MEMBER    "Soil support 2" UNIT  * SGLOBAL   *              SGLOBAL   *
				ASM        1  MEMBER    "Soil support 3" UNIT  * SGLOBAL   *              SGLOBAL   *
				ASM        1  MEMBER    "Soil support 4" UNIT  * SGLOBAL   *              SGLOBAL   *
				ASM        1  MEMBER    "Soil support 5" UNIT  * SGLOBAL   *              SGLOBAL   *
				ASM        1  MEMBER    "Soil support 6" UNIT  * SGLOBAL   *              SGLOBAL   *
				ASM        2  MEMBER    "Girder 1"    BEAM  *    SGLOBAL   0.000000       SGLOBAL   1.400000
				ASM        2  MEMBER    "Girder 1"    BEAM  *    SGLOBAL   1.400000       SGLOBAL   30.550000
				ASM        2  MEMBER    "Girder 1"    BEAM  *    SGLOBAL   30.550000      SGLOBAL   31.250000
				ASM        2  MEMBER    "Girder 1"    BEAM  *    SGLOBAL   31.250000      SGLOBAL   60.400000
				ASM        2  MEMBER    "Girder 1"    BEAM  *    SGLOBAL   60.400000      SGLOBAL   61.800000
				ASM        3  MEMBER    "Girder 1"    ZBEAM  *   SGLOBAL   *              SGLOBAL   *
				
			ASSEMBLIES END
			
			TASKS BEGIN
				
				#task   taskname          day1     duration assembly [SKIP] additional args
				TASK    INSTSUPP             1 LOCAL    120     1           "descr=Activate bearings/springs"
				TASK    CONCRETE             1 LOCAL    120     2           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    INSTCONC             1 LOCAL    120     3           "Dshrink=0" "virtual=FALSE" "descr=Mount concrete girder"
				
			TASKS END
			
		PHASE END
		
		PHASE "sdl" BEGIN
			
			TEXT       ""
			DAYBEGIN   1
			HUMIDITY   75.00
			TMEAN      20.00
			
			ASSEMBLIES BEGIN
				
				ASM        1  MEMBER    "Girder 1"    BEAM  1    SGLOBAL   *              SGLOBAL   *
				ASM        1  MEMBER    "Girder 1"    BEAM  2    SGLOBAL   *              SGLOBAL   *
				
			ASSEMBLIES END
			
			TASKS BEGIN
				
				#task   taskname          day1     duration assembly [SKIP] additional args
				LOADCASE                   121 GLOBAL     0     1           "lc=sefl_equip" "SDL=TRUE" "descr=Load case"
					TASK LOADQY              1 LOCAL      0    ""           "uload=5" "mass=TRUE" "descr=left sidewalk"
					TASK LOADQY              1 LOCAL      0    ""           "uload=6" "mass=TRUE" "descr=right sidewalk"
					TASK LOADQY              1 LOCAL      0    ""           "uload=3" "mass=TRUE" "descr=left roadlane"
					TASK LOADQY              1 LOCAL      0    ""           "uload=4" "mass=TRUE" "descr=right roadlane"
				LOADCASE END
				
			TASKS END
			
		PHASE END
		
		PHASE "eigen" BEGIN
			
			TEXT       ""
			DAYBEGIN   1 FINAL
			HUMIDITY   75.00
			TMEAN      20.00
			
			ASSEMBLIES BEGIN
				
			ASSEMBLIES END
			
			TASKS BEGIN
				
				#task   taskname          day1     duration assembly [SKIP] additional args
				TASK    EIGEN                1 LOCAL      0    ""           "lcsum=ppp" "nmode=7" "naddv=7" "resname=eigen_res"                       \
				                                                            "xlsout=EIGEN.xlsx" "descr=Eigen calculation"
				
			TASKS END
			
		PHASE END
		
		PHASE "vert_force" BEGIN
			
			TEXT       ""
			DAYBEGIN   1 FINAL
			HUMIDITY   75.00
			TMEAN      20.00
			
			ASSEMBLIES BEGIN
				
				ASM        2  MEMBER    "Girder 1"    BEAM  1    SGLOBAL   48.740000      SGLOBAL   51.655000
				
			ASSEMBLIES END
			
			TASKS BEGIN
				
				#task   taskname          day1     duration assembly [SKIP] additional args
				LOADCASE                     1 LOCAL      0    ""           "lc=vert_force" "SDL=FALSE" "descr=Load case"
					TASK LOADFE              1 LOCAL      0     2           "Fy=-1000.000" "ez=-2.000" "lnode=0" "descr=Point load on element"
				LOADCASE END
				
			TASKS END
			
		PHASE END
		
		PHASE "trains" BEGIN
			
			TEXT       ""
			DAYBEGIN   1 FINAL
			HUMIDITY   75.00
			TMEAN      20.00
			
			ASSEMBLIES BEGIN
				
			ASSEMBLIES END
			
			TASKS BEGIN
				
				#task   taskname          day1     duration assembly [SKIP] additional args
				TASK    SUPTREE              1 LOCAL      0    ""           "env=Envelope 3" "descr=Evaluate superposition"
				
			TASKS END
			
		PHASE END
		
	CONSTRUCTION END
	
ABM END
