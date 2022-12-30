Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A4C659CBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 23:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbiL3WZ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 17:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiL3WZ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 17:25:57 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A743E2672;
        Fri, 30 Dec 2022 14:25:55 -0800 (PST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BUFwwgq017240;
        Fri, 30 Dec 2022 22:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2022-7-12;
 bh=AAoJ6/QCcVJPZiaM76HjKpmKeQIAve+t+0GzO3HMmgk=;
 b=2uJCR8yxUQ8DT/YS6CMV8wMkZFelSE8A8ue3dQ2eMKs+y5dxTgVkpLn32e+JquaJm+hW
 Kg9SNtlKWLFfKM+xMVNSmZPEt5c73L0KWJp4HEroz9FD2ZbijGuq8czD/QUTqhpL2msf
 O14aw/n68hj4l57JkDiPIzlH+E4yaiqMAxv4Wwx+r+rVOQn4sEUuWIjzKAyjiFBnlAhE
 xRLvvqo+W2qunNohPp4U7br2UGu4A1AfMps8ppoH68WyQhURLSvOUCduKHvHWPc/oO+K
 TGrWQy06Irmu+IyorzUpfcu1o5CVZZzLk/EM++fE036p+nVe2oOiA5p34QTFQ2RUjNgz GA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mnsfcgpsu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Dec 2022 22:25:41 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2BUHm6ZJ001287;
        Fri, 30 Dec 2022 22:25:40 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3mnqv89g2k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Dec 2022 22:25:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hobw7723So69PRqfJKWfolps5XOeZ38Q7gniRtT86xe/WSVYC0m04KR5nlu4Pp2rxuBQcfJ1xR+RheLmAfZvBozdXZkSDA3FhwgLKnp6fjywD6mfveF1fCphDpjbi2k7LUgKbNc3dwHWaanS3P7Nd0KiJy0YNhhY0HJBA+I05cNFTonu6Ac5Uox2AK9QWmIuMJprVtqTrWuwaPTPVFqgrAyZBvo/66sME1/WqnVco2dRh/eTGwMqZthKTPP37Qht5fQBXefo2Y21gEniA0hIx7AA907ve1BaoFnElGBAP1wFoWZsKB02w51fwIta8eLF6N4GJNQMcRVsjs0FyX5sew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAoJ6/QCcVJPZiaM76HjKpmKeQIAve+t+0GzO3HMmgk=;
 b=aIq2RRcsnWm2yiGh58ooh3FqWn0ZKfIsF+VixGu4SKLj+vPUUWQcVKvD/05U4gmxMMOopl9MMSmLkAO1UdDC+Sp93l5zJthK0lHyS9josJAUvCdYcnT9Tta8V19IYR4Bd01PrF1adxEV8BYIvV2PzipfX1SUm0Wo2A7lelwz/rbURIiMhH/QQNxu9Q9nZfMqUzgZzaex620hqhfL2P87asAntOkdYcuQkEVd1+WFAwozxrl5mWVAxfEjdX3yAFMAnrrIQUaoZg1uQgyHXtm/KMFp7Cy048D/Y7N36RsVo3VGew4j1bYMGe3PxGvgcgjOCR2xQSC0G5Q6ByegQka8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAoJ6/QCcVJPZiaM76HjKpmKeQIAve+t+0GzO3HMmgk=;
 b=fVuIwoQWqi2i/oVrcTHOTCDDXyDLiMzzTuUEhEmgYhC478dTzz0lBTmGfegoz2dKQQwoK/8SVvRsYfbhzyczBcc7wfQnozr2CacAXlwOfAx36shmXgIzQ6JDJtx4p2SGa04KXen3UiSeq59Zm39aXjE1bzSsLKoGyfvWm7AZbJs=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by MW4PR10MB6417.namprd10.prod.outlook.com (2603:10b6:303:1e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 22:25:38 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::25bc:7f6f:954:ca22]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::25bc:7f6f:954:ca22%2]) with mapi id 15.20.5944.018; Fri, 30 Dec 2022
 22:25:38 +0000
