male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).
parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).
parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).
parent(selma, ling).

father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).
brother(X, Y) :- parent(P, X), parent(P, Y), male(X), X \= Y.
sister(X, Y) :- parent(P, X), parent(P, Y), female(X), X \= Y.
sibling(X, Y) :- brother(X, Y).
sibling(X, Y) :- sister(X, Y).
grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).
aunt(X, Y) :- sister(X, P), parent(P, Y).
uncle(X, Y) :- brother(X, P), parent(P, Y).
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2), X \= Y.
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

% Queries and answers
?- father(homer, bart).
% true.

?- grandfather(clancy, bart).
% true.
