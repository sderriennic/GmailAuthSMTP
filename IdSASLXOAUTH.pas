unit IdSASLXOAUTH;

interface

uses
  Classes,
  IdSASL
  ;

type
  TIdSASLXOAuth = class(TIdSASL)
  private
    FToken: string;
    FUser: string;
  public
    property Token: string read FToken write FToken;
    property User: string read FUser write FUser;
    class function ServiceName: TIdSASLServiceName; override;
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    function TryStartAuthenticate(const AHost, AProtocolName : String; var VInitialResponse: String): Boolean; override;
  end;

implementation

{ TIdSASLXOAuth }

class function TIdSASLXOAuth.ServiceName: TIdSASLServiceName;
begin
  Result := 'XOAUTH2';
end;

constructor TIdSASLXOAuth.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TIdSASLXOAuth.Destroy;
begin
  inherited;
end;

function TIdSASLXOAuth.TryStartAuthenticate(const AHost, AProtocolName: String; var VInitialResponse: String): Boolean;
begin
  VInitialResponse := 'user=' + FUser + Chr($01) + 'auth=Bearer ' + FToken + Chr($01) + Chr($01);
  Result := True;
end;

end.
