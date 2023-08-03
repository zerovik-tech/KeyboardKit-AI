//
//  KeyboardAppearance.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-10.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

import CoreGraphics
import SwiftUI

/**
 This protocol can be implemented by classes that can define
 styles and appearances for different parts of a keyboard.
 
 KeyboardKit will create a ``StandardKeyboardAppearance`` as
 the keyboard extension is started, then apply this instance
 to ``KeyboardInputViewController/keyboardAppearance``. This
 instance will then be used by default to determine how your
 appearance-based views will look.
 
 If you want to change the style of some buttons or callouts
 or change the the text or image to use for buttons, you can
 implement a custom keyboard appearance.

 To create a custom implementation of this protocol, you can
 implement it from scratch or inherit the standard class and
 override the parts that you want to change. When the custom
 implementation is done, you can just replace the controller
 service to make KeyboardKit use the custom service globally.
 */
public protocol KeyboardAppearance: AnyObject {

    /**
     The keyboard background style to apply to the keyboard.
     */
    var backgroundStyle: KeyboardStyle.Background { get }

    /**
     The foreground color to apply to the keyboard, if any.
     */
    var foregroundColor: Color? { get }

    /**
     The edge insets to apply to the entire keyboard.
     */
    var keyboardEdgeInsets: EdgeInsets { get }


    // MARK: - Buttons

    /**
     The button image to use for a certain `action`, if any.
     */
    func buttonImage(for action: KeyboardAction) -> Image?

    /**
     The scale factor to apply to a button image, if any.
     */
    func buttonImageScaleFactor(for action: KeyboardAction) -> CGFloat
    
    /**
     The button style to use for a certain `action`, given a
     certain `isPressed` state.
     */
    func buttonStyle(for action: KeyboardAction, isPressed: Bool) -> KeyboardStyle.Button
    
    /**
     The button text to use for a certain `action`, if any.
     */
    func buttonText(for action: KeyboardAction) -> String?


    // MARK: - Callouts

    /**
     The style to apply to ``ActionCallout`` views.
     */
    var actionCalloutStyle: KeyboardStyle.ActionCallout { get }
    
    /**
     The style to apply to ``InputCallout`` views.
     */
    var inputCalloutStyle: KeyboardStyle.InputCallout { get }


    // MARK: - Callouts

    /**
     The style to use for ``AutocompleteToolbar`` views.
     */
    var autocompleteToolbarStyle: AutocompleteToolbarStyle { get }
}
