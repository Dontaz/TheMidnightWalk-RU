#define MyAppName "Русификатор для The Midnight Walk"
#define MyAppVersion "2.9 [20251203]"
#define MyAppPublisher "Dontaz"
#define MyAppURL "https://steamcommunity.com/sharedfiles/filedetails/?id=3480297954"
#define MyAppBoosty "https://boosty.to/dontaz"
#define GameName "The Midnight Walk"

[Setup]
AppId={{668F5B89-DD16-473C-AFFD-5D6E06F45470}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={code:GetGamePath}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=C:\Users\user\Desktop\Programs\Unreal Engine Modding\UnrealPak\Русификатор для игры The Midnight Walk
OutputBaseFilename=Русификатор для The Midnight Walk
SolidCompression=yes
WizardStyle=modern
UsePreviousAppDir=no
DisableDirPage=no
DirExistsWarning=no
AppendDefaultDirName=no
WizardImageFile=sidebar.bmp
WizardSmallImageFile=small.bmp
UninstallDisplayName=Удаление русификатора The Midnight Walk
UninstallFilesDir={app}\Удаление русификатора

DisableWelcomePage=no

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "C:\Users\user\Desktop\Programs\Unreal Engine Modding\UnrealPak\Русификатор для игры The Midnight Walk\Установщик\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[InstallDelete]
Type: files; Name: "{app}\TheMidnightWalk\Content\Paks\TheMidnightWalk-Windows_P.pak"

[CustomMessages]
WelcomeTitle=Вас приветствует мастер установки русификатора The Midnight Walk
WelcomeText=Этот мастер поможет вам установить русификатор (версия {#MyAppVersion}) для игры {#GameName}.%n%nАвтор перевода: {#MyAppPublisher}.%nПри публикации на сторонних ресурсах просьба указывать авторство.%n%nНажимая «Далее», вы соглашаетесь с условиями использования.
VisitLink=🌐 Найти самую актуальную версию (Steam Руководство)
BoostyLink=🧡 Поддержать автора на Boosty
DisclaimerLink=⚠️ Отказ от ответственности и условия (Читать)
DisclaimerFullText=ОТКАЗ ОТ ОТВЕТСТВЕННОСТИ:%n%n1. Данный перевод является неофициальным и фанатским. Он создан исключительно в ознакомительных целях и распространяется бесплатно. Автор не преследует коммерческих целей.%n%n2. Все права на игру принадлежат её компании-разработчику и издателю. Пожалуйста, поддержите разработчиков покупкой лицензионной копии.%n%n3. Установка, использование или модификация файлов осуществляется пользователем добровольно, по собственной инициативе и под его личную ответственность.%n%n4. Автор перевода не несёт ответственности за возможные последствия, технические неполадки или утрату данных. Используя данный материал, вы подтверждаете, что принимаете на себя все риски.
DeleteOldFile=Найден файл TheMidnightWalk-Windows_P.pak, который может конфликтовать с русификатором. Удалить его?

[Code]
var
  VisitLabel: TNewStaticText;
  BoostyLabel: TNewStaticText;
  DisclaimerLabel: TNewStaticText;

procedure OpenLink(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExec('open', ExpandConstant('{#MyAppURL}'), '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure OpenBoosty(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExec('open', ExpandConstant('{#MyAppBoosty}'), '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure ShowDisclaimerBox(Sender: TObject);
begin
  MsgBox(CustomMessage('DisclaimerFullText'), mbInformation, MB_OK);
end;

procedure LinkLabelClick(Sender: TObject);
begin
  OpenLink(Sender);
end;

procedure BoostyLabelClick(Sender: TObject);
begin
  OpenBoosty(Sender);
end;

procedure DisclaimerLabelClick(Sender: TObject);
begin
  ShowDisclaimerBox(Sender);
end;

procedure InitializeWizard;
var
  BottomMargin: Integer;
begin
  BottomMargin := ScaleY(100);

  WizardForm.WelcomeLabel1.Caption := CustomMessage('WelcomeTitle');
  WizardForm.WelcomeLabel2.Caption := CustomMessage('WelcomeText');
  
  WizardForm.WelcomeLabel2.Height := WizardForm.WelcomePage.Height - WizardForm.WelcomeLabel2.Top - BottomMargin;

  VisitLabel := TNewStaticText.Create(WizardForm);
  VisitLabel.Parent := WizardForm.WelcomePage;
  VisitLabel.Caption := CustomMessage('VisitLink');
  VisitLabel.Font.Color := clBlue;
  VisitLabel.Font.Style := [fsUnderline];
  VisitLabel.Cursor := crHandPoint;
  VisitLabel.OnClick := @LinkLabelClick;
  
  VisitLabel.Left := WizardForm.WelcomeLabel2.Left;
  VisitLabel.Top := WizardForm.WelcomeLabel2.Top + WizardForm.WelcomeLabel2.Height + ScaleY(10);
  VisitLabel.Width := WizardForm.WelcomeLabel2.Width;

  BoostyLabel := TNewStaticText.Create(WizardForm);
  BoostyLabel.Parent := WizardForm.WelcomePage;
  BoostyLabel.Caption := CustomMessage('BoostyLink');
  BoostyLabel.Font.Color := clBlue;
  BoostyLabel.Font.Style := [fsUnderline];
  BoostyLabel.Cursor := crHandPoint;
  BoostyLabel.OnClick := @BoostyLabelClick;
  
  BoostyLabel.Left := WizardForm.WelcomeLabel2.Left;
  BoostyLabel.Top := VisitLabel.Top + VisitLabel.Height + ScaleY(10);
  BoostyLabel.Width := WizardForm.WelcomeLabel2.Width;

  DisclaimerLabel := TNewStaticText.Create(WizardForm);
  DisclaimerLabel.Parent := WizardForm.WelcomePage;
  DisclaimerLabel.Caption := CustomMessage('DisclaimerLink');
  
  DisclaimerLabel.Font.Color := $00008B;
  DisclaimerLabel.Font.Style := [fsUnderline];
  DisclaimerLabel.Cursor := crHandPoint;
  DisclaimerLabel.OnClick := @DisclaimerLabelClick;
  
  DisclaimerLabel.Left := WizardForm.WelcomeLabel2.Left;
  DisclaimerLabel.Top := BoostyLabel.Top + BoostyLabel.Height + ScaleY(10);
  DisclaimerLabel.Width := WizardForm.WelcomeLabel2.Width;
end;

function GetSteamPath(): String;
var
  RegPath: String;
begin
  RegPath := '';
  if RegQueryStringValue(HKLM64, 'SOFTWARE\Valve\Steam', 'InstallPath', RegPath) then
  begin
    Result := RegPath;
    Exit;
  end;
  if RegQueryStringValue(HKLM, 'SOFTWARE\Valve\Steam', 'InstallPath', RegPath) then
  begin
    Result := RegPath;
    Exit;
  end;
  Result := ExpandConstant('{commonpf}\Steam');
end;

function GetValueFromLine(const Line: String): String;
var
  StartPos, EndPos: Integer;
  TempStr: String;
begin
  Result := '';
  TempStr := Line;
  while (Length(TempStr) > 0) and (TempStr[1] = ' ') do Delete(TempStr, 1, 1);
  StartPos := Pos('"', TempStr);
  if StartPos > 0 then
  begin
    Delete(TempStr, 1, StartPos);
    StartPos := Pos('"', TempStr);
    if StartPos > 0 then
    begin
      Delete(TempStr, 1, StartPos);
      StartPos := Pos('"', TempStr);
      if StartPos > 0 then
      begin
        Delete(TempStr, 1, StartPos);
        EndPos := Pos('"', TempStr);
        if EndPos > 0 then Result := Copy(TempStr, 1, EndPos - 1);
      end;
    end;
  end;
end;

function CheckCommonPirateLocations(): String;
var
  i: Integer;
  GamePath: String;
  CommonDirs: array[0..9] of String;
begin
  Result := '';
  CommonDirs[0] := 'C:\Games\{#GameName}';
  CommonDirs[1] := 'C:\Игры\{#GameName}';
  CommonDirs[2] := 'C:\Program Files\{#GameName}';
  CommonDirs[3] := 'C:\Program Files (x86)\{#GameName}';
  CommonDirs[4] := 'C:\{#GameName}';
  CommonDirs[5] := 'D:\Games\{#GameName}';
  CommonDirs[6] := 'D:\Игры\{#GameName}';
  CommonDirs[7] := 'D:\{#GameName}';
  CommonDirs[8] := 'E:\Games\{#GameName}';
  CommonDirs[9] := ExpandConstant('{userdesktop}\{#GameName}');
  
  for i := 0 to 9 do
  begin
    if DirExists(CommonDirs[i]) then
    begin
      Result := CommonDirs[i];
      Exit;
    end;
  end;
  
  for i := 65 to 90 do
  begin
    GamePath := Chr(i) + ':\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Games\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Игры\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Игра\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Game\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Games\Игры\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Игры\Games\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
  end;
end;

function GetGamePath(Param: String): String;
var
  DefaultPath, SteamPath, LibraryFoldersFile: String;
  GamePath, TempPath: String;
  i, LineCount: Integer;
  FileLines: TArrayOfString;
  Line: String;
begin
  SteamPath := GetSteamPath();
  DefaultPath := SteamPath + '\steamapps\common\{#GameName}';
  
  if DirExists(DefaultPath) then
  begin
    Result := DefaultPath;
    Exit;
  end;
  
  GamePath := '\home\deck\.local\share\Steam\steamapps\common\{#GameName}';
  if DirExists(GamePath) then
  begin
    Result := GamePath;
    Exit;
  end;
  
  LibraryFoldersFile := SteamPath + '\steamapps\libraryfolders.vdf';
  
  if FileExists(LibraryFoldersFile) then
  begin
    if LoadStringsFromFile(LibraryFoldersFile, FileLines) then
    begin
      LineCount := GetArrayLength(FileLines);
      for i := 0 to LineCount - 1 do
      begin
        Line := FileLines[i];
        if Pos('"path"', Line) > 0 then
        begin
          TempPath := GetValueFromLine(Line);
          if TempPath <> '' then
          begin
            GamePath := TempPath + '\steamapps\common\{#GameName}';
            StringChange(GamePath, '\\', '\');
            if DirExists(GamePath) then
            begin
              Result := GamePath;
              Exit;
            end;
          end;
        end;
      end;
    end;
  end;
  
  for i := 65 to 90 do
  begin
    GamePath := Chr(i) + ':\SteamLibrary\steamapps\common\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
    GamePath := Chr(i) + ':\Steam\steamapps\common\{#GameName}';
    if DirExists(GamePath) then begin Result := GamePath; Exit; end;
  end;
  
  GamePath := CheckCommonPirateLocations();
  if GamePath <> '' then
  begin
    Result := GamePath;
    Exit;
  end;
  
  Result := 'C:\Program Files (x86)\Steam\steamapps\common\{#GameName}';
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ConflictFile: String;
begin
  if CurStep = ssPostInstall then
  begin
    ConflictFile := ExpandConstant('{app}\TheMidnightWalk\Content\Paks\TheMidnightWalk-Windows_P.pak');
    if FileExists(ConflictFile) then
    begin
      if MsgBox(CustomMessage('DeleteOldFile'), mbConfirmation, MB_YESNO) = IDYES then
      begin
        DeleteFile(ConflictFile);
      end;
    end;
  end;
end;