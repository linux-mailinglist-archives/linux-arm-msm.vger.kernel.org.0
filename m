Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5AD3617CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 04:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238410AbhDPCw2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 22:52:28 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56618 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235058AbhDPCw1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 22:52:27 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G2nKoF043100;
        Fri, 16 Apr 2021 02:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=4/KsOt3yCCkyV/t+hsfB5mdmUisXZsF5nakqD68BUr8=;
 b=0JKdXsDTgniOFwrkgOBDOVJmK8GqV5uZRejq6UWr9g7z01lyFsMJwo7DafECqKW0WuBz
 AFz88iqH/Q7MeNMnWNIgtrVDT1iakgaBJQTqBefmL2jBC32dMLLhBqyTdghz+MBarPrZ
 z1j6BJ/xwGmD7BetI5vFuwvPMn5LvSb/JaRpKfcCO28d18Qmu3lUamjw4p13ZfgtwNij
 JjJOquErn3e5iyE96z7eN/6uknunKpUexgBVH1tbrkysAXBfl75n4G0xB3POdWg1WeiY
 kBFswNdKxwRaAn0M7/XVT2AqcYiExKnlwRdTu2k4uGfQOBEkY/hBsW9/BOoIo32Qwx8+ Nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 37u4nnqp1u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Apr 2021 02:51:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G2pdFH045037;
        Fri, 16 Apr 2021 02:51:46 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
        by userp3020.oracle.com with ESMTP id 37unswhm94-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Apr 2021 02:51:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQh2x6iFaxWxIWctK5O0yvptO8p3Q22XOLMCe8OtdLbJOf2Kzvk/inzGjgvv0mJZJc4ceOUpgSXe7i0TC0KprUGGHCpwfv62qGJfQRujtcjCjNrQt7p/PzQwYlOJu7txIpMUuQxs+OFItQK0fedafLm+Y0/pPyz6EUgCRLSv5X9a3WDd8JM6ml8+ZOLqzZrb6O9HoQnPRr85x+zYcnBUt1oTU3SqGsnUFCEOZz6MkuW8a9gao9VKJMGND9G+MwDO5pPwErjCzivzj1ihzBn4r6D5y6KDEHZaHibZZixqeb1BfZgz4x/Wc4laT2UFk1lp/0ZBbVmBzrL/LkGm7p8sVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/KsOt3yCCkyV/t+hsfB5mdmUisXZsF5nakqD68BUr8=;
 b=eHrrQ83cH/37139CdHVdirY9hpPRyjfkg4wdYxj93KLA5hfvo0f5VMzCg43ZhCZjeZYx/Qt2GKaxw2djvj4G/WAdY9qNPX3km5qBAOTbJcNR0rHO8X6efkuykxmH3BP51XH4w9XJ3AzUtRakxy0f3lneyfy9lezo4fX3tVVabQcL1N1n7kdvtB751/edca/NkjcwfcVd5ePDRpgrs1XfhqRRWHdjfwGqDzITg9+1gnx4w6Jd1h/X36/EGdNmdZK6lNh6SguJeb2o94pQcIsb+osKLBxJKtyTiKp5HiJgTzqLeCCx/+iO3budDyxiqrL62C6LCp0oTkA0Xe6um4rEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/KsOt3yCCkyV/t+hsfB5mdmUisXZsF5nakqD68BUr8=;
 b=HCoCjSYvj3Ygn2Va16KjMKduRWwKs93HhkthHcMC8tQvZvvpIQrVECHjPIFL41igavo+BJksX9ZEqCEtEKwT6ScL+ImVL2nL8DnwCdIXdGFWXDTwLQF03TOvLDhabTuXXjOxZlgHo8gwp3lAgl/FtJDlT5IKI3ti5NtsfXjZNNI=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5466.namprd10.prod.outlook.com (2603:10b6:510:e2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 02:51:45 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688%4]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 02:51:45 +0000
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ye Bin <yebin10@huawei.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
        kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH -next] scsi: ufs-qcom: Remove redundant dev_err call in ufs_qcom_init()
