Return-Path: <linux-arm-msm+bounces-27565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB173943549
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 381721F273D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B66F1A4F35;
	Wed, 31 Jul 2024 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="o/FuYAyD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="MR6Jr2X2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback19.i.mail.ru (fallback19.i.mail.ru [79.137.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CA74779F;
	Wed, 31 Jul 2024 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448796; cv=none; b=b8NLRPxgKIouXN08l7lFUtpqw7P9rMvtdK8pMIjjWav/yZvCV8CaXhb7l74q76MI40AwFoVFQxjJLnnomz5jPVBQi0YqVZF+CvjFhRej1X/n9SQFW7IqkO0NrU05x9A2OHZ1IlMudlZu0NrFOhM7SfsdrZtHLg1NaB5zs7Qy2gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448796; c=relaxed/simple;
	bh=OHVPKDWsQvbxLiXncySkqrNhlwFeB5uWVN+RvJMf4uM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ECzOxysCUUjQWlMGuldPvC9IT3Uihmv92bShYURj0ukRBWxVNMCD3IX82iF0kwG7gZwAi8Am6bmhgMvp5gm7Pma1AF3JPim1rE8IsQdjstrOaXl/9gfjAxascVHPP8GXCqnWtwhjZhhH1IaT3e6q5Bkc+jMMF/soSNOGK3wL804=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=o/FuYAyD; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=MR6Jr2X2; arc=none smtp.client-ip=79.137.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=a1ob5WXnXd6C6AKqe4eDS9Nl1ld6cSvTGwkZLxE5E4Q=;
	t=1722448794;x=1722538794; 
	b=o/FuYAyDbTavABngHCItD/dOplnac/NH+eKHo8vl0CAEIiu+U2cPJG0DhzgWGNTzWy+m6cgCwO6uaYu2yNiKq6mA6h4WUbbIyF97lXbhHRy4oaGZYwYg1NLYb08MQlK8x7/GGWPL8KDT1PeZXFyB8BtyeCDwjMdZRTG0ABIGDt8=;
Received: from [10.12.4.27] (port=53028 helo=smtp53.i.mail.ru)
	by fallback19.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDc0-001K2e-KY; Wed, 31 Jul 2024 20:59:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=a1ob5WXnXd6C6AKqe4eDS9Nl1ld6cSvTGwkZLxE5E4Q=; t=1722448784; x=1722538784; 
	b=MR6Jr2X2oOccbGcBkOSwBVR9uaykEgWxOoywuBYTz8MQrzyorOWnLbJ8hlu31Lb/o453+/ZiNl7
	M49JKI+trxhM+pQIDNDyMdiXrXrapzNliHA0xXQMY30OgSPkuMtTolQkUfVasygGQ2PhLPVWKZCTC
	UdFiECFUDwHJ8VyvWtE=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDbl-00000000IYY-3NOt; Wed, 31 Jul 2024 20:59:30 +0300
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
Subject: [PATCH 02/10] clk: qcom: gcc-sm8450: Add SM8475 support
Date: Wed, 31 Jul 2024 20:59:11 +0300
Message-ID: <20240731175919.20333-3-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9B5874CEA435AC2ACA5FA45C9DB9C3598182A05F53808504042187A9D02CB05363DE06ABAFEAF670513BE97F87BED3FE3F806485F292FBEEB1E3A739F9B1F1DEB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74E3CEF8E5F9AB669EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B35447D73BF3EFFE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D856C2D2EC3DC1F9E8995830582C796B18B5F57C5770749D18CC7F00164DA146DAFE8445B8C89999728AA50765F7900637CAEE156C82D3D7D9389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8C2B5EEE3591E0D35F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C89DDFE3E282F3DD12D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C30E6BD793C670A4DDBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B6957A4DEDD2346B4275ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A548BDA08302AC08175002B1117B3ED69611362F5B74B7DBE819AC5B239BAD4335823CB91A9FED034534781492E4B8EEAD2F8D89FC5850081EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFE7E16FE26EA5D933F011F5892F829B8BEFAA4E4F34C8364D54732444E58C084A2B6ADA43BC89BCA91D9D8FAF50ED830BDA973233C4A8D0BCC126D84212B092F63FF5C600E1EED748983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3udayEL73wPeQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A1FC0BF4BF26A8A1CFE9FA76EDA5B4B7B18A68262A2F370E9586BCC9ECACDCFA2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CD13D22A8CFAE84BB7049FFFDB7839CE9E45E89A588AFC0705FE24382000C7F0EF00ADDC39949CFF71383B57F53CC0B9B9
X-7FA49CB5: 0D63561A33F958A50394500F873E365448EA5B192F06CCCE43478AF22D0A241D8941B15DA834481FA18204E546F3947CD56D36E97F3F038CF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370A2DD59B67EFEE27389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3777F8C72A04D893B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3uooJveIBPrFQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add support to the SM8475 global clock controller by extending the
SM8450 global clock controller, which is almost identical but has some
minor differences.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig      |   3 +-
 drivers/clk/qcom/gcc-sm8450.c | 182 +++++++++++++++++++++++++++++++++-
 2 files changed, 183 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 11ae28430dad..decb41c4a58e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1032,7 +1032,8 @@ config SM_GCC_8450
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
-	  Support for the global clock controller on SM8450 devices.
+	  Support for the global clock controller on SM8450 or SM8475
+	  devices.
 	  Say Y if you want to use peripheral devices such as UART,
 	  SPI, I2C, USB, SD/UFS, PCIe etc.
 
diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index c445c271678a..83e8f1a5d51b 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -26,6 +26,8 @@ enum {
 	P_BI_TCXO,
 	P_GCC_GPLL0_OUT_EVEN,
 	P_GCC_GPLL0_OUT_MAIN,
+	P_GCC_GPLL2_OUT_EVEN,
+	P_GCC_GPLL3_OUT_EVEN,
 	P_GCC_GPLL4_OUT_MAIN,
 	P_GCC_GPLL9_OUT_MAIN,
 	P_PCIE_1_PHY_AUX_CLK,
@@ -36,6 +38,15 @@ enum {
 	P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
 };
 
+static struct clk_init_data gcc_gpll0_sm8475_init = {
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
 
+static struct clk_init_data gcc_gpll0_out_even_sm8475_init = {
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
 
+static struct clk_alpha_pll gcc_gpll2 = {
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
+static struct clk_alpha_pll gcc_gpll3 = {
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
+static struct clk_init_data gcc_gpll4_sm8475_init = {
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
 
+static struct clk_init_data gcc_gpll9_sm8475_init = {
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
 
+static const struct parent_map gcc_parent_map_sm8475_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_GCC_GPLL2_OUT_EVEN, 2 },
+	{ P_GCC_GPLL3_OUT_EVEN, 3 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_sm8475_3[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gcc_gpll0.clkr.hw },
+	{ .hw = &gcc_gpll2.clkr.hw },
+	{ .hw = &gcc_gpll3.clkr.hw },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
 static const struct parent_map gcc_parent_map_5[] = {
 	{ P_PCIE_1_PHY_AUX_CLK, 0 },
 	{ P_BI_TCXO, 2 },
@@ -915,6 +1003,16 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s6_clk_src = {
 	.clkr.hw.init = &gcc_qupv3_wrap2_s6_clk_src_init,
 };
 
+static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src_sm8475[] = {
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
 
+static const struct freq_tbl ftbl_gcc_ufs_phy_axi_clk_src_sm8475[] = {
+	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(150000000, P_GCC_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(300000000, P_GCC_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_GCC_GPLL0_OUT_MAIN, 1, 0, 0),
+	F(806400000, P_GCC_GPLL2_OUT_EVEN, 1, 0, 0),
+	F(850000000, P_GCC_GPLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gcc_ufs_phy_axi_clk_src_sm8475_init = {
+	.name = "gcc_ufs_phy_axi_clk_src",
+	.parent_data = gcc_parent_data_sm8475_3,
+	.num_parents = ARRAY_SIZE(gcc_parent_map_sm8475_3),
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
 
+static const struct freq_tbl ftbl_gcc_ufs_phy_ice_core_clk_src_sm8475[] = {
+	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(150000000, P_GCC_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(300000000, P_GCC_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_GCC_GPLL0_OUT_MAIN, 1, 0, 0),
+	F(806400000, P_GCC_GPLL2_OUT_EVEN, 1, 0, 0),
+	F(850000000, P_GCC_GPLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gcc_ufs_phy_ice_core_clk_src_sm8475_init = {
+	.name = "gcc_ufs_phy_ice_core_clk_src",
+	.parent_data = gcc_parent_data_sm8475_3,
+	.num_parents = ARRAY_SIZE(gcc_parent_map_sm8475_3),
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
 
+static struct clk_init_data gcc_ufs_phy_unipro_core_clk_src_sm8475_init = {
+	.name = "gcc_ufs_phy_unipro_core_clk_src",
+	.parent_data = gcc_parent_data_sm8475_3,
+	.num_parents = ARRAY_SIZE(gcc_parent_map_sm8475_3),
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
+	[GCC_GPLL2] = &gcc_gpll2.clkr,
+	[GCC_GPLL3] = &gcc_gpll3.clkr,
 };
 
 static const struct qcom_reset_map gcc_sm8450_resets[] = {
@@ -3259,6 +3404,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 
 static const struct of_device_id gcc_sm8450_match_table[] = {
 	{ .compatible = "qcom,gcc-sm8450" },
+	{ .compatible = "qcom,sm8475-gcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gcc_sm8450_match_table);
@@ -3277,6 +3423,40 @@ static int gcc_sm8450_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-gcc")) {
+		/* Update GCC PLL0 Config */
+		gcc_gpll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		gcc_gpll0.clkr.hw.init = &gcc_gpll0_sm8475_init;
+
+		gcc_gpll0_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		gcc_gpll0_out_even.clkr.hw.init = &gcc_gpll0_out_even_sm8475_init;
+
+		/* Update GCC PLL4 Config */
+		gcc_gpll4.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		gcc_gpll4.clkr.hw.init = &gcc_gpll4_sm8475_init;
+
+		/* Update GCC PLL9 Config */
+		gcc_gpll9.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		gcc_gpll9.clkr.hw.init = &gcc_gpll9_sm8475_init;
+
+		gcc_sdcc2_apps_clk_src.freq_tbl = ftbl_gcc_sdcc2_apps_clk_src_sm8475;
+
+		gcc_ufs_phy_axi_clk_src.parent_map = gcc_parent_map_sm8475_3;
+		gcc_ufs_phy_axi_clk_src.freq_tbl = ftbl_gcc_ufs_phy_axi_clk_src_sm8475;
+		gcc_ufs_phy_axi_clk_src.clkr.hw.init = &gcc_ufs_phy_axi_clk_src_sm8475_init;
+
+		gcc_ufs_phy_ice_core_clk_src.parent_map = gcc_parent_map_sm8475_3;
+		gcc_ufs_phy_ice_core_clk_src.freq_tbl = ftbl_gcc_ufs_phy_ice_core_clk_src_sm8475;
+		gcc_ufs_phy_ice_core_clk_src.clkr.hw.init = &gcc_ufs_phy_ice_core_clk_src_sm8475_init;
+
+		gcc_ufs_phy_unipro_core_clk_src.parent_map = gcc_parent_map_sm8475_3;
+		gcc_ufs_phy_unipro_core_clk_src.freq_tbl = ftbl_gcc_ufs_phy_ice_core_clk_src_sm8475;
+		gcc_ufs_phy_unipro_core_clk_src.clkr.hw.init = &gcc_ufs_phy_unipro_core_clk_src_sm8475_init;
+	} else {
+		gcc_sm8450_desc.clks[GCC_GPLL2] = NULL;
+		gcc_sm8450_desc.clks[GCC_GPLL3] = NULL;
+	}
+
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
 
@@ -3312,5 +3492,5 @@ static void __exit gcc_sm8450_exit(void)
 }
 module_exit(gcc_sm8450_exit);
 
-MODULE_DESCRIPTION("QTI GCC SM8450 Driver");
+MODULE_DESCRIPTION("QTI GCC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL v2");
-- 
2.45.2


