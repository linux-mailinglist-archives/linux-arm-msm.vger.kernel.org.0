Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C35421A160
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 15:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgGINyr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 09:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgGINyr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 09:54:47 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E01C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 06:54:47 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id 6so1716318qtt.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/4QmWwdwMRy96BI1UMSs/Dso+6/E+orYUoohpuKqJb0=;
        b=eH4EMQC93G3GhQfLO69RlZs70tEI1Hv960P2EQuc5jSi46pwu2osPCa/Ytu3yI0b/Z
         wUHfugu7/Sus4oNJQgHQW0YbhQK6i+jlgETU7iDse9BGj7H3pdBz/qm2m7eh+lzMdTIM
         QfFa2PNNGmfsaukuLfPcXXxvsoQ6tSHE4JV9afeebZ6E2OSIfGBnNxh2W/t9avd+geEt
         tPyqqP0pchNO6TkaKmFRIw6vLHQFadWFDH8tb4/KwH42qMJr0omyaQLkM11LzGlVwLO4
         z7NPah06efnUmJVmMbY3Xy/xM/NJKABaJOKNj92vHoA8235/ff34Zhy+jNGYhmdM3PAs
         gJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/4QmWwdwMRy96BI1UMSs/Dso+6/E+orYUoohpuKqJb0=;
        b=L1NxFlfkBzf+PEteRZJZGAsyx17xljqics9rpm46GnpzLUiwKIlFGSt9zr05l8VAcE
         snYgoFjX66vf0RoD2k1uga1tC5Ug3GPTWgPI8taiBEcOsAqOrnF3oPpkXf+dTq0ULRu2
         VhfMNNdsmgp5TCJ/v6jPUplUkHCxrhasm3eKipYWv/qrABdP693mZzthcKrbzyoREP00
         jG27aTkjM0lHQ4O6r1tpEHSMMuw23lh2ASwr924ozYqP2VN/S9ktR8eROXl9kHHrCHoe
         oQDAZLLWFXkg4hDlgadoEMV7dEu0ir5r77jI54QsPUO+PdPLkivP8V3kZpzsXt7B5Dsb
         Twqw==
X-Gm-Message-State: AOAM533yqalHR2fNITHVyaoKm+24R647DHc11wnsbTWea2YM6W+skoQc
        d4uyQQCqHyExaPLUHkkCm3csqwu3EvQ=
X-Google-Smtp-Source: ABdhPJyO2CJUJAgCi0FL9cPelxev3CQu9c8TcYhd+Qagavmp09pVUVZoIQJV/tdEf09+xRSC4OzTqA==
X-Received: by 2002:aed:3b29:: with SMTP id p38mr68092383qte.350.1594302885930;
        Thu, 09 Jul 2020 06:54:45 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 130sm3632735qkn.82.2020.07.09.06.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 06:54:45 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH v3 11/14] clk: qcom: Add graphics clock controller driver for SM8250
Date:   Thu,  9 Jul 2020 09:52:42 -0400
Message-Id: <20200709135251.643-12-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200709135251.643-1-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the graphics clock controller found on SM8250
based devices.

This is initially copied from the downstream kernel, but has
been modified to more closely match the upstream sc7180 driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/Kconfig        |   8 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/gpucc-sm8250.c | 348 ++++++++++++++++++++++++++++++++
 3 files changed, 357 insertions(+)
 create mode 100644 drivers/clk/qcom/gpucc-sm8250.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 1bf5e927ee0d..125215e71ec7 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -399,6 +399,14 @@ config SM_GPUCC_8150
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config SM_GPUCC_8250
+	tristate "SM8250 Graphics Clock Controller"
+	select SM_GCC_8250
+	help
+	  Support for the graphics clock controller on SM8250 devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config SPMI_PMIC_CLKDIV
 	tristate "SPMI PMIC clkdiv Support"
 	depends on SPMI || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f819663c53a6..b5dcb61af7f2 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
 obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
 obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
 obj-$(CONFIG_SM_GPUCC_8150) += gpucc-sm8150.o
