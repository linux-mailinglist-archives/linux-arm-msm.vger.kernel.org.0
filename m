Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91193379DB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 05:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhEKD1H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 23:27:07 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:51472 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbhEKD1D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 23:27:03 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B3ENSj071740;
        Tue, 11 May 2021 03:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=5A5wvjwzDT/+/XL1SIBfIXgh4SPZz292q7g0T479AhQ=;
 b=X4EFR4S334E7NBNvQDkPyPqImqTVdhd0jqU741CkLmapqG0R41peE978YzYxu08s8UbA
 8w5g/tkChn+brqaqBf6NDRsu3HOxHsDotot/w34jPtX5JsXvf0ezwH/Taj8BRGM2K+yi
 ua3Hl5oJcYTExe13shSeIPET9WNkoMlXZ1g1xNUDu0fYr9SGv9toR43oDC8z4rHTwm/t
 C8jmax9syCvrhrJ5JZfkbuDCewVKW6X80jM4sbJI8YSef9ma6MfK1ZuBGeJmC1gwaafL
 6sUX/O4E5qHtRbyPMJwn64bHAqSgqxhQXVZHJNgDOdMQnpnctqjbQgQf/U7WdeTFGMbx sA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 38e285cgd5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 03:25:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B3Get5153372;
        Tue, 11 May 2021 03:25:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
        by aserp3020.oracle.com with ESMTP id 38djf87kx2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 03:25:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9vD/m0EkE/JnwnPRwRHdNZ0N8ME6PPR2VNXb9OCYCwG9Um49fYXvuSmEVYcZpbZsKBZju7NL9HF6jaoz67qm4Ce8YsQ7zyfKMVHtGtMAwZVmzCuh7YXxl4/NVR6H2j0Hki848YBt9GbTDDAmIOxdu6lW3c88cPheWeN2tJJrFzLiAqDBxb8JWCH0bM8OqVCapCtJvsUnihaC74DyEhU6Kz3rE1raNRN0DOwq43RKEtLkfI4Wh1uHbhV4gEqg+pWAwx/mjZgKTsamd0lW95wNUdyLlkiZpeb9t5x0I9TAaNAKY8xYXt2UMJbOlMuD7TTaSsJohbD1SB9zSFbYCWsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A5wvjwzDT/+/XL1SIBfIXgh4SPZz292q7g0T479AhQ=;
 b=ajmzQ+CG59soQpyFMek5+wK9TLhERVO/v+X0BD3+NBTEaqd8jhI0bRRfcBPEwa94OGFXCV4kPJiirx++57KcCfhGRRfog4pBf70Q88jHPumi4n8IK1WIcvK00XuB32Mzs7CaOpub7sSORRy+88KfrFI2tNl05KRcMBnVkJDjEPj1slqiUPH9edcl49eAoVLpZpea3Zm9lacDC79uGLWqDrOFdJNcm20UGIRhMIMpvK/Y4l67VFhjX9FciuZHk7punb2oEseZXOBvZCbnQWOJ1ln5SnNSK9JzFfo4fK7ydXtAG00GOmVrNQsuGCSaKD7CMf74YeIPrJ8K5vK7XQDLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A5wvjwzDT/+/XL1SIBfIXgh4SPZz292q7g0T479AhQ=;
 b=Uu6rZhPh5uIZztdm7QvIs0kUNtz19PoMTypftkx+nyJUqDtFhScBlq9BLRsU3nfqIokQlVCc7AoERTFa2AI6rK5RGz3OVlO3gr8Qhuz/SSnKpuUsyz9UCYOI71a93RHD9sJElUl8uMaRFTwiz2vQw03PbU2dECctsvQZbXgczjY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4408.namprd10.prod.outlook.com (2603:10b6:510:39::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Tue, 11 May
 2021 03:25:38 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::4c61:9532:4af0:8796]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::4c61:9532:4af0:8796%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 03:25:38 +0000
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     linux-scsi@vger.kernel.org, adrian.hunter@intel.com,
        Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v21 0/2] Enable power management for ufs wlun
