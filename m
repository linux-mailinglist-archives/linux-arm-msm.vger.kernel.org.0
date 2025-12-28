Return-Path: <linux-arm-msm+bounces-86724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1D5CE515C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A73F4303BE19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C632D3ED1;
	Sun, 28 Dec 2025 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CmkQhvVH";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Fd/4FDSU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215772C3277;
	Sun, 28 Dec 2025 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766931861; cv=none; b=K12hYlaTF/C0KAGVCX0V1G+KCMLBVjyYAC5MGwh8osxwksZYD5DUMcbY1lEuGjzFmeRlvdzH6+N6Juk/PjHevtnEU3opx50tKYoKwNyeNlz1RxmSVkZkBjs3xj73SYgT51FKei0NkhawwK+RiBcPd9n9BEMxKpis3CRciHqWUlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766931861; c=relaxed/simple;
	bh=1Bh+rZVLvma2a6wq73GmZSs2yYpArOJ2+O6+ct63cjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5ped8w+GZzUbFl8Th1aDK4KtHIYWRJxWFp2KzwEElYOcXEEfs2WOF3A9hAnhPcZqFvZhUcP2/qoxiDhADQvH1gKXg5/fQZfsEkYWeFjKwH2j8zLVw7PJ07YxULpu4NdGH6CV7HN+QJ8PW4w4YkuRSzIiJHc730XFP79864Nojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CmkQhvVH; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Fd/4FDSU; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931724; bh=gI2KlKOLEnKDUucOFeHmV2Z
	Zsspvdz8rK+S+52u8xi8=; b=CmkQhvVH0wnWScoTFAkj8RCClXCMnf5p8ipH8hiR5uzHkQjyoN
	3yDLpqo0PFWgCI1sYOTN3FytMXK3Ug24nobThrHZc/bzuQClnJz45RoS/I/rWZuX7093P7q/DW0
	xsOULl1sChnxnV/qX+k7izu1KbGAD87xJ1QwR7aOPs7WPXwuBaUuj/M0M0EfNrPqTa8x4YJaB0u
	NCLsIMVejDYJtnUdjihPupxSfQfFWTzkaWFXV/hbHpaux4G0hXT3Cp+wFtAENbHYzxSZ6cdEJqC
	I5snJu2eZIoWcOTiiNwFTVt6KiLpBBluvq3WBPS9DkLC2ezkBL+Nv8QAHLMW3f3Xvzw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931724; bh=gI2KlKOLEnKDUucOFeHmV2Z
	Zsspvdz8rK+S+52u8xi8=; b=Fd/4FDSUe4WxNf9oWb/H1rjZ0nzPSW3BhgNUFPpl214gxw+QSR
	npA6/DXCXz92dtyj0bjT+MZhEloMujNTkOAw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 28 Dec 2025 15:21:58 +0100
Subject: [PATCH 8/8] remoteproc: qcom_q6v5_mss: Add MSM8940
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251228-mss-v1-8-aeb36b1f7a3f@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766931719; l=3601;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=1Bh+rZVLvma2a6wq73GmZSs2yYpArOJ2+O6+ct63cjw=;
 b=eP/N6Yq39lwnNKoAileMFZ2xt/rPTydjSH49hAQYBBN9JZDpt38Xd0avaGHhtyXa8lmK34gaQ
 2Sg+aFfl2acCrHVpqr7/tJzl1ATjDqgE8yT/AWhoD/izwJMTLyR+A8w
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8940 MSS it is similar for MSM8937 MSS
without inrush current mitigation.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 44 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2ffcea7dbc79..27f4bd507a39 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -262,6 +262,7 @@ enum {
 	MSS_MSM8917,
 	MSS_MSM8926,
 	MSS_MSM8937,
+	MSS_MSM8940,
 	MSS_MSM8953,
 	MSS_MSM8974,
 	MSS_MSM8996,
@@ -753,6 +754,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		   qproc->version == MSS_MSM8909 ||
 		   qproc->version == MSS_MSM8917 ||
 		   qproc->version == MSS_MSM8937 ||
+		   qproc->version == MSS_MSM8940 ||
 		   qproc->version == MSS_MSM8953 ||
 		   qproc->version == MSS_MSM8996 ||
 		   qproc->version == MSS_MSM8998 ||
@@ -761,7 +763,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		/* Override the ACC value if required */
 		if (qproc->version == MSS_MDM9607 ||
 		    qproc->version == MSS_MSM8917 ||
-		    qproc->version == MSS_MSM8937)
+		    qproc->version == MSS_MSM8937 ||
+		    qproc->version == MSS_MSM8940)
 			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
 			       qproc->reg_base + QDSP6SS_STRAP_ACC);
 		else if (qproc->version != MSS_MSM8909 &&
@@ -825,6 +828,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			if (qproc->version == MSS_MDM9607 ||
 			    qproc->version == MSS_MSM8917 ||
 			    qproc->version == MSS_MSM8937 ||
+			    qproc->version == MSS_MSM8940 ||
 			    qproc->version == MSS_MSM8953 ||
 			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
@@ -1472,6 +1476,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	}
 
 	if (qproc->version == MSS_MSM8937 ||
+	    qproc->version == MSS_MSM8940 ||
 	    qproc->version == MSS_MSM8953) {
 		ret = qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
 		if (ret) {
@@ -2621,6 +2626,42 @@ static const struct rproc_hexagon_res msm8937_mss = {
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
+		"mss",
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
+	.version = MSS_MSM8940,
+};
+
 static const struct rproc_hexagon_res msm8953_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -2803,6 +2844,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
 	{ .compatible = "qcom,msm8937-mss-pil", .data = &msm8937_mss},
+	{ .compatible = "qcom,msm8940-mss-pil", .data = &msm8940_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},

-- 
2.52.0


