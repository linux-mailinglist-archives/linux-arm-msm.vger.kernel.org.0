Return-Path: <linux-arm-msm+bounces-28907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95B955F16
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 629D3281A27
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10552159209;
	Sun, 18 Aug 2024 20:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="QmYYm5hl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wPZ2UHC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7946158DC6;
	Sun, 18 Aug 2024 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724013860; cv=none; b=cxsH6p/DoaVP7ug2EJnBgPR6oSfWxPri5uMrFS9+SkM4G+oA5kveuqBR2eAiAlbU/uyqAKf2G1GdDTUYXihriKDOim2Lr39ej8DNHUUVlqMtKaFO7ppGaIZvkZFa5rZqRrTv+yvx0sUS2s7qaIjMP0Vn1qVKxiwuhu3g7UHktss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724013860; c=relaxed/simple;
	bh=ONn5u+KS2O3+wF7+WSkKYJOfcAR3V9bxKiHzsV4B4B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPiAJYLn80rIaylOg8GlpzWWfcD+5XVyTEqaW9yqkLopqDVscsbG49Sp9cn1YBchC7qZSCZ/4+mp9g9xyjCoYZ3U8zctkRzsm4eN7UTbdmIZpiM9jiIyRxUMUwT1ZxWUBgXN/HNy1bFnielYCfSzfO4sVrkJ/ttucGbxB45yaRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=QmYYm5hl; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=wPZ2UHC6; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=L1/hRyBPKkvAnSnS4gpu/knIlOo6eKIcoyemPZqVYyI=;
	t=1724013858;x=1724103858; 
	b=QmYYm5hlFDneuZDWvVuaQYrSCArULeHyBzZwtOTMsM1glZF75U5jPhVP6ED0rxaspGHYP9k8uH7N/Qm+F9o5Vrfr8lwzTRFreeWLQEDJ4aQp/QfvSluVpth5I7Pl2GXx5fSlq3ycE0tLRzvb0JFTI/8zMuf6wSMZj7qDgICJZA8=;
