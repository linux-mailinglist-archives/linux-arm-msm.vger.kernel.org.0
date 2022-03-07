Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 402E24D0134
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Mar 2022 15:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbiCGO3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Mar 2022 09:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbiCGO3l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Mar 2022 09:29:41 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED5F24BCB;
        Mon,  7 Mar 2022 06:28:46 -0800 (PST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227BsdNR006681;
        Mon, 7 Mar 2022 14:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=3N/ysm/eelVNygFAwBZjg3xyMnN/26JMlDaezFQI8sY=;
 b=qPSdzH6Ljn6hz5NBO37MjPKybacV0OcBgf2swd/DRpWxGu+SurpY+KNdPjBixSqmlcJB
 vR16Us/NCtitCWaxQyuzcB5QN19OmynkrfzGc5x/OsvdRy7lRdIMzvhXZsUdAvTbElua
 9Y1APLxLgUadU/aa8x3Z7KLBaNi21JBz1RGNZTfI5MWmccg4rIKJnCWqsDBvDZvdc4YM
 A7viTIorl2nf8Y0s7AS3pS6fD9X7xN0rCdV5pF3RzphDz8Ebfv6OmcBkNcRLCvpg+Ug8
 fV6aCZwR9Wx0HE4vDwlFWoCYLkti5aGYOJEaBEj3kT48LK1se00c3McpoeP8thO9NlnB +g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2by58-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 14:28:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227EFFbF015010;
        Mon, 7 Mar 2022 14:28:37 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
        by userp3020.oracle.com with ESMTP id 3em1aj1pe7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 14:28:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPbGf9NMste1dAHZPrSnh3R8N1+Q7DBAqgp3N8kgDOOhyPYtCz19HKNyBAIVo+iZTSZMKgAS0ug+p4NY4d5AQwDKAkgjBAVnVaI/zS5WeoNj/Wu7gUgU42mjAWVuUVZcK6MCus5LuJIKmSuHbeapKKxC22vn+oRn9aPJo+vy1Uc67J1Fsd5Zd/e7ph44y8xCzqPDZSPBe8e2bxDHgi31BarFgPzQAwQ7jzfHDKWSMMv8cxWix0kwLAEpyCriVU+hKyGyoHbTH2klto1kzCS4HXbY8cZJIENuUFNLTB00zyACxfA2qdm8tUIJQI7h/mIzTpx3iVTg4DEct//ffh2u0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3N/ysm/eelVNygFAwBZjg3xyMnN/26JMlDaezFQI8sY=;
 b=Y/osRAM/9gv/X72omgYZyE9h4w8w93zCP5vthtNWtPvqThB2DPkrZmncVXVI9y6KT5AGvy5JoqpOZMaQjt8N9u9ZHjIbr6dXa8To5I7W+S8O4n67KnfHEk1oRRPBTaE/x16El/Dzii353GU5pP8qR/hqA1iNn2yGo1fI6Y20OGReJUq0u2IgCEVLsOOL/COYCqiG8T/gZuvcL+L6YPVpDu9281d6eKuulQlITPiTeRMvaD5vkcjHm7jDMi411IKUTQWfam/S5tZSknzfS8ZpRkP9Zoqc2SwCRrLe5PKzWhUhw4/HX7pnjUpqSgzZWtPKPva13z974EsUhGx+fa7JPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3N/ysm/eelVNygFAwBZjg3xyMnN/26JMlDaezFQI8sY=;
 b=YznBeO2KkEAZ0WY6eYXv30GW8mCvGxe84O5K/ekcD1sYabOcm69Fg4KPY2bRRqQvVbtk6wDE9hckck6i7QlkjzDaaXtsas8O/eoVc8euqdiTSrMTyc9PS/hWlx7ifFZ/z/CFNLP0wVGufOGkQxEoMetkb/AiQNoK3C2nWn8pkRY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB5681.namprd10.prod.outlook.com
 (2603:10b6:510:146::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.25; Mon, 7 Mar
 2022 14:28:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:28:34 +0000
Date:   Mon, 7 Mar 2022 17:28:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Alex Elder <elder@linaro.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] bus: mhi: ep: Fix signedness bug in
 mhi_ep_register_controller()
Message-ID: <20220307142822.GC19660@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0086.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9c7be12-7856-4744-6fd4-08da0046c2eb
X-MS-TrafficTypeDiagnostic: PH0PR10MB5681:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB568106C589B5BDB6C7B16C628E089@PH0PR10MB5681.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SmGFJkKGvfMzoGVyIgRf3Ein/NONcXmVNNSnX9JDR8tqGDafB1v+0teQ21d9BImdojxPksD7uKaFPDZayI3GTR6ZwELDkCcxLGKKhLCiHQlQSuMg5dhAEH8C/lsfdf6NhFlt7FCzXHnVFA5uTdl+TytT/0DOTyT96l7/jiGPAxXWyk5iDAltniAhII+v+1VAkdYyIE8c0hLat4k0J5pAQKHT2u+0JKJTLfPJ4xpx1oiEjnm21MEzezbf8ckPMD/4wjVjzS+Kx1KEq/DJi21liEBP3PiY4Ob0+FMsqe1ZEBNCoOHQgnrFoDfCE+fDJb1XMC29MZxFLv2qpXy68hQNHFMr26ir3+clAeW3dS6CnRYsKDcNFHc4vlszvSZyfAcPcdU/QDT/9oqjWxdXSMMl8pzRb4wZmmX9tRPHVSBG4/Y4ZAYnryhuPG/iKgGkikCDR2dbYWGh7HGVDVZUtcaYm0WexqPyr8M+taiAiU6fshB4pWgSkoY/oScMdAcw8tmRSTFMSRZ0yKYOmlodwG6nCc7Y6JYFXH72p4JSeBQw2jPLMWXwBrUne0DrLJM8kHUe0fhj9EyBPAYFkRzGkobYStnFvshdT/mdC7cQE+sLRXg8/2o58Z/e3xJnm/IjP0lcyyVdlXlhgDqnS5lSmqWqQTcuGZptgrPCO3Bl1EoezVH9TiJsqkpGSiDCLTNSgc5guyUYUeX/6USzFAA+DP0RcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6666004)(186003)(26005)(2906002)(1076003)(44832011)(38350700002)(33716001)(66476007)(33656002)(86362001)(52116002)(8936002)(6506007)(38100700002)(66946007)(8676002)(6916009)(66556008)(4326008)(6486002)(316002)(508600001)(83380400001)(9686003)(6512007)(5660300002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HClYyRciCXtzwpVBniXbqBnupgToV199ULwr7KSSFAt8Ux7Bxn+49Wf4hxMq?=
 =?us-ascii?Q?G7RvXp30lYA9LNYUYUgEgFm2gzVleLpum1s/tI6gPYIhPtaWHNry3JlpaOSq?=
 =?us-ascii?Q?2zHpc7Qpek3mTKhWWGDFRi+fcZAk4VTdHYD9C87xCMugv5G2//0Es3Tr+eDL?=
 =?us-ascii?Q?9wTuMU7HSGmD4ioL3V5khraykhW1NNkWvCX4t3NTc2bcxkpxZqxL3eFk/Fqu?=
 =?us-ascii?Q?r95tmtHWuobezJRqWSs9Fj2dtE5elepSZ6EGbE7JhbO8PBNecP4pl9QoVjH3?=
 =?us-ascii?Q?nVPAsXihHvbqaJuxD+kP7ggZ1FzxUTG9qRLfR8zUPcE9NHVlUDi3MQH1egNc?=
 =?us-ascii?Q?Wcvb7ErMicBmoWkWp2lSwmz1d2Qou26mKc662hM66Q4JVByWum3+lx3WwPFB?=
 =?us-ascii?Q?IDVjkFy7RYjnJL+0nn5xR6FlxJcNqlju1g9b5f+k/7Hrpnc5DrZS5f7lLyZJ?=
 =?us-ascii?Q?Ff/Uvx/e0mTBA0qb6eYJx7zdfEcZDq7+GMtssHoikAr1JpOz4cLacPAE+8gi?=
 =?us-ascii?Q?KXWjbNH2K3mADPovHpnJjN6tF9xGox8yefSbHN/rEPxCH0Yw+CR4iSBrD03N?=
 =?us-ascii?Q?K5fbDnrAG8immSdZnCVpcsRmvrQFW9Aeej4SfHxjdEaNBW7wM7dAjCleBGcy?=
 =?us-ascii?Q?pqVqXVBNT8O2BpBgI614OUhR6OALgmwSJigw5LZ7hMdgIBI/YIzCwHqGOr2P?=
 =?us-ascii?Q?loonjVH2z0bpNZu8YXEfIfDYhoV4Rs5edJ38boTaCSXZiq9+13Q3Tev1ils/?=
 =?us-ascii?Q?VTPHzFeFZdzswpgsoT2DEvSCmin0o1oCNsUdLKsSmzKOHGgkwFoqXlASPvnB?=
 =?us-ascii?Q?1FAUFQdj44IPrzlftLA/HYOMh+wlVW5DZr22UiD3C5bsE5faiWvb+gJu12x2?=
 =?us-ascii?Q?JumNJGdVmmnRao4yIyUu5VkB8i76hX8cler783WYXSPGB1LR0FqiVSmhVhgZ?=
 =?us-ascii?Q?Y9RkSuxA7BIv9vSGxvRYoAwmnkw5H1MGsfiVDoT4RVveZLIzBBITlBKOAbVC?=
 =?us-ascii?Q?yA729FxlFtsOCC3FMQdeELOTQex7c9uIMPisGVxru2gUCEI5p2xbMJ/DAyKe?=
 =?us-ascii?Q?wETsOYfnOb3VdRnuNn1p3ja6ltJygyQ7FvKCY5Hv/HSqChIg0vFiUSW8+TO+?=
 =?us-ascii?Q?CUk+aHFaSLOlfoJ0ex/4USpqln9SX69rMJHpwSTFiu8xtzLH296MAuoQo00T?=
 =?us-ascii?Q?Sauz6SViszUOmT/yvY82fJqT64xmUj4rZHNg5lEcJKeILHxyO/LGd98wekhR?=
 =?us-ascii?Q?3IU/UEevEf2jtU4QAQ8UZl59OgLYVY72DH/X7yYWhlomSEiucCS1BFfDAKjn?=
 =?us-ascii?Q?l0lS9rTkoPTWzgF3ntLoXqOZx79P0Sp6QIbC58zwMHwphJ9tqbWiMwMOFLzZ?=
 =?us-ascii?Q?KBlqA352CGHXGWaxGd9UrzRvOyNsz7A7x0A0HPusjwSzozWNm7vyFhG7Xa4v?=
 =?us-ascii?Q?AbnUult3tKCSDvWEROkr0yD2zmDshHmoUqmv355jtc2alF3nfZuNX8l6zQNr?=
 =?us-ascii?Q?VvqgwLNeW1JDp8nX4aG0df9kT5sOXE2By2fhhBWyyoIFzS/XtRamiQ5/EIFm?=
 =?us-ascii?Q?KMV1ag5NV9PGFG74ld1nr1KYYAUT2cP4RE4oZ72Jylgj++ECtirQcsIL9Ckl?=
 =?us-ascii?Q?ERTz7OsVlSGeXO6g6yr0OBhPsHUHFQ8s0IE2lcqcEPSbIsPHxzT99ovDUxbS?=
 =?us-ascii?Q?e6/x3w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c7be12-7856-4744-6fd4-08da0046c2eb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:28:34.8328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lg0ryo0sP8T+SwddgMrbsOQWa5g4AaCOYU7CJOsdRLDKfobIZsTj1HcboDQlJxIBs78xgB7pOJkd+7U3VQjR9r+WyANyC2fXXgutrJJFeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5681
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070083
X-Proofpoint-ORIG-GUID: 5-9GkEyDiWYlFuURnzwpPaOUw5wuLS9_
X-Proofpoint-GUID: 5-9GkEyDiWYlFuURnzwpPaOUw5wuLS9_
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "mhi_cntrl->index" variable is unsigned so the error handling will
not work.

Fixes: 10f0ab9c6787 ("bus: mhi: ep: Add support for registering MHI endpoint controllers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/bus/mhi/ep/main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 3e98107f08c4..879071b021d5 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1418,11 +1418,10 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);
 
 	/* Set controller index */
-	mhi_cntrl->index = ida_alloc(&mhi_ep_cntrl_ida, GFP_KERNEL);
-	if (mhi_cntrl->index < 0) {
-		ret = mhi_cntrl->index;
+	ret = ida_alloc(&mhi_ep_cntrl_ida, GFP_KERNEL);
+	if (ret < 0)
 		goto err_destroy_wq;
-	}
+	mhi_cntrl->index = ret;
 
 	irq_set_status_flags(mhi_cntrl->irq, IRQ_NOAUTOEN);
 	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq, IRQF_TRIGGER_HIGH,
-- 
2.20.1

