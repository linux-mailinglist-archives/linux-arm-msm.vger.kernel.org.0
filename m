Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4E15689D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 15:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbiGFNmk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 09:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233621AbiGFNmW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 09:42:22 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5582A25C7A;
        Wed,  6 Jul 2022 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RFsPBRPd4pJ4rGeKZ6JWE0/KSRptSesdtfTt+8KiSmI=; b=hfr6UHoiUJWrtNfX0YatFfaVuf
        WmTEg65vBn6REoV5HC/Nzo0T2oqWc5PAtMGD52rh6RqZf/xZKVUc6z4vCbIWPh5kTb0auzFFfoLO0
        oQ133uzUn2920u+rDinIKq728hlEqZXP84KvTmSOXpnwfA2ZDknxXuXZ8CuZbyED63FIBMNi4Uiyv
        63a/E3KW1L2xfy5NnFYpZ/tsWfv5FAhsqxz29UsgUItLAItnRn+WPLw4TOyl8JPYT8LYZewuMaS6P
        3oLo57iT0jtyLIrdiSe6PrKt0+YS+ZvJt54AkLwXIYnuV7Q/5T9A3BUUQw4oocK9bBjIJk5B4sEy7
        nEt1JGtw==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o95I2-007M5K-Rv; Wed, 06 Jul 2022 15:42:03 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH v2 2/6] clk: qcom: Add driver for MSM8909 GCC
Date:   Wed,  6 Jul 2022 15:41:28 +0200
Message-Id: <20220706134132.3623415-3-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
References: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Global Clock Controller (GCC) in the MSM8909 SoC provides clocks,
resets and power domains for the various hardware blocks in the SoC.
Add a driver for it to make it possible to enable additional
functionality for the SoC.

Work on this driver was originally started independently by Dominik,
I picked it up and added missing clocks/resets, as well as various
cleanup to bring it into shape for mainline.

Co-developed-by: Dominik Kobinski <dominikkobinski314@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes in v2: Add Konrad's Reviewed-by
---
 drivers/clk/qcom/Kconfig       |    8 +
 drivers/clk/qcom/Makefile      |    1 +
 drivers/clk/qcom/gcc-msm8909.c | 2731 ++++++++++++++++++++++++++++++++
 3 files changed, 2740 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-msm8909.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index fc45d00eec42..05c7820f3cc5 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -180,6 +180,14 @@ config MSM_GCC_8660
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  i2c, USB, SD/eMMC, etc.
 
+config MSM_GCC_8909
+	tristate "MSM8909 Global Clock Controller"
+	select QCOM_GDSC
+	help
+	  Support for the global clock controller on msm8909 devices.
+	  Say Y if you want to use devices such as UART, SPI, I2C, USB,
+	  SD/eMMC, display, graphics, camera etc.
+
 config MSM_GCC_8916
 	tristate "MSM8916 Global Clock Controller"
 	select QCOM_GDSC
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 08594230c1c1..7aeb81e81d98 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_MDM_GCC_9607) += gcc-mdm9607.o
 obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
 obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
 obj-$(CONFIG_MSM_GCC_8660) += gcc-msm8660.o
+obj-$(CONFIG_MSM_GCC_8909) += gcc-msm8909.o
 obj-$(CONFIG_MSM_GCC_8916) += gcc-msm8916.o
 obj-$(CONFIG_MSM_GCC_8939) += gcc-msm8939.o
 obj-$(CONFIG_MSM_GCC_8953) += gcc-msm8953.o
