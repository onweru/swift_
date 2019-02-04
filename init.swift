// Failable initializer
struct Animal {
  let species: String
  init?(species: String) {
    if species.isEmpty { return nil }
    self.species = species 
  }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
  print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymouseCreature = Animal(species: "")

if anonymouseCreature == nil {
  print("The anonymouse creature could not be found")
}

// enum

enum TemperatureUnit {
  case kelvin, celsius, fahrenheit
  init?(symbol: Character) {
    switch symbol {
      case "K":
        self = .kelvin
      case "C": 
        self = .celsius
      case "F": 
        self = .fahrenheit
      default: 
        return nil
    }
  }
}

let fahrenheit = TemperatureUnit(symbol: "F")

if fahrenheit != nil {
  print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
  print("This is not a defined temperature unit, so initialization failed.")
}

// failable initializers for enums with Raw Values

enum TemperatureValue: Character {
  case kelvin = "K", celcius = "C", fahrenheit = "F"
}

let fahrenheitValue = TemperatureValue(rawValue: "F")
if fahrenheitValue != nil {
  print("This is a defined temperature value so initialization succeeded.")
}

let unknownValue = TemperatureValue(rawValue: "X")
if unknownValue == nil {
  print("This is not a defined temperature value, so initialization failed")
}

// Propagate initialization failure
class Product {
  let name: String
  init?(name: String) {
    if name.isEmpty { return nil }
    self.name = name
  }
}

class CartItem: Product {
  let quantity: Int 
  init?(name: String, quantity: Int) {
    if quantity < 1 { return nil }
    self.quantity = quantity
    super.init(name: name)
  }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
  print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
  print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
  print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
  print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
  print("Unable to initialize one unnamed product")
}