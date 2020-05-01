import UIKit

// MARK: Phase 1

struct Interest: Hashable {
    let title: String
    let description: String
    let category: Category
    var shared = false
}

enum Category:String {
    case sport = "sport",
    arts = "arts",
    tech = "tech",
    skill = "skill"
}

struct Person: Hashable {
    let name: String
    let age: Int
    let homeTown: String
    var interests: [Interest]
    var matches = 0
}

var interests = [Interest]()

// Define date for interests

interests.append(Interest(title: "football", description: "playing football as part of a local club.", category: .sport))
interests.append(Interest(title: "baksetball", description: "playing basketball down the park.", category: .sport))
interests.append(Interest(title: "rugby", description: "watching the six nations on TV.", category: .sport))
interests.append(Interest(title: "cricket", description: "playing cricket on a sunny afternoon.", category: .sport))
interests.append(Interest(title: "hockey", description: "playing hokcey competitively.", category: .sport))
interests.append(Interest(title: "photoraphy", description: "taking photos of nature.", category: .arts))
interests.append(Interest(title: "music", description: "creating new melodies on my piano.", category: .arts))
interests.append(Interest(title: "theatre", description: "watching West End shows in London.", category: .arts))
interests.append(Interest(title: "art", description: "visiting the national art galleries.", category: .arts))
interests.append(Interest(title: "dance", description: "perfoming in dancce recitals.", category: .arts))
interests.append(Interest(title: "iOS development", description: "learning how to code apps for iPhone.", category: .tech))
interests.append(Interest(title: "web development", description: "learning how to make awesome websites.", category: .tech))
interests.append(Interest(title: "virtual reality", description: "keeping up to date with the latest developments in VR.", category: .tech))
interests.append(Interest(title: "gaming", description: "playing online multiplayer games such as fortnite.", category: .tech))
interests.append(Interest(title: "wearables", description: "keeping up to date with the latest wearables on the market.", category: .tech))
interests.append(Interest(title: "cooking", description: "cooking lots of different recipes.", category: .skill))
interests.append(Interest(title: "baking", description: "baking cakes and treats, cupcakes are my speciality.", category: .skill))
interests.append(Interest(title: "crafts", description: "making all sorts of wondeful things.", category: .skill))
interests.append(Interest(title: "woodwork", description: "using my workshop to upcycle furniture.", category: .skill))
interests.append(Interest(title: "diy", description: "making things from scratch, love all the tools.", category: .skill))


var people = [Person]()

// Define data for people

people.append(Person(name: "Arthur", age: 21, homeTown: "Watford", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "Sam", age: 30, homeTown: "Swindon", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "Lauren", age: 25, homeTown: "London", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "Sara", age: 21, homeTown: "Liverpool", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "Chrissy", age: 24, homeTown: "Birmingham", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "Asher", age: 26, homeTown: "Chester", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "Matthew", age: 28, homeTown: "Portsmouth", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "David", age: 22, homeTown: "Lincoln", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "Elizabeth", age: 23, homeTown: "Leeds", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "Kate", age: 25, homeTown: "Brighton", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "Dan", age: 29, homeTown: "Bath", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))
people.append(Person(name: "Rachel", age: 28, homeTown: "Bristol", interests: generateInterests(numberOfInterests:Int.random(in: 1 ... 10))))

func generateInterests(numberOfInterests:Int) -> [Interest] {
    var randomInterests = [Interest]()
    
    for _ in 1 ... numberOfInterests {
        // Pick a random interest from the interest array
        var randomInterest =  interests[Int.random(in: 0 ..< interests.count)]
        // Check the random interest is not already in the randomInterets array
        while (randomInterests.contains(where: {$0.title == randomInterest.title})) {
            // If the same interest has been selected, pick another random one.
            randomInterest = interests[Int.random(in: 0 ..< interests.count)]
        }
        randomInterests.append(randomInterest)
    }
    return randomInterests
}

// MARK: Phase 2
var numberOfParticipants = generateNumberOfParticipants()

func generateNumberOfParticipants() -> Int {
    var numberOfParticipants = 1
    //Loop to ensure the number of participants is an even number so they can be paired!
    while (numberOfParticipants % 2 != 0) {
        // Range of minimum 2 participants and max 12 participants.
        numberOfParticipants = Int.random(in: 2 ... 12)
    }
    return numberOfParticipants
}

func introduceParticipants(numberOfParticipants: Int) {
    for i in 0 ..< numberOfParticipants {
        print("\(people[i].name): Hello, my name is \(people[i].name), I am \(people[i].age) years old and I am from \(people[i].homeTown).")
    }
}

