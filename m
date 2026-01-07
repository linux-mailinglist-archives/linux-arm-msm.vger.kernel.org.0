Return-Path: <linux-arm-msm+bounces-87855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DFCCFD6AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04B2330574D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442A53148D4;
	Wed,  7 Jan 2026 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HIv+9vSV";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dmDpC+0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F512FDC54;
	Wed,  7 Jan 2026 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785660; cv=none; b=G47ZWv55ETEZ3dTNgS4Xl2nto7OgSdj9cw+AVKW1HaHLxSZ/TZGLTxV5XddcH2PRfFx8RL55rQ2PXDNQKGa6GSlPy1c4ZSyVRf2hCFdW8c3nL/ApAToVrgock5w+/3sUESqrGX/vpL7iUUHAtNTd0nx7zUPnTu5+/ejzq/fmTNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785660; c=relaxed/simple;
	bh=2LOBnZQdhwhtxoN8oxG36vP3b0Q1kq2JAsSrL1+ATYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cYEtft7GdMvywCYmBEkM7ETu9biiO3g72MHgqulzaDzmlp2q1ofIXAWGaQyydZBi//P55oaqzwndNofEa592bLF3QA58n0C9CPUIUf0YFJxvS+uTJOPVgjGLE2d6NWdCAIRT9n0O3D+UDXEKkIgUL1vFIPpFCM3eLxNpjyUPo+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HIv+9vSV; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dmDpC+0Z; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785649; bh=WJbF6wMrZpVFL9oilPmwqfe
	fAZPbibR9ykImpBr0JYg=; b=HIv+9vSVk1XX1zYxdxZaEPVUj/XyCN1Du+JNWQI5BnIiZ911to
	YCD+2QnX+aQAxYNSMlPbyn8hPo/a/8eHSsX0C9VJJAWQSDy6TIeV8l+gntBaToQSE9InlQaG8l3
	tQMrMhFDH430MjCcL7yR6YftH0A/G5BFcUfozzk17KVQP5oZsEydXMc/X7C3wqzrnycRi1kc4kP
	WB0wOwUmUU8HaCnVEOseBbLTcDdiBNQPMndkIcgJO4I4ABtDFv/ozcrEkMGoy6/Pte/KOgZRg5D
	iqCx053yyuNr0CZRAt7ooRGusg29K1HXwuKRkFfU/VJG0SRjikphCgCo6HliXiUY6oQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785649; bh=WJbF6wMrZpVFL9oilPmwqfe
	fAZPbibR9ykImpBr0JYg=; b=dmDpC+0ZSLjOKRINJeFlQ3/8J6CtSPx2jUudo21UN4hafPSAya
	xnfOB4Ra5onO+dHhsTmZrB8puDyvKZ60FuCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 12:34:07 +0100
Subject: [PATCH v4 7/9] remoteproc: qcom_q6v5_mss: Add MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-mss-v4-7-9f4780345b6f@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767785644; l=3470;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=2LOBnZQdhwhtxoN8oxG36vP3b0Q1kq2JAsSrL1+ATYA=;
 b=WEugoUDlSNCuTgWr03uh/6fbjIVYhZVSaiRNSOsJC7iBI+p2gXBgvkQ5MV/SY5YtN+QcCJFxG
 O/+EEtBjDMSBEf7HuKwr31swLxd1LiEc/qHbiDnSb6DlkfZq+RPxXi2
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8937 MSS it is similar to MSM8917 MSS.
It differs primarily in that TZ needs to be informed of
the modem start address and pas_id.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 53 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index c17ac84636b9..46f287672291 100644
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
@@ -828,7 +831,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				i = 19;
 				reverse = 0;
 			} else if (qproc->version == MSS_MDM9607 ||
-				   qproc->version == MSS_MSM8917) {
+				   qproc->version == MSS_MSM8917 ||
+				   qproc->version == MSS_MSM8937) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
 				i = 19;
 				/*
@@ -2600,6 +2604,50 @@ static const struct rproc_hexagon_res msm8917_mss = {
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
@@ -2785,6 +2833,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
+	{ .compatible = "qcom,msm8937-mss-pil", .data = &msm8937_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},

-- 
2.52.0


