Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7266527997E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729527AbgIZND1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729713AbgIZNDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:03:15 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103AEC0613CE;
        Sat, 26 Sep 2020 06:03:15 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so6916633wrn.0;
        Sat, 26 Sep 2020 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DnMTNDOgUlVAq/mIYYMiAmwg5e8ZdLK89kRPMnbPICk=;
        b=D1O3zEOhJh2T5cApUQW3mDCGG4DEaKApuXY3QDEpmVHaL/w7KFrToW9aQncyjj4Vl0
         T3Q8TkI6kktyaOsHnAly2ZkjesoAPbn9z9yLLwyeEGoISLZZw5lmdohDRZAopnM8keY1
         z9fs2CENKFSS+i12mxRqLY87khmBd6zj79P9hC0AS0WWZJ8a8IAvEnCPUEBQNDq+Zmqi
         E2B+a3uuIkNa9ZwDYu8v2piecRVEj2jaMYTwyIaMMk99Bx652l8bReMIzAkof3veIPk8
         NzIG6L5V62sgvFeTBiR35Y2lU7hjKWQnq44L+tfYnGULFU8w/bhvhGRI0gQlWEzySIb7
         00Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DnMTNDOgUlVAq/mIYYMiAmwg5e8ZdLK89kRPMnbPICk=;
        b=erZj0+nedMtNYldezkHl22FKUou4HjC2chgpnv9vscpv2sffDA6CgjvRt6uUVnh+04
         pSHvbvKipZfOIIobEVxJ157j5St0CtK5/b+Ioxv8MhhCdDwHprCf0vzk2FLUeBqAD1Te
         n8ak8/2ORDy9atAQ27/sNRUzJPcHqucR23VueOAlHl2EFFk/qjdDc5gruGZ1THk1E8u1
         JIMO6xjlul1MadMvz4XWo+sAJ3cqDLSFsfA+YaO0l/wph6pEj9tQj1FMzymAQJf6HfO8
         8heFjru0VoC4es92zuc2pZmgpJY6NAWIuP7nhh4SEXxjeBEJ2UDYKaIeCEJK5Q1OTkAD
         ULQg==
X-Gm-Message-State: AOAM532IociaxNrT05h6nC6NTXFEP16Wly1w8h4wPNhrhxF1bhQeOEvq
        838aw+iTHtZuqHeHgmXGnhw=
X-Google-Smtp-Source: ABdhPJyYMaV2qR/Sos+ami1knyjp1a54SSEU2Lt5mFSmn4PMe3jQJ1eyR14DUnkTVzLDmWdCPym56w==
X-Received: by 2002:adf:92c2:: with SMTP id 60mr10142399wrn.220.1601125393520;
        Sat, 26 Sep 2020 06:03:13 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id d83sm2853213wmf.23.2020.09.26.06.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:03:13 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] clk: qcom: Add SDM660 GPU Clock Controller (GPUCC) driver
Date:   Sat, 26 Sep 2020 15:03:05 +0200
Message-Id: <20200926130306.13843-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130306.13843-1-kholk11@gmail.com>
References: <20200926130306.13843-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The GPUCC manages the clocks for the Adreno GPU found on the
SDM630, SDM636, SDM660 SoCs.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/clk/qcom/Kconfig                      |   9 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/gpucc-sdm660.c               | 349 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sdm660.h |  28 ++
 4 files changed, 387 insertions(+)
 create mode 100644 drivers/clk/qcom/gpucc-sdm660.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sdm660.h

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a12d37a4d729..377fba33d041 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -366,6 +366,15 @@ config SDM_MMCC_660
 	  Say Y if you want to support multimedia devices such as display,
 	  graphics, video encode/decode, camera, etc.
 
+config SDM_GPUCC_660
+	tristate "SDM660 Graphics Clock Controller"
+	select SDM_GCC_660
+	select QCOM_GDSC
+	help
+	  Support for the graphics clock controller on SDM630/636/660 devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics
+
 config QCS_TURING_404
 	tristate "QCS404 Turing Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ada4f1bbe203..6a6906a62f96 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
 obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
 obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
 obj-$(CONFIG_SDM_MMCC_660) += mmcc-sdm660.o
+obj-$(CONFIG_SDM_GPUCC_660) += gpucc-sdm660.o
 obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
 obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
 obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
