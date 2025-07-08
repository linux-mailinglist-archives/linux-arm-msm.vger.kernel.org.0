Return-Path: <linux-arm-msm+bounces-64034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6D9AFCACA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73E697B5025
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0872DCF69;
	Tue,  8 Jul 2025 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhHHjPov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE08A273FE;
	Tue,  8 Jul 2025 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978856; cv=none; b=RtlN3jbGqpGLykWRTHN1kfSyzGvcq8eTvMDUpp7AUHgVwZ43013zPcVpcOiOkeaMVnLUDKih1ZqDons5fqitfqmO2kDiOtdhk7qf//FTgAkSIL5kQF3Ca0ON3xEC2d8SSv7qvufiPKDwPD971vGkCyEbKT7XrEIHJ9n721PTrDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978856; c=relaxed/simple;
	bh=N31nWrVb/C3gwEWVst/IKabeIc+AzTRKmL5+kLekyaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=thtPUhVf3FzWB4/UAUZTIoiNMPwk+fakFuHE+GLgNz6gE2yG+rE8U49Grw04ijlulPipztxH1zZBuddPAPyw41ZLNzTbJU7+S6vPrS3MzteS60vUHpspswJdSwmDtPXAOddpRUoK+dToP6WgzA2hriCyuJZm2TzqSbIWCrePLGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhHHjPov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CE1C4CEF1;
	Tue,  8 Jul 2025 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751978856;
	bh=N31nWrVb/C3gwEWVst/IKabeIc+AzTRKmL5+kLekyaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AhHHjPovoyE7wIEXTDoohINxCMgQKZK8YXOTbK4p9sfJ04l87uBMrQ8ODbGk3uBvT
	 0NWhliK0ylPChL+BG6FmbhPfOqkgIWIClQW0xmAUTYE5o5vzAKfcheoQKigkvCLyBA
	 S+5YKdjIVKpuQoWj18o18axafx34oG6lVUVJyn1Jb2aH940n8+6kfegQesXWvi67SN
	 T58fGPFj5yMaQvxlqmHdtResu/eC6U8fXTMLYzg/UjpWqQgyfBaltxWJWApJY9WIT1
	 40/c+sum5K70HCIZ+0An0Jz+VMH1UeNa7/R+vov7VExJ5bvJ48vjEQO2oadmoiUs3O
	 8c73ENYmWecbg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 08 Jul 2025 14:47:21 +0200
