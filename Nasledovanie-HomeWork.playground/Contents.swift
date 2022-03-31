/*
Задача 1
Вы продолжаете разрабатывать библиотеку аудио треков. Сейчас будем работать над исполнителями треков.
Алгоритм выполнения
Создайте суперкласс артист;
Определите в нем общие для артиста свойства (имя, страна, жанр);
Определите общие методы (написать трек и исполнить трек);
В реализацию метода "написать трек" добавьте вывод в консоль "Я (имя артиста) написал трек (название трека)";
В реализацию метода "исполнить трек" добавьте вывод в консоль "Я (имя артиста) исполнил трек (название трека)";
Создайте 3 сабкласса любых артистов и переопределите в них МЕТОДЫ суперкласса класса.
 
 Задача 2
 Создание списка артистов.
 Алгоритм выполнения
 Доработайте существующих артистов так, чтобы они имели уникальные для каждого из них свойства и методы.
 Защитите этих артистов от редактирования в будущем.
*/

print("\n--- Задача 1 + 2 ---\n")

class Artist {
    let name: String
    let country: Country
    let categories: String
    let id: Int
    
    enum Country {
        case russia
        case france
        case usa
        case uk
        case germany
        case another
    }
    
    init(name: String, country: Country, categories: String, id: Int) {
        self.name = name
        self.country = country
        self.categories = categories
        self.id = id
    }
    
    var trackArray: [Int:String] = [:] //словарь для сохранения трека и дальнейшей проверки корректности в функции performSong
    
    func writeNewTrack(title: String, id: Int) { //написать трек
        print("Я \(self.name), написал трек: \(title). Страна: \(self.country).")
        trackArray.updateValue(title, forKey: id)
    }
    
    func performSong(trackId: Int) { //исполнить трек
        for (id, _) in trackArray {
            if trackId == id {
                print("Я \(self.name), исполнил трек \(trackArray.values).")
            } else {
                print("Данный трек ещё не написан или номер трека введён не правильно.")
            }
        }
    }
}
    
let theProdigy = Artist(name: "The Prodigy", country: .uk, categories: "Электронная музыка", id: 1)
theProdigy.writeNewTrack(title: "Breathe", id: 1)
theProdigy.performSong(trackId: 1)


final class drunkArtist: Artist {
    override func performSong(trackId: Int) {
        super.performSong(trackId: trackId)
        print("Извините за моё состояние, ик..")
    }
    func badFeeling() {
        print("Друзья, концерт переносится, в связи с опозданием \(self.name). Приносим извинения!")
    }
}

let petkun = drunkArtist(name: "Вячеслав Петкун", country: .russia, categories: "Rock", id: 2)
petkun.writeNewTrack(title: "Цветы", id: 1)
petkun.performSong(trackId: 1)
petkun.badFeeling()


final class FilmComposer: Artist { //композитор
    let forMovie: String

    init(name: String, forMovie: String, id: Int, country: Artist.Country, categories: String) {
        self.forMovie = forMovie
        super.init(name: name, country: country, categories: categories, id: id)
    }
    
    override func writeNewTrack(title: String, id: Int) {
        print("Я \(self.name), написал музыку: \(title). Страна: \(self.country).")
        trackArray.updateValue(title, forKey: id)
    }
    
    override func performSong(trackId: Int) {
        for (id, _) in trackArray {
            if trackId == id {
                print("Я \(self.name), написал музыку \(trackArray.values) специально для будущего фильма - \(forMovie).")
            } else {
                print("Данная музыка ещё не написан или номер композиции введён не правильно.")
            }
        }
    }
}


let hans = FilmComposer(name: "Hans Zimmer", forMovie: "Gladiator", id: 1, country: .germany, categories: "Композитор")
hans.writeNewTrack(title: "Victory", id: 1)
hans.performSong(trackId: 1)


final class Dj: Artist {
    let openAirPlace: String
    
    init(name: String, openAirPlace: String, id: Int, country: Artist.Country, categories: String) {
        self.openAirPlace = openAirPlace
        super.init(name: name, country: country, categories: categories, id: id)
    }
    
    override func writeNewTrack(title: String, id: Int) {
        super.writeNewTrack(title: title, id: id)
        print("Данный трек будет хитом на радио!")
    }
    
    override func performSong(trackId: Int) {
        super.performSong(trackId: trackId)
        print("Премьера состоялась на \(openAirPlace)!")
    }
}

let david = Dj(name: "David Guetta", openAirPlace: "Ibiza", id: 1, country: .france, categories: "DJ")
david.writeNewTrack(title: "I Gotta Feeling", id: 1)
david.performSong(trackId: 1)


/*
 Задача 3 * (задача со звездочкой):
 Создайте пустой массив, чтобы потом добавить в него ваших артистов;
 Добавьте созданных ранее артистов в массив;
 Напишите отчет о том, что вы поняли/в чем разобрались, выполняя это задание;
 Дайте оценку своему пониманию данной темы.
 Данное задание поможет вам лучше понять эту тему. В процессе написания отчета вы выявите слабые и сильные места в изучении данной темы, закроете пробелы или у вас появятся новые вопросы. При возникновении вопросов можете писать в чат группы, либо в лс преподавателю в Slack.
 */

print("\n--- Задача 3 ---\n")

var allArtists: [Artist] = []
allArtists.append(theProdigy)
allArtists.append(petkun)
allArtists.append(hans)
allArtists.append(david)

/*
 В данном задании я разобрался как добавлять новые свойства наследуемому классу, потому что до этого никогда это не делал.
 Тема достаточно легко далась, поэтому моё понимание как минимум удовлетворительное, но возможно даже лучше.
 Спасибо за домашку!
 */

