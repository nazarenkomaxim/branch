/*
 Алгоритм выполнения
 1. Создайте протокол Car
 2. Добавьте в него свойства:
 - model (только для чтения): марка
 - color (только для чтения): цвет
 - buildDate (только для чтения): дата выпуска
 - price (чтение и запись): цена авто
 - accessories (чтение и запись): дополнительное оборудование (тонировка, сигнализация, спортивные диски)
 isServiced (чтение и запись): сделана ли предпродажная подготовка. Обычно её делают в дилерских центрах перед постановкой машины в салон.
 */

protocol CarProtocol {
    var model: String { get }
    var color: String { get }
    var buildDate: Int { get }
    var priceUSD: Int { get set }
    var accessories: [String] { get set }
    var isServiced: Bool { get set } //возможно нужно bool
    
}


protocol DealershipProtocol {
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [String] { get set }
    var showroomCars: [String] { get set }
    var cars: [String] { get set }
    
    func offerAccesories(_: CarProtocol)
    func presaleService(_: CarProtocol)
    func addToShowroom(_: CarProtocol)
    func sellCar(_: CarProtocol)
    func orderCar()
}


struct Car: CarProtocol {
    var model: String
    var color: String
    var buildDate: Int
    var priceUSD: Int
    var accessories: [String]
    var isServiced: Bool
    
    func aboutCar() {
        print("Модель: \(model). Цвет: \(color). Дата изготовления: \(buildDate). Стоимость: \(priceUSD). Дополнительные аксессуары: \(accessories). Предпродажная подготовка: \(isServiced).\n")
    }
}


var audiA5 = Car(model: "Audi A5", color: "White", buildDate: 2021, priceUSD: 53900, accessories: ["Сигнализация"], isServiced: true)
audiA5.aboutCar()

audiA5.model = "Audi A6"
audiA5.aboutCar()

let bmw5 = Car(model: "BMW M5", color: "Black", buildDate: 2022, priceUSD: 83000, accessories: ["Сигнализация", "Спортивные диски"], isServiced: true)
bmw5.aboutCar()

let toyotaCamry = Car(model: "Toyota Camry", color: "White Pearl", buildDate: 2022, priceUSD: 39000, accessories: ["Сигнализация", "тонировка"], isServiced: false)
toyotaCamry.aboutCar()

let mercedesC = Car(model: "Mercedes Benz C class", color: "White", buildDate: 2021, priceUSD: 41000, accessories: [""], isServiced: false)
mercedesC.aboutCar()

let hondaCivic = Car(model: "Honda Civic", color: "Silver", buildDate: 2022, priceUSD: 33000, accessories: [""], isServiced: false)
hondaCivic.aboutCar()


class Dealership: DealershipProtocol {

    var name: String
    var showroomCapacity: Int
    var stockCars: [String]
    var showroomCars: [String]
    var cars: [String]
    
    init(name: String, showroomCapacity: Int, stockCars: [String], showroomCars: [String], cars: [String]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }
    
    func offerAccesories(_: CarProtocol) {
        
    }
    
    func presaleService(_: CarProtocol) {
        
    }
    
    func addToShowroom(_: CarProtocol) {
        <#code#>
    }
    
    func sellCar(_: CarProtocol) {
        <#code#>
    }
    
    func orderCar() {
        <#code#>
    }
    
    
}
