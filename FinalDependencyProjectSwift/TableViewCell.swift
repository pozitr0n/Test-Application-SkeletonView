//
//  TableViewCell.swift
//  FinalDependencyProjectSwift
//
//  Created by Raman Kozar on 03/03/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
