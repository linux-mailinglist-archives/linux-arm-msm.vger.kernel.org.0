Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71FB54140B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 06:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbhIVErJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 00:47:09 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37296 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231797AbhIVErH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 00:47:07 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18M1ukap009998;
        Wed, 22 Sep 2021 04:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=X9kSICCF40a/OjEu+BNJZPCeeR0XHnDpIPanxRJ22hY=;
 b=XjWdUsnlfpbZmLOkPf343Tqi9RRZWxTL+tD6O0+8jB4abtaf58ElMGSgFtFIeMxxIjJt
 hwzOfOQP/FY0Q/RcFHBMCNUkQYgPAZCLw28xTBRCy3pd3ipkkuDoijMXrr0qNql56fGT
 m/J+3ewr7nnZPjyCLxmPUAeVZdGRUzfPTGmD+jWp12iQXFZjysRBVUCfosAXyCan8St2
 u0uWe7eWrZwSBtbxU029eTD4LcPDmzneItBQ810iR2GmizeRQllroeBGtDjezb7DGCUD
 ReZHgBerlF8Faddhz+ltyGmAD5odKcugqGMgz0Fb9kC5yJZxIyXfr9YWoXmNM+gqzYFj Aw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b7q4p9awv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Sep 2021 04:45:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18M4a1Hq101735;
        Wed, 22 Sep 2021 04:45:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        by userp3020.oracle.com with ESMTP id 3b7q5vma0r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Sep 2021 04:45:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfcAfCBik1BYEdlr/BbtcPzNZXZTC4GaSSMzDi0B7ByLTOuT04l4WbD/Wz9zcqhOmJj5amwY8cjX0JFjgHnCZALj71j7b2YuCNAV96s35X3AgjOVnVxmYecF/wc9HqPrbwZNgVZpAqei5Q+g+Yn5R/hPO3CJGHcpw3x+9dT8Biz4T++Q5SMGNPIGyL1zabDgAv8ccv+1+XBTjgwl7dSyKSOEh5Po3pKRkAdDK4VtMELB76ixZYVFcBoxq6Q69Y+9z+XvieCo2afLhsjdfmsISYqb4h6sQylsp5s9MU4eDxw4LIXrd5ad05RI4URW5M30b+C8KZBVIJw2Iz+B7QRRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=X9kSICCF40a/OjEu+BNJZPCeeR0XHnDpIPanxRJ22hY=;
 b=a3h16JAIGuEueHbUskjUP5GulshJ9ett8XCbZrQiMR3Z9zkfHLBx2lZU9qcK3crOeCFB9Ah2LB0A587z/ASzhtKVT/W1vA6emdII3C5llesjz7a+RH6Zx12/CGOECs5+kFAh3IKU7qXjqbmBj8X4TjI88LSJFgBDfHazYVTYZ5Vt+TtyR/5+QgmRHlU0u7VNrIKLV14hPJUaKLgy8/5DZGo4PelmKAZdCHjJM90RO7/Z+Sx/OHc4/mVmNZgjiR1deMe56R8+XTvAjSjVYJ6OZGGQNkXuyYSwACXVAmab+2wGqS1Nqp5Gbe9jJigsidGf2M7Ju0Fs47SIndoSp63fNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9kSICCF40a/OjEu+BNJZPCeeR0XHnDpIPanxRJ22hY=;
 b=DYEHxQPoSXMErAMkl6sqj1YAC17GAj8aK8uHKE4rBakBLgOgmFxRDEpIhphDC5zHM9Y4ZXJFgHaIoFeeMqJT4oz+VYbgbqH2lTznPJf9DJSoqs2382e8kRX7x9OWVyjSTnFU4H96YzqJxk9DMApAmCRFFtBqyPHznctKC2MSq6M=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5545.namprd10.prod.outlook.com (2603:10b6:510:4b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 04:45:29 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc%7]) with mapi id 15.20.4523.018; Wed, 22 Sep 2021
 04:45:29 +0000
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        jejb@linux.ibm.com, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, Chanwoo Lee <cw9316.lee@samsung.com>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        grant.jung@samsung.com, dh0421.hwang@samsung.com,
        jt77.jang@samsung.com, sh043.lee@samsung.com
