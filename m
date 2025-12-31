Return-Path: <linux-arm-msm+bounces-87129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDBACEC3F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D2A030012D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1525296BD1;
	Wed, 31 Dec 2025 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="PU4FNNri";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="348gQ1Du"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9122882A9;
	Wed, 31 Dec 2025 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198622; cv=none; b=Db3dKBgZ/i8XdmcsLsIps1gyqQy+DD9bS4KtThkyfGtj0xHYp0UzlXMQPDKpZw7KF2mdIUMnNiZr6xzonJk7mnDIV+kObEQpv8joJYOSgw76JADDNZzHWrBpueyEjNhHF61nXI8jXFSDsKnzLvyflsNQMA3nby0RgQtAG1FiUoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198622; c=relaxed/simple;
	bh=H/P7UFd/V0QwsPMdlFkZotDyHMnEm5kt0KSm/D6QmJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t5Hi3gKO6M1MKTUuHCq7L+nsG80Q9Tyx9mHR60l8M5ozbqHRb3RjnIPFb9tmnAgganryexqS0JFbOFhAhcio9jHAR3lTF2zIarbLtD+c/yWhQTpxh0PoMWK31JIGhQZJYaj69U66Dvyo7PF/hHfTfQSvVNdmx7ytiHz5WO23vKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=PU4FNNri; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=348gQ1Du; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198617; bh=6NNgl5owhkSumCB21pOt8mQ
	uYffH/gKVGN+qCQDPM2s=; b=PU4FNNritCabm76TK9aPEapIVTDaiVGbeC9zVTcr8rBWY7hhM4
	YJS7Bsm8AkVKIOL+2oJ2AvfRfo4eopvJ0BrifL+O0BuwY5Lpwm3pRaZ8OMZpP+rcdcYEH8Lljo6
	mCPN+dYB9REj321C8xSN16FnG8/YGogdOWb0lVPzhqSbVqBXIFjbPmt1lwkg/jnuJXqHyG9/s/W
	+1H6YNFfzJderqaNTUGKI9b7HvP1zdXutIgDOajPHK31/ZcD0Uye104uSaDgyrFp9aEl5WIziMn
	Y6ReYRuqo48jTn0mdp1dx/tkEI15VzGUYm5+WRxHkhtraiyustPiiAIikOBEjOVfLEg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198617; bh=6NNgl5owhkSumCB21pOt8mQ
	uYffH/gKVGN+qCQDPM2s=; b=348gQ1DumFccdt0azGqOx/5js/mLSK2f01EYInlo5rQpFkqnzr
	bxuO9jV7O5wzPTSeBaK4xbhtLyhD3aTuADBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 17:30:15 +0100
Subject: [PATCH v3 5/9] remoteproc: qcom_q6v5_mss: Add MSM8917
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v3-5-f80e8fade9ec@mainlining.org>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
In-Reply-To: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767198613; l=3676;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=H/P7UFd/V0QwsPMdlFkZotDyHMnEm5kt0KSm/D6QmJw=;
 b=nOG97Em2iGyt68hIQACNAFlTIKrXW1kuTws9cCHyOoQqc9OmkwqtukGDREaYXDwGtrjU50uOt
 cclfEumtG6hDdNk25j0N9d9h2s5E2bNVSVvQPd1zGTZaLrAjuUMHRpD
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8917 MSS it is similar for MDM9607 MSS
only difference is the mss supply.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 54 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 19863c576d72..a36447a92274 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -261,6 +261,7 @@ enum {
 	MSS_MSM8226,
 	MSS_MSM8909,
 	MSS_MSM8916,
+	MSS_MSM8917,
 	MSS_MSM8926,
 	MSS_MSM8953,
 	MSS_MSM8974,
@@ -751,13 +752,15 @@ static int q6v5proc_reset(struct q6v5 *qproc)
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
@@ -819,6 +822,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 			/* Turn on L1, L2, ETB and JU memories 1 at a time */
 			if (qproc->version == MSS_MDM9607 ||
+			    qproc->version == MSS_MSM8917 ||
 			    qproc->version == MSS_MSM8953 ||
 			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
@@ -829,7 +833,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				i = 28;
 			}
 			val = readl(qproc->reg_base + mem_pwr_ctl);
-			if (qproc->version == MSS_MDM9607) {
+			if (qproc->version == MSS_MDM9607 ||
+			    qproc->version == MSS_MSM8917) {
 				/*
 				 * Set first 5 bits in reverse to avoid
 				 * "inrush current" issues.
@@ -2553,6 +2558,50 @@ static const struct rproc_hexagon_res msm8916_mss = {
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
+	.active_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "mss",
+			.uV = 1050000,
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
+		NULL
+	},
+	.need_mem_protection = false,
+	.need_pas_mem_setup = false,
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
@@ -2736,6 +2785,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},

-- 
2.52.0


