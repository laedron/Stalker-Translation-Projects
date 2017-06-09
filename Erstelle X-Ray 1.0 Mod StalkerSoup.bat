@ECHO OFF
CLS

REM MOD: TecnoBacon StalkerSoup v1.00012+	
	
SET sDBMOD_=Stalkersoup (De)
SET sDBNAME=gamedata
SET sDB_NUMA=dbz900
SET sDB_NUMB=dbz901

SET sSRCEDR=%cd%
SET sDESTDR=%sSRCEDR%\Content UserSource\%sDBMOD_%
SET sDESTTP=%sSRCEDR%\Content UserSource\%sDBMOD_%\gamedata\

SET XRAYGAC=%sSRCEDR%\Content Interna\xCompile_Tool\converter.exe
SET XRAYVER=2947ww

SET sCSTYLE=Style_Stalker_A
SET sGINDIK=Opt_WideScreen_Grenade_SOC

	REM =============================================================================== Level Sound
	SET sDIR_A_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_Level_Sound\
	REM =============================================================================== Deutsche Dialoge
	SET sDIR_B_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\German_Dialog_Voices\
	REM =============================================================================== NPC States
	SET sDIR_C_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_Dialog_States\
	REM =============================================================================== Texturen, High Quality
	SET sDIR_D_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_HQ_Textures\
	REM =============================================================================== Texturen, German
	SET sDIR_E_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\German_Translated_Textures\
	REM =============================================================================== Sound Effects
	SET sDIR_F_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_Sound_Effekts\
	REM =============================================================================== Fonts_2K, Using Mod
	REM SET sDIR_G_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_Fonts_2K\
	REM =============================================================================== Fonts_4K
	SET sDIR_H_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_Fonts_4K\
	REM =============================================================================== Disable Circle
	SET sDIR_I_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_Optional\Opt_Circle_Cursor\
	REM =============================================================================== Style Cursor
	SET sDIR_J_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_Optional\Opt_Cursors\%sCSTYLE%\gamedata\
	REM =============================================================================== Hud, Grenade Indikator 
	SET sDIR_K_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_Optional\%sGINDIK%\


	REM =============================================================================== Main Mod Folder 	
	SET sDIR_MOD_MAIN=%sSRCEDR%\Content EP2_SOC_In_Progress\EP1 SC, Narodnaya Soljanka
	REM =============================================================================== Mod Folder 	
	SET sDIR_MOD_GAME=%sDIR_MOD_MAIN%\SOM, Tecnobacon Stalkersoup v1.10010\
	SET sDIR_MOD_DATA=%sDIR_MOD_MAIN%\SOM, Tecnobacon Stalkersoup v1.10010\Gamedata\
	SET sDIR_MOD_FONT=%sDIR_MOD_MAIN%\SOM, Tecnobacon Stalkersoup v1.10010\Gamedata_Fonts\
	
SET ADD_HQMS=false
SET ADDSTATE=false

IF NOT EXIST "%XRAYGAC%" goto ERRA

Echo ....
Echo ... Gamedata Archive Creator ... Script vf.f simple
Echo ..
Echo .
ECHO ============================================================================
ECHO =                                                                          =
ECHO =               Stalker: EP1 - Shadow of Chernobyl                         =
ECHO =               TecnoBacon StalkerSoup v1.00012+                           =
ECHO =                                                                          =
ECHO =  Beschreibung: Deutsche öbersetzung Inc. ZusÑtze                         =
ECHO =                                                                          =
ECHO = - Deutsche Texte                                                         =
ECHO = - Nanosuit Anzug Dialoge (Deutsch) und Effekte                           =
ECHO = - SoulCube Erweiterungen Sound Effekte                                   =
ECHO = - HQ Musik Addon (Contains ReEncoded Cs,Cop,Soc OGG Music in 500kbs)     =
ECHO =   Source is FLAC,WAV und CD (This was a hard long search)                =
ECHO = - Deutsche NPC Status Dialoge                                            =
ECHO = - Deutsch öbersetzte Prop,Sign und Wall Texturen                         =
ECHO = - Entfernung des Runden Fadenkreuzes                                     =
ECHO = - Ein paar High Quality Texturen                                         =
ECHO =   (Hab ich erstellt, unteranderen von echten Fotos, fÅr ein              =
ECHO =   realistisches aussehen der Spielwelt)                                  =
ECHO = - Reparierte SoundEffekte (z.b Inventory, Herzklopfen etc..)             =
ECHO =   Diese 'Falsch eingestellten' Soundeffekte wurden nahezu in jeder Mod   =
ECHO =   Åbernommen.                                                            =
ECHO = - Saubere Schrift fÅr 2k und Optional fÅr 4K (grîsere Auflîsungen)       =
ECHO = - Neuer Maus Curser/ Entfernung des Circle Cursors                       =
ECHO = - Grenade Widescreen Hud Inidikator Fix                                  =
ECHO = - énderungen im Save Dialog fÅr Schreibfaule                             =
ECHO =                                                                          =
ECHO = PS: Alles kann optional GewÑhlt werden (WÑhle dafÅr Erweitert)           =
ECHO ============================================================================
ECHO .
ECHO ..
ECHO ...
ECHO ....
CHOICE /C EA /N /M "Erstelle Gamedata Archive? DrÅcke [E]=Erstellen / [A]=Abbruch"
IF %ERRORLEVEL%==1 goto EXTD
IF %ERRORLEVEL%==2 goto EXIT