diff --git a/drivers/clk/qcom/gcc-msm8909.c b/drivers/clk/qcom/gcc-msm8909.c
new file mode 100644
index 000000000000..c551953d3791
--- /dev/null
+++ b/drivers/clk/qcom/gcc-msm8909.c
@@ -0,0 +1,2731 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Kernkonzept GmbH.
+ *
+ * Based on gcc-msm8916.c:
+ *   Copyright 2015 Linaro Limited
+ * adapted with data from clock-gcc-8909.c in Qualcomm's msm-3.18 release:
+ *   Copyright (c) 2014-2016, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/clock/qcom,gcc-msm8909.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+/* Need to match the order of clocks in DT binding */
+enum {
+	DT_XO,
+	DT_SLEEP_CLK,
+	DT_DSI0PLL,
+	DT_DSI0PLL_BYTE,
+};
+
+enum {
+	P_XO,
+	P_SLEEP_CLK,
+	P_GPLL0,
+	P_GPLL1,
+	P_GPLL2,
+	P_BIMC,
+	P_DSI0PLL,
+	P_DSI0PLL_BYTE,
+};
+
+static const struct parent_map gcc_xo_map[] = {
+	{ P_XO, 0 },
+};
+
+static const struct clk_parent_data gcc_xo_data[] = {
+	{ .index = DT_XO },
+};
+
+static const struct clk_parent_data gcc_sleep_clk_data[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static struct clk_alpha_pll gpll0_early = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gpll0_early",
+			.parent_data = gcc_xo_data,
+			.num_parents = ARRAY_SIZE(gcc_xo_data),
+			/* Avoid rate changes for shared clock */
+			.ops = &clk_alpha_pll_fixed_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll0 = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gpll0",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll0_early.clkr.hw,
+		},
+		.num_parents = 1,
+		/* Avoid rate changes for shared clock */
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static struct clk_pll gpll1 = {
+	.l_reg = 0x20004,
+	.m_reg = 0x20008,
+	.n_reg = 0x2000c,
+	.config_reg = 0x20010,
+	.mode_reg = 0x20000,
+	.status_reg = 0x2001c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gpll1",
+		.parent_data = gcc_xo_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_data),
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll1_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(1),
+	.hw.init = &(struct clk_init_data) {
+		.name = "gpll1_vote",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll1.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll2_early = {
+	.offset = 0x25000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gpll2_early",
+			.parent_data = gcc_xo_data,
+			.num_parents = ARRAY_SIZE(gcc_xo_data),
+			/* Avoid rate changes for shared clock */
+			.ops = &clk_alpha_pll_fixed_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll2 = {
+	.offset = 0x25000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gpll2",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll2_early.clkr.hw,
+		},
+		.num_parents = 1,
+		/* Avoid rate changes for shared clock */
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static struct clk_alpha_pll bimc_pll_early = {
+	.offset = 0x23000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data) {
+			.name = "bimc_pll_early",
+			.parent_data = gcc_xo_data,
+			.num_parents = ARRAY_SIZE(gcc_xo_data),
+			/* Avoid rate changes for shared clock */
+			.ops = &clk_alpha_pll_fixed_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv bimc_pll = {
+	.offset = 0x23000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "bimc_pll",
+		.parent_hws = (const struct clk_hw*[]) {
+			&bimc_pll_early.clkr.hw,
+		},
+		.num_parents = 1,
+		/* Avoid rate changes for shared clock */
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+};
+
+static const struct clk_parent_data gcc_xo_gpll0_data[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct parent_map gcc_xo_gpll0_bimc_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_BIMC, 2 },
+};
+
+static const struct clk_parent_data gcc_xo_gpll0_bimc_data[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &bimc_pll.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_apss_ahb_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 apss_ahb_clk_src = {
+	.cmd_rcgr = 0x46000,
+	.hid_width = 5,
+	.freq_tbl = ftbl_apss_ahb_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "apss_ahb_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 bimc_ddr_clk_src = {
+	.cmd_rcgr = 0x32004,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_bimc_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "bimc_ddr_clk_src",
+		.parent_data = gcc_xo_gpll0_bimc_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc_data),
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_rcg2 bimc_gpu_clk_src = {
+	.cmd_rcgr = 0x31028,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_bimc_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "bimc_gpu_clk_src",
+		.parent_data = gcc_xo_gpll0_bimc_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc_data),
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static const struct freq_tbl ftbl_blsp_i2c_apps_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0200c,
+	.hid_width = 5,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup1_i2c_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x03000,
+	.hid_width = 5,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup2_i2c_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x04000,
+	.hid_width = 5,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup3_i2c_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x05000,
+	.hid_width = 5,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup4_i2c_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x06000,
+	.hid_width = 5,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup5_i2c_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x07000,
+	.hid_width = 5,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup6_i2c_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_blsp_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(16000000, P_GPLL0, 10, 1, 5),
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0, 16, 1, 2),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
+	.cmd_rcgr = 0x02024,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup1_spi_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
+	.cmd_rcgr = 0x03014,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup2_spi_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
+	.cmd_rcgr = 0x04024,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup3_spi_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
+	.cmd_rcgr = 0x05024,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup4_spi_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
+	.cmd_rcgr = 0x06024,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup5_spi_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
+	.cmd_rcgr = 0x07024,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_qup6_spi_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_blsp_uart_apps_clk_src[] = {
+	F(3686400, P_GPLL0, 1, 72, 15625),
+	F(7372800, P_GPLL0, 1, 144, 15625),
+	F(14745600, P_GPLL0, 1, 288, 15625),
+	F(16000000, P_GPLL0, 10, 1, 5),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 1, 3, 100),
+	F(25000000, P_GPLL0, 16, 1, 2),
+	F(32000000, P_GPLL0, 1, 1, 25),
+	F(40000000, P_GPLL0, 1, 1, 20),
+	F(46400000, P_GPLL0, 1, 29, 500),
+	F(48000000, P_GPLL0, 1, 3, 50),
+	F(51200000, P_GPLL0, 1, 8, 125),
+	F(56000000, P_GPLL0, 1, 7, 100),
+	F(58982400, P_GPLL0, 1, 1152, 15625),
+	F(60000000, P_GPLL0, 1, 3, 40),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
+	.cmd_rcgr = 0x02044,
+	.hid_width = 5,
+	.mnd_width = 16,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_uart1_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
+	.cmd_rcgr = 0x03034,
+	.hid_width = 5,
+	.mnd_width = 16,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "blsp1_uart2_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct parent_map gcc_byte0_map[] = {
+	{ P_XO, 0 },
+	{ P_DSI0PLL_BYTE, 1 },
+};
+
+static const struct clk_parent_data gcc_byte_data[] = {
+	{ .index = DT_XO },
+	{ .index = DT_DSI0PLL_BYTE },
+};
+
+static struct clk_rcg2 byte0_clk_src = {
+	.cmd_rcgr = 0x4d044,
+	.hid_width = 5,
+	.parent_map = gcc_byte0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "byte0_clk_src",
+		.parent_data = gcc_byte_data,
+		.num_parents = ARRAY_SIZE(gcc_byte_data),
+		.ops = &clk_byte2_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	}
+};
+
+static const struct freq_tbl ftbl_camss_gp_clk_src[] = {
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 camss_gp0_clk_src = {
+	.cmd_rcgr = 0x54000,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_camss_gp_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "camss_gp0_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 camss_gp1_clk_src = {
+	.cmd_rcgr = 0x55000,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_camss_gp_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "camss_gp1_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_camss_top_ahb_clk_src[] = {
+	F(40000000, P_GPLL0, 10, 1, 2),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 camss_top_ahb_clk_src = {
+	.cmd_rcgr = 0x5a000,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_camss_top_ahb_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "camss_top_ahb_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_crypto_clk_src[] = {
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 crypto_clk_src = {
+	.cmd_rcgr = 0x16004,
+	.hid_width = 5,
+	.freq_tbl = ftbl_crypto_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "crypto_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_csi_clk_src[] = {
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 csi0_clk_src = {
+	.cmd_rcgr = 0x4e020,
+	.hid_width = 5,
+	.freq_tbl = ftbl_csi_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "csi0_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_map),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 csi1_clk_src = {
+	.cmd_rcgr = 0x4f020,
+	.hid_width = 5,
+	.freq_tbl = ftbl_csi_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "csi1_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 csi0phytimer_clk_src = {
+	.cmd_rcgr = 0x4e000,
+	.hid_width = 5,
+	.freq_tbl = ftbl_csi_phytimer_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "csi0phytimer_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_esc0_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 esc0_clk_src = {
+	.cmd_rcgr = 0x4d05c,
+	.hid_width = 5,
+	.freq_tbl = ftbl_esc0_clk_src,
+	.parent_map = gcc_xo_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "esc0_clk_src",
+		.parent_data = gcc_xo_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct parent_map gcc_gfx3d_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL1, 2 },
+};
+
+static const struct clk_parent_data gcc_gfx3d_data[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll1_vote.hw },
+};
+
+static const struct freq_tbl ftbl_gfx3d_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(177780000, P_GPLL0, 4.5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(266670000, P_GPLL0, 3, 0, 0),
+	F(307200000, P_GPLL1, 4, 0, 0),
+	F(409600000, P_GPLL1, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gfx3d_clk_src = {
+	.cmd_rcgr = 0x59000,
+	.hid_width = 5,
+	.freq_tbl = ftbl_gfx3d_clk_src,
+	.parent_map = gcc_gfx3d_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gfx3d_clk_src",
+		.parent_data = gcc_gfx3d_data,
+		.num_parents = ARRAY_SIZE(gcc_gfx3d_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_gp_clk_src[] = {
+	F(150000, P_XO, 1, 1, 128),
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gp1_clk_src = {
+	.cmd_rcgr = 0x08004,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_gp_clk_src,
+	.parent_map = gcc_xo_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gp1_clk_src",
+		.parent_data = gcc_xo_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 gp2_clk_src = {
+	.cmd_rcgr = 0x09004,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_gp_clk_src,
+	.parent_map = gcc_xo_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gp2_clk_src",
+		.parent_data = gcc_xo_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 gp3_clk_src = {
+	.cmd_rcgr = 0x0a004,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_gp_clk_src,
+	.parent_map = gcc_xo_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gp3_clk_src",
+		.parent_data = gcc_xo_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct parent_map gcc_mclk_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL2, 3 },
+};
+
+static const struct clk_parent_data gcc_mclk_data[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll2.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_mclk_clk_src[] = {
+	F(24000000, P_GPLL2, 1, 1, 33),
+	F(66667000, P_GPLL0, 12, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mclk0_clk_src = {
+	.cmd_rcgr = 0x52000,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_mclk_clk_src,
+	.parent_map = gcc_mclk_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "mclk0_clk_src",
+		.parent_data = gcc_mclk_data,
+		.num_parents = ARRAY_SIZE(gcc_mclk_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_rcg2 mclk1_clk_src = {
+	.cmd_rcgr = 0x53000,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_mclk_clk_src,
+	.parent_map = gcc_mclk_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "mclk1_clk_src",
+		.parent_data = gcc_mclk_data,
+		.num_parents = ARRAY_SIZE(gcc_mclk_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct parent_map gcc_mdp_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL1, 3 },
+};
+
+static const struct clk_parent_data gcc_mdp_data[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll1_vote.hw },
+};
+
+static const struct freq_tbl ftbl_mdp_clk_src[] = {
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(177780000, P_GPLL0, 4.5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(266670000, P_GPLL0, 3, 0, 0),
+	F(307200000, P_GPLL1, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdp_clk_src = {
+	.cmd_rcgr = 0x4d014,
+	.hid_width = 5,
+	.freq_tbl = ftbl_mdp_clk_src,
+	.parent_map = gcc_mdp_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "mdp_clk_src",
+		.parent_data = gcc_mdp_data,
+		.num_parents = ARRAY_SIZE(gcc_mdp_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct parent_map gcc_pclk0_map[] = {
+	{ P_XO, 0 },
+	{ P_DSI0PLL, 1 },
+};
+
+static const struct clk_parent_data gcc_pclk_data[] = {
+	{ .index = DT_XO },
+	{ .index = DT_DSI0PLL },
+};
+
+static struct clk_rcg2 pclk0_clk_src = {
+	.cmd_rcgr = 0x4d000,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.parent_map = gcc_pclk0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "pclk0_clk_src",
+		.parent_data = gcc_pclk_data,
+		.num_parents = ARRAY_SIZE(gcc_pclk_data),
+		.ops = &clk_pixel_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	}
+};
+
+static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x27000,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_bimc_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "pcnoc_bfdcd_clk_src",
+		.parent_data = gcc_xo_gpll0_bimc_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc_data),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_pdm2_clk_src[] = {
+	F(64000000, P_GPLL0, 12.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 pdm2_clk_src = {
+	.cmd_rcgr = 0x44010,
+	.hid_width = 5,
+	.freq_tbl = ftbl_pdm2_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "pdm2_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_2_apps_clk[] = {
+	F(144000, P_XO, 16, 3, 25),
+	F(400000, P_XO, 12, 1, 4),
+	F(20000000, P_GPLL0, 10, 1, 4),
+	F(25000000, P_GPLL0, 16, 1, 2),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(177770000, P_GPLL0, 4.5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x42004,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_gcc_sdcc1_2_apps_clk,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "sdcc1_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_floor_ops,
+	}
+};
+
+static struct clk_rcg2 sdcc2_apps_clk_src = {
+	.cmd_rcgr = 0x43004,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_gcc_sdcc1_2_apps_clk,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "sdcc2_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_floor_ops,
+	}
+};
+
+static struct clk_rcg2 system_noc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x26004,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_bimc_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "system_noc_bfdcd_clk_src",
+		.parent_data = gcc_xo_gpll0_bimc_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc_data),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
+	F(57140000, P_GPLL0, 14, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 usb_hs_system_clk_src = {
+	.cmd_rcgr = 0x41010,
+	.hid_width = 5,
+	.freq_tbl = ftbl_gcc_usb_hs_system_clk,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "usb_hs_system_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct parent_map gcc_vcodec0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL1, 3 },
+};
+
+static const struct clk_parent_data gcc_vcodec0_data[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll1_vote.hw },
+};
+
+static const struct freq_tbl ftbl_vcodec0_clk_src[] = {
+	F(133330000, P_GPLL0, 6, 0, 0),
+	F(266670000, P_GPLL0, 3, 0, 0),
+	F(307200000, P_GPLL1, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 vcodec0_clk_src = {
+	.cmd_rcgr = 0x4c000,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.freq_tbl = ftbl_vcodec0_clk_src,
+	.parent_map = gcc_vcodec0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "vcodec0_clk_src",
+		.parent_data = gcc_vcodec0_data,
+		.num_parents = ARRAY_SIZE(gcc_vcodec0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_gcc_camss_vfe0_clk[] = {
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(133330000, P_GPLL0, 6, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(177780000, P_GPLL0, 4.5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(266670000, P_GPLL0, 3, 0, 0),
+	F(320000000, P_GPLL0, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 vfe0_clk_src = {
+	.cmd_rcgr = 0x58000,
+	.hid_width = 5,
+	.freq_tbl = ftbl_gcc_camss_vfe0_clk,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "vfe0_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static const struct freq_tbl ftbl_vsync_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 vsync_clk_src = {
+	.cmd_rcgr = 0x4d02c,
+	.hid_width = 5,
+	.freq_tbl = ftbl_vsync_clk_src,
+	.parent_map = gcc_xo_map,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "vsync_clk_src",
+		.parent_data = gcc_xo_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_data),
+		.ops = &clk_rcg2_ops,
+	}
+};
+
+static struct clk_branch gcc_apss_tcu_clk = {
+	.halt_reg = 0x12018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_apss_tcu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&bimc_ddr_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_ahb_clk = {
+	.halt_reg = 0x01008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_sleep_clk = {
+	.halt_reg = 0x01004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_sleep_clk",
+			.parent_data = gcc_sleep_clk_data,
+			.num_parents = ARRAY_SIZE(gcc_sleep_clk_data),
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_boot_rom_ahb_clk = {
+	.halt_reg = 0x1300c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_boot_rom_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_crypto_clk = {
+	.halt_reg = 0x1601c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&crypto_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_crypto_ahb_clk = {
+	.halt_reg = 0x16024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_crypto_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_crypto_axi_clk = {
+	.halt_reg = 0x16020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_crypto_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_gfx_tbu_clk = {
+	.halt_reg = 0x12010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_gfx_tbu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&bimc_ddr_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_gfx_tcu_clk = {
+	.halt_reg = 0x12020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_gfx_tcu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&bimc_ddr_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_gtcu_ahb_clk = {
+	.halt_reg = 0x12044,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(13),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_gtcu_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_mdp_tbu_clk = {
+	.halt_reg = 0x1201c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdp_tbu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&system_noc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_prng_ahb_clk = {
+	.halt_reg = 0x13004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(8),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_prng_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_smmu_cfg_clk = {
+	.halt_reg = 0x12038,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(12),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_smmu_cfg_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_venus_tbu_clk = {
+	.halt_reg = 0x12014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_venus_tbu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&system_noc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_vfe_tbu_clk = {
+	.halt_reg = 0x1203c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_vfe_tbu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&system_noc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_bimc_gfx_clk = {
+	.halt_reg = 0x31024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x31024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_bimc_gfx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&bimc_gpu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_bimc_gpu_clk = {
+	.halt_reg = 0x31040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x31040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_bimc_gpu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&bimc_gpu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
+	.halt_reg = 0x02008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x02008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup1_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup1_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
+	.halt_reg = 0x03010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x03010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup2_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup2_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
+	.halt_reg = 0x04020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x04020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup3_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup3_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
+	.halt_reg = 0x05020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x05020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup4_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup4_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
+	.halt_reg = 0x06020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x06020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup5_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup5_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
+	.halt_reg = 0x07020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x07020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup6_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup6_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
+	.halt_reg = 0x02004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x02004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup1_spi_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup1_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
+	.halt_reg = 0x0300c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0300c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup2_spi_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup2_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
+	.halt_reg = 0x0401c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0401c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup3_spi_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup3_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
+	.halt_reg = 0x0501c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0501c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup4_spi_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup4_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
+	.halt_reg = 0x0601c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0601c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup5_spi_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup5_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
+	.halt_reg = 0x0701c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0701c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup6_spi_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup6_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_uart1_apps_clk = {
+	.halt_reg = 0x0203c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0203c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_uart1_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_uart1_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_blsp1_uart2_apps_clk = {
+	.halt_reg = 0x0302c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0302c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_uart2_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_uart2_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_ahb_clk = {
+	.halt_reg = 0x5a014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5a014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi0_clk = {
+	.halt_reg = 0x4e03c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4e03c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&csi0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi0_ahb_clk = {
+	.halt_reg = 0x4e040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4e040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&camss_top_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi0phy_clk = {
+	.halt_reg = 0x4e048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4e048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0phy_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&csi0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi0phytimer_clk = {
+	.halt_reg = 0x4e01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4e01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&csi0phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi0pix_clk = {
+	.halt_reg = 0x4e058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4e058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0pix_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&csi0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi0rdi_clk = {
+	.halt_reg = 0x4e050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4e050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0rdi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&csi0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi1_clk = {
+	.halt_reg = 0x4f03c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4f03c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&csi1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi1_ahb_clk = {
+	.halt_reg = 0x4f040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4f040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&camss_top_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi1phy_clk = {
+	.halt_reg = 0x4f048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4f048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1phy_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&csi1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi1pix_clk = {
+	.halt_reg = 0x4f058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4f058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1pix_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&csi1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi1rdi_clk = {
+	.halt_reg = 0x4f050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4f050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1rdi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&csi1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_csi_vfe0_clk = {
+	.halt_reg = 0x58050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x58050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi_vfe0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&vfe0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_gp0_clk = {
+	.halt_reg = 0x54018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x54018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_gp0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&camss_gp0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_gp1_clk = {
+	.halt_reg = 0x55018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x55018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_gp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&camss_gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_ispif_ahb_clk = {
+	.halt_reg = 0x50004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x50004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_ispif_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&camss_top_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_mclk0_clk = {
+	.halt_reg = 0x52018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x52018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_mclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_mclk1_clk = {
+	.halt_reg = 0x53018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x53018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_mclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_top_ahb_clk = {
+	.halt_reg = 0x56004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x56004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_top_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&camss_top_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_vfe0_clk = {
+	.halt_reg = 0x58038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x58038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_vfe0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&vfe0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_vfe_ahb_clk = {
+	.halt_reg = 0x58044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x58044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_vfe_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&camss_top_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_camss_vfe_axi_clk = {
+	.halt_reg = 0x58048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x58048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_vfe_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&system_noc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_gp1_clk = {
+	.halt_reg = 0x08000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x08000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_gp2_clk = {
+	.halt_reg = 0x09000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x09000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_gp3_clk = {
+	.halt_reg = 0x0a000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0a000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_gp3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_mdss_ahb_clk = {
+	.halt_reg = 0x4d07c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d07c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_mdss_axi_clk = {
+	.halt_reg = 0x4d080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&system_noc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_mdss_byte0_clk = {
+	.halt_reg = 0x4d094,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d094,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_mdss_esc0_clk = {
+	.halt_reg = 0x4d098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d098,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_mdss_mdp_clk = {
+	.halt_reg = 0x4d088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d088,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_mdss_pclk0_clk = {
+	.halt_reg = 0x4d084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d084,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_mdss_vsync_clk = {
+	.halt_reg = 0x4d090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d090,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_mss_cfg_ahb_clk = {
+	.halt_reg = 0x49000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x49000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mss_cfg_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x49004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x49004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&bimc_ddr_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_oxili_ahb_clk = {
+	.halt_reg = 0x59028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x59028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_oxili_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_oxili_gfx3d_clk = {
+	.halt_reg = 0x59020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x59020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_oxili_gfx3d_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gfx3d_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_pdm2_clk = {
+	.halt_reg = 0x4400c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4400c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_pdm2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pdm2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_pdm_ahb_clk = {
+	.halt_reg = 0x44004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x44004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_pdm_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0x4201c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4201c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0x42018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x42018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&sdcc1_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_sdcc2_ahb_clk = {
+	.halt_reg = 0x4301c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4301c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc2_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_sdcc2_apps_clk = {
+	.halt_reg = 0x43018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x43018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc2_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&sdcc2_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_usb2a_phy_sleep_clk = {
+	.halt_reg = 0x4102c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4102c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb2a_phy_sleep_clk",
+			.parent_data = gcc_sleep_clk_data,
+			.num_parents = ARRAY_SIZE(gcc_sleep_clk_data),
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_usb_hs_ahb_clk = {
+	.halt_reg = 0x41008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x41008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb_hs_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_usb_hs_phy_cfg_ahb_clk = {
+	.halt_reg = 0x41030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x41030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb_hs_phy_cfg_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_usb_hs_system_clk = {
+	.halt_reg = 0x41004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x41004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb_hs_system_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb_hs_system_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_venus0_ahb_clk = {
+	.halt_reg = 0x4c020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4c020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_venus0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_venus0_axi_clk = {
+	.halt_reg = 0x4c024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4c024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_venus0_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&system_noc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
+	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4c02c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_venus0_core0_vcodec0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&vcodec0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct clk_branch gcc_venus0_vcodec0_clk = {
+	.halt_reg = 0x4c01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4c01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_venus0_vcodec0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&vcodec0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		}
+	}
+};
+
+static struct gdsc mdss_gdsc = {
+	.gdscr = 0x4d078,
+	.cxcs = (unsigned int []) { 0x4d080, 0x4d088 },
+	.cxc_count = 2,
+	.pd = {
+		.name = "mdss_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc oxili_gdsc = {
+	.gdscr = 0x5901c,
+	.cxcs = (unsigned int []) { 0x59020 },
+	.cxc_count = 1,
+	.pd = {
+		.name = "oxili_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc venus_gdsc = {
+	.gdscr = 0x4c018,
+	.cxcs = (unsigned int []) { 0x4c024, 0x4c01c },
+	.cxc_count = 2,
+	.pd = {
+		.name = "venus_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc venus_core0_gdsc = {
+	.gdscr = 0x4c028,
+	.cxcs = (unsigned int []) { 0x4c02c },
+	.cxc_count = 1,
+	.pd = {
+		.name = "venus_core0_gdsc",
+	},
+	.flags = HW_CTRL,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc vfe_gdsc = {
+	.gdscr = 0x58034,
+	.cxcs = (unsigned int []) { 0x58038, 0x58048, 0x58050 },
+	.cxc_count = 3,
+	.pd = {
+		.name = "vfe_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct clk_regmap *gcc_msm8909_clocks[] = {
+	[GPLL0_EARLY] = &gpll0_early.clkr,
+	[GPLL0] = &gpll0.clkr,
+	[GPLL1] = &gpll1.clkr,
+	[GPLL1_VOTE] = &gpll1_vote,
+	[GPLL2_EARLY] = &gpll2_early.clkr,
+	[GPLL2] = &gpll2.clkr,
+	[BIMC_PLL_EARLY] = &bimc_pll_early.clkr,
+	[BIMC_PLL] = &bimc_pll.clkr,
+	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
+	[BIMC_DDR_CLK_SRC] = &bimc_ddr_clk_src.clkr,
+	[BIMC_GPU_CLK_SRC] = &bimc_gpu_clk_src.clkr,
+	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,
+	[BLSP1_QUP2_I2C_APPS_CLK_SRC] = &blsp1_qup2_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP2_SPI_APPS_CLK_SRC] = &blsp1_qup2_spi_apps_clk_src.clkr,
+	[BLSP1_QUP3_I2C_APPS_CLK_SRC] = &blsp1_qup3_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP3_SPI_APPS_CLK_SRC] = &blsp1_qup3_spi_apps_clk_src.clkr,
+	[BLSP1_QUP4_I2C_APPS_CLK_SRC] = &blsp1_qup4_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP4_SPI_APPS_CLK_SRC] = &blsp1_qup4_spi_apps_clk_src.clkr,
+	[BLSP1_QUP5_I2C_APPS_CLK_SRC] = &blsp1_qup5_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP5_SPI_APPS_CLK_SRC] = &blsp1_qup5_spi_apps_clk_src.clkr,
+	[BLSP1_QUP6_I2C_APPS_CLK_SRC] = &blsp1_qup6_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP6_SPI_APPS_CLK_SRC] = &blsp1_qup6_spi_apps_clk_src.clkr,
+	[BLSP1_UART1_APPS_CLK_SRC] = &blsp1_uart1_apps_clk_src.clkr,
+	[BLSP1_UART2_APPS_CLK_SRC] = &blsp1_uart2_apps_clk_src.clkr,
+	[BYTE0_CLK_SRC] = &byte0_clk_src.clkr,
+	[CAMSS_GP0_CLK_SRC] = &camss_gp0_clk_src.clkr,
+	[CAMSS_GP1_CLK_SRC] = &camss_gp1_clk_src.clkr,
+	[CAMSS_TOP_AHB_CLK_SRC] = &camss_top_ahb_clk_src.clkr,
+	[CRYPTO_CLK_SRC] = &crypto_clk_src.clkr,
+	[CSI0_CLK_SRC] = &csi0_clk_src.clkr,
+	[CSI0PHYTIMER_CLK_SRC] = &csi0phytimer_clk_src.clkr,
+	[CSI1_CLK_SRC] = &csi1_clk_src.clkr,
+	[ESC0_CLK_SRC] = &esc0_clk_src.clkr,
+	[GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
+	[GP1_CLK_SRC] = &gp1_clk_src.clkr,
+	[GP2_CLK_SRC] = &gp2_clk_src.clkr,
+	[GP3_CLK_SRC] = &gp3_clk_src.clkr,
+	[MCLK0_CLK_SRC] = &mclk0_clk_src.clkr,
+	[MCLK1_CLK_SRC] = &mclk1_clk_src.clkr,
+	[MDP_CLK_SRC] = &mdp_clk_src.clkr,
+	[PCLK0_CLK_SRC] = &pclk0_clk_src.clkr,
+	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
+	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
+	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
+	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
+	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
+	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
+	[VCODEC0_CLK_SRC] = &vcodec0_clk_src.clkr,
+	[VFE0_CLK_SRC] = &vfe0_clk_src.clkr,
+	[VSYNC_CLK_SRC] = &vsync_clk_src.clkr,
+	[GCC_APSS_TCU_CLK] = &gcc_apss_tcu_clk.clkr,
+	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
+	[GCC_BLSP1_SLEEP_CLK] = &gcc_blsp1_sleep_clk.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_CRYPTO_CLK] = &gcc_crypto_clk.clkr,
+	[GCC_CRYPTO_AHB_CLK] = &gcc_crypto_ahb_clk.clkr,
+	[GCC_CRYPTO_AXI_CLK] = &gcc_crypto_axi_clk.clkr,
+	[GCC_GFX_TBU_CLK] = &gcc_gfx_tbu_clk.clkr,
+	[GCC_GFX_TCU_CLK] = &gcc_gfx_tcu_clk.clkr,
+	[GCC_GTCU_AHB_CLK] = &gcc_gtcu_ahb_clk.clkr,
+	[GCC_MDP_TBU_CLK] = &gcc_mdp_tbu_clk.clkr,
+	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
+	[GCC_SMMU_CFG_CLK] = &gcc_smmu_cfg_clk.clkr,
+	[GCC_VENUS_TBU_CLK] = &gcc_venus_tbu_clk.clkr,
+	[GCC_VFE_TBU_CLK] = &gcc_vfe_tbu_clk.clkr,
+	[GCC_BIMC_GFX_CLK] = &gcc_bimc_gfx_clk.clkr,
+	[GCC_BIMC_GPU_CLK] = &gcc_bimc_gpu_clk.clkr,
+	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_I2C_APPS_CLK] = &gcc_blsp1_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_SPI_APPS_CLK] = &gcc_blsp1_qup3_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_I2C_APPS_CLK] = &gcc_blsp1_qup4_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_SPI_APPS_CLK] = &gcc_blsp1_qup4_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP5_I2C_APPS_CLK] = &gcc_blsp1_qup5_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP5_SPI_APPS_CLK] = &gcc_blsp1_qup5_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP6_I2C_APPS_CLK] = &gcc_blsp1_qup6_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP6_SPI_APPS_CLK] = &gcc_blsp1_qup6_spi_apps_clk.clkr,
+	[GCC_BLSP1_UART1_APPS_CLK] = &gcc_blsp1_uart1_apps_clk.clkr,
+	[GCC_BLSP1_UART2_APPS_CLK] = &gcc_blsp1_uart2_apps_clk.clkr,
+	[GCC_CAMSS_AHB_CLK] = &gcc_camss_ahb_clk.clkr,
+	[GCC_CAMSS_CSI0_CLK] = &gcc_camss_csi0_clk.clkr,
+	[GCC_CAMSS_CSI0_AHB_CLK] = &gcc_camss_csi0_ahb_clk.clkr,
+	[GCC_CAMSS_CSI0PHY_CLK] = &gcc_camss_csi0phy_clk.clkr,
+	[GCC_CAMSS_CSI0PHYTIMER_CLK] = &gcc_camss_csi0phytimer_clk.clkr,
+	[GCC_CAMSS_CSI0PIX_CLK] = &gcc_camss_csi0pix_clk.clkr,
+	[GCC_CAMSS_CSI0RDI_CLK] = &gcc_camss_csi0rdi_clk.clkr,
+	[GCC_CAMSS_CSI1_CLK] = &gcc_camss_csi1_clk.clkr,
+	[GCC_CAMSS_CSI1_AHB_CLK] = &gcc_camss_csi1_ahb_clk.clkr,
+	[GCC_CAMSS_CSI1PHY_CLK] = &gcc_camss_csi1phy_clk.clkr,
+	[GCC_CAMSS_CSI1PIX_CLK] = &gcc_camss_csi1pix_clk.clkr,
+	[GCC_CAMSS_CSI1RDI_CLK] = &gcc_camss_csi1rdi_clk.clkr,
+	[GCC_CAMSS_CSI_VFE0_CLK] = &gcc_camss_csi_vfe0_clk.clkr,
+	[GCC_CAMSS_GP0_CLK] = &gcc_camss_gp0_clk.clkr,
+	[GCC_CAMSS_GP1_CLK] = &gcc_camss_gp1_clk.clkr,
+	[GCC_CAMSS_ISPIF_AHB_CLK] = &gcc_camss_ispif_ahb_clk.clkr,
+	[GCC_CAMSS_MCLK0_CLK] = &gcc_camss_mclk0_clk.clkr,
+	[GCC_CAMSS_MCLK1_CLK] = &gcc_camss_mclk1_clk.clkr,
+	[GCC_CAMSS_TOP_AHB_CLK] = &gcc_camss_top_ahb_clk.clkr,
+	[GCC_CAMSS_VFE0_CLK] = &gcc_camss_vfe0_clk.clkr,
+	[GCC_CAMSS_VFE_AHB_CLK] = &gcc_camss_vfe_ahb_clk.clkr,
+	[GCC_CAMSS_VFE_AXI_CLK] = &gcc_camss_vfe_axi_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_MDSS_AHB_CLK] = &gcc_mdss_ahb_clk.clkr,
+	[GCC_MDSS_AXI_CLK] = &gcc_mdss_axi_clk.clkr,
+	[GCC_MDSS_BYTE0_CLK] = &gcc_mdss_byte0_clk.clkr,
+	[GCC_MDSS_ESC0_CLK] = &gcc_mdss_esc0_clk.clkr,
+	[GCC_MDSS_MDP_CLK] = &gcc_mdss_mdp_clk.clkr,
+	[GCC_MDSS_PCLK0_CLK] = &gcc_mdss_pclk0_clk.clkr,
+	[GCC_MDSS_VSYNC_CLK] = &gcc_mdss_vsync_clk.clkr,
+	[GCC_MSS_CFG_AHB_CLK] = &gcc_mss_cfg_ahb_clk.clkr,
+	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
+	[GCC_OXILI_AHB_CLK] = &gcc_oxili_ahb_clk.clkr,
+	[GCC_OXILI_GFX3D_CLK] = &gcc_oxili_gfx3d_clk.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
+	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
+	[GCC_USB2A_PHY_SLEEP_CLK] = &gcc_usb2a_phy_sleep_clk.clkr,
+	[GCC_USB_HS_AHB_CLK] = &gcc_usb_hs_ahb_clk.clkr,
+	[GCC_USB_HS_PHY_CFG_AHB_CLK] = &gcc_usb_hs_phy_cfg_ahb_clk.clkr,
+	[GCC_USB_HS_SYSTEM_CLK] = &gcc_usb_hs_system_clk.clkr,
+	[GCC_VENUS0_AHB_CLK] = &gcc_venus0_ahb_clk.clkr,
+	[GCC_VENUS0_AXI_CLK] = &gcc_venus0_axi_clk.clkr,
+	[GCC_VENUS0_CORE0_VCODEC0_CLK] = &gcc_venus0_core0_vcodec0_clk.clkr,
+	[GCC_VENUS0_VCODEC0_CLK] = &gcc_venus0_vcodec0_clk.clkr,
+};
+
+static struct gdsc *gcc_msm8909_gdscs[] = {
+	[MDSS_GDSC] = &mdss_gdsc,
+	[OXILI_GDSC] = &oxili_gdsc,
+	[VENUS_GDSC] = &venus_gdsc,
+	[VENUS_CORE0_GDSC] = &venus_core0_gdsc,
+	[VFE_GDSC] = &vfe_gdsc,
+};
+
+static const struct qcom_reset_map gcc_msm8909_resets[] = {
+	[GCC_AUDIO_CORE_BCR] = { 0x1c008 },
+	[GCC_BLSP1_BCR] = { 0x01000 },
+	[GCC_BLSP1_QUP1_BCR] = { 0x02000 },
+	[GCC_BLSP1_QUP2_BCR] = { 0x03008 },
+	[GCC_BLSP1_QUP3_BCR] = { 0x04018 },
+	[GCC_BLSP1_QUP4_BCR] = { 0x05018 },
+	[GCC_BLSP1_QUP5_BCR] = { 0x06018 },
+	[GCC_BLSP1_QUP6_BCR] = { 0x07018 },
+	[GCC_BLSP1_UART1_BCR] = { 0x02038 },
+	[GCC_BLSP1_UART2_BCR] = { 0x03028 },
+	[GCC_CAMSS_CSI0_BCR] = { 0x4e038 },
+	[GCC_CAMSS_CSI0PHY_BCR] = { 0x4e044 },
+	[GCC_CAMSS_CSI0PIX_BCR] = { 0x4e054 },
+	[GCC_CAMSS_CSI0RDI_BCR] = { 0x4e04c },
+	[GCC_CAMSS_CSI1_BCR] = { 0x4f038 },
+	[GCC_CAMSS_CSI1PHY_BCR] = { 0x4f044 },
+	[GCC_CAMSS_CSI1PIX_BCR] = { 0x4f054 },
+	[GCC_CAMSS_CSI1RDI_BCR] = { 0x4f04c },
+	[GCC_CAMSS_CSI_VFE0_BCR] = { 0x5804c },
+	[GCC_CAMSS_GP0_BCR] = { 0x54014 },
+	[GCC_CAMSS_GP1_BCR] = { 0x55014 },
+	[GCC_CAMSS_ISPIF_BCR] = { 0x50000 },
+	[GCC_CAMSS_MCLK0_BCR] = { 0x52014 },
+	[GCC_CAMSS_MCLK1_BCR] = { 0x53014 },
+	[GCC_CAMSS_PHY0_BCR] = { 0x4e018 },
+	[GCC_CAMSS_TOP_BCR] = { 0x56000 },
+	[GCC_CAMSS_TOP_AHB_BCR] = { 0x5a018 },
+	[GCC_CAMSS_VFE_BCR] = { 0x58030 },
+	[GCC_CRYPTO_BCR] = { 0x16000 },
+	[GCC_MDSS_BCR] = { 0x4d074 },
+	[GCC_OXILI_BCR] = { 0x59018 },
+	[GCC_PDM_BCR] = { 0x44000 },
+	[GCC_PRNG_BCR] = { 0x13000 },
+	[GCC_QUSB2_PHY_BCR] = { 0x4103c },
+	[GCC_SDCC1_BCR] = { 0x42000 },
+	[GCC_SDCC2_BCR] = { 0x43000 },
+	[GCC_ULT_AUDIO_BCR] = { 0x1c0b4 },
+	[GCC_USB2A_PHY_BCR] = { 0x41028 },
+	[GCC_USB2_HS_PHY_ONLY_BCR] = { 0x41034 },
+	[GCC_USB_HS_BCR] = { 0x41000 },
+	[GCC_VENUS0_BCR] = { 0x4c014 },
+	/* Subsystem Restart */
+	[GCC_MSS_RESTART] = { 0x3e000 },
+};
+
+static const struct regmap_config gcc_msm8909_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x80000,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gcc_msm8909_desc = {
+	.config = &gcc_msm8909_regmap_config,
+	.clks = gcc_msm8909_clocks,
+	.num_clks = ARRAY_SIZE(gcc_msm8909_clocks),
+	.resets = gcc_msm8909_resets,
+	.num_resets = ARRAY_SIZE(gcc_msm8909_resets),
+	.gdscs = gcc_msm8909_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_msm8909_gdscs),
+};
+
+static const struct of_device_id gcc_msm8909_match_table[] = {
+	{ .compatible = "qcom,gcc-msm8909" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_msm8909_match_table);
+
+static int gcc_msm8909_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gcc_msm8909_desc);
+}
+
+static struct platform_driver gcc_msm8909_driver = {
+	.probe		= gcc_msm8909_probe,
+	.driver		= {
+		.name	= "gcc-msm8909",
+		.of_match_table = gcc_msm8909_match_table,
+	},
+};
+
+static int __init gcc_msm8909_init(void)
+{
+	return platform_driver_register(&gcc_msm8909_driver);
+}
+core_initcall(gcc_msm8909_init);
+
+static void __exit gcc_msm8909_exit(void)
+{
+	platform_driver_unregister(&gcc_msm8909_driver);
+}
+module_exit(gcc_msm8909_exit);
+
+MODULE_DESCRIPTION("Qualcomm GCC MSM8909 Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:gcc-msm8909");
-- 
2.30.2

