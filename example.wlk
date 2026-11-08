class Jugador{
  var antiguedad
  var cansancio = 50
  method esTitular() = antiguedad > 3
  method cansado() = cansancio > 100
  method tomar(){
    cansancio = 0.max(cansancio - 10)
  }
  method habilidad() = antiguedad *2 - cansancio
  method jugar(){
    if (self.esTitular() && !self.cansado()){
      cansancio += 20
    }
    else {
      self.error("El jugador no cumple las condiciones para jugar")
    }
  }
}
object faker{
  var antiguedad = 10
  var cansancio = 50
  var habilidad = 20
  var tilteado = false
  method esTitular() = antiguedad > 3
  method cansado() = cansancio > 100
  method tomar(){
    cansancio = 0.max(cansancio - 10)
  }
  method tomarTe(){
    tilteado = false
  }
  method habilidad(){
    if(!tilteado){
      return antiguedad *2 - cansancio
    }
    else{
      return 0
    }
  }
  method jugar(){
    if (self.esTitular() && self.cansado()){
      cansancio += 20
      habilidad += 20
    }
    else {
      self.error("Faker no cumple las condiciones para jugar")
    }
  }
}
class Equipo {
  const integrantes = []

  method agregarIntegrante(unParticipante) {
    integrantes.add(unParticipante)
  }

  method habilidad() {
    return integrantes.sum({ integrante => integrante.habilidad() })
  }

  method jugar() {
    integrantes.forEach({ integrante => integrante.jugar() })
  }
}
class Partida {
  const participanteRojo
  const participanteAzul
  var fueJugada = false
  method jugarPartida() {
    participanteRojo.jugar()
    participanteAzul.jugar()
    fueJugada = true
  }
  method ganador() {
    if (!fueJugada) {
      self.error("La partida aún no fue jugada")
    }
    if (participanteRojo.habilidad() > participanteAzul.habilidad()) {
      return participanteRojo
    } else if (participanteAzul.habilidad() > participanteRojo.habilidad()) {
      return participanteAzul
    } else {
      return participanteRojo 
    }
  }
}