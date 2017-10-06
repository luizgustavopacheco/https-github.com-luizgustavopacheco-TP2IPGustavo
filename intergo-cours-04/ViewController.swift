//---ATTENTION: Xcode version 9.0 (9A235)---------------------------------------

import UIKit

//------------------------------------------

class ViewController: UIViewController {
    
    //.............
    
    @IBOutlet weak var back_1: UIView!
    @IBOutlet weak var front_1: UIView!
    @IBOutlet weak var back_2: UIView!
    @IBOutlet weak var front_2: UIView!
    @IBOutlet weak var back_3: UIView!
    @IBOutlet weak var front_3: UIView!
    @IBOutlet weak var back_4: UIView!
    @IBOutlet weak var front_4: UIView!
    @IBOutlet weak var back_5: UIView!
    @IBOutlet weak var front_5: UIView!
    @IBOutlet weak var back_6: UIView!
    @IBOutlet weak var front_6: UIView!
    @IBOutlet weak var back_7: UIView!
    @IBOutlet weak var front_7: UIView!
    @IBOutlet weak var back_8: UIView!
    @IBOutlet weak var front_8: UIView!
    
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    @IBOutlet weak var imgView4: UIImageView!
    @IBOutlet weak var imgView5: UIImageView!
    @IBOutlet weak var imgView6: UIImageView!
    @IBOutlet weak var imgView7: UIImageView!
    @IBOutlet weak var imgView8: UIImageView!
    
    @IBOutlet weak var card1: UIView!
    @IBOutlet weak var card2: UIView!
    @IBOutlet weak var card3: UIView!
    @IBOutlet weak var card4: UIView!
    @IBOutlet weak var card5: UIView!
    @IBOutlet weak var card6: UIView!
    @IBOutlet weak var card7: UIView!
    @IBOutlet weak var card8: UIView!
    
    //...declaration et signature.
    
    var arrayOfImageViews: [UIImageView]!
    var arrayOfAnimalNames = ["chat.png", "chat.png", "chien.png", "chien.png", "cochon.png", "cochon.png", "lapin.png", "lapin.png"]
    var arrayOfRandonAnimalNames = [String]()
    var arrayChosenCards = [String]()
    var arrayOfCards = [UIView]()
    
    var arrayOfShowingBacks = [UIView]()
    var arrayOfHidingFronts = [UIView]()
    
    var cards: [UIView]!
    
    //...Lorsque le document est prêt.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = [card1,card2,card3,card4,card5,card6,card7,card8]
        arrayOfImageViews = [imgView1, imgView2, imgView3, imgView4, imgView5, imgView6, imgView7, imgView8]
        randomAnimals()
        setImagesToCards()
    }
    
    //...tourner la carte et montrer l'image de back en cachant l'image de front, après compter deux cartes.
    
    @IBAction func showCard(_sender: UIButton){
        if arrayOfHidingFronts.count==2{
        return
        }
        switch _sender.tag {
        case 0:
            flipCard(from: front_1, to: back_1)
            arrayOfCards.append(card1)
            arrayOfShowingBacks.append(back_1)
            arrayOfHidingFronts.append(front_1)
        case 1:
            flipCard(from: front_2, to: back_2)
            arrayOfCards.append(card2)
            arrayOfShowingBacks.append(back_2)
            arrayOfHidingFronts.append(front_2)
        case 2:
            flipCard(from: front_3, to: back_3)
            arrayOfCards.append(card3)
            arrayOfShowingBacks.append(back_3)
            arrayOfHidingFronts.append(front_3)
        case 3:
            flipCard(from: front_4, to: back_4)
            arrayOfCards.append(card4)
            arrayOfShowingBacks.append(back_4)
            arrayOfHidingFronts.append(front_4)
        case 4:
            flipCard(from: front_5, to: back_5)
            arrayOfCards.append(card5)
            arrayOfShowingBacks.append(back_5)
            arrayOfHidingFronts.append(front_5)
        case 5:
            flipCard(from: front_6, to: back_6)
            arrayOfCards.append(card6)
            arrayOfShowingBacks.append(back_6)
            arrayOfHidingFronts.append(front_6)
        case 6:
            flipCard(from: front_7, to: back_7)
            arrayOfCards.append(card7)
            arrayOfShowingBacks.append(back_7)
            arrayOfHidingFronts.append(front_7)
        case 7:
            flipCard(from: front_8, to: back_8)
            arrayOfCards.append(card8)
            arrayOfShowingBacks.append(back_8)
            arrayOfHidingFronts.append(front_8)
        default:
            break
        }
        //...vas fait pour touts les cases automatiquement.
        arrayChosenCards.append(arrayOfRandonAnimalNames[_sender.tag])
        verification()
    }
    
    //...Tourner la carte pendant 1 seconde en montrant l'image de back.
    
    func flipCard(from:UIView,to:UIView){
        let transitionOptions: UIViewAnimationOptions=[.transitionFlipFromRight,.showHideTransitionViews]
        UIView.transition(with: from, duration: 1.0, options: transitionOptions, animations:{
            from.isHidden=true
        })
        UIView.transition(with: to, duration: 1.0, options: transitionOptions, animations:{
            to.isHidden=false
        })
    }
    
    //...mettre une image sur la carte.
    
    func setImagesToCards(){
        var number = 0
        for imgView in arrayOfImageViews{
            imgView.image=UIImage(named: arrayOfRandonAnimalNames[number])
            number = number+1
        }
    }
    
    //...remettre les images aléatoiremet sur les cartes.
    
    func randomAnimals(){
        let numberOfAnimals = arrayOfAnimalNames.count
        for _ in 1...numberOfAnimals{
            let randomNumber = Int(arc4random_uniform(UInt32(arrayOfAnimalNames.count)))
            arrayOfRandonAnimalNames.append(arrayOfAnimalNames[randomNumber])
            arrayOfAnimalNames.remove(at: randomNumber)
        }
    }
    
    //.............
    
    func resetCards(){
        if arrayOfShowingBacks.count == 2 {
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(reFlip)), userInfo: nil, repeats: false)
        }
    }
    
    //... vérifier si la première carte est égal la deuxième.
    
    func verification(){
        if arrayChosenCards.count == 2 {
            if arrayChosenCards[0] == arrayChosenCards[1]{
                Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(hideCards)), userInfo: nil, repeats: false)
            } else{
                arrayOfCards = []
            }
            arrayChosenCards = []
        }
        resetCards()
    }
    
    //...cacher les cartes qui sont égales.
    
    @objc func hideCards() {
        arrayOfCards[0].isHidden = true
        arrayOfCards[1].isHidden = true
        arrayOfCards = []
    }
    
    //...retourner si elles ne sont pas égales
    
    @objc func reFlip(){
        for index in 0..<arrayOfShowingBacks.count {
            flipCard(from: arrayOfShowingBacks[index], to: arrayOfHidingFronts[index])
        }
        arrayOfShowingBacks = []
        arrayOfHidingFronts = []
    }
    
    
     //...recommencer le jeu, avec une nouvelle configuration, en utilisant la randomisation.
    
    
    @IBAction func reset(_ sender: UIButton) {
        for card in cards{
            card.isHidden = false
        }
        arrayOfAnimalNames = ["chat.png", "chat.png", "chien.png", "chien.png", "cochon.png", "cochon.png", "lapin.png", "lapin.png"]
        arrayOfRandonAnimalNames = []
        randomAnimals()
        setImagesToCards()
    }
    
    
    }
    
    
    
    


