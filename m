Return-Path: <linux-arm-msm+bounces-87856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E0ACFD6D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 268A6306C49D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DCA315D39;
	Wed,  7 Jan 2026 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NmHAORKs";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="9eQ8YyJ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB6313267;
	Wed,  7 Jan 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785662; cv=none; b=VmzhgkUc8KUnU2GtGoCAxpiFo1CfSoUG07pFnUhO3EePwPkNly58IkSM04k24di0MJbJn0G67NuhMeKgYuhB3pl+5l3GO7O2PI66avSVi34bJRTZjX19hchrt1900QEQCFfEfc9BDi6xUVGjn1GMItT8MfaUi0KP0RePAQ93J9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785662; c=relaxed/simple;
	bh=+p1VWPl++dZCum57JQ+bZTprU7Zc+hvDnu7phy6QRKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAXwZwIq6gfOnzan1jho4Dq0D0ktQNWzOrl6SQ9AuOhl0IDMzHxg1l+VsXjXe8lUru4ZyQnYBEszsxeUMYccGyGKuaNG2FwEY8WMKFgAHkSWCr+GdoK2Fk/cbJsOtOvlj1flWj5uMAlSQ8VIXfy8SfkYp0lW6MY3+G6u2hkL8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NmHAORKs; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=9eQ8YyJ4; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785646; bh=XRn1ho6NTfYL5GglfhsvIY1
	4u4MlmGRkWxhBebVqa7A=; b=NmHAORKso1SeQQAbaWE13D75dhUh7xpM9MYTsoqC8FnD3fcgBl
	qTxHZJimuy1ZwLW3ImpJL2+pyYBi/SL5i4fB8mgywDIriwputDblhzB1mtm+nA2xlvUpx86Fe1y
	5ZcqQfkAi7gjk3QE+qz1HI5LPcPrt6X2yQiqG2gh6diE9kdo0Ao3peKfR3Ue4Hb/WYzBM1HaeFl
	eTtoOzopv3M5tu5Qj7jZC22ri5KpXsAyEVEbdz4qgDaOp0OigCOAUAgR/zwduuF3YOX1we34sqV
	a8qAb5IXNOiOkk44xLpyTwfs6IZuDi7ZaULJQkxcZMHvfIY4T+r18eBY97kFt9qDFTw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785646; bh=XRn1ho6NTfYL5GglfhsvIY1
	4u4MlmGRkWxhBebVqa7A=; b=9eQ8YyJ4xjJFz1YCi3kF3yrYNffyK6JzH7hg/Os181e3TWOKqe
	EzpR9XtZCgjlL4CuHhuNJP8CNmlsZxlF4ZAQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 12:34:01 +0100
Subject: [PATCH v4 1/9] remoteproc: qcom_q6v5_mss: Introduce
 need_pas_mem_setup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-mss-v4-1-9f4780345b6f@mainlining.org>
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
In-Reply-To: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767785644; l=4240;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=+p1VWPl++dZCum57JQ+bZTprU7Zc+hvDnu7phy6QRKw=;
 b=iqOrGwIH+gFKxqjR9SifaJIG6VW337aN1yQ1rMUGomSfdvuBQfN1Gu5ZLJYKcN2CYzBcHHtEG
 1Gd+3hvBDPNCI3YzZAqL54sUxDM8fgWAgIK5supgk0CnMHiRcDfeLeR
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Some platforms like MSM8953 and MSM8937 TZ needs to be
informed of the modem start address and pas_id.
Lets introduce need_pas_mem_setup flag for handle this case.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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


