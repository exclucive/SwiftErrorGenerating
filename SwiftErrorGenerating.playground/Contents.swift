//: Playground - noun: a place where people can play

import UIKit
import Foundation

protocol APTErrorType {
    var code: Int {get}
    var title: String? {get}
    var description: String {get}
}

enum APTNetworkErrors: APTErrorType {
    case error1
    case error2
    
    var code: Int {
        switch self {
        case .error1:
            return 1001
        case .error2:
            return 1002
        default:
            return -1
        }
    }
    
    var title: String? {
        switch self {
        case .error1:
            return "error1"
        case .error2:
            return "error2"
        }
    }
    
    var description: String {
        switch self {
        case .error1:
            return "description error1"
        case .error2:
            return "description error2"
        default:
            return ""
        }
    }
}

struct APTError: LocalizedError {
    var title: String?
    var code: Int
    var errorDescription: String? { return internalDescription }
    var failureReason: String? { return internalDescription }

    private var internalDescription: String

    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self.internalDescription = description
        self.code = code
    }

    init(errorType: APTErrorType) {
        self.title = errorType.title
        self.internalDescription = errorType.description
        self.code = errorType.code
    }
    
    var printableDescription: String {
        get {
            return "\(title ?? ""): \(code)\n\(errorDescription ?? "")"
        }
    }
}

let exampleError = APTError(errorType: APTNetworkErrors.error1)
print(exampleError.printableDescription)
