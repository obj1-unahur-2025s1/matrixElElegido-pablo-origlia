object nave {
  const pasajeros = #{neo, morfeo, trinity}
  
  method cuantosPasajerosHay() = pasajeros.size()
  
  method pasajeroDeMayorVitalidad() = pasajeros.max({ p => p.vitalidad() })
  
  method pasajeroDeMenorVitalidad() = pasajeros.min({ p => p.vitalidad() })
  
  method estaEquilibrada() = self.pasajeroDeMayorVitalidad().vitalidad() < (self.pasajeroDeMenorVitalidad().vitalidad() * 2)
  
  method estaElElegido() = pasajeros.any({ p => p.esElElegido() })
  
  method chocar() {
    pasajeros.forEach({ p => p.saltar() })
    pasajeros.clear()
  }
  
  method acelarar() {
    pasajeros.filter({ p => not p.esElElegido() }).forEach({ p => p.saltar() })
    pasajeros.remove(neo)
  }
}

object neo {
  var energia = 100
  
  method esElElegido() = true
  
  method saltar() {
    energia *= 0.5
  }
  
  method vitalidad() = energia * 0.1
}

object morfeo {
  var vitalidad = 8
  var estaDescansado = true
  
  method esElElegido() = false
  
  method saltar() {
    estaDescansado = not estaDescansado
    
    vitalidad = (vitalidad - 1).max(0)
  }
  
  method vitalidad() = vitalidad
}

object trinity {
  method esElElegido() = false
  
  method vitalidad() = 0
  
  method saltar() {
    
  }
}