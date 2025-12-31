Return-Path: <linux-arm-msm+bounces-87039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC43CEB116
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34E64300A942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759612F9C2C;
	Wed, 31 Dec 2025 02:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="f0lo4g53";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="8tNcuzRF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54DE2EA490;
	Wed, 31 Dec 2025 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148184; cv=none; b=leMzdsxfLYRItHTnlui0+d8xnQni4kIvN1m9aAxUEzHdTw2cqMQfsedejMC0td5m4/2TAhoCk2Nox1PAf0//SAFDJFHJKbY6ZGS5Vv3iTI3FKJwspUSS+zxNK+K5EAzsc6vCPP15ABI35x/I5sFCeodlsM70OZvLbX4wYDAytEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148184; c=relaxed/simple;
	bh=ZiErRAV3Sg6sZFu9ukWy2k40IzsyqDgIYl0O/IuqQA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQ7t/RZlw5fli9aREpF4svxM6+6b0wo9paDcBU+PgWBZ9oDG1jChEcurKgAXRrjtnckDIMLAf+XmKOmBjwd4t7PJ178m/wFErO7W/aFz5j4QvoUBKsTx+BwgQcR6v3Jn2ZQUpUfp+YajvciofLIf21xd1/3ydgdMPprgmuVHR6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=f0lo4g53; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=8tNcuzRF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148174; bh=+MLPKzL+MSTqO1zLkCRNe+g
	cK9BpZuOBVzYNIlFdj8I=; b=f0lo4g53LyioVsnh4R2b6gbkvFlVrIGVYalTttXq+tZ4Pqq5e+
	7b6QulwQaRfytymDlUjB8hzBf8zAtLbquf7lWRs/AemQjJamd7p3eXHQBYCUkCPgWpMCn4nVGYM
	6XGaL801h2dsauqvsS37skbIoJHCbrY+EVJK6WbxdbjJOD7Ye79qhahCiMqxPklfCVzhNHjUIr2
	/uB7OzAYlwOq1y0nb0pI/KXh8mY7vDq4lbCnE5559BWsQ2L2jTKE0iwcxabIh89hSH9U+zo7DpM
	eyaTYGT0u1Z7t9dw+/l/FWCgEC3AEO14609EdFh9jitngrvu4+EDxPLGowmBhJEYLsg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148174; bh=+MLPKzL+MSTqO1zLkCRNe+g
	cK9BpZuOBVzYNIlFdj8I=; b=8tNcuzRFFqIR8Ky5F8p9nHgxpAJocFtYVC20p0XyVMXcfsNqnX
	0knOSdFFOM9zjknkoShXHmN2PnbxD1vHXxAQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 03:29:34 +0100
Subject: [PATCH v2 7/9] remoteproc: qcom_q6v5_mss: Add MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v2-7-ae5eafd835c4@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148170; l=3857;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ZiErRAV3Sg6sZFu9ukWy2k40IzsyqDgIYl0O/IuqQA0=;
 b=j+b6nIME+gvJLsioks/Brwh1Ej8j3qwz8/p20HF3Iou+zsC/xxcnnoxcjA8V9fBEB/HfXpPNr
 iLyL+i8eW5MCyogsJZDpfTwUr39V3VP8gPRsp3nPER45qey/6dkVGjr
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
index 47c598693962..718bafdf92c1 100644
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
@@ -833,7 +837,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				 * "inrush current" issues.
 				 */
 				if (qproc->version == MSS_MDM9607 ||
-				    qproc->version == MSS_MSM8917)
+				    qproc->version == MSS_MSM8917 ||
+				    qproc->version == MSS_MSM8937)
 					reverse = 6;
 			} else {
 				/* MSS_MSM8998, MSS_SDM660 */
@@ -2597,6 +2602,50 @@ static const struct rproc_hexagon_res msm8917_mss = {
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
@@ -2782,6 +2831,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
+	{ .compatible = "qcom,msm8937-mss-pil", .data = &msm8937_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},

-- 
2.52.0


