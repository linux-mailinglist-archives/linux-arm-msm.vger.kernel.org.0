Return-Path: <linux-arm-msm+bounces-86721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB31DCE5144
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78E73302BD2B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A042A2D193C;
	Sun, 28 Dec 2025 14:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gQUGJDBZ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="V7Sr3c4F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C92C032E;
	Sun, 28 Dec 2025 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766931860; cv=none; b=gfaCeaGl+skci+VSqvejxni44luhirc8ILbWLcjUEN6Q/Csa2nsSOkt/sfFeipHRm2wQN4/8pc3r5YEUZBC/C74DpNGQwVW9L+E9kn0eBZBDiBDDPmhaWMaCrM6mkqnZaZUmvGtkVqixuG17/BFF4v+x7jJITwg9tn6vZgXbYrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766931860; c=relaxed/simple;
	bh=vK/ltfsJIuEzRNemSi6QAiX/16q8EA4UrZA1QtW/yyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPSC/5cdvim7GnnKyK3xXKjdI5ABh6I9iwGdLlJW//KJdOpG81MckMq1rUUbuHiMtfJe5gaAkAkeSmY1PgU9nIOPAIvxt0QRMvyIgsv5eX0DxTDWlASMUr4ArV9mqqs9zjsjcNSznBk2m33hLhhDiPafku2946cxQu7p+cQwszg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gQUGJDBZ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=V7Sr3c4F; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931723; bh=62KqXw9yWVaips6/ALcT8cO
	hWsgv3WQw7bl81N7ld6c=; b=gQUGJDBZtpNsuVYBBGF8e5gruzK+wa5JQZc7Bj0G1/t8jrXP7x
	RmQP5yKnBOzvQvs+ua/lNV7VzWwqtf1z+kfcTglOhdbugdd/Mi9crtfDqmq9cOkgCwPQ4jk9Ph7
	G3KrnIdBkT8SVYkiAMbjrqhc7V69RUN5+HL9YBGmhG1n/QiTdF4pyg3NfHqE4jTtKkfh5L8OYbW
	IMyNDphUhWLU2TTv/12l2SIhUDUakCBo0po8sagDZCDbyqZbOzK8pYQXD3oF9xZjq/RABZbkDfI
	WehPkAyX5tzaF7o1h7yCHhpmDrJAdy2eF92WXg2nh7nNcI3OFYlqXnkYPZrObaWNvIw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931723; bh=62KqXw9yWVaips6/ALcT8cO
	hWsgv3WQw7bl81N7ld6c=; b=V7Sr3c4FkmVNoMpUflMe07vKjD8bNq3jXyz0P1fQYZxUwy4Ept
	HSuEK0FaG9ojxKuPQ4p0fT3uwmZDo545qwCA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 28 Dec 2025 15:21:56 +0100
Subject: [PATCH 6/8] remoteproc: qcom_q6v5_mss: Add MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251228-mss-v1-6-aeb36b1f7a3f@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766931719; l=4078;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=vK/ltfsJIuEzRNemSi6QAiX/16q8EA4UrZA1QtW/yyk=;
 b=gKDTp+fQ0jRFJyTsIUTVBeCmk+bs6LlfaMhgHm0jmBPeYjWMdV4Mgl8JfDna8j3sKJsFU4CRk
 CGPCZ/cu4zMAjCFcMezoBuw5DCfOXgp8IVkjp3KKBqM+h2QR6hBzSec
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add support for MSM8937 MSS it similar to MSM8917 MSS.
It differs primarily in that TZ needs to be informed of
the modem start address and pas_id.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 49 +++++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2579558fb567..2ffcea7dbc79 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -261,6 +261,7 @@ enum {
 	MSS_MSM8916,
 	MSS_MSM8917,
 	MSS_MSM8926,
+	MSS_MSM8937,
 	MSS_MSM8953,
 	MSS_MSM8974,
 	MSS_MSM8996,
@@ -751,6 +752,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 	} else if (qproc->version == MSS_MDM9607 ||
 		   qproc->version == MSS_MSM8909 ||
 		   qproc->version == MSS_MSM8917 ||
+		   qproc->version == MSS_MSM8937 ||
 		   qproc->version == MSS_MSM8953 ||
 		   qproc->version == MSS_MSM8996 ||
 		   qproc->version == MSS_MSM8998 ||
@@ -758,7 +760,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 		/* Override the ACC value if required */
 		if (qproc->version == MSS_MDM9607 ||
-		    qproc->version == MSS_MSM8917)
+		    qproc->version == MSS_MSM8917 ||
+		    qproc->version == MSS_MSM8937)
 			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
 			       qproc->reg_base + QDSP6SS_STRAP_ACC);
 		else if (qproc->version != MSS_MSM8909 &&
@@ -821,6 +824,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			/* Turn on L1, L2, ETB and JU memories 1 at a time */
 			if (qproc->version == MSS_MDM9607 ||
 			    qproc->version == MSS_MSM8917 ||
+			    qproc->version == MSS_MSM8937 ||
 			    qproc->version == MSS_MSM8953 ||
 			    qproc->version == MSS_MSM8996) {
 				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
@@ -831,7 +835,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 				 * "inrush current" issues.
 				 */
 				if (qproc->version == MSS_MDM9607 ||
-				    qproc->version == MSS_MSM8917)
+				    qproc->version == MSS_MSM8917 ||
+				    qproc->version == MSS_MSM8937)
 					reverse = 6;
 			} else {
 				/* MSS_MSM8998, MSS_SDM660 */
@@ -1466,7 +1471,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
 	}
 
-	if (qproc->version == MSS_MSM8953) {
+	if (qproc->version == MSS_MSM8937 ||
+	    qproc->version == MSS_MSM8953) {
 		ret = qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
 		if (ret) {
 			dev_err(qproc->dev,
@@ -2579,6 +2585,42 @@ static const struct rproc_hexagon_res msm8917_mss = {
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
+	.version = MSS_MSM8937,
+};
+
 static const struct rproc_hexagon_res msm8953_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -2760,6 +2802,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8917-mss-pil", .data = &msm8917_mss},
 	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
+	{ .compatible = "qcom,msm8937-mss-pil", .data = &msm8937_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},

-- 
2.52.0


