Return-Path: <linux-arm-msm+bounces-29451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEAC95E7D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 07:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 713CAB20D83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 05:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5E658ABC;
	Mon, 26 Aug 2024 05:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Nosm46wM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010001.outbound.protection.outlook.com [52.101.128.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1975208C4;
	Mon, 26 Aug 2024 05:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724649212; cv=fail; b=vA9DS2UAft1uljmtIdR90mHO8HJGVF6UwkT2OHz9laDG9jFoFoBCp/qklGskcJfnO3I7rS8yMCoedW26jzC26iSwUw5ag60WNZ2vB5wqk6f5gJB61lUVhuvBQaAPtJS2kc5moHnv0n3Bkt9hXoKVSIYbKvNXXQWaz7jkkhjoebk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724649212; c=relaxed/simple;
	bh=wXfb3suI4rRlcPAg0YpX9vQLdgF/yY/21e8diA258rM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L0RjXRESxCtuxgR+vHH6TQ0lMfUCU7JmEIfM5/teAbPitaudftZVNaLGJTnb907WJJRATjA1udv40aDtRkdb7fcG2Mr3u6fGBWDH+xqrbOJ/UaF4jGicKMA5IyzOW+QF6qMmd0VHsV8xFhJonJhZ7jmk2Ot0HXlPJhw8Z+f/mCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Nosm46wM; arc=fail smtp.client-ip=52.101.128.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cx9oWYBVIgpYzORHMJYnM7ArNG3/oDS2hff6d241wqWpwji1kw5eX+MRAs7pQ20UedYDR2UHETNWxQXjXbvXyUvwcggjNYc6zLBtw9a6x3w5VlKnzCeGMUfxsQzavZGlwPZUI8ZLYWRkzaiFgatQXoSpOd+hQt1vNh4NdyBjBRqlYkPwEJhxjc39Pqe8CNH4ZQ74d8ip9rx+eTHsx9oVHbfODUNuLnNuZbArsMkap9ybbWx/GxYjXtW745AQhNTJ7O+aODiDiGUhTDGOQxu8dvH0jc57adupRPc4nXetB7JYsduMganDlx6bB2iSkMrz71zNDKwvC3G7/xSE2yPiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hROMcqqRnoZRZc2LirlEFY+V5DIrAHnsadq7SFa8As4=;
 b=liw6A5ATL7K6mIrT0nLII32B6XzOzya0RBXrK2U1TFBdATZ1V+rCn4CbJRUP92I+PLk7s9Q6fYmL1+TKlLD/kO6IyWtAnyDcYlMqRAwYhu+bgux+yllV3ETuwSOSZZLqxMdlSycoxziIqL69aHEsYgRIIjdTuG6YBhD0dWegFzw8U2UIZnCMnjKQr3Q3llu+F6hvr5WCtVBaBpUSEWTYpM+ZutNDYHwoJjScOo14gSbPMUpAV9BBEjjg3WrwQiQXJaV4AJ0mxbLqXOTHa1CKa6n/G+ahNV+LK00t427s1zrc/QO1h4xMZK7whn/ICD858aIyfjQb66NFqOWAPrHanw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hROMcqqRnoZRZc2LirlEFY+V5DIrAHnsadq7SFa8As4=;
 b=Nosm46wMl0xfPx4wdGavw6VWc4ZQkwkFIeoyrQMsRB+MP435/GwbdxqV7uFKgTl5IdRw/uTfKpKjl5scxy3QV5Ikr5yRcxYJgPCaoJ5aMHVzbqfzS4HR9qH2XYhYl3tRQzthIXRWivENrVuRDXQ9kn/LBWSmBY8VqmUhZEg3YeVigy9bX3b4hgxKEJQ6ZEJQh6IP8SoxTDsM/Qk+QmBKYlubdvz+7ylKn63soCSpYEMG1kdAKIuO8foT/nT1uYqGjFXsCthZ8v9c6Xjz3TaXE65O7OiBqZrAH8lB7BDcsXg5T1IwFByxzOgwLRPpm0RtRNBV1FtbklGHjHKimKZgjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by SEYPR06MB5964.apcprd06.prod.outlook.com (2603:1096:101:d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 05:13:24 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 05:13:24 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensoure.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] clk: qcom: Fix error checking for devm_clk_hw_get_clk()
Date: Mon, 26 Aug 2024 13:12:33 +0800
Message-Id: <20240826051233.1937767-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|SEYPR06MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: d65d8c08-4f05-4cef-a97a-08dcc58dcf97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N9OPC75XM3h9CPFIF2dzc3+ewuiuTZ5FAf4bkQsZU/fPh6f1QVHYFyxL3lT8?=
 =?us-ascii?Q?Nq8Tuamc1ZtAdceIwdjzrZ8sfqpB9YblVISNErVqu451gR1HZiBnudcX/g/Q?=
 =?us-ascii?Q?ZCpoXPYmuc2N3x1W2G1JupL2djsOLbGewZzHGekqFcqg3TUvQutFdzNTB1lk?=
 =?us-ascii?Q?5ALSV0X+7Wqm1JX9Stoj18kZRZt+I3GUL1rTagha64Qt33eo64ZoXwvLXtcE?=
 =?us-ascii?Q?TqAZWJdJA+19d37mDn+vFtVfbbE1wFyle9JXcUsYP0D+oL5dqCSKkYsdYEXI?=
 =?us-ascii?Q?Uxko6U4eYdrUHpCf90mvyL6gX3XUKbyY7AljlngmHpf3qp6p8vuL54fJIQn5?=
 =?us-ascii?Q?a0p7WwvwN3qwOI/By6foc+EUlO4uS1hYiajGaP4jOpOID2E24aEW08dLWeLJ?=
 =?us-ascii?Q?SxksYmkZaOg+mXH2k4vAcRRgBP/gdZDfx1DYiwJMIVytShgb480EdkrPcRIK?=
 =?us-ascii?Q?s/UzhZnnJmSRqiYCNXPPrwkYzXKXPD7NZ9dnXTyjGs+921nlwOi/+F1v/+ra?=
 =?us-ascii?Q?gJwe8HS0AmUlfpCvYu/68FUHbY/oVsE/g/FAgZNCNiVtJQiFlrldBPu9V8g1?=
 =?us-ascii?Q?L6o6VH8Sp681iM875E95VMZ6meBrZBIF+XSwivt2Zom2DbkKvlx9vzsbYwgw?=
 =?us-ascii?Q?QtNweQkD30bGvkYkpN4vNmGzBDLwI4bs7r94SJpfPnePJtap8M5yBq70Dus4?=
 =?us-ascii?Q?uU/xIsS0jagj6FVzYS8Z4WOo71aWBBr0oeIm9E70X/4R4HGE+5a4DhhXe3Ns?=
 =?us-ascii?Q?LGjFEQIcABeFWInX+Twt3m4T3j8LNz6NEzA/zDh9dFK3jig4nFox12E+rp80?=
 =?us-ascii?Q?JhVc3g893Spe/jHTaUADRxa6yg3T9AxIEStHzxUc6JWRP01q3JJSzuoZaUK9?=
 =?us-ascii?Q?JEuy53jooq+EBTb2rAHkYHK8Ztsc6OUbiTb0C3BJ4xpt1ypis/Nl5UBCahfo?=
 =?us-ascii?Q?x54XR+V8wNVghi4fQEyQ4eGfRyC9eY7saI7geIWRPtmXyGCwduRehEAX02yr?=
 =?us-ascii?Q?7gkRl8mm7HLWfx7c5cMM2NJouWjX9XJ5OKLuIcy4uZ6m4Ct868TRi8Os7mQr?=
 =?us-ascii?Q?lI9Xnmmpn6rlLqn8TQ+vrO3Q3m/Nct7vpdICVn/5bx4AUYaaK8tx8ZemxLnG?=
 =?us-ascii?Q?ZLV7Cq/+l3JMl/K6FEo1dnSwdkatnr0NmF3G1A2KxCqpsIz/S0hNRo8dalgd?=
 =?us-ascii?Q?8UMme2QHr6ENNGdixTGC/dy4LdHRi7AzsgKs8zAAxWd8Q17G5JOuCvQKZn/d?=
 =?us-ascii?Q?eYHTldBp6UPSCFpMhW8cj/BZldPArpb2/8nuQqh+ihL/r584M7KXWIeoMfYC?=
 =?us-ascii?Q?uRCrwnFBhduOgLtYbv1sBhKSrrf5cmtDNzbbPyWDfZ5aOjXxbfd0dht4Qt4U?=
 =?us-ascii?Q?66cw9Xeu2FcrnzISgGW/9vDMIwO+32TGNDFUl7AUMmtGyxbORQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cp2mF6lmQ7HzG6KgtghI7yGJd21Q8YfJ1HrLR5XjLev+2wIuPt/jnUkzw/jC?=
 =?us-ascii?Q?xHHLWxFUc3Q2mb5S2mB4tch5FVlVz2kUTZ0YdeiiACV5ZMqmiz08Yr0p1uzx?=
 =?us-ascii?Q?A6pYdIPtuRQ+Y9ntRfU8CJvDpQLrRMALo/BmQVjJopkbywDPGZNBLG//o9b/?=
 =?us-ascii?Q?b7meVqhj8Rk0gImKOd12lhUKkIRoibgOMNDdF6d88u56splPIcqOY6kRP6JU?=
 =?us-ascii?Q?Br2x7bGmSUU9XI7QR3l6aW3fBH7WDSZZeI1ETPaYgvGV53My7lR+XoWPnw/y?=
 =?us-ascii?Q?BtKX/LcIcNxEY93JFySWlH2Knnu0YOGHt8bczyJT3Vd+d9HNTK1SgsEhPN6h?=
 =?us-ascii?Q?NwP1BoQPb2mYY+QosDD3laiMpWRzgTEVBYYC1d9SjgfEEF5HoaBE9OnC7Btr?=
 =?us-ascii?Q?iOhlNUVyyuQjpzhUGCLKX9Iqpx3CRx1X9gBljMKJDJaw+Xui0g51xGIouVwI?=
 =?us-ascii?Q?AXo7eplJ+dkBEqaKAaJ/OyJaAf2oQDSVK4hvDvBAX7EYgAGGL5T/KKJM9vWV?=
 =?us-ascii?Q?CdovgeeRcAhZpc05eq8FpcKttFhHeeA1liN8iLW/4V3zS2vPLkqY3qxxx7Sr?=
 =?us-ascii?Q?EmGy7c+6N3DlkJgAvbkunIj8EFzTenve9s0ef/6q30PBHa7WPEhd0VSLuHjd?=
 =?us-ascii?Q?ZKtzYxEBmT303boYZijio/7uy1vFl+09QeUd5TsqhAgSCpHkUIINsLu53l8h?=
 =?us-ascii?Q?cIzaXCgmRfX8kQrV1xhn3h3ukZ3CQqZrk6LxPSRrszEllYn0Dc7O7HSiluNV?=
 =?us-ascii?Q?5GwVbnABfwqsw82YbX3gqKlrxkgR3TdG4PYpxER4px+O/WRYhbp77QMKHGtA?=
 =?us-ascii?Q?jae+HixxpxYhoSWQ6hF4wDdW1DBsTfFHLrUmQQoW2wufPpLc8d/F0twYHvWm?=
 =?us-ascii?Q?vngVNpvfNuuzm1UbebhH58iFEkkmw+Kf8yyU4NBtpTgVRq0YdW33cBX1iUww?=
 =?us-ascii?Q?1Y0N89Ml+CufdFJQXDQStzPzijDAGbvrxs0/3SzhYtmeEp1YkEySZHa4irOJ?=
 =?us-ascii?Q?HMIJc1c3j9pEROCLjJspIouxQns4F7vxIDdQ78jP1tdkRyVqLYj9oqpGjo3U?=
 =?us-ascii?Q?a9kZfKoR/rYk4XiLAjEfSj0twgfaKA9FXtJ9ytGMm1lYd4C1U7sY0TcVUGyx?=
 =?us-ascii?Q?WQyKYZHLDrGY3IU+ZQbo6twvLnLmW28qT27WHDfrq5Yck7OU/ZYPOYhNgAR4?=
 =?us-ascii?Q?XgKMlbH+XinbfhMi14qDPtpOqT2cI2cHVv9eZjCGjwiTZrmzUz7DSINZXGqR?=
 =?us-ascii?Q?bkXT2dPo2tFqBsdqiReBLERlTORQokSapi+djtu/rYHmpEGF8K9jLYu+5al0?=
 =?us-ascii?Q?uNp2W0f6GmyvXPas5o05AD1LADsitPFP34VKMMECi3+HTQPQVV32norENAWA?=
 =?us-ascii?Q?mozl3pUN3zaLFq2PJ7VIOWlK0wHBlta/w7osV6RY286E7u2PjiVtPkLQXuwh?=
 =?us-ascii?Q?m/SP0GM8mvFg3zUONl4M6x8zFeh1DlJ1xDuqLWViSHkbmkr37I6UAeSgtfot?=
 =?us-ascii?Q?AmWj8alfIfZzGpKeJCRZqGbz2VcoyHTupw7u/WJ1IgFKTlHy/bwthfbyBGUa?=
 =?us-ascii?Q?0j0shHHrRY+gkaNXNJi1B+9MWyY5eHQgyc6gWLvQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65d8c08-4f05-4cef-a97a-08dcc58dcf97
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 05:13:24.5665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxBtozLd4MBKTFNHnHf/11YVbqf6PR7FlDoAQOTfgqarYsP78ryfKfwbprUdJE5VfnWk1JCKNA+fvCq4WccR9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5964

The devm_clk_hw_get_clk() function returns error pointers.
It never returns NULL.  Update the check accordingly.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/clk/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d..69c7876fac23 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -273,7 +273,7 @@ static int qcom_cc_icc_register(struct device *dev,
 		icd[i].slave_id = desc->icc_hws[i].slave_id;
 		hws = &desc->clks[desc->icc_hws[i].clk_id]->hw;
 		icd[i].clk = devm_clk_hw_get_clk(dev, hws, "icc");
-		if (!icd[i].clk)
+		if (IS_ERR(icd[i].clk))
 			return dev_err_probe(dev, -ENOENT,
 					     "(%d) clock entry is null\n", i);
 		icd[i].name = clk_hw_get_name(hws);
-- 
2.34.1


