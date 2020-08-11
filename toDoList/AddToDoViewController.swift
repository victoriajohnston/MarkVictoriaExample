//
//  AddToDoViewController.swift
//  toDoList
//
//  Created by Apple on 5/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate  as? AppDelegate)?.persistentContainer.viewContext{
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            if let titleText = titleTextField.text{
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
    }
    
}
