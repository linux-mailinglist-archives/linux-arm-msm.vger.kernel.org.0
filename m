Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF1942095F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 12:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhJDKjP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 06:39:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:7390 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229545AbhJDKjO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 06:39:14 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194AK9R0018669;
        Mon, 4 Oct 2021 10:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Nny7q02zMPN0FNkXKI866h2q+CBDrn0AwBWyvPbYTPg=;
 b=WwDZCqNQE1KzPK9tEbKoYTqqVqLjNkfHzxORgtLcmlR4lMfZ6DbFbZyZ7KHiqE5nDO6s
 fq/OM7iICdC+wlpCAfQivxjrYFutLkfieoiTnXvRE5CXKjpZEZwuy+VRG+tcBQPHf8PQ
 +F8J86PbbE8ygG4DRInl0ebXF4jQ7J0dEFyTmBz3IyfiOsGcjo9HrtHXAeBo9ckunY26
 XaepgbeHAbwiLuUUkWiBxGbA3yZcdx9IsY5eLjuFwlsKks7Scb8J65YsYT+uXhW64ZcY
 wW+K20x7XDqDAl1MaOMJeFJepZx+pxP5hXtjLoykjQ6bR3/lk6RRMNKq0QleIFQuVI2G eQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bf9m03dep-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 10:37:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194AUbV1098720;
        Mon, 4 Oct 2021 10:37:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by userp3020.oracle.com with ESMTP id 3bf16r7a3p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 10:37:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXcOg+wYXbyyAev30H8qBNHgYHBVNzl/pjwINzyGBVVowfV2k5IXu+5wg2X+g7zH9iqdgXf4BMXE/2Lekl3HKlmkYGX/UEyr/a6400NPVxJg7N2O3Dctb8DB8X4h4DCxND/Ha+b4Nwj4n3Hx5x7m5GOWjqiLS71VUAcjFR191FSn1q4/hLgBNCWd+RCNJ0D6cd7aScOcl8V8w4zMNgSAG0UqmO0SQPwoazgZwsbsPgU6uMlhN4+PMOmADsUHKuVkkD3RhCECrqi5/mIG9O9Py+oOyff9bUZa2GCwpvjGaJIJUgrjHVS1aI9OFOaNDlW/UUqKn81uBP3IokX+rjrPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nny7q02zMPN0FNkXKI866h2q+CBDrn0AwBWyvPbYTPg=;
 b=DW/2FMeO2SnJULXdmjinma5Q3RX+5j+JKYn9mC42tyD8r4/WbYNKgeFax758QvZDwnOnu5o7b1+tPRA+I0993kPJpk5HHW2djqebXmG4GCH4vB05tWbUhrY3IiVm/niL6+8tRmfCT38kQUu84JAfo/TBSod7Mx5sCjEkHyp1XGphay0uzM1Le/aQ3dKnw8zFPHnL3qmYaV32tyApRebBz44F0GniLGvgdN2bnDHl4V1Ep4dVMEUPWbGyurb7hC05V/N5aOPeEJQYngZAuam88jDPcUGPhHQZ/7w+IcUEq2pcllgw5MlJmMuYVp3Nh8UWCY1bp8X1UpVw+SCRXCwzXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nny7q02zMPN0FNkXKI866h2q+CBDrn0AwBWyvPbYTPg=;
 b=LzZBmPspUqGnhoZbNafYi+rNuV24dPnZcoZ7jgrv3P6I5MbYeX7dfX0MZHabSZ+ebIoqzH+GOXajYUrvoZ+F70UdZ7NgVmNZe78BP8FNks8yFo5kJzOoC4Xn3IlIQ+/vylYJ5e39AVRfIYbHn1sGT7w4KO+r742uBcmjf4AkX9g=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4466.namprd10.prod.outlook.com
 (2603:10b6:303:9b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 10:37:19 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 10:37:19 +0000
Date:   Mon, 4 Oct 2021 13:37:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     hali@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: [bug report] drm/msm/dsi: Split PHY drivers to separate files
Message-ID: <20211004103711.GB25015@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0154.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0154.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend Transport; Mon, 4 Oct 2021 10:37:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d88e359a-2d3d-44c6-78cd-08d98722f124
X-MS-TrafficTypeDiagnostic: CO1PR10MB4466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4466AB67BA8384B9C90CEE648EAE9@CO1PR10MB4466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3i6DzxOesacoT3YhLqKMVheRZiDQ1A+3vFbbl7695EAhmY+V0Xd6KY+xh13U6d31PF1+hltRqZB+2+xoB+60JGMQYfBQtrHTxgV7Irwh+ih9vNnrRGpjPtBmbOb/O+Gugg8ADyGzSKr152x9MwJo+M1zBoEXIaXkhqHquHtYTMvGGGb77AQiJyx3/nCI1mFuCW7EqFt1jaGtYsB+XQAtXW67drVHOL1taa5XIdpEr9b0mT94lBBOGPS6KIsE9ZOsgXyMMfcmFI0SuxHGLTiW+0IH3KVo0YgEVRcMSMUJAbiq9TLQUtiD2AjzpNV4Zug8sdR8wEMYn5ULsWQhB7G8a3yZl4ppZl/AdalbnnrNLYyd5NEPUT35ZJEATz9jcXCPgpJ1Tswg71FRWhJ87ogFlzsiF/Nj3iMigroza8/3Zuse9l8VHBZTgl8Xq3uw27RgPxe/pTHtnt/QdmcnVm6J/aejsphG3Uxpqg6fici+JS2l9bd3OitlfRbPP0SgHu5qHzKvrFaEpwlk0FXP3bEJjN4jGPx9AMwGs+RAiHozXS15iysmYcqNVIpd+aw3EQ/VeKVdOcLZbf5UZ83yV88ziBlxIT+Cx8OaxhoINmwW+bXnZpTu6StBzOxad2IEupi9JS1vbe/jXEsn142Sbz9j/0+Op/l8JEBuGEA2xEdaiPWasA4zlvaRvrYv4DHM6KgPzDrxtzPm6tdRRPK0kD9iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(52116002)(55016002)(316002)(9576002)(6496006)(9686003)(66946007)(66556008)(33656002)(33716001)(4326008)(186003)(6666004)(26005)(4744005)(6916009)(2906002)(86362001)(956004)(8936002)(44832011)(8676002)(5660300002)(508600001)(38350700002)(1076003)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sAkTxt3knqMGf/wngzxxnRtWoINhUROQmMyKo9KCmdOD47Cpl3urQg2TDR+f?=
 =?us-ascii?Q?QlKdRsyZBpYcZOkr8GwJLq8R1MrpqdP/R+EKpGgE9l4V3Ds7qh9ksEKAc9UP?=
 =?us-ascii?Q?cJ1YHgEP+2LVu/4+XDRCGS/Z0rExf+Gg4y6W8JNmz/MMNiQozGk1R158QysO?=
 =?us-ascii?Q?LQJCUcfxvbomAurEy2+PcFFtvtWH5/xaaqUgBS5VgwckFY9GI6jZmGlouVMd?=
 =?us-ascii?Q?6IUIWB4FPo3n2+3XLSNWwbe9xQ/FLRoS8c7pR8dSGev0LbX93Lz5fs+vNg7k?=
 =?us-ascii?Q?enPUrHFALXiXkuiD5Ty6MjSqqEJjq9p47FYiy/zJcUvD+AmTu2+Nb2oQRq1P?=
 =?us-ascii?Q?8A60NexDEn1DahCi+5zMYOtTOBdqA/N92nDU/aHoqHrQzHAWegqilt27OxiI?=
 =?us-ascii?Q?9jxtgrIa6wKIfqYkJsTBZM6U8Ud5EpIEtTnzb2cwGaz4h0vSqgwWrp4QPANT?=
 =?us-ascii?Q?DsC/Y/KWo5PQ32/m8HYJK2FDC0jM9Up62r2L4Lxss4OTEqol5kKgX30lr0By?=
 =?us-ascii?Q?oZPJuV+IZ4BPW9KD4cxJyGH2ccBsHn6nVO5F/xGekz1hQQODFNCfwKXbAfGX?=
 =?us-ascii?Q?SEEHy4tshBQRNcuqCETWqGXWH96mxFF7UtskzBprr6VVO4aeHU18jsqx8ZOw?=
 =?us-ascii?Q?s7RMDauEEPhMjDm6+z0Rb/18MDmBZ33I5M0qBmDqhP/N2lPKHsUUxV+4q8g6?=
 =?us-ascii?Q?i+fwUW7EqpisBe16p6vgf2bGmvhNsv42qf7Sydg+4VyavkYU7OwuXxK3mSHM?=
 =?us-ascii?Q?cLcwiDRhmIgohXmWJITcSonZ2fjoR/sDAgFYUW+qvCWujwKO4ND94dYeW/BF?=
 =?us-ascii?Q?WK9MXCsEEwkTCNLZKPU76qaqiY6EO6haAcEI3iv04RWuYjsbsxh9hvs0yVJW?=
 =?us-ascii?Q?kFOqgdzj4S1NJDViNzesLSbJg0M50Kn2KCINfErZjAIC7k2PblUYqhwEMmaX?=
 =?us-ascii?Q?+frzn1KDXRqBwF9pvLxaG7Srnv9fQlARLkcVB4r2pJCGFaC1aMLnUUAFRp5x?=
 =?us-ascii?Q?V0aTq3oWEFP8p4zOOW8Q7mMjB4Wh7ftTF7cTmtO5CvswlkBEaW1iyh6BH6l0?=
 =?us-ascii?Q?yp+l0agkPRMqDb06mUoTMHKkjxrH+BOc1m7yxfPfGJRYqdnW2Cbj3e4rWqvP?=
 =?us-ascii?Q?qA5nek32UC3KB0tdaus9TmE0pAArV5FqomLoftaNxf/2pXFwdw3+QaZa3Evf?=
 =?us-ascii?Q?8YjY2DNMvtFG2w5g+HsGKSi7Vkham4DQY9QDghxKl9B4WJ+FX3ONTIWFNXdn?=
 =?us-ascii?Q?IpC16MqCoXTmUT1dkoXKxPGM8O8iOU/lJLwqfKmymQu4WhFc8LgY2YH14IjR?=
 =?us-ascii?Q?hinQm5/ohMXd46RrDegCD/rm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88e359a-2d3d-44c6-78cd-08d98722f124
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 10:37:19.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWhHCMV2y5DF5qulipVr/dBnT8lerO0DKpdefitdw99FZ3Dsvbrfu6e3ALuXc4SHEpXlZfroEuxSWoW7aieywgewM/W1p9VJjTW7z5pwbU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4466
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=716 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040072
X-Proofpoint-ORIG-GUID: H0YRinpBWtfw5xhiq-petrUaHcMgAdy5
X-Proofpoint-GUID: H0YRinpBWtfw5xhiq-petrUaHcMgAdy5
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Hai Li,

This is a semi-automatic email about new static checker warnings.

The patch 5c8290284402: "drm/msm/dsi: Split PHY drivers to separate 
files" from Aug 13, 2015, leads to the following Smatch complaint:

    drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:812 msm_dsi_phy_enable()
    warn: variable dereferenced before check 'phy' (see line 809)

drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
   805  int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
   806                          struct msm_dsi_phy_clk_request *clk_req,
   807                          struct msm_dsi_phy_shared_timings *shared_timings)
   808	{
   809		struct device *dev = &phy->pdev->dev;
                                      ^^^^^^^^^^^^^^
"phy" is deferenced without checking

   810		int ret;
   811	
   812		if (!phy || !phy->cfg->ops.enable)
                     ^^^
Too late.  The fact that no one has complained in six years suggests
that the NULL check can be removed but it wasn't 100% to obvious from
reading the code.

   813			return -EINVAL;
   814	

regards,
dan carpenter
