Return-Path: <linux-arm-msm+bounces-86716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BB0CE50FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 525853001C35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63101EF39E;
	Sun, 28 Dec 2025 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OSy1LjPD";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="4+m4s8yQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CC2288D2;
	Sun, 28 Dec 2025 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766931733; cv=none; b=ZfBpj7BhoEFYmvNwa9Iw6oRa+OL81iW+K9uKuqZVovN5B07s1uSZPsd9nPLc6pKkwgzRtHSMBuiahb7YwMHyQCsKa0/OqNJ6KwZ3VAyNfWXZYFEZMg30az00jjwz+KJmu9oKVRJZDEhBe6Jarvb3G/krTWCqmG7+1UO2KBRA9JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766931733; c=relaxed/simple;
	bh=nbceJauyae0NfCyMhwgQ54oFtDqz30OVSE3hEkStqiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Icq6/xPv1dds9B6UUR0PLNHhoomrG4WlJYChHU6L01de0saLc2gX2Qolp9OMW+kwT8qk2QuExii8Wa3X/YKthpj/uvyUCxtoz7CuTYgkhhhaRHoxNVaCcfLxOjpFnM4BEwhCgmzNg136HA0Zv/Zgfuh72L+fQ193pzkPXediCjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OSy1LjPD; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=4+m4s8yQ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931722; bh=2VBEb9sJk7q9Oa0fadzhIFi
	W6swYRB83z9057sxUHyI=; b=OSy1LjPDIeZFU5TYgmdC2DqfFEWXQWQvZV+OuLzeUyhi1Vnks3
	qfdnqgrHaJyQiI2PDkVG5/vj8XE/H9EeEwpD2SrxVJ6ESizEJk+GnD3UPskIEEZTrdjqXDdU3rc
	GF8xQzBm/B442b5nZCt4M55tZrdqSPMGutNX3Ti7DwkMrQgN6X3Yc+F202u4krApASUVoO8uGor
	JAIq6jrXwv6BCopDF2fH2Gk9YoESa+/WIYB9JMQzXzp8gsERRV/LYxl/d/Brb/5vtE5HXNd5qCO
	DSCD20zFTOxmU+jZwQRddWGmahBHNwmoz+LS6LCiS8fUIWL9EZDfVcVkE98b+bKEt0w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931722; bh=2VBEb9sJk7q9Oa0fadzhIFi
	W6swYRB83z9057sxUHyI=; b=4+m4s8yQTI4/qK2d5lFwnu2fB34gR+UDz/yqIz5KFHFy1yrcpZ
	sW63z+AF73KwhCqXQlnPlWpe4kSwO6dszFDw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 28 Dec 2025 15:21:54 +0100
Subject: [PATCH 4/8] remoteproc: qcom_q6v5_mss: Add MSM8917
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251228-mss-v1-4-aeb36b1f7a3f@mainlining.org>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
In-Reply-To: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766931719; l=3524;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=nbceJauyae0NfCyMhwgQ54oFtDqz30OVSE3hEkStqiU=;
 b=hht+5xcMKwTxvVkyqavLe9apF2J9lLiN981VDcpAvDR04BSkB6cDSiW7F45KgHLYMNj6AF61X
 wxQwpNNPwbKAihBCIGJkisH5YlJSZ2DSYPePlwC1Vi8/nhmlp+eU1OO
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8917 MSS it is similar for MDM9607 MSS
only difference is the mss power domain.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 46 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ffafbe501a05..2579558fb567 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -259,6 +259,7 @@ enum {
 	MSS_MSM8226,
 	MSS_MSM8909,
 	MSS_MSM8916,
+	MSS_MSM8917,
 	MSS_MSM8926,
 	MSS_MSM8953,
 	MSS_MSM8974,
@@ -749,13 +750,15 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		goto pbl_wait;
 	} else if (qproc->version == MSS_MDM9607 ||
 		   qproc->version == MSS_MSM8909 ||
+		   qproc->version == MSS_MSM8917 ||
 		   qproc->version == MSS_MSM8953 ||
 		   qproc->version == MSS_MSM8996 ||
 		   qproc->version == MSS_MSM8998 ||
 		   qproc->version == MSS_SDM660) {
 
 		/* Override the ACC value if required */
-		if (qproc->version == MSS_MDM9607)
+		if (qproc->version == MSS_MDM9607 ||
+		    qproc->version == MSS_MSM8917)
 			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
 			       qproc->reg_base + QDSP6SS_STRAP_ACC);
 		else if (qproc->version != MSS_MSM8909 &&
@@ -817,6 +820,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 			/* Turn on L1, L2, ETB and JU memories 1 at a time */
 			if (qproc->version == MSS_MDM9607 ||
+			    qproc->version == MSS_MSM8917 ||
 			    qproc->version == MSS_MSM8953 ||
 			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
@@ -826,7 +830,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				 * Set first 5 bits in reverse to avoid
 				 * "inrush current" issues.
 				 */
-				if (qproc->version == MSS_MDM9607)
+				if (qproc->version == MSS_MDM9607 ||
+				    qproc->version == MSS_MSM8917)
 					reverse = 6;
 			} else {
 				/* MSS_MSM8998, MSS_SDM660 */
@@ -2538,6 +2543,42 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	.version = MSS_MSM8916,
 };
 
+static const struct rproc_hexagon_res msm8917_mss = {
+	.hexagon_mba_image = "mba.mbn",
+	.proxy_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "pll",
+			.uA = 100000,
+		},
+		{}
+	},
+	.proxy_clk_names = (char*[]){
+		"xo",
+		NULL
+	},
+	.active_clk_names = (char*[]){
+		"iface",
+		"bus",
+		"mem",
+		NULL
+	},
+	.proxy_pd_names = (char*[]) {
+		"cx",
+		"mx",
+		"mss",
+		NULL
+	},
+	.need_mem_protection = false,
+	.has_alt_reset = false,
+	.has_mba_logs = false,
+	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
+	.version = MSS_MSM8917,
+};
+
 static const struct rproc_hexagon_res msm8953_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -2717,6 +2758,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},

-- 
2.52.0


