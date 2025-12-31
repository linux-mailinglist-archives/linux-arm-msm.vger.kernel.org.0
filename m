Return-Path: <linux-arm-msm+bounces-87036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ACFCEB0FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40C5B300ACA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0805D2F1FE1;
	Wed, 31 Dec 2025 02:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gqte/VL9";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="H5TvZFGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114772E764C;
	Wed, 31 Dec 2025 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148182; cv=none; b=b2eJvi+yLxWV3TwP7wE3D59dDnv5CkS2MWrUJgkJfG1p/TJ4YX6xkKLoTpb4con03C2A0tc0hHf6ZiPqxPtPfQiDxVv+ky58ogCz/Jv6tWD4nyVJTfenmAzbgU3m9CJ4YI3H6SrYvv+Ec38ZlZnAHFcVWVFKvgkZYmi/YkIg/1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148182; c=relaxed/simple;
	bh=R1/6/xJ0vrNS05ydAVQf9mcyFvG9AwS/noZGYTiDNQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TF7REx2KUJtwukelIS0z46lqGw0SLj6PR9+D1HYVcLFIRI6N1z29EH7SNDdePy1tWxSVVHoTTrwTpVDujlDHW+QTQP2iI4g4I2+eY5JqaxB+kagIbIjQdEyVjtYYOOw3ivfCgFIe6AJ06rgmsE56TIlYVPmHrrYElyI8ec73bas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gqte/VL9; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=H5TvZFGm; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148173; bh=Ujh/4nhyA6CvLgADZ7kSeWx
	DPzukTL5hJUpbqUKE6p8=; b=gqte/VL9QQ1H6SmktIidCMAtbnEcbHUW0N/n8bZckbkIpckSCT
	tKb621LGafqx9DtXyQ3/nZH+tW2V3bvA1Rj0rFEGd5IYNM3cBprfsx6+JPC6sPqXGV1WcwlbDMa
	FYyr+Chg8/cPgSbINn1lZP9DYn4IuSkQ0XXU1bo2u7vf63HAq4a3rmReotJEVY9NaMGf6D3+OLN
	xIqqMp0O4/jGacSGIbupMR+x2L2BiKNpcJCYuy91NM9bMkqr5bBSYCTcw2r6Y1JHdNEMoEvxfvt
	aKqxbn+mdjyJvCvkWUIaux27krlmwn3oACdLPzyrPEq0mwU6cUXLSmRAwH01PEP5W+g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148173; bh=Ujh/4nhyA6CvLgADZ7kSeWx
	DPzukTL5hJUpbqUKE6p8=; b=H5TvZFGmGoBaSKXz3AkWxp07IdGtMUkotAmaeuh2N0lAJT9Qsz
	TZHSQsUB37hoobPQjabwhcscvG232OUez+AA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 03:29:32 +0100
Subject: [PATCH v2 5/9] remoteproc: qcom_q6v5_mss: Add MSM8917
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v2-5-ae5eafd835c4@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148170; l=3676;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=R1/6/xJ0vrNS05ydAVQf9mcyFvG9AwS/noZGYTiDNQA=;
 b=b2msjdH+23W0VHX2X2RzbaWd/+zdMmqIoROfNr/gVjn+EYv8o0nSS/Ylwr49YTJsYJU6hLqFY
 Gjc6tnBLAjIBc2T3L6YgoZZ6YxwoDeEyUWE/u5UNaohQcPmUAkz51qQ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8917 MSS it is similar for MDM9607 MSS
only difference is the mss supply.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 54 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index a64e57544efb..47c598693962 100644
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
@@ -828,7 +832,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				 * Set first 5 bits in reverse to avoid
 				 * "inrush current" issues.
 				 */
-				if (qproc->version == MSS_MDM9607)
+				if (qproc->version == MSS_MDM9607 ||
+				    qproc->version == MSS_MSM8917)
 					reverse = 6;
 			} else {
 				/* MSS_MSM8998, MSS_SDM660 */
@@ -2548,6 +2553,50 @@ static const struct rproc_hexagon_res msm8916_mss = {
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
@@ -2731,6 +2780,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},

-- 
2.52.0


