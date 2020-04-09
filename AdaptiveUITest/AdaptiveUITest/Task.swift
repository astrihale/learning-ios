//
//  Task.swift
//  AdaptiveUITest
//
//  Created by Nexyy on 09/04/2020.
//  Copyright © 2020 Nexyy. All rights reserved.
//

import Foundation

enum TaskType {
    case Daily, Weekly, Monthly
}

class Task {
    let name: String
    let type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
    
    init(name: String, type: TaskType) {
        self.name = name
        self.type = type
        self.completed = false
    }
}
