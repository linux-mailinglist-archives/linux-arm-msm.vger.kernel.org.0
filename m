Return-Path: <linux-arm-msm+bounces-30035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E12964566
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCE0B1C24C15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A2B19882E;
	Thu, 29 Aug 2024 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="SAsMfO8D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2052.outbound.protection.outlook.com [40.107.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2323B1990B5;
	Thu, 29 Aug 2024 12:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724935708; cv=fail; b=Q/+MLcjR5dDpIOebPr0DoQfN1kcnFv8MTAvESHHXVZ4gSPM66yXldPnlCPk+V8sp6VoM2tDPZkIFphHg5muLygIOrkEGlPbewPkz+BrPHJ9j8VkGwi2+m36ad5HjGk8wrqkYBDym6t4Q/oSOgD0UTiF+Z/uaeKYLqllf+BBXWOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724935708; c=relaxed/simple;
	bh=0/w8nP9812WFKhsk3wWH9VZP6ySOD7GzCcGhp7/L/IE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=u4b56ciN/vsVONOBQEmq7IDWDBxPwoAF8fI0z8A6whhJJJ1UrlDOlcvcy+EhQckplpcTuYPHh+MnnfwE52XEtaJcymG5SsD2vu/RTuQ6bOy6BTZxI2/GCarV3bHzS/F8pr03/3Yw0KHgmGMdvezTERg0U/+WJv1QqcGJhFgnb4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=SAsMfO8D; arc=fail smtp.client-ip=40.107.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yx3QriNLO8i+uv2xs/HJA1KqikH7RDwyHeA2He9K2m5ftbaKVJ5XEUhdl/TpCJBUHbj4RF7wqzgdMN5xOy0cBeGQ5M092yyt0BhtYqUE/4i26TAwEIG/GT0ROIeBHzLmo9LbpTdurKH0YcSBJQiACyU5XxbGSSuouBDj5KIEQs+c+mssgMQL4z1MDqS2g2doL+5GO9Z0BgkLvFmilEPAjaOD1z1fA8e9/byV9gRqhS6r3AB9kwnLTnsRd1HcbZdXOYToII0KeDZx7Hz8DWpPa7WqRkgdKFAwAXCyGsrhpxWKzPF9l0aIKtEN0vwis9BNmnjPd9vCDV5lJZqGEiJwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6K9alHTQFRgjUG7lKWR1CNkO5N/MxmT8ibizKrN+ts=;
 b=c1zLMgvZjDaUvb0tSNRt2tHpzBPRdF32PP8vQCAFCCdE9PJHqEYzzTbtEJRNh/RMsdciiDs9BnWMiyiqSqK7xC/exFhCh+RNY8Kh6QousCEXahJs2zG2XLuZHa+WVI8VZR9pJdORrXzdp+j2BnEnNx/622AmyU8DMaZyp5yaZKLuUN548MQ7C3LOsthT97XMNw4Ghxira/fziXii4i4hypdi6aPoGTf6PuRe1XKgwxFyfHGIkoPvNyTIuFTlBykfLdx7q0lTyoheLB/weebIOd3XyxAIHSA1tQIQwQa/M/SnaHyuJroYUr7tzNHboTQtWTf/N/dlP7oT45JxPxRP0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6K9alHTQFRgjUG7lKWR1CNkO5N/MxmT8ibizKrN+ts=;
 b=SAsMfO8DEJQxQTa9Hnd0bXxTU9LUu8FuRuQIe6e4eii776QMxJUPhMFdbH3uTPf/+nXxhhpB89wu/+dGOnMFTE8sBZ79j8BVKgdfUZEpyMAZfsMJG0wLq6TrAxqpetK/+JBaXqBgo3k7j30EpmZl/58ou2cgrhFjbXUO2Xy3unCPgoDZyUlswY0SNPvaLdwJBN1+E9/2UQlsh8xcO/PyED8BmrJIC//mrDBgSl/X1MUDQssRBwtBa1MZ/h0Bej0Bj7rhAXu8vsoCEMXOEq3LHLfEu4jFg7YQIKj/kDYACaBeqNS5nZ3ZLrWH5XVLkD/iAe/YJC3jbtnJvisrv3V+fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by SI2PR06MB5092.apcprd06.prod.outlook.com (2603:1096:4:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 12:48:24 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:48:24 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] soc: qcom: pbs: Simplify with dev_err_probe()
