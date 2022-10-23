import UIKit

/*
 В Playground реализуйте некоторый базовый класс из выбранной вами области описания (тематики).
 Добавьте в него свойства и методы, а также несколько инициализаторов. Класс должен содержать свойства и методы разной области видимости (private, fileprivate, internal или public)
 Создайте несколько классов-наследников. Переопределите при необходимости свойства и методы родителя. А также добавьте свои.
 В основном пространстве Playground создайте функцию для демонстрации полиморфизма.
 К заданию приложите либо архив с Playground, либо ссылку на гитхаб репозиторий, куда загрузите код.
 */

class User {
    fileprivate var nickname: String
    fileprivate var isActive: Bool
    private var userHashSum: Int
    
    init(nickname: String, isActive: Bool, userHashSum: Int) {
        self.nickname = nickname
        self.isActive = isActive
        self.userHashSum = userHashSum
    }
    
    fileprivate func showStatus() {
        print("User \(nickname) is \(isActive). Hash is \(userHashSum)")
    }
    
    fileprivate func getUserHashSum() -> Int {
        return userHashSum
    }
    
    fileprivate func setUserHashSum(newValue: Int) {
        userHashSum = newValue
    }
    
}

class ExtendedUser: User {
    fileprivate var projectSector: String
    init(nickname: String, isActive: Bool, projectSector: String, userHashSum: Int) {
        self.projectSector = projectSector
        super.init(nickname: nickname, isActive: isActive, userHashSum: userHashSum)
    }
    
    override fileprivate func showStatus() {
        print("User \(nickname) is \(isActive). Works on \(projectSector). Hash is \(getUserHashSum())")
    }
}

class Moderator: ExtendedUser {
    private var name: String
    
    init(nickname: String, isActive: Bool, projectSector: String, userHashSum: Int, name: String) {
        self.name = name
        super.init(nickname: nickname, isActive: isActive, projectSector: projectSector, userHashSum: userHashSum)
    }
    
    fileprivate func getName() -> String {
        return name
    }
    
    fileprivate func setName(newValue: String) {
        name = newValue
    }
    
    override fileprivate func showStatus() {
        print("User \(nickname) is \(isActive). Name is \(name). Moderator at \(projectSector). Hash is \(getUserHashSum())")
    }
}

let defaultUser: User = User(nickname: "saurik", isActive: true, userHashSum: 6945684793786)
let extUser1: User = ExtendedUser(nickname: "appleseed", isActive: true, projectSector: "News", userHashSum: 59564864567457)
let moder1: User = Moderator(nickname: "Ive", isActive: false, projectSector: "Design", userHashSum: 59468479647, name: "Igor")
let moder2: Moderator = Moderator(nickname: "jsteve", isActive: true, projectSector: "Prod", userHashSum: 5960479454, name: "Semyon")

defaultUser.showStatus()
extUser1.showStatus()
moder1.showStatus()
moder2.showStatus()
moder2.getName()
