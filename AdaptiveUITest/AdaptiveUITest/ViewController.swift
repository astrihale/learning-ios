//
//  ViewController.swift
//  AdaptiveUITest
//
//  Created by Nexyy on 09/04/2020.
//  Copyright © 2020 Nexyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func resetList(_ sender: UIBarButtonItem) {
        let confirm = UIAlertController(title: "Confirmation", message: "Are you sure?", preferredStyle: .alert)
        
        let accept = UIAlertAction(title: "Yes", style: .destructive) { (UIAlertAction) in
            for task in self.dailyTasks {
                task.completed = false
            }
            
            for task in self.weeklyTasks {
                task.completed = false
            }
            
            for task in self.weeklyTasks {
                task.completed = false
            }
            
            self.table.reloadData()
        }
        
        let decline = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        confirm.addAction(accept)
        confirm.addAction(decline)
        
        self.present(confirm, animated: true, completion: nil)
    }
    
    let dailyTasks = [
        Task(name: "Check all windows", type: .Daily),
        Task(name: "Check all doors", type: .Daily),
        Task(name: "Is the boiler fueled?", type: .Daily),
        Task(name: "Check the mailbox", type: .Daily),
        Task(name: "Empty trash containers", type: .Daily),
        Task(name: "If freezing, check water pipes", type: .Daily),
        Task(name: "Document \"strange and unusual\" occurrences", type: .Daily)
    ]
    
    let weeklyTasks = [
        Task(name: "Check inside all cabins", type: .Weekly),
        Task(name: "Flush all lavatories in cabins", type: .Weekly),
        Task(name: "Walk the perimeter of property", type: .Weekly)
    ]
    
    let monthlyTasks = [
        Task(name: "Test security alarm", type: .Monthly),
        Task(name: "Test motion detectors", type: .Monthly),
        Task(name: "Test smoke alarms", type: .Monthly)
    ]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        let task: Task?
        
        switch indexPath.section {
        case 0:
            task = dailyTasks[indexPath.row]
        case 1:
            task = weeklyTasks[indexPath.row]
        case 2:
            task = monthlyTasks[indexPath.row]
        default:
            task = nil
        }
        
        cell.backgroundColor = .clear
        cell.textLabel?.text = task?.name ?? "Invalid row"
        
        if task?.completed ?? false {
            cell.textLabel?.isEnabled = false
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.isEnabled = true
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Undo") { (action, view, next) in
            switch indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].completed = false
            case 1:
                self.weeklyTasks[indexPath.row].completed = false
            case 2:
                self.monthlyTasks[indexPath.row].completed = false
            default:
                break
            }
            
            tableView.reloadData()
            next(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Complete") { (action, view, next) in
            switch indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.monthlyTasks[indexPath.row].completed = true
            default:
                break
            }
            
            tableView.reloadData()
            next(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    @IBOutlet weak var table: UITableView!
    
    @IBAction func toggleChange(_ sender: Any) {
        let mySwitch = sender as! UISwitch
    
        if mySwitch.isOn {
            view.backgroundColor = .systemTeal
        } else {
            view.backgroundColor = .systemBackground
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.backgroundColor = .clear
    }

}

