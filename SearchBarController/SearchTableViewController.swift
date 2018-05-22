//
//  SearchTableViewController.swift
//  SearchBarController
//
//  Created by nguyễn hữu đạt on 5/17/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController , UISearchResultsUpdating{
    
    var big0Team = ["DAT","A Ngoc Anh","A Luyen","Huy","A Thang","A Trung"]
    var bigStudents : [String] = []
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Data"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
    func updateSearchResults(for searchController: UISearchController) {
        bigStudents = big0Team.filter({ (student: String) -> Bool in
            return student.lowercased().contains(searchController.searchBar.text!.lowercased())
        })
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return bigStudents.count
        } else {
            return big0Team.count
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell...
        if searchController.isActive {
            cell.textLabel?.text = bigStudents[indexPath.row]
        } else {
            cell.textLabel?.text = big0Team[indexPath.row]
        }

        return cell
    }
}
