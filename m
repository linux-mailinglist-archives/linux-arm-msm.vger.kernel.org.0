Return-Path: <linux-arm-msm+bounces-87034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7291DCEB10C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75F01302E14D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686462E9ECA;
	Wed, 31 Dec 2025 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Vfv6rTCk";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="3JkNe5Je"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3BB2E6CD8;
	Wed, 31 Dec 2025 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148181; cv=none; b=NrnQvA6349SKU+WV/V7bPQ5B9qtu/xcfqRYTSsdruBFl8NhnjY9SNJIPEtfWRJqN2EGdu1FPsQ5+DT3Kek8Xxj7YBIkBVtizeK48Rs74FeQLgZjeq3PfU3jvcuZ3kALsWpKhJE4vTB8+r0vr+lnLieqQE96yloHzUgGw3xlrEu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148181; c=relaxed/simple;
	bh=kje6FfYzsYzhL0+9EN+aOdgwkk5qI+W58fEitS2M52k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fb+oi0fbaUDyM95kC49fSPv5mI+S0ecs60FC1XDoZYfys6JMLxRr7VMSIkoKD1xkS6VyjS1tm2kzqVJumo41i4NGISj36EYbM9uT32MPqJfKlqZ5dIFcVUdM8gKaDwzJLDZdpFKR1oLY++lrAvzcT8Rcz5hx4lt5bxzlCSGD4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Vfv6rTCk; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=3JkNe5Je; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148171; bh=bwgpq2SxZk3X77Y3wWKbmv0
	WkrIqAtrkmxEA1yyLCS8=; b=Vfv6rTCkI1iE3RJY0rGGO9YWR+6rWbMewo9Fptn1IiIVN8Ui5E
	gBeCzT4bU4xvV8wtvz2Yy8Ji1p92LgKHfCv4MT040+7/Q1QcBamzMn9pFPP1GfqI0kfGUqPnWsY
	0nzAqKhooVskRH0OfLQ8yAABnuvCcqrCqq7LQOhZpnuOPclRt+TzQAerZT/DfRRPrBjYM9s+wpm
	dUQlRn3u3Aab7Bm3wdJfIO85MnrlFsl2k56cvEnpo0iEF7AepoD6hp++viH5UT32XkIrUIPplxW
	gx+k+qCtq8yN2L/3IXr/J+hG2Z0+y2A98INJUT9s+MTh4iZ9+oKOL7U5C9oDQZZawng==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148171; bh=bwgpq2SxZk3X77Y3wWKbmv0
	WkrIqAtrkmxEA1yyLCS8=; b=3JkNe5Je/Su8bpl9lSVPM83cYYJ7fP4dlvqev0wTOp3UeD0CO4
	EqlVbGXeV/pWzL/SU88t4e1rHm90xtdMhcDg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 03:29:28 +0100
Subject: [PATCH v2 1/9] remoteproc: qcom_q6v5_mss: Introduce
 need_pas_mem_setup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v2-1-ae5eafd835c4@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148170; l=4192;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=kje6FfYzsYzhL0+9EN+aOdgwkk5qI+W58fEitS2M52k=;
 b=qAZ9tLJh3Pgfd6VZoszjBDGTdyZKgKFB4D8199xuvU8ATaJgnvlpR7FnEh/FGBil6C+9Jg9G+
 9lhUZaGIsFtAqgKQ7nQmABv+i7brAxAaWSy/WBrrZdE8hgjy1hKnpEd
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Some platforms like MSM8953 and MSM8937 TZ needs to be
informed of the modem start address and pas_id.
Lets introduce need_pas_mem_setup flag for handle this case.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 91940977ca89..3c404118b322 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -162,6 +162,7 @@ struct rproc_hexagon_res {
 	char **proxy_pd_names;
 	int version;
 	bool need_mem_protection;
+	bool need_pas_mem_setup;
 	bool has_alt_reset;
 	bool has_mba_logs;
 	bool has_spare_reg;
@@ -240,6 +241,7 @@ struct q6v5 {
 	struct qcom_sysmon *sysmon;
 	struct platform_device *bam_dmux;
 	bool need_mem_protection;
+	bool need_pas_mem_setup;
 	bool has_alt_reset;
 	bool has_mba_logs;
 	bool has_spare_reg;
@@ -1441,7 +1443,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
 	}
 
-	if (qproc->version == MSS_MSM8953) {
+	if (qproc->need_pas_mem_setup) {
 		ret = qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
 		if (ret) {
 			dev_err(qproc->dev,
@@ -2224,6 +2226,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
 		NULL
 	},
 	.need_mem_protection = true,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = false,
 	.has_mba_logs = true,
 	.has_spare_reg = true,
@@ -2253,6 +2256,7 @@ static const struct rproc_hexagon_res sc7280_mss = {
 		NULL
 	},
 	.need_mem_protection = true,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = false,
 	.has_mba_logs = true,
 	.has_spare_reg = false,
@@ -2285,6 +2289,7 @@ static const struct rproc_hexagon_res sdm660_mss = {
 			NULL
 	},
 	.need_mem_protection = true,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
@@ -2321,6 +2326,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
 			NULL
 	},
 	.need_mem_protection = true,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = true,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
@@ -2353,6 +2359,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
 			NULL
 	},
 	.need_mem_protection = true,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
@@ -2392,6 +2399,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 			NULL
 	},
 	.need_mem_protection = true,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
@@ -2427,6 +2435,7 @@ static const struct rproc_hexagon_res msm8909_mss = {
 		NULL
 	},
 	.need_mem_protection = false,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
@@ -2473,6 +2482,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
 		NULL
 	},
 	.need_mem_protection = false,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
@@ -2509,6 +2519,7 @@ static const struct rproc_hexagon_res msm8953_mss = {
 		NULL
 	},
 	.need_mem_protection = false,
+	.need_pas_mem_setup = true,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
@@ -2562,6 +2573,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
 		NULL
 	},
 	.need_mem_protection = false,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
@@ -2600,6 +2612,7 @@ static const struct rproc_hexagon_res msm8226_mss = {
 		NULL
 	},
 	.need_mem_protection = false,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
@@ -2646,6 +2659,7 @@ static const struct rproc_hexagon_res msm8926_mss = {
 		NULL
 	},
 	.need_mem_protection = false,
+	.need_pas_mem_setup = false,
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,

-- 
2.52.0


