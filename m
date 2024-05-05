Return-Path: <linux-arm-msm+bounces-19222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2849A8BC380
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 22:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93AF91F21168
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 20:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8030076046;
	Sun,  5 May 2024 20:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="S7Up/MTK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp56.i.mail.ru (smtp56.i.mail.ru [95.163.41.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C5757F8;
	Sun,  5 May 2024 20:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714939863; cv=none; b=KM+0LPAePVmOdCB5/7YEWSbJlzi0G7RS08wV8K/5U6SOBG8M75FnT6o1ho0a4f9DXmmteqpQY4OGE2JBNQMJGaz3jMhOPpxYOE860cLhk6TU/3vmnDI4Xc8ONz0+SgMJ7Q9UMv+J6EN4WltiYVGIfWIsazpbpOecJDy02t4sFqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714939863; c=relaxed/simple;
	bh=xoPSdufw5tY6sK2YkcLCziRds1XovtxoodEeOPgAgNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXk0Xu4aQH8yYz4bsHfuvprOiF+iRSp7oBT5MyszDdT6upzdYT5iUgTnxMDBj2tF3v/v9CtrcxXMUZibzb1dXx+MkueF4UWWIZHrxmsZor7V7B7dkhqw4P/eE2M91CJwXojER5jqwqxynYJi7tZissekRP6LO2hoHa1Tp06Shuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=S7Up/MTK; arc=none smtp.client-ip=95.163.41.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=YNtt3uO2j5QZLluUKUfbaYPTqL8TGOyOAxXJSex9s0s=; t=1714939861; x=1715029861; 
	b=S7Up/MTKPnR/AtBFNiGWbPNO8PcnOQNLvMA80sABL17VoCtEDSgokS3LnYx9Da7HFjHkryZN4X8
	OoP7DaWXKwxXLm8HBJJjdDWhEc560gLhj6LfXwfV6EazgyZpHfT5ESxbuIV1FBeYK90qaQAezEMVM
	70dStxMzy941zsnaIbE=;
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1s3iCI-00000009RwX-1VBS; Sun, 05 May 2024 23:10:58 +0300
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
Subject: [PATCH v3 8/8] clk: qcom: Add Video Clock Controller driver for SM7150
Date: Sun,  5 May 2024 23:10:38 +0300
Message-ID: <20240505201038.276047-9-danila@jiaxyga.com>
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
Authentication-Results: smtp56.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9C1015E4FDF537780612B9BDA89275F00AF6777AB749340E2182A05F538085040CB9C0961561AFB765D1BE6A8D71B10A54671E2EA33EB36B3BE7375619A971F14E49391A50CB82CE1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B23E8716B669353DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372E000E903B06FBD58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D896FCD5542E82CCE6965C51F0EA95FD599739D5B77211CE57CC7F00164DA146DAFE8445B8C89999728AA50765F7900637CAEE156C82D3D7D9389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8A9FF340AA05FB58CF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CAD0E433DBF1FBFA39735652A29929C6C4AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C391041352CAA6A1D7BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF4964A708C60C975A1DD303D21008E298D5E8D9A59859A8B636DA1BED736F932875ECD9A6C639B01B78DA827A17800CE70AD1028CF10412FC43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5EBEC787826C2090F5002B1117B3ED696B45E26DACA350D4C1E49B01306B5E3AD823CB91A9FED034534781492E4B8EEAD5E26F3260102D3FBC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF7D735BC07E23B1B484CEC67774BEC9BC1E1D48B79E249BABD4B27000B41C09FADE1AF985A89825B6643425263F8C9A4E69BB0C06E754AC9FED97F980A7132E108E636965518DB47D146D90F64BF3396102C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Gch4W13RDFvZxan6sIvYw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C739498105F947809758DEDF81508210FEB0A3EA2AA54A67886968AB7D3D195A283932F22C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Add support for the video clock controller found on SM7150.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig          |  10 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sm7150.c | 357 ++++++++++++++++++++++++++++++
 3 files changed, 368 insertions(+)
 create mode 100644 drivers/clk/qcom/videocc-sm7150.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 14e19f4c804c..20ba2eeb24ec 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1137,6 +1137,16 @@ config SM_TCSRCC_8650
 	  Support for the TCSR clock controller on SM8650 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
 
