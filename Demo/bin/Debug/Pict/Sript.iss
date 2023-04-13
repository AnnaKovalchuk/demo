; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Shoes"
#define MyAppVersion "1.5"
#define MyAppPublisher "My Company, Inc."
#define MyAppURL "https://www.example.com/"
#define MyAppExeName "Obyv.exe"
#define MyAppAssocName MyAppName + " File"
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{DCE014E6-6DF1-4B90-8421-647398C741C3}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
ChangesAssociations=yes
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=C:\Users\Anya\Desktop\out
OutputBaseFilename=mysetup
SetupIconFile=C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\EntityFramework.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\EntityFramework.SqlServer.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\EntityFramework.SqlServer.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\EntityFramework.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Obyv.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Obyv.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\B320R5.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\D329H3.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\D364R4.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\D572U8.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\F572H7.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\F635R4.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\G432E4.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\G783F5.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\H782T5.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\icon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\J384T6.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\logo.png"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\Script.iss"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\ZZZ111.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Anya\Desktop\Obyv\Obyv\bin\Debug\Pict\�112�4.jpg"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

