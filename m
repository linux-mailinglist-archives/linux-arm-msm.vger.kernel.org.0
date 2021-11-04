Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FBF445436
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 14:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhKDNtc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 09:49:32 -0400
Received: from mail-eopbgr1400095.outbound.protection.outlook.com ([40.107.140.95]:62688
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229505AbhKDNtb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 09:49:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mi4jsaxR3oVnzeOSqMqyImg4PpwxsoC3wg8q3yJCwxqg1A+OgE7oRRhCtb1q8Ph1i9Baw23eNQQyo8IJrP03gL9gUeTm/TXeIEYNlr/1FkXDnEEuOohkeZvXNPsV7W4nI2dKACor8fCUa2UfMX4/oVLsndwkyag2RN1DJAw308290yHIWrQ4YTnNNe+0MLIgjHoaAYQk6gIMZ6HoMVMsRgyMboUixEQ3zaAbFy5mDePH81MklePoiMOjeQjYoLImXb5kvcmNfEbB6CGjt3hFr6C5ePVJ1OsSktAsLcRjZuL96mZIwoz9p3dvVdvZ6ki6OLXdrcyfl86XGlrvUsJu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8sPBuXOksEtoxckGnOpJ6yv1yIT2hyiVsyd73AOP/I=;
 b=n/9EjQM4zXA2tc1AFC5PD8ivknBWFstJ6eEC6tr+XWnMqGc8SGoCH4fK66mDz899ep4ZG18pVERhtPWtbp4/tEfobV1qWzMmZHDBzadH6BCN0F6gKHxBQ0u+c9cW8Hdc1UgephQ2L/gF50ZQwsY04S9Z4OzgJAJzvLn8zeXLV57Bku/EPDOFoVV8u843QQjdYFfTqXjM7/p1K7xiKcGnSCQC2PQMzNCkCyz4f50XnAwDnLFo5btSPeQnPoCwjxlllP07ZZYNs94E86Ot9KP32vLRnHrMsW9MZ+2TkdP9ahcxRMUrp6sSFxe5xoR38m8vuhH7uFhyklnCjK44GVQaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connect.ust.hk; dmarc=pass action=none
 header.from=connect.ust.hk; dkim=pass header.d=connect.ust.hk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connect.ust.hk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8sPBuXOksEtoxckGnOpJ6yv1yIT2hyiVsyd73AOP/I=;
 b=NFcvRQZeIXUACrJO44Vdmxw8psEyYI4zJNJkcT76uf0FtZVDndg/5tiCY9hUi1PBiKqChuwE5GTtQ5gxO5HfIysxDnGRCldgcmtAG0vC7JGsoaVIjXjfH6rlcLLuLJY7DbFyXQhOswhzxeLWQ1Ah1N+QEDmSsq8+VJz1ZjL3Pf4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=connect.ust.hk;
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:b7::8) by
 TYCP286MB1332.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:bf::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Thu, 4 Nov 2021 13:46:52 +0000
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c0af:a534:cead:3a04]) by TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c0af:a534:cead:3a04%6]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 13:46:52 +0000
From:   Chengfeng Ye <cyeaa@connect.ust.hk>
To:     thara.gopinath@linaro.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, svarbanov@mm-sol.com
Cc:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Chengfeng Ye <cyeaa@connect.ust.hk>
Subject: [PATCH] crypto: qce: fix uaf on qce_skcipher_register_one
Date:   Thu,  4 Nov 2021 06:46:42 -0700
Message-Id: <20211104134642.20638-1-cyeaa@connect.ust.hk>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0081.apcprd04.prod.outlook.com
 (2603:1096:202:15::25) To TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:b7::8)
