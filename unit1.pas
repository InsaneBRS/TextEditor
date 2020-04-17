unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  LCLIntf, ComCtrls, PopupNotifier, EditBtn, DateTimePicker, SynEdit,
  SynHighlighterCpp, SynHighlighterHTML, SynHighlighterPas, LCLTranslator,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ColorDialog1: TColorDialog;
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    Edit: TMenuItem;
    ClosePr: TMenuItem;
    CopyPr: TMenuItem;
    InsertPr: TMenuItem;
    MenuItem2: TMenuItem;
    FontPr: TMenuItem;
    Design: TMenuItem;
    MenuItem3: TMenuItem;
    FindPr: TMenuItem;
    MenuItem4: TMenuItem;
    Day: TMenuItem;
    Language: TMenuItem;
    ExitPr: TMenuItem;
    SynCppSyn1: TSynCppSyn;
    SyntCplus: TRadioButton;
    RadioGroup1: TRadioGroup;
    Russian: TMenuItem;
    English: TMenuItem;
    Night: TMenuItem;
    Standart: TMenuItem;
    Reference: TMenuItem;
    MenuItem6: TMenuItem;
    ReplaceDialog1: TReplaceDialog;
    ReplacePr: TMenuItem;
    SelectAll: TMenuItem;
    CatPr: TMenuItem;
    SaveAs: TMenuItem;
    NewPr: TMenuItem;
    SavePr: TMenuItem;
    OpenPr: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    SynEdit: TSynEdit;
    SynHTMLSyn1: TSynHTMLSyn;
    SynPasSyn1: TSynPasSyn;
    SyntHtml:TRadioButton;
    SyntPascal:TRadioButton;
    procedure CatPrClick(Sender: TObject);
    procedure ClosePrClick(Sender: TObject);
    procedure CopyPrClick(Sender: TObject);
    procedure DayClick(Sender: TObject);
    procedure DesignClick(Sender: TObject);
    procedure EnglishClick(Sender: TObject);
    procedure ExitPrClick(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);

    procedure FindPrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InsertPrClick(Sender: TObject);

    procedure FontPrClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure NightClick(Sender: TObject);
    procedure PopupNotifier1Close(Sender: TObject; var CloseAction: TCloseAction);
    procedure ReferenceClick(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
    procedure ReplacePrClick(Sender: TObject);
    procedure RussianClick(Sender: TObject);
    procedure SaveAsClick(Sender: TObject);
    procedure NewPrClick(Sender: TObject);
    procedure OpenPrClick(Sender: TObject);
    procedure SavePrClick(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure SelectAllClick(Sender: TObject);
    procedure StandartClick(Sender: TObject);
    procedure SynEditChange(Sender: TObject);
    procedure SynEditClick(Sender: TObject);
    procedure SyntCplusClick(Sender: TObject);
    procedure SyntHtmlClick(Sender: TObject);
    procedure SyntPascalClick(Sender: TObject);
    procedure TimeEdit1Change(Sender: TObject);
    procedure ToolBar1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  isSaved:Boolean;


implementation
 uses Unit2,Unit3;
{$R *.lfm}

{ TForm1 }

procedure TForm1.SavePrClick(Sender: TObject);
begin
    if (SaveDialog1.FileName = '') then
    begin
         SaveDialog1.Execute;
    end else
    begin
      SynEdit.Lines.SaveToFile(SaveDialog1.FileName);
    end;
    isSaved:=false;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin

end;

procedure TForm1.SelectAllClick(Sender: TObject);
begin
  SynEdit.SelectAll;
end;

procedure TForm1.StandartClick(Sender: TObject);
begin
  SynEdit.Color:=clGray;
end;

procedure TForm1.SynEditChange(Sender: TObject);
begin
     StatusBar1.Panels[0].Text:=IntToStr(SynEdit.CaretY);
     StatusBar1.Panels[1].Text:=DateTimeToStr(Now);
end;

procedure TForm1.SynEditClick(Sender: TObject);
begin

end;

procedure TForm1.SyntCplusClick(Sender: TObject);
begin
        if  SyntCplus.Checked=true then begin
             Form1.SynEdit.Highlighter:=SynCppSyn1;
             Form1.SynEdit.Gutter.Visible:=true;
        end;
end;

procedure TForm1.SyntHtmlClick(Sender: TObject);
begin
         if SyntHtml.Checked=true then begin
             Form1.SynEdit.Highlighter:=SynHTMLSyn1;
             Form1.SynEdit.Gutter.Visible:=true;
        end;
end;



procedure TForm1.SyntPascalClick(Sender: TObject);
begin
        if  SyntPascal.Checked=true then begin
             Form1.SynEdit.Highlighter:=SynPasSyn1;
             Form1.SynEdit.Gutter.Visible:=true;
        end;
end;


procedure TForm1.TimeEdit1Change(Sender: TObject);
begin
     //ShowMessage(DateTimeToStr(Now));
end;


procedure TForm1.ToolBar1Click(Sender: TObject);
begin

end;

procedure TForm1.OpenPrClick(Sender: TObject);
begin
    OpenDialog1.Execute;
    SaveDialog1.FileName:=OpenDialog1.FileName;
    SynEdit.Lines.LoadFromFile(SaveDialog1.FileName);
    isSaved:=False;
    //if OpenDialog1.Execute then MyFile:=OpenDialog1.FileName
end;

procedure TForm1.NewPrClick(Sender: TObject);
  begin
      SynEdit.Lines.Clear;
      OpenDialog1.FileName:='';
      isSaved:=False;
  end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.InsertPrClick(Sender: TObject);
begin
  SynEdit.PasteFromClipboard;
end;


procedure TForm1.FontPrClick(Sender: TObject);
begin
  FontDialog1.Font:= SynEdit.Font;
  if FontDialog1.Execute then SynEdit.Font:= FontDialog1.Font;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;


procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Unit2.Form2.Show;
end;

procedure TForm1.NightClick(Sender: TObject);
begin
  SynEdit.Color:=clBlack;
  SynEdit.Font.Color:= clWhite;
end;

procedure TForm1.PopupNotifier1Close(Sender: TObject;
  var CloseAction: TCloseAction);
begin

end;






procedure TForm1.ReferenceClick(Sender: TObject);
begin
  Unit3.Form3.Show;
end;

  procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
  begin
      while (pos(ReplaceDialog1.FindText,SynEdit.Text) <> 0) do
       begin
        With SynEdit do begin
           SelStart := pos(ReplaceDialog1.FindText,SynEdit.Text);
           SelEnd:= pos(ReplaceDialog1.FindText, SynEdit.Text)+Length(ReplaceDialog1.FindText);
           SelText  := ReplaceDialog1.ReplaceText;
         end;
         // При необходимости одноразовой замены завершаем цикл
         if not (frReplaceAll in ReplaceDialog1.Options) then Break;
       end;
end;

procedure TForm1.ReplacePrClick(Sender: TObject);
begin
  ReplaceDialog1.ReplaceText:= SynEdit.Text;
  if ReplaceDialog1.Execute then SynEdit.Text:= ReplaceDialog1.ReplaceText;
end;

procedure TForm1.RussianClick(Sender: TObject);
begin
  SetDefaultLang('rus');
  GetLocaleFormatSettings($419, DefaultFormatSettings);
end;

procedure TForm1.SaveAsClick(Sender: TObject);
var
  MyFile: string;
begin
     if SaveDialog1.Execute then
     begin
          MyFile:= SaveDialog1.FileName;
          SynEdit.Lines.SaveToFile(MyFile);
          isSaved:=false;
     end
end;

procedure TForm1.ClosePrClick(Sender: TObject);
var r:Integer;
begin
  if isSaved=False then
        r:=MessageDlg('MegaNotepad','Сохранить?', mtWarning,[mbYes,mbNo],0,mbYes);
  if r=6 then  begin
     if SaveDialog1.FileName ='' then begin
        if SaveDialog1.Execute then begin
              SynEdit.Lines.SaveToFile(SaveDialog1.Filename);
              end;
      end
     else begin  SynEdit.Lines.SaveToFile(SaveDialog1.FileName)end;
  end;


   OpenDialog1.FileName:='';
  SynEdit.Lines.Clear;
end;

procedure TForm1.CopyPrClick(Sender: TObject);
begin
  SynEdit.CopyToClipboard;
end;

procedure TForm1.DayClick(Sender: TObject);
begin
  //ColorDialog1.Color:=
  SynEdit.Color:=clWhite;
end;

procedure TForm1.DesignClick(Sender: TObject);
begin
  //сначала устанавливаем цвет диалога, как у Мемо:
  //ColorDialog1.Color:= SynEdit.Color;
  //если диалог прошел успешно, меняем цвет у Memo:
  //if ColorDialog1.Execute then SynEdit.Color:= ColorDialog1.Color;
end;

procedure TForm1.EnglishClick(Sender: TObject);
begin
  SetDefaultLang('en');
  //for time changing
  GetLocaleFormatSettings($409, DefaultFormatSettings);
end;

procedure TForm1.ExitPrClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TForm1.FindDialog1Find(Sender: TObject);
begin
  if pos(FindDialog1.FindText, SynEdit.Text) <> 0 then
begin
  SynEdit.HideSelection := False;
  SynEdit.SelStart := pos(FindDialog1.FindText, SynEdit.Text) ;
  SynEdit.SelEnd  := pos(FindDialog1.FindText, SynEdit.Text)+Length(FindDialog1.FindText);
end
 else MessageDlg ('Строка ' + FindDialog1.FindText + ' не найдена!', mtConfirmation, [mbYes], 0);
end;



procedure TForm1.FindPrClick(Sender: TObject);
begin
  FindDialog1.Execute;

end;

procedure TForm1.CatPrClick(Sender: TObject);
begin
  SynEdit.CutToClipboard;
end;

end.

