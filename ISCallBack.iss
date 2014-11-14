; -- CodeDll.iss --
;
; This script shows how to call DLL functions at runtime from a [Code] section.

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

[Files]
; Install our DLL to {app} so we can access it at uninstall time
; Use "Flags: dontcopy" if you don't need uninstall time access
Source: "dll.dll"; Flags: dontcopy nocompression

[Code]
const
  MB_ICONINFORMATION = $40;

//importing an ANSI Windows API function
function MessageBox(hWnd: Integer; lpText, lpCaption: string; uType: Cardinal): Integer;
external 'MessageBoxW@user32.dll stdcall';

type
  TTestProc = procedure(var Int: Integer);
procedure Test(Proc:TTestProc); external 'Test@files:dll.dll stdcall setuponly';

procedure CallMe(var Int: Integer);
begin
  MessageBox(0, IntToStr(Int), 'Была вызвана процедура CallMe()',  $00000000);
end;

function NextButtonClick(CurPage: Integer): Boolean;
begin
  Log (IntToStr(CurPage));
  if CurPage = wpWelcome then begin
    Test(@CallMe);
    //CallMe;
  end;
  Result := True;
end;