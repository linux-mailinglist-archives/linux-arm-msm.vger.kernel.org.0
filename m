Return-Path: <linux-arm-msm+bounces-27568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AA1943554
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21BB01C22383
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBEB1BE25D;
	Wed, 31 Jul 2024 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="C/FosniL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="0gUjowLv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback20.i.mail.ru (fallback20.i.mail.ru [79.137.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C257045024;
	Wed, 31 Jul 2024 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448801; cv=none; b=HeqLOj2sL1a548RzTny/tVUjXgu/4PufqQ+jMX/qfwTTPgjIjzrHzdOlPyrtWuXOIX0FCuUiLO+Tph5AudI9Dl8prEzshBgmjPZ0T9wW44x8ejnHWMN79uhEI+KSQsIkMm2b55bbl8S0UlhG6b+0oUhlJQ2ZMkpofZ21BdXpFMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448801; c=relaxed/simple;
	bh=AKIjGbqWtR2VVNTQ8IdmYVLz1TKZZPWcK4grLYlGHsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmnKlbKxoQXlKhZ9F+yMu0mPIqLHIeRUvDH3RvrxRCL/JxwR7RnBV1GHAZbH0YgXbQziiUeFpbxT5dtwnzqoOBAbvFCmE5RwwYD8v+fBZXCIF4UHKbO6GW+WFMjHiQTlHUPKfYNQ+w+7Q/DLxRUGGueELkiQn/3BSNOIwEOevwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=C/FosniL; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=0gUjowLv; arc=none smtp.client-ip=79.137.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=X8YgQ5A7zaABYlFnaxaSlD/KdyPUc1UxVaY40Dsr97w=;
	t=1722448799;x=1722538799; 
	b=C/FosniLVQAKpFzGmnQlenf5AccIIygxPlbZ5Lchrx51z0J7HDwEJjBrjYicbvAR0K1AsDLig5izis+oabchVKjnJw+I6OXHGMWUX6keOWRKY2kU2JcGyr2PR31U06xpQA5+e7N/E+GKSbCrznYjFNDU1R+LhQ9hRTt4X584NtM=;
Received: from [10.12.4.23] (port=45314 helo=smtp49.i.mail.ru)
	by fallback20.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDc7-00Bs6T-N0; Wed, 31 Jul 2024 20:59:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=X8YgQ5A7zaABYlFnaxaSlD/KdyPUc1UxVaY40Dsr97w=; t=1722448791; x=1722538791; 
	b=0gUjowLvcHizaVW67zlq0bfWfKS2uuhGEc5ibA83ajAS/xXu4tjZU6ZfdJqA7oSc6esN5wbDFT9
	KoyJm/XtCVLrfog0Rp4NSPmADahpi+UWJd6wW+bZL/hA30SZu2e/27domVHS5JdAzoyCGZMvaXzXb
	OU/Rib8XXI0b4gd6stE=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDbu-00000000IYY-0N7Z; Wed, 31 Jul 2024 20:59:38 +0300
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
Subject: [PATCH 06/10] clk: qcom: gpucc-sm8450: Add SM8475 support
Date: Wed, 31 Jul 2024 20:59:15 +0300
Message-ID: <20240731175919.20333-7-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9239C2541717B5AEF810C4A468CE7865A182A05F5380850404A74BBC21EF8743C3DE06ABAFEAF6705FF2A0758AC8FB411F806485F292FBEEB53A4CEC99A690AFB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74BE895B46187343CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E25DEE08FA4D750E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85D20E8AE10AE9B00995830582C796B1897466A5007D2FA65CC7F00164DA146DAFE8445B8C89999728AA50765F7900637F3E38EE449E3E2AE389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC821E93C0F2A571C7BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB2AD7EC71F1DB884274AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C30F1327A8DDF03E57BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B6957A4DEDD2346B4275ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A59F36C249BFBAC6B05002B1117B3ED696F577B21CE7AA68EB5D145BB8EF0DE66B823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF105F4D36C92D6871B314A4C3F61D8D9ECF0BE80FB1C42A352728E3D7CFF502DA77ACD0092D6ACCC81D9D8FAF50ED830BCD6CCC40CCFF5B7CC126D84212B092F6E49EFAEB4BC0E7A2983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3uEdJbpDxMBfg==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A1FC0BF4BF26A8A1A7CF1FCFAF80C0E927534AC78082B92989820344C91CE3612C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CDC4E1543BC0AC038D049FFFDB7839CE9E45E89A588AFC0705D4A75EF7E7A86FF8252A7B132C6C7CCA1454DF3F5777FC7B
X-7FA49CB5: 0D63561A33F958A55F9A416B69970837D0AF8B9838189D0CB3507DBD4F740AA28941B15DA834481FA18204E546F3947C02FF25FFE938E774F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637B286A8317E92A103389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C393E899A2A207F19735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3sI6uueFRfwvA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add support to the SM8475 graphics clock controller by extending the
SM8450 graphics clock controller, which is almost identical but has
some minor differences.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig        |  3 ++-
 drivers/clk/qcom/gpucc-sm8450.c | 25 ++++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 702de741cedd..eb2c8db95daf 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1123,7 +1123,8 @@ config SM_GPUCC_8450
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
 	help
-	  Support for the graphics clock controller on SM8450 devices.
+	  Support for the graphics clock controller on SM8450 or SM8475
+	  devices.
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
diff --git a/drivers/clk/qcom/gpucc-sm8450.c b/drivers/clk/qcom/gpucc-sm8450.c
index b3c5d6923cd2..35ebf93fdb66 100644
--- a/drivers/clk/qcom/gpucc-sm8450.c
+++ b/drivers/clk/qcom/gpucc-sm8450.c
@@ -736,6 +736,7 @@ static const struct qcom_cc_desc gpu_cc_sm8450_desc = {
 
 static const struct of_device_id gpu_cc_sm8450_match_table[] = {
 	{ .compatible = "qcom,sm8450-gpucc" },
+	{ .compatible = "qcom,sm8475-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_sm8450_match_table);
@@ -748,6 +749,28 @@ static int gpu_cc_sm8450_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-gpucc")) {
+		/* Update GPUCC PLL0 Config */
+		gpu_cc_pll0_config.config_ctl_hi1_val = 0x82aa299c;
+		gpu_cc_pll0_config.test_ctl_val = 0x00000000;
+		gpu_cc_pll0_config.test_ctl_hi_val = 0x00000003;
+		gpu_cc_pll0_config.test_ctl_hi1_val = 0x00009000;
+		gpu_cc_pll0_config.test_ctl_hi2_val = 0x00000034;
+		gpu_cc_pll0_config.user_ctl_hi_val = 0x00000005;
+
+		gpu_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		/* Update GPUCC PLL1 Config */
+		gpu_cc_pll1_config.config_ctl_hi1_val = 0x82aa299c;
+		gpu_cc_pll1_config.test_ctl_val = 0x00000000;
+		gpu_cc_pll1_config.test_ctl_hi_val = 0x00000003;
+		gpu_cc_pll1_config.test_ctl_hi1_val = 0x00009000;
+		gpu_cc_pll1_config.test_ctl_hi2_val = 0x00000034;
+		gpu_cc_pll1_config.user_ctl_hi_val = 0x00000005;
+
+		gpu_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+	}
+
 	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
@@ -763,5 +786,5 @@ static struct platform_driver gpu_cc_sm8450_driver = {
 };
 module_platform_driver(gpu_cc_sm8450_driver);
 
-MODULE_DESCRIPTION("QTI GPU_CC SM8450 Driver");
+MODULE_DESCRIPTION("QTI GPU_CC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL");
-- 
2.45.2


