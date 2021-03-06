//
//  PersonListTableViewController.swift
//  PersonsListApp
//
//  Created by MacBook on 20.04.2021.
//

import UIKit

class PersonListTableViewController: UITableViewController {

    var persons: [Person] = []
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fullName", for: indexPath)
        let person = persons[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailInfoVC = segue.destination as? DetailInfoViewController else {return}
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let person = persons[indexPath.row]
        detailInfoVC.person = person
    }
}
