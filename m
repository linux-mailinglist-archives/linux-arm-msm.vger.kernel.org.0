Return-Path: <linux-arm-msm+bounces-86718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45650CE5120
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D7D1300A87E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E832C0F96;
	Sun, 28 Dec 2025 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TOT2PSCN";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IZVYl+XI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070DE27AC3A;
	Sun, 28 Dec 2025 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766931858; cv=none; b=gIgOGGrzhenmPhZ/aWTInA3Zoy2AJJEnXb1L3vr6CuQ+eYuogXt5rEo0B7ARCPeOOsJkxazhJBmw3w/ZZ0K6X3M0U+ocqpNn69e5tLB35PSUhRPMLNv/xE/TZ5VkJ5zkfcIYmA9FhOm3FQr2f5Uw7gxWX0GGxEPw4LmesUOw+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766931858; c=relaxed/simple;
	bh=FxZC6lD0twVX2g9zfPY1CRWl0hSDX7ZdFEEng8lM1X4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/GJ3YSwJzfLAlchWpixZ1PaUzjDWQEKPL0XOrafSj5+iiS4LYTeTmgR1X7tpzabNmXaA4zgParLwc1mabVog6iBHm5yKvud5SngJeRhvjAwsFo2WLgGheLDJVoPY0r7i40v4+mpo9Q796Idg8i9DySvO5ZysCFyXMA9f7elY5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TOT2PSCN; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IZVYl+XI; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931721; bh=+0FLwlkzU5Yd45wtMSkxplz
	LQlzjHB2IeegnEz6l7gw=; b=TOT2PSCNZs0X6mgz8XS9EPbEREijlBGgruzGZMx+T1FD1uJwSY
	nYlhliCiFcb1oEtPrWJlLVEtPtzJOTT7XLVxMuoxiKc02v/XnyzXybwq0lWoQ2VSq67c0WqPLSR
	sl+GXTEhvC8k2DKkzJjBYuH91BDr7LSyOgnYfb63+Zn+W13m+kcXsTK5bQKAuMh44uhQvDVipQd
	0lgXEa05TFW+LoxVNh1LxckSEdizjopSCNLmwICJtno2BZOAPOMjcSxcuA0Vk86yyhmFqivPQrl
	PW1AbDp42vJfYiyDXfygskkEskfN7//XLYiUif3sAAYxzqb5bNhCXsfpqg+8e6jPaUg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931721; bh=+0FLwlkzU5Yd45wtMSkxplz
	LQlzjHB2IeegnEz6l7gw=; b=IZVYl+XIydR0Ef1DsrfwCjVVu6CT+BYIGKYyGuNiLoloGOE3OP
	RdYt0+ChSARDpk+TY8O1nY+5USiCRKuyzqDA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 28 Dec 2025 15:21:52 +0100
Subject: [PATCH 2/8] remoteproc: qcom_q6v5_mss: Add MDM9607
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251228-mss-v1-2-aeb36b1f7a3f@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766931719; l=4923;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=URQxIMwGfFHjTSDrn6Ve8YQ6rfsjdEea+wNh794F5LU=;
 b=rQsvAG+Q+weZL04FObAbEJmkUBaP+W/EjYhW/c9v56k5f0IwuvFohsN4qwaOUtAf5Dc2e526b
 FcPDyJdWynjCRxRkM74HGJSrmFi01JmGjckL/I+NT77Ag+K4tTMlRLF
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Stephan Gerhold <stephan@gerhold.net>

Add support for MDM9607 MSS it have different ACC settings
and it needs mitigation for inrush current issue.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
[Reword the commit, add has_ext_bhs_reg]
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 70 ++++++++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 91940977ca89..ffafbe501a05 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -124,6 +124,7 @@
 #define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
 #define QDSP6SS_XO_CBCR		0x0038
 #define QDSP6SS_ACC_OVERRIDE_VAL		0x20
+#define QDSP6SS_ACC_OVERRIDE_VAL_9607	0x80800000
 #define QDSP6v55_BHS_EN_REST_ACK	BIT(0)
 
 /* QDSP6v65 parameters */
@@ -254,6 +255,7 @@ struct q6v5 {
 };
 
 enum {
+	MSS_MDM9607,
 	MSS_MSM8226,
 	MSS_MSM8909,
 	MSS_MSM8916,
@@ -745,15 +747,19 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			return ret;
 		}
 		goto pbl_wait;
-	} else if (qproc->version == MSS_MSM8909 ||
+	} else if (qproc->version == MSS_MDM9607 ||
+		   qproc->version == MSS_MSM8909 ||
 		   qproc->version == MSS_MSM8953 ||
 		   qproc->version == MSS_MSM8996 ||
 		   qproc->version == MSS_MSM8998 ||
 		   qproc->version == MSS_SDM660) {
 
-		if (qproc->version != MSS_MSM8909 &&
-		    qproc->version != MSS_MSM8953)
-			/* Override the ACC value if required */
+		/* Override the ACC value if required */
+		if (qproc->version == MSS_MDM9607)
+			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
+			       qproc->reg_base + QDSP6SS_STRAP_ACC);
+		else if (qproc->version != MSS_MSM8909 &&
+			 qproc->version != MSS_MSM8953)
 			writel(QDSP6SS_ACC_OVERRIDE_VAL,
 			       qproc->reg_base + QDSP6SS_STRAP_ACC);
 
@@ -798,7 +804,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
 		if (qproc->version != MSS_MSM8909) {
-			int mem_pwr_ctl;
+			int mem_pwr_ctl, reverse = 0;
 
 			/* Deassert QDSP6 compiler memory clamp */
 			val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
@@ -810,17 +816,25 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
 			/* Turn on L1, L2, ETB and JU memories 1 at a time */
-			if (qproc->version == MSS_MSM8953 ||
+			if (qproc->version == MSS_MDM9607 ||
+			    qproc->version == MSS_MSM8953 ||
 			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
 				i = 19;
+
+				/*
+				 * Set first 5 bits in reverse to avoid
+				 * "inrush current" issues.
+				 */
+				if (qproc->version == MSS_MDM9607)
+					reverse = 6;
 			} else {
 				/* MSS_MSM8998, MSS_SDM660 */
 				mem_pwr_ctl = QDSP6V6SS_MEM_PWR_CTL;
 				i = 28;
 			}
 			val = readl(qproc->reg_base + mem_pwr_ctl);
-			for (; i >= 0; i--) {
+			for (; i >= reverse; i--) {
 				val |= BIT(i);
 				writel(val, qproc->reg_base + mem_pwr_ctl);
 				/*
@@ -831,6 +845,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				val |= readl(qproc->reg_base + mem_pwr_ctl);
 				udelay(1);
 			}
+			for (i = 0; i < reverse; i++) {
+				val |= BIT(i);
+				writel(val, qproc->reg_base + mem_pwr_ctl);
+				val |= readl(qproc->reg_base + mem_pwr_ctl);
+				udelay(1);
+			}
 		} else {
 			/* Turn on memories */
 			val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
@@ -2402,6 +2422,41 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.version = MSS_MSM8996,
 };
 
+static const struct rproc_hexagon_res mdm9607_mss = {
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
+	.proxy_pd_names = (char*[]){
+		"mx",
+		"cx",
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
+	.version = MSS_MDM9607,
+};
+
 static const struct rproc_hexagon_res msm8909_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -2658,6 +2713,7 @@ static const struct rproc_hexagon_res msm8926_mss = {
 
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,mdm9607-mss-pil", .data = &mdm9607_mss},
 	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},

-- 
2.52.0


