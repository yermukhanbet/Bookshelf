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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewBook))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(reset))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.title = "Books"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(BookCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        //print(type(of: books))
    }
    @objc func addNewBook(){
        let addBook = AddBook()
        addBook.saveArrayFromListViewController(booksFromListView: books)
        print(type(of: books))
        present(addBook, animated: true, completion: nil)
    }
    @objc func reset(){
        var indexPaths = [IndexPath]()
        for row in books.indices{
           print(row)
            let indexPath = IndexPath(item: row, section: 0)
            indexPaths.append(indexPath)
        }
        books.removeAll()
        tableView.deleteRows(at: indexPaths, with: .fade)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func copyBooksFromAddBookVC(booksFromAddBookVC: [Book]){
        books = booksFromAddBookVC
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BookCell
        cell.linkToTableView = self
        let book = books[indexPath.row]
        cell.textLabel?.text = book.nameOfBook! + " by " + book.nameOfAuthor!
        print(book.hasFavoured as Any)
        cell.accessoryView?.tintColor = book.hasFavoured! ? UIColor.red : .lightGray
        
        return cell
    }
    func someMethodToCall(cell: UITableViewCell){
        let tappedCell = tableView.indexPath(for: cell)
        let tappedBook = books[tappedCell!.row]
        let hasFavourited = tappedBook.hasFavoured
        tappedBook.hasFavoured = !hasFavourited!
        print(tappedBook.hasFavoured!)
        tableView.reloadRows(at: [tappedCell!], with: .fade)
        
    }
    
}
