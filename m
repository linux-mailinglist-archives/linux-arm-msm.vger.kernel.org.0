Return-Path: <linux-arm-msm+bounces-84717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D06CECAE534
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 23:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB68330072AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 22:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7842DC79A;
	Mon,  8 Dec 2025 22:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuRD52eH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2872D4B40
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 22:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233211; cv=none; b=HTDdp4GMEBv9+hRRAwOM8K0uZerQ84aC0T5OJQDmjJGrVQAsBdxDSxeT7WdPjP+lNq0inJxIDcBn2klDoHB2eqYZRwItodwombVUaq0jy6E/6B6CjlkhYmVWcVrcIqBMe2Jgc4zULakr81acLdZgkGfSxxpRT0GkoOP2OoFjz54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233211; c=relaxed/simple;
	bh=Y/PPeyVl2XzWDxE+UEj5DmnShJldEkJedeUhxFsDkVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lFrD9/Un6ZsJ6AV14rsXbbJ6KKGyPb938MVy1wgSS4IRl7yU2dYLYJYS0d4U0guuv+KPWdOnBRpGaR3pGZJm1d/bkHa6roERp8Wn0NeamO2E+DOyzK45F//bBWdsuRxSQaMfNyL8VDYUwaAFyn/dC8hfrsDUAdh00SXxpzQd0mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuRD52eH; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6571763793bso2654835eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 14:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765233209; x=1765838009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=negcTziY+LrNbWPAmrwhVy6s9d23g35N3KHIauZ61rU=;
        b=EuRD52eH7TuRII2RwYm8O2fXb4NKTCQweTNnt19Hw2eOZja4v6k5BAcPUfK7cu2Bx+
         TZv1dT9A/KQFdqe0A8ta/xY9j19arAilC8g5pFle60m8/JDSReAdnGIpxMMXBTLoKFPb
         8iVbq5eVz+OlamDQS73LzCOD9rggKWo9eeJqGKDQyd5e38DooDqmIRWRyCdNWfXBWy63
         giBTYroAiVXSx80+UmsxzTPEO8QqrP5V5pGyqMeRU50jlZoMAksIf4SYcRDD8ETmIzG6
         hC2V85yyQEX0tANifi4/awK1kiLM4eq3moVRsnw/Iw89NkDlbPHiV4B2tDHtBJ0oijJG
         R0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765233209; x=1765838009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=negcTziY+LrNbWPAmrwhVy6s9d23g35N3KHIauZ61rU=;
        b=qLEVD7TjNpTWmxYEXbWfE+1dEyhQeMA7ng29Ynxu3Y8K9liD7TEAhZrd7zC0aXRd1c
         Tmk1gVRHdgsYhRMQvGWfPeGwSq4VeJ+7ezbGNUmeXjjohNg1D6nnH8rGS8zPAc+z8okH
         Tgu21l6VZDLpTLfgcoay59GIkUVQpwaEgePlOxippQGnoG4+TigoS5jeMKbsCOoet0iE
         w0HIrvobuTySMGBFto59v0hbu1X8BbWkO8cYpOe9El++7V8+cfU70Aujo7p3nZS/y0gw
         PMFUyvutMJGhcoq0fQp3wnTGSPACxvLM0K/ejz7/50UaN67gEn772R7mLsMSInfhhmWk
         Dv+g==
X-Forwarded-Encrypted: i=1; AJvYcCVgnyD2d0Qe22MzP5RZlVaULzKTw64bAA3OrpqD2PdTxlp2NO0kDJaen1v/dF6HD3ko+mUlYXNqXQRWPVil@vger.kernel.org
X-Gm-Message-State: AOJu0YxTNhTK/DJh6WiEIj3qUVKtSS4erOFK5n7agpihQBT3ZH2uR9Wo
	3940JCsJs/H771mIbx0lJluOC1DHCiQblsprhmUwxmJvBriabXCrfyhg
