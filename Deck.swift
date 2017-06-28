import Foundation

public class Deck: NSObject{
    private static let allSpades = Value.allValues.map{Card(c: Color.spades, v: $0)}
    private static let allDiamonds = Value.allValues.map{Card(c: Color.diamonds, v: $0)}
    private static let allHearts = Value.allValues.map{Card(c: Color.hearts, v: $0)}
    private static let allClubs = Value.allValues.map{Card(c: Color.clubs, v: $0)}
    private static let allCards:[Card] = allSpades + allDiamonds + allHearts + allClubs
    public var Cards:[Card] = []
    public var Discards:[Card] = []
    public var Outs:[Card] = []
    
    init(mixed:Bool = false){
        self.Cards = Deck.allCards
        if mixed {
            self.Cards.shuffle()
        }
    }
    
    public func draw(){
        let topcard = self.Cards.removeFirst()
        self.Outs.append(topcard)
    }
    
    public func fold(c:Card){
        var i:Int = 0
        for card in self.Outs{
            if card == c {
                self.Discards.append(card)
                self.Outs.remove(at: i)
            }
            i += 1
        }
    }
    
    private func userDesc() -> String{
        var St:String = "\n[All Cards]\n"
        var i:Int = 1;
        for c in self.Cards {
            St += "\(i): \(c.description) \n"
            i += 1
        }
        return St
    }
    
    override public var description: String {
        return userDesc()
    }
}

extension Array
{
    mutating func shuffle(){
        if self.count < 2 { return }
        for i in self.startIndex ..< self.endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(self.endIndex - i))) + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
}
