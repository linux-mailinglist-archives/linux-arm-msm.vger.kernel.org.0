Return-Path: <linux-arm-msm+bounces-97182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN1aM4CismkOOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:24:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13544270D99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A0D7301F589
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE62A3BD634;
	Thu, 12 Mar 2026 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="ZNpMw/ie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1397C3BD25C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314669; cv=none; b=JzwrgqWgt0Xhgha2sWiDCE+yDOp/b1SCtY86ClLBvloEXP3qvEe39EnqMktb6+Hzy4hJOZZLQXIYLI/fvCESH2i+f8AEF7uQpe9q0sgNzfjqFgVOV26pqQMmDAghw0AoZfPdTg1OHkRPLfL+dSIRMqUp7CSLZnfMWQHZOqa7ugo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314669; c=relaxed/simple;
	bh=YBOjOezRXgSWTxZGDoyuvFIEMJrV2161nYB8kYXjU8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PINqLYOaiIRBSv1cpoT3jld1nvIoZs5Rn1ujBKA+oz2YiI8oDRxGXNSzCh+YdPE4+5fc99phN+emtkdeZvofKrcpSP1EnIGcXOt9Ptpn9jW5J92e+9gz9HrCdaJ1yWvAHw91BfGbJ/16xyDGoSY7o3RPVIf2v3UMgefYFT5dZMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=ZNpMw/ie; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ffXIwn/SipTvQjaI8IylarOlKCDGzLC/zRz4bzxuSs=;
	b=ZNpMw/ieXOT5ObySb1m1BNRS57ZVqFAoyoF2sppfKUNESCbPJ83auE8qBEXwYgfrDsCliD
	A/WWsxntqfXRmgJD8NGpES2OokU+sL2Yct5fFTpc3VyulCT8GoCrZecYMBcmjlDXU1wYmV
	D8ElThhu/7R2iazVY0pcfawU6pMMVNKO8bOJ7JW0gcehUvnP9dAiAZPAZubyEQAa0UQ0b1
	cHPrvTAkKZhko4t+sbO993EJLXF2KQWT8z1NCA6q/ZkVfsFdb+ZnXhtx6BOXu0VQ8K8a3m
	3ywMvfHq3s8HkRuvGyYlXL3B2V4vFl3BAVX+o22IgvslUC4wZinL44f4nejCQw==
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
Subject: [PATCH v2 06/11] clk: qcom: gcc-sc8180x: Refactor to use qcom_cc_driver_data
Date: Thu, 12 Mar 2026 08:12:11 -0300
Message-ID: <20260312112321.370983-7-val@packett.cool>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[packett.cool,kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-97182-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Queue-Id: 13544270D99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a qcom_cc_driver_data struct instead of a long custom probe
callback to align with modern qcom/gcc-*.c style.

No functional change intended.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/gcc-sc8180x.c | 61 +++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 2888c4ebd5e8..88b95d5326d9 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4605,7 +4605,7 @@ static const struct qcom_reset_map gcc_sc8180x_resets[] = {
 	[GCC_VIDEO_AXI1_CLK_BCR] = { .reg = 0xb028, .bit = 2, .udelay = 150 },
 };
 
-static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
+static const struct clk_rcg_dfs_data gcc_sc8180x_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
 	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
 	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
@@ -4647,6 +4647,19 @@ static struct gdsc *gcc_sc8180x_gdscs[] = {
 	[HLOS1_VOTE_TURING_MMU_TBU1_GDSC] = &hlos1_vote_turing_mmu_tbu1_gdsc,
 };
 
+static u32 gcc_sc8180x_critical_cbcrs[] = {
+	0xb004,  /* GCC_VIDEO_AHB_CLK */
+	0xb008,  /* GCC_CAMERA_AHB_CLK */
+	0xb00c,  /* GCC_DISP_AHB_CLK */
+	0xb040,  /* GCC_VIDEO_XO_CLK */
+	0xb044,  /* GCC_CAMERA_XO_CLK */
+	0xb048,  /* GCC_DISP_XO_CLK */
+	0x48004, /* GCC_CPUSS_GNOC_CLK */
+	0x48190, /* GCC_CPUSS_DVM_BUS_CLK */
+	0x4d004, /* GCC_NPU_CFG_AHB_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+};
+
 static const struct regmap_config gcc_sc8180x_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
@@ -4655,6 +4668,21 @@ static const struct regmap_config gcc_sc8180x_regmap_config = {
 	.fast_io	= true,
 };
 
+static void clk_sc8180x_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Disable the GPLL0 active input to NPU and GPU via MISC registers */
+	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
+}
+
+static struct qcom_cc_driver_data gcc_sc8180x_driver_data = {
+	.clk_cbcrs = gcc_sc8180x_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc8180x_critical_cbcrs),
+	.dfs_rcgs = gcc_sc8180x_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_sc8180x_dfs_clocks),
+	.clk_regs_configure = clk_sc8180x_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sc8180x_desc = {
 	.config = &gcc_sc8180x_regmap_config,
 	.clks = gcc_sc8180x_clocks,
@@ -4664,6 +4692,7 @@ static const struct qcom_cc_desc gcc_sc8180x_desc = {
 	.gdscs = gcc_sc8180x_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc8180x_gdscs),
 	.use_rpm = true,
+	.driver_data = &gcc_sc8180x_driver_data,
 };
 
 static const struct of_device_id gcc_sc8180x_match_table[] = {
@@ -4674,35 +4703,7 @@ MODULE_DEVICE_TABLE(of, gcc_sc8180x_match_table);
 
 static int gcc_sc8180x_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sc8180x_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb008); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb00c); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb044); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb048); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x48190); /* GCC_CPUSS_DVM_BUS_CLK */
-	qcom_branch_set_clk_en(regmap, 0x4d004); /* GCC_NPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-
-	/* Disable the GPLL0 active input to NPU and GPU via MISC registers */
-	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-					ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sc8180x_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sc8180x_desc);
 }
 
 static struct platform_driver gcc_sc8180x_driver = {
-- 
2.52.0


