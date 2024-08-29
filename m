Return-Path: <linux-arm-msm+bounces-30031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D0964528
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 588B61F221F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839C11B2ED4;
	Thu, 29 Aug 2024 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="KKvqSmHK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010039.outbound.protection.outlook.com [52.101.128.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5A91AD9DE;
	Thu, 29 Aug 2024 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724935295; cv=fail; b=L9Bum/zwWnp4cFfMx+nHDhD1VPTtZAbB6iPX/E8tMQF/8Sxq4I0oEAjVf6DDgOUlCDN62VSkB0e/wuw4tgO14bupYlTV6sL6W1l+EOzNX/1FI5Dm1MPs+sW0Q49L6ivNI+/n9tc7tACy4dL7iY2qT+hpBNaVtwfTla9qISON7JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724935295; c=relaxed/simple;
	bh=qbKtzYI6zTCW7s2AcWKlIslRtwLWTPUHA+tfku2mY3E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bIz4tN8Sx+i/LyrWknRg4NwqQETY9rAzs+IkzK3NKM1sZTOhxoWDMdfOMYst5s2gMJtqABkeJExIxAFu4qh4Ea2OevdEdTfMLjbwU5NiMlaMFohl+fpMpAi7mcOhA7IVWPwnmYJVl8KSdhVG9dYo2kSnAaim5v/+gWN/3eSlf2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=KKvqSmHK; arc=fail smtp.client-ip=52.101.128.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukVBOWjsZPDkuDJb3UDNeI4RgJ7XQn3o+13cnBZd2h7W3FrnqJe3TSD7VuUBe7CZ/dvHxOp7J/yUJCuDkbMlyS1nD8P3caT/vnqe8ArAIOqBwjqctpoQq2jQECgpvqkK+q6kOBlJ0VOAlHYXZHu4hnyH12+hewCsb+34K/z5YwPNR24dtjsfeyJlROedUUupbVvQBZF8Lgtti4iM8yp1y0ata8OYOngGeR3mhS3uCE5gLlbNOI3+w3kWWCDgV09f6OIH80jZuwyZ35RboHsQ7ILZyU83ROoCQdxV/FkKknhiHkCtaJAE16m0KtOmg/nHh/DTxL8KDS9WtouTbERM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0SenKOg630rSkvIusCkLl1Vs3ix659KSFtX/B3DkTI=;
 b=TqmMwhXt6H569tOlukHSEWz4I35ozqp1xx6lGikK3NK1zTx/znRD+vgEfSJIOEmC2+yykh07Y9DRP6EvCtz83b80W+Yndvd8bQMLEBf/pHYf264RBRsWmGAf/HYgl5ocAeHP1IbI8g5dFzRp077g9Xq0CvWwAM12ns1QZpN9KjabSvVQwYZWGa0RU06DA1NT+8L4T3CQJWvBAJ1ebB46+gZY/x33XyB7rEsZ/b4K8xS24EV/CMiJo0pLQ9YvxWgiHtJIdju1rYcKfHlsRfvuC/yzlwJKITle8S2IBxcTJ+RB4XhmoJJ41QBGYG5l/nxQn4wFXrDsCQmpK/Ugd3xhEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0SenKOg630rSkvIusCkLl1Vs3ix659KSFtX/B3DkTI=;
 b=KKvqSmHKKZWIPzQI37PXZUAuOQaVXBptyEhOUIRaDpPx/6sUhFbuDEAXMqTsO8W/HGHGAkseEGjYG5TeBq3zGg9RFV19oj7zkChoDPYcyxz56oZbtSACUzvcXe97qmcNfWSZUAjW3zWPQ+ih9sZs+Iws450JlTmnszI6nHcH6GBY/uRlCta6QaSVvmLTPWrCKCihKRa6b1qotU7/zfLPiHfGxzZH0Momi10qXlnyMpHel+7+L2x6OvhnS1WDw8qAhJM8wMlOiTHWrepSLFAGD6DdPNqHGGsix336NgP95T2r0nfHoatBRlYMe//AtHsoq34n0P4ZOQlEVFN9mtAJXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB6238.apcprd06.prod.outlook.com (2603:1096:400:33f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 29 Aug
 2024 12:41:30 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:41:30 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] bus: qcom: Simplify with dev_err_probe()
