Return-Path: <linux-arm-msm+bounces-97187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNDlLjunsmnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:44:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A6E271373
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0583A32441C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8203BED6A;
	Thu, 12 Mar 2026 11:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="oILVuSdh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7FE3B6C0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314695; cv=none; b=rDaFWDeYibSp4tCacm2ZrYBy3+IMNoMuzmMgsu/22IX2GKsgNsdFzhx3xqXg1TbwgQWbA3oXfXmnee/L0GXMlBImHn8/BZXtWTfTGdUzfegXc+lXy9872XuhnfaxtTOP7MFkqq9Vae6Geshcazcd5ESrTEcNMLLLYnu4la6zH7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314695; c=relaxed/simple;
	bh=SHsUWsOET7NnIcPa0jYYlqLqNbSur5ziIMfCgbWbCrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fVIW+FHxPl/S968avx+iFbwap2f6lEJV89W9Gtv8DZPNv46uEs91N3440GvpqsWoKoDR8GZp1NvxxxSY/KJWnu3hFpi5gJXauYGt2fGTRSnvaiGYATDuPTY1bJ4kTrPysNL3Q9SOXT5zHHvEBOPShjcilvYfGst0NdZHgPQnZ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=oILVuSdh; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLUzWeEcNPzK2JN8Mrg4INR+pFs0gxDSLlWR+/wJ15k=;
	b=oILVuSdhrgvJcsjqzi4KE/t0d6Jm7LKOudVqwAu8zyIf3a2VLHUpesausSf7eyYyA324SV
	F3uGERqDjBOYunaYWk3fOOSg0XGqoRFCDPGgMpZzEGjRu2c3c8D/ju6Ubw6OIcpHEZi0S2
	haNsyPJGyOsEIHUlTJhcK5fMnvmPlFn8mcS3jdIn5NJWZoHWyEswALXBtteeExg/LIHXuC
	AbzzOfRyUug48xTtfJL3iK40b5DrtYfNftvLtZj9RjsRhjqsqCcvtnWS0i+/eUTazPwwA5
	jNdkPOIM4Y3JiP0gOSpBXmoRvN5zPy6PzDhw0/qWzCN+ud5EmIKdgeMb7Npjuw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] clk: qcom: camcc-sc8180x: Refactor to use qcom_cc_driver_data
