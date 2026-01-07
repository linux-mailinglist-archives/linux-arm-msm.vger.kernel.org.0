Return-Path: <linux-arm-msm+bounces-87851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2483ACFD6B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6971304BE54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0ED30CD82;
	Wed,  7 Jan 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="azJMKiqn";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bCbcgfC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF130B518;
	Wed,  7 Jan 2026 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785658; cv=none; b=n5ECAH+FVGJWPeAJkJL0pb5vPxuqIG3VzuL1oDjSug6cbrJg+IE4VVz+hCkD9Pi4mwyhmBnEA8dZo11J3c39kV99ltVabvj/q9fKOF6LGRy58bNkpfU1c4SpzQWNMvBg2x7WKhHdwiYjnNSlgFqINEhWHSBt3cemlOVh8fnzMXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785658; c=relaxed/simple;
	bh=v3y6BKCRfQELd+QFeuVLU636e8JRgFSuITFn3Km670E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0Kgy0CLwuKJKma4YYJRN5uzJozSB8tD24i4/1uUjZdOO2fxUQQFhtgPa7NlpDooNjPF6kyFWJHZVaBBzPPTvLWzyMWXEuhUvtg4rpiL2rbdX1h+oHbMZRGf3mFdgcpncUp5A+V6FRj5HjwInAGXVh0rNm+f2Sm5ebpwZMbDLjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=azJMKiqn; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bCbcgfC+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785647; bh=lvcUWeWG4ocGMd/LM7wdDnD
	m7WvRiDqDBfo4mNiRxIQ=; b=azJMKiqno+bajOIBqxFmXCCRjlSrsOyuT4MHdxeCaqzBKMpUK5
	M9jtKfqiJwGHwVHIcXry160sX4KX0m6/PYql8Hj8rIvATUE+iTMpf5bPj7HsVOUUJ0E0de7OH65
	pRyuO7CvJOozzG40WzT16NWcmpnQ4Kzpcm4FFnUf6hQd3efQT6O5eUd6hFw6z6ku6LI9woqG5RT
	v7m36ly3/xd95jI21vB12uNxx6iOc5XpHphTdGBME7VqKo2HHL3s4W7ahgOOlU2e16aICXl+q/V
	9qr8dCw4f5x+qIg19Ld77yqMDi6XyCmZ0tri+CZcrjIzmWLk9I2ZC7NRrx9ocUtN9dQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785647; bh=lvcUWeWG4ocGMd/LM7wdDnD
	m7WvRiDqDBfo4mNiRxIQ=; b=bCbcgfC+dU0CXIWHkfBO19dQbdTvmzXoRuGYExYRjuAInEWRu7
	gpcupYW1VSHSC+piNGvUPNPJReK8wmYA+CDA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 12:34:03 +0100
Subject: [PATCH v4 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-mss-v4-3-9f4780345b6f@mainlining.org>
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
In-Reply-To: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767785644; l=4797;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=NUR6xPl+7LxxVTvMrW+DcBkL8bU+1LgGiAcd6bbD55U=;
 b=WFsJ/Rlu9W1SSv+YoWEzBzAJ/gx/KT3r5hF8LN5NbDIRMBPJp+Z+erJjTV9NaH6TJc3pTTqLg
 DPUbxq/foZHBh7riPyeO/IpX2tig/ALkSD6ZS8oyIEKKBYu7mLekTIS
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Stephan Gerhold <stephan@gerhold.net>

Add support for MDM9607 MSS it have different ACC settings
and it needs mitigation for inrush current issue.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
[Reword the commit, add necessary flags, rework inrush current mitigation]
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 72 ++++++++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 3c404118b322..1b50535add20 100644
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
 
@@ -801,6 +807,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 		if (qproc->version != MSS_MSM8909) {
 			int mem_pwr_ctl;
+			int reverse;
 
 			/* Deassert QDSP6 compiler memory clamp */
 			val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
@@ -816,13 +823,30 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
 				i = 19;
+				reverse = 0;
+			} else if (qproc->version == MSS_MDM9607) {
+				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
+				i = 19;
+				/*
+				 * Set first 5 bits in reverse to avoid
+				 * "inrush current" issues.
+				 */
+				reverse = 6;
 			} else {
 				/* MSS_MSM8998, MSS_SDM660 */
 				mem_pwr_ctl = QDSP6V6SS_MEM_PWR_CTL;
 				i = 28;
+				reverse = 0;
 			}
+
 			val = readl(qproc->reg_base + mem_pwr_ctl);
-			for (; i >= 0; i--) {
+			for (; i >= reverse; i--) {
+				val |= BIT(i);
+				writel(val, qproc->reg_base + mem_pwr_ctl);
+				val = readl(qproc->reg_base + mem_pwr_ctl);
+				udelay(1);
+			}
+			for (i = 0; i < reverse; i++) {
 				val |= BIT(i);
 				writel(val, qproc->reg_base + mem_pwr_ctl);
 				/*
@@ -830,7 +854,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				 * wait for 1us for both memory peripheral and data
 				 * array to turn on.
 				 */
-				val |= readl(qproc->reg_base + mem_pwr_ctl);
+				val = readl(qproc->reg_base + mem_pwr_ctl);
 				udelay(1);
 			}
 		} else {
@@ -2410,6 +2434,41 @@ static const struct rproc_hexagon_res msm8996_mss = {
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
@@ -2672,6 +2731,7 @@ static const struct rproc_hexagon_res msm8926_mss = {
 
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,mdm9607-mss-pil", .data = &mdm9607_mss},
 	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},

-- 
2.52.0


