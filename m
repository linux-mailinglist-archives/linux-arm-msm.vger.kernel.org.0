Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D54FF2B8C56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 08:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgKSH1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 02:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgKSH1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 02:27:42 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52F8C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 23:27:41 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id v21so1211330plo.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 23:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=o1EhymnSqCL7ihChwxU+A1J4ATz//6ABh0HjW5XDzaw=;
        b=SpfBC6NTawfO4asGjAi+XW9G5Emb5T/u1seKuEnZT9qhew8KZRmxP8mAUMZUC96nl8
         FiUvZRyNSaP2tVGaAljQrIW7qsx+Wc6n72gCaVzSb+fsk5g4Wh087u3lx0+sQBa6wx8M
         jZ629otJ0Rs4qCc+BYeFcBNe0/E8Aa4/wLH+CTya68mwX8pbldibtjopjbQGklRxSEiX
         EWTsZA96bIxp8iCo0oBwZPDs4EaH6fEI2rrpUrpzMHRmxNBpoGAqdcqWay3OSF19TX+T
         pGTDMuz7G2DwBxYssmQuqYAKHnZf9hPniM0yC+SQEIgk0UqMm9+7errrHqq3fv4Z0elV
         AwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=o1EhymnSqCL7ihChwxU+A1J4ATz//6ABh0HjW5XDzaw=;
        b=bqJQvsUQyIDenaH7Ic7zTWT4ItAJD7W4gjh+LKtiHZxI6ZhimcWfAX0ocOgMqOt36B
         v3AEkHQVmI3W+BE9XTq6/hszmnzWCImBDZUlltDeezr/KgugIRkeWK/XinjfyzQN2yfF
         R3jPQkZxjm3Y22ig0/x4txpAwb3Il2+3XlbUKkMcXKIK36bCeCETx4uLo1uLLgENp13k
         fB43Fh7mAEyNKvthTaNIyb9QIXp1wzejY2OjoVwOTGOcGCQ7r0nOuBF9+1NH3ZYMmjou
         A1HWSV2kesaldvRDNup0AKbD6EOZCf4AkSl7+gJd7tVwZJEmcbzlUHevWYtCGOs59CNw
         cIgw==
X-Gm-Message-State: AOAM533TQX/2TckVYjn1BvzDogIxVl7ACeAWr5l8M1Ph7FCeQq5MaMzn
        dt+/i+8kgKp4UapnXnMGm+wG
X-Google-Smtp-Source: ABdhPJy5XVfo/3jZDGnVeYBzrg8/FQF+naoeZl+lifwUDDXu+9/xRa66YrXfFRA90eUciIeSoSREGw==
X-Received: by 2002:a17:902:567:b029:d9:d6ba:cb65 with SMTP id 94-20020a1709020567b02900d9d6bacb65mr2908900plf.57.1605770861077;
        Wed, 18 Nov 2020 23:27:41 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id a8sm26802923pfa.132.2020.11.18.23.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:27:40 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/4] clk: qcom: Add SDX55 GCC support
Date:   Thu, 19 Nov 2020 12:57:12 +0530
Message-Id: <20201119072714.14460-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org>
References: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Naveen Yadav <naveenky@codeaurora.org>

Add Global Clock Controller (GCC) support for SDX55 SoCs from Qualcomm.

Signed-off-by: Naveen Yadav <naveenky@codeaurora.org>
[mani: converted to parent_data, commented critical clocks, cleanups]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/Kconfig     |    7 +
 drivers/clk/qcom/Makefile    |    1 +
 drivers/clk/qcom/gcc-sdx55.c | 1626 ++++++++++++++++++++++++++++++++++
 3 files changed, 1634 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-sdx55.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 3a965bd326d5..7897a3947e6d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -413,6 +413,13 @@ config SDM_LPASSCC_845
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
 	  controller to reset the LPASS subsystem.
 
+config SDX_GCC_55
+	tristate "SDX55 Global Clock Controller"
+	help
+	  Support for the global clock controller on SDX55 devices.
+	  Say Y if you want to use peripheral devices such as UART,
+	  SPI, I2C, USB, SD/UFS, PCIe etc.
+
 config SM_DISPCC_8250
 	tristate "SM8150 and SM8250 Display Clock Controller"
 	depends on SM_GCC_8150 || SM_GCC_8250
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 11ae86febe87..886b877e70c7 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
 obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
 obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
 obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
+obj-$(CONFIG_SDX_GCC_55) += gcc-sdx55.o
 obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
 obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
 obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