Subject: [PATCH 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-topic-8750_gpucc-v1-2-86c86a504d47@oss.qualcomm.com>
References: <20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com>
In-Reply-To: <20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751978844; l=16679;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=L8yXzcC4NPE7CAlvhnVhzKI94mQv61dcfqikD5recoY=;
 b=ZVbnOdeV6dseu/tFjygsqpYLpltFXWGVE5o24W/5wpVhjen/dfU7ZBGLmg8BP2IOo61F3mAgQ
 hOeGuKtJ9SgD818u2Ilhz9kfR9ky9jBB/Xg3QlbO7RBOMrVFgSLbEtJ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The SM8750's GFX hardware is largely clocked by two domains: GPU_CC
(which is very similar to the ones on previous SoCs) and GX_CC (where
the GX GDSC now resides).

As usual, the GMU drives most of the clocks and Linux only manages a
subset required to boot it (and the SMMU) up.

Add a driver to accommodate for that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   9 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/gpucc-sm8750.c | 524 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 534 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 36d6e6e1e7f0162d53f02f39125f4593517e0dba..9f430fcee3ef4e44dbf8f6277d7bf85888dedd59 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1295,6 +1295,15 @@ config SM_GPUCC_8650
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config SM_GPUCC_8750
+	tristate "SM8750 Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_8750
+	help
+	  Support for the graphics clock controller on SM8750 devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config SM_LPASSCC_6115
 	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ab59434338bb6d6f49b0af94ff0f85cb386a16db..b55f373d71e136eaa279ed3ea8e8714119ecfd70 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -161,6 +161,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
 obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
+obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
diff --git a/drivers/clk/qcom/gpucc-sm8750.c b/drivers/clk/qcom/gpucc-sm8750.c
new file mode 100644
index 0000000000000000000000000000000000000000..ea8e5a87778d87745f29b115185ba7b0fa4c43e1
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-sm8750.c
@@ -0,0 +1,524 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_EVEN,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL0_OUT_ODD,
+};
+
+static const struct pll_vco taycan_elu_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x34,
+	.alpha = 0x1555,
+	.config_ctl_val = 0x19660387,
+	.config_ctl_hi_val = 0x098060a0,
+	.config_ctl_hi1_val = 0xb416cb20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
+	.vco_table = taycan_elu_vco,
+	.num_vco = ARRAY_SIZE(taycan_elu_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_elu_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpu_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpu_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_gpu_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpu_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_elu_ops,
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL0_OUT_EVEN, 2 },
+	{ P_GPU_CC_PLL0_OUT_ODD, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0_out_even.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .fw_name = "gpll0_out_main" },
+	{ .fw_name = "gpll0_out_main_div" },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(500000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(650000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(687500000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x9318,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_hub_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x93ec,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_hub_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gpu_cc_hub_div_clk_src = {
+	.reg = 0x942c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_hub_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x90bc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x90bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x910c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x910c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x90d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x90e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_demet_clk = {
+	.halt_reg = 0x9010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_demet_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_dpm_clk = {
+	.halt_reg = 0x9110,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9110,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_dpm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_freq_measure_clk = {
+	.halt_reg = 0x900c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x900c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_freq_measure_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_accu_shift_clk = {
+	.halt_reg = 0x9070,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gmu_clk = {
+	.halt_reg = 0x9060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x93e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x93e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_cx_int_clk = {
+	.halt_reg = 0x90e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x90f4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x9080,
+	.gds_hw_ctrl = 0x9094,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x8,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct clk_regmap *gpu_cc_sm8750_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_DEMET_CLK] = &gpu_cc_demet_clk.clkr,
+	[GPU_CC_DPM_CLK] = &gpu_cc_dpm_clk.clkr,
+	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr,
+	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
+	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_HUB_DIV_CLK_SRC] = &gpu_cc_hub_div_clk_src.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL0_OUT_EVEN] = &gpu_cc_pll0_out_even.clkr,
+};
+
+static struct gdsc *gpu_cc_sm8750_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_sm8750_resets[] = {
+	[GPU_CC_GPU_CC_XO_BCR] = { 0x9000 },
+	[GPU_CC_GPU_CC_GX_BCR] = { 0x905c },
+	[GPU_CC_GPU_CC_CX_BCR] = { 0x907c },
+	[GPU_CC_GPU_CC_GMU_BCR] = { 0x9314 },
+	[GPU_CC_GPU_CC_CB_BCR] = { 0x93a0 },
+	[GPU_CC_GPU_CC_FAST_HUB_BCR] = { 0x93e4 },
+};
+
+static const struct regmap_config gpu_cc_sm8750_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9800,
+	.fast_io = true,
+};
+
+static struct clk_alpha_pll *gpu_cc_alpha_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static u32 gpu_cc_sm8750_critical_cbcrs[] = {
+	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
+	0x9008, /* GPU_CC_CXO_AON_CLK */
+	0x9064, /* GPU_CC_GX_AHB_FF_CLK */
+	0x90cc, /* GPU_CC_SLEEP_CLK */
+	0x93a4, /* GPU_CC_CB_CLK */
+	0x93a8, /* GPU_CC_RSCC_HUB_AON_CLK */
+};
+
+static struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
+	.alpha_plls = gpu_cc_alpha_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_alpha_plls),
+	.clk_cbcrs = gpu_cc_sm8750_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm8750_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_cc_sm8750_desc = {
+	.config = &gpu_cc_sm8750_regmap_config,
+	.clks = gpu_cc_sm8750_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_sm8750_clocks),
+	.resets = gpu_cc_sm8750_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_sm8750_resets),
+	.gdscs = gpu_cc_sm8750_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_sm8750_gdscs),
+	.driver_data = &gpu_cc_sm8750_driver_data,
+};
+
+static const struct of_device_id gpu_cc_sm8750_match_table[] = {
+	{ .compatible = "qcom,sm8750-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_sm8750_match_table);
+
+static int gpu_cc_sm8750_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_sm8750_desc);
+}
+
+static struct platform_driver gpu_cc_sm8750_driver = {
+	.probe = gpu_cc_sm8750_probe,
+	.driver = {
+		.name = "sm8750-gpucc",
+		.of_match_table = gpu_cc_sm8750_match_table,
+	},
+};
+module_platform_driver(gpu_cc_sm8750_driver);
+
+static struct gdsc gx_cc_gx_gdsc = {
+	.gdscr = 0x4024,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gx_cc_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc *gx_cc_gdscs[] = {
+	[GX_CC_GX_GDSC] = &gx_cc_gx_gdsc,
+};
+
+static const struct regmap_config gx_cc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x6000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc gx_cc_sm8750_desc = {
+	.config = &gx_cc_regmap_config,
+	.gdscs = gx_cc_gdscs,
+	.num_gdscs = ARRAY_SIZE(gx_cc_gdscs),
+	.use_rpm = true,
+};
+
+static const struct of_device_id gx_cc_sm8750_match_table[] = {
+	{ .compatible = "qcom,sm8750-gxcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gx_cc_sm8750_match_table);
+
+static int gx_cc_sm8750_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gx_cc_sm8750_desc);
+}
+
+static struct platform_driver gx_cc_sm8750_driver = {
+	.probe = gx_cc_sm8750_probe,
+	.driver = {
+		.name = "gx_cc-sm8750",
+		.of_match_table = gx_cc_sm8750_match_table,
+	},
+};
+module_platform_driver(gx_cc_sm8750_driver);
+
+MODULE_DESCRIPTION("QTI GPU_CC SM8750 Driver");
+MODULE_LICENSE("GPL");

-- 
2.50.0


