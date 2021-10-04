Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32F5420A82
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 13:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhJDMBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 08:01:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18962 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229778AbhJDMBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 08:01:39 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194AkkFw010779;
        Mon, 4 Oct 2021 11:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=yDMzaC9qS/pi2883V81dqnHbpRWNRJ1/LaxGha4bF0o=;
 b=XDDmrSawudXVVtbbPqkEm2NNPH0mPdZBrLt0aTevqIfhui0JEZlWbIvjcNp4a/8QU2Rp
 Du+ZOjPFfN/BE0yo5oRFj4qwoUsR74qLeWnMA/VLiotwoFydXpUZ6BA9E08X44ZXk+kL
 po/JgMXr6gdyffr6IjL4I7/IaHY0PKfzKuJLlq2HzaN0JOW6tfgesS4+MpTnQwchUGLz
 0AkDRgwGOza3NJbVRY5KpihCVjN12Ii+a84uYvXtKman9vi6w7m5861g7EuMXbTUDt63
 8X7brGOrrM0JWuxsffSPipkWDeiFWp0YnLvD0K4xTNmOU/rWAwxoj2DbffjqzroK9Ule kQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bfaskumgd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 11:59:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194BuEjm037659;
        Mon, 4 Oct 2021 11:59:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        by aserp3020.oracle.com with ESMTP id 3bev8v1mmk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 11:59:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kINzVuiD1l9xcOhxSjEyC4P6ww3gyXsH/vbxAWmofiOKBKDiylun7PL5t4Fj2aGw+gkc/Kw4elUCAQ++2pBwxV4cs6K/G5ihumrsmtsZY3S7BI+ymEfirAmOpuAQaYkmXSfhWei9sqPtUdkcCV8sZo3GQt2qkK0UKkzC8qjen8+dItXHsQ+ykGnvwhaVbjbNxN9gJlPqS/irUyXfcJlsFZ1hVvPAgBb2O4Fhjn3yktNtln/6i+2IoNZsEB4N049skjCt8kQ/Cgah1evQy+kxcclnmcWc89QFk+vGYmyKS3cHiH0y7v2WDK2rRTv4YjjaMY7Ckd46ody/XPgHFuTkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDMzaC9qS/pi2883V81dqnHbpRWNRJ1/LaxGha4bF0o=;
 b=a9iQjjkZOdU68gFxrv0lZ3OULKxDD2jOLAo8BpGDk8Hj6v3Db11dTMskUwA8GKRJU7/YKiCCP8jSuT5y96CJBVhCW5LjmsCw/3LP52kFb7jRRw6jtq1XV9Mv2y2Cv7kSwLKrFgMwcNyjkn9n6LAsXboyEeohxat+k8r2xM1W0eH7L7NgcppF4TK3cRVb8d4BYm6eT1V7slANBopBWyFsRdiiyu8JyTKW3eQY4JHP69jf7kVt6Wk3PpIc6iC2a3Ujmwe04+5aINoCmNPfYP6cpQ+gTAfF9KbbljIJxUrxQbLFzcfa+TSN8rS8mIbFCY0jt83r6+mPcIdsMBlAi8hILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDMzaC9qS/pi2883V81dqnHbpRWNRJ1/LaxGha4bF0o=;
 b=QZ6b3DKkKqoqtB9QrUcH9xFyF8FN+pg7oPctmVybTRk/V4NPlINdGF0tRuzg5s1D5ih3Wp6Fb2RD3RkdpnwuRNkQTmIRh3QCpSeQ/0e6HeCZ+kFDkCWPanMvHv4rGtpOQR3KNhMrg+0YpAw0qnV9/Gt8tKFN2vIksmaOeMdh3Vg=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5555.namprd10.prod.outlook.com
 (2603:10b6:303:142::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 11:59:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 11:59:46 +0000
Date:   Mon, 4 Oct 2021 14:59:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     architt@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: [bug report] drm/msm/hdmi: HDMI 8996 PHY/PLL support
Message-ID: <20211004115936.GA28995@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend Transport; Mon, 4 Oct 2021 11:59:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 660d2b59-afd2-4762-e189-08d9872e75b6
X-MS-TrafficTypeDiagnostic: CO6PR10MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5555770F14BE75101F7ED6158EAE9@CO6PR10MB5555.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hK47WmvTSSY7Uul2onq4Q5etw+G0HL/YRXj2itx0BnhdU0PUxChlBe78DKhhtdvEe9UpTRoTAabMFt/w+vUpKCcy4OT/RDPaesPLfawLlOpQXXMzVFA1I7oMkZU9ZHa6q6fN/Nn0Yyuw9gCmrZU6+qHWDzKNmXyrpqKwDZvBb/aW0bT2XeBRYFzDQHWnEaczJhCr3S4i6ICv8UHu3OCJOOc+ERpszRwb1U+qHETNtlshRlroVxsd1YICNAP0DqgX5I5+y4590ZdjyHFIVmWF5RP7WcsS5ehChXISt1vvCfMXWCaeVn/suAIdi+8pUYGZPT1e5iGLpIp7Z642K3+R9xmTu+aaSzWjlyLxQX42Hp3kF5hM3L725h2sMBRTZhs20xXdyDzIR/Fq1atmSko36LtZLYK91S2pFwGlpv2gB9xNFzYchTcD2cG6e50Q0FhJiA65F2ZM5drmmps91xAvyalFRORjthiXPJnWIwvNcXsiU1sK10a+HZYQm1pCEO7TimzIb2fKcs/Km9Sea5GeYbxdfFTeXJsifxC0+juB3GSLypbFaMksFiFA+cTa8krkA3nETKlfm8HrBBCLc7CXADFgCN/yPA4HURCWVe/jlx9DmfzK6wT5+RgkCddao/w9MfjAQ3O5mRUSVkdOnGXNXiGnfM4c2BKvNsh323fzjwKaw2bAfX784ZR8o6eFMXCphlxPqG8XNDLpbzTv+w84Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(316002)(66476007)(66556008)(55016002)(66946007)(508600001)(38350700002)(4326008)(38100700002)(6666004)(1076003)(6496006)(8936002)(44832011)(9576002)(186003)(956004)(86362001)(6916009)(33656002)(26005)(33716001)(83380400001)(52116002)(5660300002)(9686003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?85XAwMksC650rjVjPk9r4aEPuP9eVAvcFT4JgEf+yZqUkb8/po/ZMqc3mf42?=
 =?us-ascii?Q?yAUijJBQQ5+vrfsrmrWJkxQ77UX3s+KHZu23W91fOhr777L31Ol9w51GrllA?=
 =?us-ascii?Q?UjS9L8ytmX3hUbYgo31j/NTizHLn39tS8FguCWEOIvcm2x0Rt8wDe1vuGuiU?=
 =?us-ascii?Q?A8JX78lXqTQYKJyqPU7J1H5UBwjCH+115//TyqFEujqyTE/tEm+Rl7WL4Nov?=
 =?us-ascii?Q?H6U7wu4SMRg/ZwRvuEmeLgtdjEESZFnSyZstDJ1bVPRse1PIWJoIO+1c2eRS?=
 =?us-ascii?Q?ETpvpji6hpqfJDKYIUqt7c+VdKOMJ/bz70Nw/ab2UxWjRotJxBYXMdsbaYM7?=
 =?us-ascii?Q?xKJjasj3FYtd0alu2KZNUuDP50utWnlhqXIEAX+tiKVOmF+fQLd9bOBa0Za3?=
 =?us-ascii?Q?g/7vWcgGqlYZWG6fxg/nBeslLa+PYXxUXK+1Gz4u1guLXTvLBpVPbx3D5PCk?=
 =?us-ascii?Q?NxSEf7ieGFMrxwOqU4pj/BNy3Gyyl2GcOTe7iszbDYlqc0uXaWgdLtLya78E?=
 =?us-ascii?Q?nSN9hWneQMCKwH+RjITbwg/qKfW+3IiGuS8oEfHvN8xkmM9hEP2avCcAdLls?=
 =?us-ascii?Q?ha6Lf5YzSW+bB9YysT1RzEcyu8ck9OJbO4BrOTl+9zPvF6ANCUtsov+5l7Eo?=
 =?us-ascii?Q?matxpct7Ew3sfAf9nGzBABsmmTYShHb6E2BRRD+sVAhFRhwRs7GBVj8YhoAF?=
 =?us-ascii?Q?MvWv5L7EZKqlpnBWWT567qroqZwpfj2JteW4gJiKA30umE+3ov+TsAwpyz3Q?=
 =?us-ascii?Q?TLT/ikp34lEV/VLuNDjbJ23XXdzdSox67SGRtD/ujmOF5SnSvKZxVA/rFhSn?=
 =?us-ascii?Q?2lpz/DKDfjRo8YoR5N8UsYihOXBVGUjghtW2llm0L5q5U+8v0NT4/JMolYWM?=
 =?us-ascii?Q?f5goCLJ0SAbM17EE9QZpPZEUmzqlnczTjbNjkEh4qjXcxZIAuHNhOa0u1a/T?=
 =?us-ascii?Q?kiyONofDo7aIIZ68w/7AizaH8rlI/ppA0t8Qc+0JuEZEaOWBl6e9+xYEopqU?=
 =?us-ascii?Q?d1jXuWfCoAhgDb9Ne8BXEJvw161dBdtHNvqXZcJpW9MRtqdESZfacP+sRTqa?=
 =?us-ascii?Q?LhxgTgcP7b0yt56bxx3TZT9QxAW2Ve2MgAB3YvMmEm52A4m7WcIrPJlFu353?=
 =?us-ascii?Q?XPAWn2htYmS7JYOF759DmrRXmW0CHcC3qNksdF2SimkMmWN2E3wLc/ANwkDq?=
 =?us-ascii?Q?rAJHST5Gi2ybCdEKaEL/8uToXcoPVeZQQ/BFPCD0k0FXdcTr6cr4Gab6PaUr?=
 =?us-ascii?Q?9f+/axITw1cy4QaAN9R66ILWiJUSIWTJyc3I+9Sm6jeRqc3ZsGYE2PC8BJEC?=
 =?us-ascii?Q?cpbTXzsjXd8e405q0zwdUjKV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660d2b59-afd2-4762-e189-08d9872e75b6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 11:59:46.6588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUfaTgc9F14Oi6tKDF2gXpXR7OBiJhe8eozOzZV8rU+eclQO5s1DWgYGmBQ0g5sgit/RojdLk3mwPByOuQ0Wqf6Fxl1p0W4v9Q0kLn07kDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5555
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040083
X-Proofpoint-ORIG-GUID: bwRELpeZ_hj3058ORgU4Z-2sVx6N6w_w
X-Proofpoint-GUID: bwRELpeZ_hj3058ORgU4Z-2sVx6N6w_w
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Archit Taneja,

The patch e17afdceb4f2: "drm/msm/hdmi: HDMI 8996 PHY/PLL support"
from Feb 25, 2016, leads to the following
Smatch static checker warning:

   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c:606 hdmi_8996_pll_prepare()
   info: return a literal instead of 'ret'

   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c:622 hdmi_8996_pll_prepare()
   info: return a literal instead of 'ret'

drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
    592 static int hdmi_8996_pll_prepare(struct clk_hw *hw)
    593 {
    594         struct hdmi_pll_8996 *pll = hw_clk_to_pll(hw);
    595         struct hdmi_phy *phy = pll_get_phy(pll);
    596         int i, ret = 0;
    597 
    598         hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x1);
    599         udelay(100);
    600 
    601         hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x19);
    602         udelay(100);
    603 
    604         ret = hdmi_8996_pll_lock_status(pll);
    605         if (!ret)
--> 606                 return ret;

If this is not locked it returns success?  That's strange.

    607 
    608         for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
    609                 hdmi_tx_chan_write(pll, i,
    610                         REG_HDMI_PHY_QSERDES_TX_LX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN,
    611                         0x6F);
    612 
    613         /* Disable SSC */
    614         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_PER1, 0x0);
    615         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_PER2, 0x0);
    616         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_STEP_SIZE1, 0x0);
    617         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_STEP_SIZE2, 0x0);
    618         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_EN_CENTER, 0x2);
    619 
    620         ret = hdmi_8996_phy_ready_status(phy);
    621         if (!ret)
    622                 return ret;

If it's not ready then this returns success.  That seems very wrong.  I
would have expected -EIO or something.

    623 
    624         /* Restart the retiming buffer */
    625         hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x18);
    626         udelay(1);
    627         hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x19);
    628 
    629         return 0;
    630 }

regards,
dan carpenter
