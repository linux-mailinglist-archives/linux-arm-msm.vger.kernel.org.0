Return-Path: <linux-arm-msm+bounces-36397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26869B603D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0FEA284ACA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 10:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0931E32A4;
	Wed, 30 Oct 2024 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="Tc1gUa/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2092.outbound.protection.outlook.com [40.107.255.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E71D278D;
	Wed, 30 Oct 2024 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284448; cv=fail; b=XI2tbtPEl8+5pzSgn8oZ8zwLMtzYMOEKYC/xDPvQGPh/B/k1W1tn/7q94OnbJtCKVAZSaKLF92MaKO5ZXQdhrR838b2KwZ27nJ73F7T5vaCNMaRh+z2KcyDjmHlQmuW3WTDjesZeyUYqjcj1kWiU8b1CNBzIAR/Gti9HX0JJInY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284448; c=relaxed/simple;
	bh=0Po7QMYZYii/vKP3tRMs3aKER6xQGHnOOw+1S6zEJbc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JUm4MoTph6altQYQKMOXw/gZt6PZc2vfuFDTYXuDHyh3Fk0c4n9Tj/FB6h2pjtfHi9VMd3CHb4lwWbf5dId7pIzrLeYpiEF+PrBIkWPkiCctJp0ZJuYlr2Zd/wPCV5G4pZ3jtpSWug+aSdqbhxLAxlO0k+NYZksEKFROTJrZ6kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=Tc1gUa/D; arc=fail smtp.client-ip=40.107.255.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aqv4tZIIT0oy9Cypm7ihe8B67/N+kuSn5O5kxK3FLTFxNthz1jHZ4OR8R277d0f2VzwKDofskzSVSmN74PWq8yY96mE+thSIASWhtiCSCHwErKOHColaznkSw8JJwRmuCJObmAsO664Wm2jK17YtSl4Bi9VFXlvnQxsvJuYz3gSeryJxOtpOpbRv1kYyueWFC+OjSPEexbKgBEiArtZfOpgUIugli7VB+kjR49vsCc7L/GGvOwPldixOTSMHBLcypt81J18DikFnkPRec4dj8MXOXWkhiC+AblJCFh0bwiqIagduVqL+NvB4D0UwXjDbyEGOumTaLj1krfVuYZA4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9grCCSowA5tzavXYtsNrT9RwWErhGKVPF+rKhipqrk=;
 b=jgvXJ/TWsIleY83NeFKL1qWTZsX4lJxINXiw41LTIE7jqke7xjT4u1M/f2+DvRLwe83TzekgOAFJxrbR9mnTWteyhg3FuElIaPnItc5F5DDWS+dtE4XmJepTj4+ptXzae1KvJT7qKyBdlYNl1DqyROiGipoZBH7iTLSiLiSaFi4gOBWtL2hpSBGlgXXlId7/RPAbw9AsIab2kJGkcKvlg1SMxPL8P5/+oq5htLlwfYqUGXKlfNCCLksompJNBjv1qKiIeLPlPLYK3PjDIMGJ//xk3fv3wGhHS9/0UJGBugLRh944TreiCAzDNGszLFHB63Oy96TcwRUqrOvUBYpj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9grCCSowA5tzavXYtsNrT9RwWErhGKVPF+rKhipqrk=;
 b=Tc1gUa/DWyqv30t0H/+hV7VXLrpyX8tu/yPZ3D/xlqTRQg6+DID4SA/s9fEzIvMUQhMXoVzCDgugxLzyhFjhjlP0h9LOJaywYF9jY8bpb9ikCagswtMjR20sILNFfi9maZyHZnI7l18OvmXtgg1TxbPAnpjCaFuV5PYqpyj0OZeZgnN7x27SS9M7E+l9JbDMuYQcnPCNzJRH4iEtYh/4kOewHPbXyvOm4YhkYvBKJE61eKhyKsF3SGTF7U2AVRbQ5vQfrSWWYPe5cKlzqrzXfC0sD7lPaNVBvEpkUURmmf5yG7MSSuCEX6WJGxSo67RqSmoDuJVPLtr8VE4jdNj/xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by SEYPR06MB7041.apcprd06.prod.outlook.com
 (2603:1096:101:1d6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.12; Wed, 30 Oct
 2024 10:33:56 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 10:33:55 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: bryan.odonoghue@linaro.org,
	heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux@roeck-us.net,
	caleb.connolly@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	angus.chen@jaguarmicro.com,
	stable@vger.kernel.org,
	Rex Nie <rex.nie@jaguarmicro.com>
Subject: [PATCH v3] usb: typec: qcom-pmic: init value of hdr_len/txbuf_len earlier
Date: Wed, 30 Oct 2024 18:32:57 +0800
Message-Id: <20241030103256.2087-1-rex.nie@jaguarmicro.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
References: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5773:EE_|SEYPR06MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: 86da23bd-5928-4023-247a-08dcf8ce5b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VxqKTO0KD9vyKthHJEygyiPeol3OwQAUVXEv/5hvh1pXFDzGL/zwYf5dODSx?=
 =?us-ascii?Q?xUORxiD/SlUOtpcDe3UAAzRluopYy3Dazk5+YBZTAyK6EmqFDT6a0hBn9FT0?=
 =?us-ascii?Q?qLpPWkKBcN7bpSp/03R/aZaraV8t+9JgLnu1d5gVx15kKGUIZS6EZ5rUO+Bk?=
 =?us-ascii?Q?LQuXDUP351PM6nlEqG4GpAXQSo8pd6QLfrnsQ/2Q5s2Yutqu78JQ9+sSz3BK?=
 =?us-ascii?Q?43pgVIFlqLuFaRamLypGpQG7hv+kB2NYxYY5i5I4eVeMNfqShvyOwJFjRMeg?=
 =?us-ascii?Q?lAyv7ZkevCT6HEtGjtqHt4f6g6FMx/E7UDFgoT4tP11qbZwJpVkuVUkH+W83?=
 =?us-ascii?Q?S4eGYshitaN47L33AGx2WhRl+qmvqECTKYzU+Akf6kcmQ65PjSeOGw1HMa1f?=
 =?us-ascii?Q?Egb/t37/XlRX4c4RkWyGUdMQENP7Yx/n195AdTOP/9pyhInR2obqx4O8yd8P?=
 =?us-ascii?Q?0v/PoNtWruRjjSDTBSMcgob0DA5cas/xyB8gqvIuaWmWcrMVdzplA53Ryybl?=
 =?us-ascii?Q?TYuYe3lNCOxtQ8nb0psYpbsh+cczR60h/HtHBJ50AQezO6JGHAz+5Nsz6GWj?=
 =?us-ascii?Q?onKJWzgSbSUke9b61hhAIzZgdtt8Jo9BXfpkBWOTm9/QOsYxqjTy52+Bw65l?=
 =?us-ascii?Q?7BwH4ocN2Ci1smT6DCxEMnKQUSK+g55yQnGogfZuBIx+9Qpo4s1pRP3M8QKB?=
 =?us-ascii?Q?sfo5acA90F2co3PY3QAek57cd2wk8A1OB9wP9mA0NlF5EMxyX7OaYpHEiE5J?=
 =?us-ascii?Q?E2310ytaPmw0EAetksuv9dOkncCqKHG/yv+oURG1RhAEk8UjNK0OinT9eGMN?=
 =?us-ascii?Q?lbcJR9wiWFF2zyM256QURBX0EaBZubXM14eXEGTLNJMrL5ZLhin0KmSIJ4tP?=
 =?us-ascii?Q?Fz3IhqM6MSGKSKqYQhyIYYe96AXK4JidfxAx3FbMXLiNs2tX7PHmYVd7K2UY?=
 =?us-ascii?Q?wSATe+CV7TSoMeVLNEE8M05phuTBvkV0j5WefjssZJJ6NiccOzNYpuJrPp8/?=
 =?us-ascii?Q?QKqzgB2H/BjdrTg7pIJOKX6rS8z6Bs6JA9harjonLBCz8f6p7/SOaKk3RxEg?=
 =?us-ascii?Q?5mgRByQ5C1zr61T34hyIKCfErTMWRgkLUhE2lQLjpw8zfvZ72vqBCvaJ2m4w?=
 =?us-ascii?Q?1F8x0vZegtg8Gc7WTXpM9Y42yrhkdeSay/s8ph571XxJ43+QscnTyf592KvI?=
 =?us-ascii?Q?iQiMGyeWVsbiIqIUUmKKcsVAFfpPVo8+TaZv2AOsMotbwt8mh6MIIiPho0wZ?=
 =?us-ascii?Q?1UzuxCuFF2jfHG0QPp92aVnlXQAUjpkXl2NIH6E6xDA/N808p+jNXyeUdfDG?=
 =?us-ascii?Q?SBW3OBLa1ex8L7Cxz7BSpEe+w6QA44E/6VrYTNrJh3RWuBXX+/cF7d2zAqOe?=
 =?us-ascii?Q?VtfGGc9yuYx/y9hmkvb9iJLpqg7+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5773.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RJNWUW9k/zLI7XE0iSdf0VPSAqgV0LabklgGLsUnW2J00S3G4bHLHYbiGfGY?=
 =?us-ascii?Q?sOUP0s7qtjjXJuKuO3qQvcx+Q2VRYEBwnYIMXrKIq6sMNgaKmL4G+2mzmSBp?=
 =?us-ascii?Q?Za8CU9XZtjbeFfoQ9Q4gs5+bmQQ+udMLj3nEVuGobv30hZU+xxvTYw5yC7BE?=
 =?us-ascii?Q?y4TsU3o2stZ9OPlMCRjBQ17N9aulCjUsiJiz1IJ/4YaMDmRq5WZpL+w3XsCd?=
 =?us-ascii?Q?AmU/ip2UR4+VZPhSYXfAlpzEV9072t4pulVTZ5y8Vg0aMb3bBOC0QSUiFkKK?=
 =?us-ascii?Q?Zv1lH0u0kdW476MBIETuG15VrjzhcsHpX/ftXusoNe2NOomJRGyR1sTfXRyd?=
 =?us-ascii?Q?PKGq8qClcLplm1HcNotKvPX0hELb3f4oY5VFCuOELA8MK6cXancjZ2plJDRj?=
 =?us-ascii?Q?7sk+oo1xiWG30kE1N4CeWhpju0VEZzIDf3XeqvdA9NH57td43sFz8JsLLmN2?=
 =?us-ascii?Q?+OgMijvwZG/Sq0/fnxnnno0fzqgzEik+dWt6As29ZDPdGBsuZPjwvizDOwis?=
 =?us-ascii?Q?k00y1sahkpOReyxdubAm2XG9j73aIwjV4VhHHoPvXCLfviYNgkTzGV1DW+T4?=
 =?us-ascii?Q?5XxGLQrGT2GpVgpUI/HXO29YoJZosasPQitMP3fe+Sxrn9ocx/KyVzmG0Vvj?=
 =?us-ascii?Q?peFGGRBz+sHCzvgKfMiqa6911dYez8HxWdwWyIUunPwmfldDFAeg4uiSS8RP?=
 =?us-ascii?Q?v6Dc1Vrp3iTPCJW6xPN4RUk3KbDxkE7bZyLv+JT2omhw7uhh3U178T6gsqve?=
 =?us-ascii?Q?mSWzUVaFs50iOtqW95LdnuurdO3cE5rNDMsz7BrOkHHuEJ8FmX+aVFpTZnKS?=
 =?us-ascii?Q?RZLUUQnoRhz04YBkvP2GI+eF1d0dCbi9qztaH7/RIfZ5z8V5FnVyYHgq88DS?=
 =?us-ascii?Q?ouKvG09QDp52ZwHR7mYxToxlBpCMfBR1Vzvh2sju5RV4ai3oPWaJiDek/ncn?=
 =?us-ascii?Q?dhjl1epRLp9YZYb6KGvngwCZ5OSJsEfcVzwUE2cdA2CzUxENsm0LUgJgjMIj?=
 =?us-ascii?Q?vgfUVwlL6DE32k/Az1jBR8Xv7DPMZrL3gZUb1FasSrs0i5zK3RwDoMVM3hYF?=
 =?us-ascii?Q?qf1YeWsbUAGwc/igpNridci8tcQYH7tPgfe2Au5nTEixJy7vDHq5aUbQgb+z?=
 =?us-ascii?Q?10jQ5rwer1nZKSXmWVEKQqen3MxQw72IQt7vbb1muMYua9UIm7kaoDarWM2N?=
 =?us-ascii?Q?tcuY7/nz7IlM2RB/v7vwimjzuCjiWLDMp/fuOThuLcbsX/NyN5iUXlqx+YKg?=
 =?us-ascii?Q?6ez88uNOOUn5zhsyUj6m2f0Y6mU2v5IEdC4QJmXrfo+2T9Uzi+TN0GWv1VVQ?=
 =?us-ascii?Q?Kjg2FwvfO6RwFRhQckYFVvb9n5SIuNTu/Ft+BjwazMOmnQyo19Ds2TOjXCyg?=
 =?us-ascii?Q?uen1TgUMZSXDYdKJDFLrClh/Z6jGLY1qyzIX9vkM1k1t5fwuA9kTjwrCSfJW?=
 =?us-ascii?Q?O4fYzg+KriLhoU+RZCbd+y1lYtP4RhJeXU64M1hV9r8U9o0q1s2PR5O5dI6/?=
 =?us-ascii?Q?+JeWh1a7QWSmewK9X4ENxSvoflAGAR5gS01fBxrIiL5LyPqA0zTCbozrD7Gt?=
 =?us-ascii?Q?bytdMxza8uvZ9fy7Gs8xdlM/kG3x4Ffex4HdZ2cx?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86da23bd-5928-4023-247a-08dcf8ce5b0e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5773.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 10:33:55.8310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISK+GTpIlYXBMSyWtItwDS+a8BWvB4rrHCiqcjwlJBcwbsgfFCSkjub1WK8JI2tUc3hraSgNtu/UnHueMeQgag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7041

If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
txbuf_len are uninitialized. This commit stops to print uninitialized
value and misleading/false data.

---
V2 -> V3:
- add changelog, add Fixes tag, add Cc stable ml. Thanks heikki
- Link to v2: https://lore.kernel.org/all/20241030022753.2045-1-rex.nie@jaguarmicro.com/
V1 -> V2:
- keep printout when data didn't transmit, thanks Bjorn, bod, greg k-h
- Links: https://lore.kernel.org/all/b177e736-e640-47ed-9f1e-ee65971dfc9c@linaro.org/

Cc: stable@vger.kernel.org
Fixes: a4422ff22142 (" usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 5b7f52b74a40..726423684bae 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -227,6 +227,10 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
 
 	spin_lock_irqsave(&pmic_typec_pdphy->lock, flags);
 
+	hdr_len = sizeof(msg->header);
+	txbuf_len = pd_header_cnt_le(msg->header) * 4;
+	txsize_len = hdr_len + txbuf_len - 1;
+
 	ret = regmap_read(pmic_typec_pdphy->regmap,
 			  pmic_typec_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG,
 			  &val);
@@ -244,10 +248,6 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
 	if (ret)
 		goto done;
 
-	hdr_len = sizeof(msg->header);
-	txbuf_len = pd_header_cnt_le(msg->header) * 4;
-	txsize_len = hdr_len + txbuf_len - 1;
-
 	/* Write message header sizeof(u16) to USB_PDPHY_TX_BUFFER_HDR_REG */
 	ret = regmap_bulk_write(pmic_typec_pdphy->regmap,
 				pmic_typec_pdphy->base + USB_PDPHY_TX_BUFFER_HDR_REG,
-- 
2.17.1


