@ECHO OFF
CLS

SET sDBNAME =gamedata
SET sDB_NUMAA=dbz900
SET sDB_NUMAB=dbz900

SET sSRCEDR=%cd%
SET sDESTDR=%sSRCEDR%\Content UserSource\Stalker_Vanilla\
SET sDESTTP=%sSRCEDR%\Content UserSource\Stalker_Vanilla\gamedata\

SET XRAYGAC=%sSRCEDR%\Content Interna\xCompile_Tool\converter.exe
SET XRAYVER=2947ww

REM =============================================================================== Level Sound
SET sDIR_A_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_Level_Sound\
REM =============================================================================== Deutsche Dialoge
SET sDIR_B_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\German_Dialog_Voices\
REM =============================================================================== NPC States
SET sDIR_C_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_Dialog_States\
REM =============================================================================== Texturen, High Quality
SET sDIR_D_=%sSRCEDR%\Content ANY_EP\X-Ray 1.0\Common_HQ_Textures\


SET ADD_HQMS=false
SET ADDSTATE=false

IF NOT EXIST "%XRAYGAC%" goto ERRA

Echo ....
Echo ... Gamedata Archive Creator ... Script vf.f simple
Echo ..
Echo .
ECHO ============================================================================
ECHO =                                                                          =
ECHO =               Stalker: EP1 - Schadow of Tchernobyl                       =
ECHO =               Version 1.0006                                             =
ECHO =                                                                          =
ECHO =  Beschreibung: ZusÑtze fÅr die Vanilla Version von Stalker erstellen     =
ECHO =                                                                          =
ECHO = - HQ Musik Addon (Contains ReEncoded Cs,Cop,Soc OGG Music in 500kbs)     =
ECHO =   Source is FLAC,WAV and CD (THis was a hard long search)                =
ECHO = - Deutsche NPC Status Dialoge                                            =
ECHO = - Deutsch öbersetzte Prop,Sign und Wall Texturen                         =
ECHO = - Entfernung des Runden Fadenkreuzes                                     =
ECHO = - Ein paar High Quality Texturen                                         =
ECHO =   (Hab ich erstellt, unteranderen von echten Fotos, fÅr ein              =
ECHO =   realistisches aussehen der Spielwelt)                                  =
ECHO = - Reparierte SoundEffekte (z.b Inventory, Herzklopfen etc..)             =
ECHO =   (Die UrsprÅngliche LautstÑrke betrÑgt 300.000. Wenn du dich in Kordon  =
ECHO =   aufhÑlst hîrt man dich im AKW wie du z.b dein Inventar ôffnest.        =
ECHO =   Diese 'Falsch eingestellten' Soundeffekte wurden nahezu in jeder Mod   =
ECHO =   Åbernommen.                                                            =
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
	EXPLORER.EXE "%sDESTDR%"
	GOTO ERRB

:GDEL
	DEL /S /Q "%sDESTTP%"
	RD /S /Q "%sDESTTP%"	
	IF EXIST "%sDESTDR%%sDBNAME%.%sDB_NUMA%" (DEL "%sDESTDR%%sDBNAME%.%sDB_NUMA%")
	IF EXIST "%sDESTDR%%sDBNAME%.%sDB_NUMB%" (DEL "%sDESTDR%%sDBNAME%.%sDB_NUMB%")		
	GOTO :EXTD
	
:EXIT
	EXIT

	
:EXTD
	CLS
	IF NOT EXIST "%sDESTTP%" (MD "%sDESTTP%") ELSE GOTO ERRB
	GOTO EXTD_A 
	
:EXTD_A
	REM WORKING ================================================== Deutsche Dialoge
	CD /D "%sDIR_B_%"
		XCOPY *.* "%sDESTTP%" /V /S /-Y
		
	REM WORKING ================================================== NPC States	
	CD /D "%sDIR_C_%"
		XCOPY *.* "%sDESTTP%" /V /S /-Y	
		
	REM WORKING ================================================== Texturen, High Quality	
	CD /D "%sDIR_D_%"
		XCOPY *.* "%sDESTTP%" /V /S /-Y			
	
	REM ======================= CREATE GAMEDATA ARCHIV ===================================
	CD /D "%sDESTTP%"
	"%XRAYGAC%" -pack -%XRAYVER% .\ -out "%sDESTDR%%sDBNAME%.%sDB_NUMA%"	

	
	REM WORKING = AND CREATE GAMEDATA ARCHIV ================================== Level Sound
	CD /D "%sDIR_A_%"
	XCOPY *.* "%sDESTTP%" /V /S /-Y	
	"%XRAYGAC%" -pack -%XRAYVER% .\ -out "%sDESTDR%%sDBNAME%.%sDB_NUMB%"	
	
	
	
	EXPLORER.EXE "%sDESTDR%"
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
	ECHO =     %sDBNAME%.%sDB_NUMA%                                                  =
	ECHO =     in dein Stalker verzeichnis.                                         =
	ECHO ============================================================================
	ECHO .
	ECHO ..
	ECHO ...
	ECHO ....
	PAUSE
	GOTO :EXIT