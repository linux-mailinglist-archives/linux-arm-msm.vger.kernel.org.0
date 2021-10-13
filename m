Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F54642B365
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 05:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234170AbhJMD2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 23:28:01 -0400
Received: from mail-eopbgr1320127.outbound.protection.outlook.com ([40.107.132.127]:59760
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232411AbhJMD2B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 23:28:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKxKBBOMPdFCCqlptTgEMfiLZlZRGAPCUK9rX9EbbdwLbeiDQyx0McqGpQGT9+MMgKlwXFUucTiSlkUgsvcbsMi8iEgqvlvqpmaZWSb/dsULudwBdPeMPnLbJVm8qe9PC+HYw+9aMlc/ocQNiIGLKFAYT0Nhmba2mTP4fjW0NlV6BdI3zCs5tqkaS//Lav21aGC/7OFwZZ0EsjATPZod13fbzHfoeeWEeJBJcdP2N0d48QMkwxqazlAO830eA/LPMMGaS/jMGVvU7jqZkao+7OcIMsmEPPbQ9Rj/Y3FpdOlDrvFvT3RhzRPA2czfXFEo4ZVD9m0slMQFgvYcCM2GyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZ186gLkd318QAxdCrAp+eJPvcjA6DIO+WNnzMf3UMQ=;
 b=RlAtrxxwukgYAAJrcjfggEAzfVrmR1HSTzDKVWUcYsjqIJQTjxrZIyVaYXWUac2nf1mOWfBdkcUN8WcuRl4EXHY/rXc9aYJfbL2X8OQtTvSG+Vp9e979rZEzQtOCvg4LIbh0TGH8kAcyoL/0VWDhzGrZnDyjUZ468aX8LN3RhNP54v6E19lAeS2EHR/2dSMRsH8XJaDSJDoFwez+K8qx9IoEaThcvQ3ADaHmVQmu1wZTf39RhkFUItFq9VPfS06CwnVCQhGkqzFM6HglH2l0dfrcMwBReN2TnH9kGrcN/qXVjLshaKn/VlMugSrcowes6qE7eE/ikmus+qF3ByKj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ186gLkd318QAxdCrAp+eJPvcjA6DIO+WNnzMf3UMQ=;
 b=LLdaz6HPi/xqf6giXdKvGZfYYhYGkgDNNjSZVesTpem/CVqZ48SVYXwY9qva9LLdYbqau+nLGb188s8qRVRsMPbtxLb1gLaYpaZkGjbcJFwP5O9pX8Z2zAYPNbKobsiP4PO/pbaFkaJCfIXFG1s4KGsW4wGit8pNOvfvvPr42dQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3243.apcprd06.prod.outlook.com (2603:1096:100:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 03:25:56 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4587.024; Wed, 13 Oct 2021
 03:25:56 +0000
From:   Qing Wang <wangqing@vivo.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Qing Wang <wangqing@vivo.com>
Subject: [PATCH] bus: mhi: replace snprintf in show functions with sysfs_emit
Date:   Tue, 12 Oct 2021 20:25:50 -0700
Message-Id: <1634095550-3978-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0195.apcprd02.prod.outlook.com
 (2603:1096:201:21::31) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (103.220.76.181) by HK2PR02CA0195.apcprd02.prod.outlook.com (2603:1096:201:21::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4587.21 via Frontend Transport; Wed, 13 Oct 2021 03:25:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e324f7d-70ab-4135-13ff-08d98df92afd
X-MS-TrafficTypeDiagnostic: SL2PR06MB3243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB3243576129F82F14674686DEBDB79@SL2PR06MB3243.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CFdzYh/qa4cr+kYQAdrXofhy6jCkJTqq5CWy1mMNraYbN5n+sz5NfOI7d9BG7tBCJiteZNe88IVm3ihlZH2CZVEL/9ufqjBXbcLrok7zDLw+dTFMBxz5JsYN8BK1UppwAvpPjsitPy6x1hImzu3wTs7HhXf5QEFPHzvOKfBX/I5AAZgD0N1KeLhsH5qV5018YBDxhh+QeRU+FpXI3rTJFXgSRuJQma1Pf24rKMwfSMWRgmBctmfghkfama06k+3aL7sD2fi1g9yx6ERz3T4Q8f9Jl8ob/poAL4lxAxv9wQdmTdGvFI9JrBxcHLj7pf6+AzOwtxdxr7+b/WBFuRdPehh9D2UJZrhpm4yg3Rbi++WWEbmyokd+WcRi1sPkTwPTZjIf5G1ZXqT6C0UIjqB6wuhVWTZIYzDJRpMpbMvJtJ+KRO1Y9LNgIWQM+IqsQ58u8MdHInAGF0wYkeieSO4VbNw7N9CGBn/yJwt/JOygdXnwdckhe1qWQZKCjy/HVc5lHR3B3X4aeTcUHW3n6Q2dvYv5IbuCCJoaOpTGia74icHrlTAe7DOsKvuFfd7LCaUi4cP0tLJfRarJ0+gTKeOmNB0mptYZTI4+YlPd0wHKpIyo0CqITTSxQdMjjyiBJjtM01skQzk9nFf34EHjXM16KrMpB232e+ApRny4iJ2OSw52sqesxX103nhRl+MuBp/cMDir+Gvv6izXx2Qhp9WY5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(2906002)(26005)(6512007)(4326008)(66946007)(8676002)(36756003)(66476007)(83380400001)(38100700002)(6666004)(66556008)(4744005)(38350700002)(107886003)(316002)(52116002)(186003)(8936002)(6486002)(5660300002)(6506007)(110136005)(956004)(2616005)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HQKSAoAvm6B1YFo1wbJAwBgo+mwCcus9W15ygwyV3Ty3lrXmUGF6/ejG1nv1?=
 =?us-ascii?Q?gIq3XOTJ9JPA+WUzneHC1WeTteTMrvINdle/qCRIBsHhJdO/CgyyPn9E6y5j?=
 =?us-ascii?Q?o5p/NCJndjT05W/7Kqk9zYaR8FsTkDADeDwqTqC/3wGXVVu4+/XxEftohtYN?=
 =?us-ascii?Q?HCneOvlsTIMbXjpXku9HSzaC4OYOaFvQ/IfLPwBniCfvc1PnfCJBliZn3UW5?=
 =?us-ascii?Q?Qic1FsGsOWWWTQY6dDS3DzgZZzgFwStwNiRjdme+Bag8EIZSEFvES4NoNVy/?=
 =?us-ascii?Q?lLq4e62BNyMoAMhX7RIvUcFdD3sqZlyHj8BSNMAkJXhDs9xn7i2mpJiFfGE0?=
 =?us-ascii?Q?zPA6ybyyxWqapf17FgNeiSZB1YwFm+ev3s4FvpryzL3kI4QRORB34vdnZIT8?=
 =?us-ascii?Q?iHfsvMUTwl3FHumP/0q9tSWo/f58nSM8sSTVqq7yHty5ywJJduzH+4Fv+Aad?=
 =?us-ascii?Q?N7BzNBLiJ02FRwhM111mB2KcXMcL0fH/8Qn7X9uJ8R8Ro4UjzTey5MPRnOJB?=
 =?us-ascii?Q?lPFCNjJweEFsRav4J+pyIRzpVGFaspiwQ+h87IkvVUQInXsyOglyFAPl1Cxc?=
 =?us-ascii?Q?nMpQJhe++7Tcu4dGc+hbEOzMr7oibqgD8+SvUIJ1wL0rRz6EIkFEB3EWEmKm?=
 =?us-ascii?Q?Fw4BsK1iPKqf+ooFE8l88aPZy4L3Rb7OZgp0SVK+CrBTnvKBhmFX3rNmVill?=
 =?us-ascii?Q?gT2NQXLb80JhUIYLeAh+81uNvWs2gqjHGDFQ6sSWPqxCRPWibHq2lZVpWpck?=
 =?us-ascii?Q?6YoBAT/gF4+QC4444yF5vkHBSgrb8Vo6sI8U/LLYXNh3cbyFa1NzoaJYJCft?=
 =?us-ascii?Q?KJ9QxnN0lBfcOOUIKWX/vO4i6Ji0oywOB7jvwrzGZq9DWZW9AAedMKS1xAjS?=
 =?us-ascii?Q?2bEk4PSBbg8qq7tHtr/DJm5NLs7Ts7YwjSWIgedZaONVMw7IXpRCsE9mP3Bv?=
 =?us-ascii?Q?zEESMIZBV2qQvqJ8HgUC7pK0soUPZESLgxFnQjEpKxtkY+U81i0+tb5CuFSh?=
 =?us-ascii?Q?oyVT91FvmiYmGO56HIir8thr54kWR812D1rKj5j4QUZNZs7wv8yx9+kceOKl?=
 =?us-ascii?Q?4sooHslC2DTPYo6QhZLD/mAOllIU05MSjkukLtUINIol1uAWNd2Kz7ICIxbd?=
 =?us-ascii?Q?YZ5KbSYm/5ynDP7jG2b3GtmwV173Q3NhzLhb6Tgi6st68MioK0YDVXIOdbxH?=
 =?us-ascii?Q?G8s8qnVPQM2uZRXUzjbFW1IYV7uTcAXiZ6e/BrU9pwUR8ZtMVahOa5ptUnmj?=
 =?us-ascii?Q?Fnie9ve1iRKfgHOyH3H+FkOyv9XgAMH6JjaVjnLUr1FoqOphsbHjq71Yrt6R?=
 =?us-ascii?Q?O5zv4p+NfJ6VOYEmrQdLy8Z0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e324f7d-70ab-4135-13ff-08d98df92afd
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 03:25:55.9746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lU1Aten9im9SODDyFiJbGnZJU4Lon6xdM+I+4vYvUWnmFg4m4qtk2+p4DUOMSBznBS8XwzYWOfG5DMN8HryYGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3243
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

coccicheck complains about the use of snprintf() in sysfs show functions.

Fix the following coccicheck warning:
drivers/bus/mhi/core/init.c:97:8-16: WARNING: use scnprintf or sprintf.

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/bus/mhi/core/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index c81b377..f3ddefe 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
 
-	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
+	return sysfs_emit(buf, "Serial Number: %u\n",
 			mhi_cntrl->serial_number);
 }
 static DEVICE_ATTR_RO(serial_number);
-- 
2.7.4