Date:   Mon, 10 May 2021 23:25:22 -0400
Message-Id: <162070348784.27567.14973100785851703779.b4-ty@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1619223249.git.asutoshd@codeaurora.org>
References: <cover.1619223249.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.201.9]
X-ClientProxiedBy: SN4PR0501CA0144.namprd05.prod.outlook.com
 (2603:10b6:803:2c::22) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.201.9) by SN4PR0501CA0144.namprd05.prod.outlook.com (2603:10b6:803:2c::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.20 via Frontend Transport; Tue, 11 May 2021 03:25:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f3dcb3e-487e-4cfd-13e1-08d9142c7278
X-MS-TrafficTypeDiagnostic: PH0PR10MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4408F5332BC30EA054C9399A8E539@PH0PR10MB4408.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nooOOrj7vaNua/QcinNX0s6Vo5aurmEB7EH81mHMgz7keemcukpwLKkNG4sPdUGkyML23GEZ0024Bt+iSQENZIViylWHPEVgqsXCo/JzhQ852VJkPYs1OTokOo/jmXJRzTTIDUkfkd0jrrQwCOSCBEqwDnYjsd9MuyWFBhorg4iLAHVSZ9V2ndCXkxsdvN+g0ly4bUFsDQiJlTGAQiee7HdiXFkDk2pzeu7BQrUT8ErAWOAz1WR3ejLrh0b98FweQnzNx5FbNQ2V0gdQxnlonPhoAsnKz/mx0N5ZqnHN+ZHzBzqX/hWtQlz7ts9Rk6qvy903rMZ98TWur6s6ecwla7CDswK6s6s2qgLlwcdusnWIqge1B0U32jwSZmdRNFNrrUwl1LqpZ0uwerwnvjbzXVmg3dvKL4OLBlHoabKCLFDtQEdFQF2PyoiViv5s/lzfliKfF4sSEhSlamVJ6Yuwkf1a30/eUeWRAIcErSszFABQSo/MNXcJBIFLFU9IDuwe+fKjeHuQc5r/j9R8HgnVAV4UbM7Zh0rggYSMcdE77nse62yVxfLOROcHxO9urNd6eVkvAdWO/jc3uTiTMdDr0LPuqr1PB2RiOs0Dmd5+pmKmvenHr19byr8E+AsAH7U76GD8vhYdyF0Ppu+PtSgYeo09Yu2Kx5od7ZJZb/eE0oZH6DRxH8w01N9pnZKteYSgSMBtZoY7xAu5xYLPmuEok/maSjFc54L/axSD/KIDDyccyTRHO905uJob3NiPolE43H4Ugt/2Gw2JFxUeJ/PPmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(346002)(366004)(39860400002)(66556008)(6486002)(5660300002)(66476007)(16526019)(2616005)(38350700002)(38100700002)(6666004)(478600001)(186003)(66946007)(36756003)(2906002)(4744005)(83380400001)(956004)(103116003)(26005)(4326008)(316002)(966005)(8936002)(54906003)(8676002)(86362001)(52116002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NjdSYk8rZytTZG4rZWtTMGYrNURFUjJxcU8zcHF3QzF1WWliQ2U5OWpXdHJY?=
 =?utf-8?B?b3lFZzVxUVllcEkyeWk5b1JMU0k0ZVJhdnM5YjdiU3d4Mkg3NHRuS0h1QmVk?=
 =?utf-8?B?WHlJaHlXcUFiNUtXZkVtWjVWZnl2dTI0aExOM1doZFBZak5LeCt5c3c3SzRM?=
 =?utf-8?B?N25GQWYveXkvdzFKLzQvUFpZdUFWMmp4cEdqZzRydk5OeE9sUzZOM2tuVEtk?=
 =?utf-8?B?MDZWVWY1VVdpVnRWeEhRWlQyaWl4QTdiMm04L2RmdFFMVExVemxydzBZb1B2?=
 =?utf-8?B?TUNJWTM1L1F2djNKM0FlUWFSYzRRdTYxZG1CRXlaOG1xcGJGY3NtK1VuWGdI?=
 =?utf-8?B?VkhMUVNOQmozVTdWVFM3Ym5ybmNoRHpoR1FEcTBCNVh4SEJ6TEkrVERhUS9U?=
 =?utf-8?B?cVU5YVZnbHlETHZKcDFJeXQrN1dtcmk0UUFTWVErU04rckRyb0JKZk1pK2RP?=
 =?utf-8?B?MkZ1OVlhMFQ3Q2RKWVlLMGZZNWw1V0hQa0p3eUYvMENNUnpUQmpSQWE4bTBX?=
 =?utf-8?B?VFhoYUFMZW1iUUdac2ZQOHpjZlZUVDNJNTkzTTdtcDV6VlhSMjd1dzZsSzhU?=
 =?utf-8?B?dzRRb2RaT3pIU1hoU1psd0pJa1R6UVo1QTU1L0wzcXF3ZlBHVGJISmh5RnNL?=
 =?utf-8?B?clBsRmhXbmdtQTF5eW9EaDdZSCtyUmphRkU0U1BRVnZnWGJmb1Zla01FRnhB?=
 =?utf-8?B?dEVzSEpKdnorRFordEgwcTZmaG1ET0dsTUNPS0lYMHVYQjFDRXRGTFhCM29R?=
 =?utf-8?B?SmlOclhpMFlvSW5IbVJXVlFuKzhUOGZzMzlpakVZR3RQckFtemhsUTJBbmtZ?=
 =?utf-8?B?NXJROWpPN2VFRE4rVnNFRkU3Z1lmOHpDaGh5ZWs0YWtHWk5IZitxYlhGR3hU?=
 =?utf-8?B?VkhOQW0xL3o5UlFvK3A3S1orWHV3K2hmNEFkTzBqQXRLUUc5QnJNSEFiUDF5?=
 =?utf-8?B?WWNWR05BS2ZaVTlSNHFvWmIzaSs2NWhKNHlXeTJINDFGN3R3TzdBZ0pRU2RG?=
 =?utf-8?B?Mnp0akN3SXNhaFFlYW1tREk1bU45ZGtrWFBZS1hSdHhjVkU5eEFWZDBwOWph?=
 =?utf-8?B?c1VoSTFETFRCWkNOd2NrbUhaSVJxalJtRVlxekFRQjN0RDRjcURZUGZZUmVI?=
 =?utf-8?B?bjQzRGkyaUZyWm1BeXczd0xvLzByMW0wV1N5cXZWdGpUWTdmNU94WnRjOXZq?=
 =?utf-8?B?bm1EV3BkaVRyUGdCa3U0aDBmd3M0Qm9TRS96S3o4WG5LdGc2R2xQekw4Z0xs?=
 =?utf-8?B?WHkzbFhlV00veXpicFVKa3QyMTFnWlFESGJJb0llZENlSjlpZmRWcnBnSzMw?=
 =?utf-8?B?WGtmeEhlbGRxdGg4c2x1REhaam1weWp0b09kajhWTlo1RlhnOThpN05BY2RJ?=
 =?utf-8?B?REx1OE5HQ2FITTl2NmZDUXZmL1FPeW5odURnVnI0Q2p0NHE5cEFaOEU4K0tq?=
 =?utf-8?B?dncvVWF1NXJSb1IwK2FSSzZFVWFEZTUxQmNXWXJpMW1DSm9GNUJDQWMwSmx6?=
 =?utf-8?B?Sk5WVkd6SkpaTW1hNU9NeU9xd0RvT2FhYnpTVzcxTG4vbTFlazBiRkhvUzFC?=
 =?utf-8?B?VFRpaEtyVndPb2ZtY3RRTHRCMHhaZUhkK2JuekE0VkNYZGZ1SktPWUhYQXlp?=
 =?utf-8?B?MFRJemFLODlkRThuVFVrYVhzRG5wenJJUUdPMmw2Q0RIejV6T2QzeVBxYmZy?=
 =?utf-8?B?V3h1ZmI5RDFldURvek9FbVNlQlFCT256b0NVMC9jSjl6SkFtZWY1dlYycDc3?=
 =?utf-8?Q?iYwkUW7GaRttzv9ryGV3jQWcmTKGJhdRHTJe+PO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3dcb3e-487e-4cfd-13e1-08d9142c7278
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 03:25:38.2867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvwHDvquPv+3QMXJy18P3kAaCxbHT9YEPfED4Ng6fw9Wbo4Cn90oesYLWTFSwPoUzKCIcnNS6gELViGyC/6WRxBS2iEyFbAewKZwJh+Xzwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4408
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=806
 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110024
X-Proofpoint-GUID: I3l1PK7XQQAqerDceRs_IrrNwnFmBfza
X-Proofpoint-ORIG-GUID: I3l1PK7XQQAqerDceRs_IrrNwnFmBfza
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=983
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110024
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 23 Apr 2021 17:20:15 -0700, Asutosh Das wrote:

> This patch attempts to fix a deadlock in ufs while sending SSU.
> Recently, blk_queue_enter() added a check to not process requests if the
> queue is suspended. That leads to a resume of the associated device which
> is suspended. In ufs, that device is ufs device wlun and it's parent is
> ufs_hba. This resume tries to resume ufs device wlun which in turn tries
> to resume ufs_hba, which is already in the process of suspending, thus
> causing a deadlock.
> 
> [...]

Applied to 5.14/scsi-queue, thanks!

[1/2] scsi: ufs: Enable power management for wlun
      https://git.kernel.org/mkp/scsi/c/b294ff3e3449
[2/2] ufs: sysfs: Resume the proper scsi device
      https://git.kernel.org/mkp/scsi/c/aef80fd1da32

-- 
Martin K. Petersen	Oracle Linux Engineering
