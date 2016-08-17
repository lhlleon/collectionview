//
//  ViewController.m
//  collectionview
//
//  Created by LiHanlun on 16/3/30.
//  Copyright © 2016年 LiHanlun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView * imageCollection;
    UICollectionViewCell * cell;
}

@property (nonatomic,strong) NSArray * imageTu;




@end

@implementation ViewController

static NSString * Identifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建数据源
    _imageTu = @[@"qbhd",@"yszl",@"dyhd",@"xjqy",@"whsl",@"yyyc",@"yysj",@"ydjs",@"chwl",@"szhy",@"pdyd",@"zjzp",@"hwly",@"jyqz",@"gyhb",@"zmqt",@"sshd",@"fcjj",@"qchd",@"sqhd",@"schd"];
    

    
    [self createButton];
    
    
    
}


-(void)createButton
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //    if (self.view.frame.size.width == 320) {
    //            imageCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 66, self.view.frame.size.width, self.view.frame.size.height -66) collectionViewLayout:flowLayout];
    //    }else{
    
    
    imageCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    //    }
    NSLog(@"当前屏幕高度  ===   %f",self.view.frame.size.width);
    imageCollection.delegate = self;
    imageCollection.dataSource = self;
    imageCollection.showsVerticalScrollIndicator = NO;
    [imageCollection setBackgroundColor:[UIColor clearColor]]
    ;
    [imageCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:Identifier];
    [self.view addSubview:imageCollection];
    
}


#pragma mark - collection代理设置

//cell的个数

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageTu.count;
}

//section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    NSLog(@"%lu",(unsigned long)_imageTu.count);
    for (int i = 0; i <21; i ++) {
        if (indexPath.row == i) {
            UIImageView * image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_imageTu[i]]];

            [cell setBackgroundView:image];
            [cell setBackgroundColor:[UIColor blueColor]];
        }
    }
    return cell;
    
}

#pragma mark - UICollectionViewDelegate

//定义每个UICollection的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/3-10, self.view.frame.size.width/3 - 25);
}

//定义每个collectionview的范围
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