+obj-$(CONFIG_SM_GPUCC_8250) += gpucc-sm8250.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
new file mode 100644
index 000000000000..49b0b071778d
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,gpucc-sm8250.h>
+
+#include "common.h"
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "reset.h"
+#include "gdsc.h"
+
+#define CX_GMU_CBCR_SLEEP_MASK		0xf
+#define CX_GMU_CBCR_SLEEP_SHIFT		4
+#define CX_GMU_CBCR_WAKE_MASK		0xf
+#define CX_GMU_CBCR_WAKE_SHIFT		8
+
+enum {
+	P_BI_TCXO,
+	P_CORE_BI_PLL_TEST_SE,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL1_OUT_MAIN,
+};
+
+static struct pll_vco lucid_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static const struct alpha_pll_config gpu_cc_pll1_config = {
+	.l = 0x1a,
+	.alpha = 0xaaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0x029a699c,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000805,
+	.user_ctl_hi1_val = 0x00000000,
+};
+
+static struct clk_alpha_pll gpu_cc_pll1 = {
+	.offset = 0x100,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_pll1",
+			.parent_data =  &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .fw_name = "gcc_gpu_gpll0_clk_src" },
+	{ .fw_name = "gcc_gpu_gpll0_div_clk_src" },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN_DIV, 1.5, 0, 0),
+	F(500000000, P_GPU_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x1120,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x1078,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1078,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_crc_ahb_clk = {
+	.halt_reg = 0x107c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x107c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_crc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_apb_clk = {
+	.halt_reg = 0x1088,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1088,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cx_apb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x1098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1098,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_data =  &(const struct clk_parent_data){
+				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
+	.halt_reg = 0x108c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x108c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cx_snoc_dvm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_aon_clk = {
+	.halt_reg = 0x1004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cxo_aon_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x109c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x109c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gmu_clk = {
+	.halt_reg = 0x1064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1064,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_gx_gmu_clk",
+			.parent_data =  &(const struct clk_parent_data){
+				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
+	.halt_reg = 0x5000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x5000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			 .name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
+			 .ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cx_gdsc = {
+	.gdscr = 0x106c,
+	.gds_hw_ctrl = 0x1540,
+	.pd = {
+		.name = "gpu_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc gpu_gx_gdsc = {
+	.gdscr = 0x100c,
+	.clamp_io_ctrl = 0x1508,
+	.pd = {
+		.name = "gpu_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
+};
+
+static struct clk_regmap *gpu_cc_sm8250_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_APB_CLK] = &gpu_cc_cx_apb_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
+	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
+	[GPU_CC_PLL1] = &gpu_cc_pll1.clkr,
+	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
+};
+
+static const struct qcom_reset_map gpu_cc_sm8250_resets[] = {
+	[GPUCC_GPU_CC_ACD_BCR] = { 0x1160 },
+	[GPUCC_GPU_CC_CX_BCR] = { 0x1068 },
+	[GPUCC_GPU_CC_GFX3D_AON_BCR] = { 0x10a0 },
+	[GPUCC_GPU_CC_GMU_BCR] = { 0x111c },
+	[GPUCC_GPU_CC_GX_BCR] = { 0x1008 },
+	[GPUCC_GPU_CC_XO_BCR] = { 0x1000 },
+};
+
+static struct gdsc *gpu_cc_sm8250_gdscs[] = {
+	[GPU_CX_GDSC] = &gpu_cx_gdsc,
+	[GPU_GX_GDSC] = &gpu_gx_gdsc,
+};
+
+static const struct regmap_config gpu_cc_sm8250_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8008,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc gpu_cc_sm8250_desc = {
+	.config = &gpu_cc_sm8250_regmap_config,
+	.clks = gpu_cc_sm8250_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_sm8250_clocks),
+	.resets = gpu_cc_sm8250_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_sm8250_resets),
+	.gdscs = gpu_cc_sm8250_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_sm8250_gdscs),
+};
+
+static const struct of_device_id gpu_cc_sm8250_match_table[] = {
+	{ .compatible = "qcom,sm8250-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_sm8250_match_table);
+
+static int gpu_cc_sm8250_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	unsigned int value, mask;
+
+	regmap = qcom_cc_map(pdev, &gpu_cc_sm8250_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+
+	/*
+	 * Configure gpu_cc_cx_gmu_clk with recommended
+	 * wakeup/sleep settings
+	 */
+	mask = CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
+	mask |= CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
+	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
+	regmap_update_bits(regmap, 0x1098, mask, value);
+
+	return qcom_cc_really_probe(pdev, &gpu_cc_sm8250_desc, regmap);;
+}
+
+static struct platform_driver gpu_cc_sm8250_driver = {
+	.probe = gpu_cc_sm8250_probe,
+	.driver = {
+		.name = "sm8250-gpucc",
+		.of_match_table = gpu_cc_sm8250_match_table,
+	},
+};
+
+static int __init gpu_cc_sm8250_init(void)
+{
+	return platform_driver_register(&gpu_cc_sm8250_driver);
+}
+subsys_initcall(gpu_cc_sm8250_init);
+
+static void __exit gpu_cc_sm8250_exit(void)
+{
+	platform_driver_unregister(&gpu_cc_sm8250_driver);
+}
+module_exit(gpu_cc_sm8250_exit);
+
+MODULE_DESCRIPTION("QTI GPU_CC SM8250 Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.1

