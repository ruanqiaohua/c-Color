//
//  ViewController.m
//  OpenCV-Color
//
//  Created by 阮巧华 on 2019/12/9.
//  Copyright © 2019 阮巧华. All rights reserved.
//

#import "ViewController.h"
#import "OpenCVImageTool.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *inputImageView;

@property (nonatomic, weak) IBOutlet UIImageView *outputImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Action

- (IBAction)inputImageViewTap:(UITapGestureRecognizer *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.modalPresentationStyle = UIModalPresentationFullScreen;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    [self showDetailViewController:picker sender:nil];
}

- (IBAction)repayRedButtonAction:(UIButton *)sender {
    
    if (!_inputImageView.image) return;

    UIImage *image = [OpenCVImageTool repayRedImage:_inputImageView.image];
    _outputImageView.image = image;
}

- (IBAction)repayBlueButtonAction:(UIButton *)sender {
    
    if (!_inputImageView.image) return;

    UIImage *image = [OpenCVImageTool repayBuleImage:_inputImageView.image];
    _outputImageView.image = image;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (image) {
        _inputImageView.image = image;
    }
}

@end