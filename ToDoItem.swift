//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Zainan Zhou on 2014-06-07.
//  Copyright (c) 2014 Zainan Zhou. All rights reserved.
//

import Foundation


class ToDoItem {
    var isCompleted:Bool = false
    var title:String = ""
    var completionDate:NSDate? = nil // TODO(zzn) What is question mark?
    
    func markAsCompleted(isCompleted: Bool) -> Void {
        self.isCompleted = isCompleted
    }
    
}