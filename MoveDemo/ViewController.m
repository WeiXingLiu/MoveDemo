//
//  ViewController.m
//  MoveDemo
//
//  Created by qianfeng007 on 15/8/11.
//  Copyright (c) 2015年 刘卫星. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger _count;
    NSMutableArray*_arr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _count=1;
    
    UIImageView*ImageView2=[[UIImageView alloc]init];
    UISwipeGestureRecognizer*swip3=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(move:)];
    swip3.direction=UISwipeGestureRecognizerDirectionLeft;
    [ImageView2 addGestureRecognizer:swip3];
    
    UISwipeGestureRecognizer*swip4=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(move:)];
    swip4.direction=UISwipeGestureRecognizerDirectionRight;
    [ImageView2 addGestureRecognizer:swip4];
    ImageView2.userInteractionEnabled=YES;
    ImageView2.tag=2;
    [self.view addSubview:ImageView2];
    
    UIImageView*ImageView1=[[UIImageView alloc]initWithFrame:self.view.bounds];
    UISwipeGestureRecognizer*swip1=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(move:)];
    swip1.direction=UISwipeGestureRecognizerDirectionLeft;
    [ImageView1 addGestureRecognizer:swip1];
    
    UISwipeGestureRecognizer*swip2=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(move:)];
    swip2.direction=UISwipeGestureRecognizerDirectionRight;
    [ImageView1 addGestureRecognizer:swip2];
    ImageView1.image=[UIImage imageNamed:[NSString stringWithFormat:@"41_%ld.jpg",_count]];
    ImageView1.userInteractionEnabled=YES;
    ImageView1.tag=1;
    [self.view addSubview:ImageView1];
    _arr=[[NSMutableArray alloc]initWithObjects:ImageView1,ImageView2, nil];
}
-(void)leftMove:(NSInteger)count{
    UIImageView*imageView1=nil;
    UIImageView*imageView2=nil;
    if (count==1) {
        imageView1=(UIImageView*)[self.view viewWithTag:1];
        imageView2=(UIImageView*)[self.view viewWithTag:2];
    } else {
        imageView1=(UIImageView*)[self.view viewWithTag:2];
        imageView2=(UIImageView*)[self.view viewWithTag:1];
    }
    imageView2.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        imageView1.frame=CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        imageView2.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        imageView2.image=[UIImage imageNamed:[NSString stringWithFormat:@"41_%ld.jpg",_count]];
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)rightMove:(NSInteger)count{
    UIImageView*imageView1=nil;
    UIImageView*imageView2=nil;
    if (count==1) {
        imageView1=(UIImageView*)[self.view viewWithTag:1];
        imageView2=(UIImageView*)[self.view viewWithTag:2];
    } else {
        imageView1=(UIImageView*)[self.view viewWithTag:2];
        imageView2=(UIImageView*)[self.view viewWithTag:1];
    }
    imageView2.frame=CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        imageView1.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        imageView2.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        imageView2.image=[UIImage imageNamed:[NSString stringWithFormat:@"41_%ld.jpg",_count]];
        
    } completion:^(BOOL finished) {
        
    }];

}
-(void)move:(UISwipeGestureRecognizer*)swip{
    if (swip.direction==UISwipeGestureRecognizerDirectionLeft) {
        if (_count==5) {
            _count=1;
        } else {
            _count++;
        }

        if (swip.view.tag==1) {
            [self leftMove:1];
            
        } else {
            [self leftMove:2];
        }
        
    } else {
        if (_count==1) {
            _count=5;
        } else {
            _count--;
        }
        if (swip.view.tag==1) {
            [self rightMove:1];
        } else {
            [self rightMove:2];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
