Return-Path: <linux-arm-msm+bounces-87038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6096CEB11E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B799A302039A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63C92F60A7;
	Wed, 31 Dec 2025 02:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HfQkvalf";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kV60mn4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE32E2E7623;
	Wed, 31 Dec 2025 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148183; cv=none; b=bwQ3kDx5U98W76uVN3DtIw5fh+r5zfbC4Mylv3qVeBjFj0wjVIGgylixMpIFnKa41edEpl/ec4lCgp162UYM3NxW6NQjvqe18w++Gf8FAl2jpKJObPwCclgVnUEp57u6M+sRglsjIdg7k/8yB2Mfr4xO+EBe5YCdAmP5qR0yBHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148183; c=relaxed/simple;
	bh=tNgfas1TnnCblAKx5lvSXZhpAidV2lm9uf+pTKA9byM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKkBW6cBgGjEZjjpCR7cgurmKET+2xMmBJuKNUKUS6vS1JETWrOet5daItl0ctORWtFihFnqlf7AR8uGZVtKUhsYPOKzXMO8yAfnvlIdZzBRF9iSpWvD/+pXLURBQZ57AcwFRRMZwnX/cwttArN8AT18NglEchzUZfyh1gLdATg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HfQkvalf; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kV60mn4/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148172; bh=BU5WR2HINQXUqlixiUh+/sV
	ReNC8QVHzAA8B+mGFS+w=; b=HfQkvalftrzzT224/RTTtoXijnQEoNwaHQ4s5XCGZfxOY8cP0a
	4EL19m8fnQAzz6qVs9mFX0GFCDezOKlQuaKwB82HDLyVPf6x9PXniyNu8Kzgm5AUOdXlUf3GXiB
	7u2jqNHQAz0Fhk0P9+PS1yGb8xQvhYf43hSMFy+Sj+mc36Yj24QKgoMyZc/C4TN0gAh+B9vUsfx
	NzZg74bIasGN1SP+wyUNJDoZU7o3uzqGnepJ93DIUirFfcn8HNy0qyJ+SqUxoeI3EWsTo8AujjU
	apDmNVcojmpDeSG9U2atVxP56I0LD03Adr6WTxOusgJydxtej2sNphctXUCfd8vph6Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148172; bh=BU5WR2HINQXUqlixiUh+/sV
	ReNC8QVHzAA8B+mGFS+w=; b=kV60mn4/Hfn0XLFXpZ6NTMJ4IFoNig8/5lDl7v+k9Ugc5lXxV6
	xjtrlK34/mvgR0R2xlkLVrKKBbmn6n8ORFCA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 03:29:30 +0100
Subject: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v2-3-ae5eafd835c4@mainlining.org>
References: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
In-Reply-To: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148170; l=4923;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=F5sDbDJk3zKnlbAYmyuPx2xHN4Yesb0x3y/GxT2A62s=;
 b=cQKmYOV3VwvWqTCQFTULLLoxCGgD0XTPr5UuWYEWgZ5gQT2CAogl+Wo/Ez9Cvig+L87GJPSkY
 QZcCjgOJABuA004B/05SbSSRgRotnlqAsQv7VcxToWgFwUVuFA1AuUg
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
index 3c404118b322..a64e57544efb 100644
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
@@ -812,17 +818,25 @@ static int q6v5proc_reset(struct q6v5 *qproc)
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
@@ -833,6 +847,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
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
@@ -2410,6 +2430,41 @@ static const struct rproc_hexagon_res msm8996_mss = {
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
@@ -2672,6 +2727,7 @@ static const struct rproc_hexagon_res msm8926_mss = {
 
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,mdm9607-mss-pil", .data = &mdm9607_mss},
 	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},

-- 
2.52.0


