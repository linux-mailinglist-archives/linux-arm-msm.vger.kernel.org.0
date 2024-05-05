Return-Path: <linux-arm-msm+bounces-19223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E658BC38D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 22:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58B8B1F21819
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 20:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D0F6EB5B;
	Sun,  5 May 2024 20:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="nWQrOyCg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="MWLIwteJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D12C6A3;
	Sun,  5 May 2024 20:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714940104; cv=none; b=A6ZzcaOvILD+cyFM2pNTrISNsHfHKAaKTgkOTpGz1YSw2Gv/3tZ0yKTC1jhjkmIctLy3OCNpA9TTdKeN8ss8sn9Hli5D7zBPWeUMryWg3UU8vYgz2AwcHbzcBvGim78SbZ1u4+Ou1HO1XS3/Km6o0C9gUCH1uIhFVvN2bl7+cng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714940104; c=relaxed/simple;
	bh=u3vENoeJzdqKSp6th1zcRgR8Vd3nBFa02U2sO3/968s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzsKYNMCh1qep2BlNF1t0B84+GWL5B/WiouZXUtGZFcYQ2Evhjnr3gVQfYHrBMv8BePSGfCB5SFLGMDiE1NpQWK71WhxRiKHH9IrnnRBrL35wf1G2iTod8gZk8Q8eMPu0X48IOll0M3w+ZoiVEE4Is3CGyqJhpV6/N1VidCEe6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=nWQrOyCg; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=MWLIwteJ; arc=none smtp.client-ip=79.137.243.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=ZmQEZU0QYfP3wFsxRgiqClhmUUu/PQbW1wUlpnaxbZE=;
	t=1714940101;x=1715030101; 
	b=nWQrOyCgl274ldVJmLT8r5k693cQaPI5gcBbnYDEvq9GWQMpaJaygU7fYLIkFExX4tCu886l1nWux599T1qAAvs0cuzbU3TtFJL2s6LUc4KyUoJyHFf3lm5WLBUUkPBuProBnsmOfsjXmzBWPjQuhSuYwOLP8CY9I2ch36dFFpU=;
Received: from [10.12.4.31] (port=34276 helo=smtp56.i.mail.ru)
	by fallback16.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1s3iCJ-000Ami-D8; Sun, 05 May 2024 23:10:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=ZmQEZU0QYfP3wFsxRgiqClhmUUu/PQbW1wUlpnaxbZE=; t=1714939859; x=1715029859; 
	b=MWLIwteJdOkZhoni6elENAqAt2LEkAdpOcRxXDchyB8SW8ClqfLQ6/FCBJb4SkHikDoxyvsTeyk
	SRHE7cFnmpm2Omc2BSmPcYNiAfmJf/H/Ggs4nBO9KEUwhKGnq5Mpt/52MPSjwvUPjcl1emfBmSkwU
	T04re7+FZ1FXXy/VBYE=;
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1s3iC8-00000009RwX-4AL2; Sun, 05 May 2024 23:10:49 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	david@mainlining.org,
	adrian@travitia.xyz
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v3 4/8] clk: qcom: Add Display Clock Controller driver for SM7150
Date: Sun,  5 May 2024 23:10:34 +0300
Message-ID: <20240505201038.276047-5-danila@jiaxyga.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240505201038.276047-1-danila@jiaxyga.com>
References: <20240505201038.276047-1-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD9C1015E4FDF53778052AA746A635059247390FDDB69804F34182A05F5380850409467137C2AE150545D1BE6A8D71B10A5F01ED84C09E02A34BE7375619A971F1455A617483E1C9283
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E9B91E80248DE6B6EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637A975286280E7A0BD8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BDA44D143F423F79965C51F0EA95FD59194EDB497D446826CC7F00164DA146DAFE8445B8C89999728AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8C2B5EEE3591E0D35F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C1DAA61796BF5227B302FCEF25BFAB3454AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C37719D61DA741C3B0BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF4964A708C60C975A1DD303D21008E298D5E8D9A59859A8B636DA1BED736F932875ECD9A6C639B01B78DA827A17800CE7EBD83694CB3B8CDE731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A58391C67C0C00C9655002B1117B3ED696DCB7022986AD163DE99897350C7C491E823CB91A9FED034534781492E4B8EEADF4003A3AE7E1CCECC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF228FDF81804A5D9BEDB8B90D51BF09201792FAF4552AE7836273A1F1AE193EAF49BEE304256398FC643425263F8C9A4ED52BA51737185C8BED97F980A7132E109207279D3FC7B726146D90F64BF3396102C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Gch4W13RDGcCe6ElqwqGA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C739498105F947809758DEDF77EA6416FFE467E14B94D158322AE390D4B5ABD3733EDD1A2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B476D451B6D5EC6144E7684AE56F92982BEA9DA0FA1A14167768F3CF0E9FE49B69A0D2E209AB8FF7E2CF872A804EAA458FB6FCC2700B3BBB05C5A7CD3F145D9BB0
X-7FA49CB5: 0D63561A33F958A5464AEE95385A875593543CA515D003EA29A0019AB04D446C8941B15DA834481FA18204E546F3947CB861051D4BA689FCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637F3E38EE449E3E2AE389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C325AE611EB865B371089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Gch4W13RDEjiLKGJgIdpw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add support for the display clock controller found on SM7150.

