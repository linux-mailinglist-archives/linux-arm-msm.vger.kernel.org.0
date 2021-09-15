Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4CC40BDDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 04:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhIOCqL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 22:46:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15490 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229763AbhIOCqJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 22:46:09 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F2g7XS017546;
        Wed, 15 Sep 2021 02:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=cS4qtmGYe4tF59m9fynuZA/iUFfQ9gIwEqX/rTOnOq8=;
 b=mdJEyKVkW45n7gjtB5B7pt8AFG3wMGGTYTvX+zIKDpbhEdHymwAgX0obnZaJGNpSZ90q
 sHAR9Rsh798j/7Hqf9n2ROm1ztYrLOtNjCKrwtrlRVMvR9qz5CP41xasxZnEYcbAsjKO
 qrO8jAbBN+mY0noBkqjWhz/W/rh4Rrm5ggf2AnQ7Ba0xFJpWwb/NcTFo0T4ioKzQDY+S
 INACFxqnpB96bIUhm4POoGQ7s4YKpGC0f0oJHITEx9eEv9lGB+3Cb588FLGYb5bNPaKH
 m7p2FoVwQ4DzHc4XLbj+wjFuaBvP53jBW80PNMRLYKmQRS/BVnaCUVauHo09srH5iAF9 JQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=cS4qtmGYe4tF59m9fynuZA/iUFfQ9gIwEqX/rTOnOq8=;
 b=ySWR1/JrOzAW2bNLUhm+BGX+G2IccA/Kc8EqqqLX8UyRArSMnq9z4VMSUcPQo3u6JXO7
 haVk23DIuTdb99XNC+oN5M4ixWzHqaINlsjqJtqLZbwO0Tu++wU7B/G1BypCUWPcKJed
 EFXxsEXSA31THa/etWX/lrM4yFSRHhZHFZUoy1kp7CzlHMhwADnsmWCSEWBeI+1rbY6L
 XfBPESv1XaMRXrgBLVjc5G8IbTmqSvw01J0eoG+X/T6n8+Q6gj34Qde4zOeplQUayhir
 hNHlu9B72rjssZTXEYBImDVkIvK/AGvhiL99dbT9sezJeEWs9IRWAxWoC9SJVe6vklK1 uQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b2p8tbd11-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Sep 2021 02:44:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18F2iYxT095680;
        Wed, 15 Sep 2021 02:44:45 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
        by aserp3030.oracle.com with ESMTP id 3b0jgdy0b3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Sep 2021 02:44:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIOyvsv3y5v5Hd6CGpGOcvxzOyoNM6WXML1rzqQ9aLzClmwvvnCmh2t/8wtWmj9ZZ0VUboe3r6BvjZdm+lhyQj0hbcF5sCeCvUe/1mC1JwE4H3KeHJnB3ZwuKSvU7e5v/uP86jHGxlYXfJlFfXqOe5rv9pbwDv601sZROzMOQnsac/nqyxL5N2uScf6L7hGLifIQQ6xYRgzFIKXLGSD7se/mYCXS0MRS40Qbl4gqW8G/y5aeIIz5C6PggknpqJTm1jLpJY6wqoKxfIPmZqN91QYZvWJq66YSAGxhXVZfNo6lf65IfB6mQOIlk10LRiOnSzVGp8UfifX7zjoSC+VLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cS4qtmGYe4tF59m9fynuZA/iUFfQ9gIwEqX/rTOnOq8=;
 b=EryMwKmeZTDYbjoJwjKv6JFyZH9DNIBrnF8Ifkt9OMM+i3a82/FXsxJSIwVaxAz15me6JD3EPP3hUtpgHd7fIEOYNeqnMhr8W6RdVG04117T5CnvJVaJ9y0zukicExEdw7ai0pjHEl8DuFdVHn11NfpTYhbBsbzBWJxMCIlIHxM2fuhU5osk3abg+WVP4HSzl39xQT5LMC+e96VDUYIYv5oPL6RewvvdiB6NkKygqyyGGXT1Spq1Y8Lo/EaWUwk4bWnUtKMi/fOTGJo11RXOT27VG+HkROCVjF0eW+tnX1QjlHiiPLLLqlHkWAxFqxYMQgaywCxNfCx07ew5i6pZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS4qtmGYe4tF59m9fynuZA/iUFfQ9gIwEqX/rTOnOq8=;
 b=yZD+S8TzUDK3nZnxHBNII3xFld+Y3LJShArVARVEcVZESyflfnlOlOhfUZP6ry9hIhcvRu+yr6HOMC9GiYAOVAj9JynjTqbjUnrSbW6FFlaE64oNEZSmzSU/6IzAOJ6iheWAlzPeL3XcQ5pS9C0qgHkBTq1cItalYpVcksq3lx4=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4694.namprd10.prod.outlook.com (2603:10b6:510:3e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 02:44:43 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 02:44:43 +0000
To:     Chanwoo Lee <cw9316.lee@samsung.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        grant.jung@samsung.com, jt77.jang@samsung.com,
        dh0421.hwang@samsung.com, sh043.lee@samsung.com
Subject: Re: [PATCH] scsi: ufs-qcom: Remove unneeded variable 'err'
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1tuimwoad.fsf@ca-mkp.ca.oracle.com>
References: <CGME20210907044846epcas1p297b8ef121290fc3265cf9dc3eadc44de@epcas1p2.samsung.com>
        <20210907044111.29632-1-cw9316.lee@samsung.com>
Date:   Tue, 14 Sep 2021 22:44:40 -0400
In-Reply-To: <20210907044111.29632-1-cw9316.lee@samsung.com> (Chanwoo Lee's
        message of "Tue, 7 Sep 2021 13:41:11 +0900")
Content-Type: text/plain
X-ClientProxiedBy: CY4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:903:117::14) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
Received: from ca-mkp.ca.oracle.com (138.3.201.50) by CY4PR02CA0028.namprd02.prod.outlook.com (2603:10b6:903:117::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 02:44:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7cdaa8a-e19f-452a-be05-08d977f2c578
X-MS-TrafficTypeDiagnostic: PH0PR10MB4694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4694C27AE665693B68C2ED028EDB9@PH0PR10MB4694.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JavTMzps4DAVEegC2BjJubhHWTydMNkd4+lDPfsBpCl26m0CXEf0W0nCqSsTlHi7L956d3RPacdeq6qsFpQTjZJwyvo/WCgF1Kd5R7dxObrIfstsG+JKVFBnl+7+qRH3tScd3l3I9Bb6cQJLVcoSq2Z6C33AiDOYbDX/hwiQ1cPSgZK6aA9/VxtSYGRe9x0V/jyzcGDhog7CmoabyuileL8qwy0I0vVV1DjNumbz5mOg2KVtWz6ISZ9i1PUmbT7IWSYcUSAtPqSgQa55D99M2LBHJPYB3zhXu+05LZq3OZ68rRWABoySqzKQ89zqjwJRlWHQNNP8AHqrH/R/g4JpNvVNF4nLEb70SARna+FiAto31SqLYuskTPetWD8L8BTl4MaQ2Am5WghJ7rAZCKNtdzV1LqETXkweiJzOCprRfOckBuqcx+87aemjSzWayC83ZbyXGMaSc1gNo0z0q26zr43ruiQvnxl60IaYohHJ/s3KgOEF8ELv3pUd94KJrFPyjSdQ25du8ykeq8V+J01pSm90ooJufAfLSDAs/b2CqxSRAqUd0i25q0sCMXWuH9nSh355sV0cgvtgkk8q3wE0ZLap6HIN+C2sBw2vYDIG+srw9W2AYLW0qeIQtWWkPLzB7G0FYFbYQmaoeNJYkdcuOjKNTktCxvvpmTwtWyd2SUQ1RQ7AYApqgWSTEbtrlPYO7LFFjxtTsC1d6O4g0078HQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(396003)(376002)(366004)(136003)(186003)(478600001)(26005)(8936002)(38100700002)(38350700002)(558084003)(7696005)(55016002)(52116002)(5660300002)(6916009)(956004)(8676002)(86362001)(4326008)(2906002)(7416002)(66476007)(66556008)(316002)(36916002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JFQReN3xZqmyhAGutDG7tLf8fqs9NYJ8ZqUg87jVadtH37ksp/Js92ONXPbN?=
 =?us-ascii?Q?kzLsBcvJvBHS+Da411zeIx6N1IsklB4z0SA2iBKQNXSdesTMPWNCzKJOlvwC?=
 =?us-ascii?Q?ekOcbgITSAPBOfeMdIVoCwrF1YXryL1Shjw9O/xGiqOn86giGkTHg5CT5Oba?=
 =?us-ascii?Q?CV6Row1u2Vpsypg1pK02B6OTDbfph+oFeithTHaTT2zEe7r6mDMW9rMuQCO0?=
 =?us-ascii?Q?7C4Y667EvtZLFFp8SR/aIdQBth+1bb4FTXvtwVnJVCLwKC8ZD4bmbTkPLY5u?=
 =?us-ascii?Q?0h9EUvKDIr6VV+FIsMrvAXU/XK0tCjQr3pTWo2dYq/cU1SBSsZHk2usZPr6H?=
 =?us-ascii?Q?s3OZTq3ddOulhEX8M+TAQSfcuLtliJAEl2d3mAt9vmdU8Jyji8VyNOcAaadU?=
 =?us-ascii?Q?zuhCN6xOSj7hRgrjkN3/BzXLvtucA0FJVjihUZdgn/jxvkWs+ltDhCR5mozS?=
 =?us-ascii?Q?QH6rsm7IeBGgriJUdi+xhChFtzqxAxmlg7X2Gi71327TEA7e/3CD4MTwSARq?=
 =?us-ascii?Q?//IoVeS3E/Be12LgODl3VCurqT2LmGEZW+dWZ5EhWTzhIpWIsLYvhHwaSzba?=
 =?us-ascii?Q?ySrT7H7YYI2NcTe49m1v4NpBt/PBw622DjLaSP7N1zgmZ1Fl4ANCofKF89cO?=
 =?us-ascii?Q?pNdFsPAQ9zVA7w+HjY+jEZX/8I8xnCeWPFgEk2CHN+cNthEcSHuE9/1Xra8g?=
 =?us-ascii?Q?M0tT6/v/G6J7F27Mr7f96A1Padu/joAjWPrLldSfXl+eoUACwB2DQ9409EPG?=
 =?us-ascii?Q?1Ly3/GEvPc2TaS6S+CA7kpvtjfK0Rj96yDmrl+Vckf4zkG37OwvsgzjFTwLt?=
 =?us-ascii?Q?hZ0PDqsbnmluM+dAeRbFZI+noHfWQgCediVP9vn2Xo10wzlhN9cHGCV5LwPa?=
 =?us-ascii?Q?fztyP+qVk2dsLspMD6tx5eOKs5WA5V/ThP1UTqnaf1qfLk2deAxF1j4AE/kW?=
 =?us-ascii?Q?epnaQMEnPnA5dDhMMmmI3G0PjWrsfpclfB5NZA311fMWMVRf9oqXGFIStrin?=
 =?us-ascii?Q?Rnol9cjmY9vKUs1DqZ6HoLwrJpqSUXbOSmhLfCoTO1N708/uYf1ydjlHwlZw?=
 =?us-ascii?Q?1MeLoj59spauIAm4Klfw2P1OO4cJEXfSNTWvQs4ACKD15a0A7kz9PqydPOpC?=
 =?us-ascii?Q?lPm+9+UrkgeTHoG5ZrX5j8JTSuEAu+//5Hov/Fc76WNuSyb6fZkwAIbJlKfg?=
 =?us-ascii?Q?IysRKZYrguInwtZltWplqLxoTSAmpEjjEqZ1Ca1Gdai2LztGiqmkjw+CqDUK?=
 =?us-ascii?Q?8kH9QSqBkftSWs0oGgMGqVEpVOZVFuQPEY+AKV27MD1ysFfJ37Jz6wutmTQU?=
 =?us-ascii?Q?Df16MKx/svv32HFl47yPlwsu?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cdaa8a-e19f-452a-be05-08d977f2c578
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 02:44:42.9257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/iTrgDhQSwY74VpJ2D3QI4zGBs/GXTVKdYYRt2JYOuCWBE1J2MV0ZgwNceU2ThiIujZLGkgxAJp+gw1cqgfM2MFgE5TJCXRsGYGxKEwA6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4694
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10107 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150015
X-Proofpoint-GUID: lq9-zhqKVwHHJ_pAWmMSrFVwOFCwTcVq
X-Proofpoint-ORIG-GUID: lq9-zhqKVwHHJ_pAWmMSrFVwOFCwTcVq
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Chanwoo,

> 'err' is not used.  So i remove the unneeded variable.

Applied to 5.16/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
