//
//  ViewController.swift
//  UserProfile
//
//  Created by Yernur Adilbek on 10/19/23.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    private lazy var workTopView : UIView={
        let containerView = UIView()
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = .systemBackground
        containerView.isHidden = true
        return containerView
    }()
    
    private lazy var workImage: UIImageView = {
        let image = UIImage(named: "Image")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var aboutTopView : UIView={
        let containerView = UIView()
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = .systemBackground
        return containerView
    }()
    
    private lazy var aboutImage: UIImageView = {
        let image = UIImage(named: "Image")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.text = "Software\nEngineer"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .systemGray
        label.numberOfLines = 2
        return label
    }()
    
    let items = ["About", "Work"]
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentTintColor = .systemCyan
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemCyan], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        return segmentedControl
    }()
    
    private lazy var workView : UIView={
        let containerView = UIView()
        containerView.isHidden = true
        return containerView
    }()
    private lazy var containerView1 : UIView={
        let containerView = UIView()
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = .systemBackground
        return containerView
    }()
    private lazy var containerView2 : UIView={
        let containerView = UIView()
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = .systemBackground
        return containerView
    }()
    private lazy var containerView3 : UIView={
        let containerView = UIView()
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = .systemBackground
        return containerView
    }()
    private lazy var containerView4 : UIView={
        let containerView = UIView()
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = .systemBackground
        return containerView
    }()
    
    private lazy var aboutView : UIView={
        let containerView = UIView()
        return containerView
    }()
    private lazy var tableView1 : UIView={
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemBackground
        return view
    }()
    private lazy var tableView2 : UIView={
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemBackground
        return view
    }()
    private lazy var tableView3 : UIView={
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    
    
    func textLabel(text: String, fontSize: CGFloat = 16, weight: UIFont.Weight = .regular, color: UIColor = .black)-> UILabel{
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textColor = color
        return label
    }
    func imageView(imageName: String, tintColor: UIColor = .gray, contentMode: UIView.ContentMode = .scaleAspectFit)-> UIImageView{
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.tintColor = tintColor
        imageView.contentMode = contentMode
        return imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func indexChanged(_ segmentedControl: UISegmentedControl){
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            workTopView.isHidden = true
            workView.isHidden = true
            
            aboutView.isHidden = false
            aboutTopView.isHidden = false
        case 1:
            workTopView.isHidden = false
            workView.isHidden = false
            
            aboutView.isHidden = true
            aboutTopView.isHidden = true
        default:
            break
        }
    }
}

//MARK: - setupUI
extension ViewController{
    func setupUI(){
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        view.backgroundColor = UIColor(red: 182/255, green: 208/255, blue: 226/255, alpha: 1)
        
        view.addSubview(workTopView)
        workTopView.addSubview(jobLabel)
        workTopView.addSubview(workImage)
        view.addSubview(segmentedControl)
        view.addSubview(workView)
        
        workView.addSubview(containerView1)
        workView.addSubview(containerView2)
        workView.addSubview(containerView3)
        workView.addSubview(containerView4)
        
        view.addSubview(aboutTopView)
        aboutTopView.addSubview(aboutImage)
        view.addSubview(aboutView)
        aboutView.addSubview(tableView1)
        aboutView.addSubview(tableView2)
        aboutView.addSubview(tableView3)
    }
    
    func setupConstraints(){
        workTopView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(70)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(280)
        }
        
