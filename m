Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AD9470208
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 14:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhLJNsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 08:48:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62738 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234227AbhLJNsp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 08:48:45 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BACxHer005526;
        Fri, 10 Dec 2021 13:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=i89HLNjVJfBComK+rPrKr8yroqJN86NHCfvWyibTJko=;
 b=CdYJqMxl3SuU8ZD9jwb09B1WFAQSwj4w3+rMCCwTTXH1qjBOsB6NEjMhDt5801Z0cWV+
 ZmcB3ADgqOfkwECG6JyQ237ucs7yIliRwXd4Tu2XgfVi2ij0OE9ShLBqjH60qfSPX/+m
 RQM3YIeEHsgfUgVBgc4K4KNzzzCskIJBzMZUwZmWkweP+H7o2LOcnuZ2x+3LbaN7HS2N
 dyuE8pZy+2HfKJ6GuOi4XQ+w7yxEgS039k3USaThscdCpDaw/gp5QUbAFw0zTNUrDSNo
 6iI0e9kZ/GOPJh8B0b4123Mw2W+129J6x7JAvpmoUAAM3gB+76DrIXXYhesUhIMEsur6 Tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ctu96wwm7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Dec 2021 13:45:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BADeqp2056563;
        Fri, 10 Dec 2021 13:45:08 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
        by userp3020.oracle.com with ESMTP id 3cr1su8eb5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Dec 2021 13:45:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2Rbbne4EiXgWGG9ZhjDgopaL6Xa8ZM+Fl/+hGJ5urTPvMYalYazdnZrRMKW12CJ8W09/FRJ9Mn5ysCUZg8VX8LF87K83Xm+zVzBeyYLmoHsgctEzIrm7p11HGetZm9YHNjUuN4GETWqdSzJtICX6n/yDt6IPUYaHjs6xIeUOFiz/BX9O3IJeJr+5KP7x/8/v4SW9s1XTzQSFAVZJU2kHSfCV/PS20Kxx7b4jhZv1cghIVXWAnUr4yJWG09NFt6yYSY1cLHWqnMCjWaKqG/YVVG+mgHzspTvW78X2pCRobHYo3xmdZ8jFMHjx/qI5ojtV6ECQOj6d6DudYNFcSrnKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i89HLNjVJfBComK+rPrKr8yroqJN86NHCfvWyibTJko=;
 b=hvQ63YHW9zlZ2swANDa/WPDtxxlbx0+b9VxA94O20bnASmR2N+ZcPJvaNAEKipBMzNdhiYSoSvILu3F5QNRzaTlPaw2OnDCs5ZqtdsepBx0AoEsA3nI5BH7wL2jB9WvGUITFVgtD+VsXSBBkX/B4K9RGvH53Jx0u/ENqU8qEv6vQ/Q5NJgvLQEEvdScbVOql5i9aqzDVKUjtggfbj+8M2mk+7S5mv+P5fkxiE4B3kjtJn1oeZZ+8+u97v7N5CenTT/NX2w7OM8Xl9PZJrt4DdiSMQxjkS0vq372kr+bC2VZ6xFzl6dqje7CAue0Y35ihSaAoQVZSZcqJAIRWQedEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i89HLNjVJfBComK+rPrKr8yroqJN86NHCfvWyibTJko=;
 b=o4PmO69WuBfW9ko52aSctgxca24dUykF02Y4uAktZ+9kL1zsciD2rKN97daMBXat6j53hBdYr1IceeTHquFlHOZEhsdNY5WEHNWE1PsLbvrDA07jD7xS1AKxyDEfYTsstpwTaHCA5f3IR3CvWN6nr0fhvzy8a0Xk+YNVlNO9M6U=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5749.namprd10.prod.outlook.com
 (2603:10b6:303:18d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.24; Fri, 10 Dec
 2021 13:45:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 13:45:06 +0000
Date:   Fri, 10 Dec 2021 16:44:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     robdclark@gmail.com
Cc:     linux-arm-msm@vger.kernel.org
Subject: [bug report] drm/msm: basic KMS driver for snapdragon
Message-ID: <20211210134446.GA16069@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: JNAP275CA0062.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by JNAP275CA0062.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Fri, 10 Dec 2021 13:45:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 106d586d-d49a-49f8-8a09-08d9bbe345fc
X-MS-TrafficTypeDiagnostic: MW4PR10MB5749:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5749A178535B94FB0B00E9BD8E719@MW4PR10MB5749.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WoHmMNaCG5Wy2QxDU/zgnahgj2Z/NrId1YVck17JoqeqF59gWDISmKiPN7HG4YXWVios4XArEuwAfLuGZIwNDGqpEuZ1pIen5GsqS1yyvhC26xb+joEHRqQZDEGT3+QpvvwvIDb4U+HgnpVwC8ibgavF9lN7H1J+2Gi3USyhT0gw8fAala/WcdwHvc/sFo7gSTpMeHqjpbeNIs5N3V/v7QTD9n3mKY1hzV68ZQ8oKYPTq7SLJcI3Y3YSOg2P6PMbCqWN1L0kHBUfOEMwayrdB87iDN8K+W5+/ovO4pt57UVaNZHQQg6HSsGgfBYQ7GXq6CH5o5eeoHG7U39AAdGT1Zc5pZN3B0tm22BJnZ1zJrD9CJ7CbyKdidzL8kv8Jtnt+2r/pt7feEV2TGTzv6mu06L8vvC3WaQ+cKYClEkwL37jrPYBwaEEp0rA0jU2AYsLXQdNf7KHPvCgFsirLZOBUDI+n/fCLxiqb4W74H0ML24NE1ocjA0ZqYNiPVUeh9otm4HeH7E/6d/1/kc2foBd5G8TgjETv+ZI+BglKI4vRiM5QYp4CrP9O5Jpv7bPQu88Gz4Js0/BpnXorlVQaFiNwpGj7JfBTa7Dp3So9VOIugKEAXL41ggicJGoazEXn2SS+ggZrp9O2V8v9VzOBnkUqx5RANhrMCokq0OYl+3xlmC7lnVlVCZ1zljUPd40eNkMH7C1S8IvZA6K4q31evWbrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(8936002)(38350700002)(38100700002)(316002)(66556008)(9576002)(508600001)(4326008)(186003)(1076003)(44832011)(6666004)(5660300002)(956004)(66476007)(86362001)(66946007)(52116002)(8676002)(9686003)(26005)(2906002)(83380400001)(6496006)(55016003)(33716001)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BlDdVh1Bdldw2m8331KvHJQkxv4o4dfFCOBRoZWWJk23p11OYaVetFKA7a17?=
 =?us-ascii?Q?P0n4HImj9Sx+uX2LGFrtRCRpWAmmpMrwFXy2OzqzNG0+4OiAAHARVpXi1AcM?=
 =?us-ascii?Q?hcmAosw2zQr2+v0M543XUneo4MTcPSFV1pMRWCKdjp1Fxc9d406yYlCrWbjo?=
 =?us-ascii?Q?Fr0IU9AFYjiBbML7oSckdRyHep76w7pJOVCu4D8JFp5Cn2ZeeOTwGt+tFZ33?=
 =?us-ascii?Q?z61l2u8vDnVoyNzwWjWv3IKRKlmcCSNdPcHZJJFPNUerW8i97Y02kJIN6fJZ?=
 =?us-ascii?Q?nTD/cazWRhyiZr91k6W7uhHNzOHQO+bl6coDkkEcuYTbtKIwPIPditH7sV5X?=
 =?us-ascii?Q?5EnvrYLhd5Rhn3gUZizLpsf9o3J4BQVD6/TuRX1TgZEqnAqhgKR4qDub8ivd?=
 =?us-ascii?Q?NA6u+/+D/oylQcbln1gbJNnS2oNdh3I8SAAlXb1H5w6wJKNgQYJyElAzI/Ri?=
 =?us-ascii?Q?g0woYPSQj051K47HW4I5JgpPvnVka/7MYS4bzllGJSkbup9QM5n1qM0zZjgc?=
 =?us-ascii?Q?hwy2y6X6tn30x0ryHYMsv1ytsRqAsyh0vBTN7brHJNPnUL+5DcBkoK8Rm56X?=
 =?us-ascii?Q?2DGeQ1m5dRI3T055mIWazh5OaOHi07CQaaRqnkvuMwf5vG4b14WzXATkj+GA?=
 =?us-ascii?Q?ZaZqtYpXwC6M/XY24aQxBJA7vHoYi+MLYsmjvk8+itBYamyU7Posbk1Goe8z?=
 =?us-ascii?Q?g8x5spIBLbdY6tam2dWKD0NVmv2BKEYisBH+ErJEADyBh+D784BZoqe0dVOt?=
 =?us-ascii?Q?5IPv5y4LqpOWSI1SgdYYgsr6cTuksvsddkcMoEODXRPnfHcuvDPooKeK066V?=
 =?us-ascii?Q?4vZ2jDgob8P+Y2BxMIwlmudD7FYuRersfmgNALgP0go+XLUHnR0Og4kOA8wT?=
 =?us-ascii?Q?r8XTcciq5MCxN2SQffpEDDOhqEoarwStlHgP1F6OIy6Kt9kvOYBzWw+MjNJk?=
 =?us-ascii?Q?LGBhCiuPph1OpjIdjMxAdztQz9B3bl8pAKJFSMDI1lc3Qch2XoeWxgK37Ev4?=
 =?us-ascii?Q?+X0r1iB0jQgRfEcpbq5+ntlvkSMYrnu4ZGsGL1FfV9QuIbFypX+AjUtZKm1b?=
 =?us-ascii?Q?2Hdwq1vHqqCimBZ/BaesekdyydClshscdVvc5RuBXN2UvgSeFj9u4wuHJRy9?=
 =?us-ascii?Q?TNJA2fHRupr+AeJjb+BbLyWcbQV9GdwGnG4CwsIBrOsc4mMSwmshK8rqjg35?=
 =?us-ascii?Q?43mi/VEPGIKEhqp/UMv6YDbigC3JhuZe6DJ6cWfZ0pBJsoDtKB6r3XxJA1EL?=
 =?us-ascii?Q?gWSxIM/y0H9lJYCRHEUPibvfLz8B+qvUl4ZM0Ao3sjM1GIjaakA9P0bSWX26?=
 =?us-ascii?Q?kFgACtlBiu7iLDDtQ62a5nxLc5z/3DerZ+e08DE9XsUSx0bC7igpr/WiYHSj?=
 =?us-ascii?Q?cPSdAsrijB4i2Uu/z2E36kJAYC8h1TOeanEEdbKOngg5HkEMj+v17SdSezuH?=
 =?us-ascii?Q?qODxwib+dZUA+wrfM3Ea1dGXSZ9C3jduHfgngZcd44BJ+akXHg6olEP+7t90?=
 =?us-ascii?Q?+RZ/ixdaXjCPqbnjowTRlk7WsykHAqek5wk0QDkHsijsbQHk5LlvZJLVWw+x?=
 =?us-ascii?Q?4D9XG6UXFcA5LKj0e6e+UEGyi97x0vkU5/ehVFQsZzmXyhIRBBFVWPa0Xc+i?=
 =?us-ascii?Q?oy7GH8HmG+QCe/INvNJHEk3ngK1fAt6tAiUw5ikzFfrmbixkq2dyBdVoZvMj?=
 =?us-ascii?Q?C4o8srxG3ZVMJ2iZL1rpON+aDTo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106d586d-d49a-49f8-8a09-08d9bbe345fc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 13:45:06.0251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OnJpb2b00yMwYwXTaXGzpJWXnMzrzTBRNqQe5nMHy4aQufdpmAjPi+yrXwiXVOAFMAKE/H/o5jVJkOzt65Sef8KGbnndk0tF9BDw/S/X0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5749
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=789 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112100078
X-Proofpoint-GUID: 35VZleQteZB93G33287GWXJKXoAbDwvM
X-Proofpoint-ORIG-GUID: 35VZleQteZB93G33287GWXJKXoAbDwvM
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[ This bug is obviously 8 and a half years old now.  It's weird that
  no one has reported it.  But the bug seems very clear although the
  fix is probably difficult. -dan ]

Hello Rob Clark,

The patch c8afe684c95c: "drm/msm: basic KMS driver for snapdragon"
from Jun 26, 2013, leads to the following Smatch static checker
warning:

	drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c:372 update_cursor()
	warn: sleeping in atomic context

drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
    355 static void update_cursor(struct drm_crtc *crtc)
    356 {
    357         struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
    358         struct mdp4_kms *mdp4_kms = get_kms(crtc);
    359         struct msm_kms *kms = &mdp4_kms->base.base;
    360         enum mdp4_dma dma = mdp4_crtc->dma;
    361         unsigned long flags;
    362 
    363         spin_lock_irqsave(&mdp4_crtc->cursor.lock, flags);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Takes a spin lock.

    364         if (mdp4_crtc->cursor.stale) {
    365                 struct drm_gem_object *next_bo = mdp4_crtc->cursor.next_bo;
    366                 struct drm_gem_object *prev_bo = mdp4_crtc->cursor.scanout_bo;
    367                 uint64_t iova = mdp4_crtc->cursor.next_iova;
    368 
    369                 if (next_bo) {
    370                         /* take a obj ref + iova ref when we start scanning out: */
    371                         drm_gem_object_get(next_bo);
--> 372                         msm_gem_get_and_pin_iova(next_bo, kms->aspace, &iova);
                                ^^^^^^^^^^^^^^^^^^^^^^^^^
The msm_gem_get_and_pin_iova() function takes a mutex so it will sleep.

    373 
    374                         /* enable cursor: */
    375                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_SIZE(dma),
    376                                         MDP4_DMA_CURSOR_SIZE_WIDTH(mdp4_crtc->cursor.width) |
    377                                         MDP4_DMA_CURSOR_SIZE_HEIGHT(mdp4_crtc->cursor.height));
    378                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_BASE(dma), iova);
    379                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_BLEND_CONFIG(dma),
    380                                         MDP4_DMA_CURSOR_BLEND_CONFIG_FORMAT(CURSOR_ARGB) |
    381                                         MDP4_DMA_CURSOR_BLEND_CONFIG_CURSOR_EN);
    382                 } else {
    383                         /* disable cursor: */
    384                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_BASE(dma),
    385                                         mdp4_kms->blank_cursor_iova);
    386                 }
    387 
    388                 /* and drop the iova ref + obj rev when done scanning out: */
    389                 if (prev_bo)
    390                         drm_flip_work_queue(&mdp4_crtc->unref_cursor_work, prev_bo);
    391 
    392                 mdp4_crtc->cursor.scanout_bo = next_bo;
    393                 mdp4_crtc->cursor.stale = false;
    394         }
    395 
    396         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_POS(dma),
    397                         MDP4_DMA_CURSOR_POS_X(mdp4_crtc->cursor.x) |
    398                         MDP4_DMA_CURSOR_POS_Y(mdp4_crtc->cursor.y));
    399 
    400         spin_unlock_irqrestore(&mdp4_crtc->cursor.lock, flags);
    401 }

regards,
dan carpenter
