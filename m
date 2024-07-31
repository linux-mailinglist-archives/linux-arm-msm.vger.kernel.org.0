Return-Path: <linux-arm-msm+bounces-27573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79443943593
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30BBA2849EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23203FB9F;
	Wed, 31 Jul 2024 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="n3m4lIkh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="eJerZKTE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC7217BBF;
	Wed, 31 Jul 2024 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722450330; cv=none; b=QU/5o3B7vh6wLew/qbIyyTPFC3PDPBCe2tf3LvS/jQk8NiuCpSnx4Z1Ta2kPp6rjp18rbRhqeUwCj6ws0ki5yF6ruuNinxwsDXFhkZNSf7O9BORKbBDxMfwVETwyN1nCNCCQuvwiid4GLKFYMIcNwTU+BrJXztCXzuK3aY82mHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722450330; c=relaxed/simple;
	bh=uyJXoaxAQBWFNr/coguWCNN6wJLIeLX3Aota26zyaCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJNYKILk4XrkkYtVEUqvdoqPcuoZut5O1NvDYS93VaVWNm1iHWp31UDzoBu4ruomi31dq+loLJ9BkKScZY3km9Whrq3Lan6iznpmuV0NAz9wBeURgrYdQJzMZW/Gl/PTinYy1vw1cqwyjD+50GTaL1mlajw3n7NXyP3lHBPw+bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=n3m4lIkh; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=eJerZKTE; arc=none smtp.client-ip=79.137.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=MNTdLq98UluVQT6zc6ezhte0eSzBe52Pmk4Ar4jVVK0=;
	t=1722450328;x=1722540328; 
	b=n3m4lIkhjm6tKsaRxGmccLr4BKcUCuVKlG1iFAIRhhakssUyLYuhMirT+Q/+Ymc07yBF7Ng5TOcTJ9QWwNKKutHIBxwSKjT98Aputz/0GEw2nInZzEIbx1pP0vGRhuckflhalf0Zb71IC+GlF0Nbt8VA/Qg+hsbzOI48eVRu6jg=;
