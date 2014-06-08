//
//  ZZNToDoListTableViewController.swift
//  ToDoList
//
//  Created by Zainan Zhou on 2014-06-07.
//  Copyright (c) 2014 Zainan Zhou. All rights reserved.
//

import UIKit

@objc(ZZNToDoListTableViewController) class ZZNToDoListTableViewController: UITableViewController {

    var toDoListItems: ToDoItem[] = ToDoItem[]()
    
    @IBAction func unwindToList(segue:UIStoryboardSegue) {
        let source = segue.sourceViewController as ZZNAddToDoItemViewController
        let item = source.toDoItem
        if (item) {
            self.toDoListItems.append(item!)
            tableView.reloadData()
        }
    }

    init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder:aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return self.toDoListItems.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        var cellIdentifier:String = "ListPrototypeCell"
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        let toDoItem = toDoListItems[indexPath.row]
        cell.textLabel.text = toDoItem.title
        
        if (toDoItem.isCompleted) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell as UITableViewCell
    }

    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var tappedItem:ToDoItem = toDoListItems[indexPath.row]
        tappedItem.markAsCompleted(!tappedItem.isCompleted)
        var indexPaths:NSIndexPath[] = [indexPath]
        tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.None)
        
    }
    
    func loadInitData() {
        var item1: ToDoItem = ToDoItem()
        item1.markAsCompleted(true)
        item1.title = "Create job for America"
        toDoListItems.append(item1)
        var item2: ToDoItem = ToDoItem()
        item2.markAsCompleted(false)
        item2.title = "Make World Peace"
        toDoListItems.append(item2)
    }

}
