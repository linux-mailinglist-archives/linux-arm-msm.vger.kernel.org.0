Return-Path: <linux-arm-msm+bounces-29532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A9E95FF5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 04:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 283E11F22F03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 02:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB2516419;
	Tue, 27 Aug 2024 02:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Cl8SYn75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2059.outbound.protection.outlook.com [40.107.117.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0DC8C7;
	Tue, 27 Aug 2024 02:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724727208; cv=fail; b=evXMuTerQU4KjkY6dtZH3BRid130TUSh7acLnCj2s31cyUtji8mZuDU0Oxi/hDQW32CjQe+8P+Pz4fH1UcH2+a/UZUPhb7MOQ4B9ii+js7WSxNWWD4Eg5lqcj+i4lY6lXVE4aTOAfNmX0P5qN/dGMKizunPpJI5DX7tAT7rg+YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724727208; c=relaxed/simple;
	bh=YjifYliBA+k+1OzM2i6nQSX5liTU7uN4kVTi9NNf58k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=s43Ivfl0dQDelZW8TKp3kHAHbZ0COTMnp6j90a8wIeTbqBkiRrwbhnSZmdP8JLxJkTeIa7iDazRrqeTQk15bgcasU9NNAPMSLJD1/ZH0vvqEbjUPONIcZ9J23ITxn6w4WK7MqrLl1p+5+/0JaO+E4bZ1viCEy8TSR2aFlyXOfqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Cl8SYn75; arc=fail smtp.client-ip=40.107.117.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYsIPB3wTvFmutkzFScmnrl3EGSOZB0oeX2IYQ2DGaj4iaCRrK6t8zM8sYrNVVNjr3CONTXwgub901BIaPPmHb4Li/uigOWMbtIoxpZaNqIhpCzWfLuG7yu7YLn8kIbhHtdREug1+qYtwQShmstz8FijRhmmruO34OHkwXWzEIvqpZ/Im171SIX/KEonmTxi3nGPd5e/H3GZQ7NiN7Sdz5RV0V8Hiq6rXaN6ckxy6+65cJpTKg8nPkDI5bqGrh+cDh5YvYflb22Xy3zQyB0owrc4AJHRFtTRIMDY9NzVVotE27vya52AXmqF5vSY+s+HiXlp8oXhmc2ftAZw9ddDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXjNNlOrxivxZXJ9+HCj+ECo5BRpsI/aH5KZAvimvMQ=;
 b=IV1JfTnp4TI6HDR6xn4KxTNVbOsInf5yA2lRXRuqbNWH1Wv17UOeL3wXEvPZ4dyy70rTPQDlnQTdas2EVcVxGZOd6o5q2VhIvkPoCvk79501UzsA5J/Ois5J8YQ9zMDUCJQkJyAiUkHvXATzfhj7yIGbcUB5COWDaODQLC3WcPmsBRk+KUQDKUCdMizLD8eKfEFG5lkON7IRbodX+9ZcCdCb0lR6hso3WYwQpfd5Iwf/MaQyz1JHPdmlvKGm0tc8iCZkYLr9QNOc9waiba6eSJPFCNRn4k2vEYkqTC7LxJBXjsQsp5OX7YfxDBaktcIlJKjjkaN2wT9M2M15yTot5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXjNNlOrxivxZXJ9+HCj+ECo5BRpsI/aH5KZAvimvMQ=;
 b=Cl8SYn75XOhgW1J8K7T9FUK+Y46TwkK7HYSce3bk0sjTyK8Du1ASXbXMHe+t0tFGhaBU9bnYjOd7lcjmA0f7UF/H7ZHWyAZfjRcLfRGcZn+B1b+Sj/CCSjjq2I0KUibPg6GcUXULhdAeW+pdBRa6o9+XLKvT1BAeGVvmzOKzCb5tqX/4/nRvrAykcn1Bkdwv+F0bcQguqI/GR40qnPmsxnFoCm2GJ+b5IbBd76ztpz/6POHo8ZTJ6Z/DmQUDPqntkgopWN8FDIDTMClkFsMtcDjAR7khPbXnC+xhmh6JYDFDBY4ge6IUIMCLyCabWdt5KF9Ahn8umtE6GiqGfQbnkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by JH0PR06MB6582.apcprd06.prod.outlook.com (2603:1096:990:38::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 02:53:21 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 02:53:21 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v3] clk: qcom: Fix error checking for devm_clk_hw_get_clk()
Date: Tue, 27 Aug 2024 10:52:52 +0800
Message-Id: <20240827025252.3512746-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0145.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::9) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|JH0PR06MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: 7acd42fc-dcfd-469c-a3d7-08dcc643697e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?czC7RedaBi/pteel10q4Pz8ZsrJQkhV5HpCHPYVxB9zSJtoHUwQgnBoghTVZ?=
 =?us-ascii?Q?LBIerbzYzuBMtZvkZchNKshLmwG/qm6/AZaU4zQDWWV/Z4UifSyJJefraigE?=
 =?us-ascii?Q?Y+qG+7H42Ap0zfY40vW5oxxxUIuT3bzq0FQV1cM6q5vYd6b7w7IuHSg7YmUG?=
 =?us-ascii?Q?v4QtrJHGAdJohav4oe3KDgdaOPp6yUlrgznA2vKICx9ZXao/FpQzN2siz2mi?=
 =?us-ascii?Q?J8trq8DIvCrRs/o8EPPUUugM+IyvV1K7v/wC6Ftv2xC9H8b0MpHrdC805MvB?=
 =?us-ascii?Q?TH3RJG+x9uNcFRvZKd7zJ39xXLHk6IpgoR4wP6kkdnK/gXsED5uzQdqV+qa3?=
 =?us-ascii?Q?sYCFht3l1SvssBXhy7ezu2080bRdz1mjB0dHp7lxuLICPYkCdSdM4pUpQdSG?=
 =?us-ascii?Q?m5tI7oGtlR9sOjSpwau5zBgNmwANBzjqqI3GJt5GcKVz6F642l/E99sAJlw/?=
 =?us-ascii?Q?Zzl2NGQgXj1r+dDWw9WUdkCsBdZ+eeSFh452SjhmJiDP4ukenh3ry5i9bpHM?=
 =?us-ascii?Q?CUjIwivynCs/s7G+GqWHMwDo0LzYsYaV9bizysNZGtBSl3u7VJ3PzdUKGKNL?=
 =?us-ascii?Q?8GGBz08qTV4ASrTbqGbTGwLYkdOGfiR2cVPpWFl7yKdMz5NJ/bQglc5NJQZ9?=
 =?us-ascii?Q?3gcB3XmliCzM2Fa6epw6nQKxxoWXLYXGVYy6O77TiAGkzskOwrZrEWvXr5lZ?=
 =?us-ascii?Q?xoqYelxhY+uBtdI2UcuUWd8FElro2vufLWk0ndrfX+I0MTbyppZbgtanjisW?=
 =?us-ascii?Q?XeD5G6Se7Dwrkkyqs8PucW8CL06mGpS/ADWiDfHmtBLWOvedJq872PFcjS+x?=
 =?us-ascii?Q?H6YcMQbnXFwn3ZVh/erISPn6jtK8Ahpz9QmsImUgNHjjLcPLon+bRquUQHUu?=
 =?us-ascii?Q?t0VHpmmJlCilV1jYRgPJKNsB+n1elGvmsra4JUr+umMC+MQM8MO0P3RRLYJd?=
 =?us-ascii?Q?LE4yDZMFWcw0WfSrd3PdwboNZc+pJC1Li69rbef79KX9LJam7Dtufd5se69I?=
 =?us-ascii?Q?R6xcW/yqdqyqjmqxC0TLlAKufq9LjMFBTIrrfdMnmFlG1ProC7fcOEqWt9sF?=
 =?us-ascii?Q?Pd4Ivmrv00KAR2vmYj6tgHVZpcAnA2LvLU7XszHfw5g5LIYfwwJJsVSYySsK?=
 =?us-ascii?Q?UWhsqHu/y9I2hKZ2OHlE6Y01w0DCO01QYTAVSg6YwQbE+c04Mv4vGVJe09O6?=
 =?us-ascii?Q?bwNIekMXsCvIwGKLf8h577WsoK3LFVg4h/769irZwxJw+tGrq4RZz8HbFzJV?=
 =?us-ascii?Q?NKYxveu1NiY5f6VpJWY7e4CtR+eKoYdgr79IYaTB7Ww2pD8ipyY8jMUfWE8c?=
 =?us-ascii?Q?sYSwGyxLH66U2EfajQLKVchBL8rFVp8u1MgM0UKpfBAZXNAIwINkao80+BQ2?=
 =?us-ascii?Q?wUCYzpduAn+u5yzy9PU8v0GpVwPIxk9nUf1VzVVrG1zwyy5+8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BIQlh5DUic3SucBau0qcq2wqGTOyC+jPLp7s5qliZ7nZFrpMWF1yWW4zMvzr?=
 =?us-ascii?Q?38y0Y5K3GiCuEB3Equp78GAcnFCmwJDSiJ78IzUujzed7b2lGwmpdFxhhwM7?=
 =?us-ascii?Q?dsf8rJDC6TjETT0LfJXGZTwqIXVKWoQcnu4p7Pc58DZ2EKch7VJrDhPIpBgn?=
 =?us-ascii?Q?z+HO/YwSOc5aKxI4jeGTMpHvpZpAP4oc3pwq7lR7mUkruFqGAXkuPkJC+FbW?=
 =?us-ascii?Q?aGRzuruWJzP15/+vT5exflZH7lJg/3iId8QNJ4Mr3HzusQlshZkQ6thyuCGp?=
 =?us-ascii?Q?1H4GS5ZhIKjjW2H5qcExmDkOcyhwjiPD2QZpG+FPx5HYLFlSga/yFPtrErr+?=
 =?us-ascii?Q?TjK6PL7yCyOdmT2DWBbWYBbUYkl7MUoLzUidszc9TOW+K46ujQj7BghylY3W?=
 =?us-ascii?Q?V61oEaLgdhYGCiHfLm253Ihr0aQOGcj+lJGnstRH6xghSXxrSRnLGOsdvLYm?=
 =?us-ascii?Q?YmZ+i5i7deyU7rFvFYoDff6RyIt1yOkBMypPTjX6yykDCiWycqR5Rst6x+8R?=
 =?us-ascii?Q?7zv+R8rbKRxL77oL6+tdADx80Z6AoIROxXGRSXcBa18+gpmxZ7N3btAGHzdJ?=
 =?us-ascii?Q?WdExz+enNew73tauOvfFV1zizoUl7UmyuP62+yEHZkevYex7LWywjDnNxDF5?=
 =?us-ascii?Q?KKPTKqZwdjFFCuJpJOY69/Xj2xZEWpiDqnCkP7Uvcfcup3Ou1+M+Z+DPCFcL?=
 =?us-ascii?Q?fF4Hiy3clk8pMoG6jzpRFH5BWWGytzrq/+FQ99YJICqpxCH1oZUNOjJx61d3?=
 =?us-ascii?Q?9x51UuvybixJ0Zfby8FIbiyeq7IJETM74uotd+Sfq40mUpcHAaI7lLmnCD7h?=
 =?us-ascii?Q?df2uk9Wh6Dg/WY3e/T7JC9WM5cch0JRkH2krC4hItSSljJ/1G3oSpTT846cs?=
 =?us-ascii?Q?Vu/+Q/B+2oaQyxzNY5mneJpg7wxiUbWo4VEPWiDlj3tcBF9w1T6SaQPyDU9I?=
 =?us-ascii?Q?ht3W2YsWKGQD8/F/T1ksK4yIGpG8S8w+x/TFNsH5ns1bwp8wBoCCNTPLg+KH?=
 =?us-ascii?Q?bjFpWchbvSlaz70l/u3MhfG4GcDpT1CfW8uhP8UnAqVCMT89eHhKTT8L7ZAX?=
 =?us-ascii?Q?j0PyYkciDVztcdcQmLHpDDjQrRMGW3lDKyYpIhti3h4E7j32h1qzIiRzMotL?=
 =?us-ascii?Q?kYnVb6HPcQeUkXGhYdtDIEbq8CO7wR0iRU8pJHahAxuYPTzRDcpwWsXfl0R+?=
 =?us-ascii?Q?iTHw7loB5Jw7BRGKAOEz5KtLEVKsV+gwC6kJnZLFNKwv6TK1ayBmVQqWJuBG?=
 =?us-ascii?Q?Cs0xp4RiGWN2c0JWK9R8IFgdpNMVxU6l+Jqd6Uz3NstOR1M6fSgcrqkGHJT5?=
 =?us-ascii?Q?FKX3cTbCV60Bi47fI+T7tlc0G9PdWQJgC0S9xZPSdOT7edgyc4BRVC4oFpRL?=
 =?us-ascii?Q?q1EF3VwgxRyjFsLDN5JplEjpib9gB1MvfvvmHXuou89jhAYqDauviOmeXAsx?=
 =?us-ascii?Q?di2MKQhuo1CJgl5/6G/sv5LlzP9XSAnt62cTyw7wGYj8kirYyJpf6LSBNpSN?=
 =?us-ascii?Q?O6eZGAOLwWx6fgJJu4koXVWmbAWZAEnVhB1KcGh/dRqQk8CXIHKdEV3D1gPz?=
 =?us-ascii?Q?9eMMmjplKdSQMaHucwjuzYW4E/9CRIoLQaNb0h5E?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acd42fc-dcfd-469c-a3d7-08dcc643697e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 02:53:21.7529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHZ1uydHaAMXZKM5c1awhB5QqHcw98sWpMnAzesIDInjOL6m1l9MmEtCZ4le8YR4MKcSWFAOD2QRsyPmUz1KHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6582

The devm_clk_hw_get_clk() function returns error pointers.
It never returns NULL.  Update the check accordingly.

Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")'
Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---

Changes in v3:
- Providing a "fixes" tag blaming the commit.

 drivers/clk/qcom/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d..5a9e653916ea 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -273,8 +273,8 @@ static int qcom_cc_icc_register(struct device *dev,
 		icd[i].slave_id = desc->icc_hws[i].slave_id;
 		hws = &desc->clks[desc->icc_hws[i].clk_id]->hw;
 		icd[i].clk = devm_clk_hw_get_clk(dev, hws, "icc");
-		if (!icd[i].clk)
-			return dev_err_probe(dev, -ENOENT,
+		if (IS_ERR(icd[i].clk))
+			return dev_err_probe(dev, PTR_ERR(icd[i].clk),
 					     "(%d) clock entry is null\n", i);
 		icd[i].name = clk_hw_get_name(hws);
 	}
-- 
2.34.1