Received: from [10.12.4.5] (port=37994 helo=smtp31.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sfml0-00EJC3-M5; Sun, 18 Aug 2024 23:44:11 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=L1/hRyBPKkvAnSnS4gpu/knIlOo6eKIcoyemPZqVYyI=; t=1724013850; x=1724103850; 
	b=wPZ2UHC6om43srqVFAa2llRCtyVio9cokyhULjDq/p3ehlHCPEro4lP2qlMjuX99iMcdx80LtiB
	n4oyLWdOZu/fTWoW3/TeDkIA74qTG3V1CqTtEHtFsojm1W2Alf+/bSdQGpf4ljyfIUIa34UYaOrPl
	XL81fhlKtZRWC152aXs=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sfmkm-0000000Cqfx-1RP4; Sun, 18 Aug 2024 23:43:56 +0300
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
Subject: [PATCH v2 02/10] clk: qcom: gcc-sm8450: Add SM8475 support
Date: Sun, 18 Aug 2024 23:43:40 +0300
Message-ID: <20240818204348.197788-3-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD9F97E3C14763C38E249236267832B8ADA0B40D94542519B7F182A05F5380850404DF0E21170B524830578E6996F383413A99A4B1227459346323C04D0FE7BBCAFD87569442EAA8C4D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A188238C4D2F1F4EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379BBD3AAEA3DAB18A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8DE649F50F3509A76CD7AC5B2B1C5E9D2C716E1EC7090EE4BCC7F00164DA146DAFE8445B8C89999728AA50765F790063773DCDF0198120BE8389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8C2B5EEE3591E0D35F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CAD74539164518AE5302FCEF25BFAB3454AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3F7925326FBF3642CBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B6957A4DEDD2346B4275ECD9A6C639B01B78DA827A17800CE7AD892BA7D319F029731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A548ED29F9D6177C705002B1117B3ED696FA41115A9730D8D1E41E333F9D1358D5823CB91A9FED034534781492E4B8EEADF12279BA039A6965C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9F45C7492697E187428C339DF41A5CC99A18301D96A3FD19B3C49DDEBAD2B41F49C71475D3C80931ABF86C07854D9473C004A765CC6FBCD3F37AA835A6091A5EB0F735A31028A5BDF59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmYIM1vaoL996A==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949816B4BC91EC7BB554F4825860F061DF214805FE462AE81B6764EAFBF50EA7734A82C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B401572549E177C9B7D4324AF0E71CFA345175AA98FDDA2130049FFFDB7839CE9E4D3E270CF25C1BA8FBAB3A84B2FE6882AA00FBC3E8383DBB3F43765145170D83
X-7FA49CB5: 0D63561A33F958A5317E1F91C627CA8F765C1B1C5065F632683680C08B44E60E8941B15DA834481FA18204E546F3947CF8BD4E506CFA3D88F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006379BABF3D50D9A3D87389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3375ACB23F92DE42535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmaxipWpD1h5oQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add support to the SM8475 global clock controller by extending the
SM8450 global clock controller, which is almost identical but has some
minor differences.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig      |   3 +-
 drivers/clk/qcom/gcc-sm8450.c | 181 +++++++++++++++++++++++++++++++++-
 2 files changed, 182 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a3e2a09e2105..b0c28d5cf621 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1050,7 +1050,8 @@ config SM_GCC_8450
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
-	  Support for the global clock controller on SM8450 devices.
+	  Support for the global clock controller on SM8450 or SM8475
+	  devices.
 	  Say Y if you want to use peripheral devices such as UART,
 	  SPI, I2C, USB, SD/UFS, PCIe etc.
 
diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index c445c271678a..65d7d52bce03 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -26,6 +26,8 @@ enum {
 	P_BI_TCXO,
 	P_GCC_GPLL0_OUT_EVEN,
 	P_GCC_GPLL0_OUT_MAIN,
+	P_SM8475_GCC_GPLL2_OUT_EVEN,
+	P_SM8475_GCC_GPLL3_OUT_EVEN,
 	P_GCC_GPLL4_OUT_MAIN,
 	P_GCC_GPLL9_OUT_MAIN,
 	P_PCIE_1_PHY_AUX_CLK,
@@ -36,6 +38,15 @@ enum {
 	P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
 };
 
+static struct clk_init_data sm8475_gcc_gpll0_init = {
+	.name = "gcc_gpll0",
+	.parent_data = &(const struct clk_parent_data){
+		.fw_name = "bi_tcxo",
+	},
+	.num_parents = 1,
+	.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll gcc_gpll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -53,6 +64,15 @@ static struct clk_alpha_pll gcc_gpll0 = {
 	},
 };
 
+static struct clk_init_data sm8475_gcc_gpll0_out_even_init = {
+	.name = "gcc_gpll0_out_even",
+	.parent_hws = (const struct clk_hw*[]) {
+		&gcc_gpll0.clkr.hw,
+	},
+	.num_parents = 1,
+	.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+};
+
 static const struct clk_div_table post_div_table_gcc_gpll0_out_even[] = {
 	{ 0x1, 2 },
 	{ }
@@ -75,6 +95,49 @@ static struct clk_alpha_pll_postdiv gcc_gpll0_out_even = {
 	},
 };
 
+static struct clk_alpha_pll sm8475_gcc_gpll2 = {
+	.offset = 0x2000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x62018,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpll2",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll sm8475_gcc_gpll3 = {
+	.offset = 0x3000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x62018,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpll3",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static struct clk_init_data sm8475_gcc_gpll4_init = {
+	.name = "gcc_gpll4",
+	.parent_data = &(const struct clk_parent_data){
+		.fw_name = "bi_tcxo",
+	},
+	.num_parents = 1,
+	.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll gcc_gpll4 = {
 	.offset = 0x4000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -92,6 +155,15 @@ static struct clk_alpha_pll gcc_gpll4 = {
 	},
 };
 
+static struct clk_init_data sm8475_gcc_gpll9_init = {
+	.name = "gcc_gpll9",
+	.parent_data = &(const struct clk_parent_data){
+		.fw_name = "bi_tcxo",
+	},
+	.num_parents = 1,
+	.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll gcc_gpll9 = {
 	.offset = 0x9000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -153,6 +225,22 @@ static const struct clk_parent_data gcc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo" },
 };
 
+static const struct parent_map sm8475_gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SM8475_GCC_GPLL2_OUT_EVEN, 2 },
+	{ P_SM8475_GCC_GPLL3_OUT_EVEN, 3 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data sm8475_gcc_parent_data_3[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gcc_gpll0.clkr.hw },
+	{ .hw = &sm8475_gcc_gpll2.clkr.hw },
+	{ .hw = &sm8475_gcc_gpll3.clkr.hw },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
 static const struct parent_map gcc_parent_map_5[] = {
 	{ P_PCIE_1_PHY_AUX_CLK, 0 },
 	{ P_BI_TCXO, 2 },
@@ -915,6 +1003,16 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s6_clk_src = {
 	.clkr.hw.init = &gcc_qupv3_wrap2_s6_clk_src_init,
 };
 
+static const struct freq_tbl sm8475_ftbl_gcc_sdcc2_apps_clk_src[] = {
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(37000000, P_GCC_GPLL9_OUT_MAIN, 16, 0, 0),
+	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
+	F(148000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
 static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
 	F(400000, P_BI_TCXO, 12, 1, 4),
 	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
@@ -963,6 +1061,25 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 	},
 };
 
+static const struct freq_tbl sm8475_ftbl_gcc_ufs_phy_axi_clk_src[] = {
+	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(150000000, P_GCC_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(300000000, P_GCC_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_GCC_GPLL0_OUT_MAIN, 1, 0, 0),
+	F(806400000, P_SM8475_GCC_GPLL2_OUT_EVEN, 1, 0, 0),
+	F(850000000, P_SM8475_GCC_GPLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_init_data sm8475_gcc_ufs_phy_axi_clk_src_init = {
+	.name = "gcc_ufs_phy_axi_clk_src",
+	.parent_data = sm8475_gcc_parent_data_3,
+	.num_parents = ARRAY_SIZE(sm8475_gcc_parent_map_3),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
+};
+
 static const struct freq_tbl ftbl_gcc_ufs_phy_axi_clk_src[] = {
 	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
 	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
@@ -987,6 +1104,24 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
 	},
 };
 
+static const struct freq_tbl sm8475_ftbl_gcc_ufs_phy_ice_core_clk_src[] = {
+	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(150000000, P_GCC_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(300000000, P_GCC_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_GCC_GPLL0_OUT_MAIN, 1, 0, 0),
+	F(806400000, P_SM8475_GCC_GPLL2_OUT_EVEN, 1, 0, 0),
+	F(850000000, P_SM8475_GCC_GPLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_init_data sm8475_gcc_ufs_phy_ice_core_clk_src_init = {
+	.name = "gcc_ufs_phy_ice_core_clk_src",
+	.parent_data = sm8475_gcc_parent_data_3,
+	.num_parents = ARRAY_SIZE(sm8475_gcc_parent_map_3),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
+};
+
 static const struct freq_tbl ftbl_gcc_ufs_phy_ice_core_clk_src[] = {
 	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
 	F(150000000, P_GCC_GPLL0_OUT_MAIN, 4, 0, 0),
@@ -1032,6 +1167,14 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 	},
 };
 
+static struct clk_init_data sm8475_gcc_ufs_phy_unipro_core_clk_src_init = {
+	.name = "gcc_ufs_phy_unipro_core_clk_src",
+	.parent_data = sm8475_gcc_parent_data_3,
+	.num_parents = ARRAY_SIZE(sm8475_gcc_parent_map_3),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_ops,
+};
+
 static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
 	.cmd_rcgr = 0x8708c,
 	.mnd_width = 0,
@@ -3166,6 +3309,8 @@ static struct clk_regmap *gcc_sm8450_clocks[] = {
 	[GCC_USB3_PRIM_PHY_PIPE_CLK_SRC] = &gcc_usb3_prim_phy_pipe_clk_src.clkr,
 	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
 	[GCC_VIDEO_AXI1_CLK] = &gcc_video_axi1_clk.clkr,
+	[SM8475_GCC_GPLL2] = NULL,
+	[SM8475_GCC_GPLL3] = NULL,
 };
 
 static const struct qcom_reset_map gcc_sm8450_resets[] = {
@@ -3259,6 +3404,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 
 static const struct of_device_id gcc_sm8450_match_table[] = {
 	{ .compatible = "qcom,gcc-sm8450" },
+	{ .compatible = "qcom,sm8475-gcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gcc_sm8450_match_table);
@@ -3277,6 +3423,39 @@ static int gcc_sm8450_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-gcc")) {
+		/* Update GCC PLL0 */
+		gcc_gpll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		gcc_gpll0.clkr.hw.init = &sm8475_gcc_gpll0_init;
+		gcc_gpll0_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		gcc_gpll0_out_even.clkr.hw.init = &sm8475_gcc_gpll0_out_even_init;
+
+		/* Update GCC PLL4 */
+		gcc_gpll4.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		gcc_gpll4.clkr.hw.init = &sm8475_gcc_gpll4_init;
+
+		/* Update GCC PLL9 */
+		gcc_gpll9.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		gcc_gpll9.clkr.hw.init = &sm8475_gcc_gpll9_init;
+
+		gcc_sdcc2_apps_clk_src.freq_tbl = sm8475_ftbl_gcc_sdcc2_apps_clk_src;
+
+		gcc_ufs_phy_axi_clk_src.parent_map = sm8475_gcc_parent_map_3;
+		gcc_ufs_phy_axi_clk_src.freq_tbl = sm8475_ftbl_gcc_ufs_phy_axi_clk_src;
+		gcc_ufs_phy_axi_clk_src.clkr.hw.init = &sm8475_gcc_ufs_phy_axi_clk_src_init;
+
+		gcc_ufs_phy_ice_core_clk_src.parent_map = sm8475_gcc_parent_map_3;
+		gcc_ufs_phy_ice_core_clk_src.freq_tbl = sm8475_ftbl_gcc_ufs_phy_ice_core_clk_src;
+		gcc_ufs_phy_ice_core_clk_src.clkr.hw.init = &sm8475_gcc_ufs_phy_ice_core_clk_src_init;
+
+		gcc_ufs_phy_unipro_core_clk_src.parent_map = sm8475_gcc_parent_map_3;
+		gcc_ufs_phy_unipro_core_clk_src.freq_tbl = sm8475_ftbl_gcc_ufs_phy_ice_core_clk_src;
+		gcc_ufs_phy_unipro_core_clk_src.clkr.hw.init = &sm8475_gcc_ufs_phy_unipro_core_clk_src_init;
+
+		gcc_sm8450_desc.clks[SM8475_GCC_GPLL2] = &sm8475_gcc_gpll2.clkr;
+		gcc_sm8450_desc.clks[SM8475_GCC_GPLL3] = &sm8475_gcc_gpll3.clkr;
+	}
+
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
 
@@ -3312,5 +3491,5 @@ static void __exit gcc_sm8450_exit(void)
 }
 module_exit(gcc_sm8450_exit);
 
-MODULE_DESCRIPTION("QTI GCC SM8450 Driver");
+MODULE_DESCRIPTION("QTI GCC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL v2");
-- 
2.46.0


