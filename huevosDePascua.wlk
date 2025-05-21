object huevoRepostero {
    method calorias() = 750
    method tieneChocolateBlanco() = true
    method tieneChocolateConLeche() = false
    method tieneChocolateAmargo() = false
}   

object huevoMixto {
    method calorias() = 400 + 500 
    method tieneChocolateBlanco() = true
    method tieneChocolateConLeche() = true
    method tieneChocolateAmargo() = false
}

object conejo {
    var peso = 10
    method calorias() = peso * 10
    method tieneChocolateBlanco() = false
    method tieneChocolateConLeche() = false
    method tieneChocolateAmargo() = true

  
    method peso(unPeso) {
        peso = unPeso
    }
}

object blisterHuevitos {
    const cantidadHuevitosLeche = 14

    method cantidadDeHuevosBlanco() =  cantidadHuevitosLeche.div(5)
    method caloriasDeHuevitosBlanco() = self.cantidadDeHuevosBlanco() * 150
    method caloriasDeHuevitosLeche() = cantidadHuevitosLeche * 100

    method calorias() = self.caloriasDeHuevitosLeche() + self.caloriasDeHuevitosBlanco()

    method tieneChocolateBlanco() = self.caloriasDeHuevitosBlanco() > 0
    method tieneChocolateConLeche() = true
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
   method tieneChocolateConLeche() = true
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
    
    method agregarHuevo(unHuevo){
        huevosEscondidos.add(unHuevo)
    }

    method encontrarHuevo(unaPersona, unHuevo){
        if(huevosEscondidos.contains(unHuevo)) {
            huevosEscondidos.remove(unHuevo)
            unaPersona.comer(unHuevo)
        }        
    }

    method encontrarHuevoElPrimerHuevo(unaPersona){
        if(huevosEscondidos.size() > 0) {
            const unHuevo = huevosEscondidos.first()
            huevosEscondidos.remove(unHuevo)
            unaPersona.comer(unHuevo)
        }        
    }

    method encontrarHuevosRestante(unaPersona){
        if(huevosEscondidos.size() > 0) {
            huevosEscondidos.forEach({unHuevo => unaPersona.comer(unHuevo)})
            huevosEscondidos.clear()
            
        }
    }

    method huevosEscondidos() = huevosEscondidos.size()

    method cantidadDeHuevosBlancos() = huevosEscondidos.count({huevo => huevo.tieneChocolateBlanco()})

    method fueEncontrado(unHuevo) = not huevosEscondidos.constains(unHuevo)

}