Subject: Re: [PATCH] scsi: ufs-qcom: Remove unneeded variable 'err'
Date:   Wed, 22 Sep 2021 00:45:14 -0400
Message-Id: <163228527478.25516.4628525953362981317.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907044111.29632-1-cw9316.lee@samsung.com>
References: <CGME20210907044846epcas1p297b8ef121290fc3265cf9dc3eadc44de@epcas1p2.samsung.com> <20210907044111.29632-1-cw9316.lee@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0154.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::9) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
Received: from ca-mkp.mkp.ca.oracle.com (138.3.201.9) by SA0PR11CA0154.namprd11.prod.outlook.com (2603:10b6:806:1bb::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 22 Sep 2021 04:45:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf9c5963-cfda-4f9d-7eec-08d97d83cd81
X-MS-TrafficTypeDiagnostic: PH0PR10MB5545:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB5545C674A68D477C95C3975B8EA29@PH0PR10MB5545.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EB0wKOcS1QtxJV/jwQUoYfN6VHWajkZXEQ88jhhgOMsIeF8G3ryhHhFozx2/bEkoKVPo/3t3Ovw4bgHUBUDqRjor1xEIE5fuEecG7RUX5mCKnfNmCmumkZ/37wOpRtQtEAVW9nTow1ujOAsgBzaGIEqNolMJ0zGUUnFJGwhJME6LMDuJNMDNBDPCjgFsq5Ya5H8dv67RUr7qVDFRivVLh4YwC1ObTJYeiad/hL+CBkRBEDLh8eyaN2GHLBQ2/eYvEz5Dmu1hBox/o+BbTfPi6vGue+es0U5jWjR+ehHJgZZFZ+jirXYWqLi915TnFzzvcqKo5Wi+wglluxywlVcZV72vXaNBdyE9NmiXpMGnrvSVoRFmCbsT1gaTeG0bhc0ZMtb59yftnZLFYP5CUDzPe3plpLv3icbHbKS9grodmAoJCGTDL/A8hAsPMHjs83ToeAFdu/SZHRE5Rd+c19wFnkPS8nN4epff7M4dLbm30ICEoxhvwif6DcnJvDSOgp4MVZ7eUOKB/F9j0aZmYEFYa/z8j7JyNMc5YOVeThBSox4vUS1fGBS2JUaFuD1bAkmsp3KJJ6nwLWA8izqEece3RUTMVTDaoe0eDpnGHOuEC9XKS8lBEIVbzfqJEsL1Yx7DS8YTZVvk0X/SueMgPrfvUINdYtcP8Ycc497dnT8gGfUNDyvM8/ZFT/mt4p3VQsEHnX5601HTtM3E2DOWfAb7VX4qbHcknJ2hqRMx82zO30WXATffFMyjg3/mz6cOTsfpiSk897HFz/3af1WVNLelqkd6+Y50+8chFzY2N4lLX10=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(8676002)(66946007)(6666004)(103116003)(38350700002)(5660300002)(6486002)(52116002)(36756003)(7696005)(186003)(6916009)(7416002)(26005)(8936002)(38100700002)(2906002)(4744005)(2616005)(956004)(86362001)(4326008)(66476007)(508600001)(966005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1Z3TjNHL2NlUGxmYU4yaUJycnRkaThvQWt3L2dndnFVQzF2MG9LMVVNUGhi?=
 =?utf-8?B?Ri9Bd2J5TCswTW1JQmQ3YzEwSS9HU1Joa2R0UmdaWDN4SXpac2hKa0FSbEJz?=
 =?utf-8?B?d3RIWXN1Y3Y1VXRHNUNWelVidlBYWXhsU2dqR0x5ZVJoL2hpRTgvTkdVZVl5?=
 =?utf-8?B?K3VzRDNSRnluUFZCNXoxdndMaGI4QjJhYWtXRFRLQlBXbDdHYTlHT0xHbklY?=
 =?utf-8?B?b0JyejRjdmJCcWJZZGtGWENTUEY0SmVSTFZ5YW5oUFRFZEpKTU9MUytKREFk?=
 =?utf-8?B?c2hta1UvOTBvc3N0TWRNVm9ZODZ3RjJqa2krRmtiMnkvZ1NzWnA1RDVVN25R?=
 =?utf-8?B?cndaUzhRUmtqcGZ6MHpDZm9wL2RtL1ZyL2VzYTFLVFpReDBFWkhDb3RHVzEy?=
 =?utf-8?B?c3dXd3NCQ3A1OXd3ZFN5NGNKZ1Zka2tkeitGSTMvTm1RSmhWZ0JCVC9BZWZy?=
 =?utf-8?B?SCtqSFd0MHptd0J3SEw5RC9UREJ5WlEzdjIxWE5XbDVReW5QRzJ1bG93Tkpj?=
 =?utf-8?B?Ny81THBQbXFSMFJwWml2dWtoRXVicmhIOHJhVHQ2bDQ0TU1jdWxKMzNuUEha?=
 =?utf-8?B?QzlJazF4a0JiWkc3WmdkWWZYaWJkbHI2eVhJcXdHa1p5b1RrTkwyQXBRVFlB?=
 =?utf-8?B?ejEvR0FJU3FMYkgrRFhUMG9xa2FRcTZqejk0V2pTdUVZNW9tejZhdkt0NWJ4?=
 =?utf-8?B?K2haM2FCR1djbUdxa05tZDdKaE9tMnRENFUraXZ5YzJVcGcxNFVsVjdNbmp2?=
 =?utf-8?B?VUdWaEVicW9uR1BYaDhqNlAxRldja0tSNW9sVFVMMU1ORFhHckY3OGkrcXJ1?=
 =?utf-8?B?UXZUUW5IemV2RUVQV1hibm9vbzV2OTI2Q0d1Uy9hQjZPdFdwU3Q1eGttTWVh?=
 =?utf-8?B?Q3dkVHJ2VWNkekplWGdXZUgzMG9hLzVabDh2Yk0rbnBhdzJRaUpycE5sVXpa?=
 =?utf-8?B?OWV3MWVTNUhqaW5QaVJvcEM4UzA1TEpOcVI1OHZ6OFltSTBvL3M5MG5UWUxl?=
 =?utf-8?B?VXN0REwzWXYyckgwY3p2SUVucjlxYUZybUIyTUtDOU5SQW40RWxaL1NIZ3Fm?=
 =?utf-8?B?bGE2YXJtZnA3Q25XMDkrUXlVOXBucjE3UmNOTkMyeWI3cVRFRmpyV1ZUNWh4?=
 =?utf-8?B?RUxsQkY0eFFvMnR1MWpQeG0yUFg3L0lYS0pDSzc2T2Z4Q2hNRGg5V2lrMXZD?=
 =?utf-8?B?RjJxaTZad1hKUUV5NHVseGIxZmhQb1hGczdKNzYzZUtNWVdFcjlpMWhQSitW?=
 =?utf-8?B?elBHbUxaenJ1QW9jRVhKMkczVzg2ZTM1M0x1V1BDVVhxcW1Rb2lSVkJQTmZr?=
 =?utf-8?B?eStqR25keU4yU1R0TmlSSm9lK2pVWnJSWXpoR1h5dDRTVzRlQisvZXRueUFh?=
 =?utf-8?B?SjVyazlDS0hFVUF6dFl0aThUcUpXaWlkdXVTWlplS1RXanViV0lkZXlUS3Vl?=
 =?utf-8?B?a1NPVDlTdS9GaFBqTnE3Q001d1N0K2NZWnE4NGlvZ0kweXJSMWNUR0xIQmpJ?=
 =?utf-8?B?SjJVMVVnYVdJQ3hEbjI2ZThlZUV3U2loa3M3M0JpOXE0QStvWEFTditEKzNn?=
 =?utf-8?B?QUhRS1FsSjFUTkF6VGdyMFpZT1RGUW5MWHRJbk0xZDZPZGRYQ1FOTk5EUklY?=
 =?utf-8?B?UjFvTUdDTzNmQUdDSFh0ZDVCQkYrNVM5a01IMmdUQUhoMGZvNURaZ3BZVGY5?=
 =?utf-8?B?VVpHM2UvUUdtNmtMeTdUVjR3WUlUTm9ndUJDOE5sOHdtTFNDM1hFTjFIMDIr?=
 =?utf-8?Q?AKxHGI/xusIOg4LvW8ZyYk/Z9Cq0+cajtDdBY85?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9c5963-cfda-4f9d-7eec-08d97d83cd81
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 04:45:29.3730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hPXmoUo3mk2V1AX7IOQUbvMpc/jjymqJtdUKl78HW14HEJ6gu7D3nK9UOJEU4lriho1sw3nquNWULyJTgTvUujPW0S4Zp5sinE5wYAgsu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5545
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10114 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=984 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109200000
 definitions=main-2109220029
X-Proofpoint-ORIG-GUID: 3-UCAyclSPeSTwZZLwYkEpWgLX0dfT2u
X-Proofpoint-GUID: 3-UCAyclSPeSTwZZLwYkEpWgLX0dfT2u
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 7 Sep 2021 13:41:11 +0900, Chanwoo Lee wrote:

> From: ChanWoo Lee <cw9316.lee@samsung.com>
> 
> 'err' is not used.
> So i remove the unneeded variable.
> 
> 

Applied to 5.16/scsi-queue, thanks!

[1/1] scsi: ufs-qcom: Remove unneeded variable 'err'
      https://git.kernel.org/mkp/scsi/c/c4adf171e834

-- 
Martin K. Petersen	Oracle Linux Engineering
