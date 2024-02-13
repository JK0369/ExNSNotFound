//
//  ViewController.swift
//  ExNSNotFound
//
//  Created by 김종권 on 2024/02/13.
//

import UIKit

class ViewController: UIViewController {
    private let tableView = {
        let view = UITableView()
        view.contentInset = .zero
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.estimatedRowHeight = 34
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // terminating due to uncaught exception of type NSException
            tableView.scrollToRow(at: .init(row: 0, section: 0), at: .top, animated: true)
        }
         */
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("test>", NSNotFound)
            self.tableView.scrollToRow(at: .init(row: NSNotFound, section: 0), at: .top, animated: true)
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
}
