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
    override fileprivate func showStatus() {
        print("User \(nickname) is \(isActive). Moderator at \(projectSector). Hash is \(getUserHashSum())")
    }
}

let defaultUser = User(nickname: "saurik", isActive: true, userHashSum: 6945684793786)
let extUser1 = ExtendedUser(nickname: "appleseed", isActive: true, projectSector: "News", userHashSum: 59564864567457)
let moder1 = Moderator(nickname: "Ive", isActive: false, projectSector: "Design", userHashSum: 59468479647)