MIME-Version: 1.0
Received: from ubuntu.localdomain (175.159.124.155) by HK2PR04CA0081.apcprd04.prod.outlook.com (2603:1096:202:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 13:46:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2998897c-6fe0-4773-bb2d-08d99f998e5b
X-MS-TrafficTypeDiagnostic: TYCP286MB1332:
X-Microsoft-Antispam-PRVS: <TYCP286MB1332DADAFB42F934D10AE2868A8D9@TYCP286MB1332.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r0tjG4sSEwTb+tzx1+cUP9ne6lqSjLtqahOXf3jAxavQCIhyRzfRmd91AAH0yZ9cgAMSEKmnuUa/wNQSzOcnJoS5VUN5eM/EzjUkMlQZ54bQNX0TTCyj0skNkJh4ZoyQ9CyGaMySwqFH+KwCsKL4ROu/2zCY029SSkF4q+DJJis9541uUOHgK8aHVzMR8rRTheyGsNtWzSXbGGj7hTk/uMKz5/N1kQtBPOVuvQPimj0MEa44IHYMiF7f6CR3mKhA90EE+qCn4e/PwiqOCI5QlF1ORG7YKP5iEDCaCu25BZO9ENLca6mkL9OE2bHkrv4x5yjqSXretE0n0ugpbFSorfPTs/mWUfdI/m+Wsrg7+4tSY0w6lp7q7ZADpaQ2Jv2d/Qy4M74egro3utiFac2cTKy6ab++e+ZbBK4HdWWrxv/valEf4ZfUq15x/6d8ZvzJIxUCWCd7Z197lNfyn/gudSkaSnMWFSzCH7TNrFLLo7/UZvYX5DcGjlb+itpS4ADZrLP3J4z/m2zQG0iNI34PVO8Tjic8uOA8KvXP7c6hba3/r6ggII/GO6xnrULZ3qvodG29f+k4YhoMoQ2eQTF7ERDgR/+pCB8sngxLjBNGFQKaZovfhn/Bcy4wPmLfx343s8YYHYJ74padp+Ymxa7mLe00Vvw6Fvf4CNHhpiNBydHGzxTIUOKIJu35V0eOy2EwoqwNr7MS1fJHZn3ewpDL9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(2616005)(83380400001)(316002)(786003)(6506007)(36756003)(2906002)(26005)(1076003)(66556008)(66476007)(956004)(4744005)(6486002)(8936002)(52116002)(5660300002)(508600001)(38100700002)(66946007)(6666004)(86362001)(107886003)(186003)(8676002)(38350700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m0kcZ4zZC0KLRAq9PtFvq3kpJ363XOR5k9wcSwrUFurWbMoHDAgJmDZK9b1B?=
 =?us-ascii?Q?9uYYnm9hc6ZEbXCsBmbzcUXbB2TiSqFTMzet86pUDFQ8XO6O6ulQOeWq9cqB?=
 =?us-ascii?Q?3ZRKIpHc/UGHadctJfFxJQQY4LLNl/H8NKTAXPdBVES0R6NoKR07F3e3aRS5?=
 =?us-ascii?Q?B2b8vluepWchRbSMHRxQWWbmWT7YZl3yUlovuWz+7j4Ljkteql3XSqEHc1jd?=
 =?us-ascii?Q?wAuaZmadejay6FhqM9BCBV0nEAUooQLU8BfO7uyRCxQiPAf5lOWDVYEjmSP0?=
 =?us-ascii?Q?ucSIqw4AdxYnYMgxjXj8dEX0poxIVe633OXNj4R22fjnAAnrMii0C8iiwiCH?=
 =?us-ascii?Q?tPom3rYdGq/LZDB5U3d2CTUXs89v7Qtmy3h4XomOOtMg59yQozOFo+nQom2Y?=
 =?us-ascii?Q?zLaqozeiAujb1yyW+JF0oWLFVEU6ba/8Ic0nOtf1SxVJvpy6dtHVPA4v6Mon?=
 =?us-ascii?Q?8Fy99QN957KLiEolevSvRpa/OLxohXGf16fCNflRxJckWoS73OR1+7z5Iu4h?=
 =?us-ascii?Q?RZkoMAZ9NZTdqs/38nqBAG55+fwOeasZo0CegvJmfG0J4QaBQRDRZTRCtW65?=
 =?us-ascii?Q?lqMA7DVr/k0IsdEHMINSLSjB5wyaiveOBN/70TbI4Cg8UhtQBR0xvYmmaG+R?=
 =?us-ascii?Q?I643Uk5ZwvuBq1RiuexpoK8qKMF7vN+b9R4LSsk6fhYh7uzf3NJFbx98nakH?=
 =?us-ascii?Q?B2ou4o/+vgWGEcF5I9+rvpjBMnwtkLazrDHnGomgz3wZpNnqWdK0uf6QygGG?=
 =?us-ascii?Q?XtGkEGkG8hOFV1SRJ8bwodSLXZ+RW2VFmFsNk9hQikggqb72imuBl+DE2DAU?=
 =?us-ascii?Q?Hc7IK4bjRvpX2+ks/nV0CpmRST8OMtyVEfMlFBthloZuau+pZOxWQM8td953?=
 =?us-ascii?Q?I6TWD8GVgj5p+XupWIJShCovLukUj7Id6Hc8TmIDD5XllDwksGVQcmAPqENw?=
 =?us-ascii?Q?xSw/wH8KZUSrJQZZhx8m9cOwIWa2z4PDiEaQkPt2FAG9ZWcuCqWVnhp/eEBu?=
 =?us-ascii?Q?QnzE2HGeJfzi86aSPNH6L4drpigE84ezFCbD7gKiJaaGPr6pItCNkoOh7V0D?=
 =?us-ascii?Q?xjhgp5iugdj0+ZxJ+tuu0gKipsnWEOwfgTsLcW7dFr4p9V5ums1XmqI0r+wi?=
 =?us-ascii?Q?fs2n/yb2vn2A7Q2Kj/MF61G8OLVK5j635YtYK1nZjEDM1f2fhDbBihNuYMOG?=
 =?us-ascii?Q?fs+ZOTIec6UP59vsE61aBqreLN0OiTpfucwAqkrIlRcuII96wFsDjoIRVRVL?=
 =?us-ascii?Q?X4RKEPZ4lHmc8PLQgULaFHgGcHGK+y4CXxImhjnXnsWwhEM3ObIkD6TyajyD?=
 =?us-ascii?Q?WRmx5olZtTWoqb39ssRM/DFf1gS0iYWvfuAzy6nKUl7lf6Y2xNf/qRk23WVk?=
 =?us-ascii?Q?ikXSgs/h940dbTuDPIBDy56iwGyPzYDvrvjRxsasiPj9dEKp6RfwvUqismR+?=
 =?us-ascii?Q?cpoPupFMI2RwEumTrO1CS5ZFLHRCkNziUQHDoSGdt3XW891SBF6KduZh4zMG?=
 =?us-ascii?Q?Qg4DjxTn4BsO/bDcn/2H6OmbsMTveKEPCcrgaZ396XhZIKCzGvnrrbabo0pH?=
 =?us-ascii?Q?DaXgTLR4RABEhCnFH5ypwLbVlwlNVUoS+cdVfgzFnWQIamKQzae5pO4LUb9r?=
 =?us-ascii?Q?1g0+GLev6WgrV8Chp0BjObg=3D?=
X-OriginatorOrg: connect.ust.hk
X-MS-Exchange-CrossTenant-Network-Message-Id: 2998897c-6fe0-4773-bb2d-08d99f998e5b
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 13:46:51.8218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c1d4152-39d0-44ca-88d9-b8d6ddca0708
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QaxFWc+g33POmVzAVThHU1gIKDFovP3vQOxoYvlzpjLnAWhwmsiGSoe3iyaCYFJ2aHJA2FnHm47CD1cR/aKMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB1332
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pointer alg points to sub field of tmpl, it
is dereferenced after tmpl is freed. Fix
this by accessing alg before free tmpl.

Fixes: ec8f5d8f ("crypto: qce - Qualcomm crypto engine driver")
Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>
---
 drivers/crypto/qce/skcipher.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 8ff10928f581..3d27cd5210ef 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -484,8 +484,8 @@ static int qce_skcipher_register_one(const struct qce_skcipher_def *def,
 
 	ret = crypto_register_skcipher(alg);
 	if (ret) {
-		kfree(tmpl);
 		dev_err(qce->dev, "%s registration failed\n", alg->base.cra_name);
+		kfree(tmpl);
 		return ret;
 	}
 
-- 
2.17.1