:ERRA
	ECHO ....
	ECHO ... eRROR
	ECHO ..
	ECHO .
	ECHO ============================================================================
	ECHO =                                                                          =
	ECHO =                X-Ray Game Asset Converter nicht gefunden                 =
	ECHO =                                                                          =
	ECHO ============================================================================
	ECHO .
	ECHO ..
	ECHO ...
	ECHO ....
	ECHO SuchPfad:
	ECHO %XRAYGAC% 
	ECHO ............................................................................
	PAUSE
	GOTO :EXIT
	
:ERRB
	CLS
	ECHO ....
	ECHO ... fRAGE..? O_o
	ECHO ..
	ECHO .
	ECHO ============================================================================
	ECHO =                                                                          =
	ECHO =           Das Gamedata Verzeichnis Existiert im ZielOrdner               =
	ECHO =                                                                          =
	ECHO ============================================================================
	ECHO .
	ECHO ..
	ECHO ...
	ECHO ....
	ECHO ............................................................................
	CHOICE /C LWMA /N /M "Gamedata [L]=Lîschen? / [W]=Wah? / [M]=Mach weider / [A]=Abbruch"
	IF %ERRORLEVEL%==1 goto GDEL
	IF %ERRORLEVEL%==2 goto GEXP
	IF %ERRORLEVEL%==3 goto EXTD_A
	IF %ERRORLEVEL%==4 goto EXIT	

	
:GEXP
	EXPLORER.EXE "%sDESTDR%\"
	GOTO ERRB

:GDEL
	DEL /S /Q "%sDESTTP%"
	RD /S /Q "%sDESTTP%"	
	IF EXIST "%sDESTDR%\%sDBNAME%.%sDB_NUMA%" (DEL /S /Q "%sDESTDR%\%sDBNAME%.%sDB_NUMA%")
	IF EXIST "%sDESTDR%\%sDBNAME%.%sDB_NUMB%" (DEL /S /Q "%sDESTDR%\%sDBNAME%.%sDB_NUMB%")
	IF EXIST "%sDESTDR%\StalkerSoup (De).exe" (DEL /S /Q "%sDESTDR%\StalkerSoup (De).exe")		
	GOTO :EXTD
	
:EXIT
	EXIT

	
:EXTD
	CLS
	IF NOT EXIST "%sDESTTP%" (MD "%sDESTTP%") ELSE GOTO ERRB
	GOTO EXTD_A 
	
