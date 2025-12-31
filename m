Return-Path: <linux-arm-msm+bounces-87040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C8BCEB152
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD019304EF7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1DE2FDC20;
	Wed, 31 Dec 2025 02:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QOVDQ44J";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="+I6R6nuZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4882EAB82;
	Wed, 31 Dec 2025 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148184; cv=none; b=m5Jrcq5pH7USiXgkoQC0P6RhvVnmZsJs2F8UiVOoXIx/w1L07ehA5VG2EY/KA+4Ok0pTD1jBx8JneWUZbov8Qt8y0c3tbCfdlX5cvbj6xXFxYFHaV0A3SnbugkdOvEXKNDqJGBcj420BEV3M+8pdiegGALSzsmz652fH8BLfiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148184; c=relaxed/simple;
	bh=fSChcAhhCChfhJkj42P17o0Lkc1CiojnKKfuXy/3M/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QRpbBF4763lQDGleilTUiRwCPMFIqWnxfrpSZQcEGp5yJ05iEhNUN6A14VIOw2PKBnpeu5UXdRpnPa2wka0VbjfK5BTQJqXt+xXCvGHdWI7yRKgGBO27915+c4VvaTimt3S34YNR4AXej+vRtNF/g4iv+oovRca/Db7/M6fT/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QOVDQ44J; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=+I6R6nuZ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148176; bh=lnbQd6X/fn8+pMxrwi6fL18
	lwkHD41ezYwTTr8K6cDI=; b=QOVDQ44Jdg3YXu9kdrhinmCT5PuiAKWRk0vSSOWg/Z9oruzFmU
	gfMxoimJDgO0BlOeWCjU5+icAUbDVn4XROwWlVJi/+5B4avbeFgTNWRXhz5sFiOPF7lGfD36Z9o
	0rKauayriPLPcc2rpTcxd4g2I+zHoZI5TI+XHG41SKT+13VGVx/ubwpBwWlKLv2AsBnSXpPWRPP
	4nAcI9o3MootRKirggGtSVQ082cO/dTPafYnxamBrLnxcPoVbSPKm+I9aq2KHAsfMtOKZGu9aid
	mIrtdAlb4T/AA4awga0QLf/vM7TeDsxHZ50+fFzD79g2ubNP89cfLQ6N2wklxm0aWSA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148176; bh=lnbQd6X/fn8+pMxrwi6fL18
	lwkHD41ezYwTTr8K6cDI=; b=+I6R6nuZNvr9ztB59YpQMhbtk1kPOnDIFpwBYXdE4I5ml3rn3/
	/CXKzxZBVR80kjlEgLOpwMXZvNihTpjn/VCA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 03:29:36 +0100
Subject: [PATCH v2 9/9] remoteproc: qcom_q6v5_mss: Add MSM8940
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v2-9-ae5eafd835c4@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148170; l=3463;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=fSChcAhhCChfhJkj42P17o0Lkc1CiojnKKfuXy/3M/4=;
 b=7LMgE729v+P93CjBA2DBJojvEHNzJruM53kqalNA5/EnA1hOYNwL/YjoB0F6jffKJ8eecQgwz
 /0cv8MkN6QWDMaeEpJ7dGo+wnpEpU1qSI08eNMMo42XH1jechZhnVvL
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8940 MSS it is similar for MSM8937 MSS
without inrush current mitigation.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 51 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 718bafdf92c1..db6712803b0c 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -264,6 +264,7 @@ enum {
 	MSS_MSM8917,
 	MSS_MSM8926,
 	MSS_MSM8937,
+	MSS_MSM8940,
 	MSS_MSM8953,
 	MSS_MSM8974,
 	MSS_MSM8996,
@@ -755,6 +756,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		   qproc->version == MSS_MSM8909 ||
 		   qproc->version == MSS_MSM8917 ||
 		   qproc->version == MSS_MSM8937 ||
+		   qproc->version == MSS_MSM8940 ||
 		   qproc->version == MSS_MSM8953 ||
 		   qproc->version == MSS_MSM8996 ||
 		   qproc->version == MSS_MSM8998 ||
@@ -763,7 +765,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		/* Override the ACC value if required */
 		if (qproc->version == MSS_MDM9607 ||
 		    qproc->version == MSS_MSM8917 ||
-		    qproc->version == MSS_MSM8937)
+		    qproc->version == MSS_MSM8937 ||
+		    qproc->version == MSS_MSM8940)
 			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
 			       qproc->reg_base + QDSP6SS_STRAP_ACC);
 		else if (qproc->version != MSS_MSM8909 &&
@@ -827,6 +830,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			if (qproc->version == MSS_MDM9607 ||
 			    qproc->version == MSS_MSM8917 ||
 			    qproc->version == MSS_MSM8937 ||
+			    qproc->version == MSS_MSM8940 ||
 			    qproc->version == MSS_MSM8953 ||
 			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
@@ -2646,6 +2650,50 @@ static const struct rproc_hexagon_res msm8937_mss = {
 	.version = MSS_MSM8937,
 };
 
+static const struct rproc_hexagon_res msm8940_mss = {
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
+	.version = MSS_MSM8940,
+};
+
 static const struct rproc_hexagon_res msm8953_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -2832,6 +2880,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
 	{ .compatible = "qcom,msm8937-mss-pil", .data = &msm8937_mss},
+	{ .compatible = "qcom,msm8940-mss-pil", .data = &msm8940_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},

-- 
2.52.0