Date: Thu, 29 Aug 2024 20:41:18 +0800
Message-Id: <20240829124118.3256437-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:404:56::30) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TYZPR06MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: ccabf3fc-0955-4ae9-85e1-08dcc827e7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ygws7yTw8xME6C8SbxfygUWT6gT4Tcb88HZT4C/kP1sD08rwYNs1GQ0zRmJ2?=
 =?us-ascii?Q?yDhwspgEK0rV9ixZNA48fd6aGcF4rIfe4IJ2/iaQZG/Zyab0uFQCC2iQZxEp?=
 =?us-ascii?Q?zsLoKnnp5ftup+2UrZtmmm0RkyF8QwtoVDKlD7ZH106lQOrVQWkiQ8WD907S?=
 =?us-ascii?Q?7pKxGYYwQRNenG21z3mtrr1xQN3XWU8La0z1q7pOEcZBJhObYHkZ0MrGmLvZ?=
 =?us-ascii?Q?0WGDS39Rxs5lyt73D8Vx/OwHKhCD2+zPTCAFRoMl4WDYiKzSegCIuUEmFw25?=
 =?us-ascii?Q?YanbKdmIi57hSbsRI/ETWF1/cR2PMbAzCCScvf6sRJJn20QPLjJD9h2eU2L/?=
 =?us-ascii?Q?bibL4tTRtHa84VHPog6R6GSMcDvK4PTh4q24Qjn+Z3KYSQKNFzhya/P2FeDq?=
 =?us-ascii?Q?0AY6ihnNFqO1cvRq1Lv+4spN3ipFz9doN4cjI9vuUY49PmO4ae0wtX4Ey8K+?=
 =?us-ascii?Q?mXlYACrbV03fAsD8nV4wkGjpRmjRcdnQXIVMAO/HAySZeg0ZQvJYbvreRZrX?=
 =?us-ascii?Q?1FRJKCs36F2iXpoh5O9JKLrSjcmynTdXeu1d/SGvSPUQ5wgENz3lc83WdwOL?=
 =?us-ascii?Q?dSTFIcNJesIeF3YySW1TIJYDcwImvW5yQcNputNTvJ6eLtV3TcloS2u+WjU2?=
 =?us-ascii?Q?Pz1eXn77xjTkphJijVSjWZBrJZmkg11RBfeReZg8M/N+W+nZLIcLkiaDBKA+?=
 =?us-ascii?Q?uWqlL/QlKquno9rS/G2VNkP4iu0glbx3VgXvBLzOcPTDUeGusHEW4jENkRQE?=
 =?us-ascii?Q?h/AdkOIsEI+msdBdd4IvE51z2eMi3tJe8voZtba0BIlV089Xg3ySqboSblu5?=
 =?us-ascii?Q?UTGR8CCU93LXrdW2/5QOlVX9+wRVlqu7gEZvrFVn9AUO4xmHEpOnUL0L9UCo?=
 =?us-ascii?Q?NBc4+Sp3iWA5ia4KmkBiH4Go9bnpKVe+by2K+XG9uZHPCSWnE16HQUzGPsz+?=
 =?us-ascii?Q?BvurWlhyhG6IlQmYU0ptS7pMLvRjHkSvB4ZrQ9v3iklkPv+jFaT0tgNkdLwD?=
 =?us-ascii?Q?O38ltOJy4gT+kE13tYPsOkLpPRxjBSOT58zJi3tNPa9Eow/1srYS9jr1Gcol?=
 =?us-ascii?Q?OExW2RvBCQmf4hfZG3cIr4DOHR2fHcS7ioLfgwF9fKMgXc6wzZjgmOb6TZCB?=
 =?us-ascii?Q?lkOZ6gsTwc47ugKkhefWRXQvNQ9A9ElrLbldfUDgWc0AtPyjLZrlQXOVwIJP?=
 =?us-ascii?Q?8UqFJ/tR/FMoq6NlZh0WE/bM+9Ve1nOa2ZyAo5Pr39loASd2IXtP3ohGx3eB?=
 =?us-ascii?Q?cRcu1f1b48dv0y0axSzVsJfkZYcRU3vjI1NhRTK1EDypNfB+r5jvnBQDUuYy?=
 =?us-ascii?Q?zFEZTKfV92f68l3CabodcARGJoxGyrqxfVwHh6mTpdp820nW1K524SZ2O6g7?=
 =?us-ascii?Q?6vffaSvDePZeTO6vIgcwn7XTlODafXs8bn9Y4FZnQn6A8jM6gQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzJ7FaxCvTHVqUG+jqgnTzC8EgEwTpcAp43qpBVI2Y0Ac8mAht87IrtQyNrC?=
 =?us-ascii?Q?xnUlDrqUtGwUbGq3WgbxUrcbgPP04rlci1zOQFT9sQwggBTT5shRgu5r5HWU?=
 =?us-ascii?Q?oxtDgTsF4L/jN3jitENxMU/IizTfwNXHotev2i1IOeMxCDx2Fk10cbZMXaOW?=
 =?us-ascii?Q?rE9h8zGlSbvre7l4mHxpE0he6Jr7I4+ZSbxljTxrl82dRK5S+j6BJg1JAG2l?=
 =?us-ascii?Q?V0h01H849uEUGsLNu5xew3bUoX/cl2GhlqBsl6dTl0tumtGo0zHnsoAjKqh+?=
 =?us-ascii?Q?Pn+aVbwQSMc1oPRNSCpzLt8DIJAeZs9muqyZHaY3qHZvvDn3Zc6DJA6XROtj?=
 =?us-ascii?Q?Xn8N3H4kVANMfZh93DrUN9AEFADzQi3+2JcsJyvBgbyPYyn030BpKjohVx4U?=
 =?us-ascii?Q?PkPnTRwKA+eBPVfufjuUEM6Z5Uj2352upXcFqAz9uerM/RrbN13cSDHbk2t0?=
 =?us-ascii?Q?Tq2vPb7Z9VIfiP7IrlnOz8MzpHJE47STWlDkAryWwUUl7hWgJKfF5fvzLMw3?=
 =?us-ascii?Q?Ah14mp5YmdXTAstzDwp/5jlN7uWhj5fop12w06RJgE+S1XL4tKmh2ADR+ADd?=
 =?us-ascii?Q?WS87SWhmAZZYAW0o8uHqOKo1ngN7KK3yBX5tdCVNZwxv9U+G3iH/jetm8vBS?=
 =?us-ascii?Q?Ji/OpuYzSMER5yQ2302q0g2j4c2N38GVkkXadGNpomqBrOc6PI5TIHPPKCEh?=
 =?us-ascii?Q?6jklEtOHXHSUGss6kkZjkJSn/LM5qqhbxndJHUmKB5470VbxyLHID+VthA3J?=
 =?us-ascii?Q?woJSvFgSimE1ATMUGWPu4ADw6uzWT0yEjg2SUGmxXiQGlGLvZNWVEhl9ZZk+?=
 =?us-ascii?Q?5JX2c/SAKXLecqw12iFeLB/C8tPA2Hi3Zn6kRy4zsVm5RhkCQagzVUN9W17s?=
 =?us-ascii?Q?Pj/R5FFwEmkHBIdGa/4TWN3lqXTr0XrSrhk8zFBvEKFtOP8GcfwGH5SXDJGD?=
 =?us-ascii?Q?ztzTDioR56NSdNrl2oiPA/atqOd8Fs4IvS/wVS81mxNd2fNBV5QWrxWC0T9H?=
 =?us-ascii?Q?hapf1NBj//X+yjTdgMKkEgDpXfGpHzkrPyD2rucrSVDBxZozPFeMCYI4AFXc?=
 =?us-ascii?Q?upslqCVqx9QM5U1eH0fpQzqXisbuYoF3kQpbNDTeYwiBBbK34akrsm03Hecn?=
 =?us-ascii?Q?Xcro3pe/fAS2m0SbBJuIIrfBSFz/lK6LKOaI4Y4soiMbO1PyqOqgTyKJetpc?=
 =?us-ascii?Q?8VXIboFUvOaWdq5xf8BXNYEFIOe4mRL/XgnfN86YaIRshBsXUw9DoEBRHCpi?=
 =?us-ascii?Q?MHlVtR+589AEklqQzU838sahSWFl1qnSjS0p2qQi+nD8zCImNafsIOGVjMRj?=
 =?us-ascii?Q?At8O5mwgBz7Fxa1QFW6JUVYOne77745MRgGdK/ASRADnt10PR5SSXYOewpMx?=
 =?us-ascii?Q?0LUZoet4qoJHth2sB19hzBl50DAONAaf6UnLJWYyyO2k35cEPszVldMDTEto?=
 =?us-ascii?Q?xygIQ5MhVRGRVuB5CFEW4hdna+id2AH2WRlgghavftLsMTgALfgxxC1QwsgK?=
 =?us-ascii?Q?aWYFOFCoR1bGaQdtppxlXMt1ky3xOTy/3e7xaCgQLepuEf/x5MAF7prglrrf?=
 =?us-ascii?Q?eI/K0we9b9zcJInA5k4fJgEqvVSTuMpTOcoZDa5G?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccabf3fc-0955-4ae9-85e1-08dcc827e7ce
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:41:30.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16Qty5vnjSh8ydU9YMf3t/JuhCwrm8JNe6jIp3LtlAk15PQxk4P8nQLFlcbwjUPBFIFojphcRbgSGCLXDe/kJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6238

Error handling in probe() can be a bit simpler with dev_err_probe().

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/bus/qcom-ebi2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index c1fef1b4bd89..dbd6a99bcc99 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -308,10 +308,8 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 		return PTR_ERR(ebi2xclk);
 
 	ret = clk_prepare_enable(ebi2xclk);
-	if (ret) {
-		dev_err(dev, "could not enable EBI2X clk (%d)\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "could not enable EBI2X clk\n");
 
 	ebi2clk = devm_clk_get(dev, "ebi2");
 	if (IS_ERR(ebi2clk)) {
-- 
2.34.1


