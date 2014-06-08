//
//  ZZNAddToDoItemViewController.swift
//  ToDoList
//
//  Created by Zainan Zhou on 2014-06-07.
//  Copyright (c) 2014 Zainan Zhou. All rights reserved.
//

import UIKit

class ZZNAddToDoItemViewController: UIViewController {
        
    @IBOutlet var textField : UITextField
    @IBOutlet var doneButton : UIBarButtonItem
    @IBOutlet var cancelButton : UIBarButtonItem
    var toDoItem: ToDoItem?
    @IBAction override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (sender as? NSObject != doneButton) {
            return
        } else {
            if (self.textField.text.utf16count > 0) {
                self.toDoItem = ToDoItem()
                toDoItem!.isCompleted = false
                toDoItem!.title = self.textField.text
                
            }
        }
    }
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
