Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE645F1B4F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 11:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiJAJaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 05:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiJAJaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 05:30:05 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901ACDFA7;
        Sat,  1 Oct 2022 02:30:03 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2911XEJQ003935;
        Sat, 1 Oct 2022 09:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2022-7-12;
 bh=P+vfVwTSGxiuZ00aOe7o/lokxb66Bu+4EDuH2cwy9CI=;
 b=i8+WSjyvw826HAkAxrTHwUyXHyOEoKswpRUKtF97wcBW3h/b31c9kSUq/g4BpddKdAb5
 euPWG/I5Q33tDX5DTcr8vvYjKTvCzJSXbWyAmsrZp9wSZhZ7tII1gtRoav4MALH2bB8K
 dr2An8u5zSmq17JUcikUPDdM9z9SBJyvwtMpiy5pV1AANX/SkJjEcytYmAXefy8X6DGy
 ctWSs+uJu6LUQvGZKWOQvL6njGl+fsvLe2IZgDYgeGczIr/XzyQVqVEbptTvsNWLP2fc
 1tyv7UmF07yPBxFqeJCjo8hBKExeTLKJeCBFHPmCzXZSMxAUJxknSTjUhWxegKWUBzZC Rg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxbyn0g42-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 01 Oct 2022 09:29:45 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2918NIN8039513;
        Sat, 1 Oct 2022 09:29:44 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3jxc01dunn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 01 Oct 2022 09:29:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5Ym67StFj8pehZ1oqoAlnhhkePBBCPDoZJxM63Ob6TDW/3rEwnukm+YPEzY7IMuITj0nUKc8ALMHJ1+0qqgkEv2g+bPeHMyzFGrh44R7iybaAim/HMhMWjZHrvynZzrWa4k1GXpTblBEvHvR3RlGnTBAbMURKI+Q6x1Lj7Eam/GcxjIPpLAVJeEx2gJgJvh5uc7X+04A5iuVjwsBbaSK4mMfvcUMjr3GD8NVRsWOXQX7IZ/oMAWADbGL18E+r63waCcDpFitzHnI6b80VqoiT6PWf99gk88ty0hUotUVP8EEfH7CGF5I1baTSmZ9lWho7HcBwIlsfQSvWLXSUZoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+vfVwTSGxiuZ00aOe7o/lokxb66Bu+4EDuH2cwy9CI=;
 b=TPu3dF/kCVoetXdXOc9LLIQlGSXt+FaEQVor/vpNr7kglTmbYC10hcCseB2yNCu9Iad2LdCS8JBAWSGbOhBxqv60Vpw5Rs4L/aI3gOiIpZJbpdw4RT3VUiGn6Y6DIWwv8IFS4/GYiaOVQZO3vE6hV2QL7SxDqz/wOpLqDjzwZVeNiTmkCC6sZIa16eN0gViug80loC6oppON2it1gi8ExHldfve3QtuOXYImS6OuTzc2FjU1juNCYOEA/YVZEqvmm6Usvq6ROE/ViZmL2jMjneGhAe3f2jMF32Eoy/qIgz3mFUJZnZudQqFbKOThg2Ld8bBHu2OW1oZjXOFykb1fPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+vfVwTSGxiuZ00aOe7o/lokxb66Bu+4EDuH2cwy9CI=;
 b=r5N1vibuwc0z4Sxa0+eSWpEEWkBTwlzOJym+A5bRjO5dlAwXz8UudVmbT3zTZCms3NH0h6nuXZNg/PuhfNTXCWsYfiChrNydiO5xt3MqUGRt3MNqqO61R9nQCgSDXMSCsRsMD7KqYDzGcLnwxxZSVgDsGDZT/wbFpMfjsHkOZ7U=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SA2PR10MB4409.namprd10.prod.outlook.com (2603:10b6:806:11a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Sat, 1 Oct
 2022 09:29:42 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::a497:8929:2c6f:7351]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::a497:8929:2c6f:7351%6]) with mapi id 15.20.5676.023; Sat, 1 Oct 2022
 09:29:41 +0000