new file mode 100644
index 000000000000..bf114165e24b
--- /dev/null
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -0,0 +1,1626 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, Linaro Ltd.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,gcc-sdx55.h>
+
+#include "common.h"
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "reset.h"
+
+enum {
+	P_BI_TCXO,
+	P_CORE_BI_PLL_TEST_SE,
+	P_GPLL0_OUT_EVEN,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL4_OUT_EVEN,
+	P_GPLL5_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static struct clk_alpha_pll gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.clkr = {
+		.enable_reg = 0x6d000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_lucid_even[] = {
+	{ 0x0, 1 },
+	{ 0x1, 2 },
+	{ 0x3, 4 },
+	{ 0x7, 8 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpll0_out_even = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_lucid_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_lucid_even),
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll0_out_even",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll4 = {
+	.offset = 0x76000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.clkr = {
+		.enable_reg = 0x6d000,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll4",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll4_out_even = {
+	.offset = 0x76000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_lucid_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_lucid_even),
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll4_out_even",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &gpll4.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll5 = {
+	.offset = 0x74000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.clkr = {
+		.enable_reg = 0x6d000,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll5",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ops,
+		},
+	},
+};
+
+static const struct parent_map gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gcc_parents_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct clk_parent_data gcc_parents_0_ao[] = {
+	{ .fw_name = "bi_tcxo_ao" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map gcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_OUT_EVEN, 2 },
+	{ P_GPLL5_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gcc_parents_2[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4_out_even.clkr.hw },
+	{ .hw = &gpll5.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gcc_parents_3[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
+	{ .hw = &gpll0_out_even.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map gcc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gcc_parents_4[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map gcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_OUT_EVEN, 2 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gcc_parents_5[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4_out_even.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct freq_tbl ftbl_gcc_blsp1_qup1_i2c_apps_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_blsp1_qup1_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x11024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup1_i2c_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_blsp1_qup1_spi_apps_clk_src[] = {
+	F(960000, P_BI_TCXO, 10, 1, 2),
+	F(4800000, P_BI_TCXO, 4, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(15000000, P_GPLL0_OUT_EVEN, 5, 1, 4),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24000000, P_GPLL0_OUT_MAIN, 12.5, 1, 2),
+	F(25000000, P_GPLL0_OUT_MAIN, 12, 1, 2),
+	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_blsp1_qup1_spi_apps_clk_src = {
+	.cmd_rcgr = 0x1100c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup1_spi_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup2_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x13024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup2_i2c_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup2_spi_apps_clk_src = {
+	.cmd_rcgr = 0x1300c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup2_spi_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup3_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x15024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup3_i2c_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup3_spi_apps_clk_src = {
+	.cmd_rcgr = 0x1500c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup3_spi_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup4_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x17024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup4_i2c_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup4_spi_apps_clk_src = {
+	.cmd_rcgr = 0x1700c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup4_spi_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_blsp1_uart1_apps_clk_src[] = {
+	F(3686400, P_GPLL0_OUT_EVEN, 1, 192, 15625),
+	F(7372800, P_GPLL0_OUT_EVEN, 1, 384, 15625),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(14745600, P_GPLL0_OUT_EVEN, 1, 768, 15625),
+	F(16000000, P_GPLL0_OUT_EVEN, 1, 4, 75),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(19354839, P_GPLL0_OUT_MAIN, 15.5, 1, 2),
+	F(20000000, P_GPLL0_OUT_MAIN, 15, 1, 2),
+	F(20689655, P_GPLL0_OUT_MAIN, 14.5, 1, 2),
+	F(21428571, P_GPLL0_OUT_MAIN, 14, 1, 2),
+	F(22222222, P_GPLL0_OUT_MAIN, 13.5, 1, 2),
+	F(23076923, P_GPLL0_OUT_MAIN, 13, 1, 2),
+	F(24000000, P_GPLL0_OUT_MAIN, 5, 1, 5),
+	F(25000000, P_GPLL0_OUT_MAIN, 12, 1, 2),
+	F(26086957, P_GPLL0_OUT_MAIN, 11.5, 1, 2),
+	F(27272727, P_GPLL0_OUT_MAIN, 11, 1, 2),
+	F(28571429, P_GPLL0_OUT_MAIN, 10.5, 1, 2),
+	F(32000000, P_GPLL0_OUT_MAIN, 1, 4, 75),
+	F(40000000, P_GPLL0_OUT_MAIN, 15, 0, 0),
+	F(46400000, P_GPLL0_OUT_MAIN, 1, 29, 375),
+	F(48000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
+	F(51200000, P_GPLL0_OUT_MAIN, 1, 32, 375),
+	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 75),
+	F(58982400, P_GPLL0_OUT_MAIN, 1, 1536, 15625),
+	F(60000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	F(63157895, P_GPLL0_OUT_MAIN, 9.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_blsp1_uart1_apps_clk_src = {
+	.cmd_rcgr = 0x1200c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_uart1_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_uart1_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_uart2_apps_clk_src = {
+	.cmd_rcgr = 0x1400c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_uart1_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_uart2_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_uart3_apps_clk_src = {
+	.cmd_rcgr = 0x1600c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_uart1_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_uart3_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_uart4_apps_clk_src = {
+	.cmd_rcgr = 0x1800c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_uart1_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_uart4_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(133333333, P_GPLL0_OUT_MAIN, 4.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
+	.cmd_rcgr = 0x24010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_cpuss_ahb_clk_src",
+		.parent_data = gcc_parents_0_ao,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_cpuss_rbcpr_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_cpuss_rbcpr_clk_src = {
+	.cmd_rcgr = 0x2402c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_cpuss_rbcpr_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_cpuss_rbcpr_clk_src",
+		.parent_data = gcc_parents_0_ao,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_emac_clk_src[] = {
+	F(2500000, P_BI_TCXO, 1, 25, 192),
+	F(5000000, P_BI_TCXO, 1, 25, 96),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(250000000, P_GPLL4_OUT_EVEN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_emac_clk_src = {
+	.cmd_rcgr = 0x47020,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_gcc_emac_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_emac_clk_src",
+		.parent_data = gcc_parents_5,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_emac_ptp_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(230400000, P_GPLL5_OUT_MAIN, 3.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_emac_ptp_clk_src = {
+	.cmd_rcgr = 0x47038,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_emac_ptp_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_emac_ptp_clk_src",
+		.parent_data = gcc_parents_2,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x2b004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp1_clk_src",
+		.parent_data = gcc_parents_3,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x2c004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp2_clk_src",
+		.parent_data = gcc_parents_3,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp3_clk_src = {
+	.cmd_rcgr = 0x2d004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp3_clk_src",
+		.parent_data = gcc_parents_3,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_aux_phy_clk_src = {
+	.cmd_rcgr = 0x37034,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_gcc_cpuss_rbcpr_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pcie_aux_phy_clk_src",
+		.parent_data = gcc_parents_4,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_rchng_phy_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_rchng_phy_clk_src = {
+	.cmd_rcgr = 0x37050,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_pcie_rchng_phy_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pcie_rchng_phy_clk_src",
+		.parent_data = gcc_parents_3,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pdm2_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(60000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pdm2_clk_src = {
+	.cmd_rcgr = 0x19010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pdm2_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pdm2_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0xf00c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sdcc1_apps_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb30_master_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_EVEN, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb30_master_clk_src = {
+	.cmd_rcgr = 0xb024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_usb30_master_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb30_master_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb30_mock_utmi_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb30_mock_utmi_clk_src = {
+	.cmd_rcgr = 0xb03c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_usb30_mock_utmi_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb30_mock_utmi_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb3_phy_aux_clk_src[] = {
+	F(1000000, P_BI_TCXO, 1, 5, 96),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb3_phy_aux_clk_src = {
+	.cmd_rcgr = 0xb064,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_gcc_usb3_phy_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb3_phy_aux_clk_src",
+		.parent_data = gcc_parents_4,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_ahb_pcie_link_clk = {
+	.halt_reg = 0x22004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x22004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ahb_pcie_link_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_ahb_clk = {
+	.halt_reg = 0x10004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(14),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
+	.halt_reg = 0x11008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup1_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_qup1_i2c_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
+	.halt_reg = 0x11004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup1_spi_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_qup1_spi_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
+	.halt_reg = 0x13008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup2_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_qup2_i2c_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
+	.halt_reg = 0x13004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup2_spi_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_qup2_spi_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
+	.halt_reg = 0x15008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x15008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup3_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_qup3_i2c_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
+	.halt_reg = 0x15004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x15004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup3_spi_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_qup3_spi_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
+	.halt_reg = 0x17008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup4_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_qup4_i2c_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
+	.halt_reg = 0x17004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup4_spi_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_qup4_spi_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart1_apps_clk = {
+	.halt_reg = 0x12004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart1_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_uart1_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart2_apps_clk = {
+	.halt_reg = 0x14004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x14004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart2_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_uart2_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart3_apps_clk = {
+	.halt_reg = 0x16004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x16004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart3_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_uart3_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart4_apps_clk = {
+	.halt_reg = 0x18004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x18004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart4_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_blsp1_uart4_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_boot_rom_ahb_clk = {
+	.halt_reg = 0x1c004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1c004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_boot_rom_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ce1_ahb_clk = {
+	.halt_reg = 0x2100c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2100c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ce1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ce1_axi_clk = {
+	.halt_reg = 0x21008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ce1_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ce1_clk = {
+	.halt_reg = 0x21004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ce1_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cpuss_rbcpr_clk = {
+	.halt_reg = 0x24008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x24008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cpuss_rbcpr_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_cpuss_rbcpr_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_eth_axi_clk = {
+	.halt_reg = 0x4701c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4701c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_eth_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_eth_ptp_clk = {
+	.halt_reg = 0x47018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x47018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_eth_ptp_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_emac_ptp_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_eth_rgmii_clk = {
+	.halt_reg = 0x47010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x47010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_eth_rgmii_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_emac_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_eth_slave_ahb_clk = {
+	.halt_reg = 0x47014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x47014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_eth_slave_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp1_clk = {
+	.halt_reg = 0x2b000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2b000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_gp1_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp2_clk = {
+	.halt_reg = 0x2c000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_gp2_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp3_clk = {
+	.halt_reg = 0x2d000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2d000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp3_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_gp3_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_clkref_clk = {
+	.halt_reg = 0x88004,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x88004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_0_clkref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_aux_clk = {
+	.halt_reg = 0x37024,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_aux_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_cfg_ahb_clk = {
+	.halt_reg = 0x3701c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_mstr_axi_clk = {
+	.halt_reg = 0x37018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_pipe_clk = {
+	.halt_reg = 0x3702c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_pipe_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_rchng_phy_clk = {
+	.halt_reg = 0x37020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_rchng_phy_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_pcie_rchng_phy_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_sleep_clk = {
+	.halt_reg = 0x37028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_sleep_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_pcie_aux_phy_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_slv_axi_clk = {
+	.halt_reg = 0x37014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x37014,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_slv_q2a_axi_clk = {
+	.halt_reg = 0x37010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_slv_q2a_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm2_clk = {
+	.halt_reg = 0x1900c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1900c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm2_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_pdm2_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_ahb_clk = {
+	.halt_reg = 0x19004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x19004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x19004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_xo4_clk = {
+	.halt_reg = 0x19008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x19008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm_xo4_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0xf008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xf008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0xf004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xf004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_sdcc1_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_master_clk = {
+	.halt_reg = 0xb010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_master_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_usb30_master_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_mock_utmi_clk = {
+	.halt_reg = 0xb020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_usb30_mock_utmi_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_mstr_axi_clk = {
+	.halt_reg = 0xb014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_sleep_clk = {
+	.halt_reg = 0xb01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_slv_ahb_clk = {
+	.halt_reg = 0xb018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_slv_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_phy_aux_clk = {
+	.halt_reg = 0xb058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_phy_aux_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_usb3_phy_aux_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_phy_pipe_clk = {
+	.halt_reg = 0xb05c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0xb05c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_phy_pipe_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_clkref_clk = {
+	.halt_reg = 0x88000,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x88000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_prim_clkref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
+	.halt_reg = 0xe004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0xe004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0xe004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb_phy_cfg_ahb2phy_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_xo_pcie_link_clk = {
+	.halt_reg = 0x22008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x22008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_xo_pcie_link_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *gcc_sdx55_clocks[] = {
+	[GCC_AHB_PCIE_LINK_CLK] = &gcc_ahb_pcie_link_clk.clkr,
+	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
+	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP1_I2C_APPS_CLK_SRC] =
+		&gcc_blsp1_qup1_i2c_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC] =
+		&gcc_blsp1_qup1_spi_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_I2C_APPS_CLK_SRC] =
+		&gcc_blsp1_qup2_i2c_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC] =
+		&gcc_blsp1_qup2_spi_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP3_I2C_APPS_CLK] = &gcc_blsp1_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_I2C_APPS_CLK_SRC] =
+		&gcc_blsp1_qup3_i2c_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP3_SPI_APPS_CLK] = &gcc_blsp1_qup3_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_SPI_APPS_CLK_SRC] =
+		&gcc_blsp1_qup3_spi_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP4_I2C_APPS_CLK] = &gcc_blsp1_qup4_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_I2C_APPS_CLK_SRC] =
+		&gcc_blsp1_qup4_i2c_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP4_SPI_APPS_CLK] = &gcc_blsp1_qup4_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_SPI_APPS_CLK_SRC] =
+		&gcc_blsp1_qup4_spi_apps_clk_src.clkr,
+	[GCC_BLSP1_UART1_APPS_CLK] = &gcc_blsp1_uart1_apps_clk.clkr,
+	[GCC_BLSP1_UART1_APPS_CLK_SRC] = &gcc_blsp1_uart1_apps_clk_src.clkr,
+	[GCC_BLSP1_UART2_APPS_CLK] = &gcc_blsp1_uart2_apps_clk.clkr,
+	[GCC_BLSP1_UART2_APPS_CLK_SRC] = &gcc_blsp1_uart2_apps_clk_src.clkr,
+	[GCC_BLSP1_UART3_APPS_CLK] = &gcc_blsp1_uart3_apps_clk.clkr,
+	[GCC_BLSP1_UART3_APPS_CLK_SRC] = &gcc_blsp1_uart3_apps_clk_src.clkr,
+	[GCC_BLSP1_UART4_APPS_CLK] = &gcc_blsp1_uart4_apps_clk.clkr,
+	[GCC_BLSP1_UART4_APPS_CLK_SRC] = &gcc_blsp1_uart4_apps_clk_src.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_CE1_AHB_CLK] = &gcc_ce1_ahb_clk.clkr,
+	[GCC_CE1_AXI_CLK] = &gcc_ce1_axi_clk.clkr,
+	[GCC_CE1_CLK] = &gcc_ce1_clk.clkr,
+	[GCC_CPUSS_AHB_CLK_SRC] = &gcc_cpuss_ahb_clk_src.clkr,
+	[GCC_CPUSS_RBCPR_CLK] = &gcc_cpuss_rbcpr_clk.clkr,
+	[GCC_CPUSS_RBCPR_CLK_SRC] = &gcc_cpuss_rbcpr_clk_src.clkr,
+	[GCC_EMAC_CLK_SRC] = &gcc_emac_clk_src.clkr,
+	[GCC_EMAC_PTP_CLK_SRC] = &gcc_emac_ptp_clk_src.clkr,
+	[GCC_ETH_AXI_CLK] = &gcc_eth_axi_clk.clkr,
+	[GCC_ETH_PTP_CLK] = &gcc_eth_ptp_clk.clkr,
+	[GCC_ETH_RGMII_CLK] = &gcc_eth_rgmii_clk.clkr,
+	[GCC_ETH_SLAVE_AHB_CLK] = &gcc_eth_slave_ahb_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP2_CLK_SRC] = &gcc_gp2_clk_src.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_GP3_CLK_SRC] = &gcc_gp3_clk_src.clkr,
+	[GCC_PCIE_0_CLKREF_CLK] = &gcc_pcie_0_clkref_clk.clkr,
+	[GCC_PCIE_AUX_CLK] = &gcc_pcie_aux_clk.clkr,
+	[GCC_PCIE_AUX_PHY_CLK_SRC] = &gcc_pcie_aux_phy_clk_src.clkr,
+	[GCC_PCIE_CFG_AHB_CLK] = &gcc_pcie_cfg_ahb_clk.clkr,
+	[GCC_PCIE_MSTR_AXI_CLK] = &gcc_pcie_mstr_axi_clk.clkr,
+	[GCC_PCIE_PIPE_CLK] = &gcc_pcie_pipe_clk.clkr,
+	[GCC_PCIE_RCHNG_PHY_CLK] = &gcc_pcie_rchng_phy_clk.clkr,
+	[GCC_PCIE_RCHNG_PHY_CLK_SRC] = &gcc_pcie_rchng_phy_clk_src.clkr,
+	[GCC_PCIE_SLEEP_CLK] = &gcc_pcie_sleep_clk.clkr,
+	[GCC_PCIE_SLV_AXI_CLK] = &gcc_pcie_slv_axi_clk.clkr,
+	[GCC_PCIE_SLV_Q2A_AXI_CLK] = &gcc_pcie_slv_q2a_axi_clk.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC1_APPS_CLK_SRC] = &gcc_sdcc1_apps_clk_src.clkr,
+	[GCC_USB30_MASTER_CLK] = &gcc_usb30_master_clk.clkr,
+	[GCC_USB30_MASTER_CLK_SRC] = &gcc_usb30_master_clk_src.clkr,
+	[GCC_USB30_MOCK_UTMI_CLK] = &gcc_usb30_mock_utmi_clk.clkr,
+	[GCC_USB30_MOCK_UTMI_CLK_SRC] = &gcc_usb30_mock_utmi_clk_src.clkr,
+	[GCC_USB30_MSTR_AXI_CLK] = &gcc_usb30_mstr_axi_clk.clkr,
+	[GCC_USB30_SLEEP_CLK] = &gcc_usb30_sleep_clk.clkr,
+	[GCC_USB30_SLV_AHB_CLK] = &gcc_usb30_slv_ahb_clk.clkr,
+	[GCC_USB3_PHY_AUX_CLK] = &gcc_usb3_phy_aux_clk.clkr,
+	[GCC_USB3_PHY_AUX_CLK_SRC] = &gcc_usb3_phy_aux_clk_src.clkr,
+	[GCC_USB3_PHY_PIPE_CLK] = &gcc_usb3_phy_pipe_clk.clkr,
+	[GCC_USB3_PRIM_CLKREF_CLK] = &gcc_usb3_prim_clkref_clk.clkr,
+	[GCC_USB_PHY_CFG_AHB2PHY_CLK] = &gcc_usb_phy_cfg_ahb2phy_clk.clkr,
+	[GCC_XO_PCIE_LINK_CLK] = &gcc_xo_pcie_link_clk.clkr,
+	[GPLL0] = &gpll0.clkr,
+	[GPLL0_OUT_EVEN] = &gpll0_out_even.clkr,
+	[GPLL4] = &gpll4.clkr,
+	[GPLL4_OUT_EVEN] = &gpll4_out_even.clkr,
+	[GPLL5] = &gpll5.clkr,
+};
+
+static const struct qcom_reset_map gcc_sdx55_resets[] = {
+	[GCC_EMAC_BCR] = { 0x47000 },
+	[GCC_PCIE_BCR] = { 0x37000 },
+	[GCC_PCIE_LINK_DOWN_BCR] = { 0x77000 },
+	[GCC_PCIE_PHY_BCR] = { 0x39000 },
+	[GCC_PCIE_PHY_COM_BCR] = { 0x78004 },
+	[GCC_QUSB2PHY_BCR] = { 0xd000 },
+	[GCC_USB30_BCR] = { 0xb000 },
+	[GCC_USB3_PHY_BCR] = { 0xc000 },
+	[GCC_USB3PHY_PHY_BCR] = { 0xc004 },
+	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0xe000 },
+};
+
+static const struct regmap_config gcc_sdx55_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x9b040,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gcc_sdx55_desc = {
+	.config = &gcc_sdx55_regmap_config,
+	.clks = gcc_sdx55_clocks,
+	.num_clks = ARRAY_SIZE(gcc_sdx55_clocks),
+	.resets = gcc_sdx55_resets,
+	.num_resets = ARRAY_SIZE(gcc_sdx55_resets),
+};
+
+static const struct of_device_id gcc_sdx55_match_table[] = {
+	{ .compatible = "qcom,gcc-sdx55" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_sdx55_match_table);
+
+static int gcc_sdx55_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &gcc_sdx55_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/*
+	 * Keep the clocks always-ON as they are critical to the functioning
+	 * of the system:
+	 * GCC_SYS_NOC_CPUSS_AHB_CLK, GCC_CPUSS_AHB_CLK, GCC_CPUSS_GNOC_CLK
+	 */
+	regmap_update_bits(regmap, 0x6d008, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21));
+	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22));
+
+	return qcom_cc_really_probe(pdev, &gcc_sdx55_desc, regmap);
+}
+
+static struct platform_driver gcc_sdx55_driver = {
+	.probe = gcc_sdx55_probe,
+	.driver = {
+		.name = "gcc-sdx55",
+		.of_match_table = gcc_sdx55_match_table,
+	},
+};
+
+static int __init gcc_sdx55_init(void)
+{
+	return platform_driver_register(&gcc_sdx55_driver);
+}
+subsys_initcall(gcc_sdx55_init);
+
+static void __exit gcc_sdx55_exit(void)
+{
+	platform_driver_unregister(&gcc_sdx55_driver);
+}
+module_exit(gcc_sdx55_exit);
+
+MODULE_DESCRIPTION("QTI GCC SDX55 Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

