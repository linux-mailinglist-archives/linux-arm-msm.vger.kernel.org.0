Return-Path: <linux-arm-msm+bounces-28903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36A6955F08
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1752CB20E0F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B631156F3B;
	Sun, 18 Aug 2024 20:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="KHcNADOF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="XUrPd3ay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback1.i.mail.ru (fallback1.i.mail.ru [79.137.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B81156641;
	Sun, 18 Aug 2024 20:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724013854; cv=none; b=TaWIgvuGjxHwuCbGtwVqFT79wLrDehq2hS/3VsxoyVr2FvhgaR1nVF/FdNx4iBAzuVLVIH6CWfWuCv0+zASqOScrbo7vtwyUQLlPjA+79WEU4mzY24VB18Yajvs409EBPlQpAKqrgQTI3fFW1mn6ECr0C9gq2N13UFNGhKy53PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724013854; c=relaxed/simple;
	bh=U77HDn7E0ua0x7DBBxV5c1SNDXWwbzNpQsd+i0WgWRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViANAzScUBfEn7q/nwQYJvR4jDirgtlxuc+qgxYhRidGd5NkH17CFBAHW+0iiIsmGIDEJqciNbtlRpZbdfGcCk/Qof+i1xsgffrwKAAEiyuMpV7EhEG+7kI/XEuW2ekrfE/cwDMHz22J2mFX7X+ySjo1NKYJa0dQSldG8VlTi2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=KHcNADOF; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=XUrPd3ay; arc=none smtp.client-ip=79.137.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=2/bWlYhPTPvrsDZfSgbFubkypkaExQ9mqPol1Ff1XK4=;
	t=1724013852;x=1724103852; 
	b=KHcNADOF5iJl/ruxy5iUXyttbr5KOZ9rkrFq+QWPORmFvZhttDDXdJs/NpXG03V9Idq7kWBe9EJ9J3wdzQH0ug8uw/mT8cyC4QTa/J6uLLXNKuqysxjE78njEnbJGpj1GA4T0hQ3O+MBoO5iLEfzOuIaz1oJIvqpBHyf5uNsqcU=;
Received: from [10.12.4.5] (port=46372 helo=smtp31.i.mail.ru)
	by fallback1.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sfmkz-002QYS-4j; Sun, 18 Aug 2024 23:44:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=2/bWlYhPTPvrsDZfSgbFubkypkaExQ9mqPol1Ff1XK4=; t=1724013849; x=1724103849; 
	b=XUrPd3ay2shbQukS4+AXXWJU1Rtob6RJ0cuGyJntHIvHeOHZTGBeTOzqNzL2railqSZF2IyEpNy
	V/p6S/BiFjMNe6AwZ4SJdi2DlROwW868X7WSUa394+p4Q3NJn+dMqSYSGvAXb9WmSugjk1ZuY8M3d
	fM06n6ApvvEKoYAw2jk=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sfmkp-0000000Cqfx-2Qop; Sun, 18 Aug 2024 23:43:59 +0300
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
Subject: [PATCH v2 04/10] clk: qcom: dispcc-sm8450: Add SM8475 support
Date: Sun, 18 Aug 2024 23:43:42 +0300
Message-ID: <20240818204348.197788-5-danila@jiaxyga.com>
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
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F97E3C14763C38E29560722C55467F34015AC91CD8757DC5182A05F5380850402FD894DA5F07D93E0578E6996F383413AD9978A9372D1062323C04D0FE7BBCAF9AC4FB3CC3F48C31
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F6EE1C40B2E8BE15EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372BE3E2E75E3847F48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D97AF82BB3E11623CD7AC5B2B1C5E9D2648591BF419D1EC6CC7F00164DA146DAFE8445B8C89999728AA50765F7900637A359038F01FFAF82389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8ED96AA85C75E140D117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFA79578C5CF9A900976E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B0FC4FCDDD36A1EE6D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F7900637F1CEADB5F7626D0D6D1867E19FE1407978DA827A17800CE7FCEEFFE83360B3FE2DBA43225CD8A89FC0F9454058DFE53C5E1C53F199C2BB95B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5BAEB441A560708A75002B1117B3ED696BA8DE6387CD179958D59E407A97E9958823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF5DC71160A64678C49DE0C45D2AA5283E9898AECB50910A9A702D602718909363D1BAA24A4D7F85D8ABF86C07854D94738260C63E75B9774EF37AA835A6091A5ECD4B101DD86B08CCF59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmbVuar2TqWGCg==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949816B4BC91EC7BB554FD4570605F44DF537A37A90478CDA6CF6526FF42DAE3910E22C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B401572549E177C9B7D4324AF0E71CFA34F55FA1609B84649E049FFFDB7839CE9E4D3E270CF25C1BA86CA2BC487E93056E66C5479BB899D0FC531387CD8D6537FD
X-7FA49CB5: 0D63561A33F958A57A0BEB16D9AB7217BB14AEDD01C25305CD2572C3E9A4F7138941B15DA834481FA18204E546F3947C6925688D23FC3BD3F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637B627144C684E05FD389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3375ACB23F92DE42535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmZ1MwqjkK07GA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add support to the SM8475 display clock controller by extending the
SM8450 display clock controller, which is almost identical but has
some minor differences.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig         |  2 +-
 drivers/clk/qcom/dispcc-sm8450.c | 66 ++++++++++++++++++++++++++++++--
 2 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index b0c28d5cf621..415b51b4fa38 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -952,7 +952,7 @@ config SM_DISPCC_8450
 	depends on SM_GCC_8450
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
-	  SM8450 devices.
+	  SM8450 or SM8475 devices.
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index d1d3f60789ee..a1f183e6c636 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -85,6 +85,29 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_disp_cc_pll0_config = {
+	.l = 0xd,
+	.alpha = 0x6492,
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
+static struct clk_init_data sm8475_disp_cc_pll0_init = {
+	.name = "disp_cc_pll0",
+	.parent_data = &(const struct clk_parent_data) {
+		.index = DT_BI_TCXO,
+	},
+	.num_parents = 1,
+	.ops = &clk_alpha_pll_reset_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_evo_vco,
@@ -112,6 +135,29 @@ static const struct alpha_pll_config disp_cc_pll1_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_disp_cc_pll1_config = {
+	.l = 0x1f,
+	.alpha = 0x4000,
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
+static struct clk_init_data sm8475_disp_cc_pll1_init = {
+	.name = "disp_cc_pll1",
+	.parent_data = &(const struct clk_parent_data) {
+		.index = DT_BI_TCXO,
+	},
+	.num_parents = 1,
+	.ops = &clk_alpha_pll_reset_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll disp_cc_pll1 = {
 	.offset = 0x1000,
 	.vco_table = lucid_evo_vco,
@@ -1746,6 +1792,7 @@ static struct qcom_cc_desc disp_cc_sm8450_desc = {
 
 static const struct of_device_id disp_cc_sm8450_match_table[] = {
 	{ .compatible = "qcom,sm8450-dispcc" },
+	{ .compatible = "qcom,sm8475-dispcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8450_match_table);
@@ -1769,8 +1816,21 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
 		goto err_put_rpm;
 	}
 
-	clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-	clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-dispcc")) {
+		/* Update DISPCC PLL0 */
+		disp_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		disp_cc_pll0.clkr.hw.init = &sm8475_disp_cc_pll0_init;
+
+		/* Update DISPCC PLL1 */
+		disp_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		disp_cc_pll1.clkr.hw.init = &sm8475_disp_cc_pll1_init;
+
+		clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
+		clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
+	} else {
+		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
+		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
+	}
 
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
@@ -1802,5 +1862,5 @@ static struct platform_driver disp_cc_sm8450_driver = {
 
 module_platform_driver(disp_cc_sm8450_driver);
 
-MODULE_DESCRIPTION("QTI DISPCC SM8450 Driver");
+MODULE_DESCRIPTION("QTI DISPCC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL");
-- 
2.46.0


