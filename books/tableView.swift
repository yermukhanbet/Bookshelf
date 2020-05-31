//
//  tableView.swift
//  books
//
//  Created by Yessen Yermukhanbet on 5/30/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import Foundation
import UIKit

class tableView: UITableViewController {
    
    let cellId = "cellId123123"
    var books = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewBook))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = "Books"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
    }
    @objc func addNewBook(){
        let addBook = AddBook()
        addBook.saveArrayFromListViewController(booksFromListView: books)
        present(addBook, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func copyBooksFromAddBookVC(booksFromAddBookVC: [String]){
        books = booksFromAddBookVC
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let book = books[indexPath.row]
        cell.textLabel?.text = book
        
        return cell
    }
    
}
