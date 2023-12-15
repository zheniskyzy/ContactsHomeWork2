//
//  TableViewController.swift
//  ContactsHomework
//
//  Created by Madina Olzhabek on 14.12.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayOfContacts: [ContactsInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        do{
            if let data = defaults.data(forKey: "name"){
                let array = try JSONDecoder().decode([ContactsInfo].self, from: data)
                 arrayOfContacts = array
            }
            
        }catch{
            print("unbleto to encode \(error)")
        }
            tableView.reloadData()
    }

    func saveContacts(){
        let defaults = UserDefaults.standard
        do{
            let encodedata = try JSONEncoder().encode(arrayOfContacts )
                defaults.set(encodedata, forKey: "name")
            } catch {
                print("unbleto to encode \(error)")
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfContacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrayOfContacts[indexPath.row].name
        cell.detailTextLabel?.text = arrayOfContacts[indexPath.row].number

        // Configure the cell...
        
            cell.accessoryType = .disclosureIndicator
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayOfContacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveContacts()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
