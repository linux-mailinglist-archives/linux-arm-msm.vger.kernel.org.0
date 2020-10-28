Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B6A29E0E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 02:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgJ2BnU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 21:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729150AbgJ1V7T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 17:59:19 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE559C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 14:59:19 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id c72so1144168oig.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cl0YKU1ioY/YrpjMr9Y+UhIp1Gz9BcXXZaDTX3vaMjI=;
        b=JOtHa4KRlV1GZ5Fuu1VEnm4prmI7xCl/B5zbi9UcJmHUUzl/dXSj19TAu20d0onbel
         23LfYz0tBD6jd7GeyQWKeClYzzuHrBDnPRmoasDiMr5GgM/smHAQbOMYtg1ojROlgyq+
         niNt3dTeruNH6f9aIfaKuuh4YYKXZQyG0uRAVs22EOBXW22zydMzYGMGRShdcpPiHQDg
         eZ4CYZWQojIv6La/ZZVoYq0X4zzqLm2m/VF+tHMgCa0iu9SHfYsbgOt2rv1tOzCJKq30
         jBV2WvTg4qyCYJkh3JjD/sxhRWfrWaXaOArj0NHgVHCIm02V1zd3vhgpo1LEBJSOCbaX
         zYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cl0YKU1ioY/YrpjMr9Y+UhIp1Gz9BcXXZaDTX3vaMjI=;
        b=h4sG0cGxfVXLq4uicoJDTXZDBJWBZSTuSf0oFbgT9KxxrqOuGIrnWe/JkZeiURzoRX
         3iqqrU4iB3EHPqinh/PDkceGoo3lfGu+VvYH/j6XRqchjQX35kLHa9vbWtin3IdWEpGp
         1GgOS05p8q33X45A9O8s+TMUj0naZWDKr2Wox/0HFrFlWShJwXslKKVDMDZGbNc08RLG
         jv76DzQ0f8sk52tGnXwrfJSyrp11jzzt1EMM92Mxy9q3mGlX4M2IhB2/8H6N2B40RpuP
         VcmpLf/Bd9e3JaVZnWdd4jLEms0Ykje25Tkor/tEpSrnIgX1KM+k9uuUvUOqmSqlYiar
         C7VQ==
X-Gm-Message-State: AOAM533fF7FN9LCYXqeAR6XkxCJxLvqOfw/cXJ2+TnD6qpqYf4f3UfSI
        9lbz7HIwBipZ3CkjMKPztL1BIHCeS21VY7k=
X-Google-Smtp-Source: ABdhPJytN6x3PORTf8EOH2ngop25EGbigXQrxSTapxO6zYsguAKakxFN8msIi24HTNh2x9Dp0LCUfg==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id h1mr5854707pjs.51.1603870988250;
        Wed, 28 Oct 2020 00:43:08 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id e7sm4289579pgj.19.2020.10.28.00.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 00:43:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/4] clk: qcom: Add SDX55 GCC support
Date:   Wed, 28 Oct 2020 13:12:30 +0530
Message-Id: <20201028074232.22922-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Naveen Yadav <naveenky@codeaurora.org>

Add Global Clock Controller (GCC) support for SDX55 SoCs from Qualcomm.

Signed-off-by: Naveen Yadav <naveenky@codeaurora.org>
[mani: converted to parent_data, commented critical clocks, cleanups]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/Kconfig     |    8 +
 drivers/clk/qcom/Makefile    |    1 +
 drivers/clk/qcom/gcc-sdx55.c | 1667 ++++++++++++++++++++++++++++++++++
 3 files changed, 1676 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-sdx55.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 3a965bd326d5..dbca8debc06f 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -502,4 +502,12 @@ config KRAITCC
 	  Support for the Krait CPU clocks on Qualcomm devices.
 	  Say Y if you want to support CPU frequency scaling.
 
+config GCC_SDX55
+	tristate "SDX55 Global Clock Controller"
+	depends on ARM
+	help
+	  Support for the global clock controller on SDX55 devices.
+	  Say Y if you want to use peripheral devices such as UART,
+	  SPI, I2C, USB, SD/UFS, PCIe etc.
+
 endif
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 11ae86febe87..3e27d67f95aa 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -75,3 +75,4 @@ obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
 obj-$(CONFIG_KRAITCC) += krait-cc.o
+obj-$(CONFIG_GCC_SDX55) += gcc-sdx55.o
diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
new file mode 100644
index 000000000000..75831c829202
--- /dev/null
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -0,0 +1,1667 @@
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
+static struct pll_vco lucid_vco[] = {
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
+			.fw_name = "gpll0",
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
+			.fw_name = "gpll4",
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
+/* For CPUSS functionality the AHB clock needs to be left enabled */
+static struct clk_branch gcc_cpuss_ahb_clk = {
+	.halt_reg = 0x24000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(21),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cpuss_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_cpuss_ahb_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+/* For CPUSS functionality the GNOC clock needs to be left enabled */
+static struct clk_branch gcc_cpuss_gnoc_clk = {
+	.halt_reg = 0x24004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x24004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(22),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cpuss_gnoc_clk",
+			.flags = CLK_IS_CRITICAL,
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
+/* For CPUSS functionality the SYS NOC clock needs to be left enabled */
+static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
+	.halt_reg = 0x4010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_cpuss_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_cpuss_ahb_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
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
+	[GCC_CPUSS_AHB_CLK] = &gcc_cpuss_ahb_clk.clkr,
+	[GCC_CPUSS_AHB_CLK_SRC] = &gcc_cpuss_ahb_clk_src.clkr,
+	[GCC_CPUSS_GNOC_CLK] = &gcc_cpuss_gnoc_clk.clkr,
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
+	[GCC_SYS_NOC_CPUSS_AHB_CLK] = &gcc_sys_noc_cpuss_ahb_clk.clkr,
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
+	return qcom_cc_probe(pdev, &gcc_sdx55_desc);
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

