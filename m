Return-Path: <linux-arm-msm+bounces-27569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9198B943556
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48B892848C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2479B1BE854;
	Wed, 31 Jul 2024 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="E9RNiVhJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="W/WaJfiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback22.i.mail.ru (fallback22.i.mail.ru [79.137.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A8F1BE22F;
	Wed, 31 Jul 2024 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448802; cv=none; b=S72w09ln7K8SFc0F2PiiUsoUobLVT1BE/4HGII58ERZXsWxZeAxkJBUMAUmXuM++XIRXoE9TnPvuMyGLdSUdhh6ea9dyGRXAt/jEEG3wBhnVHa5gu0IP8wvusB7FM2CTmGD8XOAZA/os8lkxb918zwFYu5OLamerZBTDVQyaBFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448802; c=relaxed/simple;
	bh=IWIkOiOPO9Z3P+Q1DL+WsagsTEoK6IrkH4pxk5fk6Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/+ejmi1tTSEwvVytdYfL4IiwLcx6zYfRJBeeRPWMpXFlob5kAagWBFJkehMJhhSHHy2HNwaF3yYfOx/jnCUQjhwZTtWPdTBnrHFPQ7mjgX3WaCfQjg5LnyhAzrMDfdCqJI+ZD9Oj0blNVxgM7V9zEM/l2UIBGvJSBsQ4egtqNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=E9RNiVhJ; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=W/WaJfiA; arc=none smtp.client-ip=79.137.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=AxpJ3uwTGNq14RStEKHgWF/Zndvnhh1RfoPtq3cN9tc=;
	t=1722448800;x=1722538800; 
	b=E9RNiVhJlaz+t8zM3Rs4F+/vGixShR+O0ygu02OMtOuQ+VtKkgk7y7xt39Pquu4P3ENOYPAlVbh9Ef2aqr6MOpQ0QXhkimnWlsNY+Gm6oR+Zd5ODULbqFYBvPxctoqViJFwD+OXHyaYGA96gxRWaByF2sk/yASgcr9tD3QY8W68=;
Received: from [10.12.4.12] (port=58366 helo=smtp37.i.mail.ru)
	by fallback22.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDcD-00Du6z-PW; Wed, 31 Jul 2024 20:59:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=AxpJ3uwTGNq14RStEKHgWF/Zndvnhh1RfoPtq3cN9tc=; t=1722448797; x=1722538797; 
	b=W/WaJfiAo6p1Z0amT9EYWYyMlNDKUIwOyEFFUZYXdt7S2ycuVTIkrBi5Fl8GQ5TQ9J7Olk03D6l
	/JRqXtGq4vMWnsfhhMxp7LLOtRdBP6GDmgy9KOjKX7HPzjsnhjFXXUD8xy4J+t+e+Muo29u/bxxDd
	2pX112jJOLtPy3Sas6U=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDby-00000000IYY-2btz; Wed, 31 Jul 2024 20:59:42 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	vkoul@kernel.org,
	vladimir.zapolskiy@linaro.org,
	quic_jkona@quicinc.com,
	dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	quic_tdas@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 08/10] clk: qcom: videocc-sm8450: Add SM8475 support
Date: Wed, 31 Jul 2024 20:59:17 +0300
Message-ID: <20240731175919.20333-9-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731175919.20333-1-danila@jiaxyga.com>
References: <20240731175919.20333-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9239C2541717B5AEF810C4A468CE7865A182A05F538085040048EAB2F9C24DBB53DE06ABAFEAF6705E0F3965BEAF8EBF0F806485F292FBEEB16538BC1624513DC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE771540F9ECFC94C4BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063716A4A39B750036BB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D862A5491648FEC983995830582C796B18BB16BFAEA554FF3DCC7F00164DA146DAFE8445B8C89999728AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC821E93C0F2A571C7BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB2C0837EA9F3D197644AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3E43D663FACA9F152BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B6957A4DEDD2346B4275ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A587CD5281A4328B6C5002B1117B3ED696FCEE7DBDAAD95236F5FEB6EB1EB183FD823CB91A9FED034534781492E4B8EEAD003C2D46C52F18F2C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF59C1C708A8BAD02C35B649C4129B82008394AC1A9CB4B3062B46D337FC50033A673DC415E80A8BD91D9D8FAF50ED830BA1583D508140B86BC126D84212B092F64B67D54C3C1649A8983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3tsvHFa7wRyzQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A1FC0BF4BF26A8A10B9BF4F79351F757FB1B413D279FBA4A1D6F5243312F17222C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CD2DC820544DB7BD83049FFFDB7839CE9E45E89A588AFC0705ABB767D8160287041B39F60525B4706617DD740B0BCDD1BA
X-7FA49CB5: 0D63561A33F958A5AE041C50731737CA729C713A950B45EFF891C3E255CC68B18941B15DA834481FA18204E546F3947C629BAC65E8BCEBC0F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637EDB6B411A17B440E389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C393E899A2A207F19735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3vqKsfDj1WTyw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add support to the SM8475 video clock controller by extending the
SM8450 video clock controller, which is almost identical but has some
minor differences.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig          |  2 +-
 drivers/clk/qcom/videocc-sm8450.c | 31 ++++++++++++++++++++++++++++---
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index eb2c8db95daf..60e70bf69cb9 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1258,7 +1258,7 @@ config SM_VIDEOCC_8450
 	select QCOM_GDSC
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
-	  SM8450 devices.
+	  SM8450 or SM8475 devices.
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 endif
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index ed9163d64244..14d18e73332e 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -35,7 +35,7 @@ static const struct pll_vco lucid_evo_vco[] = {
 	{ 249600000, 2020000000, 0 },
 };
 
-static const struct alpha_pll_config video_cc_pll0_config = {
+static struct alpha_pll_config video_cc_pll0_config = {
 	/* .l includes CAL_L_VAL, L_VAL fields */
 	.l = 0x0044001e,
 	.alpha = 0x0,
@@ -63,7 +63,7 @@ static struct clk_alpha_pll video_cc_pll0 = {
 	},
 };
 
-static const struct alpha_pll_config video_cc_pll1_config = {
+static struct alpha_pll_config video_cc_pll1_config = {
 	/* .l includes CAL_L_VAL, L_VAL fields */
 	.l = 0x0044002b,
 	.alpha = 0xc000,
@@ -397,6 +397,7 @@ static struct qcom_cc_desc video_cc_sm8450_desc = {
 
 static const struct of_device_id video_cc_sm8450_match_table[] = {
 	{ .compatible = "qcom,sm8450-videocc" },
+	{ .compatible = "qcom,sm8475-videocc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, video_cc_sm8450_match_table);
@@ -420,6 +421,30 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-videocc")) {
+		/* Update VideoCC PLL0 Config */
+		video_cc_pll0_config.l = 0x1e;
+		video_cc_pll0_config.config_ctl_hi1_val = 0x82aa299c;
+		video_cc_pll0_config.test_ctl_val = 0x00000000;
+		video_cc_pll0_config.test_ctl_hi_val = 0x00000003;
+		video_cc_pll0_config.test_ctl_hi1_val = 0x00009000;
+		video_cc_pll0_config.test_ctl_hi2_val = 0x00000034;
+		video_cc_pll0_config.user_ctl_hi_val = 0x00000005;
+
+		video_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		/* Update VideoCC PLL1 Config */
+		video_cc_pll1_config.l = 0x2b;
+		video_cc_pll1_config.config_ctl_hi1_val = 0x82aa299c;
+		video_cc_pll1_config.test_ctl_val = 0x00000000;
+		video_cc_pll1_config.test_ctl_hi_val = 0x00000003;
+		video_cc_pll1_config.test_ctl_hi1_val = 0x00009000;
+		video_cc_pll1_config.test_ctl_hi2_val = 0x00000034;
+		video_cc_pll1_config.user_ctl_hi_val = 0x00000005;
+
+		video_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+	}
+
 	clk_lucid_evo_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
 
@@ -445,5 +470,5 @@ static struct platform_driver video_cc_sm8450_driver = {
 
 module_platform_driver(video_cc_sm8450_driver);
 
-MODULE_DESCRIPTION("QTI VIDEOCC SM8450 Driver");
+MODULE_DESCRIPTION("QTI VIDEOCC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL");
-- 
2.45.2


