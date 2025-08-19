Return-Path: <linux-arm-msm+bounces-69650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B95A6B2B832
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 06:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC0525E892F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 04:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBB425EF81;
	Tue, 19 Aug 2025 03:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Kutg5gnS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013000.outbound.protection.outlook.com [52.101.127.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E628A20B80D;
	Tue, 19 Aug 2025 03:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755575992; cv=fail; b=jzs0RkLgfW5oiYTy15Z9v1ecaFjTpv/G1qTnju0U3vHcv6+NuRWbAwzNwNzHCfHzuUvRxdqUl4VRdzjDU6KDCT01LcXOV/gwTkOBc2Vz3/SjmZi73UJ1dRj9oSQa0lZuYodvO5zjbfULEtpKaVrLtAACXfn3xJ1wcfmd09mL4D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755575992; c=relaxed/simple;
	bh=qZo6TXD5Ot8mPGQOAStkCLkv5N64rvynA8vKKHgtEtA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UWdJQE4bxc9Rxtg2fysz1ueD3jcJT886m0NWqp1aXS3ky98pxVwpMKBRh2rNaIizj837u/KosxnpGAXGmONVbnWZuwkMb/b3taCPx7QuntfsUoEhrmj9sRbHWNxIlYOyJXRlTHWkkw4JpgSN69E18dOfIyuQvmXLZ/OL1NYPxHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Kutg5gnS; arc=fail smtp.client-ip=52.101.127.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCWwYOrPW2Xdf0tW0rAu0jZybHPVTTtMlgMZ+/gv36+2mLakev3RJ1ca1YvpqM6x6M5IXUcnQUvNJc1YnNHBJR0q02H/7AgupGzjNkPAmtsEU/4f7CVj7l19rziS8e2uo9Pk9yLazoMlaAMRC5bAqSkX5sVki1ys0C05jxUlCeQ4iqjHnjAVEfPYfDQLzJvU/BmxmAW1N6oM3ENgjRX/WpsiROM7Pg1iU3s8yjTTkcmuO8Yswf0pOWxXcLBVXVtoYiuGG6SG7g+s9vqogzFF/qrTRWsGjoEh9bT7AWtHAEWpeya+IMwRbjDFPmZ34xshYiuzMtVK7zSmhPAWh5W+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VVTIrMEziTapDz8Ix6tpyp7VLqsUTRQCvQlkHmtnBg=;
 b=INkHVhUdJNw9LMyC66X0ryKRKiok6ojqhr+LqXIKcXxe5X/rXy0i7sDqe9syyEO3c9WG/Imaa8we47FYesWWTE9nUcUJTwV8hd6Xzqq4KDmKXRbZR8DtWAoBdBtc6woJjV8uUHiQkBLf0Xj9d330H3ZOqOqVUgms7ieN1EfxGBm/G9qw26ssntzj1J6rwBuxi7Ut7ugBRFZZi52mx2Q846kDu0rTddbC4ytScTtpQhyb8CmxtO8oSZ/73Jb8yxgzrr21pQyY9BmMzQpYbSBWp75ZQyRCbVfmWytuuuDF0K3cNGWvpLyNFeFTENg/jo+ytDRAKp+5sfHggt/6n+E2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VVTIrMEziTapDz8Ix6tpyp7VLqsUTRQCvQlkHmtnBg=;
 b=Kutg5gnSfgzmEiflId745cqeoRH3mVEmrFrO417VQpkuNwfzbOi/kS/o6faTjP3muvMOJZv4IeEuSlxpupveCGDIB1skLeeBQRcxNYgmaXFcA+8zTnOwUeRbghoitvgFrlW9OpxjMvi5kSlQh80Xysj4dek2COFqkgk+WSdbOgDVNNThaLXC8rQNHG4ewN2yqW7o/jJYczPWJ91j4oTE1VJoPd9FZ4HQX28hiUCGQU0XYHJYbeCqGClwovW4h+1Z6pcpVQMdcqu1rF+4fcyzuLCGrUCDp1Q9hbvGPYw1LofEw1NxnpBha6qpZZ56ZMTcp+yg9TYOYXoaPmvpfLPGbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB5972.apcprd06.prod.outlook.com (2603:1096:820:d6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Tue, 19 Aug 2025 03:59:48 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 03:59:48 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] soc: qcom: use devm_kcalloc() for array space allocation
Date: Tue, 19 Aug 2025 11:59:34 +0800
Message-Id: <20250819035935.434121-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 841806bc-943d-4203-9158-08ddded4d717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?er2lCxQOuFmrvG4kQMoIi5SA4vbYsM4CABNFql1uJceauJ8xqaJcEXAde7ok?=
 =?us-ascii?Q?iA599VOHiH4A5QOhL5Vbg2ahlyHv66VmHsYh308FJAKDsmELEABBlD2E9k9p?=
 =?us-ascii?Q?DPANN0tbmqcjhJ85pfvbNnpX1PLPSU8QOjsCmT9YlQ9UIFdVsOCDOmw7RHpe?=
 =?us-ascii?Q?SWh5TgR3FXvUQeetM2NfX6ybsIgRspBrLxZ9XZvTARhlf8JN0e0FxSNTlk5h?=
 =?us-ascii?Q?zqVSQAJenwLxF3Q08wYiEJoRPokuMTZnp4haypEs26OYoNXcilgGutD+E5KA?=
 =?us-ascii?Q?ngzSMf7SWWFRhBeIdirgs4GebYKVLU8CgJ8f0aUE/ziFTjto+92XBA0+EHzL?=
 =?us-ascii?Q?gtTbOTZhQog9+0zuoxwM3VK0XnYpUWa9/7/3Xc96qK5ohy75xIhT2mF/KIqp?=
 =?us-ascii?Q?LBYyLwfzplbEPR8sZOyFX/C3XQXrDFDjNb8ymv61It+ZIJtdQ8cX4oZ6taxB?=
 =?us-ascii?Q?niruYDaG/tZDEaScMXVSIIvGTRqtyKBr/jU4JkhBLmp5c33JAC2GeeVWm13s?=
 =?us-ascii?Q?FP9LhWBGNQyS1nSyD8Ioca0VoxihE/DYSZlGCiGQTtN2mZcWHd0CyZapMnAU?=
 =?us-ascii?Q?F8oMk6Nzj45FyhZt7yJywpqcvFQpe5/InzjmzWHqOJp9QwYHntkG3y43pwYJ?=
 =?us-ascii?Q?m84YuBpYa9NLtT0pknQSroktW56Q2C/e6zU1kmL8fle5MlDzWhif/7R9D8a7?=
 =?us-ascii?Q?rthdjFMz5AErDtDZv6wfeZs8G0l14GS08Q2ntt89Hy9J6i+jOUe8DqoP6t/a?=
 =?us-ascii?Q?fSRqpEHXRVO8HPGnRfW5jv48MwTyAj3+72PUi7tIypZIJiWepkim1msEF3NG?=
 =?us-ascii?Q?ughCtv+2I/rQNN7CzI2u54gbXfXj5PcjZVrQG3R41lY2vxPTrlWSVi0+pC3N?=
 =?us-ascii?Q?UixrSeKx4teCUdW9zU9owezasBxtbLQML45ZVAznqs+9UqoKeLRoneX18y7D?=
 =?us-ascii?Q?RgHO1ulvLk+BwmaBLt8g4il6AshWZsXEqhM7pAsVH47BWLwdkUkrQm2YMqAI?=
 =?us-ascii?Q?mMAIih2CVtIycEO+GGsKg3DlYzmrt+BPj58q74F8J7OEcANjk0gvEmXhLyu8?=
 =?us-ascii?Q?EAPXUuOk9wNy+QM/oVKuZQed/xjmjRTiwVgYNQQ/YZMmE+X/NOwOkIIJ4QuN?=
 =?us-ascii?Q?S3puguzeqxYg8e0JFL06lnwFGq/Xtr/hfuo/mAWVO3guEKsAkOA5+7kkE0KN?=
 =?us-ascii?Q?OqS4pDQqEM/q2QAm9jWCoUHrw6I31GbmubJgfU7E+0WAX5pGjQp5EXGdo5dl?=
 =?us-ascii?Q?PaTkgGXrN7W2D8zuFV6bQKhV7/dDoWWnZn0NPCPfhna+JLrD4DXQwRMaeYgM?=
 =?us-ascii?Q?D+AJcXDbtPHZJxrJtNqVydPLJjF4aOLilhNcB6pfmpi3csIFI69VcGsHJTh+?=
 =?us-ascii?Q?NHxCGLvy1VJBUbieRx6RiGfHrTOLYI3ku6pRtRKirVgevSbWLNPEHZx0QEMr?=
 =?us-ascii?Q?9KxHntW9tVEbDgko8/az6Kh1IKTRJ0MkytkH2PHsuhpH4f+xqGzKq4fk8afd?=
 =?us-ascii?Q?9Wk5RHvDG+TV2pw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NMdslnEd5JQDTPxOvf4bT1hKsQC58JTqBZu9yAB3p/WQPHpOX6eKFJcUXrEy?=
 =?us-ascii?Q?5xd6wfVawRwxmdpA6buq2ibweJcmwMTs81A/ipuztNfyI26/4xSwkPKqtpBG?=
 =?us-ascii?Q?fDXLfFZ18g+o935pjstk9WvLAl/h/hSUiZ4iPoxWSSODErgwJJ3MdOS4Y9Vq?=
 =?us-ascii?Q?YbjumyHhJd0eIzGGkGBj40MDZ4SBwVvrHnk4ZfzP4yMm3fonaR/L83NZgIeB?=
 =?us-ascii?Q?ByLjlzVIhDP/ACEuhkjwDevNGDiYkHzKt+Z1Qh5xyKuZYNAaFXanWtDQdm8F?=
 =?us-ascii?Q?Hj6NFNZZ+L2MLhSVaB8JuoT9lvhiU5xp/2TJgsjqpdT9TzdbkS+Wikp1o+oB?=
 =?us-ascii?Q?JiqpLAI61VeKrjR2MQhoD5slq6QwQxsRY4ioZTruZvKu8phImK0QK0xQxgOg?=
 =?us-ascii?Q?n5sbnFO9+bfk/iT67oHym1X5G/kJSPDVArdnUMkSbHg58EaXdJF054q5o2iZ?=
 =?us-ascii?Q?htnMYdVpkJZJrNizqLno3h3CVe92Au51X7JhVKL1vAR8DXeoIUy6hb/gCvp/?=
 =?us-ascii?Q?oh4DOQFvHSmJ4REnkAdeh0iSJxb0ByFeX5PWka6eG4wBsBP2z6rLCr9SuVFw?=
 =?us-ascii?Q?zPyb8kYSjkndoIuCqeYqf+0vOYaiHUVaGrfZF/kfQUWo/Gb0e2L5gvk7CBJJ?=
 =?us-ascii?Q?la+a3agxOTRYFIjr8XUQU0PtGFOn2IjwMuwGoghb8TZdIVe2mokF8Fx3sc7b?=
 =?us-ascii?Q?eNWXwe+2nVxVMG4GYbm5suVfhcMI04Q57b2XZus7MRYvOdWw6+Hxgqa0HU0V?=
 =?us-ascii?Q?THlD1gpr9/F37X6BTmPt521utelWdUTb2Fk1fhyjSlJ4B2zpl7Ilj31QTl26?=
 =?us-ascii?Q?0h4i9wBNqQgZo4GV38JoR1ruFo5747ti1065T2SRkJNdGc9XAw9Y4L6hRjL1?=
 =?us-ascii?Q?Eweer3SakBgQCBfncAkUQ69LjB8udTsVWZNEo36k7W2LO7U/5wZGoUSFhSPk?=
 =?us-ascii?Q?uwkFKfuHFABXT5TPQMKiPUQq16H7x5Y72ifPPfK39MUOsnvF27DrDfhpUkfR?=
 =?us-ascii?Q?d3xW4IGhjokhvB0R+2jUAU7bJy5AzAp8FeY507QA+XAAwB37hxpXtOaf2NYW?=
 =?us-ascii?Q?kCXV4ulmApUm2LqN17lWwIr67elqbYo/e9di/4pfYC1usyw4tYT6H1L6JdLm?=
 =?us-ascii?Q?/uMdlwQfhzIqpbYNGiGYZBbc24Evkr8ASLodsnNA+v2Nrp5QUKQdT2kWuS1S?=
 =?us-ascii?Q?aeMFxvFSp9CiUeMuHj36x0UZBCtNWZRFbWlM1MQs2F5Sj+s3eFzfwBVDpTXO?=
 =?us-ascii?Q?eeShiGu+QwiLR5lUo1nybon2AH7Hljpn2jW8HiBIAP6jZnsHMCkgQHhpA9pi?=
 =?us-ascii?Q?HOFCSE8CBztfoTTsJsleVti8en8qHN7I82WwsLHg9da+G9HLsq+TG4L4EG2i?=
 =?us-ascii?Q?iFd8u/Tnq7v9YMQHGDaG1+hWq7U8uZAOicrpcesbJ5DIOWzRNmQEPudVEup5?=
 =?us-ascii?Q?xdnUuEeC+l3Jj3rnNjfdOU0LcDs46IHa2Agtz/HL6nKezJkhvURhP/dWXm0r?=
 =?us-ascii?Q?0KsoSOjMKo7qlRBb4cnRpmiayQPYuMfT1F4nuhhRHNqtfVYIW+vu0F9nLI9G?=
 =?us-ascii?Q?YYAlkbFE9mwKdJJH9smy/4r4MQHYoDHRI4zGLwAX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841806bc-943d-4203-9158-08ddded4d717
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:59:48.1436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcA5dKVTMdXKPao7ejQvFC10vks7oaoAScIjIotbxbdQ+tKcJgpjQ0LAnsWrUw+8n75DV1y4txG5A5LrOY1f3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5972

Replace calls of devm_kzalloc() with devm_kcalloc() in master_stats_probe()
for safer memory allocation with built-in overflow protection.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/soc/qcom/rpm_master_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpm_master_stats.c b/drivers/soc/qcom/rpm_master_stats.c
index 49e4f9457279..c7788337e164 100644
--- a/drivers/soc/qcom/rpm_master_stats.c
+++ b/drivers/soc/qcom/rpm_master_stats.c
@@ -78,7 +78,7 @@ static int master_stats_probe(struct platform_device *pdev)
 	if (count < 0)
 		return count;
 
-	data = devm_kzalloc(dev, count * sizeof(*data), GFP_KERNEL);
+	data = devm_kcalloc(dev, count, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-- 
2.34.1


