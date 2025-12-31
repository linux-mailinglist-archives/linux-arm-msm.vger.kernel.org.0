Return-Path: <linux-arm-msm+bounces-87132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82572CEC448
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FB6330DB9A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6053128CF56;
	Wed, 31 Dec 2025 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZCOYdk37";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="p6j53dwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407AA288C96;
	Wed, 31 Dec 2025 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198632; cv=none; b=MHqbiMQIU/Nwxk30byUclHbADm3W7JOP+6CWzQS33treweisGEc0ZZZ7be3DhXpf1g7lkVCwS53FI76uay8pq92J1Jm5QUAa8cpt8I7KOoVqH4F5bEDSt6SHQxfTEirHBQugCpUd3E/P5zyY2ChHni5HPWKDN1jxJve6SA+LuQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198632; c=relaxed/simple;
	bh=x6qoIPcLyovSeboNoEGlSpENjx+bNpfaYxrvxTFce90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWaBmutziP2LBve9tHPpNYrm7SQY95LtbXmihcoU73AB+sIDw60Wfurnog1AoySxqPpQ5L5ybKPy1zWJHkNsJBs3znOLwHmdCb7mmjo1QsCmqz1GgvTuqPUWT71U/UFSwWxQAnVEuxP5AdIPuQzv5rLYtNOnoTWVGsUN03zuI3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZCOYdk37; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=p6j53dwQ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198618; bh=SmHaCR7KPULSDvlyzmc7DBt
	eIU1A2CsdY6wPKL+7cqM=; b=ZCOYdk374gK+egwcHe3g/tWFNzxeTkjtmyHBekzzSPzM4/RM6i
	kwmH/QQW0da8savHDij/cXyzWU2zDwdnbgoqwFCQKqzHzPnU3qZD807lKkfJoS/PsqGU0X417iD
	o9mXae/qz11wHmwimsWJhpL78ysXgaXKbG9xTzvvOB+FxxGXBUcsx0YjoQ7+PDF26n+XBz7uJWI
	4Ss5qcAXslgSQA154lQ97vaPL58URpq0DHOrSD9hVOE5K3L/KcJ2taMVSwdwcg0D8HYI1/FWiH5
	tPKDjG3DRayFQjke/pQ/P2xMKKOYJu5DV19BaBLUJbiu/3Q1ES3TTmAsxyseDsF6ftw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198618; bh=SmHaCR7KPULSDvlyzmc7DBt
	eIU1A2CsdY6wPKL+7cqM=; b=p6j53dwQ5xqRJ4Ku2+F7rEW+Qwllgxs+UGGTBOrDEFzkJeKalw
	1gH8Ny/EcXEQIRq9Ti/X2rR3FiJ23DIibWBg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 17:30:17 +0100
Subject: [PATCH v3 7/9] remoteproc: qcom_q6v5_mss: Add MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v3-7-f80e8fade9ec@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767198613; l=3888;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=x6qoIPcLyovSeboNoEGlSpENjx+bNpfaYxrvxTFce90=;
 b=Y+aT862fRPxgcDjvau93RKQceHJzqPZkEsN1AH+Wp1CoBMMkh5TLpAuPmXPh4ytnOlBLatYpt
 3n+9iTDqlwBAhXqB0EOQP7c77AZgWmoj163/UKx9yMItBqOM2rTZVqf
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8937 MSS it is similar to MSM8917 MSS.
It differs primarily in that TZ needs to be informed of
the modem start address and pas_id.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 54 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index a36447a92274..390b35b5a69d 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -263,6 +263,7 @@ enum {
 	MSS_MSM8916,
 	MSS_MSM8917,
 	MSS_MSM8926,
+	MSS_MSM8937,
 	MSS_MSM8953,
 	MSS_MSM8974,
 	MSS_MSM8996,
@@ -753,6 +754,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 	} else if (qproc->version == MSS_MDM9607 ||
 		   qproc->version == MSS_MSM8909 ||
 		   qproc->version == MSS_MSM8917 ||
+		   qproc->version == MSS_MSM8937 ||
 		   qproc->version == MSS_MSM8953 ||
 		   qproc->version == MSS_MSM8996 ||
 		   qproc->version == MSS_MSM8998 ||
@@ -760,7 +762,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 		/* Override the ACC value if required */
 		if (qproc->version == MSS_MDM9607 ||
-		    qproc->version == MSS_MSM8917)
+		    qproc->version == MSS_MSM8917 ||
+		    qproc->version == MSS_MSM8937)
 			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
 			       qproc->reg_base + QDSP6SS_STRAP_ACC);
 		else if (qproc->version != MSS_MSM8909 &&
@@ -823,6 +826,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			/* Turn on L1, L2, ETB and JU memories 1 at a time */
 			if (qproc->version == MSS_MDM9607 ||
 			    qproc->version == MSS_MSM8917 ||
+			    qproc->version == MSS_MSM8937 ||
 			    qproc->version == MSS_MSM8953 ||
 			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
@@ -834,7 +838,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			}
 			val = readl(qproc->reg_base + mem_pwr_ctl);
 			if (qproc->version == MSS_MDM9607 ||
-			    qproc->version == MSS_MSM8917) {
+			    qproc->version == MSS_MSM8917 ||
+			    qproc->version == MSS_MSM8937) {
 				/*
 				 * Set first 5 bits in reverse to avoid
 				 * "inrush current" issues.
@@ -2602,6 +2607,50 @@ static const struct rproc_hexagon_res msm8917_mss = {
 	.version = MSS_MSM8917,
 };
 
+static const struct rproc_hexagon_res msm8937_mss = {
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
+	.need_pas_mem_setup = true,
+	.has_alt_reset = false,
+	.has_mba_logs = false,
+	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
+	.version = MSS_MSM8937,
+};
+
 static const struct rproc_hexagon_res msm8953_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -2787,6 +2836,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
+	{ .compatible = "qcom,msm8937-mss-pil", .data = &msm8937_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},

-- 
2.52.0