To:     Asutosh Das <quic_asutoshd@quicinc.com>
Cc:     <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <stanley.chu@mediatek.com>,
        <eddie.huang@mediatek.com>, <daejun7.park@samsung.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <mani@kernel.org>,
        <beanhuo@micron.com>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v11 00/16] Add Multi Circular Queue Support
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1mt744jj7.fsf@ca-mkp.ca.oracle.com>
References: <cover.1670541363.git.quic_asutoshd@quicinc.com>
Date:   Fri, 30 Dec 2022 17:25:35 -0500
In-Reply-To: <cover.1670541363.git.quic_asutoshd@quicinc.com> (Asutosh Das's
        message of "Thu, 8 Dec 2022 15:18:26 -0800")
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0145.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::30) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|MW4PR10MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 749aa2f8-39b3-480b-7ef4-08daeab4c6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v2J3oT4+DR6pYmLQoMDDnLSDuokdko3MP5pDTCAD7IS67XeuGIO3kJ5C+UoUDR2/VM6RqkBJcQmFqMqBzHZpAp8nEmvtbJcpGdIWctXkz8njyBZvoxCrzQM90Lm5pNoHyGta6eCuqOx0wLIonwzxK0Mj1r4W+ostLW/kidn9/L6Y85U9oiat1TORROF6ubmczblhBr7NEtLsex2QiI9ziw6Z1A3DPCxuMhZNicFHjJ51yL9Y+449SGmvidq58GJZIkQZ1OnLkBx/A7/14ExYZ9LMJ3IUzb4Vxcowz4NvoxsVTDs7q4IwHAPBXmmpKQdYDZzfrSZ2zD8C0cgNywmdyCxLwHB/CVhq6E9qNojDrZ9Il5SkAZGnoFWTmKeW02yNyPanNLUMCglhsEEdIDhkKIIzbFBSf0QXAJUBmBKvmdS+CyrqrUG42UwJRYd6YACNUXisPbCllh4h5hcRNKQd95RqzxOMWg4jpEaAgjnvx6DjbtL0DVkQPJMZPI9KQ8QyDXuVBU0XeExqflVW4eXUPgUuCcXAnwjkgsqqLDtmckNbigKo7MC85OqixLz1T81p7uAR0WLJGI/NntHIpHFjf8Z5keiiDODReuRmrdHcnC0xjwxFzAtX/dklvPj1RSoCYvTytbzdw4N7XA2nBV+wAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199015)(2906002)(8936002)(5660300002)(38100700002)(41300700001)(7416002)(66946007)(86362001)(4744005)(83380400001)(316002)(54906003)(6916009)(36916002)(66556008)(66476007)(478600001)(6506007)(4326008)(6512007)(186003)(26005)(8676002)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?22/F9JJacvDADcqUIAx0JWQKDuOOZjoW3ijSakCOMMdHN2EVLSpHHuRvSgOl?=
 =?us-ascii?Q?MWGqnS4PjFrWyJUsGufoy19i+if3LuAJi+L1c4B+sRq9xpD4eGe8V6tt7PXA?=
 =?us-ascii?Q?nVcT5XZAGdgEqckJ9GVxGpkPWAo2psFbgLrEvdD8aV+z3VYp/7WP5qSvX8e7?=
 =?us-ascii?Q?jgQCjOx8Q2gT3w7Bm19lJHaPV90a9cnNulPk675EFQRx5gmOUJE64QmokSI5?=
 =?us-ascii?Q?KvkeiQRQD+U2kfuE4lSps6icpPiP35NDwGARU0Mwdl9aMSiMkqsDRUE5fR0J?=
 =?us-ascii?Q?Km7ZFhuXaQr/4iCeVkbHldKWVZTXZyFN7D9ak1WC09ynsyxULvbC5tRLnoul?=
 =?us-ascii?Q?3YmqZSfl1EiSEifkPoBSJ6YCIeMlTKM33KJhGK4QCqpdYWIJBBs/v6jKKGCN?=
 =?us-ascii?Q?uNVDnUGO4Z56O5aRLtCmEhXdt9r6jXZghTlBY0rv5NNK6tg4X7PFBGqZGyck?=
 =?us-ascii?Q?568OUvLLCT3ImA4kSGYyMIWy992rpZQenwOlKmAwADz5kzTDXjVrcg2zjm6k?=
 =?us-ascii?Q?B75gsq5zAvB3CCl2bXc3DtzNTwZSpFO9IkIhQ90DC+ZAmlNu5jsdQ25gO0qJ?=
 =?us-ascii?Q?n381jZISg6NWvVxUBwc8E2lt1BmXPwPzxDuBXbzFaXAWhHfIHBKzzunyjdEZ?=
 =?us-ascii?Q?geAPcbJ7OcXLv4priE01DRQ7/t76PfoN9qHH666+wa9k1ugc9/tAHUXfXrX9?=
 =?us-ascii?Q?wVGzPYzM+WUeroqc3FL+2Eoma/tDOUoXOcc/wmGeBbtOzprhV8kbcpYtnpAl?=
 =?us-ascii?Q?VZNWl63qeVP+SzFpz8pS53alslVZKqsHxq3lFPSq3cZO6PniXQfkSUGVZnYO?=
 =?us-ascii?Q?35WOzKYpWb1/2QmMd/FWo41rgClBfhl87OnseVsdVUmB+kV0AT684H/ufkNk?=
 =?us-ascii?Q?+1FFnM8utJQOj7hVoUIgXb+yHMV65oquL8Z/h1wAllQ6xYd28UWGRHEHb95z?=
 =?us-ascii?Q?f1uOEW0GeYU1A/iNcVkVUTESEQZsOORrwazdK2WEya7V/ZyAIB4NUjsKtUAA?=
 =?us-ascii?Q?o0x9KIx97GrOZCGJQfXc0f2V5G+PAPvPgn52vi+JpreAbSMjbbz34F0gU3iq?=
 =?us-ascii?Q?SeRxIqdMIwadg+ZIOhmd0xZfmDL9gQTAFAU4PMt8xJk9vD26cw+S4ueR7Anp?=
 =?us-ascii?Q?wUr3nP0ZA+jbe6Ar+P106J5E4z7YtPAmO/dvzdUIUczVrXYUESi6c+87kuTr?=
 =?us-ascii?Q?idEF/YlTzKZ1Kd3qWsCOjWq5C2b4VPCQW/qn2rDhGbdthf09JoEz4F3m7tdO?=
 =?us-ascii?Q?jrBLewbQ4dAy3VXt6mBNjmWr/ZD29ZbiIK5go9+T0YHOXyNs/3Uuu/4n3sN7?=
 =?us-ascii?Q?IMMV2zYlb8oqiiwboRfPLHDp0lN5NBOjOTK1KWnhrdCfijRbp94bl6mxZy4V?=
 =?us-ascii?Q?weDKWhE1QNjjMZOBEa8RRGneZLlySRGZrdFqD3Ky64MBfSEXNCn/mWp2dTXE?=
 =?us-ascii?Q?9gL//DeRZ4gVoyHuiTBvArD+sm6q2C57ScBPS/rVs/GNuknZ1spD8UCNpTdQ?=
 =?us-ascii?Q?xe+oPAUH8zjm+AMzpRCRq/UWG22EvCbNtU+kINKcNLQD1rpashvBYlyqCvk4?=
 =?us-ascii?Q?QyqUUVbGf1WlgtZFlsnzQSLSuYQ3hlqsAIIzof7Ol4bWQJm512QhJ4xWqPWE?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749aa2f8-39b3-480b-7ef4-08daeab4c6f2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 22:25:38.0858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2mSBouqLv0nzgr/up0iLUMNz7u9mJtQeB5ZHNrEbUA0v1+J1v7iISRyGjGiAYGwX1v+UFFXQH+zU4FirkGThAdyUrDFpLkN4oelOQwIwZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6417
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-30_15,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=740 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212300199
X-Proofpoint-GUID: 0eduj_rW-nR8-5utdQpXKWiRIye3CTZ0
X-Proofpoint-ORIG-GUID: 0eduj_rW-nR8-5utdQpXKWiRIye3CTZ0
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Asutosh,

> This patch series is an implementation of UFS Multi-Circular Queue.
> Please consider this series for next merge window.  This
> implementation has been verified on a Qualcomm & MediaTek platform.

I'll push my 6.3 staging tree shortly. Please rebase, there are a bunch
of conflicts.

-- 
Martin K. Petersen	Oracle Linux Engineering
