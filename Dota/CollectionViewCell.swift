//
//  CollectionViewCell.swift
//  Dota
//
//  Created by fahad rasheed on 08/09/2020.
//  Copyright © 2020 fahad rasheed. All rights reserved.
//

import UIKit
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    
//   override func awakeFromNib() {
//        super.awakeFromNib()
//    
//    }
    
    func setUi(cat:Hero){
        img.downloaded(from: cat.imageurl)
        lbl.text = cat.name
        
        
    }
    
    
}
