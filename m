Return-Path: <linux-arm-msm+bounces-87854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DCACFD6A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DA9D305FE0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF15313E28;
	Wed,  7 Jan 2026 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Mv25uXLA";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="3s6n/HKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECCB30DED4;
	Wed,  7 Jan 2026 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785659; cv=none; b=ZWqHqyETKZQZHFboTK0QjdBFpOx7Md5qdduyEMjxg6vIJz7N2MYhMuOGexw35S8ioEf/To4dERvpb/TElA5Nydzu8IWHxG8AUyVtjsQi/B+U0/u6jj0Z6XtQPgFJD3gnXuC49NUhopxjuu1zuLULNuQnsZdqcWw2/enmm+a9PYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785659; c=relaxed/simple;
	bh=fCHkgfJTdPgJs/aXTPympygi/vQ2yZblQQbFDmHXFcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZ9yPLbRxIbiCwh8NhT2wFAxJHaXu0fVdOqhcDPWY8Bm0GshcUrMFeg0Y19NH6Zf+6Ui/1g5XozO3CgLAZ3nemRgEonmPO5P4pBvFlpaDlNqjt4GkIXwg6no35Q1XwdQXd2buspTjtd7hdvJpYBINxaFh9IIWHY2TCXFWjbMAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Mv25uXLA; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=3s6n/HKo; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785648; bh=eTyPGEXXAkiExNjCkSZ0Hyh
	UyFtUM3a8TBAopr+RCjg=; b=Mv25uXLAJmW+6n0muY+e1prViMHUQtcvw6n2/IKeEtEw8dwsJS
	UFwPZGwfR0atH+f+78f9yihWbQqjfbyzX4TBMeW55wWwTaZyWKUeXGgnCqR1HkmGwzm2uG+/8vU
	exQL983+2CkVIB+7IF7whVsbRnBQVzQD/qZuyV7IuIIzopGda80Ne/mDXC8nSJ25GDIcaL5XxMr
	QIpGKJtyAIXPV2zTGIbfikS2HGiTn2vcDDdLRr4pBG2fTdVp26V34g69dmTbO8k0kUX6gyL2qZ2
	xKmhtClOs2zSYNTOEv9dH5d0xmgmA9XB0FUIMTPxd/5/m5ZwF2C4vMPG57yS7iDhHOQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785648; bh=eTyPGEXXAkiExNjCkSZ0Hyh
	UyFtUM3a8TBAopr+RCjg=; b=3s6n/HKoVDeSUq77OWg5t08qlK88WWDbeUN07midZfzEBlHBxl
	opyLeOrivpPYv1kTpDaL91VEIZrpyK+OcNCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 12:34:05 +0100
Subject: [PATCH v4 5/9] remoteproc: qcom_q6v5_mss: Add MSM8917
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-mss-v4-5-9f4780345b6f@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767785644; l=3331;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=fCHkgfJTdPgJs/aXTPympygi/vQ2yZblQQbFDmHXFcg=;
 b=FaIPfl5iLGdxLcWvMZWIkdMVzhrljA3nJZCltVhoE3U89bjnwA8JJ8rg/ZPGUcW1wE9pQo0jd
 pbvRCW4GqNYCfC9+7GQlOUQpEypL8yVsTuNdqOqBDmfcs78fc5OqHBt
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8917 MSS it is similar for MDM9607 MSS
only difference is the mss supply.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 53 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 1b50535add20..c17ac84636b9 100644
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
@@ -824,7 +827,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
 				i = 19;
 				reverse = 0;
-			} else if (qproc->version == MSS_MDM9607) {
+			} else if (qproc->version == MSS_MDM9607 ||
+				   qproc->version == MSS_MSM8917) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
 				i = 19;
 				/*
@@ -2552,6 +2556,50 @@ static const struct rproc_hexagon_res msm8916_mss = {
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
@@ -2735,6 +2783,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},

-- 
2.52.0


