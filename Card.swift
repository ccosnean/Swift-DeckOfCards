import Foundation

public class Card: NSObject {
    private var Color:Color
    private var Value:Value
    
    private func customDescription() -> String {
        let s:String = String(describing: self.Value).uppercased()
        return "\(s) of [\(self.Color.rawValue)]\(self.Color)"
    }

    override public var description: String {
        return customDescription()
    }
    
    override public func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Card {
            return (self.Color == object.Color && self.Value == object.Value)
        } else {
            return false
        }
    }
    
    public init(c:Color, v:Value){
        self.Color = c
        self.Value = v
    }
}
