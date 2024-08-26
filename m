Return-Path: <linux-arm-msm+bounces-29453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F5F95E860
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 08:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9F1A1C20D30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 06:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFA862A02;
	Mon, 26 Aug 2024 06:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="AzoZuyGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2082.outbound.protection.outlook.com [40.107.117.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4314205D;
	Mon, 26 Aug 2024 06:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724653114; cv=fail; b=WLKR+22HAX+WFhx9fWXS2lbk8KOmXrP2gi5yiABCntnBPzJ+CvVcLGuXAY09PM9Xrjk6n2I+W4vbBLUEcZX0cV21K80OtOX1hO0FLjuUMfQifd5N9eLst0ACT7ubPdTLRaR0b3M6BinyISKROEL3bbsf2rWqxFwrMtdvyl1yMmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724653114; c=relaxed/simple;
	bh=jMySBNQCp4fXlv8TkV3zGKAS2+VPqlaPr6I3AJID004=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F/i1pocLlJlelPGjUI/8VFpnmwN0UWCXKJcsgnsi2aAyrDDBbnxAL8Tb2cBpVdHAGekgOV52qGXS0YUFCvqqATy+ebcGXZypb0UvXhFvAsmyBOI/YZQLHtQgyc2de5XHAe75qBLiU6EWcKKaISS15w3fSrvrb796bF4F6iSTFpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=AzoZuyGX; arc=fail smtp.client-ip=40.107.117.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/Yc/UUYq44iauS5cNI1JED4SquH2KmYhQJCPohv2IfAShaw0d9ZpoBSED3vHjT/Qeb+VV78zBXl99Fi19AAAwl7X83Qzw9DFG7jwMkK6FpCYtw8tTqe2eJzzy1L1lv1ZFCZ3QT2cpQA12J0nSBxEPp3ceyq9d4xnFqOuGgCJjuJFVNNeaAGgSsNArlxBO/vP8VvnuB4kPZgsqHphvywWJtJ42mvxPLQjhPpZzUqT1e2iT144U65+f6KEKroqf+CwN7wwvgxX5daWABoEA0Wl8i3HNJ49N5Rq4htdQ2Da/fdFQAAQ29sp6M5RR+gi2jl/qL5yKn+jN4trkbyBNixhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=of9VVz0fAWQ74odA3V4FkfMBc1KOPs7k0Qsk3nIpfCs=;
 b=QUjzKR1wlfOb3J9kOd2jh70+3T61yCASoHs0Rte+K1lWepibBFVxgpjJKN5G5XftC6a4IZAPnJTMHmSNDG7nURb6qkeONG9R8KzmBrItTRzVdWw3qArG4vRCW+EbopOPKmoi74xyNSJaQ6D0OIfK4lm3SqDlFR7Fzns48mjGkwYNz1FH4SsIHHCu434lqNLjeIDg9wbj95b/Wbff6V3iCIJlMR8Nb04AFD4c9z8GC+c1gcfiV64JlCB6yFtI36U3tOHJ0ZIZ7PahEpsZpP81R3e/UBvbI5p49/WT3Lr47qYYLjkLgy8ZsrlLC0OPfiPpYcPPpflF7wxEXaMtxeNcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=of9VVz0fAWQ74odA3V4FkfMBc1KOPs7k0Qsk3nIpfCs=;
 b=AzoZuyGXAw0/kLvHuZejkuRkcWIqcCIwf0LbSTvouKF6nqro9Ubl5wD1nRyteyC2W6mTQGFvtFtYy9JykweFbEMQRIScvYVFWGzjJUj/bXKspv12fuQ7fOvBnxNjcRXCBLjjc/Q/CN6+v6o3ru9KehfP+VGK3mhIzGq50DsbxEyOSsZlY+NkUzxdNTlZGzA3Gb6Rw82zwRAJjJJKjZ0nan2zRinWdveMNW1zY+C67kzrmAKH4OXRShpu9VFC1yy/5zA92UY45Coq4R8DZQ3EN+CsO3d54u8d7gtJkCoQt3KyyEPzr0FiGcm2m49RVd35g2G9I8mDtB+SdgnGXd+/yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by SEZPR06MB6975.apcprd06.prod.outlook.com (2603:1096:101:1f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 06:18:28 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 06:18:28 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensoure.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v2] clk: qcom: Fix error checking for devm_clk_hw_get_clk()