To:     Shang XiaoJing <shangxiaojing@huawei.com>
Cc:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <jejb@linux.ibm.com>,
        <martin.petersen@oracle.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH -next] scsi: ufs: Remove redundant dev_err call
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq18rlzlwna.fsf@ca-mkp.ca.oracle.com>
References: <20220923101217.18345-1-shangxiaojing@huawei.com>
Date:   Sat, 01 Oct 2022 05:29:39 -0400
In-Reply-To: <20220923101217.18345-1-shangxiaojing@huawei.com> (Shang
        XiaoJing's message of "Fri, 23 Sep 2022 18:12:17 +0800")
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0162.namprd02.prod.outlook.com
 (2603:10b6:5:332::29) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|SA2PR10MB4409:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6ee1bb-86c6-4d9b-30d4-08daa38f7811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AP8xpQ+aTvVSF2vzOPwviokRbc7hpjeCaGWSQgU2unoy+CiZ47QX7FdOL5ok2Lma8PxL/aN997UQe919HNY3zSczjsqF6jwX9SqLrzZQJvy17Ls2HbgdFUrnyJv186D9KR794LDGzNYR5LjEQEcwkOSPHNhBK9cB1cKR6Eyr0J1UHAwd3MGZDw6D1Mdw4gFQfiF9/kPYIMZdXPD97HjCpkOjUEjB7YZXQuvT2NLZHBetFuAi3sZ0zQHCycuWNmGQx5/t0BZs1ciYWS5uWUyWlCo9EsDwlVU8iaZgLJOsa9T76gIOsWJUdaoH1ZLbqFZtJxrFAhqnh2PzBnco6gKPg479cQOy6A+a+AksEz3vau7Ju32pdd143TXVm0jw3FKDi2EFLpKMqonWEN6d5TJP3soxdOCvtUEB8m3lwaS4nZJUI2d9dDX2hpHpN+/N8BtxF9dp9++/syQOM44zvw2ZY0lFdFfuj8zau+xYa336LYvPcSxO+FFCPmJBYadewnTTTqyRGi0L+8Vu4zT5n6FwtE0wn5u4mFEhovzkjzw1SxkdDEm74n7FM/3xfqh+rAYOIQDOx4oUzwiUSAMkZlot0kYrmTL0fAEOgrUnU/KJN/fxY2HG3zR5tXs0kAIqA9HxRcm/99X8mPjjap98fZPs2S+vUmJBSArivE0BZO5nq+q26wm0kEtQ2PUaD/fdxstPHKPLKT1nAku+0wZfHZQ71Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199015)(8676002)(316002)(478600001)(6916009)(2906002)(4326008)(6486002)(54906003)(86362001)(41300700001)(38100700002)(6506007)(36916002)(8936002)(5660300002)(6512007)(26005)(186003)(66476007)(66946007)(66556008)(83380400001)(558084003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9G1lNUxtXtvYaJQpyH6HmgRbP/pcYn4NbsApjcohETKxNT+8Ima26ZaG03Gu?=
 =?us-ascii?Q?8L40bWRh4btlCQlxZbHgGvMerUYNzf71dXsWpv9xptYYDu2FEektX2rux/I3?=
 =?us-ascii?Q?9NlAXkl/OMYIxkwTq/AT2a2mn6oXlfDiR3+JjRsx3gxciD2BQ8Qc0/e2h+Fp?=
 =?us-ascii?Q?ED1sDhmi5EF5g+htx//eON/pYnVqvydl1Q9f9PVRb8n70EPw2OkGDwx4FqYz?=
 =?us-ascii?Q?ed/EV+IiDumLYjocJs/H82Tz/DV7B3/pYATruEsanN0LBDL3yUCtmE9GwrlL?=
 =?us-ascii?Q?t5O8ajmQEYB/yd8GLtY57B7vzWtyeJqqNPya8+20ba1klCPQx0EgnoOGjfXa?=
 =?us-ascii?Q?S4eRB9QZ/MaNVtYUNAgHcyMXTmL/hUDG/733LDPHT5LcDxEGKNudaPuClapP?=
 =?us-ascii?Q?b4gLD+9EVsBhe2ha5E2tn9XlqjWC43FQTZ8GGZndYMutBmE2ioTi+jf+k9H/?=
 =?us-ascii?Q?UPV8xMjn6nkMiYOB5y6SHce/UcD8VmhL6SQ49kkAs9Xmz31357J6oUxVD3a/?=
 =?us-ascii?Q?hpObrf9RXFzWmPGF6xYotlrZNQNTY33JN6SVc7EOVOC5F4wBPN8sJuFjFPGb?=
 =?us-ascii?Q?oQB+05JhUzgTtGsd7X1np6PV7Vr0owKQw0YUdIysOJd4woAWBoR5NDLh0W3Z?=
 =?us-ascii?Q?gWiG+58c6qeGr7TcsAD/q6FymxWTlk/p3XWGrUeF+CO1UC7tTv0GiO0JozZ5?=
 =?us-ascii?Q?gBz+dP6FWMXHZGC0wBB/+cXZx9vlQobn/8MJmqftZlTL1sebvd/6CepcGLjq?=
 =?us-ascii?Q?UDyIyH5e0J8ZqigLORVxYH1v/WdtPqfJFEauIj9hPiVLZcboyyKHzN50acLr?=
 =?us-ascii?Q?s9IfxdONfIJE68/myT/V9HuTPN/TlqKcC/K1rorWxCv04zqCePgNAFYU07iG?=
 =?us-ascii?Q?/bZybznBk64PtyWsmcjnWRAP7GymQS/HVIo99MfegzUFxumOU6ys7Zs7bGcg?=
 =?us-ascii?Q?lkWotq8hSzZpsO0NuQfR7hfJIto83f5KwOv0YWufGid0fl4dsE20JsNrFU7N?=
 =?us-ascii?Q?W2D49t5dAnAh8t3nVNxnhf7mccMmBh7EHlsOzJmP1f2oTYjobl3UmtMwtyhk?=
 =?us-ascii?Q?D0LLcLF78nQV161KORxLePN0Ng4crqPSy/vNlNwnEO5neJTNwSRH0q+R5LMj?=
 =?us-ascii?Q?6jxe7+5IPNBC4qCBCNOKdkVbLiuA32WAtkAtg+MGxhQR4UYY3t3ptOyrlm5e?=
 =?us-ascii?Q?R4p6l/U/EvG9Ml5m1jOpeoOydyA039NowwiBfYjdMKD7FnVmGCwighudGnlF?=
 =?us-ascii?Q?KODI/4xQTU6fkNPv7Rv3EutLKZifmdmx8RMTYOkEm+MxWNY5yiFbjWFnee/g?=
 =?us-ascii?Q?efFThcQLJmDA0uZA9YlS+A0SJb2YGS1z3tZQ03iDGrGh845iPKyPknsTafal?=
 =?us-ascii?Q?vJFZ5XBWjFWTsU7bbmlG23C05K+Fx4xiOTrCFmD2ZB/bQwlzxWZ2v+7P7k6q?=
 =?us-ascii?Q?Ei8ZdZC4BbXSadJ6DOYj8GfLdfl/6HhkBtevrXYcH0QweuhzGTBrDwJOoKlT?=
 =?us-ascii?Q?sF/9HiiZxMPja8x5kEmay08wM+3JcJgm83J0SzcL5hT+RpBIlU56qI4+CjhM?=
 =?us-ascii?Q?a1sDlQOvEj7p+WB5yrid1bM5qfrlRmhmz0yuS9Bd47TQF5MyT+nGCB3Uay4Z?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6ee1bb-86c6-4d9b-30d4-08daa38f7811
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2022 09:29:41.7483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P09GkIB9vNuKN5ipJ5ViRtS9ZieR5wZlV242Mn7uliKvNPA6HRdxqB6RO/BVKix8ClE5UIoMhZeIfSCKEqCSDxjBfilyNAbDOkuq9Ij4Ogo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4409
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-01_06,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=923 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210010059
X-Proofpoint-GUID: f46nnp-65LCVajJi9X-P2vGXljVyGeVp
X-Proofpoint-ORIG-GUID: f46nnp-65LCVajJi9X-P2vGXljVyGeVp
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Shang,

> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.

Applied to 6.1/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
