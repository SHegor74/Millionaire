import UIKit

class ChartViewController: UIViewController {
    
    private let mainLogo: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "logoLarge")
        imageLogo.contentMode = .scaleAspectFit
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        return imageLogo
    }()
    
    
    lazy var takeMoney = naviButton(title: "Забрать деньги", action: #selector(takeMoneyAction))
    lazy var goAhead = naviButton(title: "Далее", action: #selector(goAheadAction))
    
    lazy var fiftyHelpButton = helpButton(name: "helpIcon1", action: #selector(fiftyHelpButtonAction))
    lazy var hallHelpButton = helpButton(name: "helpIcon2", action: #selector(hallHelpButtonAction))
    lazy var friendsHelpButton = helpButton(name: "helpIcon3", action: #selector(friendsHelpButtonAction))
    lazy var mistakeHelpButton = helpButton(name: "helpIcon4", action: #selector(mistakeHelpButtonAction))
    
    var helpStackOne = UIStackView()
    var helpStackTwo = UIStackView()
    var helpStack = UIStackView()
    var questionAndRewardStack = UIStackView()
    
    lazy var view15 = setUpQuestionView(titleQuestion: "Вопрос 15", sumOfQuestion: "1.000.000 руб.")
    lazy var view14 = setUpQuestionView(titleQuestion: "Вопрос 14", sumOfQuestion: "500.000 руб.")
    lazy var view13 = setUpQuestionView(titleQuestion: "Вопрос 13", sumOfQuestion: "250.000 руб.")
    lazy var view12 = setUpQuestionView(titleQuestion: "Вопрос 12", sumOfQuestion: "128.000 руб.")
    lazy var view11 = setUpQuestionView(titleQuestion: "Вопрос 11", sumOfQuestion: "64.000 руб.")
    lazy var view10 = setUpQuestionView(titleQuestion: "Вопрос 10", sumOfQuestion: "32.000 руб.")
    lazy var view9 = setUpQuestionView(titleQuestion: "Вопрос 9", sumOfQuestion: "16.000 руб.")
    lazy var view8 = setUpQuestionView(titleQuestion: "Вопрос 8", sumOfQuestion: "8.000 руб.")
    lazy var view7 = setUpQuestionView(titleQuestion: "Вопрос 7", sumOfQuestion: "4.000 руб.")
    lazy var view6 = setUpQuestionView(titleQuestion: "Вопрос 6", sumOfQuestion: "2.000 руб.")
    lazy var view5 = setUpQuestionView(titleQuestion: "Вопрос 5", sumOfQuestion: "1.000 руб.")
    lazy var view4 = setUpQuestionView(titleQuestion: "Вопрос 4", sumOfQuestion: "500 руб.")
    lazy var view3 = setUpQuestionView(titleQuestion: "Вопрос 3", sumOfQuestion: "300 руб.")
    lazy var view2 = setUpQuestionView(titleQuestion: "Вопрос 2", sumOfQuestion: "200 руб.")
    lazy var view1 = setUpQuestionView(titleQuestion: "Вопрос 1", sumOfQuestion: "100 руб.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorTop: .topBackgroundColor() ?? .black, colorBottom: .bottomBackgroundColor() ?? .black)
        setup()
        setupConstraints()
    }
    
    
    private func setUpQuestionView(titleQuestion: String, sumOfQuestion: String) -> UIView {
            var questionView = UIView()
            questionView.translatesAutoresizingMaskIntoConstraints = false
            
//            var leftView = UIView()
//                leftView.backgroundColor = .bottomColor()
//                leftView.translatesAutoresizingMaskIntoConstraints = false
//            var rightView = UIView()
//                rightView.backgroundColor = .bottomColor()
//                rightView.translatesAutoresizingMaskIntoConstraints = false
                
            var questionLabel = UILabel(text: titleQuestion, font: .systemFont(ofSize: 20, weight: .regular), textAlignment: .left, color: .white)
            var rewardLabel = UILabel(text: sumOfQuestion, font: .systemFont(ofSize: 20, weight: .regular), textAlignment: .right, color: .white)
        var stack = UIStackView(subviews: [questionLabel, rewardLabel], axis: .horizontal, spacing: 0, aligment: .fill, distribution: .fillEqually)
//            leftView.addSubview(questionLabel)
//            rightView.addSubview(rewardLabel)
            
//        questionView.addSubview(leftView)
//        questionView.addSubview(rightView)
        
        questionView.addSubview(stack)
        questionView.backgroundColor = .bottomColor()
        questionView.layer.cornerRadius = 20
        
            
            NSLayoutConstraint.activate([
                
                questionLabel.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
                questionLabel.centerYAnchor.constraint(equalTo: stack.centerYAnchor),
//                leftView.widthAnchor.constraint(equalTo: questionView.widthAnchor, multiplier: 0.5),
//                leftView.leadingAnchor.constraint(equalTo: questionView.leadingAnchor),
//                leftView.topAnchor.constraint(equalTo: questionView.topAnchor),
//                leftView.bottomAnchor.constraint(equalTo: questionView.bottomAnchor),
//
//                rightView.widthAnchor.constraint(equalTo: questionView.widthAnchor, multiplier: 0.5),
//                rightView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor),
//                rightView.topAnchor.constraint(equalTo: questionView.topAnchor),
//                rightView.bottomAnchor.constraint(equalTo: questionView.bottomAnchor),
//
//                questionLabel.topAnchor.constraint(equalTo: leftView.topAnchor),
//                questionLabel.bottomAnchor.constraint(equalTo: leftView.bottomAnchor),
//                questionLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 10),
//                questionLabel.trailingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: -10),
//
//                rewardLabel.topAnchor.constraint(equalTo: rightView.topAnchor),
//                rewardLabel.bottomAnchor.constraint(equalTo: rightView.bottomAnchor),
//                rewardLabel.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 10),
//                rewardLabel.trailingAnchor.constraint(equalTo: rightView.trailingAnchor, constant: -10)
            ])
        

            return questionView
        }
    
    // MARK: add stack to view
    
    func setup() {
        
        self.view.addSubview(mainLogo)
        
        helpStackOne = UIStackView(subviews: [fiftyHelpButton, hallHelpButton,], axis: .horizontal, spacing: 5, aligment: .fill, distribution: .fillEqually)
        
        helpStackTwo = UIStackView(subviews: [friendsHelpButton, mistakeHelpButton], axis: .horizontal, spacing: 5, aligment: .fill, distribution: .fillEqually)
        
        helpStack = UIStackView(subviews: [helpStackOne, helpStackTwo], axis: .horizontal, spacing: 100, aligment: .fill, distribution: .fillEqually)
        self.view.addSubview(helpStack)
        

        
        questionAndRewardStack = UIStackView(subviews: [view15, view14, view13, view12, view11, view10, view9, view8, view7, view6, view5, view4, view3, view2, view1], axis: .vertical, spacing: 7, aligment: .fill, distribution: .fillEqually)
            self.view.addSubview(questionAndRewardStack)
        
        self.view.addSubview(goAhead)
        self.view.addSubview(takeMoney)
        
   
    }

    func helpButton(name: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: name), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func naviButton(title: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.titleLabel?.text = title
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc func fiftyHelpButtonAction() {
        print("Подсказка 50/50")
    }
    
    @objc func hallHelpButtonAction() {
        print("Помощь зала")
    }
    
    @objc func friendsHelpButtonAction() {
        print("Звонок другу")
    }
    
    @objc func mistakeHelpButtonAction() {
        print("Право на ошибку")
    }
    
    @objc func takeMoneyAction() {
        print("Забрать деньги")
    }
    
    @objc func goAheadAction() {
        print("Далее")
    }
    
// MARK: - Сonstraints
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mainLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLogo.heightAnchor.constraint(equalToConstant: 70),
            mainLogo.widthAnchor.constraint(equalTo: mainLogo.heightAnchor),
      
            helpStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            helpStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            helpStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            helpStack.heightAnchor.constraint(equalToConstant: 50),
        
            questionAndRewardStack.topAnchor.constraint(equalTo: helpStack.bottomAnchor, constant: 30),
            questionAndRewardStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            questionAndRewardStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            questionAndRewardStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            goAhead.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            goAhead.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
//            goAhead.topAnchor.constraint(equalTo: questionAndRewardStack.bottomAnchor, constant: 30)
        ])
    }
    
}