func shareInterests() {
    var peopleToShare = people[0 ..< numberOfParticipants]
    var numberOfPeople = peopleToShare.count
    while numberOfPeople > 0 {
        let randomIndex = Int.random(in: 0 ..< numberOfPeople)
        let selectedPerson = peopleToShare[randomIndex]
        // Start at the last element in array, and check bool to see if it's been shared.
        for i in stride(from: selectedPerson.interests.count-1, through: 0, by: -1) {
            if selectedPerson.interests[i].shared == false {
                // Share the interest
                print("\(selectedPerson.name): I like \(selectedPerson.interests[i].title)")
                // Set shared to true
                peopleToShare[randomIndex].interests[i].shared = true
                if i == 0 {
                    // If last element in array, then delete person from peopleToShare array
                    peopleToShare.remove(at: randomIndex)
                    // Recalcualte the number of people left to share
                    numberOfPeople = peopleToShare.count
                }
                break
            }

        }
    }
}

func generatePairs(){
    let peopleToMatch = people[0 ..< numberOfParticipants]
    var matches: [(playerOne:Person, playerTwo:Person, matchingCategories: [String], totalMatches:Int, totalDifferences: Int)] = []
    
    for i in 0 ..< numberOfParticipants - 1 {
        for j in i+1 ..< numberOfParticipants{
            matches.append(compareInterests(basePerson: peopleToMatch[i], matchingPerson: peopleToMatch[j]))
        }
    }
    
    matches.sort { (lhs, rhs) -> Bool in
        if lhs.totalMatches < rhs.totalMatches {
            return true
        } else {
            return false
        }
    }

    // Create an array for the confirmed matches
    var matchedPlayers: [(playerOne: Person, playerTwo: Person)] = []
    var players = Set(peopleToMatch)
    
    for (playerOne, playerTwo, matchingCatergories, totalMatches, totalDifferences) in matches {
        // Check both players are still in the array
        if players.contains(playerOne) && players.contains(playerTwo) {
            matchedPlayers.append((playerOne, playerTwo))
            players.remove(playerOne)
            players.remove(playerTwo)
            
            print("\(playerOne.name) and \(playerTwo.name) have matched! " + composeReason(matchingCategories: matchingCatergories, totalMatches: totalMatches, totalDifferences: totalDifferences))
        }
    }
}

func compareInterests(basePerson: Person, matchingPerson: Person) -> (playerOne:Person, playerTwo:Person, matchingCategories: [String], totalMatches:Int, totalDifferences: Int) {
    var totalMatches = 0
    var totalDifferences = 0
    
    // Count the number of matching interests
    for interest in basePerson.interests {
        if matchingPerson.interests.contains(interest){
        totalMatches += 1
        } else {
            totalDifferences += 1
        }
    }
    let matchingCategories = compareMatchingCategories(basePerson: basePerson, matchingPerson: matchingPerson)
    return(basePerson, matchingPerson, matchingCategories, totalMatches, totalDifferences)
}

func compareMatchingCategories(basePerson: Person, matchingPerson: Person) -> [String] {
    var matchingCategories = [String]()
    for interest1 in basePerson.interests {
        for interest2 in matchingPerson.interests{
            if interest1.category == interest2.category && matchingCategories.contains(interest1.category.rawValue) == false {
                matchingCategories.append(interest1.category.rawValue)
            }
        }
    }
    return matchingCategories
}

func composeReason(matchingCategories: [String], totalMatches: Int, totalDifferences: Int) -> String {
    
    // If there are no matching interests. They are an EXCELLENT match
    if totalMatches == 0 {
        return "An excellent match! :D They have \(totalDifferences) differences and don't have any matching categories, or interests at all! Looks like they have a lot to learn about each other."
    }
    
    // Convert array of categories into one string
    var categories = String()
    for i in 0 ..< matchingCategories.count {
        if i != matchingCategories.count - 1 {
            categories += "\(matchingCategories[i]), "
        } else if i == 0 {
            categories = matchingCategories[0]
        } else {
            categories.removeLast(2)
            categories += " and \(matchingCategories[i])"
        }
    }

    if totalMatches > totalDifferences {
        //If they have less differences than similarities. They are a POOR match.
        return "A poor match :( They both have interests in \(categories) categories! And they have \(totalMatches) interests in common, but only \(totalDifferences) differences. Looks like they already know a lot about each other."
    } else if totalMatches < totalDifferences {
        //If there are more differences than similarities. They are a GOOD match.
        return "A good match :) They both have interests in \(categories) categories. They have \(totalMatches) interests in common and have \(totalDifferences) differences. Looks like they still have a lot to learn about each other"
    } else {
        //If they have the same number of interests and differences They are an OK match.
        return "An OK match :| They both have interests in \(categories) categories. They have \(totalMatches) interests in common, and \(totalDifferences) differences. Looks like they have a bit to learn about each other"
    }
}

// MARK: Curious Katie

print("Katie: Hello everyone, I am Curious Katie! Would all \(numberOfParticipants) of you like to introduce yourselves?\n")
introduceParticipants(numberOfParticipants: numberOfParticipants)
print("\nKatie: That's great, thanks everyone! Now could you all share your interests, one at a time, until everyone's done and all interests are shared?\n")
shareInterests()
print("\nKatie: Matching... \n")
generatePairs()
print("\nKatie: Great, all done!")