new file mode 100644
index 000000000000..447a34aaa21f
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <dt-bindings/clock/qcom,gpucc-sdm660.h>
+
+#include "clk-alpha-pll.h"
+#include "common.h"
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-branch.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	P_GPU_XO,
+	P_CORE_BI_PLL_TEST_SE,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_PLL0_PLL_OUT_MAIN,
+	P_GPU_PLL1_PLL_OUT_MAIN,
+};
+
+static struct clk_branch gpucc_cxo_clk = {
+	.halt_reg = 0x1020,
+	.clkr = {
+		.enable_reg = 0x1020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpucc_cxo_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct pll_vco gpu_vco[] = {
+	{ 1000000000, 2000000000, 0 },
+	{ 500000000,  1000000000, 2 },
+	{ 250000000,   500000000, 3 },
+};
+
+static struct clk_alpha_pll gpu_pll0_pll_out_main = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.vco_table = gpu_vco,
+	.num_vco = ARRAY_SIZE(gpu_vco),
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpu_pll0_pll_out_main",
+		.parent_data =  &(const struct clk_parent_data){
+			.hw = &gpucc_cxo_clk.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_ops,
+	},
+};
+
+static struct clk_alpha_pll gpu_pll1_pll_out_main = {
+	.offset = 0x40,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.vco_table = gpu_vco,
+	.num_vco = ARRAY_SIZE(gpu_vco),
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpu_pll1_pll_out_main",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &gpucc_cxo_clk.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_ops,
+	},
+};
+
+static const struct parent_map gpucc_parent_map_1[] = {
+	{ P_GPU_XO, 0 },
+	{ P_GPU_PLL0_PLL_OUT_MAIN, 1 },
+	{ P_GPU_PLL1_PLL_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+};
+
+static const struct clk_parent_data gpucc_parent_data_1[] = {
+	{ .hw = &gpucc_cxo_clk.clkr.hw },
+	{ .hw = &gpu_pll0_pll_out_main.clkr.hw },
+	{ .hw = &gpu_pll1_pll_out_main.clkr.hw },
+	{ .fw_name = "gcc_gpu_gpll0_clk", .name = "gcc_gpu_gpll0_clk" },
+};
+
+static struct clk_rcg2_gfx3d gfx3d_clk_src = {
+	.div = 2,
+	.rcg = {
+		.cmd_rcgr = 0x1070,
+		.mnd_width = 0,
+		.hid_width = 5,
+		.parent_map = gpucc_parent_map_1,
+		.clkr.hw.init = &(struct clk_init_data){
+			.name = "gfx3d_clk_src",
+			.parent_data = gpucc_parent_data_1,
+			.num_parents = 4,
+			.ops = &clk_gfx3d_ops,
+			.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		},
+	},
+	.hws = (struct clk_hw*[]){
+		&gpucc_cxo_clk.clkr.hw,
+		&gpu_pll0_pll_out_main.clkr.hw,
+		&gpu_pll1_pll_out_main.clkr.hw,
+	}
+};
+
+static struct clk_branch gpucc_gfx3d_clk = {
+	.halt_reg = 0x1098,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1098,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1098,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpucc_gfx3d_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gfx3d_clk_src.rcg.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct parent_map gpucc_parent_map_0[] = {
+	{ P_GPU_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpucc_parent_data_0[] = {
+	{ .hw = &gpucc_cxo_clk.clkr.hw },
+	{ .fw_name = "gcc_gpu_gpll0_clk", .name = "gcc_gpu_gpll0_clk" },
+	{ .fw_name = "gcc_gpu_gpll0_div_clk", .name = "gcc_gpu_gpll0_div_clk" },
+};
+
+static const struct freq_tbl ftbl_rbbmtimer_clk_src[] = {
+	F(19200000, P_GPU_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 rbbmtimer_clk_src = {
+	.cmd_rcgr = 0x10b0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpucc_parent_map_0,
+	.freq_tbl = ftbl_rbbmtimer_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "rbbmtimer_clk_src",
+		.parent_data = gpucc_parent_data_0,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_rbcpr_clk_src[] = {
+	F(19200000, P_GPU_XO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_MAIN_DIV, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 rbcpr_clk_src = {
+	.cmd_rcgr = 0x1030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpucc_parent_map_0,
+	.freq_tbl = ftbl_rbcpr_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "rbcpr_clk_src",
+		.parent_data = gpucc_parent_data_0,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gpucc_rbbmtimer_clk = {
+	.halt_reg = 0x10d0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpucc_rbbmtimer_clk",
+			.parent_names = (const char *[]){
+				"rbbmtimer_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpucc_rbcpr_clk = {
+	.halt_reg = 0x1054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpucc_rbcpr_clk",
+			.parent_names = (const char *[]){
+				"rbcpr_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cx_gdsc = {
+	.gdscr = 0x1004,
+	.gds_hw_ctrl = 0x1008,
+	.pd = {
+		.name = "gpu_cx",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc gpu_gx_gdsc = {
+	.gdscr = 0x1094,
+	.clamp_io_ctrl = 0x130,
+	.resets = (unsigned int []){ GPU_GX_BCR },
+	.reset_count = 1,
+	.cxcs = (unsigned int []){ 0x1098 },
+	.cxc_count = 1,
+	.pd = {
+		.name = "gpu_gx",
+	},
+	.parent = &gpu_cx_gdsc.pd,
+	.pwrsts = PWRSTS_OFF | PWRSTS_ON | PWRSTS_RET,
+	.flags = CLAMP_IO | SW_RESET | AON_RESET | NO_RET_PERIPH,
+	//.supply = "vdd-gx";
+};
+
+static struct gdsc *gpucc_sdm660_gdscs[] = {
+	[GPU_CX_GDSC] = &gpu_cx_gdsc,
+	[GPU_GX_GDSC] = &gpu_gx_gdsc,
+};
+
+static const struct qcom_reset_map gpucc_sdm660_resets[] = {
+	[GPU_CX_BCR] = { 0x1000 },
+	[RBCPR_BCR] = { 0x1050 },
+	[GPU_GX_BCR] = { 0x1090 },
+	[SPDM_BCR] = { 0x10E0 },
+};
+
+static struct clk_regmap *gpucc_sdm660_clocks[] = {
+	[GPUCC_CXO_CLK] = &gpucc_cxo_clk.clkr,
+	[GPU_PLL0_PLL] = &gpu_pll0_pll_out_main.clkr,
+	[GPU_PLL1_PLL] = &gpu_pll1_pll_out_main.clkr,
+	[GFX3D_CLK_SRC] = &gfx3d_clk_src.rcg.clkr,
+	[RBCPR_CLK_SRC] = &rbcpr_clk_src.clkr,
+	[RBBMTIMER_CLK_SRC] = &rbbmtimer_clk_src.clkr,
+	[GPUCC_RBCPR_CLK] = &gpucc_rbcpr_clk.clkr,
+	[GPUCC_GFX3D_CLK] = &gpucc_gfx3d_clk.clkr,
+	[GPUCC_RBBMTIMER_CLK] = &gpucc_rbbmtimer_clk.clkr,
+};
+
+static const struct regmap_config gpucc_660_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x9034,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gpucc_sdm660_desc = {
+	.config = &gpucc_660_regmap_config,
+	.clks = gpucc_sdm660_clocks,
+	.num_clks = ARRAY_SIZE(gpucc_sdm660_clocks),
+	.resets = gpucc_sdm660_resets,
+	.num_resets = ARRAY_SIZE(gpucc_sdm660_resets),
+	.gdscs = gpucc_sdm660_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpucc_sdm660_gdscs),
+};
+
+static const struct of_device_id gpucc_sdm660_match_table[] = {
+	{ .compatible = "qcom,gpucc-sdm660" },
+	{ .compatible = "qcom,gpucc-sdm630" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpucc_sdm660_match_table);
+
+static int gpucc_sdm660_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	struct alpha_pll_config gpu_pll_config = {
+		.config_ctl_val = 0x4001055b,
+		.alpha = 0xaaaaab00,
+		.alpha_en_mask = BIT(24),
+		.vco_val = 0x2 << 20,
+		.vco_mask = 0x3 << 20,
+		.main_output_mask = 0x1,
+	};
+
+	regmap = qcom_cc_map(pdev, &gpucc_sdm660_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* 800MHz configuration for GPU PLL0 */
+	gpu_pll_config.l = 0x29;
+	gpu_pll_config.alpha_hi = 0xaa;
+	clk_alpha_pll_configure(&gpu_pll0_pll_out_main, regmap, &gpu_pll_config);
+
+	/* 740MHz configuration for GPU PLL1 */
+	gpu_pll_config.l = 0x26;
+	gpu_pll_config.alpha_hi = 0x8a;
+	clk_alpha_pll_configure(&gpu_pll1_pll_out_main, regmap, &gpu_pll_config);
+
+	return qcom_cc_really_probe(pdev, &gpucc_sdm660_desc, regmap);
+}
+
+static struct platform_driver gpucc_sdm660_driver = {
+	.probe		= gpucc_sdm660_probe,
+	.driver		= {
+		.name	= "gpucc-sdm660",
+		.of_match_table = gpucc_sdm660_match_table,
+	},
+};
+module_platform_driver(gpucc_sdm660_driver);
+
+MODULE_DESCRIPTION("QCOM GPUCC SDM660/630 Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/dt-bindings/clock/qcom,gpucc-sdm660.h b/include/dt-bindings/clock/qcom,gpucc-sdm660.h
new file mode 100644
index 000000000000..680eaabd838d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sdm660.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_SDM_GPUCC_660_H
+#define _DT_BINDINGS_CLK_SDM_GPUCC_660_H
+
+#define GPUCC_CXO_CLK			0
+#define GPU_PLL0_PLL			1
+#define GPU_PLL1_PLL			2
+#define GFX3D_CLK_SRC			3
+#define RBCPR_CLK_SRC			4
+#define RBBMTIMER_CLK_SRC		5
+#define GPUCC_RBCPR_CLK			6
+#define GPUCC_GFX3D_CLK			7
+#define GPUCC_RBBMTIMER_CLK		8
+
+#define GPU_CX_GDSC			0
+#define GPU_GX_GDSC			1
+
+#define GPU_CX_BCR			0
+#define GPU_GX_BCR			1
+#define RBCPR_BCR			2
+#define SPDM_BCR			3
+
+#endif
-- 
2.28.0

