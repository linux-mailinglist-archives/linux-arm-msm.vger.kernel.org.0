Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350DB42A196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 12:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235437AbhJLKDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 06:03:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47592 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230389AbhJLKDK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 06:03:10 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C9qAZN015608;
        Tue, 12 Oct 2021 10:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=fxmO2w/7NAQ5i8EleTkuRGXXpfSHLtG+0pFQAPoDT64=;
 b=hTcKoFF5zVhoR/r7cOfD5kBgh4NJV/Ssjktdam5wGkxF2rL1op2GWydy4YySfiCRZ8tz
 qBTBb1lsILPhXYGHZ9hQCPxhkbMmxJg/FD2tcaBxPfZoYuAGV3WL0/xV2vkTLy8yAt+F
 kHwXu8adJx33wzQxptI7qcXTXIYQryzYDU8L7nivaL9qw43yXLyvZT1JkfjazEtbK8xW
 GU5LQhzU2v2e5rd5URmFagjvseJ9F3Vu9YOQt0oUToPJLKIKbae9Zmm8xSGnxGETm0zy
 wWWtk3UNvASJIyXMRgs6J8qXeGTRsXlteFe2ogh+gZ8eMu5JgTLOlDA74LBEVbc0x4fu bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bmq3be3tj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 10:00:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19C9p6GV092618;
        Tue, 12 Oct 2021 10:00:43 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2172.outbound.protection.outlook.com [104.47.73.172])
        by userp3020.oracle.com with ESMTP id 3bkyv9v7dc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 10:00:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXyj2NuIp7f9+9tZubEoarUDer4Ad2hzT4JCtkB3oYhupM2+mKEEAL1uO2Ru3VY8iaugliCHBkYEpFPlS76VOTIya4tZJbyI1hf3t3gp/1MQBj1OT8L12vI9rrMCwY8h6aseZZ21JQs1ahyE1LERoosp7ARm29WRm3j8OcAtHXRIMD9RnAgWII0bx9ltnctVMIt5A8TOnX3LNbOa4Ddf9JXuuP0TDAVystMP/MSX9oyRha19Nh1vXspna1WbKLeOyRKvBkaH9wJWRRc6cR8eOXt1B71TKPMdofsgOpAT2rWgpSkwqZXuCLHKVlitYik3mdQJFt2ad00t+RvNSvCTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxmO2w/7NAQ5i8EleTkuRGXXpfSHLtG+0pFQAPoDT64=;
 b=MJjrcSGueYcEmypc0YRrFak4XOj9ukXcPYmvKBxmLdLf9bUzcjFIXgLFRMEl56QWS7QgPr+wRK6kAYvzWhm7cyzGQt0ObzL5bMdt6ajjecdnQpj4+7qQyMlw02W+kJ/izqVopiQk5V3aW2Olvbjwg6wL+w/bh4wM3tNepxzPn0o1gUmeM1mAkKqkklfAWsZfCfqVoHMssmTnzahPAIHj70Q4gJFZKrvFnW3dT+IU7gIIYq2jEJ5CcVYzFv2rekByop0DQmA1YYDl2CvwaxeevyQU+3rjWkoWybGIc1cdK5Z1zlTbOmmJhigYtv0XuYkxNdghh4TN+y4HMNNDxfJxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxmO2w/7NAQ5i8EleTkuRGXXpfSHLtG+0pFQAPoDT64=;
 b=ovZNbIV4hU590aHhg+5P2lZlaII+Vh/wOwOLpEuJe65cNgsVxR+FdTXT3zBab5uXjrS9OLxYGC/FO0rFEaJyw75SNyb0kA9KJuNodUm8PszRMiyfK2O/NPDQIMTvfu4Gecraq7JlDmNntGVgo1oENSDutCI/8GdwEu4VxnFlHXA=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2367.namprd10.prod.outlook.com
 (2603:10b6:301:30::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 10:00:41 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:00:41 +0000
Date:   Tue, 12 Oct 2021 13:00:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     akhilpo@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm/a6xx: Fix llcc configuration for a660 gpu
Message-ID: <20211012100029.GA3379@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM0PR03CA0043.eurprd03.prod.outlook.com (2603:10a6:208::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (2a02:6900:8208:1848::11d1) by AM0PR03CA0043.eurprd03.prod.outlook.com (2603:10a6:208::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 10:00:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d010cfd0-fae1-44d8-e2c6-08d98d672631
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2367:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23677407C3AE18C96C300C0B8EB69@MWHPR1001MB2367.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4B+1UapUWIBcvP8pmbVZFwECsTeIbNqf4pcqk8ULY8sxeFSvTPlOAyVDNASSANDGpgwYrEilCu6UOanDAaTfMleLIDF5Uhin1sdskapUyFpXvQQqgETOERd5Lj8q/XWReEhcSr/5M2CcD88sqEjf3JtxR1bC9k/Oi4nK2c5vQdFUnNDR11Fd1S9jJIWJ0h56GAq6z5pcL7TFuM8Pw3bYEzG2KQPh8UKW75er3IfC8dTqHMl/qWA1M4dkXQM3FzlQfSSowW0tDQE90DQXm9QHLWEMnKYdZMc3VJ7zZhkGKByg9t2eryH0Smjn6R/AR96dQt50fiMCoPEgyX8w8R4AFAvbT8yFgjjMlC5He+1HgvzaqsPcb8KGqeSiLXY4ivBGxOKCCTQYDNvOTjvJ4fd1TBcfaoGgze9QaH0JqeAdxrSAYeNwyhgQe2uSTT3sJJuN2dnd5Fcb97qh784iY11Z24LZcAqy3EcTGGnDd0TUwzwfU1BxXcHefKye/5nI/DNz4Du3CvpLVcqvLRAvdVVMaLE59L2qCCMFs+likli1l9m+T0RHU5iEsEUIr9olEq5YLCuCobszlPIkHiBSWCHvu8Sz+pRERTHY7KkRfb14FhNpBRtdCzKY0uyav0idTTf1tr8N60xRfUvxOLmYkKmVLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33656002)(86362001)(44832011)(186003)(1076003)(8676002)(508600001)(8936002)(2906002)(33716001)(5660300002)(316002)(9686003)(4326008)(55016002)(6916009)(38100700002)(66556008)(66476007)(9576002)(6496006)(52116002)(6666004)(83380400001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cHJPifw7hSvhl7398q7do1EciwQodLfDjJSV3IrN7EpzAvj/g5IAByJEbt5+?=
 =?us-ascii?Q?seOvqxzZxto45prvfAASOKfiakpMMAJTcA0DpFb1wBw4k3ry/zX98ffdtux8?=
 =?us-ascii?Q?4hF68EI47REmr4Td3K8NkXSAAAOl/7HISJ+9VKe+716Ao4nQ/rSN3IfwGG9z?=
 =?us-ascii?Q?cRhP25NrMP8BZy8F51jH0asM6pvYkamQVplEKEwGyi7qqi5hvDZTSL09WyPJ?=
 =?us-ascii?Q?GmpVHNDZvptdKRgIlW/OKxLZoaGQDojnyHqs/gmMn3GminvYNd1wSZWQqGyu?=
 =?us-ascii?Q?XGhIvdwPunXoCX88D3j02bpHgJZcD8tK4J0InsViaozck88BZCjVBDn2OSNy?=
 =?us-ascii?Q?zuboNNeFWv8o1ocp9AiNnMTr3Dh7hqIiWI5XI7TuAMRQPlp4dmc31RQBshYS?=
 =?us-ascii?Q?SshirnCsxnpqGy5R8pvX9xt5Bb5I7t4rf9qK9gPrxZGTV8xC/oMPQFNjuxQV?=
 =?us-ascii?Q?uvqDY/AfH8dcCl2zUcLN8itUaRg/57eNlUwZfKgUhtimXiGVT+yJbN7JVY2L?=
 =?us-ascii?Q?4MbjPzRvF5OxSIW8OLE0gOD8OB7Y5xVxkuojpA4lDsK165nyvmvp0aGvD6DN?=
 =?us-ascii?Q?Vy733bU+VpobNucSeC/hqYxTPyoG5cqQQYGjVvJv00U/vRBm4L9tIvXMv4Be?=
 =?us-ascii?Q?wngzvhtGsXs4kdId7nP7ZavIa62sHKBPrg6ibGa3f48LX3KSBbI9OKd/5/bi?=
 =?us-ascii?Q?md5qvXXrxH19TZTqQTJyVpSFK1z2ZqWukFZ5YXc4rH794pu91Dko2GulkXZA?=
 =?us-ascii?Q?dKJ5PG4rtpHriXvNml3EUr1UgTn6T8/71UJNAciXgVOVaQ4p0QYRb0nYjHLF?=
 =?us-ascii?Q?MEO+8L3iS3/y/2YG8CJPSHNb/uifi5GYSTnFp1oOLGVLmXUTnC2Krmn4CVMz?=
 =?us-ascii?Q?Kpu22sz5DNIM5khz3Mf5A+ztVz2Ib032bJX+ttj0L4Xq3HkEHSEkEGJVbeGf?=
 =?us-ascii?Q?0ANilSoaXxFpuUpB+TZVjeM7wBuu/HgfR8k0wjjRkngPk8+cCrmx9h510LTC?=
 =?us-ascii?Q?869MjnQ6xBLAys/KpuP4/V+6wvZFsU6vl1Kxs9DyYja2UJsgJH/7Una8sRXz?=
 =?us-ascii?Q?lhQijq7qIk0Uwe7PGAvgPcfpHjSuguzQ1+JyQzQhpsPLIBMMZ1QdVJBiwFbL?=
 =?us-ascii?Q?q6Z51UwkOXda7KLmMlrYpD+h97+p2kzzPYwgcEGfHYrvflu2qFEI/6Ay8fwF?=
 =?us-ascii?Q?Km4baoX63xVwKT5GtsCMBCaD+1WK67xDOEyuZ41GSrTYGbu49WoJvAQMcvyU?=
 =?us-ascii?Q?a5FCB3nirbYuMCtVrdzEbqbd5q1Q6cI97NbQYcbBg9zYWUTbq7YPFODXcusF?=
 =?us-ascii?Q?C903tlx15+tdbgleo2joggkr++XOkrD+xsyHv4i/6g6rdsvvA7pfcPnerUZc?=
 =?us-ascii?Q?MK3V+JU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d010cfd0-fae1-44d8-e2c6-08d98d672631
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:00:41.3156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3jYgmd9xDM4/Ot2jYDP6rWuxemCWzBLl8wbwI5nDOSxfwsrmYpX6T1da9H8bO2pLnScDmnCjfc33EPZ/4ibnZi49TesRkoXZWTizluTT4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2367
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120056
X-Proofpoint-GUID: tmkKad1nw5nQbEBTSuA7W0zf-Lryx-bo
X-Proofpoint-ORIG-GUID: tmkKad1nw5nQbEBTSuA7W0zf-Lryx-bo
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Akhil P Oommen,

The patch a6f24383f6c0: "drm/msm/a6xx: Fix llcc configuration for
a660 gpu" from Jul 30, 2021, leads to the following Smatch static
checker warning:

	drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1480 a6xx_llc_activate()
	error: uninitialized symbol 'gpu_scid'.

drivers/gpu/drm/msm/adreno/a6xx_gpu.c
    1423 static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
    1424 {
    1425         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
    1426         struct msm_gpu *gpu = &adreno_gpu->base;
    1427         u32 gpu_scid, cntl1_regval = 0;
    1428 
    1429         if (IS_ERR(a6xx_gpu->llc_mmio))
    1430                 return;
    1431 
    1432         if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
    1433                 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
    1434 
    1435                 gpu_scid &= 0x1f;
    1436                 cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) | (gpu_scid << 10) |
    1437                                (gpu_scid << 15) | (gpu_scid << 20);
    1438         }

gpu_scid not initialized on the else path.

    1439 
    1440         /*
    1441          * For targets with a MMU500, activate the slice but don't program the
    1442          * register.  The XBL will take care of that.
    1443          */
    1444         if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
    1445                 if (!a6xx_gpu->have_mmu500) {
    1446                         u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
    1447 
    1448                         gpuhtw_scid &= 0x1f;
    1449                         cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
    1450                 }
    1451         }
    1452 
    1453         if (!cntl1_regval)
    1454                 return;
    1455 
    1456         /*
    1457          * Program the slice IDs for the various GPU blocks and GPU MMU
    1458          * pagetables
    1459          */
    1460         if (!a6xx_gpu->have_mmu500) {
    1461                 a6xx_llc_write(a6xx_gpu,
    1462                         REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
    1463 
    1464                 /*
    1465                  * Program cacheability overrides to not allocate cache
    1466                  * lines on a write miss
    1467                  */
    1468                 a6xx_llc_rmw(a6xx_gpu,
    1469                         REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
    1470                 return;
    1471         }
    1472 
    1473         gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0), cntl1_regval);
    1474 
    1475         /* On A660, the SCID programming for UCHE traffic is done in
    1476          * A6XX_GBIF_SCACHE_CNTL0[14:10]
    1477          */
    1478         if (adreno_is_a660_family(adreno_gpu))
    1479                 gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
--> 1480                         (1 << 8), (gpu_scid << 10) | (1 << 8));
                                            ^^^^^^^^^^^^^^
Used here.

    1481 }

regards,
dan carpenter
