pfix1(L,M) :- append(L,_,M).
sfix1(L,M) :- append(_,L,M).
q1_alt(L,M) :- pfix1(L,M); sfix1(L,M).

node(L,H,R).

insert_key(K,nil,node(nil,K,nil)).
insert_key(K,node(LS,H,RS),node(NLS,H,RS)):-K<H,insert_key(K,LS,NLS).
insert_key(K,node(LS,H,RS),node(LS,H,NRS)):-K>H,insert_key(K,RS,NRS).
tt([H|T],Ttt):-sort([H|T],T2),reverse(T2,Ree),create_binary(Ree,Ttt).
create_binary([],nil).
create_binary([H|T],T1):- create_binary(T, Res), insert_key(H,Res,T1).

transpose(nil,nil).

transpose(tree(Left,Head,Right), NewTree) :-
    transpose(Left,NewLeft),
    transpose(Right,NewRight),
    NewTree = tree(NewRight,Head,NewLeft).

mirror(K,nil,node(nil,K,nil)).
mirror(K,node(LS,H,RS),node(NLS,H,RS)):-K>H,mirror(K,LS,NLS).
mirror(K,node(LS,H,RS),node(LS,H,NRS)):-K<H,mirror(K,RS,NRS).
create_mirror([],nil).
create_mirror([H|T],T1):- create_mirror(T, Res), mirror(H,Res,T1).