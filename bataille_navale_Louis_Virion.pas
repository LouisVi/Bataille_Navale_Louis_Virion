{la bataille navale notion (tab, structure,boucle,notion,procedure,fonction)
réaliser l'algo et le programme pascal de la bataille navale, vous ne devez pas utiliser de tableau à deux dimension
pour représenté la grille du jeu, utiliser un type enregistrement qu'on va appeler "cell" pour décrire les cellules occupé
par des bateaux de meme un bateau sera décris par un ensemble de cellule et la bat de bateau à couler sera représenté
par un ensemble de bateau
trvaille a faire
en 1 ecrire la structure cellule composé de 2 champs Ligne et colonne des entiers
2 ecrire la structure bateau composé d'un ensemble de N cellule
3 ecrire le type entegistrement bat composé d'un ensemble de bateau
4 ecrire une fonction/procedure de création d'une cellule elle prend en paramètre la ligne et la colonne associé a une cellule
5 ecrire une fct de comparaison de 2 cellules cette fct enverra vrai ou faux
6 ecrire une fct de création de bateau elle renvérra un type enregistrement bateau correctement remplis
7 ecrire une fct qui vérifie qu'une cellule appartien a un bateau, cette fct renverra vrai ou faux celon le cas attention
cette fonction de vérification devra utilisé votre fct de comparaison de cellule
8 ecrire une fct qui vérifie une cellule appartient à une bat de bateau attention cette fct devra utiliser votre fct
de vérification
9 ecrire la bataille navale complete
10 bonne chance
}

program bataille_navale_Louis_Virion;
uses crt;

const
	bat1=6;			// b1 signifie bateau 1
	bat2=5;
	bat3=4;
	bat4=3;
	bat5=2;
	Ncell=15;
	


type
	cell=record
	x:integer;	
end;

type
	bateau=record
	b1,b2,b3,b4,b5:integer;
end;

type
	flotte=record
	bat : array [1..Ncell,1..Ncell] of bateau;
end;



type
	grille=array [1..Ncell*Ncell] of cell;
	
procedure creation (var place:grille);
var
	i,j:integer;

begin
	for i:=1 to Ncell*Ncell do
		begin
			place[i].x:=0;
			write(place[i].x);
			if(i mod Ncell = 0) then
				writeln;
		end;
	writeln;
end;

function tire(Ttab:grille; x:integer; y:integer):boolean;
begin
	if (Ttab[(y-1)*Ncell + x].x = 1) then
	begin
		Exit(True);
    end
	else
	begin
		Exit(False);
	end;
end;

procedure place_des_bateau(var tab:grille; boat:flotte);
var
	i, j: integer;
	choixX, choixY: integer;
begin
	for i:= bat5 to bat1 do
	begin
		write('Sur quelle x voulez-vous placer le bateau de taille ', i, ': ');
		readln(choixX);
		while((choixX < 1) or (choixX > Ncell)) do
		begin
			write('La coordonnee sur X doit etre superieur ou egal a 1 et inferieur a ', Ncell, ': ');
			readln(choixX);
		end;
		
		write('Sur quelle y voulez-vous placer le bateau de taille ', i, ': ');
		readln(choixY);
		while((choixY < 1) or (choixY + i > Ncell)) do
		begin
			write('La coordonnee sur Y doit etre superieur ou egal a 1 et inferieur a ', Ncell - i + 1, ': ');
			readln(choixY);
		end;
		
		for j:= 1 to i do
		begin
			tab[(ChoixY-1)*Ncell + choixX + (j-1)*Ncell].x := 1;
		end;
	end;
	
	for i:= 1 to Ncell*Ncell do
	begin
		write(tab[i].x);
		if(i mod Ncell = 0) then
			writeln;
	end;
end;
	
function appartientAuBateau(var tab:grille; place:flotte): boolean;
var
	x, y , i: integer;
	appartientAUnBateau : boolean;
begin
	write('Coordonnee sur X de la ou tu souhaite tirer: ');
	readln(x);
	while ((x<1) or (x>Ncell)) do
	begin
		write ('non tu ne peu pas tire tu peux que tire entre 1 et ',Ncell,': ');
		readln (x);
	end;
	write ('Coordonner sur y de la ou tu souhaite tirer: ');
	readln(y);
	while ((y<1) or (y>Ncell)) do
	begin
		write ('non tu ne peut pas tire tu peux que tire entre 1 et ',Ncell,': ');
		readln (y);
	end;
	
	appartientAUnBateau := tire(tab, x, y);
	if(appartientAUnBateau) then
		begin
			writeln('toucher');
			tab[x+(y-1)*Ncell].x := 0;
		end
	else
		writeln('Cette case n''est pas une case d'' un bateau!');
end;

function Reste_Des_Bateaux(tab:grille) : boolean;
var
	i : integer;
	resteDesBateau : boolean;
begin
	resteDesBateau := false;
	for i := 1 to Ncell*Ncell do
	begin
		if(tab[i].x <> 0) then
			resteDesBateau := true;
	end;
	Exit(resteDesBateau);
End;

var
	tab: grille;
	flottex: flotte;
	
begin
    clrscr;
	creation(tab);
	place_des_bateau(tab, flottex);
	while(Reste_Des_Bateaux(tab)) do
		appartientAuBateau(tab, flottex);
	readln;
end.
