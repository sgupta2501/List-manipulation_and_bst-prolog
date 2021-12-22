pfix([],_).
pfix([A|L],[A|M]) :- pfix(L,M).
sfix(L,M) :- reverse(L,LB), reverse(M,MB), pfix(LB,MB).
q1(L,M) :- pfix(L,M); sfix(L,M).