Date: Thu, 29 Aug 2024 20:48:13 +0800
Message-Id: <20240829124813.3264437-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0272.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::18) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|SI2PR06MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: 886da8fe-309d-4474-b005-08dcc828de97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IPXK7BqCWijf3R+m3rrFgVNDf14NbQa+d88m8wpLrhM/tDzZBYoFPDiFnrpS?=
 =?us-ascii?Q?Yqztz2fwNGdhqCN0bq61inYQgNTVL6Qj860yZN0vT1q82TJD1JevA4YTFmbX?=
 =?us-ascii?Q?FTbC+Hf+bTiKmuY87C/HBLNBgfFxkMkiQj6xPmK5/QOKgeIUX/O0oR49dyIF?=
 =?us-ascii?Q?fv4v/mORlrhOXO4tcXcifO7tiP25pPR6d5tAJuXPNdqYkYAObtHOYO5VueE9?=
 =?us-ascii?Q?P8xHEjH+xdYrZpbkgft3WmXsGy9LScgZ5yTze5JFBKRet9gRV+zBcBu3kk0S?=
 =?us-ascii?Q?gOFD1aDz53TO6KQ7DbwmJU9jc6naSAddg6gAfnGk6n/PICbXRabVLQHP2/xP?=
 =?us-ascii?Q?IYxZMN0W1ZUhY6puGjDiX2U/V/oL+lYPIvMl9sIOcM7Sxrr2zh2mWm9DLpgO?=
 =?us-ascii?Q?wqvkfrZyEOoLxlzT6kZEXz+dO71RY0Y3ioidlNJdoy0V+rM48y3KHeBvU5pF?=
 =?us-ascii?Q?cDX3ktqW/sCmVvh9zs03J6l8nZsjB30OS+orMVnGxnN+hsHNS9YwHE1wooh1?=
 =?us-ascii?Q?Z2v6yhjQRePXMxtb5xldbx9yD98mneNt0B/fdnTpH3q3XV3c6aMsdYqPFzeg?=
 =?us-ascii?Q?p9Ny6LbFTwbyTm54jHzAmqKpoMFBpKTUr+PukRBUnK63w6nA0r+YsSV0Acn+?=
 =?us-ascii?Q?c/75wpLt5+x/l1f/KUvciC7tKAPpDwMlozYhOgPq5e3sBIJLAHmPl7Veld6h?=
 =?us-ascii?Q?lze9r7JyBHFekMuXZlepoLdSnODwHUAnNHzwayOMiZG8m71VpQiozMCkAhKv?=
 =?us-ascii?Q?ZdulE00xXb8fpXzG5l0cuqg99zZWPYX3G34lcDm7Zzw8qlmqwpfw71+hLDXL?=
 =?us-ascii?Q?iA6CkewN58Xp4tXSRmmYPq8otiKH5kEz9g+qDWsWSI9h6AWCVfR3UZiNAifb?=
 =?us-ascii?Q?Zy9t4gMEpX09PPUsOixbBb+Xu6+8s9c2cOj/d8KVKh5/UoCOQxxPg3Nopyjy?=
 =?us-ascii?Q?5wjpEVQsmI5tOyflHHDKaIlGoPzT0tYCX/O48+ko51GK2BC2iJvVnhh2dbUU?=
 =?us-ascii?Q?L6BocZnSZbOXH83/m66broUKs++lTCV3eQd9qyTHhz4x3HFDBk5BZFqQptmQ?=
 =?us-ascii?Q?uxPLqIiFyxcnDUMkrAS9Tk/4vTTNoaCqd2ehk7Bkdb1Qto6ioWOrj3+G2CdW?=
 =?us-ascii?Q?ZTl/DZJvXC1bcI2JpoAnfO0xCLAuLfGZ3lM+trA5vNTraFUej6mYrz0jHqEk?=
 =?us-ascii?Q?oYgJAtnpsjTWc8GG5iXlVz9onxOYj5E3gxODFmC+WyTPbn8xazDfTvBIyZ8e?=
 =?us-ascii?Q?FzvorlwEEPQShN91U4bGqInLK+scbAuf0Wy5yOUxUfr7uIYw7ZSu1gcCmTUo?=
 =?us-ascii?Q?2SQPaArHz8iiX0imd/8HIZjeqSudFv9JNhqpcK9cosmd4n6odsbEbNLw6dhw?=
 =?us-ascii?Q?zuoD9qcZzqpwJYUgAS461jIsU1uzwuXobjzKLp65AVYxJlRe6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ToJbywOiZJ7WGbjNawGPK8Rku3RdrbvKhoAJJVm2oUcJx/1j/qZnq0Vil/h0?=
 =?us-ascii?Q?xOrsf3ll7W7Y6CVKg5SzMoyqHHEPR12ocAJyTWIOa1cwqiYiLk+vGD/qpr+8?=
 =?us-ascii?Q?R4kaxH4MQLqN5q617t0cAzsxYbuBkQVc8quf/6Aln/AWVEOvy1i/lq9UP6ss?=
 =?us-ascii?Q?aBuUCV6OcgdLQCApN8irQdvHbCNxT5dlV1zBrQtTBvX3Hg58x0nJIOsYYa7P?=
 =?us-ascii?Q?Wnqit+RDznOL/02pbfknewit14IOBkGfODpRdg5DodXtlcF3WODY8DbO4w3G?=
 =?us-ascii?Q?Le/8sgbDnKqrbKMDnKmaSGwf7YfOptlH20IWCmbLTYi9HUr9KpXp2vZk4KYa?=
 =?us-ascii?Q?SOnMVYBau8gORn17fRx+WxZeeq18Qid8JVty7Jc2gLD7L+O1suolQqIYwxKs?=
 =?us-ascii?Q?LIKpUmueB2GYBwV+LXufln5sX2Kf65XkGIZXvSjnK2jbn0kDDnFQ219fM9WS?=
 =?us-ascii?Q?8x1cf3NWcsNFCtnyILyEWMgpM2novoJEuUJGtpvImf2M3xS998SyziT2BFgD?=
 =?us-ascii?Q?qKjme2SosqMHKB+Y+eUSLyeRlI6lQlBWzfU27R7fDKf1++6WrzPqdrBkn5SQ?=
 =?us-ascii?Q?2Chj8DJq6uSEs9nos71sRgYqj72IUAnXpe722Jrw0MC27YTglFXh58qmAGRI?=
 =?us-ascii?Q?p8f0YhRrZFGMUk2ShoKnSu68NG+9hxVIokK+9ghMXncfg3j0Upq5vu8bl32B?=
 =?us-ascii?Q?lMeJRubpqTLebGN1oA1CkEDhJQuVNnGg8/gepYrOJENFsYoUn2WJB4nowI+t?=
 =?us-ascii?Q?NRC+zLxvXpCw/et/M1OsZT1vnkhgh1T1OUiXjt7dKdHgxlDOgO6BRhV7Srt1?=
 =?us-ascii?Q?f5C8zv91AqA/eUrdGihbUIhwvqvRx32YM1x45rZhTOo3Z/xdUW6DzS/yPSbD?=
 =?us-ascii?Q?fY7pmHp/eB8V43FjyEp2brJoz/DOnxkmbIhYEg1+LGd+TAA3i8QvO0h3SLbG?=
 =?us-ascii?Q?n5r3RdsQxasQyzQaFVokkkKPidJSwvQVw0lBtJsEtb7tn8cu6RELNapWPms8?=
 =?us-ascii?Q?aUwOz61nUmiHLmcjx2iVXWhGekJG5fZgQkDpbCm6QSc0JNEKzMEWjj7PByNj?=
 =?us-ascii?Q?vr+mwwG2DSOpKIAiEwSV9fVULycb04udVu8AeiXirXJ8riCFTUENPpPbMoXf?=
 =?us-ascii?Q?SXzbVyUXUJriWyoq4W9d3qmzxCF8Rjd+XPg7nYt53Y6wKwpNYOND6fu2nl05?=
 =?us-ascii?Q?EJRYIQ18wN9/676PjTw8FkuU+4Xcat8WgIBnTMwQCDE365nYlrRatjl+RClf?=
 =?us-ascii?Q?VzpT79qZzoQYHxc6btNEoHJn1nUMDmIbSsp+Oz9iGoVsx1GFbPj7mO+sdFmM?=
 =?us-ascii?Q?EgJup0HUbfV34LtnPmSNtRNyuq5bzcKGRGrvv5JVlWatSe8asrnUhMDIr+IJ?=
 =?us-ascii?Q?i38WuUn88loz59xfd2U/iLix2mjPy5qJ0CN80IMoRsKp8cRsMS7EQKivy94s?=
 =?us-ascii?Q?TAW+CC/GKSvqlgzbouBAWI1zKJO74TYw2Qh6wwVEGmjeviN+DU0myy4ORL68?=
 =?us-ascii?Q?ZL7J2lQyJHk1rbXKVNi56QQ1SrPyJNBpERh4U9dvhzX09bxZHeoZyagYvQtT?=
 =?us-ascii?Q?mMo7a16NJVKOkdzxQ0caqCKRCOKGFnRLTqYE1JQ9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886da8fe-309d-4474-b005-08dcc828de97
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:48:24.0232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FK2iAsTc3ekM/dAgls/GGGRpQbARFfq4jOjqg/RZsBqM/wawIC5i4bIpHjN6FABFeP+etKUBPR8HbTbdoxMMpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5092

Error handling in probe() can be a bit simpler with dev_err_probe().

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/soc/qcom/qcom-pbs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/qcom-pbs.c b/drivers/soc/qcom/qcom-pbs.c
index 77a70d3d0d0b..ab9de12ec901 100644
--- a/drivers/soc/qcom/qcom-pbs.c
+++ b/drivers/soc/qcom/qcom-pbs.c
@@ -201,10 +201,9 @@ static int qcom_pbs_probe(struct platform_device *pdev)
 	}
 
 	ret = device_property_read_u32(pbs->dev, "reg", &val);
-	if (ret < 0) {
-		dev_err(pbs->dev, "Couldn't find reg, ret = %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(pbs->dev, ret, "Couldn't find reg\n");
+
 	pbs->base = val;
 	mutex_init(&pbs->lock);
 
-- 
2.34.1


