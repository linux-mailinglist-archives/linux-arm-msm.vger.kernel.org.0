Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9088D421D89
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 06:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbhJEEhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 00:37:35 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6550 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231877AbhJEEhc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 00:37:32 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1954O51L004481;
        Tue, 5 Oct 2021 04:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=zxVv994hScESNZAeQAngIrZQHATmtkqKdOMjVHV51q4=;
 b=nWFT7OXEDEn2HiXXrQAniMsjdTez1T5n5Xe4CTVs7QQa10e1uNfEOatkzgQPsajvIZRk
 VY/XQRSoulMDKu6qFhChO9f8X+AjyDxoWy5b4XJ2nSFM9VYj6a1HZVqmjrwIRPdEbjSK
 noS2jBzg3kETDxBFYsERP3v6B9QBDh4BHXXSqOq0e2fC3nUYbmAsbYyajUP2xMza0ExL
 gYOnqlRaRACnp4dzgQTfcM+yJB3TX0p5F4X5C6Yv2qbv0c+L/IK2EVvPfi3zPqZuMECL
 oZXBUB2Xukg6RHzKpi/kJt0pTiHiTGZvudeeLTdl+tfYo7cCG1g3oFCvI2xoE+DoPdf1 pA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bg43dv8jm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Oct 2021 04:35:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1954UJMi054346;
        Tue, 5 Oct 2021 04:35:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        by aserp3020.oracle.com with ESMTP id 3bev8w4hvq-10
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Oct 2021 04:35:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SA4dbaKTUFk0PBsDKLL3IHhmCqnq0zq4jpPZEryYhyi47aC8x9bsiB8itY2qnPjRt2p3ddaKxxSzJKKPBd+I4cu9sV/k1lNsrghdUGvS8xl1UrRQ/eSN9AUhteRXvTvEjX5DvaIHB8y+S/+jEpgzB+MYpoDkDRY1Rh0sTjN71HLum82QvyGDPAbhCDwlMYZvtkqO+3CFUqC+WMGxFlLVIJLy/JBtBsCWJsxquTJX/JSeH0LWShiG/C8AO/8EsNJz8EpAnZcLD31cM6awQV3iuDfW1jIwbtOtWKrwzVGHvlK3mH8NP3lqCmglqyG4uTuSmhOA0s+uTO66uCBnBWlfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxVv994hScESNZAeQAngIrZQHATmtkqKdOMjVHV51q4=;
 b=RBt8TJKFBzRN5WznGHcCgx+wwAIQjvC53svJT1TauBOZg1OdINmlmPc40vrAoZhSw/rQsJMQTefhv7QvXbkxvsNc9ddp/3Zr2SbR/Q4jufnDX9H49PC4YYzWfnwG2r0A1lXHO7/EDW3lknG3W/xQuY0FUxnn/vJvSGocZKiXSoMSnn7Gfbuib8JzXWTeGwKd4UQFG0tUBsW3PiXqeDqQgvA/pyJqX/q69fc8x0ypapQfsv7Of/XaZomQsXT7s2uYBzmycvf+2F9uDIQkPW/TW1lnKREemymcP475hzApnv/2RVcSaqsGBWSfEs62Uq5CZsqi2FRZiw3raXxJHbQTWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxVv994hScESNZAeQAngIrZQHATmtkqKdOMjVHV51q4=;
 b=j/3fOBlHLYhE7dD5kt5bHB23SG7MXFGWraGVuFD4ubK5mQWgnxgHp+A3kerrZz6XX3shOJJBjDJeiqGEwaiMZQFG9LdxRVfmfzXl6vu/nx0Espz0SJsMHcq8vkApvey1uL+Ca1fRaTcikU+4sz/IjyykZKMS57GuUPV8DoeQwXY=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4754.namprd10.prod.outlook.com (2603:10b6:303:91::24)
 by MWHPR10MB1950.namprd10.prod.outlook.com (2603:10b6:300:10d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.20; Tue, 5 Oct
 2021 04:34:58 +0000
Received: from CO1PR10MB4754.namprd10.prod.outlook.com
 ([fe80::69e7:b722:cd67:85b3]) by CO1PR10MB4754.namprd10.prod.outlook.com
 ([fe80::69e7:b722:cd67:85b3%6]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 04:34:58 +0000
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     asutoshd@codeaurora.org, "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-scsi@vger.kernel.org, cang@codeaurora.org
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Put Qualcomm's ufs controller to hibern8 during clock scaling
Date:   Tue,  5 Oct 2021 00:34:39 -0400
Message-Id: <163340840530.12126.10705443310066499895.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1632818942.git.nguyenb@codeaurora.org>
References: <cover.1632818942.git.nguyenb@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0001.namprd11.prod.outlook.com
 (2603:10b6:806:6e::6) To CO1PR10MB4754.namprd10.prod.outlook.com
 (2603:10b6:303:91::24)
MIME-Version: 1.0
Received: from ca-mkp.mkp.ca.oracle.com (138.3.201.9) by SA9PR11CA0001.namprd11.prod.outlook.com (2603:10b6:806:6e::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22 via Frontend Transport; Tue, 5 Oct 2021 04:34:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b161bf3-c59f-4359-f4fe-08d987b97cc3
X-MS-TrafficTypeDiagnostic: MWHPR10MB1950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1950BA6029DF146811054FBE8EAF9@MWHPR10MB1950.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9J5wrSjpL5ZEhVDNAHc8BZxqbNJHIpaviQl+FHhXL66ycd0qoxC8r42BV3j2XtA2dQbqCH5CuYmfTRcgy700pRNpDlaY83xRbtpIvkwuZ++vtM0eeZnSwRe9IdAu3BCSYRyEb/t7k42+aYBZhlmPiyUl3oouL4mYdKkHWUuQMQI5UJgj+VCEajXW9Xw5Tx7Ka9APbpCfw8wm+J/63b62U7iJVSnxfZKQRx182RZeaSkrg7wdkv6+ExUi3lIc9PGyGBFBYs0TOTE9P7hVkfNWRey+4Le3e8LWG95Kk7qkA6KDiXVnrJJOZdPfPXWelYi6ApHAU7XrQKLz0UMGJ1TK0Nfxhnb/OkZzRNKx8Jr1uwiEX3pr6ZHpQBHh7DRmF85CSoI0g56y0h1ftXW7s4JR3ABCGf9sN1GXWivKOaAs4cs2OnWZmLez07skbzcShIRmmgFwTp1OdyEYP3rkVlEdRIGbscqfTowYu0F38iuLejMzeL1ADF8JKZDPf0ZjkEDlhjVKtpENrySRxeKd9UC37b63C3o+RYceePh65wP9Qgf5RfMNrRfFo5jjfl5AvHuQJrOq+BhDwwRGH+bgNC43QJt9FfZayfy84RYau2sUgPLbupCyT+b5lMi+ejvV0UGKi+VtOC1gBgnziMpyE5NtyeOyKYNrV+/TkbaLMO35NXkUxOtGF1OmrO9vsrOTZCBr3l4BCMDnYOke+py3CwTnxc+Stpr7DSQiVPmJyL8803c8tp8/tRNYfq1dsFlJKuwo6Kf5m0RSji/od9pyPHu+6oGNfSqvyK4+FA2dItFzwVjo91/ZB09UK3mHhf7eOlXCp96eJwHB7zyj/wifuP3WdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4754.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(38100700002)(6666004)(956004)(5660300002)(6486002)(36756003)(4744005)(38350700002)(186003)(83380400001)(26005)(8936002)(8676002)(66556008)(66476007)(103116003)(316002)(7696005)(86362001)(4326008)(2906002)(966005)(508600001)(66946007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFpFalAzMDNRMXczK0U5ZUc0RFFQNkFKNGJBMGd4L1M4SkU0RDVLeHRoTSt5?=
 =?utf-8?B?M1Q4SllFRGwwaHdUMFZHR1dWVm01MmR1dXdoNE00OEJTUjlSNHQyMHloQlVE?=
 =?utf-8?B?Q1ZJcUduanRVQWdkSjFBUzN4M011MGJwalpuSnNEVjJHakk3ZjhhalVGSjhJ?=
 =?utf-8?B?akZsUjE4Y0lsMENoMnpvZTljVjNRYTJYMXdTTDNLRXR3VDZnejBpc1EzdVRY?=
 =?utf-8?B?UHFNOUZIQS9RK3F5OXNsTmNpbnY0M2x4S2dnTE9NUkpaU0JrT2ozWlJDbjJq?=
 =?utf-8?B?NnFPN3V5K1lsbWdDY2g2M2NBVWZtNDA1dFpvb3FMeXBOb0prTXlkT3pEOGE5?=
 =?utf-8?B?d0NGQ1NhZno3cTZmT2VKWWVoUFllSjNZMC9hMWptNFJ2YnpsVFZYN2MxOGRq?=
 =?utf-8?B?R3FON3c0Q0xzUmR6M2d6WEx4cjBHRThOeUo3dTVGUUJHbUxURmZpcGRTazJT?=
 =?utf-8?B?akFzZEpZcGgrWENaNGltQUJmeTYxMUdwdWNmTzBtbkV6VnZBYUZBS3V0a0s1?=
 =?utf-8?B?MExib2VIK3o5SXgwMjJnTitOUDFFTEVFemplNjNTR3RZeWUzTXNCZEw1Z3ow?=
 =?utf-8?B?ZkxLVy9iL3RENG01Tlgwei9iSnhUOCt0V1VBSlk2VkNicS9hbjVSNzhDTlpQ?=
 =?utf-8?B?SHNUMExjRDFMcTVJNG1EL0xtTTJvZXVQaFk5ZnZDTnpYRDdZNDVJekdKa2VG?=
 =?utf-8?B?ZW9CaWRzZDVibExsOUZ2MnZoalFrNGYyaXY3THBvRU15dVdqYzBQNGQrQitT?=
 =?utf-8?B?TC9vTkpjSXNKNXNTcGQzT3ovV3RieitXTnYvK21lMm8vbFNtbUlBUTNDZEE4?=
 =?utf-8?B?YWpqdllzZzVtSzVQNmZDaG5kODhGVzA0UnZkV3Q1SG82VXlRYXVVMFFOL2Ev?=
 =?utf-8?B?MjVIbGJZMXE1bkY0UjBhTE9UUDNqUFl1SzVDWUpVZnNzZjJDb3NMNHUzeHpO?=
 =?utf-8?B?OGdka3F2Q2hvNTVjWlFYS3MrVGkzOEIxMkdCV20ydGlTdGlRTUMrU3dDRUd3?=
 =?utf-8?B?ZmY4TUFTQ1hVTDI2eVNvZlB1ODVRSElQSVAvR0g3TmdvaXEvOWtkUG5UL3ZP?=
 =?utf-8?B?UUQzMmFiaEN2MXNiQm5Yd3hhTm56QXdpR29rd2Frbmxub3p0ck5ZNkdsYUtH?=
 =?utf-8?B?dlk2RG1WaVpyRVkrN3Y1VnpjbE40STkvNXZnK0R0Nm5rWkV5TG5tcjJZUnY2?=
 =?utf-8?B?cktJN21JOHRGUG9zeWZqaHVwOTRKRklmK3NpTCtGUnFMOGdONEtoOW9PSlV6?=
 =?utf-8?B?V0hnMGFpMUpJWjd6OExmN0p0bGNKdk9ZeWMyNXJGU3kyZVZrZGZBcEdXMWF5?=
 =?utf-8?B?V2puTmUrVGJtbXhmaTJ1TkZwcU4xR0NjVXg2NWxNcGx4cDIvUXFYS3dXS01p?=
 =?utf-8?B?THdTdnhRMXlpVWk5YlpHR1gvUW5MbDkwaHROMUwvQ05BdUYyVk9yM0FONDZ3?=
 =?utf-8?B?dUZWTG9IOXUzU3o1d3ppemFVOXNLRDFldnhubzBwd21HQ0VFc3dUMzYyTExu?=
 =?utf-8?B?d0gzMjVhM0oxZkZtUXdJK0ovVC85aGpLQ1JkSi94NWNlbFBvRFArQlgzbVpG?=
 =?utf-8?B?MFoxS0lFdDFTSkV0dVFTYXQwS2RMTFBibHZKVzA2ZHE0YmpmanJHbytNemFX?=
 =?utf-8?B?ZEFVdXpiVWRvVzd3akFGOEplZkgwMXBNeTZMb2tSSnk5TkNYaURPQ1hRakM3?=
 =?utf-8?B?R3E1a0JPVmFkcElBYzlPN3hKNFFOS3BHdzhLRGRwbk9jYkhSSUpLWUM5SDFC?=
 =?utf-8?Q?xKPd5p4p6ig5DyRftPxfsw2+C7XtK25owrfI6z8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b161bf3-c59f-4359-f4fe-08d987b97cc3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4754.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 04:34:58.3603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dir03shNU0gNZbkDZY7nZuXNLqZlx0g81fM7VquLkd1LlzToetNi1t2maOP6ioWoUAY7xlqUwSntLqrSlt4QEQ4XZUb9vrDKkGC3kW86htA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1950
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10127 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=970 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110050025
X-Proofpoint-GUID: yD8WztdpiDv_bUYcn9VWIo8QNKYdV1Z3
X-Proofpoint-ORIG-GUID: yD8WztdpiDv_bUYcn9VWIo8QNKYdV1Z3
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Sep 2021 02:06:11 -0700, Bao D. Nguyen wrote:

> Asutosh Das tried to upstream this change about a year ago.
> We would like to resume his work because Qualcomm's ufs controller
> needs to be in hibern8 before scaling up/down the clocks.
> Just like ufshcd_uic_hibern8_exit() is already being exported,
> we would like to export ufshcd_uic_hibern8_enter() so that
> Qualcomm's ufs controller can be put in hibern8 state.
> 
> [...]

Applied to 5.16/scsi-queue, thanks!

[1/2] scsi: ufs: export hibern8 entry and exit
      https://git.kernel.org/mkp/scsi/c/525943a586ef
[2/2] scsi: ufs-qcom: enter and exit hibern8 during clock scaling
      https://git.kernel.org/mkp/scsi/c/a0cea83332ae

-- 
Martin K. Petersen	Oracle Linux Engineering