+config SM_VIDEOCC_7150
+	tristate "SM7150 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_7150
+	select QCOM_GDSC
+	help
+	  Support for the video clock controller on SM7150 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config SM_VIDEOCC_8150
 	tristate "SM8150 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9c83abef9cac..b7de8600dc3d 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -143,6 +143,7 @@ obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
+obj-$(CONFIG_SM_VIDEOCC_7150) += videocc-sm7150.o
 obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
 obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
 obj-$(CONFIG_SM_VIDEOCC_8350) += videocc-sm8350.o
diff --git a/drivers/clk/qcom/videocc-sm7150.c b/drivers/clk/qcom/videocc-sm7150.c
new file mode 100644
index 000000000000..64f6b03996fc
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sm7150.c
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm7150-videocc.h>
+
+#include "common.h"
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "gdsc.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEOCC_PLL0_OUT_EVEN,
+	P_VIDEOCC_PLL0_OUT_MAIN,
+	P_VIDEOCC_PLL0_OUT_ODD,
+};
+
+static const struct pll_vco fabia_vco[] = {
+	{ 249600000, 2000000000, 0 },
+	{ 125000000, 1000000000, 1 },
+};
+
+static struct alpha_pll_config videocc_pll0_config = {
+	.l = 0x19,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002067,
+	.user_ctl_val = 0x00000001,
+	.user_ctl_hi_val = 0x00004805,
+	.test_ctl_hi_val = 0x40000000,
+};
+
+static struct clk_alpha_pll videocc_pll0 = {
+	.offset = 0x42c,
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "videocc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fabia_ops,
+		},
+	},
+};
+
+static const struct parent_map videocc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEOCC_PLL0_OUT_MAIN, 1 },
+	{ P_VIDEOCC_PLL0_OUT_EVEN, 2 },
+	{ P_VIDEOCC_PLL0_OUT_ODD, 3 },
+};
+
+static const struct clk_parent_data videocc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &videocc_pll0.clkr.hw },
+	{ .hw = &videocc_pll0.clkr.hw },
+	{ .hw = &videocc_pll0.clkr.hw },
+};
+
+static const struct parent_map videocc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data videocc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct freq_tbl ftbl_videocc_iris_clk_src[] = {
+	F(240000000, P_VIDEOCC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEOCC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(365000000, P_VIDEOCC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEOCC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEOCC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 videocc_iris_clk_src = {
+	.cmd_rcgr = 0x7f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = videocc_parent_map_0,
+	.freq_tbl = ftbl_videocc_iris_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "videocc_iris_clk_src",
+		.parent_data = videocc_parent_data_0,
+		.num_parents = ARRAY_SIZE(videocc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_videocc_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 videocc_xo_clk_src = {
+	.cmd_rcgr = 0xa98,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = videocc_parent_map_1,
+	.freq_tbl = ftbl_videocc_xo_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "videocc_xo_clk_src",
+		.parent_data = videocc_parent_data_1,
+		.num_parents = ARRAY_SIZE(videocc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch videocc_iris_ahb_clk = {
+	.halt_reg = 0x8f4,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x8f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "videocc_iris_ahb_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &videocc_iris_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_mvs0_axi_clk = {
+	.halt_reg = 0x9ec,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "videocc_mvs0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_mvs0_core_clk = {
+	.halt_reg = 0x890,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x890,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "videocc_mvs0_core_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &videocc_iris_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_mvs1_axi_clk = {
+	.halt_reg = 0xa0c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa0c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "videocc_mvs1_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_mvs1_core_clk = {
+	.halt_reg = 0x8d0,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x8d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "videocc_mvs1_core_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &videocc_iris_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_mvsc_core_clk = {
+	.halt_reg = 0x850,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x850,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "videocc_mvsc_core_clk",
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &videocc_iris_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_mvsc_ctl_axi_clk = {
+	.halt_reg = 0x9cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "videocc_mvsc_ctl_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_venus_ahb_clk = {
+	.halt_reg = 0xa6c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa6c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "videocc_venus_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc venus_gdsc = {
+	.gdscr = 0x814,
+	.pd = {
+		.name = "venus_gdsc",
+	},
+	.cxcs = (unsigned int []){ 0x850, 0x9cc },
+	.cxc_count = 2,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc vcodec0_gdsc = {
+	.gdscr = 0x874,
+	.pd = {
+		.name = "vcodec0_gdsc",
+	},
+	.cxcs = (unsigned int []){ 0x890, 0x9ec },
+	.cxc_count = 2,
+	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc vcodec1_gdsc = {
+	.gdscr = 0x8b4,
+	.pd = {
+		.name = "vcodec1_gdsc",
+	},
+	.cxcs = (unsigned int []){ 0x8d0, 0xa0c },
+	.cxc_count = 2,
+	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct clk_regmap *videocc_sm7150_clocks[] = {
+	[VIDEOCC_PLL0] = &videocc_pll0.clkr,
+	[VIDEOCC_IRIS_AHB_CLK] = &videocc_iris_ahb_clk.clkr,
+	[VIDEOCC_IRIS_CLK_SRC] = &videocc_iris_clk_src.clkr,
+	[VIDEOCC_MVS0_AXI_CLK] = &videocc_mvs0_axi_clk.clkr,
+	[VIDEOCC_MVS0_CORE_CLK] = &videocc_mvs0_core_clk.clkr,
+	[VIDEOCC_MVS1_AXI_CLK] = &videocc_mvs1_axi_clk.clkr,
+	[VIDEOCC_MVS1_CORE_CLK] = &videocc_mvs1_core_clk.clkr,
+	[VIDEOCC_MVSC_CORE_CLK] = &videocc_mvsc_core_clk.clkr,
+	[VIDEOCC_MVSC_CTL_AXI_CLK] = &videocc_mvsc_ctl_axi_clk.clkr,
+	[VIDEOCC_VENUS_AHB_CLK] = &videocc_venus_ahb_clk.clkr,
+	[VIDEOCC_XO_CLK_SRC] = &videocc_xo_clk_src.clkr,
+};
+
+static struct gdsc *videocc_sm7150_gdscs[] = {
+	[VENUS_GDSC] = &venus_gdsc,
+	[VCODEC0_GDSC] = &vcodec0_gdsc,
+	[VCODEC1_GDSC] = &vcodec1_gdsc,
+};
+
+static const struct regmap_config videocc_sm7150_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0xb94,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc videocc_sm7150_desc = {
+	.config = &videocc_sm7150_regmap_config,
+	.clks = videocc_sm7150_clocks,
+	.num_clks = ARRAY_SIZE(videocc_sm7150_clocks),
+	.gdscs = videocc_sm7150_gdscs,
+	.num_gdscs = ARRAY_SIZE(videocc_sm7150_gdscs),
+};
+
+static const struct of_device_id videocc_sm7150_match_table[] = {
+	{ .compatible = "qcom,sm7150-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, videocc_sm7150_match_table);
+
+static int videocc_sm7150_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &videocc_sm7150_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_fabia_pll_configure(&videocc_pll0, regmap, &videocc_pll0_config);
+
+	/* Keep some clocks always-on */
+	qcom_branch_set_clk_en(regmap, 0x984); /* VIDEOCC_XO_CLK */
+
+	return qcom_cc_really_probe(pdev, &videocc_sm7150_desc, regmap);
+}
+
+static struct platform_driver videocc_sm7150_driver = {
+	.probe = videocc_sm7150_probe,
+	.driver = {
+		.name = "videocc-sm7150",
+		.of_match_table = videocc_sm7150_match_table,
+	},
+};
+module_platform_driver(videocc_sm7150_driver);
+
+MODULE_DESCRIPTION("Qualcomm SM7150 Video Clock Controller");
+MODULE_LICENSE("GPL");
-- 
2.44.0