Date: Mon, 26 Aug 2024 14:17:17 +0800
Message-Id: <20240826061717.2016126-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|SEZPR06MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: ca8e7e74-44e1-4097-88c8-08dcc596e64b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IP+hAfH0xt1cjt8l1mpHVHYyuu5OOhiwn0aAcAwIiPrLLkPfu3IGsfvgb1MH?=
 =?us-ascii?Q?3K3NIObNyVfVMohDKoeRyN7ZSUQlJvd05tJ6cXFpVSxvDi20cHJR54z9nwY6?=
 =?us-ascii?Q?kpa6wIGzvQO1eDtLgrHtZw1YLkYth9ci7EAz3B7Pn62rhDq/Gb+rd0aA4E4x?=
 =?us-ascii?Q?IbBejU7hfpeE8BvM0kdag/zi9y/zmZGKzgBV4vkGzDaxUSUvWAtG3EwOOInJ?=
 =?us-ascii?Q?kitcCPh6lxNw7Qv3+qNe2zcJdXdG73RN8pOjEpsHxrjf2/dNx8hPByRs+0EK?=
 =?us-ascii?Q?Yud8+1HAw1rA/ZAQ7L4hQ+B3d+kyYfyEHfuJETxo+4BDleAIAJG8qZBDmFfz?=
 =?us-ascii?Q?SUg7q/WdxYlLBXfKm/oD8Q6xA/fvUa5BT3G+AnQJYORbFUo3fTM/OWp+3kE1?=
 =?us-ascii?Q?qfg/A5OFZbFofKgZrYKC5xzHcMvh8kThWKWpWMadZWG8wR6tD3qGYr4lKSN+?=
 =?us-ascii?Q?3of1+xCKzi9PUDQ9bpL6MQ2tE4PcdMMNWQ24NOCj2ADemh6To7pTqwLl3if4?=
 =?us-ascii?Q?EW2CqKztAnCU/G0LwnXIpexzMfQwb0ymEAcHoNXNiKXf1qyr8qpbKjpYN0j4?=
 =?us-ascii?Q?pHLb/GpeJ6a0KWn9RlgmsXXTfLThcApd8r+5WZxRp6Yr884u1LQiW5lZIYDA?=
 =?us-ascii?Q?LpnMkR3+PUU9g6aDAkRgODYWDl8qLq0yG5jH21CkdOIV2rAhET/9s12iWA5B?=
 =?us-ascii?Q?aX6nkpEXU8uMwZx/GHK6TR+FUhprc5/ZNbyys8hn+5/cDbs73U7BLFF1uphW?=
 =?us-ascii?Q?XF7NwbGJBBS7cB4bBAsO7kJ4SLuVEagXXQzkG3Ec6oQzj57sqi9r8UcSrNjU?=
 =?us-ascii?Q?Cp19n67bWItMdWWH83iwQIZFrBtOZhO16QiQi3LygDQnefVpru4WBtdZsqoX?=
 =?us-ascii?Q?dMHlk6hssv/kpxaLLV8B3P1fBnl6Zi//CPNlRH/K/0K2a8YISRWTN9eZewl0?=
 =?us-ascii?Q?+GrrTt56MOJ8gIJQFjDjZN53Ve22Q9mj6dHmfDb1RkYZtdpO2H4OPxv3/Xkv?=
 =?us-ascii?Q?9v0YCTnFA8eNNGD8OpvvVt06mj3wdCOhWo4NC6UJtoMEVSL/7LxIqb2TbSpz?=
 =?us-ascii?Q?QZ6esM68qvoxMkMKFiTO0UWB5rxYbGQw8KYVkEF9XyYZOZQh+qjELBLqhaGs?=
 =?us-ascii?Q?N5J3a4N0U7m1eJofoU1j9rl36PF5UxjHLjtjVQAZmElBR3JnwrFlUW22kou/?=
 =?us-ascii?Q?xiKJUdWTAvPz7paOBEDvH2y3Vso1Byg2IBjv03gT9oib1MiJ1GfTaJwE+Ywt?=
 =?us-ascii?Q?3rZbYCx8qPXCMUDnpw5FPBhFvSVQIqowOJoWM42bycemS2xNTr7wKXd1rpO8?=
 =?us-ascii?Q?GcmSRjO2XoX2A3TeY97S5a2bRMs/WBQgEtt179oGfAoSYMILK00v2Tw4KetB?=
 =?us-ascii?Q?6Tbt9RUgAiyQtrrmHn8E49rztlYYMbrQJAEvcSHsUGsJx11iRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O5Ao5lGDi7/1FZBJR6sqg9TDsi72oVFmqFZpLb270e0yq4LH2zWL+kfJQkn2?=
 =?us-ascii?Q?5RlCWC4d9B8cVCv4mnwum4+VizyNzvSdBPjP/PPwyEn0ko2cuHYrNNGdXBEO?=
 =?us-ascii?Q?sXx3OmA0XvofFiGh7QfrGKY4JLNxF1dHj90Il4FK1cYO8FCP+B4HqV+STyop?=
 =?us-ascii?Q?SmyZqzJrb5kVhZuIS4MllmB2qweF/6zOThMNiA64BPJ/ja+atahpsy8vDREu?=
 =?us-ascii?Q?1ovkpNZWI8ljqDuF+Co90k/lO5lPYid/0qGGdWXDRYY5KDdZxPNfsXK/Dufx?=
 =?us-ascii?Q?3ffJakVSJIvodlXjqviuDQUwRP4LTYVk71PE9W5GownoC7wB61vdBKk5EDLa?=
 =?us-ascii?Q?d9aSsqd6S7yin5wfRmQaKIEtIH9hfwmysoH46ecEqa+Hl8HbCRDOB/saJe3s?=
 =?us-ascii?Q?5OwsVtOQBVjzNqbpRv2OxYbkgeRSPXIyOIS300z8VjJXvKP8rS37hfdY1WNT?=
 =?us-ascii?Q?cAkqXk/+M6z+TpbRYt7feU3z54sXzcLaxy/4c0wotNQdLQbWemKQDITj2icF?=
 =?us-ascii?Q?GV0oZasgzfO6je5qkjzwkMIrtDdCfPnQkNc3dzIR8k9XEqPq5Ogya3ohvikP?=
 =?us-ascii?Q?RYFBsyWn0XKaSlO3D9bRsTKxLHXLgaqmEHa0EF54pSrjDI4YDQcdfYH4vmaB?=
 =?us-ascii?Q?6/Oq+C7bzmcdxTaQsWW8jeL5Mg1/CjNpzqxoqOUP3NNIuD/BLrPb6GJ43FPN?=
 =?us-ascii?Q?A4SxSqBBL8znxhvdHm9MEeMomyltGcXjer0jUQT/37QpDL67ovkWKf/f4tSD?=
 =?us-ascii?Q?gd4j9PFfJXhMjeogjsjlaY11MApu4y1DVLMY1qeVvGCRwLJZqnFMgXt8RP/Q?=
 =?us-ascii?Q?P9I1H1RnxT76Xa/A2/26GZMeWNe4DqhanaEY0aUKzmNkwYVI+NGPxtIl4sxt?=
 =?us-ascii?Q?hFQZnXOMmqydk/uRQM62fTUDgcdcxBKueCSd4Mo5GeAvKgTcZ8WN7KCTh35s?=
 =?us-ascii?Q?n7Lrzua7hBZoom+TcdRFn2b5XKyjA05hq1eOktQr3ifPCXIUaAcqQOm60xAj?=
 =?us-ascii?Q?7Mt0NI55NaYdDvVbNNWdG0z1Ra5ib/qm0gNjpSaLHS1vQBpyg4dxarO+nevZ?=
 =?us-ascii?Q?2Fw084tHlWHn7izw3k0rhZKTd2JKXFLGRe0J/G9mkZAinMJirg7odeiqzMfN?=
 =?us-ascii?Q?BkM/t4RIj4EaKCxmu4hDbqK7Gy3PFbfdVKCQbvwhmVlRCxVTmf6kMAYmoIbB?=
 =?us-ascii?Q?bh6RruDXzL9Ns2/9Id8uNTPOjH6NuAdzKEdD5DnNz+K3YvMqfuRfjmKkfExT?=
 =?us-ascii?Q?/OIruL4Syy5i24DUIoMuW37LaJF5MZCd6P2GA/rVZtM9/Z4In7xcOdw+11fi?=
 =?us-ascii?Q?k8VZ7G8rXzq0PCCtQA+6Rn/OjRCjx+9k+awQ6IqHboTAsFhnb2l5lxg926zU?=
 =?us-ascii?Q?qll7PtFqIT09IRNUyEuBeE2EJCFijbwXyvahFD94JvBr0Wgu4reCwfObCBGN?=
 =?us-ascii?Q?QcDAyHD7UD7wp+CazUG7Bmkqbidimb8pUfBtt547wttrMOi+1jZWO9361lYs?=
 =?us-ascii?Q?2VMBzID0QMRY6f9uQwEkviCD5fra/NGm8ts9lmuqGpmcRGqy5QJDCm93Xrex?=
 =?us-ascii?Q?ema4JjKg0oeBF/5PxQj71kzKeG5Wq0EPYkmPCvyl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8e7e74-44e1-4097-88c8-08dcc596e64b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:18:28.0580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwPPvZlQMtSdpH8Q99sqQo3dQuY5W/rmejwcdIUvDZ5AHcGHzvrqg65e9+fE2oVILIy+z7Gx8B0D4FRSw79IYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6975

The devm_clk_hw_get_clk() function returns error pointers.
It never returns NULL.  Update the check accordingly.


Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---

Changes in v2:
- Return PTR_ERR(icd[i].clk) instead of -ENOENT.

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


