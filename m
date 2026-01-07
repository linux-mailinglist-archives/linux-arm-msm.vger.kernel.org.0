Return-Path: <linux-arm-msm+bounces-87859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FCCFD76F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFCBC302FCC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94471322B69;
	Wed,  7 Jan 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UhmJeaMv";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="474ZFfLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A53164B8;
	Wed,  7 Jan 2026 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785665; cv=none; b=j4+Ro63cwhxkj98eFwEdov3ezqzRBla7nNyGPsnnIdaVsZMRLTGLTXU7fGGKkmogoIZd7OcBY50zoqvZ0tYGICd3yqBwrURJYJbicEuP+5ByJgh2HxWuKG0LdGhuk58XjNmkNq1WoNvNYiZCeYzqUtGvI6PCEc5St8PR4MNYGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785665; c=relaxed/simple;
	bh=SOjMECu0f91J5oR3/Kp6hdJaRdyxaaYC16Vg/XNWqa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ieqMeC/hn1W3/043ku1wk2WLnzrNynM5D90tvqZEDZej3pDY2gxiewpYl51f7P+sssoGe+KjqT0gfRDiN2AFNi33fLPRwHDhBhL4crSS2jeZPlIXWgypwgmLn0dmBLpn2WyPi6nlucOFr3+nEK2EWHo0AxNH7NZW+naU2OkKGqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UhmJeaMv; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=474ZFfLh; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785651; bh=8jFICdQt92gua7fWTjGgpXU
	oEhvBwtL1eVRr/QcgDWo=; b=UhmJeaMvvLy3aHuABTtTKYBeLn8WO1aIy9oT1/tbi4mym57Vdp
	OzGSHc+zCnlVyNsPJxlVMZZL6b5MEH1cbTivosJQCQ6KAYLjnQ3s8/pwqnelBuYcd9gBrKV4nKP
	f4HNGG0HKHHU0tLi5ERDYa/E+YvW0wqnauk8HBBCpFg8ervBWTtKBRIT06LcvlQBeko0KYjo0ZK
	BCj97Hl8xfYH8SjDe1wnV+SyUpSv0yVBncOYtyead744QP5Pd9bG9vyyiMqs8t2syQoK93OgHEf
	ysGyKCbZflDOgWyIXf8J1AT+j5xeAVHXKuBc/NzXpQF3tNuRSWkGvkDuYe1QkuzdMbQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785651; bh=8jFICdQt92gua7fWTjGgpXU
	oEhvBwtL1eVRr/QcgDWo=; b=474ZFfLhDkGDHIDYoOLI5z3zUFJEYDj6WKf1aJN9DUDpVXSWrT
	IxUOp2XvmeLprwZF4NsFM65G9CkF63uebLBQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 12:34:09 +0100
Subject: [PATCH v4 9/9] remoteproc: qcom_q6v5_mss: Add MSM8940
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-mss-v4-9-9f4780345b6f@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767785644; l=3513;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=SOjMECu0f91J5oR3/Kp6hdJaRdyxaaYC16Vg/XNWqa4=;
 b=/kNXYzqd3HuBRixgzrfR1D98nh/JTutAIh3+HY74OagWM3d/0pqRxz6MflDRxJnbol2SN7jqm
 q7gndBw68L7AfKZiMWa/CaSo4DAFzx7dcdmjU4xf6eHQxk3L61RpHNR
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8940 MSS it is similar for MSM8937 MSS
without inrush current mitigation.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 53 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 46f287672291..4e9eb5bd11fa 100644
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
@@ -825,7 +828,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
 			/* Turn on L1, L2, ETB and JU memories 1 at a time */
-			if (qproc->version == MSS_MSM8953 ||
+			if (qproc->version == MSS_MSM8940 ||
+			    qproc->version == MSS_MSM8953 ||
 			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
 				i = 19;
@@ -2648,6 +2652,50 @@ static const struct rproc_hexagon_res msm8937_mss = {
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
@@ -2834,6 +2882,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
 	{ .compatible = "qcom,msm8937-mss-pil", .data = &msm8937_mss},
+	{ .compatible = "qcom,msm8940-mss-pil", .data = &msm8940_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},

-- 
2.52.0


