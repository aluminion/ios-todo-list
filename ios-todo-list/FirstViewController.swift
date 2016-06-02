//
//  FirstViewController.swift
//  ios-todo-list
//
//  Created by Lucas Le on 6/3/16.
//  Copyright © 2016 Lucas Le. All rights reserved.
//

import UIKit

var toDoList = [String]()

func updateDB(){
    NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
}


class FirstViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet var toDoListTable: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            updateDB()
            toDoListTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
    }

}

