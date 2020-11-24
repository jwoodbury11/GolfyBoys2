//
//  ViewController.swift
//  GolfyBoys
//
//  Created by James Woodbury on 10/29/20.
//




import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var gameText: UILabel!
    @IBOutlet weak var k1Image: UIButton!
    @IBOutlet weak var k2Image: UIButton!
    @IBOutlet weak var k3Image: UIButton!
    @IBOutlet weak var k4Image: UIButton!
    @IBOutlet weak var k5Image: UIButton!
    @IBOutlet weak var k6Image: UIButton!
    @IBOutlet weak var k7Image: UIButton!
    @IBOutlet weak var k8Image: UIButton!
    @IBOutlet weak var k9Image: UIButton!
    @IBOutlet weak var j1Image: UIButton!
    @IBOutlet weak var j2Image: UIButton!
    @IBOutlet weak var j3Image: UIButton!
    @IBOutlet weak var j4Image: UIButton!
    @IBOutlet weak var j5Image: UIButton!
    @IBOutlet weak var j6Image: UIButton!
    @IBOutlet weak var j7Image: UIButton!
    @IBOutlet weak var j8Image: UIButton!
    @IBOutlet weak var j9Image: UIButton!
    @IBOutlet weak var drawImage: UIButton!
    @IBOutlet weak var discardImage: UIButton!
    @IBOutlet weak var jPoints: UILabel!
    @IBOutlet weak var kPoints: UILabel!
    @IBOutlet weak var drawLabel: UILabel!
    @IBOutlet weak var discardLabel: UILabel!
    @IBOutlet weak var activeCardLabel: UILabel!
    @IBOutlet weak var discardNumbers: UILabel!
    @IBOutlet weak var jFinal: UILabel!
    @IBOutlet weak var kFinal: UILabel!
    
    
    
    
    
    
    
    
    
    func turnFlip() -> Int {
        if whoseTurn == 0 {
            whoseTurn = 1
            return whoseTurn
        }
        else{
            whoseTurn = 0
            return whoseTurn
        }
    }
    var activeCard = " " {
        didSet {
            activeCardLabel.text = String(activeCard)
        }
    }
    var whoseTurn = 0 {
        didSet {
            if whoseTurn == 0 {
                gameText.text = "it is Jimmy's Turn"
            }
            else{
                gameText.text = "it is Kristoof's Turn"
            }
        }
    }

    
    var cardArray = [4,4,4,4,4,4,4,4,4,4,4,4,4]
    var discardArrary = [99] {
        didSet {
            if discardArrary[discardArrary.count-1] != 99 {
                discardImage.alpha = 0.6
                discardImage.setTitle(" ", for: .normal)
            }
            discardNumbers.text = String(discardArrary.description)
            if discardArrary[discardArrary.count-1] == 99 {
                discardImage.setBackgroundImage(UIImage(named: "back"), for: .normal)
            }
            else {
                discardImage.setBackgroundImage(UIImage(named: "card\(discardArrary[discardArrary.count-1])"), for: .normal)
            }
        }
    }
    
    var k1 = 0
    
    var kTots = 0 {
        didSet {
            kFinal.text = String(kTots)
        }
    }
    
    var jTots = 0 {
        didSet {
            jFinal.text = String(jTots)
            
        }
    }
    
    
    func drawCard() -> Int {
        var roll = Int.random(in: 0...12)
        while cardArray[roll] < 0 {
            roll = Int.random(in: 0...12)
        }
        cardArray[roll] -= 1
        return roll
    }
    var name = ""
    
    var kCardLock = [1,1,1,1,1,1,1,1,1]
    var jCardLock = [1,1,1,1,1,1,1,1,1]
    var kScore = [99,99,99,99,99,99,99,99,99] {
        didSet {
            kPoints.text = String(kScore.description)
            kTots = 0
            for items in kScore {
                if items <= 11 {
                    kTots = kTots + items + 1
                }
            }
        }
    }
    var jScore = [99,99,99,99,99,99,99,99,99] {
        didSet {
            jPoints.text = String(jScore.description)
            jTots = 0
            for items in jScore {
                if items <= 11 {
                    jTots = jTots + items + 1
                }
            }
        }
    }
    var discardValue = 99{
        didSet {
            discardLabel.text = String(discardValue)
        }
    }
    var drawValue = 99 {
        didSet {
            drawLabel.text = String(drawValue)
        }
    }
    var kCardsFlipped = 0 {
        didSet {
            if kCardsFlipped + jCardsFlipped == 4 {
                let roll = Int.random(in: 0...1)
                whoseTurn = roll
                print("whoseTurn: \(roll)")
                if roll == 0 {
                    name = "Jimmy's"
                }
                else{
                    name = "Kristoof's"
                }
                gameText.text = "it is \(name) Turn"
                
            }
        }
    }
    var jCardsFlipped = 0 {
        didSet {
            if kCardsFlipped + jCardsFlipped == 4 {
                let roll = Int.random(in: 0...1)
                whoseTurn = roll
                print("whoseTurn: \(roll)")
                if roll == 0 {
                    name = "Jimmy's"
                }
                else{
                    name = "Kristoof's"
                }
                gameText.text = "it is \(name) Turn"
            }
        }
    }
    
    // this is my attempt
    
    
    func mainCard(arry: Int, calll: UIButton!) -> Void {
        
        if kCardLock[arry] == 1 && activeCard != "draw" && activeCard != "discard" && kCardsFlipped + jCardsFlipped <= 4{
            let roll = drawCard()
            print(roll)
            calll.setBackgroundImage(UIImage(named: "card\(roll)"), for: .normal)
            kCardLock[arry] = 0
            kCardsFlipped += 1
            print("cardArray \(cardArray)")
            kScore[arry] = roll
            print("kScore: \(kScore)")
            if kCardsFlipped + jCardsFlipped >= 4 {
                whoseTurn = turnFlip()
            }
            
        }
        
        else if kCardLock[arry] == 1 && activeCard != "draw" && activeCard != "discard" && whoseTurn == 1{
            let roll = drawCard()
            print(roll)
            calll.setBackgroundImage(UIImage(named: "card\(roll)"), for: .normal)
            kCardLock[arry] = 0
            kCardsFlipped += 1
            print("cardArray \(cardArray)")
            kScore[arry] = roll
            print("kScore: \(kScore)")
            if kCardsFlipped + jCardsFlipped >= 4 {
                whoseTurn = turnFlip()
            }
            
        }
        else if activeCard == "draw" && whoseTurn == 1{
            if kCardLock[arry] != 1 {
                //discardImage.setBackgroundImage(UIImage(named: "card\(kScore[0])"), for: .normal)
                discardArrary.append(kScore[arry])
                calll.setBackgroundImage(UIImage(named: "card\(drawValue)"), for: .normal)
                kScore[arry] = drawValue
                drawImage.setBackgroundImage(UIImage(named: "back"), for: .normal)
                drawImage.alpha = 0.6
                //drawValue = roll
                activeCard = " "
                whoseTurn = turnFlip()
            } else if kCardLock[arry] == 1 {
                let rand = drawCard()
                discardArrary.append(rand)
                calll.setBackgroundImage(UIImage(named: "card\(drawValue)"), for: .normal)
                kScore[arry] = drawValue
                drawImage.setBackgroundImage(UIImage(named: "back"), for: .normal)
                drawImage.alpha = 0.6
                //drawValue = roll
                activeCard = " "
                whoseTurn = turnFlip()
            }
        }
        
        else if activeCard == "discard" && whoseTurn == 1{
            if kCardLock[arry] != 1 {
                print("isthisRunning?")
                discardImage.setBackgroundImage(UIImage(named: "card\(kScore[arry])"), for: .normal)
                calll.setBackgroundImage(UIImage(named: "card\(discardValue)"), for: .normal)
                discardArrary.removeLast()
                discardArrary.append(kScore[arry])
                kScore[arry] = discardValue
                discardImage.alpha = 0.6
                whoseTurn = turnFlip()
                activeCard = " "
            } else if kCardLock[arry] == 1 {
                calll.setBackgroundImage(UIImage(named: "card\(discardArrary[discardArrary.count-1])"), for: .normal)
                let dog = drawCard()
                discardImage.setBackgroundImage(UIImage(named: "card\(dog)"), for: .normal)
                discardArrary.removeLast()
                discardArrary.append(dog)
                kScore[arry] = discardValue
                discardImage.alpha = 0.6
                whoseTurn = turnFlip()
                activeCard = " "
            }
            
            
        }
        else{
            print("locked")
        }
        
    }
    
    
    @IBAction func k1(_ sender: Any) {
        
        mainCard(arry: 0, calll: k1Image)
        }
    
    @IBAction func k2(_ sender: Any) {
        
        mainCard(arry: 1, calll: k2Image)
        }
    
    
    @IBAction func k3(_ sender: Any) {
        
        mainCard(arry: 2, calll: k3Image)
        }
    
    @IBAction func k4(_ sender: Any) {
        
    mainCard(arry: 3, calll: k4Image)
    }
    
    @IBAction func k5(_ sender: Any) {
        
        mainCard(arry: 4, calll: k5Image)
        }
    
    @IBAction func k6(_ sender: Any) {
        
        mainCard(arry: 5, calll: k6Image)
        }
    
    @IBAction func k7(_ sender: Any) {
        
        mainCard(arry: 6, calll: k7Image)
        }
    
    @IBAction func k8(_ sender: Any) {
        
        mainCard(arry: 7, calll: k8Image)
        }
    
    @IBAction func k9(_ sender: Any) {
        
        mainCard(arry: 8, calll: k9Image)
        }
    
    
    func jMainCard(redf: Int, boood: UIButton!) -> Void {
        
        if jCardLock[redf] == 1 && activeCard != "draw" && activeCard != "discard" && (kCardsFlipped + jCardsFlipped <= 4 || whoseTurn == 0) {
            let roll = drawCard()
            print(roll)
            boood.setBackgroundImage(UIImage(named: "card\(roll)"), for: .normal)
            jCardLock[redf] = 0
            jCardsFlipped += 1
            print("cardArray \(cardArray)")
            jScore[redf] = roll
            print("jScore: \(jScore)")
            if kCardsFlipped + jCardsFlipped >= 4 {
                whoseTurn = turnFlip()
            }
            
        }
        
        else if activeCard == "draw" && whoseTurn == 0{
            if jCardLock[redf] != 1 {
                discardArrary.append(jScore[redf])
                boood.setBackgroundImage(UIImage(named: "card\(drawValue)"), for: .normal)
                jScore[redf] = drawValue
                drawImage.setBackgroundImage(UIImage(named: "back"), for: .normal)
                drawImage.alpha = 0.6
                //drawValue = roll
                activeCard = " "
                whoseTurn = turnFlip()
            } else if jCardLock[redf] == 1 {
                let rand = drawCard()
                discardArrary.append(rand)
                boood.setBackgroundImage(UIImage(named: "card\(drawValue)"), for: .normal)
                jScore[redf] = drawValue
                drawImage.setBackgroundImage(UIImage(named: "back"), for: .normal)
                drawImage.alpha = 0.6
                //drawValue = roll
                activeCard = " "
                whoseTurn = turnFlip()
            }
        }
        
        else if activeCard == "discard" && whoseTurn == 0{
            if jCardLock[redf] != 1 {
                print("isthisRunning?")
                discardImage.setBackgroundImage(UIImage(named: "card\(jScore[redf])"), for: .normal)
                boood.setBackgroundImage(UIImage(named: "card\(discardValue)"), for: .normal)
                discardArrary.removeLast()
                discardArrary.append(jScore[redf])
                jScore[redf] = discardValue
                discardImage.alpha = 0.6
                whoseTurn = turnFlip()
                activeCard = " "
            } else if jCardLock[redf] == 1 {
                boood.setBackgroundImage(UIImage(named: "card\(discardArrary[discardArrary.count-1])"), for: .normal)
                let dog = drawCard()
                discardImage.setBackgroundImage(UIImage(named: "card\(dog)"), for: .normal)
                discardArrary.removeLast()
                discardArrary.append(dog)
                jScore[redf] = discardValue
                discardImage.alpha = 0.6
                whoseTurn = turnFlip()
                activeCard = " "
            }
            
            
        }
        else{
            print("locked")
        }
        
    }
    
    
    
    @IBAction func j1(_ sender: Any) {
        
        jMainCard(redf: 0, boood: j1Image)
    }
    
    @IBAction func j2(_ sender: Any) {
        
        jMainCard(redf: 1, boood: j2Image)
    }
    
    @IBAction func j3(_ sender: Any) {
        
        jMainCard(redf: 2, boood: j3Image)
    }
    @IBAction func j4(_ sender: Any) {
        
        jMainCard(redf: 3, boood: j4Image)
    }
    @IBAction func j5(_ sender: Any) {
        
        jMainCard(redf: 4, boood: j5Image)
    }
    
    @IBAction func j6(_ sender: Any) {
        
        jMainCard(redf: 5, boood: j6Image)
    }
    
    @IBAction func j7(_ sender: Any) {
        
        jMainCard(redf: 6, boood: j7Image)
    }
    @IBAction func j8(_ sender: Any) {
        
        jMainCard(redf: 7, boood: j8Image)
    }
    
    @IBAction func j9(_ sender: Any) {
        
        jMainCard(redf: 8, boood: j9Image)
    }
    
    
    
    
    
    
    
    
    @IBAction func drawAction(_ sender: Any) {
        if activeCard != "draw" && drawValue == 99 {
            let roll = drawCard()
            drawImage.setBackgroundImage(UIImage(named: "card\(roll)"), for: .normal)
            drawImage.alpha = 1
            drawValue = roll
            activeCard = "draw"
        }
        else if activeCard != "draw" {
            drawImage.alpha = 1
            let roll = drawCard()
            drawImage.setBackgroundImage(UIImage(named: "card\(roll)"), for: .normal)
            drawValue = roll
            activeCard = "draw"
            print("drawValue: \(drawValue)")
        }
       
    }
    
    
    @IBAction func discardAction(_ sender: Any) {
        if activeCard == "draw" {
            discardImage.setBackgroundImage(UIImage(named: "card\(drawValue)"), for: .normal)
            discardValue = drawValue
            discardArrary.append(discardValue)
            //let roll = drawCard()
            drawImage.setBackgroundImage(UIImage(named: "back"), for: .normal)
            //drawValue = roll
            drawImage.alpha = 0.6
            discardImage.alpha = 0.6
            activeCard = " "
            whoseTurn = turnFlip()
            discardImage.setTitle("", for: .normal)
        }
        else if activeCard == " " && kCardsFlipped + jCardsFlipped >= 4 && discardArrary[discardArrary.count-1] != 99{
            discardImage.alpha = 1
            activeCard = "discard"
        }
        else if activeCard == "discard"{
            discardImage.alpha = 0.6
            activeCard = " "
        }
        else {
            print("discardValue")
        }
    }
    
    
    
    
    
    

}

