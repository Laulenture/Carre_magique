program carre_magique;

uses crt, math;

CONST
	tMax = 7;
	max = 49;

TYPE
	tableau2dim = array[1..tMax,1..tMax] of integer;

procedure afficher(x:integer; y:integer; tableau:tableau2dim);
	
BEGIN
    FOR x:= 1 TO 7 DO
        Begin
			for y:= 1 to 7 do
			Begin
				tableau[x,y]:=0;
				write(tableau[x,y]);
            end;
            writeln;
        end;
	end;


procedure initialisation(var nb:integer);

BEGIN
	clrscr;
	nb := 1;
END;

procedure placer(var nb, x, y:integer; tableau:tableau2dim);

BEGIN
	x := 4;
	y := 3;
	tableau[x,y] := nb;
END;

	procedure avanceGauche(var x, y, nb:integer; tableau:tableau2dim);

BEGIN
	x := x + 1;
	y := y - 1;
	IF x = 8 THEN x := 1;
	IF y = 0 THEN y := 7;
    tableau[x,y] := nb;
	END;

procedure avanceDroite(var x, y, nb:integer; tableau:tableau2dim);

BEGIN
	x := x - 1;
	y := y - 1;
	IF y = 0 THEN y := 7;
	IF x = 0 THEN x := 7;
	tableau[x,y] := nb;
	END;
	
procedure verifierVide(var x, nb, y:integer; tableau:tableau2dim);

BEGIN
	IF tableau[x+1,y-1] = 0 THEN
		avanceGauche(x, y, nb, tableau)
	ELSE
		avanceDroite(x, y, nb, tableau);
	END;


	
VAR
	nb, x, y: INTEGER;
	tableau : tableau2dim;

BEGIN
	clrscr;
	initialisation(nb);
	placer(x, y, nb, tableau);
	REPEAT
		verifierVide(x, nb, y, tableau);
	UNTIL nb = 49;
	afficher(x, y, tableau);
	readln();
END.