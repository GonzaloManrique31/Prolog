/* nQueens(N,Sol) is the main predicate that allows us to know the result of the operation.*/
/* createBoard(N,Board), This predicate generates a variable dimension board (N).*/
/*permute(Board,Sol), Check if Board is a permutation of the elements of Sol, the only permutation of the empty list is the empty list.*/
/* correctBoard(Sol) Check if on board Sol, no queen threatens another; whereas threatening is also understood to be threatened.*/
nQueens(N,Sol) :- createBoard(N,Board), permute(Board,Sol), correctBoard(Sol).

createBoard(0,[]).

createBoard(X,[X|R]) :- XMinus1 is X - 1, XMinus1 >= 0, createBoard(XMinus1,R).

permute([],[]).              

/*Choose(X, C, R) Check if C is an element of X and R, it is the list X without element C*/

permute(X,[C|Z]) :- choose(X,C,R), permute(R,Z).

choose([X|R],X,R).

choose([C|R],X,[C|Y]) :- choose(R,X,Y).

correctBoard([]).

correctBoard([C|R]) :- not(menace(C,R)), correctBoard(R).

/*menace(X, Y). Check if a queen placed in column X of row n of a board threatens any of the other queens placed in rows 0.n-1 of the rest of the board, and whose columns are specified in list Y.*/

menace(X,Prof,[C|_]) :- X is C+Prof;
X is C-Prof;
X = C.
menace(X,Prof,[_|R]) :- ProfPlus1 is Prof + 1, menace(X,ProfPlus1,R).
menace(_,[]) :- fail.
menace(X,Y) :- menace(X,1,Y).
