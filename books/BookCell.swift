 //
//  BookCell.swift
//  books
//
//  Created by Yessen Yermukhanbet on 6/17/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import UIKit
 
 class BookCell: UITableViewCell{
    var linkToTableView: tableView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //backgroundColor = .lightGray
        let editButton = UIButton(type: .system)
        let image = UIImage(named: "fav_star.png")
        editButton.setImage(image, for: .normal)
        editButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        editButton.tintColor = .red
        editButton.addTarget(self, action: #selector(handleMarkAsFavor), for: .touchUpInside)
        accessoryView = editButton
    }
    @objc func handleMarkAsFavor(){
        linkToTableView?.someMethodToCall(cell: self)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 }
