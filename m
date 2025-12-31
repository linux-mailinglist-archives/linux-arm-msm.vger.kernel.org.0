Return-Path: <linux-arm-msm+bounces-87127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58ECEC406
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63126303DD21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0977828CF52;
	Wed, 31 Dec 2025 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nGUr8pDU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NfF7yHMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB682853F3;
	Wed, 31 Dec 2025 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198621; cv=none; b=Q7xyugnVcWtUV8uWxHpFmLf1lHKI6fCVEghg0E8s7wrDY11yfqDYq14qYYPL5JPYPHD/0JeG1zhOhYkDRZ41LBDn/IL3oLak+osDjcCiZRebOiiAg+B0KKlf4B2L1P7fcP3ZR/kDKbjQqnqYTHS7SX2uqlPctjcH5lR5NLKRkY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198621; c=relaxed/simple;
	bh=aMja6Z9fX8rrD7tGW04IaMqot4eLHPhfBiWd1DqOpF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llzixwliQ1+aEvY7Kj7tkt870xr2yUm0+jq//QcDZvaHh2TOeduPc7GNZ16+0yQHUON6J1zd/DD7of6V5R+BU1aX/Xo1Zr6Z3R5DFjCYdJggM3XwN844iQughMNyFofbAcaKD1wM7D5ks6LVcQYVkLyyczUE8qQTgU0LBsJBzmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nGUr8pDU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NfF7yHMN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198616; bh=fI8FOLHpbycTT/h/3zmIK5u
	o0pmwrVVpdWD6LohdKK4=; b=nGUr8pDU3KyBSDRL20kdLL5xjIml/6nJF31tW54dNgy6o7Q3gL
	hNqZs13COGyYXvifmpD98LVB34aVbd5Ev5HTqWPOV1l3rXUND1HcUc4jc40FOuDhNBchTzAGNi2
	dQ06kNeuUXyT1+jwnpP2w5PGh5mUG/Mg9//CLrMNnqVQLSeQ8wG0WMhyjtpXZ9vWEN0IBGSp+up
	WONLYacbiSmdkuXWLayMYO5LzxXbr4/o6p4207f2Qe6DecL4BHQgRaPobyxjTOlZjKqZbJ7i9Q1
	8hPMSRE76dGM/LFIVEwEc9//Zk8fAxot1TuFI+5prGhZ3TpNcx7zueFPX5TGtf8hZpw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198616; bh=fI8FOLHpbycTT/h/3zmIK5u
	o0pmwrVVpdWD6LohdKK4=; b=NfF7yHMNVNbevi14BC3DCaPzfEDrFVfzEwDcEQBlpXIigofDST
	/TcBpNgCLDRarYaxVhnDpl+ZlijMUbTwa+DA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 17:30:13 +0100
Subject: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767198613; l=5352;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=JD15BMvJP3u9OapIu2lVtcZXhls9SqY3Po7tJcplGi8=;
 b=L0iuH4lt1kw2JULmeF1F6vmKZaPkASTEvw2oJlRmcE/XuNwoCSj+Fk0ngvNN9uw6Z4I09YI6p
 drimaBd1JXUCAeV6kbSiCyUfLPb0vP8IoJ5VBPpXYOmd/JS8B+dQ2g+
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Stephan Gerhold <stephan@gerhold.net>

Add support for MDM9607 MSS it have different ACC settings
and it needs mitigation for inrush current issue.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
[Reword the commit, add necessary flags, rework inrush current mitigation]
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 89 ++++++++++++++++++++++++++++++++------
 1 file changed, 75 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 3c404118b322..19863c576d72 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -124,6 +124,7 @@
 #define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
 #define QDSP6SS_XO_CBCR		0x0038
 #define QDSP6SS_ACC_OVERRIDE_VAL		0x20
+#define QDSP6SS_ACC_OVERRIDE_VAL_9607	0x80800000
 #define QDSP6v55_BHS_EN_REST_ACK	BIT(0)
 
 /* QDSP6v65 parameters */
@@ -256,6 +257,7 @@ struct q6v5 {
 };
 
 enum {
+	MSS_MDM9607,
 	MSS_MSM8226,
 	MSS_MSM8909,
 	MSS_MSM8916,
@@ -747,15 +749,19 @@ static int q6v5proc_reset(struct q6v5 *qproc)
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
 
@@ -800,7 +806,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
 		if (qproc->version != MSS_MSM8909) {
-			int mem_pwr_ctl;
+			int mem_pwr_ctl, reverse = 0;
 
 			/* Deassert QDSP6 compiler memory clamp */
 			val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
@@ -812,7 +818,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
 			/* Turn on L1, L2, ETB and JU memories 1 at a time */
-			if (qproc->version == MSS_MSM8953 ||
+			if (qproc->version == MSS_MDM9607 ||
+			    qproc->version == MSS_MSM8953 ||
 			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
 				i = 19;
@@ -822,16 +829,34 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				i = 28;
 			}
 			val = readl(qproc->reg_base + mem_pwr_ctl);
-			for (; i >= 0; i--) {
-				val |= BIT(i);
-				writel(val, qproc->reg_base + mem_pwr_ctl);
+			if (qproc->version == MSS_MDM9607) {
 				/*
-				 * Read back value to ensure the write is done then
-				 * wait for 1us for both memory peripheral and data
-				 * array to turn on.
+				 * Set first 5 bits in reverse to avoid
+				 * "inrush current" issues.
 				 */
-				val |= readl(qproc->reg_base + mem_pwr_ctl);
-				udelay(1);
+				reverse = 6;
+				for (; i >= reverse; i--) {
+					val |= BIT(i);
+					writel(val, qproc->reg_base + mem_pwr_ctl);
+					udelay(1);
+				}
+				for (i = 0; i < reverse; i++) {
+					val |= BIT(i);
+					writel(val, qproc->reg_base + mem_pwr_ctl);
+					udelay(1);
+				}
+			} else {
+				for (; i >= 0; i--) {
+					val |= BIT(i);
+					writel(val, qproc->reg_base + mem_pwr_ctl);
+					/*
+					 * Read back value to ensure the write is done then
+					 * wait for 1us for both memory peripheral and data
+					 * array to turn on.
+					 */
+					val |= readl(qproc->reg_base + mem_pwr_ctl);
+					udelay(1);
+				}
 			}
 		} else {
 			/* Turn on memories */
@@ -2410,6 +2435,41 @@ static const struct rproc_hexagon_res msm8996_mss = {
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
@@ -2672,6 +2732,7 @@ static const struct rproc_hexagon_res msm8926_mss = {
 
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,mdm9607-mss-pil", .data = &mdm9607_mss},
 	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},

-- 
2.52.0