Date:   Thu, 15 Apr 2021 22:51:23 -0400
Message-Id: <161853823944.16006.18330545047763439267.b4-ty@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210409075522.2111083-1-yebin10@huawei.com>
References: <20210409075522.2111083-1-yebin10@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.201.9]
X-ClientProxiedBy: SA9PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:806:6e::28) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.201.9) by SA9PR11CA0023.namprd11.prod.outlook.com (2603:10b6:806:6e::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 02:51:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9125395b-b2d6-42d4-3a0d-08d900829279
X-MS-TrafficTypeDiagnostic: PH0PR10MB5466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB54669F5DF83BD955FA5DBDD88E4C9@PH0PR10MB5466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SjrnNn0c2RWhmWiW0s0s9bV/FzQijsooX2+Ot0d211S3tW+D9FwgFdmhDzp1H7k7mP+GRnospdm2khWsD/BLpcFaUxntOtujVkFYMvXnsgojFmNlk+MjA9Tyn4obSt+gtoxLiHQjpOQUE2llqNzPvZ64xmdtF5SL8XP44mB1+SDlQ8FAlAkn2ZcEelCwT0m2nAVy1Z3YzmB2nGq6bwBNJ63uvNCFazx0DwPyI9VvYMLX08Nz3JOX0iKnJkLXMmc5qMuSF5JA8AGrr1LSCFs6nLVS4YpaLd57hVvFNZCRBhtJcDwpIs1HUKPhEAxR1yJ+x1/p5ULfzHUZs5e8/7JZR9WYKTiTfZRo+rAV8IK9rftxj5v3AmOZN8i1GO1XCcEyZDJ4toJtNV/+SIVprR6+qrN/UVyNu2wk1KO/qHZCDA6/XphknhjkrFbSquXHAgrUboUgK0ONYlmpzUahM6XlviFtzYnvEhYnZyQEy+pQc6nwB8ja782Q2nQw7gCOGWd5pnzwB1wtTvF6/3MwAquuEdqJMvmm5hxdv0POXHhLjCBmDW+4kNW+wTAPaycbvxfUSN+jBy+5umLnbmYjy051WH3EtL7IWvsrPf2fEHaNRxWzgpdpqa7YsRdsx756JryNaLkWFYlvKzfhoy19780y7AOljfZHNYfNInpRhb9wEqyfG1qDTHNsBRphsVMshCQFNwHA3L9MFgnxq/4qHs8J5y2PssQcIvoFUELASHgObg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(376002)(346002)(136003)(54906003)(7696005)(2906002)(36756003)(956004)(4326008)(6486002)(6666004)(5660300002)(2616005)(103116003)(52116002)(966005)(508600001)(316002)(83380400001)(66476007)(186003)(110136005)(16526019)(66946007)(4744005)(66556008)(8936002)(38100700002)(8676002)(86362001)(26005)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U0ZrZVVPNDZPWmJjaDlDRHlsQzhRNVpmTzdvYlBQZEx0OEk4RFN2bnRnUk9S?=
 =?utf-8?B?eEVlQWNHcnJPV0I4bkFXQytZVWFsMmZtQWU5M0RtZ1AvRy9yMDE5WjJBM1c3?=
 =?utf-8?B?S2h5cDJ5NmZPQlphSXJjNjQvcGFjazZ6MUQwWUZBUW4weHVmUGoxazhMaUx5?=
 =?utf-8?B?TlhaQloyOHI5ZlBGTlVnaUNQVUlhdjk0QjJxdUVVaGNZVVBrZnE3djAyMzAx?=
 =?utf-8?B?UERUV2xwOERPcWZkZitOVkU3OU5EUXZ1RWRzUzM3WSt1UzZPWmhBTTJabFpz?=
 =?utf-8?B?QXBmNW1DV0JoaVFYYk8wTWFucFN4RndReURvbjgyem9WTE5QRExlRXFvM2ZI?=
 =?utf-8?B?MVh1a0pCZFR0ajJ2ekpTNGxKNWFIQ3luZ2I3NnJyU2JQYWszeHRVZHJkRnhx?=
 =?utf-8?B?emRlYWYxV3ZYU3hYTnhUTStpTkVmSERia0hnRjBkMUdsSk13S1VUcmtFL05Y?=
 =?utf-8?B?U29hdXVzUk9aQTVMQktBZFgwMGs5T0krcnhaSlVzUkhkN2Z2TXZwanV2UDF3?=
 =?utf-8?B?QnV5cGg4cEVUU1NvaTE3OEpVSWRGbDlIWmRmcU5YUXRTemlHN2lOZ0xqQTRJ?=
 =?utf-8?B?bW1hbE5IeitLQ2FSUzJ6SE5oQTJ2K2poUDY4YmZFRlByZGNmNTF2ZDBCTW5P?=
 =?utf-8?B?Q1pXUHl0M2tMWm5uYjlwR1FTdFVIeWNlMU0zS0JDNkp0NnRma3hYL25oUmxK?=
 =?utf-8?B?WEVycmMxZW9EeGRhalpnSXFtQm0wZVNFYmg5djJBeDFROGd3ejF5WGJHTVRy?=
 =?utf-8?B?WFUzUXZVMDlTdHp6a0N0YlhjaVRDQ0NEckl2VzdoSWs2NjVSYlY1cUxrNnFV?=
 =?utf-8?B?VkpUOUxjckdib2J0Nlh2S0RVZnd2bVNZdmVUem5LWjZzWXJhUUJDTDhiSkhu?=
 =?utf-8?B?bnNnclFRekd2SGh3VWdrZFhuZ3VldGtlVUNrUkp2RGZacGVFZHpIMHdkOGNB?=
 =?utf-8?B?bkI5QkFLRmk2OGFaYkxhMitHYVJucmNYcXpZbnczVWVYMmpwVytQZ0NlRklZ?=
 =?utf-8?B?Zm9RQXhRaVd1SU4xSlBMQzZ2OXl6SU5QODd2ZmcwcVhwdUMzalkwcFhvRFN5?=
 =?utf-8?B?dndldFJtVjc1UVFpMFBzTU42QlFLYUJ1SnVzNUppRmk2elBQUkNZQlE3dzk4?=
 =?utf-8?B?WHpZcVVnakZFS3UyTDY2cm0yM1VOK0MzNVk3dDN4N3JJbkxqUCtOc0hNZUhT?=
 =?utf-8?B?dGIrYUREaXpjTVQydGNVaHJ1TnZqREtLVFVLREtOYU9VdWk3NHd1UVhkR1Vz?=
 =?utf-8?B?bXYwb1ZKKys4TkJ6R3gwYVdUMlN5ZCtlNHIvSVlFSklsZ3VrcW1iZmRkSGdl?=
 =?utf-8?B?OFU3enN6cHRMWkVMRW9Lam5WQlpMaE5MK0ZLM2V0NWIvcGxOeEJSbmE0a3ZP?=
 =?utf-8?B?QTlWV1NwZHhJcHJwdGRicmFNem1OMk5XekRjNytUZjBWdi95Nm1wSGY3bGVI?=
 =?utf-8?B?b2E4ZFhaOERMaTZ1dWJOZmx3clBkSk9rN0ZyeG9UYldoazBHZ3JuN0ZNY2Vi?=
 =?utf-8?B?clgxdzJyR0plQzhhT0RNMm0rTVZjSzNVdXJLL25yNmIyZ3dncDN0YW0xYlEw?=
 =?utf-8?B?QnJISnl5L0g0OEZiL2tnYTNjZ2lTVjdVNkY5amlyU1l5MHFDejlNZkN5RTBT?=
 =?utf-8?B?SVdsVVV3dUk5VmhjNHBucTJWSE00Z3Y0aVh2ZDdZaXo5S29EajNvb0pmYzRG?=
 =?utf-8?B?K0x3Ui9XVzlYRjQ0NVpmR1lYS1lGQXB6VEFkUy9LZXVTdHo5Y3FBQ2w4Qjhv?=
 =?utf-8?Q?2og9NCD66cY6hsZ//WJZTcQU4/YsQCyJRv52A5g?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9125395b-b2d6-42d4-3a0d-08d900829279
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 02:51:45.4534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEnhvg8fPkIMrYIdUHHyCaDHW/LEJOT1fTzPaqztDIeGAAtGBqpfrGpLCpnObd1IeA64/wo8ju3Ds/OhmHfbX6jcFeUCRL1UWPsiPep5lmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5466
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160022
X-Proofpoint-ORIG-GUID: 5NN0OK8qlRqjMRhn4BwVne6k74A0IFkz
X-Proofpoint-GUID: 5NN0OK8qlRqjMRhn4BwVne6k74A0IFkz
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160022
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 9 Apr 2021 15:55:22 +0800, Ye Bin wrote:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.

Applied to 5.13/scsi-queue, thanks!

[1/1] scsi: ufs-qcom: Remove redundant dev_err call in ufs_qcom_init()
      https://git.kernel.org/mkp/scsi/c/790f9a48abd0

-- 
Martin K. Petersen	Oracle Linux Engineering
