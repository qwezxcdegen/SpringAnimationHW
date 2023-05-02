//
//  MainViewController.swift
//  SpringAnimationHW
//
//  Created by Степан Фоминцев on 02.05.2023.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet private var animationView: SpringView!
    
    @IBOutlet private var presetLabel: UILabel!
    @IBOutlet private var curveLabel: UILabel!
    @IBOutlet private var forceLabel: UILabel!
    @IBOutlet private var durationLabel: UILabel!
    @IBOutlet private var delayLabel: UILabel!
    
    @IBOutlet private var runAnimation: UIButton!
    
    // MARK: - Private Properties
    private var animation = Animation.getRandomAnimation()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        runAnimation.setTitle("Run \(animation.name)", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateView(animationView, withAnimation: animation)
        animation = Animation.getRandomAnimation()
    }

    // MARK: - IB Actions
    @IBAction private func runAnimationPressed() {
        setupLabels()
        animateView(animationView, withAnimation: animation)
        animation = Animation.getRandomAnimation()
        runAnimation.setTitle("Run \(animation.name)", for: .normal)
    }
    
    // MARK: - Private Methods
    private func animateView(_ view: SpringView, withAnimation animation: Animation) {
        view.animation = animation.name
        view.curve = animation.curve
        view.force = animation.force
        view.duration = animation.duration
        view.delay = animation.delay
        view.animate()
    }
    
    private func setupLabels() {
        presetLabel.text = animation.name
        curveLabel.text = animation.curve
        forceLabel.text = animation.force.formatted()
        durationLabel.text = animation.duration.formatted()
        delayLabel.text = animation.delay.formatted()
    }
    
}