X-Gm-Gg: ASbGnctY6P8WTIqkOQ6IAtV3Gq+Adxy7/T1VI2q77oSobUAkxT1jqW3p5toRxQBYTox
	cVdVKzouIUpA0fuURjsgJzI/DVXxVTrOBSeS+ffv+ZBUqXQsDCERwnZbo8nRB98FYlHkJnuPlZK
	EQmIuPStvn3b1ULYFeeZHKJLg2h0nTAjAzezjuHK5TINaa2LvAekknqVGKU21Y1vqTtF12vsy3Q
	k1FUbEHeZ/KbGv94cuviJlYuK6Sv9udSU+Gthra+FOjnvp/D/MrYnL9lmG8npTBlmPjew6Sw6ml
	ZTSsN625acMOabln7BPTDudB2dplnr+g1yuBX2uEUjSWWgmLBtqUjiEjhZhGQ0hbfIYfx0q3tj3
	gfrUTRdzhd6kQhrNK2cJbf+YBgS17DgOgoKCLenqOT9cbJdtArsWnJeWDtAq0U1H7U5PGMkNVVK
	J9E4/SGe6eMLQCZTRUAQH34o7Rj4gu6va4mMToHjj/4LeEdXt8K2hBFSn2VkunNY+RIM1wM7Wyi
	FNtthm56E4xStCuFP5ocaq9ypOy
X-Google-Smtp-Source: AGHT+IG6Ll/NyvIG8hYX/ZfdNkDgkNTwNAALldNpzCAzjxyuTVtaEabPJY1hs7aspEwUNuhiMEb1pw==
X-Received: by 2002:a4a:ee0c:0:b0:657:56e3:7894 with SMTP id 006d021491bc7-6599a89ed27mr4341889eaf.5.1765233208778;
        Mon, 08 Dec 2025 14:33:28 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f50b5884d7sm9793436fac.19.2025.12.08.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 14:33:28 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Govind Singh <govinds@codeaurora.org>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] remoteproc: qcom_q6v5_wcss: drop redundant wcss_q6_bcr_reset
Date: Mon,  8 Dec 2025 16:33:14 -0600
Message-ID: <20251208223315.3540680-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wcss_q6_bcr_reset used on QCS404, and wcss_q6_reset used on IPQ
are the same. "BCR reset" is redundant, and likely a mistake. Use the
documented "wcss_q6_reset" instead. Drop ".wcss_q6_reset_required"
from the descriptor, since all targets now need it.

This changes the bindings expectations, however, it actually fixes the
driver to consume the intended ones (qcom,q6v5.txt), which lists
"wcss_q6_reset" and *not* "wcss_q6_bcr_reset"

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - rebased on latest remoteproc pull for v6.19
 - Added paragraph detailing binding expectations (from Konrad)

Changes since v1:
 - rework change to unify wcss_q6_bcr_reset and wcss_q6_reset
 
 drivers/remoteproc/qcom_q6v5_wcss.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index c27200159a88a..b391724cfd08e 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -96,7 +96,6 @@ struct wcss_data {
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool aon_reset_required;
-	bool wcss_q6_reset_required;
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
@@ -134,7 +133,6 @@ struct q6v5_wcss {
 	struct reset_control *wcss_aon_reset;
 	struct reset_control *wcss_reset;
 	struct reset_control *wcss_q6_reset;
-	struct reset_control *wcss_q6_bcr_reset;
 
 	struct qcom_q6v5 q6v5;
 
@@ -309,7 +307,7 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 		return ret;
 
 	/* Remove reset to the WCNSS QDSP6SS */
-	reset_control_deassert(wcss->wcss_q6_bcr_reset);
+	reset_control_deassert(wcss->wcss_q6_reset);
 
 	/* Enable Q6SSTOP_AHBFABRIC_CBCR clock */
 	ret = clk_prepare_enable(wcss->ahbfabric_cbcr_clk);
@@ -803,19 +801,10 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 		return PTR_ERR(wcss->wcss_reset);
 	}
 
-	if (desc->wcss_q6_reset_required) {
-		wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
-		if (IS_ERR(wcss->wcss_q6_reset)) {
-			dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
-			return PTR_ERR(wcss->wcss_q6_reset);
-		}
-	}
-
-	wcss->wcss_q6_bcr_reset = devm_reset_control_get_optional_exclusive(dev,
-							"wcss_q6_bcr_reset");
-	if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
-		dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
-		return PTR_ERR(wcss->wcss_q6_bcr_reset);
+	wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
+	if (IS_ERR(wcss->wcss_q6_reset)) {
+		dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
+		return PTR_ERR(wcss->wcss_q6_reset);
 	}
 
 	return 0;
@@ -1062,7 +1051,6 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 	.firmware_name = "IPQ8074/q6_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
-	.wcss_q6_reset_required = true,
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
 };
@@ -1072,7 +1060,6 @@ static const struct wcss_data wcss_qcs404_res_init = {
 	.firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
-	.wcss_q6_reset_required = false,
 	.ssr_name = "mpss",
 	.sysmon_name = "wcnss",
 	.ssctl_id = 0x12,
-- 
2.45.1


