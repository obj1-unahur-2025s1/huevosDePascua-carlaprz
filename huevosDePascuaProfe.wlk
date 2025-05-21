object huevoRepostero {
    method calorias() = 750
    method tieneChocolateBlanco() = true
    method tieneChocolateAmargo() = false
}   

object huevoMixto {
    method calorias() = 400 + 500 
    method tieneChocolateBlanco() = true
    method tieneChocolateAmargo() = false
}

object conejo {
    var peso = 10
    method tieneChocolateBlanco() = false
    method tieneChocolateAmargo() = true

    method calorias() = peso * 10
    method peso(unPeso) {
        peso = unPeso
    }
}

object blisterHuevitos {
    var property   cantidad = 1
    method calorias() = 100 * cantidad + cantidad.div(5)  * 150
    method tieneChocolateBlanco() = cantidad > 4
    method tieneChocolateAmargo() = false
}

object matrioshka {
   var decoracion = flor
   var huevoExtra = blisterHuevitos

   method huevoExtra(unHuevo){
     huevoExtra = unHuevo
   }

   method cambiarDecoracion(){
     decoracion = decoracion.cambiar()
   }

   method calorias() = 3000  + decoracion.calorias() + huevoExtra.calorias()
   method tieneChocolateBlanco() = huevoExtra.tieneChocolateBlanco()
   method tieneChocolateAmargo() = true
}

object arbol{
    method calorias() = 150
    method cambiar() = flor
}

object flor{
    var cantidadDePetalos = 7
    method cambiar() = arbol

    method calorias() = cantidadDePetalos *100 

    method cantidadDePetalos(unaCantidad){
        cantidadDePetalos = unaCantidad
    }
}


object caceria {
    const huevosEscondidos = []
    method agregarHuevos(unaListadeHuevos){huevosEscondidos.addAll(unaListadeHuevos)}
    method huevosEscondidos() = huevosEscondidos.size()

    method encontrarHuevo(unaPersona, unHuevo){
        if(self.aunNofueEncontrado(unHuevo)) {
            unaPersona.comer(unHuevo)
            huevosEscondidos.remove(unHuevo)
        }
    }

    method encontrarElPrimerHuevo(unaPersona){
        if( !huevosEscondidos.isEmpty()) {         
            self.encontrarHuevo(unaPersona, huevosEscondidos.first())
        } 
    }

    method encontrarHuevosRestante(unaPersona){
        if( not huevosEscondidos.isEmpty()) {
            huevosEscondidos.forEach({unHuevo => self.encontrarHuevo(unaPersona, unHuevo)})
        }
    }

    method cantidadDeHuevosBlancos() = self.cualesHuevosBlancos().size()
    method aunNofueEncontrado(unHuevo) = huevosEscondidos.constains(unHuevo)

    method cualesHuevosBlancos(){
        return huevosEscondidos.filter({h => h.tieneChocolateBlanco()})
    }
}



object ana {
  const huevosQueComio = []  
  method comer(unHuevo) {
    huevosQueComio.add(unHuevo)
  }

  method estaEnfermo() = self.caloriasConsumidas() > 5000 || self.comioDeChocoBlanco()
  method caloriasConsumidas() = huevosQueComio.sum({h=> h.calorias()})
  method comioDeChocoBlanco() = huevosQueComio.any({h=> h.tieneChocolateBlanco()}) 
}

object jose {
  var ultimoHuevo = null
  method comer(unHuevo){
    ultimoHuevo = unHuevo
  }
  method estaEnfermo() = ultimoHuevo.tieneChocolateNegro()
}


object tito {
    method comer(unHuevo){}
    method estaEnfermo() = false
}