        workImage.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(180)
            make.height.equalTo(260)
        }
        
        jobLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        var type = textLabel(text: "Type", fontSize: 13, color: .systemGray3)
        workTopView.addSubview(type)
        type.snp.makeConstraints{make in
            make.top.equalTo(jobLabel.snp.bottom).offset(10)
            make.leading.equalTo(jobLabel)
        }
        
        var typeBottom = textLabel(text: "Senior Employee", color: .systemGray)
        workTopView.addSubview(typeBottom)
        typeBottom.snp.makeConstraints{make in
            make.top.equalTo(type.snp.bottom)
            make.leading.equalTo(type)
        }
        
        var joined = textLabel(text: "Joined", fontSize: 13, color: .systemGray3)
        workTopView.addSubview(joined)
        joined.snp.makeConstraints{make in
            make.top.equalTo(typeBottom.snp.bottom).offset(10)
            make.leading.equalTo(jobLabel)
        }
        
        var joinedBottom = textLabel(text: "Sep 2018", color: .systemGray)
        workTopView.addSubview(joinedBottom)
        joinedBottom.snp.makeConstraints{make in
            make.top.equalTo(joined.snp.bottom)
            make.leading.equalTo(jobLabel)
        }
        
        var experience = textLabel(text: "Experience", fontSize: 13, color: .systemGray3)
        workTopView.addSubview(experience)
        experience.snp.makeConstraints{make in
            make.top.equalTo(joinedBottom.snp.bottom).offset(10)
            make.leading.equalTo(jobLabel)
        }
        
        var experienceBottom = textLabel(text: "4 Years", color: .systemGray)
        workTopView.addSubview(experienceBottom)
        experienceBottom.snp.makeConstraints{make in
            make.top.equalTo(experience.snp.bottom)
            make.leading.equalTo(jobLabel)
        }
        
        segmentedControl.snp.makeConstraints{make in
            make.top.equalTo(workTopView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        workView.snp.makeConstraints{make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(30)
        }
        
        containerView1.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(workView.snp.height).dividedBy(2).inset(5)
            make.width.equalTo(workView.snp.width).dividedBy(2).inset(5)
        }
        var n1 = textLabel(text: "17", fontSize: 50, color: .systemGray)
        containerView1.addSubview(n1)
        var t1 = textLabel(text: "Projects\ndone", fontSize: 15, color: .systemGray3)
        t1.numberOfLines=2
        t1.textAlignment = .center
        n1.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }
        containerView1.addSubview(t1)
        t1.snp.makeConstraints{make in
            make.top.equalTo(n1.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        containerView2.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(workView.snp.height).dividedBy(2).inset(5)
            make.width.equalTo(workView.snp.width).dividedBy(2).inset(5)
        }
        var n2 = textLabel(text: "92%", fontSize: 50, color: .systemGray)
        containerView2.addSubview(n2)
        var t2 = textLabel(text: "Success\nrate", fontSize: 15, color: .systemGray3)
        t2.numberOfLines=2
        t2.textAlignment = .center
        n2.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }
        containerView2.addSubview(t2)
        t2.snp.makeConstraints{make in
            make.top.equalTo(n2.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        containerView3.snp.makeConstraints{make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(workView.snp.height).dividedBy(2).inset(5)
            make.width.equalTo(workView.snp.width).dividedBy(2).inset(5)
        }
        var n3 = textLabel(text: "243", fontSize: 50, color: .systemGray)
        containerView3.addSubview(n3)
        var t3 = textLabel(text: "Client\nreports", fontSize: 15, color: .systemGray3)
        t3.numberOfLines=2
        t3.textAlignment = .center
        n3.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }
        containerView3.addSubview(t3)
        t3.snp.makeConstraints{make in
            make.top.equalTo(n3.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        containerView4.snp.makeConstraints{make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(workView.snp.height).dividedBy(2).inset(5)
            make.width.equalTo(workView.snp.width).dividedBy(2).inset(5)
        }
        var n4 = textLabel(text: "5", fontSize: 50, color: .systemGray)
        containerView4.addSubview(n4)
        var t4 = textLabel(text: "Teams", fontSize: 15, color: .systemGray3)
        n4.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }
        containerView4.addSubview(t4)
        t4.snp.makeConstraints{make in
            make.top.equalTo(n4.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        //MARK: - ABOUT
        
        aboutTopView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(70)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(280)
        }
        
        aboutImage.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(180)
            make.height.equalTo(260)
        }
        
        var name = textLabel(text: "Yernur\nAdilbek", fontSize: 40, weight: .bold, color: .systemGray)
        name.numberOfLines = 2
        aboutTopView.addSubview(name)
        name.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(aboutImage.snp.trailing).offset(10)
        }
        
        
        var email = textLabel(text: "Email", fontSize: 13, color: .systemGray3)
        aboutTopView.addSubview(email)
        email.snp.makeConstraints{make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.leading.equalTo(name)
        }
        
        var emailBottom = textLabel(text: "adilernur@gmail.com", color: .systemGray)
        aboutTopView.addSubview(emailBottom)
        emailBottom.snp.makeConstraints{make in
            make.top.equalTo(email.snp.bottom)
            make.leading.equalTo(email)
        }
        
        var birth = textLabel(text: "Date of Birth", fontSize: 13, color: .systemGray3)
        aboutTopView.addSubview(birth)
        birth.snp.makeConstraints{make in
            make.top.equalTo(emailBottom.snp.bottom).offset(10)
            make.leading.equalTo(name)
        }
        
        var birthBottom = textLabel(text: "February, 27, 2004", color: .systemGray)
        aboutTopView.addSubview(birthBottom)
        birthBottom.snp.makeConstraints{make in
            make.top.equalTo(birth.snp.bottom)
            make.leading.equalTo(name)
        }
        
        var address = textLabel(text: "Address", fontSize: 13, color: .systemGray3)
        aboutTopView.addSubview(address)
        address.snp.makeConstraints{make in
            make.top.equalTo(birthBottom.snp.bottom).offset(10)
            make.leading.equalTo(name)
        }
        
        var addressBottom = textLabel(text: "Aktobe, Kazakhstan", color: .systemGray)
        aboutTopView.addSubview(addressBottom)
        addressBottom.snp.makeConstraints{make in
            make.top.equalTo(address.snp.bottom)
            make.leading.equalTo(name)
        }
        
        
        aboutView.snp.makeConstraints{make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(30)
        }
        tableView1.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(110)
        }
        var bio = textLabel(text: "BIO", color: .systemGray)
        tableView1.addSubview(bio)
        bio.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        var bioBottom = textLabel(text: "It can also be successfully used as a daily exercise to get writers to begin writing. Being shown a random sentence and using it to complete a paragraph each day can be an excellent way to begin any writing session.", fontSize: 13, color: .systemGray2)
        bioBottom.numberOfLines = 0
        tableView1.addSubview(bioBottom)
        bioBottom.snp.makeConstraints{make in
            make.top.equalTo(bio.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
        
        tableView2.snp.makeConstraints{make in
            make.top.equalTo(tableView1.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
        var web = textLabel(text: "ON THE WEB", color: .systemGray)
        tableView2.addSubview(web)
        web.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        let linkedin = imageView(imageName: "linkedin")
        let twitter = imageView(imageName: "twitter")
        let facebook = imageView(imageName: "facebook")
        let instagram = imageView(imageName: "instagram")
        tableView2.addSubview(linkedin)
        linkedin.snp.makeConstraints{make in
            make.top.equalTo(web.snp.bottom).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leading.equalTo(web)
        }
        tableView2.addSubview(twitter)
        twitter.snp.makeConstraints{make in
            make.top.equalTo(web.snp.bottom).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leading.equalTo(linkedin.snp.trailing).offset(10)
        }
        tableView2.addSubview(facebook)
        facebook.snp.makeConstraints{make in
            make.top.equalTo(web.snp.bottom).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leading.equalTo(twitter.snp.trailing).offset(10)
        }
        tableView2.addSubview(instagram)
        instagram.snp.makeConstraints{make in
            make.top.equalTo(web.snp.bottom).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leading.equalTo(facebook.snp.trailing).offset(10)
        }
        
        tableView3.snp.makeConstraints{make in
            make.top.equalTo(tableView2.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        var website = textLabel(text: "WEBSITE", color: .systemGray)
        tableView3.addSubview(website)
        website.snp.makeConstraints{make in
            make.top.leading.equalToSuperview().offset(20)
        }
        
        var websiteInfo = textLabel(text: "www.portfolio.edu.com", color: .systemGray2)
        tableView3.addSubview(websiteInfo)
        websiteInfo.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(website)
        }
        var phone = textLabel(text: "PHONE", color: .systemGray)
        tableView3.addSubview(phone)
        phone.snp.makeConstraints{make in
            make.top.equalTo(website.snp.bottom).offset(20)
            make.leading.equalTo(website)
        }
        var phoneInfo = textLabel(text: "+7(707)-227-20-04", color: .systemGray2)
        tableView3.addSubview(phoneInfo)
        phoneInfo.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(phone)
        }
    }
}
