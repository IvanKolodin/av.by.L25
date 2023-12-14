//
//  ViewController.swift
//  av.by.L25
//
//  Created by Наталья Белоусова on 14.12.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let advertisementVC = AdvertisementViewController()
        let advertisementNavController = UINavigationController(rootViewController: advertisementVC)
        
        let searchVC = UIViewController()
        searchVC.view.backgroundColor = .white
        searchVC.title = "Поиск"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let subscriptionsVC = UIViewController()
        subscriptionsVC.view.backgroundColor = .white
        subscriptionsVC.title = "Подписки"
        subscriptionsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let addVC = UIViewController()
        addVC.view.backgroundColor = .white
        addVC.title = "Добавить"
        addVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        let messagesVC = UIViewController()
        messagesVC.view.backgroundColor = .white
        messagesVC.title = "Сообщения"
        messagesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 3)
        
        let menuVC = UIViewController()
        menuVC.view.backgroundColor = .white
        menuVC.title = "Меню"
        menuVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 4)
        
        viewControllers = [advertisementNavController, searchVC, subscriptionsVC, addVC, messagesVC, menuVC]
    }
}
class AdvertisementViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(AdvertisementCell.self, forCellWithReuseIdentifier: "AdvertisementCell")
        return collectionView
    }()
    
    let advertisements: [Advertisement] = [
        Advertisement(imageName: "Audi R8", title: "4.2 л, 420 л.с., бензин, робот, 4WD", price: "$20,000"),
        Advertisement(imageName: "BMW", title: "2.0 л, 245 л.с., бензин, АКПП, задний", price: "$25,000"),
        Advertisement(imageName: "Celica", title: "1.8 л, 190 л.с., бензин, АКПП, передний", price: "$30,000"),
        Advertisement(imageName: "Lancer X", title: "1.8 л, 143 л.с., бензин, вариатор, передний", price: "$18,000"),
        Advertisement(imageName: "Mersedes", title: "2.0 л, 184 л.с., бензин, АКПП, задний", price: "$22,000"),
        Advertisement(imageName: "Nissan 370z", title: "3.7 л, 331 л.с., бензин, автомат, задний", price: "$28,000"),
        Advertisement(imageName: "Toyota Crown s170", title: "2.5 л, 180 л.с., бензин, автомат, задний", price: "$15,000"),
        Advertisement(imageName: "Toyota Supra", title: "3.0 л, 340 л.с., бензин, АКПП, задний", price: "$24,000"),
        Advertisement(imageName: "Toyta mark 2", title: "2.0 л, 160 л.с., бензин, АКПП, задний", price: "$21,000"),
        Advertisement(imageName: "Volvo", title: "2.9 л, 272 л.с., бензин, АКПП, передний", price: "$19,000")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return advertisements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertisementCell", for: indexPath) as? AdvertisementCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: advertisements[indexPath.item])
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}

class AdvertisementCell: UICollectionViewCell {
    
    let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            return stackView
        }()

        let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textColor = .black
            label.numberOfLines = 2
            return label
        }()

        let priceLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .gray
            return label
        }()

        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            return imageView
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)

            addSubview(stackView)
            addSubview(titleLabel)
            addSubview(priceLabel)

            stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            stackView.heightAnchor.constraint(equalToConstant: 150).isActive = true

            titleLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true

            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true

            layer.borderWidth = 1.0
            layer.borderColor = UIColor.lightGray.cgColor
            layer.cornerRadius = 8.0
            clipsToBounds = true
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func configure(with advertisement: Advertisement) {
            imageView.image = UIImage(named: advertisement.imageName)
            imageView.layer.borderWidth = 1.0
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            stackView.addArrangedSubview(imageView)

            titleLabel.text = advertisement.title
            priceLabel.text = advertisement.price
        }
    }
    
    struct Advertisement {
        let imageName: String
        let title: String
        let price: String
    }
    
    let tabBarController = TabBarController()

