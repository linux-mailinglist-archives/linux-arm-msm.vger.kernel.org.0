Return-Path: <linux-arm-msm+bounces-87134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41000CEC400
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9FF130239DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DAB29A9FA;
	Wed, 31 Dec 2025 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BY7fF7/c";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RVmZ+qPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CDF2882A8;
	Wed, 31 Dec 2025 16:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198635; cv=none; b=oqfnJFrLiMXh+OOyd4QDcaWI1FpHbyFuJ4d5dj6y7JuxSKE0Te8T0sb58shkprvLd6C9pd8zfeuOwt07lAWx6vu4D822HI4pNJKt+uAMqd11XnBXLqk2fl47/BtdJcpTQIh3nb+YtnLlcWaVn3/K1l4dEg3+eQb/EEyh/9BpJHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198635; c=relaxed/simple;
	bh=TmL9QDt7sBRdGhymEywQCc0IXrKiVKHWIsS5JFsFW/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6MdZVKkdv+tmALwxDiExakND5If6OVReur6A/vvaiSWXHdyfmP/pRWIzcICSGN98TeGTaQgfcukJzDjH2G/bCAKgJDcJIIW+C7z3w5wg83ME2d1UOmb56AekpCNbHdvRkMqTJJwVfUi7+IciI4Djh5SmB/RhgaIy7HAPy6Hgrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BY7fF7/c; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RVmZ+qPZ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198619; bh=6xzqWSlM9hSCOfnDTBxOY0X
	sFa1ihfz31r3Hq8gk9VU=; b=BY7fF7/cKjUX3rG23VS6+i/BZ3dAOi39kRdwRtQJFQ+XtnZlRJ
	PEw8OQ28UOaLmr8DG0xaCkdUDQ7mbZaT/SB6VUk7aeBSZNCCOs+vnU5eo9YyiubqRFEX3zhFLGS
	++/BgzbXHm1mKBE4N2/XyEQZQmlGIys1+1ksBMHMPj3R/Gq+XoOZNwouZShGEJIWZ1lxVdoYkwj
	An2WaeB5fyYtMx8Ok8EyaV23usFR+jC7f+20qNabxpoxtSyw9mkcBYehGc0cnH+j+vcR2djxi9Z
	lAhLdelfTnqW4UaVKXuEqlubkHoSxDqhz2mo0J95N2hR7ylfHpS+hDKTUU0RMr6XnPQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198619; bh=6xzqWSlM9hSCOfnDTBxOY0X
	sFa1ihfz31r3Hq8gk9VU=; b=RVmZ+qPZRj5GhxpFcaJiImK8s8h1tXBy8l1cD/QvhCGrcbWkOn
	dLe805+i8pqqv6pe+0iJWYCnqk69wqbr9GBg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 17:30:19 +0100
Subject: [PATCH v3 9/9] remoteproc: qcom_q6v5_mss: Add MSM8940
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v3-9-f80e8fade9ec@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767198613; l=3463;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=TmL9QDt7sBRdGhymEywQCc0IXrKiVKHWIsS5JFsFW/E=;
 b=LGUTBmurryKt2uiKkLhj0R3N+CD7lkVW0e6/9m5Qu58AZJPGYRZBKdgPLCjkEGSKNEdGC5HNo
 zPlWyIRuZvcB7k3Buxxg6UXEjzVuHLB4IqsAufg8vpoxY8dFxFGWlXp
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8940 MSS it is similar for MSM8937 MSS
without inrush current mitigation.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 51 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 390b35b5a69d..fe3a8e2208f4 100644
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
@@ -2651,6 +2655,50 @@ static const struct rproc_hexagon_res msm8937_mss = {
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
@@ -2837,6 +2885,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
 	{ .compatible = "qcom,msm8937-mss-pil", .data = &msm8937_mss},
+	{ .compatible = "qcom,msm8940-mss-pil", .data = &msm8940_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},

-- 
2.52.0