Received: from [10.12.4.26] (port=44076 helo=smtp50.i.mail.ru)
	by fallback13.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDby-00DUh6-SM; Wed, 31 Jul 2024 20:59:43 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=MNTdLq98UluVQT6zc6ezhte0eSzBe52Pmk4Ar4jVVK0=; t=1722448782; x=1722538782; 
	b=eJerZKTE1qIwF3SaNe/C2Y/7AX05ZBGql122DZE+kcb6tBvZoxpVXzDj6GEwGtD2U5dZKRs5I6c
	/HBpIx+PWbc0Rqj6wX+RrXyA0VvPaNLwqA2/7uvob2OVUAyo/WUN7+7WM+pvZFWdE4Dgg/hOHx7tg
	9sXotp/A6f/0HEjHqqI=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDbp-00000000IYY-34Hg; Wed, 31 Jul 2024 20:59:34 +0300
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
Subject: [PATCH 04/10] clk: qcom: dispcc-sm8450: Add SM8475 support
Date: Wed, 31 Jul 2024 20:59:13 +0300
Message-ID: <20240731175919.20333-5-danila@jiaxyga.com>
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
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9AD89A2A5D4CA2288CAB961C0C201B531182A05F538085040DA430C42C03EF50A3DE06ABAFEAF6705289E9C3536A6F507F806485F292FBEEBA7398ABDDC9FB8BB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76DD23B0452F84E3CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378D08D652E28591A78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81CDF03BD932202F4995830582C796B18EF28B70C237C8726CC7F00164DA146DAFE8445B8C89999728AA50765F7900637028599BB38096F4F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC878444BBB7636F62AF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB203F1AB874ED890284AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C305525BC79FAC2943BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B6957A4DEDD2346B4275ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A54471CEB927CB90995002B1117B3ED696632C0940C7DD2CF9466072E6821086B3823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFD84A3B58A8F4BCCC602CC612F54802370A39D97685009209CFB0AB8DFE761E97C2F598A3E54AB4511D9D8FAF50ED830B6DC22B4C0AAAC09AC126D84212B092F63A54771ED8825433983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3t/obBCAdZ/Nw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A1FC0BF4BF26A8A1D4570605F44DF537A9F2889ECAC8CD7833DAC8D12F5BC5EB2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CD2DC820544DB7BD83049FFFDB7839CE9E45E89A588AFC0705F3515FAC263D563A73EE7157A86EE01ACAEB7A96BA42A091
X-7FA49CB5: 0D63561A33F958A587CD5281A4328B6C01644FE7694DEEE86A9E91CD71AB9B938941B15DA834481FA18204E546F3947CD6760E474F0469B4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063792238A98CB01235D389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3777F8C72A04D893B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3urlPYivLNJIw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add support to the SM8475 display clock controller by extending the
SM8450 display clock controller, which is almost identical but has
some minor differences.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig         |  2 +-
 drivers/clk/qcom/dispcc-sm8450.c | 49 ++++++++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index decb41c4a58e..702de741cedd 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -924,7 +924,7 @@ config SM_DISPCC_8450
 	depends on SM_GCC_8450
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
-	  SM8450 devices.
+	  SM8450 or SM8475 devices.
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index d1d3f60789ee..cef38cdd7318 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -75,7 +75,7 @@ static const struct pll_vco lucid_evo_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
-static const struct alpha_pll_config disp_cc_pll0_config = {
+static struct alpha_pll_config disp_cc_pll0_config = {
 	.l = 0xD,
 	.alpha = 0x6492,
 	.config_ctl_val = 0x20485699,
@@ -85,6 +85,15 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static struct clk_init_data disp_cc_pll0_sm8475_init = {
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
@@ -102,7 +111,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
 	},
 };
 
-static const struct alpha_pll_config disp_cc_pll1_config = {
+static struct alpha_pll_config disp_cc_pll1_config = {
 	.l = 0x1F,
 	.alpha = 0x4000,
 	.config_ctl_val = 0x20485699,
@@ -112,6 +121,15 @@ static const struct alpha_pll_config disp_cc_pll1_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static struct clk_init_data disp_cc_pll1_sm8475_init = {
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
@@ -1746,6 +1764,7 @@ static struct qcom_cc_desc disp_cc_sm8450_desc = {
 
 static const struct of_device_id disp_cc_sm8450_match_table[] = {
 	{ .compatible = "qcom,sm8450-dispcc" },
+	{ .compatible = "qcom,sm8475-dispcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8450_match_table);
@@ -1769,6 +1788,30 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
 		goto err_put_rpm;
 	}
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-dispcc")) {
+		/* Update DISPCC PLL0 Config */
+		disp_cc_pll0_config.config_ctl_hi1_val = 0x82aa299c;
+		disp_cc_pll0_config.test_ctl_val = 0x00000000;
+		disp_cc_pll0_config.test_ctl_hi_val = 0x00000003;
+		disp_cc_pll0_config.test_ctl_hi1_val = 0x00009000;
+		disp_cc_pll0_config.test_ctl_hi2_val = 0x00000034;
+		disp_cc_pll0_config.user_ctl_hi_val = 0x00000005;
+
+		disp_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		disp_cc_pll0.clkr.hw.init = &disp_cc_pll0_sm8475_init;
+
+		/* Update DISPCC PLL1 Config */
+		disp_cc_pll1_config.config_ctl_hi1_val = 0x82aa299c;
+		disp_cc_pll1_config.test_ctl_val = 0x00000000;
+		disp_cc_pll1_config.test_ctl_hi_val = 0x00000003;
+		disp_cc_pll1_config.test_ctl_hi1_val = 0x00009000;
+		disp_cc_pll1_config.test_ctl_hi2_val = 0x00000034;
+		disp_cc_pll1_config.user_ctl_hi_val = 0x00000005;
+
+		disp_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		disp_cc_pll1.clkr.hw.init = &disp_cc_pll1_sm8475_init;
+	}
+
 	clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
 
@@ -1802,5 +1845,5 @@ static struct platform_driver disp_cc_sm8450_driver = {
 
 module_platform_driver(disp_cc_sm8450_driver);
 
-MODULE_DESCRIPTION("QTI DISPCC SM8450 Driver");
+MODULE_DESCRIPTION("QTI DISPCC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL");
-- 
2.45.2


