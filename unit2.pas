unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Memo1: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);

  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }


procedure TForm2.FormActivate(Sender: TObject);
begin


end;

procedure TForm2.Memo1Change(Sender: TObject);
begin

end;

end.

