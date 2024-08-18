Return-Path: <linux-arm-msm+bounces-28902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2860955F01
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 746CC1F2133D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D16156886;
	Sun, 18 Aug 2024 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="pJjnG590"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp31.i.mail.ru (smtp31.i.mail.ru [95.163.41.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF27155A4E;
	Sun, 18 Aug 2024 20:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724013852; cv=none; b=XyQK3Fj7CmS3RAytsHZkLYgXBpW5uApCnGIsX3KBLSKmEAh7WPUPxIxQ51wmQUY6/fe1MK+oLTftwtrEWraH5BDLoqMInvHPxwADbXDT8T0D3FSzHJpwIFmg0xtkPOfDLsQ82lWZC/oIavMY3nUAvNL+zRX45jSq5O1p+iGfMJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724013852; c=relaxed/simple;
	bh=U/xN3BW1+PdzfLxuaGF71Q+Zqn6oNqql4576ihQTsIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuKpNBPXsTGxvOFF4LNN8VHtqvHSYeA6zRAV7TVoQtglvbzuEfrqj7IPLwWi1YjifzVhGgwC4TjMi33a7/DUheJ9/zCqNMYuJUrvGx9JzKcGdWL7gvzLaRKaJr4di6HVSSeymJNcKipb3jaXtF/tE47WbHPSHdCbWPOAR4c2wlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=pJjnG590; arc=none smtp.client-ip=95.163.41.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=Y3Qh43r56weuWq3pl66t7fIgFq3A12ZFL8R/MMEfE4s=; t=1724013851; x=1724103851; 
	b=pJjnG5904WP5J+36mcNpzXb+fswdIM/dq1pkXHexAFuSgQ0gqiDT/6XrK+ZIZW87279AUGisf0j
	3biBH5n9McW/y9FmDB3H709W5uDLIfohrrFxg9MnuBRkwIcytFvGMeA8ELRBeLzj+uqSksS7ecq1i
	HJJ7uEk1NKo6c/FFJ4Q=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sfmky-0000000Cqfx-0AhM; Sun, 18 Aug 2024 23:44:08 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
Subject: [PATCH v2 08/10] clk: qcom: videocc-sm8450: Add SM8475 support
Date: Sun, 18 Aug 2024 23:43:46 +0300
Message-ID: <20240818204348.197788-9-danila@jiaxyga.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818204348.197788-1-danila@jiaxyga.com>
References: <20240818204348.197788-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp31.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F97E3C14763C38E29560722C55467F34824B3481C2C8111E182A05F5380850407CAA8A590775DB6D0578E6996F383413858FC3CA5CB33100323C04D0FE7BBCAFBB3D1907BEA9FCEE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A3295C83650092F9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F5B2F26146BDF5648638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D023EDBA45F626EECD7AC5B2B1C5E9D211B482E241DFE61BCC7F00164DA146DAFE8445B8C89999728AA50765F79006370BDB19F53EE528DD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8C2B5EEE3591E0D35F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C62B3BD3CC35DA5889735652A29929C6C4AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3FF5CACDDFC76A95BBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6D082881546D9349175ECD9A6C639B01B78DA827A17800CE7AD892BA7D319F029731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A57A9249618E8EAC965002B1117B3ED696705106C82D251B6F1BDDAE3D1EA49BEA823CB91A9FED034534781492E4B8EEAD47A3109F1ACFD409C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF97192D8905AD8BC25EB39EB6785EBCDF9DE9BD2C8679AAE0AF62CBE9D34F8F31669E50AE97022433ABF86C07854D9473BE2492CDB2820463F37AA835A6091A5E2DC4194D244BF043F59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmYm4iywY615gQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949816B4BC91EC7BB554F0B9BF4F79351F757D174464FAB3E7658DA55EEC5FD4416382C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Add support to the SM8475 video clock controller by extending the
SM8450 video clock controller, which is almost identical but has some
minor differences.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig          |  2 +-
 drivers/clk/qcom/videocc-sm8450.c | 48 +++++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index f61f8f1eb0f6..8d878bc5f9b8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1285,7 +1285,7 @@ config SM_VIDEOCC_8450
 	select QCOM_GDSC
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
-	  SM8450 devices.
+	  SM8450 or SM8475 devices.
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 endif
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index ed9163d64244..f26c7eccb62e 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -46,6 +46,21 @@ static const struct alpha_pll_config video_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_video_cc_pll0_config = {
+	/* .l includes CAL_L_VAL, L_VAL fields */
+	.l = 0x1e,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
 static struct clk_alpha_pll video_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_evo_vco,
@@ -74,6 +89,21 @@ static const struct alpha_pll_config video_cc_pll1_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_video_cc_pll1_config = {
+	/* .l includes CAL_L_VAL, L_VAL fields */
+	.l = 0x2b,
+	.alpha = 0xc000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
 static struct clk_alpha_pll video_cc_pll1 = {
 	.offset = 0x1000,
 	.vco_table = lucid_evo_vco,
@@ -397,6 +427,7 @@ static struct qcom_cc_desc video_cc_sm8450_desc = {
 
 static const struct of_device_id video_cc_sm8450_match_table[] = {
 	{ .compatible = "qcom,sm8450-videocc" },
+	{ .compatible = "qcom,sm8475-videocc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, video_cc_sm8450_match_table);
@@ -420,8 +451,19 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	clk_lucid_evo_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
-	clk_lucid_evo_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-videocc")) {
+		/* Update VideoCC PLL0 */
+		video_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		/* Update VideoCC PLL1 */
+		video_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &sm8475_video_cc_pll0_config);
+		clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &sm8475_video_cc_pll1_config);
+	} else {
+		clk_lucid_evo_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
+		clk_lucid_evo_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
+	}
 
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0x80e4); /* VIDEO_CC_AHB_CLK */
@@ -445,5 +487,5 @@ static struct platform_driver video_cc_sm8450_driver = {
 
 module_platform_driver(video_cc_sm8450_driver);
 
-MODULE_DESCRIPTION("QTI VIDEOCC SM8450 Driver");
+MODULE_DESCRIPTION("QTI VIDEOCC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL");
-- 
2.46.0


