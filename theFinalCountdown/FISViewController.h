//
//  FISViewController.h
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISViewController : UIViewController
{
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *pauseButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *resumeButton;


@property (nonatomic) NSInteger timerCountDown;
@property (nonatomic) NSInteger remainder;
@property (nonatomic) NSTimeInterval countDownInterval;





@end