Co-developed-by: David Wronek <david@mainlining.org>
Signed-off-by: David Wronek <david@mainlining.org>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig         |   10 +
 drivers/clk/qcom/Makefile        |    1 +
 drivers/clk/qcom/dispcc-sm7150.c | 1006 ++++++++++++++++++++++++++++++
 3 files changed, 1017 insertions(+)
 create mode 100644 drivers/clk/qcom/dispcc-sm7150.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 2b0e536d6d70..7b4c2ff580a3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -847,6 +847,16 @@ config SM_DISPCC_6125
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen
 
+config SM_DISPCC_7150
+	tristate "SM7150 Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	depends on SM_GCC_7150
+	help
+	  Support for the display clock controller on Qualcomm Technologies, Inc
+	  SM7150 devices.
+	  Say Y if you want to support display devices and functionality such as
+	  splash screen.
+
 config SM_DISPCC_8250
 	tristate "SM8150/SM8250/SM8350 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index dec5b6db6860..cdec5ce2bb94 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -113,6 +113,7 @@ obj-$(CONFIG_SM_DISPCC_6115) += dispcc-sm6115.o
 obj-$(CONFIG_SM_DISPCC_6125) += dispcc-sm6125.o
 obj-$(CONFIG_SM_DISPCC_6350) += dispcc-sm6350.o
 obj-$(CONFIG_SM_DISPCC_6375) += dispcc-sm6375.o
+obj-$(CONFIG_SM_DISPCC_7150) += dispcc-sm7150.o
 obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
 obj-$(CONFIG_SM_DISPCC_8450) += dispcc-sm8450.o
 obj-$(CONFIG_SM_DISPCC_8550) += dispcc-sm8550.o
diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
new file mode 100644
index 000000000000..5c8ae95b6763
--- /dev/null
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -0,0 +1,1006 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ * Copyright (c) 2024, David Wronek <david@mainlining.org>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm7150-dispcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_GCC_DISP_GPLL0_CLK,
+	DT_CHIP_SLEEP_CLK,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+	DT_DP_PHY_PLL_LINK_CLK,
+	DT_DP_PHY_PLL_VCO_DIV_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_CHIP_SLEEP_CLK,
+	P_DISPCC_PLL0_OUT_EVEN,
+	P_DISPCC_PLL0_OUT_MAIN,
+	P_DP_PHY_PLL_LINK_CLK,
+	P_DP_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+	P_GCC_DISP_GPLL0_CLK,
+};
+
+static const struct pll_vco fabia_vco[] = {
+	{ 249600000, 2000000000, 0 },
+	{ 125000000, 1000000000, 1 },
+};
+
+/* 860MHz configuration */
+static const struct alpha_pll_config dispcc_pll0_config = {
+	.l = 0x2c,
+	.alpha = 0xcaaa,
+	.test_ctl_val = 0x40000000,
+};
+
+static struct clk_alpha_pll dispcc_pll0 = {
+	.offset = 0x0,
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fabia_ops,
+		},
+	},
+};
+
+static const struct parent_map dispcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 2 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map dispcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map dispcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct clk_parent_data dispcc_parent_data_2_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct parent_map dispcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISPCC_PLL0_OUT_MAIN, 1 },
+	{ P_GCC_DISP_GPLL0_CLK, 4 },
+	{ P_DISPCC_PLL0_OUT_EVEN, 5 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dispcc_pll0.clkr.hw },
+	{ .index = DT_GCC_DISP_GPLL0_CLK },
+	{ .hw = &dispcc_pll0.clkr.hw },
+};
+
+static const struct parent_map dispcc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+};
+
+static const struct parent_map dispcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_DISP_GPLL0_CLK, 4 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GCC_DISP_GPLL0_CLK },
+};
+
+static const struct parent_map dispcc_parent_map_6[] = {
+	{ P_CHIP_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data dispcc_parent_data_6[] = {
+	{ .index = DT_CHIP_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_dispcc_mdss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(37500000, P_GCC_DISP_GPLL0_CLK, 16, 0, 0),
+	F(75000000, P_GCC_DISP_GPLL0_CLK, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x22bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_5,
+	.freq_tbl = ftbl_dispcc_mdss_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_ahb_clk_src",
+		.parent_data = dispcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dispcc_mdss_byte0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x2110,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_0,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_byte0_clk_src",
+		.parent_data = dispcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_byte1_clk_src = {
+	.cmd_rcgr = 0x212c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_0,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_byte1_clk_src",
+		.parent_data = dispcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_dp_aux_clk_src = {
+	.cmd_rcgr = 0x21dc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_2,
+	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_dp_aux_clk_src",
+		.parent_data = dispcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dispcc_mdss_dp_crypto_clk_src[] = {
+	F(108000, P_DP_PHY_PLL_LINK_CLK, 3, 0, 0),
+	F(180000, P_DP_PHY_PLL_LINK_CLK, 3, 0, 0),
+	F(360000, P_DP_PHY_PLL_LINK_CLK, 1.5, 0, 0),
+	F(540000, P_DP_PHY_PLL_LINK_CLK, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_mdss_dp_crypto_clk_src = {
+	.cmd_rcgr = 0x2194,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_1,
+	.freq_tbl = ftbl_dispcc_mdss_dp_crypto_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_dp_crypto_clk_src",
+		.parent_data = dispcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_dp_link_clk_src = {
+	.cmd_rcgr = 0x2178,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_1,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_dp_link_clk_src",
+		.parent_data = dispcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_dp_pixel1_clk_src = {
+	.cmd_rcgr = 0x21c4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_1,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_dp_pixel1_clk_src",
+		.parent_data = dispcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_dp_pixel_clk_src = {
+	.cmd_rcgr = 0x21ac,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_1,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_dp_pixel_clk_src",
+		.parent_data = dispcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x2148,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_0,
+	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_esc0_clk_src",
+		.parent_data = dispcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_esc1_clk_src = {
+	.cmd_rcgr = 0x2160,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_0,
+	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_esc1_clk_src",
+		.parent_data = dispcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dispcc_mdss_mdp_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(85714286, P_GCC_DISP_GPLL0_CLK, 7, 0, 0),
+	F(100000000, P_GCC_DISP_GPLL0_CLK, 6, 0, 0),
+	F(150000000, P_GCC_DISP_GPLL0_CLK, 4, 0, 0),
+	F(172000000, P_DISPCC_PLL0_OUT_MAIN, 5, 0, 0),
+	F(200000000, P_GCC_DISP_GPLL0_CLK, 3, 0, 0),
+	F(286666667, P_DISPCC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GCC_DISP_GPLL0_CLK, 2, 0, 0),
+	F(344000000, P_DISPCC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(430000000, P_DISPCC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x20c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_3,
+	.freq_tbl = ftbl_dispcc_mdss_mdp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_mdp_clk_src",
+		.parent_data = dispcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x2098,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_pclk0_clk_src",
+		.parent_data = dispcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_pclk1_clk_src = {
+	.cmd_rcgr = 0x20b0,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_pclk1_clk_src",
+		.parent_data = dispcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dispcc_mdss_rot_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(171428571, P_GCC_DISP_GPLL0_CLK, 3.5, 0, 0),
+	F(200000000, P_GCC_DISP_GPLL0_CLK, 3, 0, 0),
+	F(300000000, P_GCC_DISP_GPLL0_CLK, 2, 0, 0),
+	F(344000000, P_DISPCC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(430000000, P_DISPCC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_mdss_rot_clk_src = {
+	.cmd_rcgr = 0x20e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_3,
+	.freq_tbl = ftbl_dispcc_mdss_rot_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_rot_clk_src",
+		.parent_data = dispcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_3),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x20f8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_2,
+	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_mdss_vsync_clk_src",
+		.parent_data = dispcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dispcc_sleep_clk_src[] = {
+	F(32000, P_CHIP_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dispcc_sleep_clk_src = {
+	.cmd_rcgr = 0x6060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_6,
+	.freq_tbl = ftbl_dispcc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_sleep_clk_src",
+		.parent_data = dispcc_parent_data_6,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_6),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 dispcc_xo_clk_src = {
+	.cmd_rcgr = 0x6044,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dispcc_parent_map_2,
+	.freq_tbl = ftbl_dispcc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dispcc_xo_clk_src",
+		.parent_data = dispcc_parent_data_2_ao,
+		.num_parents = ARRAY_SIZE(dispcc_parent_data_2_ao),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch dispcc_mdss_ahb_clk = {
+	.halt_reg = 0x2080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_byte0_clk = {
+	.halt_reg = 0x2028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div dispcc_mdss_byte0_div_clk_src = {
+	.reg = 0x2128,
+	.shift = 0,
+	.width = 2,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte0_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x202c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x202c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte0_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_byte1_clk = {
+	.halt_reg = 0x2030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div dispcc_mdss_byte1_div_clk_src = {
+	.reg = 0x2144,
+	.shift = 0,
+	.width = 2,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte1_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_byte1_intf_clk = {
+	.halt_reg = 0x2034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_byte1_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_byte1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_aux_clk = {
+	.halt_reg = 0x2054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_crypto_clk = {
+	.halt_reg = 0x2048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_crypto_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_link_clk = {
+	.halt_reg = 0x2040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_link_intf_clk = {
+	.halt_reg = 0x2044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_pixel1_clk = {
+	.halt_reg = 0x2050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_dp_pixel_clk = {
+	.halt_reg = 0x204c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x204c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_dp_pixel_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_dp_pixel_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_esc0_clk = {
+	.halt_reg = 0x2038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_esc1_clk = {
+	.halt_reg = 0x203c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x203c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_esc1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_mdp_clk = {
+	.halt_reg = 0x200c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x201c,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x201c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_mdp_lut_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0x4004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x4004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_non_gdsc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_pclk0_clk = {
+	.halt_reg = 0x2004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_pclk1_clk = {
+	.halt_reg = 0x2008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_pclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_rot_clk = {
+	.halt_reg = 0x2014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_rot_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_rot_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_rscc_ahb_clk = {
+	.halt_reg = 0x400c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x400c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_rscc_ahb_clk",
+			.parent_names = (const char *[]) {
+				"dispcc_mdss_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_rscc_vsync_clk = {
+	.halt_reg = 0x4008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_rscc_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_mdss_vsync_clk = {
+	.halt_reg = 0x2024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dispcc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dispcc_sleep_clk = {
+	.halt_reg = 0x6078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dispcc_sleep_clk",
+			.parent_names = (const char *[]) {
+				"dispcc_sleep_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc mdss_gdsc = {
+	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
+};
+
+static struct clk_regmap *dispcc_sm7150_clocks[] = {
+	[DISPCC_MDSS_AHB_CLK] = &dispcc_mdss_ahb_clk.clkr,
+	[DISPCC_MDSS_AHB_CLK_SRC] = &dispcc_mdss_ahb_clk_src.clkr,
+	[DISPCC_MDSS_BYTE0_CLK] = &dispcc_mdss_byte0_clk.clkr,
+	[DISPCC_MDSS_BYTE0_CLK_SRC] = &dispcc_mdss_byte0_clk_src.clkr,
+	[DISPCC_MDSS_BYTE0_DIV_CLK_SRC] = &dispcc_mdss_byte0_div_clk_src.clkr,
+	[DISPCC_MDSS_BYTE0_INTF_CLK] = &dispcc_mdss_byte0_intf_clk.clkr,
+	[DISPCC_MDSS_BYTE1_CLK] = &dispcc_mdss_byte1_clk.clkr,
+	[DISPCC_MDSS_BYTE1_CLK_SRC] = &dispcc_mdss_byte1_clk_src.clkr,
+	[DISPCC_MDSS_BYTE1_DIV_CLK_SRC] = &dispcc_mdss_byte1_div_clk_src.clkr,
+	[DISPCC_MDSS_BYTE1_INTF_CLK] = &dispcc_mdss_byte1_intf_clk.clkr,
+	[DISPCC_MDSS_DP_AUX_CLK] = &dispcc_mdss_dp_aux_clk.clkr,
+	[DISPCC_MDSS_DP_AUX_CLK_SRC] = &dispcc_mdss_dp_aux_clk_src.clkr,
+	[DISPCC_MDSS_DP_CRYPTO_CLK] = &dispcc_mdss_dp_crypto_clk.clkr,
+	[DISPCC_MDSS_DP_CRYPTO_CLK_SRC] = &dispcc_mdss_dp_crypto_clk_src.clkr,
+	[DISPCC_MDSS_DP_LINK_CLK] = &dispcc_mdss_dp_link_clk.clkr,
+	[DISPCC_MDSS_DP_LINK_CLK_SRC] = &dispcc_mdss_dp_link_clk_src.clkr,
+	[DISPCC_MDSS_DP_LINK_INTF_CLK] = &dispcc_mdss_dp_link_intf_clk.clkr,
+	[DISPCC_MDSS_DP_PIXEL1_CLK] = &dispcc_mdss_dp_pixel1_clk.clkr,
+	[DISPCC_MDSS_DP_PIXEL1_CLK_SRC] = &dispcc_mdss_dp_pixel1_clk_src.clkr,
+	[DISPCC_MDSS_DP_PIXEL_CLK] = &dispcc_mdss_dp_pixel_clk.clkr,
+	[DISPCC_MDSS_DP_PIXEL_CLK_SRC] = &dispcc_mdss_dp_pixel_clk_src.clkr,
+	[DISPCC_MDSS_ESC0_CLK] = &dispcc_mdss_esc0_clk.clkr,
+	[DISPCC_MDSS_ESC0_CLK_SRC] = &dispcc_mdss_esc0_clk_src.clkr,
+	[DISPCC_MDSS_ESC1_CLK] = &dispcc_mdss_esc1_clk.clkr,
+	[DISPCC_MDSS_ESC1_CLK_SRC] = &dispcc_mdss_esc1_clk_src.clkr,
+	[DISPCC_MDSS_MDP_CLK] = &dispcc_mdss_mdp_clk.clkr,
+	[DISPCC_MDSS_MDP_CLK_SRC] = &dispcc_mdss_mdp_clk_src.clkr,
+	[DISPCC_MDSS_MDP_LUT_CLK] = &dispcc_mdss_mdp_lut_clk.clkr,
+	[DISPCC_MDSS_NON_GDSC_AHB_CLK] = &dispcc_mdss_non_gdsc_ahb_clk.clkr,
+	[DISPCC_MDSS_PCLK0_CLK] = &dispcc_mdss_pclk0_clk.clkr,
+	[DISPCC_MDSS_PCLK0_CLK_SRC] = &dispcc_mdss_pclk0_clk_src.clkr,
+	[DISPCC_MDSS_PCLK1_CLK] = &dispcc_mdss_pclk1_clk.clkr,
+	[DISPCC_MDSS_PCLK1_CLK_SRC] = &dispcc_mdss_pclk1_clk_src.clkr,
+	[DISPCC_MDSS_ROT_CLK] = &dispcc_mdss_rot_clk.clkr,
+	[DISPCC_MDSS_ROT_CLK_SRC] = &dispcc_mdss_rot_clk_src.clkr,
+	[DISPCC_MDSS_RSCC_AHB_CLK] = &dispcc_mdss_rscc_ahb_clk.clkr,
+	[DISPCC_MDSS_RSCC_VSYNC_CLK] = &dispcc_mdss_rscc_vsync_clk.clkr,
+	[DISPCC_MDSS_VSYNC_CLK] = &dispcc_mdss_vsync_clk.clkr,
+	[DISPCC_MDSS_VSYNC_CLK_SRC] = &dispcc_mdss_vsync_clk_src.clkr,
+	[DISPCC_PLL0] = &dispcc_pll0.clkr,
+	[DISPCC_SLEEP_CLK] = &dispcc_sleep_clk.clkr,
+	[DISPCC_SLEEP_CLK_SRC] = &dispcc_sleep_clk_src.clkr,
+	[DISPCC_XO_CLK_SRC] = &dispcc_xo_clk_src.clkr,
+};
+
+static struct gdsc *dispcc_sm7150_gdscs[] = {
+	[MDSS_GDSC] = &mdss_gdsc,
+};
+
+static const struct regmap_config dispcc_sm7150_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x10000,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc dispcc_sm7150_desc = {
+	.config = &dispcc_sm7150_regmap_config,
+	.clks = dispcc_sm7150_clocks,
+	.num_clks = ARRAY_SIZE(dispcc_sm7150_clocks),
+	.gdscs = dispcc_sm7150_gdscs,
+	.num_gdscs = ARRAY_SIZE(dispcc_sm7150_gdscs),
+};
+
+static const struct of_device_id dispcc_sm7150_match_table[] = {
+	{ .compatible = "qcom,sm7150-dispcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dispcc_sm7150_match_table);
+
+static int dispcc_sm7150_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &dispcc_sm7150_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_fabia_pll_configure(&dispcc_pll0, regmap, &dispcc_pll0_config);
+	/* Enable clock gating for DSI and MDP clocks */
+	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
+
+	/* Keep some clocks always-on */
+	qcom_branch_set_clk_en(regmap, 0x605c); /* DISPCC_XO_CLK */
+
+	return qcom_cc_really_probe(pdev, &dispcc_sm7150_desc, regmap);
+}
+
+static struct platform_driver dispcc_sm7150_driver = {
+	.probe = dispcc_sm7150_probe,
+	.driver = {
+		.name = "dispcc-sm7150",
+		.of_match_table = dispcc_sm7150_match_table,
+	},
+};
+
+module_platform_driver(dispcc_sm7150_driver);
+
+MODULE_DESCRIPTION("Qualcomm SM7150 Display Clock Controller");
+MODULE_LICENSE("GPL");
-- 
2.44.0


