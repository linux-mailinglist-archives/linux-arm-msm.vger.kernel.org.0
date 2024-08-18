Return-Path: <linux-arm-msm+bounces-28900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F93955EF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA6821F2122B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35A41552FA;
	Sun, 18 Aug 2024 20:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="l4qucBGY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp31.i.mail.ru (smtp31.i.mail.ru [95.163.41.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4898149E09;
	Sun, 18 Aug 2024 20:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724013849; cv=none; b=PGoT0xxeeNAsw54sGXP4eockSSOSJ0IC2OgiUytc6huTQ6U2Hs0DknbJNUrK5m+pJ5g7cblaF/xhxyj0RGptu3SmPat8LfhXUzAVbHOymyelMnXuCRwl86l+nhAQKzX3M9o0VcpvG6syj6otg1PO2VWSJbUjrBbAVTAwncHn5rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724013849; c=relaxed/simple;
	bh=/T7+PFFKEPscJNcTLhWTmtlAzCbMSkRoRx3xpkkXtMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzzUQoJ2AGPiCiYHfM9ORus7LVFPQ7Y8NmAkKazVTgUG85VmuG/fFdhb/ndR10NI+VZQCzyiZxq+2uFIvQMz+gLPHos18j0vzQpDyZUmczgoVwNrSC2hkjnPsvnbhZ9zWVI84xYAerBfVCJvn6dXvYVHb1yzsz/JtTkIq9GW8yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=l4qucBGY; arc=none smtp.client-ip=95.163.41.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=QuTg/uBlx9oKunvGa7juWYRLBL2GKls8hLK0lZlqu4U=; t=1724013846; x=1724103846; 
	b=l4qucBGYbBrWkJCKtSgps5TYBTTCSJze8prUZDVlF4OpHCVz+uSoHcW1octPNl/PA2phTyiIEzu
	NwxcBE06ar5yRXhMqAsRmn8BP71AR4cEy8lgqsUuQNoL2MoeuY5k+gfKgjRNdmkCZ4SaGQ+gcAmud
	S9zaiAsjAmcA1yzjrec=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sfmkt-0000000Cqfx-2pZn; Sun, 18 Aug 2024 23:44:04 +0300
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
Subject: [PATCH v2 06/10] clk: qcom: gpucc-sm8450: Add SM8475 support
Date: Sun, 18 Aug 2024 23:43:44 +0300
Message-ID: <20240818204348.197788-7-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD9F97E3C14763C38E294957C2873262015DF1FEF436675ABEA182A05F53808504089E99435B33C896D0578E6996F38341376B288B703F2B29E323C04D0FE7BBCAF906DE0852CB23FE4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D77100FFB2844417EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E25DEE08FA4D750E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E1F939F2A815322FCD7AC5B2B1C5E9D2C83B78BA4D3EE409CC7F00164DA146DAFE8445B8C89999728AA50765F7900637D0FEED2715E18529389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8A9FF340AA05FB58CF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C62B3BD3CC35DA588AD7EC71F1DB884274AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3A4DC95554899BC9EBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6D082881546D9349175ECD9A6C639B01B78DA827A17800CE7AD892BA7D319F029731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A59429B1AB6ADE69DE5002B1117B3ED6961235A1DF2E68874054BB1175C6E7DD94823CB91A9FED034534781492E4B8EEAD9CFA8CFAC159CE19C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF8131BE836E6D829E4665DC11CDDB7E64BBD53E2A0FB56E4B7CE721E8287CFA9DCC55679CEC9B022BABF86C07854D947334969F31F035FDEFF37AA835A6091A5EB6C0F38D0BA393D5F59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmbyWEd4b8CZkQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949816B4BC91EC7BB554FEA62B7A476541487104E83A8F1C365FC8237F6E3787CCCCC2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Add support to the SM8475 graphics clock controller by extending the
SM8450 graphics clock controller, which is almost identical but has
some minor differences.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig        |  3 +-
 drivers/clk/qcom/gpucc-sm8450.c | 50 +++++++++++++++++++++++++++++----
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 415b51b4fa38..f61f8f1eb0f6 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1150,7 +1150,8 @@ config SM_GPUCC_8450
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
 	help
-	  Support for the graphics clock controller on SM8450 devices.
+	  Support for the graphics clock controller on SM8450 or SM8475
+	  devices.
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
diff --git a/drivers/clk/qcom/gpucc-sm8450.c b/drivers/clk/qcom/gpucc-sm8450.c
index b3c5d6923cd2..059df72deaa1 100644
--- a/drivers/clk/qcom/gpucc-sm8450.c
+++ b/drivers/clk/qcom/gpucc-sm8450.c
@@ -40,7 +40,7 @@ static const struct pll_vco lucid_evo_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
-static struct alpha_pll_config gpu_cc_pll0_config = {
+static const struct alpha_pll_config gpu_cc_pll0_config = {
 	.l = 0x1d,
 	.alpha = 0xb000,
 	.config_ctl_val = 0x20485699,
@@ -50,6 +50,20 @@ static struct alpha_pll_config gpu_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_gpu_cc_pll0_config = {
+	.l = 0x1d,
+	.alpha = 0xb000,
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
 static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_evo_vco,
@@ -67,7 +81,7 @@ static struct clk_alpha_pll gpu_cc_pll0 = {
 	},
 };
 
-static struct alpha_pll_config gpu_cc_pll1_config = {
+static const struct alpha_pll_config gpu_cc_pll1_config = {
 	.l = 0x34,
 	.alpha = 0x1555,
 	.config_ctl_val = 0x20485699,
@@ -77,6 +91,20 @@ static struct alpha_pll_config gpu_cc_pll1_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_gpu_cc_pll1_config = {
+	.l = 0x34,
+	.alpha = 0x1555,
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
 static struct clk_alpha_pll gpu_cc_pll1 = {
 	.offset = 0x1000,
 	.vco_table = lucid_evo_vco,
@@ -736,6 +764,7 @@ static const struct qcom_cc_desc gpu_cc_sm8450_desc = {
 
 static const struct of_device_id gpu_cc_sm8450_match_table[] = {
 	{ .compatible = "qcom,sm8450-gpucc" },
+	{ .compatible = "qcom,sm8475-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_sm8450_match_table);
@@ -748,8 +777,19 @@ static int gpu_cc_sm8450_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-gpucc")) {
+		/* Update GPUCC PLL0 */
+		gpu_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		/* Update GPUCC PLL1 */
+		gpu_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &sm8475_gpu_cc_pll0_config);
+		clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &sm8475_gpu_cc_pll1_config);
+	} else {
+		clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+		clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+	}
 
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8450_desc, regmap);
 }
@@ -763,5 +803,5 @@ static struct platform_driver gpu_cc_sm8450_driver = {
 };
 module_platform_driver(gpu_cc_sm8450_driver);
 
-MODULE_DESCRIPTION("QTI GPU_CC SM8450 Driver");
+MODULE_DESCRIPTION("QTI GPU_CC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL");
-- 
2.46.0


