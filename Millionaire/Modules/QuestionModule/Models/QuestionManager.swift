import Foundation

/// Data Manager to fetch any questions from QuestionDataBase
final class QuestionManager {
    
    static let shared = QuestionManager()
    private (set) var currentQuestion: Question?
    
    private let totalQuestions = 15
    
    private let lowQuestions = QuestionDataBase.shared.fetchRandomLowQuestions()
    private let mediumQuestions = QuestionDataBase.shared.fetchRandomMediumQuestions()
    private let hardQuestions = QuestionDataBase.shared.fetchRandomHardQuestions()
    
    private var currentQuestionIndex = 0
    private var currentTypeQuestion: QuestionType = .low
        
    // Func to fetch new request for different levels
    func fetchNewQuestion() -> Question? {
        updateCurrentQuestion()
        return currentQuestion
    }
    
    // Func to check on the right answer
    func checkAnswer(with answer: [Bool: String]) -> Bool {

        return false
    }
    
    // Private func to generate random quesion
    private func updateCurrentQuestion() {
        let totalForEach = totalQuestions / 3
        
        if totalQuestions % 3 != 0 {
            return
        }
        
        if lowQuestions.count < totalForEach || mediumQuestions.count < totalForEach || hardQuestions.count < totalForEach {
            return
        }
        
        switch currentTypeQuestion {
        case .low:
            if currentQuestionIndex < totalForEach {
                currentQuestion = lowQuestions[currentQuestionIndex]
                currentQuestionIndex += 1
            } else {
                currentTypeQuestion = .medium
                currentQuestionIndex = 0
                currentQuestion = mediumQuestions[currentQuestionIndex]
                currentQuestionIndex += 1
            }
        case .medium:
            if currentQuestionIndex < totalForEach {
                currentQuestion = mediumQuestions[currentQuestionIndex]
                currentQuestionIndex += 1
            } else {
                currentTypeQuestion = .hard
                currentQuestionIndex = 0
                currentQuestion = hardQuestions[currentQuestionIndex]
                currentQuestionIndex += 1
            }
        case .hard:
            if currentQuestionIndex < totalForEach {
                currentQuestion = hardQuestions[currentQuestionIndex]
                currentQuestionIndex += 1
            }
        }
    }
}
