:-include('TpLogico.pl').

:-begin_tests(calvos).
test("la persona es calva"):-esCalvo(samuel).
test("la persona no es calva",fail):-esCalvo(pepe).
:-end_tests(calvos).

:-begin_tests(rubios).
test("la persona es rubia"):-esRubio(pepe).
test("la persona no es rubia",fail):-esRubio(samuel).
:-end_tests(rubios).

:-begin_tests(lentes).
test("la persona tiene lentes",set(Persona = [samuel, pepe])):-tieneLentes(Persona).
test("la persona no tiene lentes",fail):-not(tieneLentes(samuel)),not(tieneLentes(pepe)).
:-end_tests(lentes).

:-begin_tests(ojosmarrones).
test("la persona tiene ojos marrones",set(Persona = [samuel, pepe])):-tieneOjosMarrones(Persona).
test("la persona no tiene ojos marrones",fail):-not(tieneOjosMarrones(samuel)),not(tieneOjosMarrones(pepe)).
:- end_tests(ojosmarrones).

:-begin_tests(cararedonda).
test("la persona tiene la cara redonda"):-not(tieneCaraRedonda(samuel)), not(tieneCaraRedonda(pepe)).
test("la persona no tiene la cara redonda",fail):-tieneCaraRedonda(samuel),tieneCaraRedonda(pepe).
:- end_tests(cararedonda).

:-begin_tests(rubiosbocachica).
test("todos los rubios de boca chica"):-rubiosBocaChica([pepe]).
test("todos los que no rubios de boca chica",fail):-rubiosBocaChica([samuel]).
:-end_tests(rubiosbocachica).

:- begin_tests(pistas).
test("persona cumple con las pistas", set(Persona = [samuel])):-cumplePistas(Persona, [pelo(blanco, lacio), boca(chica)]).
test("persona no cumple con las pistas", fail):-cumplePistas(pepe, [pelo(blanco, lacio), boca(chica)]).
:- end_tests(pistas).

:- begin_tests(ganando).
test("jugador rojo está perdiendo", fail) :-
    PistasRojo = [pelo(blanco, lacio), boca(chica)],
    PistasAzul = [pelo(rubio, rulos), boca(chica)],
    ganando(rojo, PistasRojo, PistasAzul).
test("jugador azul está ganando") :-
    PistasRojo = [pelo(blanco, lacio), boca(chica)],
    PistasAzul = [pelo(rubio, rulos), boca(chica)],
    ganando(azul, PistasAzul, PistasRojo).
:- end_tests(ganando).