Date: Thu, 12 Mar 2026 08:12:16 -0300
Message-ID: <20260312112321.370983-12-val@packett.cool>
In-Reply-To: <20260312112321.370983-1-val@packett.cool>
References: <20260312112321.370983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[packett.cool,kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-97187-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Queue-Id: 32A6E271373
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a qcom_cc_driver_data struct instead of a long custom probe
callback to align with modern qcom/gcc-*.c style.

No functional change intended.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/camcc-sc8180x.c | 67 +++++++++++++++-----------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index 67b2055bd212..bbd7add69cb0 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -7,7 +7,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sc8180x-camcc.h>
@@ -63,6 +62,7 @@ static const struct alpha_pll_config cam_cc_pll0_config = {
 
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
+	.config = &cam_cc_pll0_config,
 	.vco_table = trion_vco,
 	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
@@ -138,6 +138,7 @@ static const struct alpha_pll_config cam_cc_pll1_config = {
 
 static struct clk_alpha_pll cam_cc_pll1 = {
 	.offset = 0x1000,
+	.config = &cam_cc_pll1_config,
 	.vco_table = trion_vco,
 	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
@@ -167,6 +168,7 @@ static const struct alpha_pll_config cam_cc_pll2_config = {
 
 static struct clk_alpha_pll cam_cc_pll2 = {
 	.offset = 0x2000,
+	.config = &cam_cc_pll2_config,
 	.vco_table = regera_vco,
 	.num_vco = ARRAY_SIZE(regera_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_REGERA],
@@ -219,6 +221,7 @@ static const struct alpha_pll_config cam_cc_pll3_config = {
 
 static struct clk_alpha_pll cam_cc_pll3 = {
 	.offset = 0x3000,
+	.config = &cam_cc_pll3_config,
 	.vco_table = trion_vco,
 	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
@@ -248,6 +251,7 @@ static const struct alpha_pll_config cam_cc_pll4_config = {
 
 static struct clk_alpha_pll cam_cc_pll4 = {
 	.offset = 0x4000,
+	.config = &cam_cc_pll4_config,
 	.vco_table = trion_vco,
 	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
@@ -277,6 +281,7 @@ static const struct alpha_pll_config cam_cc_pll5_config = {
 
 static struct clk_alpha_pll cam_cc_pll5 = {
 	.offset = 0x4078,
+	.config = &cam_cc_pll5_config,
 	.vco_table = trion_vco,
 	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
@@ -306,6 +311,7 @@ static const struct alpha_pll_config cam_cc_pll6_config = {
 
 static struct clk_alpha_pll cam_cc_pll6 = {
 	.offset = 0x40f0,
+	.config = &cam_cc_pll6_config,
 	.vco_table = trion_vco,
 	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
@@ -2810,6 +2816,21 @@ static const struct qcom_reset_map cam_cc_sc8180x_resets[] = {
 	[CAM_CC_MCLK7_BCR] = { 0x50e0 },
 };
 
+static struct clk_alpha_pll *cam_cc_sc8180x_plls[] = {
+	&cam_cc_pll0,
+	&cam_cc_pll1,
+	&cam_cc_pll2,
+	&cam_cc_pll3,
+	&cam_cc_pll4,
+	&cam_cc_pll5,
+	&cam_cc_pll6,
+};
+
+static u32 cam_cc_sc8180x_critical_cbcrs[] = {
+	0xc1e4, /* CAM_CC_GDSC_CLK */
+	0xc200, /* CAM_CC_SLEEP_CLK */
+};
+
 static const struct regmap_config cam_cc_sc8180x_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -2818,6 +2839,13 @@ static const struct regmap_config cam_cc_sc8180x_regmap_config = {
 	.fast_io = true,
 };
 
+static struct qcom_cc_driver_data cam_cc_sc8180x_driver_data = {
+	.alpha_plls = cam_cc_sc8180x_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_sc8180x_plls),
+	.clk_cbcrs = cam_cc_sc8180x_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sc8180x_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sc8180x_desc = {
 	.config = &cam_cc_sc8180x_regmap_config,
 	.clks = cam_cc_sc8180x_clocks,
@@ -2826,6 +2854,8 @@ static const struct qcom_cc_desc cam_cc_sc8180x_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sc8180x_resets),
 	.gdscs = cam_cc_sc8180x_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sc8180x_gdscs),
+	.use_rpm = true,
+	.driver_data = &cam_cc_sc8180x_driver_data,
 };
 
 static const struct of_device_id cam_cc_sc8180x_match_table[] = {
@@ -2836,40 +2866,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_sc8180x_match_table);
 
 static int cam_cc_sc8180x_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	regmap = qcom_cc_map(pdev, &cam_cc_sc8180x_desc);
-	if (IS_ERR(regmap)) {
-		pm_runtime_put(&pdev->dev);
-		return PTR_ERR(regmap);
-	}
-
-	clk_trion_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
-	clk_trion_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
-	clk_regera_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
-	clk_trion_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
-	clk_trion_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
-	clk_trion_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
-	clk_trion_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
-
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAM_CC_GDSC_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc200); /* CAM_CC_SLEEP_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sc8180x_desc, regmap);
-
-	pm_runtime_put(&pdev->dev);
-
-	return ret;
+	return qcom_cc_probe(pdev, &cam_cc_sc8180x_desc);
 }
 
 static struct platform_driver cam_cc_sc8180x_driver = {
-- 
2.52.0


