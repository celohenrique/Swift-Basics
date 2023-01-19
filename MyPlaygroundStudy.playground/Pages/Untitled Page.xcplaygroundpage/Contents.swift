import UIKit

//MARK: - Sample Values
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 4

let label = "This width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

let quatation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit"
"""

var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

//MARK: - Begin Control Flow
let individualScore = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScore {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optinalString: String? = "Hello"
print(optinalString == nil)

var optinalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optinalName {
    greeting = "Hello, \(name)"
}

let nickname: String? = nil
let fullName: String = "John Apllessed"
let informalGreeting = "Hi \(nickname ?? fullName)"

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a long.")
case "cucumbe", "watercress":
    print("That wold make a good tea sandwich.")
case let x where x.hasSuffix("pepeer"):
    print("Is is a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 11, 13],
    "Fibtonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
var key = ""
for (_key, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            key = _key
        }
    }
}
print(largest)
print(key)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

var newTotal = 0
for i in 0...4 {
    newTotal += i
}
print(newTotal)


//MARK: - Begin Funções e Closures
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet(person: "Bob", day: "Tuesday")

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet("John", on: "Wednesday")

func calculateStatics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statitics = calculateStatics(scores: [5, 3, 100, 3, 9])
print(statitics.sum)
print(statitics.2)

func returnFiftem() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFiftem()

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

numbers.map({ (number: Int) -> Int in
    let resut = 3 * number
    return resut
})

let mapperNumbers = numbers.map({ number in 3 * number })
print(mapperNumbers)

let sortedNumber = numbers.sorted { $0 > $1 }
print(sortedNumber)


//MARK: -  Objects e Class
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//MARK: - Superclass
class NamedShape {
    var numberOfSides: Int = 0
    let name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var namedShape = NamedShape(name: "shape")
namedShape.numberOfSides = 7
var namedShapeDescription = namedShape.simpleDescription()

//MARK: - Subclass
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let square = Square(sideLength: 5.2, name: "my test square")
square.area()
square.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }

    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

//MARK: - Enums e Structures
enum Rank: Int {
    case ace = 1
    case two, three, four, five, fix, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let heart = Suit.hearts
let heartDescription = heart.simpleDescription()

enum ServerReponse {
    case result(String, String)
    case failure(String)
}
let success = ServerReponse.result("6:00 am", "8:00 pm")
let error = ServerReponse.failure("Out of cheese")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Error... \(message)")
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//MARK: - Difference beteween Class Struct
class GoogleSheet {
    var author: String
    init(author: String) {
        self.author = author
    }
}
let file = GoogleSheet(author: "Pedro")
let fileChanged = file
fileChanged.author = "João"
print(file.author)

struct Excel {
    var author: String
}
let fileExcel = Excel(author: "Pedro")
var fileExcelChanged = fileExcel
fileExcelChanged.author = "João"
print(fileExcel.author)



//MARK: - Protocols e Extensions
protocol ExampleProtocol {
    var simpleDescritpion: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescritpion: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescritpion += " Now 100% adjusted"
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescritpion

struct SimpleStructure: ExampleProtocol {
    var simpleDescritpion: String = "A simple strucre"
    mutating func adjust() {
        simpleDescritpion += " (adjusted)"
    }

}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescritpion

extension Int: ExampleProtocol {
    var simpleDescritpion: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescritpion)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescritpion)




//MARK: - Error Handling
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printResponse)
} catch {
    print(error)
}

do {
    let printResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergentheler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

var fridgeIsOpen = false
var fridgeContent = ["milk, eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)



//MARK: - Generics
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {

    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }

    return false
}
anyCommonElements([1, 2, 3], [3])




//MARK: -  Data Structres

//MARK: - array



//MARK: - Sets = Um set armazena valores distintos (do mesmo tipo) em uma coleção sem ordem definifa.
//exemplo: Um array com alguns valores, ao usar o insert para inserir um valor dentro do array, o set colocará o valor em qualquer local, sem um ordem definifa.

var musicGenresSet: Set<String> = ["Rock", "Rap", "MPB"]
var auxMusicGenresSet = Set<String>()
//adicionando elemento no set
auxMusicGenresSet.insert("Rapi")
print(auxMusicGenresSet)

//Retorna um novo set com os elementos em comum entre os dois sets, faz a interseccao entre dois arrays
let intersectionSet = auxMusicGenresSet.intersection(musicGenresSet)
print(intersectionSet)

//retorna um novo set com a uniao entre dois sets, se tiver elementos iguais eles nao serao repetidos.
let unionSet = auxMusicGenresSet.union(musicGenresSet)

// retornar um novo set com a diferenca entre um array e outro

let diffSet = musicGenresSet.subtracting(auxMusicGenresSet)

//retornar um bool caso os arrays possuam algum elemento em comum
let isDisjoint = auxMusicGenresSet.isDisjoint(with: musicGenresSet)

//retorna se um array esta contido no outro
let isSubset = auxMusicGenresSet.isSubset(of: musicGenresSet)

//MARK: - Dicionarios
//um dicionario armazena uma associacao entre chaves (do mesmo tipo) e valores (do mesmo tipo) em uma colecao nao ordenada. cada valor é associado com uma chave unica. chave:valor, valores podem ser iguais podem chaves devem ser unicas

var intName: [Int: String] = [:]

var countryNames: [String:String] = ["BR":"Brasil"]

//adiconando valores no dicionario, caso o valor da chave ja exista o valor sera atualizado

intName[1] = "um"
intName[2] = "dois"

//retorna uma colecao com chaves do dicionario

print(intName.keys)

//retorna um colecao com os valores do dicionario
print(intName.values)

//acesso ao valor associado a chave
print(intName[1] ?? "o dic nao possui a chave acessada")

//MARK: - metodos de busca e filtros

struct Person {
    var name: String
    var age: Int
}

let myName = "João"

let people = [Person(name: "João", age: 21), Person(name: "Bia", age: 34), Person(name: "Pedro", age: 12), Person(name: "Alice", age: 8)]

for person in people {
    if person.name == "João" {
        print(person)
    }
}

// Recupera o primeiro elemento da coleção que satisfaz a condição
let me = people.first(where: {$0.name == myName})
print(me ?? "Não estou no array")

// Retorna se a coleção possui alguém com idade maior que 18
let hasAdult = people.contains(where: {$0.age >= 18})
print(hasAdult)

// Retorna uma nova coleção com os elementos da condição incial que satisfazem a condição
let adults = people.filter({$0.age > 18})
print(adults)


//Pilhas
//operacoes basicas em uma pilha
//push(): insere um elemento no topo
//pop(): retira um elemento do topo
//top(): observa o topo retorna o elemento do topo sem modificar
//isempty checa se pilha esta vazia

import Foundation

struct StringStack {
    private var array = [String]()

    mutating func push(item: String) {
        array.append(item)
    }

    mutating func pop() -> String? {
        return array.popLast()
    }

    func top() -> String? {
        return array.last
    }

    var isEmpty: Bool {
        return array.isEmpty
    }
}

var stack = StringStack()

print(stack.isEmpty)

stack.push(item: "firstItem")

print(stack.top() ?? "Pilha vazia")

stack.push(item: "secondItem")

print(stack.top() ?? "Pilha vazia")

stack.pop()

print(stack.top() ?? "Pilha vazia")

print(stack.isEmpty)

let numbers23 = [2, 34, 54, 192, 8, 13, 15]
let x = numbers23.filter{$0 >= 20}
print(x)

//fila


struct StringQueue {
    
    var items: [String] = []
    
    mutating func enqueue(element: String) {
        items.append(element)
    }
    
    mutating func dequeue() -> String?  {
        
        if items.isEmpty {
            return nil
        } else {
            let tempElement = items.first
            items.remove(at: 0)
            return tempElement
        }
    }
    
    func peek() -> String? {
        return items.first
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
}


//lista

//class Node {
//    var value: String
//    var next: Node?
//
//    init(value: String) {
//        self.value = value
//    }
//}
//
//class SimpleLinkedList {
//
//    private var head: Node?
//    private var tail: Node?
//
//    public var isEmpty: Bool {
//        return head == nil
//    }
//
//    public var first: Node? {
//        return head
//    }
//
//    public var last: Node? {
//        return tail
//    }
//
//    public func append(value: String) {
//        let newNode = Node(value: value)
//        if let tailNode = tail {
//            tailNode.next = newNode
//        }
//        else {
//            head = newNode
//        }
//        tail = newNode
//    }
//
//    public func nodeAt(index: Int) -> Node? {
//        if index >= 0 {
//            var node = head
//            var i = index
//            while node != nil {
//                if i == 0 { return node }
//                i -= 1
//                node = node!.next
//            }
//        }
//        return nil
//    }
//
//
//    public func removeAll() {
//      head = nil
//      tail = nil
//    }
//
//    public func remove(node: Node) {
//        var current = self.head
//        var previous: Node? = nil
//
//        while current != nil {
//
//            if current?.value == node.value {
//
//                if previous != nil {
//                    if current?.value == self.tail?.value {
//                        self.tail = previous
//                    }
//                    previous?.next = current?.next
//
//                } else {
//
//                    if current?.value == self.tail?.value {
//                        self.tail = previous
//                    }
//                    self.head = current?.next
//                }
//            }
//
//            previous = current
//            current = current?.next
//        }
//    }
//}


//lista dupla

class Node {
    var value: String
    var next: Node?
    weak var previous: Node?
    
    init(value: String) {
        self.value = value
    }
}

class DoubleLinkedList {
    
    private var head: Node?
    private var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        return tail
    }
    
    public func append(value: String) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
        else {
            head = newNode
        }
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }

    
    public func removeAll() {
      head = nil
      tail = nil
    }
    
    public func remove(node: Node) -> String {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

//arvore
import Foundation

indirect enum StringBinaryTree {
  case empty
  case node(StringBinaryTree, String, StringBinaryTree)
}

// folhas
let leafD = StringBinaryTree.node(.empty, "D", .empty)
let leafE = StringBinaryTree.node(.empty, "E", .empty)
let leafF = StringBinaryTree.node(.empty, "F", .empty)
let leafG = StringBinaryTree.node(.empty, "G", .empty)

// nós intermediários
let nodeB = StringBinaryTree.node(leafD, "B", leafE)
let nodeC = StringBinaryTree.node(leafF, "C", leafG)

// raiz
let tree = StringBinaryTree.node(nodeB, "A", nodeC)


extension StringBinaryTree: CustomStringConvertible {
  var description: String {
    switch self {
    case let .node(left, value, right):
      return "value: \(value),\n left = [" + left.description + "], right = [" + right.description + "]"
    case .empty:
      return ""
    }
  }
}


print(tree)




//MARK: - Simple API call GET

import Foundation
import UIKit

struct Repository: Codable {
    let name: String
    let owner: Login
}

struct Login: Codable {
    let login: String
}

enum ServiceError: Error{
    case invalidURL
    case decodeFail(Error)
    case network(Error?)
}

class Service {
    
  private let url = "https://api.github.com/users/"
    
    func get1(userAccount: String, callback: @escaping (Result<Any, ServiceError >) -> Void){
        
        let path = "\(userAccount)/repos"
        
        guard let urlSessions = URL(string: url + path)
        else {
            callback(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: urlSessions){ data, response, error in
            guard let data = data else {
                callback(.failure(.network(error)))
                return
            }
            
            do {
                let userRepos = try JSONDecoder().decode([Repository].self, from: data)
                callback(.success(userRepos))
            } catch {
                callback(.failure(.decodeFail(error)))
            }
        }
        task.resume()
    }
}

    do{
        let service = Service()
        service.get1(userAccount: "celohenrique") { result in
            DispatchQueue.main.async {
                switch result {
                case let . failure(error):
                    print(error)
                case let .success(data):
                    print(data)
                }
            }
        }
        
    }
    
