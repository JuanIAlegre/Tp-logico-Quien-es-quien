persona(samuel, lentes(negros)).
persona(samuel, pelo(blanco, lacio)).
persona(samuel, calvo).
persona(samuel, boca(chica)).
persona(samuel, cara(puntuda)).
persona(samuel, ojos(marrones)).
persona(samuel, nariz(chica)).
persona(pepe, lentes(rojos)).
persona(pepe, pelo(rubio, rulos)).
persona(pepe, boca(chica)).
persona(pepe, cara(puntuda)).
persona(pepe, ojos(marrones)).
persona(pepe, nariz(chica)).

carta(rojo, samuel).
carta(azul, pepe).

contrincante(rojo, azul).
contrincante(azul, rojo).

pista(rojo, pelo(rubio,_)).
pista(rojo, boca(chica)).

esCalvo(Persona):-persona(Persona, calvo).
esRubio(Persona):-persona(Persona, pelo(rubio,_)).
esCastanio(Persona):-persona(Persona, pelo(marron,_)).
esMorocho(Persona):-persona(Persona, pelo(negro,_)).

tieneBocaChica(Persona):-persona(Persona, boca(chica)).
tieneBocaGrande(Persona):-persona(Persona, boca(grande)).

tieneNarizChica(Persona):-persona(Persona, nariz(chica)).

tieneLentes(Persona):-persona(Persona, lentes(_)).
tieneLentes(Persona):-tieneBocaGrande(Persona), tieneNarizChica(Persona).

tieneOjosMarrones(Persona):-persona(Persona,ojos(marrones)).
tieneOjosMarrones(Persona):-esCastanio(Persona).
tieneOjosMarrones(Persona):-esMorocho(Persona).

tieneCaraRedonda(Persona):-not(persona(Persona, cara(puntuda))).

rubiosBocaChica(Personas):-findall(Persona, (esRubio(Persona), tieneBocaChica(Persona)), Personas).

jugador(Jugador):-contrincante(Jugador,_).

cumplePistas(Persona, Jugador):-
    jugador(Jugador),
    persona(Persona,_),
    forall(persona(Persona, Caracteristica), pista(Jugador, Caracteristica)).

ganando(Jugador, Contrincante):-
    cantidadPersonasEncontradas(Jugador, CantidadJugador),
    cantidadPersonasEncontradas(Contrincante, CantidadContrincante),
    CantidadJugador > CantidadContrincante.

cantidadPersonasEncontradas(Jugador, Cantidad):-
    jugador(Jugador),
    persona(Persona,_),
    findall(Persona, cumplePistas(Persona, Jugador), Personas),
    length(Personas, Cantidad).