:EXTD_A
	REM WORKING ========================================================= Deutsche Dialoge
	CD /D "%sDIR_B_%"
		XCOPY *.* "%sDESTTP%" /V /S /X
	REM WORKING =============================================================== NPC States	
	CD /D "%sDIR_C_%"
		XCOPY *.* "%sDESTTP%" /V /S /Y
	REM WORKING =================================================== Texturen, High Quality	
	CD /D "%sDIR_D_%"
		XCOPY *.* "%sDESTTP%" /V /S /Y			
	REM WORKING ========================================================= Texturen, German	
	CD /D "%sDIR_E_%"
		XCOPY *.* "%sDESTTP%" /V /S /Y	
	REM WORKING ============================================================ Sound Effects
	CD /D "%sDIR_F_%"
		XCOPY *.* "%sDESTTP%" /V /S /Y		
	REM WORKING ============================================================ Disable Circle
	CD /D "%sDIR_I_%"
		XCOPY *.* "%sDESTTP%" /V /S /Y	
	REM WORKING ============================================================== Style Cursor
	CD /D "%sDIR_J_%"
		XCOPY *.* "%sDESTTP%" /V /S /Y			
	REM WORKING ================================================ Hud, Grenade Indikator Fix
	CD /D "%sDIR_K_%"
		XCOPY *.* "%sDESTTP%" /V /S /Y			
	
	REM WORKING MOD FOLDER ===================================== MOD MOD MOD MOD MOD MOD MOD
	CD /D "%sDIR_MOD_DATA%"
		XCOPY *.* "%sDESTTP%" /V /S /Y	
		
	REM WORKING MOD FOLDER ===================================== REMOVE Unused Stuff		
	IF EXIST "%sDESTTP%\config\text\DialogEdEx.exe" (DEL /S /Q "%sDESTTP%\config\text\DialogEdEx.exe")
	IF EXIST "%sDESTTP%\config\text\DialogEdEx.asc" (DEL /S /Q "%sDESTTP%\config\text\DialogEdEx.asc")
	IF EXIST "%sDESTTP%\config\text\des\" (DEL /S /Q "%sDESTTP%\config\text\des")	
	IF EXIST "%sDESTTP%\config\text\des\" (RD /S /Q "%sDESTTP%\config\text\des")	
	
	REM WORKING MOD FOLDER ===================================== MOD MOD MOD MOD MOD MOD MOD
	XCOPY "%sDIR_MOD_GAME%StalkerSoup (De).exe" "%sDESTDR%\" /V /S /Y			
	
		
	CLS
	ECHO ....
	ECHO ... 
	ECHO ..
	ECHO .
	ECHO ============================================================================
	ECHO =                                                                          =
	ECHO =       4K Fonts Nutzen ? (Schriftsatz fÅr grosse Auflîsungen)             =	
	ECHO =                                                                          =
	ECHO =       Wird Stalker "Standard mÑssig" in einer Aufîsung gestartet         =	
	ECHO =       die grîsser ALS 1920x1080 ist?. Z.b 3840x2160                      =
	ECHO =                                                                          =
	ECHO ============================================================================
	ECHO .
	ECHO ..
	ECHO ...
	ECHO ....
	ECHO ............................................................................
	CHOICE /C 24 /N /M "DrÅcke [2]=bis zu 1920x1080 / [4]=Grîsser als 1920x1080"	
	IF %ERRORLEVEL%==1 SET sDIR_FONTS_=%sDIR_MOD_FONT%
	IF %ERRORLEVEL%==2 SET sDIR_FONTS_=%sDIR_H_%
	
	REM WORKING ================================================================= Fonts_2K/4K
	CD /D "%sDIR_FONTS_%"
		XCOPY *.* "%sDESTTP%" /V /S /Y	

		

	
	CLS
	ECHO ....
	ECHO ... 
	ECHO ..
	ECHO .
	ECHO ============================================================================
	ECHO =                                                                          =
	ECHO =                Erstelle Gemdata Archive                                  =
	ECHO =                - %sDBNAME%.%sDB_NUMA%                                         =
	ECHO =                - %sDBNAME%.%sDB_NUMB%                                         =	
	ECHO =                                                                          =
	ECHO =                                                  Please Wait             =	
	ECHO ============================================================================
	ECHO .
	ECHO ..
	ECHO ...
	ECHO ....
	ECHO ............................................................................
		
	REM ======================= CREATE GAMEDATA ARCHIV ===================================
	CD /D "%sDESTTP%"
		"%XRAYGAC%" -pack -%XRAYVER% .\ -out "%sDESTDR%\%sDBNAME%.%sDB_NUMA%"	
	
	REM WORKING = AND CREATE GAMEDATA ARCHIV ================================= Level Sound
	CD /D "%sDIR_A_%"
		XCOPY *.* "%sDESTTP%" /V /S /Y	
		"%XRAYGAC%" -pack -%XRAYVER% .\ -out "%sDESTDR%\%sDBNAME%.%sDB_NUMB%"
	
	REM ================================= FINISHED ========================================	
	EXPLORER.EXE "%sDESTDR%\"
	GOTO :ENDSHOW	

:ENDSHOW
	CLS
	ECHO ....
	ECHO ... 0deR d!e qUal der wAhL..
	ECHO ..
	ECHO .
	ECHO ============================================================================
	ECHO =                                                                          =
	ECHO =     Alles klar!                                                          =
	ECHO =     Nun sollte sich der Explorer mit dem Verzeichnis geîffnet haben      =
	ECHO =     Du hast 2 Optionen                                                   =
	ECHO =                                                                          =	
	ECHO 1                                                                          =	
	ECHO =     Entweder du nutzt NUR das gamedata verzeichnis. In diesem Fall       =
	ECHO =     Kopierst du das "GAMEDATA" Verzeichnis in dein Stalker verzeichnis.  =
	ECHO =                                                                          =
	ECHO 2                                                                          =	
	ECHO =     oder Du kopierst NUR das Gamedata Archiv                             =	
	ECHO =                                                                          =	
	ECHO =     %sDBNAME%.%sDB_NUMA%                                                      =
	ECHO =     %sDBNAME%.%sDB_NUMB%                                                      =	
	ECHO =                                                                          =	
	ECHO =     in dein Stalker verzeichnis.                                         =
	ECHO ============================================================================
	ECHO .
	ECHO ..
	ECHO ...
	ECHO ....
	PAUSE
	GOTO :EXIT