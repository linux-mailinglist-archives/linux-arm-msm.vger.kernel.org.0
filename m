Return-Path: <linux-arm-msm+bounces-87126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE7ACEC3F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4492F3018F79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F152877C3;
	Wed, 31 Dec 2025 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mmjHG87p";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="V1BsLWu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453171E1DE5;
	Wed, 31 Dec 2025 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198619; cv=none; b=obP2OiR1hRgal/7oDRZM6/yoGPZP50j3KKwdGJVeTlY7Rs2fWLYQ6yeJeNxLuqwsp+bSxOoJXQUR7vh6ev3b0pMMmHzBWGR9eHISOn4dhOFTlNiS5Fsv58nBEywjH99PH6trNZPAUZT0KK3FZRpvvUF0Jk0UhKw/W2dTRey9tsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198619; c=relaxed/simple;
	bh=kje6FfYzsYzhL0+9EN+aOdgwkk5qI+W58fEitS2M52k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPndYAwJuIqWTYZcTZB/GIxjpQ85DMuHkEcCmrymdjFAyn+93BwzL7rCAiWUsIKyef6CdnKJT5AVSfOFzcMUDpufDZAffAaI4FBVR9xVOFYZPfZs3j5oNzjgDyPyi6U0CzPs3sXJ31mJfv/60gMpDbhSnvSeVoMou2jeU8WKIi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mmjHG87p; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=V1BsLWu5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198615; bh=bwgpq2SxZk3X77Y3wWKbmv0
	WkrIqAtrkmxEA1yyLCS8=; b=mmjHG87pkEaC87S+PZXbXgbhXCVRew9lamdqgYzd3hB67BXBg3
	/xDkfqqs7OR6NjpXjaDX9XOV9yAoH+hXvc4mgW5z8aVoHDlGcs3YPBPRfFGmnVM2w+YF9EMGZCo
	zgrn1kdamWvh9lEXcYiUw/dAvsDcgcyg9JwWywQqffLxylrmAFWTyxB0wFnb/mhEjA92jb7M/v5
	p3XP6zaUjjRIHa55jiqqSIXbaZHPpOW89aMP1c0+aPBpqWOkH36yFLhGGzj3v6FSu7O7DRqrg7w
	30CA6ySw7I7Ex2wAoYlWH3tewTIZOyedQ4cKWp2Hu62P32SnKMK/iuhDVh8Ey2Gc2Ug==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198615; bh=bwgpq2SxZk3X77Y3wWKbmv0
	WkrIqAtrkmxEA1yyLCS8=; b=V1BsLWu5inDCBFXAFIv8yxafcC+x3wRY68/KvscgDU58ibtgfE
	d9k3Vc3Vj1S6OFxSz8up2ukaj/S2fbokLsCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 17:30:11 +0100
Subject: [PATCH v3 1/9] remoteproc: qcom_q6v5_mss: Introduce
 need_pas_mem_setup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v3-1-f80e8fade9ec@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767198613; l=4192;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=kje6FfYzsYzhL0+9EN+aOdgwkk5qI+W58fEitS2M52k=;
 b=gbKuTuPWszNgDe2jlQeT+XWVrTpMeMg9pZm6aP5vjAaMoy+7kdp/GltL19LWZ7dE8MQCW4uel
 i97Z5mKnrI5BzRRVrvWN6MUIzRlXiYmStwvaC4Uh50GNKpntP5LhiXp
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


