{  *************************************************************************  }
{                                                                             }
{  This Source Code Form is subject to the terms of the Mozilla Public        }
{  License, v. 2.0. If a copy of the MPL was not distributed with this file,  }
{  You can obtain one at http://mozilla.org/MPL/2.0/.                         }
{                                                                             }
{  Copyright (c) 2014, VoLT                                                   }
{                                                                             }
{  *************************************************************************  }

library ISCallBack;


uses
    System.SysUtils
  , System.Classes
  , Winapi.Windows
  ;

type
  TTestProc = procedure(var Int: Integer) of object;

procedure Test(aMethod: TMethod); stdcall;
var
  Int: Integer;
begin
  TTestProc(aMethod)(Int);
  Int := 10;
  TTestProc(aMethod)(Int);
end;

exports
   Test;


end.
