//
//  ViewController.swift
//  Dota
//
//  Created by fahad rasheed on 08/09/2020.
//  Copyright © 2020 fahad rasheed. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,UICollectionViewDataSource{
    
    @IBOutlet weak var collection: UICollectionView!
    
    var heroes = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        let url = URL( string:"https://www.simplifiedcoding.net/demos/marvel/")
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            
            if error == nil {
                do {
                    self.heroes = try JSONDecoder().decode([Hero].self, from: data!)
                }
                catch
                {
                    print("error")
                }
                DispatchQueue.main.async {
                    self.collection.reloadData()
                }
            }
            
        }.resume()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       print(heroes.count)
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
          cell.setUi(cat: heroes[indexPath.row])
        
//         cell.lbl.text = heroes[indexPath.row].localized_name.capitalized
//         cell.img.contentMode = .scaleAspectFill
//        let defaultlink = "https://api.opendota.com/"
//        let completeLink = defaultlink + heroes[indexPath.row].img
//        print(completeLink)
//        cell.img.downloaded(from: completeLink)
        return cell
        }
        
    }
    




