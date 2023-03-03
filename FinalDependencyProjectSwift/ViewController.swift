//
//  ViewController.swift
//  FinalDependencyProjectSwift
//
//  Created by Raman Kozar on 01/03/2023.
//

import UIKit
import SkeletonView

public protocol SkeletonTableViewDataSource: UITableViewDataSource {
    func numSections(in collectionSkeletonView: UITableView) -> Int // Default: 1
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? // Default: nil
    func collectionSkeletonView(_ skeletonView: UITableView, prepareCellForSkeleton cell: UITableViewCell, at indexPath: IndexPath)
}

class ViewController: UIViewController, SkeletonTableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return "TableViewCell"
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        
        guard let currCell = tableViewTest.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
        else {
            return UITableViewCell()
        }
        
        currCell.isSkeletonable = true
        return currCell
        
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, prepareCellForSkeleton cell: UITableViewCell, at indexPath: IndexPath) {
        let cell = cell as? TableViewCell
        cell?.myLabel.text = "My first text"
    }
    
   
    @IBOutlet weak var tableViewTest: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewTest.delegate = self
        tableViewTest.dataSource = self
        
        tableViewTest.isSkeletonable = true
        
        view.showAnimatedSkeleton()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let currCell = tableViewTest.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
        else {
            return UITableViewCell()
        }
        
        currCell.isSkeletonable = true
        return currCell
        
    }

}

