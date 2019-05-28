Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2D22CC7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 18:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfE1QsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 12:48:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46065 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfE1QsH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 12:48:07 -0400
Received: by mail-pg1-f195.google.com with SMTP id w34so6657328pga.12;
        Tue, 28 May 2019 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S3oUMYtohgjtjmU9AhQyW99n7Pfv/NXLW+JJt+qdW6s=;
        b=ArrWLuF4a5NHdgLHXEXlaZZzJGDLJDcpHLxmc3DGucE9qyD2PTuOVDqnxJY9zTlnRi
         i2imeRq1lricnQOKsyxo0ZYS59ZmHQJErQ+XhqBuiRLJ8GzAicIRKAxwzC+NXRh2n4QR
         b9MPPb0w3pRVD8AFlOi7IZX/wFDhBCGDlgEX3WwGNRXUvyEXiZTT0gWg5073unBnTZ2A
         qo/7Ya2CoIxdzQBaZS3cz7J78/K9tXZn5ozM2emc7QCspEn2A5boS5BjfiTlqeMumm57
         eMcD/afXEL3T6I8kJGHJh1y8PTQ0b7Xtz/VIToBtg+uNN0mJYUMZhbzjawrw44quDq5f
         plMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S3oUMYtohgjtjmU9AhQyW99n7Pfv/NXLW+JJt+qdW6s=;
        b=sc79jiwWUU8u4LJKQhtslxCxA8S28uxiYoVfA8NtfLf6A5FhNtsGcISkNzeI1wi5no
         VbtXhj182gdUA5iX6NFNgnieQzP5ql/3w37pzzONwz3wqaIdC7O+nTzpqzdpeiixngML
         WUrsnrw7kcqNdMsoAGx1Qpjij1FVYACxk+pf2HkPqYb3Gk9ydjgtOxdQ4CLeQEEeYsTw
         P3VKNw4DhHAyfIQDK1KVKJE2HacP7EO9m5p94WgoaEPRnwRw/dX5ILYWc9VRUsu2qGRY
         UO7UQxuGxrjTswrEJxbQ/Wov74koB4N5c8kIYCgf0+/bH5WafPhWxavbGmQIHjkwcBAY
         lt7w==
X-Gm-Message-State: APjAAAXZAtYhM4GPxvidmdSFL0SFD3Ws0CL8/7GIZ9GbyfFLkg+brNwR
        bWnlPCozAc+KJFh5E7e8FMA=
X-Google-Smtp-Source: APXvYqzzUn2E2KLexokeJUdboOI0ZBcNpN7KDRip1oAs+sp/SKS9KokpKfPDKoVS1RC8/b2A1W7qwg==
X-Received: by 2002:a17:90a:7147:: with SMTP id g7mr7097417pjs.42.1559062086348;
        Tue, 28 May 2019 09:48:06 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id u1sm14956854pfh.85.2019.05.28.09.48.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:48:05 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, marc.w.gonzalez@free.fr,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 2/3] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
Date:   Tue, 28 May 2019 09:48:03 -0700
Message-Id: <20190528164803.38642-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com>
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPUCC manages the clocks for the Adreno GPU found on MSM8998.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/clk/qcom/Kconfig         |   8 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/gpucc-msm8998.c | 364 +++++++++++++++++++++++++++++++
 3 files changed, 373 insertions(+)
 create mode 100644 drivers/clk/qcom/gpucc-msm8998.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e1ff83cc361e..e992682fb9eb 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -222,6 +222,14 @@ config MSM_GCC_8998
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  i2c, USB, UFS, SD/eMMC, PCIe, etc.
 
+config MSM_GPUCC_8998
+	tristate "MSM8998 Graphics Clock Controller"
+	select MSM_GCC_8998
+	help
+	  Support for the graphics clock controller on MSM8998 devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config QCS_GCC_404
 	tristate "QCS404 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f0768fb1f037..b8b6ffbdbd62 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_MSM_GCC_8994) += gcc-msm8994.o
 obj-$(CONFIG_MSM_GCC_8996) += gcc-msm8996.o
 obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
 obj-$(CONFIG_MSM_GCC_8998) += gcc-msm8998.o
+obj-$(CONFIG_MSM_GPUCC_8998) += gpucc-msm8998.o
 obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
 obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
 obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
new file mode 100644
index 000000000000..e45062e40718
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019, Jeffrey Hugo
+ */
+
+#include <linux/kernel.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/clk.h>
+
+#include <dt-bindings/clock/qcom,gpucc-msm8998.h>
+
+#include "common.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-alpha-pll.h"
+#include "clk-rcg.h"
+#include "clk-branch.h"
+#include "reset.h"
+#include "gdsc.h"
+
+enum {
+	P_XO,
+	P_GPLL0,
+	P_GPUPLL0_OUT_EVEN,
+};
+
+/* Instead of going directly to the block, XO is routed through this branch */
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
+static const struct clk_div_table post_div_table_fabia_even[] = {
+	{ 0x0, 1 },
+	{ 0x1, 2 },
+	{ 0x3, 4 },
+	{ 0x7, 8 },
+	{ }
+};
+
+static struct clk_alpha_pll gpupll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpupll0",
+		.parent_hws = (const struct clk_hw *[]){ &gpucc_cxo_clk.clkr.hw },
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_fixed_fabia_ops,
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpupll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_fabia_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpupll0_out_even",
+		.parent_hws = (const struct clk_hw *[]){ &gpupll0.clkr.hw },
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
+	},
+};
+
+static const struct parent_map gpu_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 5 },
+};
+
+static const struct clk_parent_data gpu_xo_gpll0[] = {
+	{ .hw = &gpucc_cxo_clk.clkr.hw },
+	{ .fw_name = "gpll0", .name = "gpll0" },
+};
+
+static const struct parent_map gpu_xo_gpupll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPUPLL0_OUT_EVEN, 1 },
+};
+
+static const struct clk_parent_data gpu_xo_gpupll0[] = {
+	{ .hw = &gpucc_cxo_clk.clkr.hw },
+	{ .hw = &gpupll0_out_even.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_rbcpr_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 rbcpr_clk_src = {
+	.cmd_rcgr = 0x1030,
+	.hid_width = 5,
+	.parent_map = gpu_xo_gpll0_map,
+	.freq_tbl = ftbl_rbcpr_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "rbcpr_clk_src",
+		.parent_data = gpu_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gfx3d_clk_src[] = {
+	F(180000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
+	F(257000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
+	F(342000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
+	F(414000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
+	F(515000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
+	F(596000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
+	F(670000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
+	F(710000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gfx3d_clk_src = {
+	.cmd_rcgr = 0x1070,
+	.hid_width = 5,
+	.parent_map = gpu_xo_gpupll0_map,
+	.freq_tbl = ftbl_gfx3d_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gfx3d_clk_src",
+		.parent_data = gpu_xo_gpupll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_OPS_PARENT_ENABLE,
+	},
+};
+
+static const struct freq_tbl ftbl_rbbmtimer_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 rbbmtimer_clk_src = {
+	.cmd_rcgr = 0x10b0,
+	.hid_width = 5,
+	.parent_map = gpu_xo_gpll0_map,
+	.freq_tbl = ftbl_rbbmtimer_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "rbbmtimer_clk_src",
+		.parent_data = gpu_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gfx3d_isense_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(40000000, P_GPLL0, 15, 0, 0),
+	F(200000000, P_GPLL0, 3, 0, 0),
+	F(300000000, P_GPLL0, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gfx3d_isense_clk_src = {
+	.cmd_rcgr = 0x1100,
+	.hid_width = 5,
+	.parent_map = gpu_xo_gpll0_map,
+	.freq_tbl = ftbl_gfx3d_isense_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gfx3d_isense_clk_src",
+		.parent_data = gpu_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch rbcpr_clk = {
+	.halt_reg = 0x1054,
+	.clkr = {
+		.enable_reg = 0x1054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "rbcpr_clk",
+			.parent_hws = (const struct clk_hw *[]){ &rbcpr_clk_src.clkr.hw },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch gfx3d_clk = {
+	.halt_reg = 0x1098,
+	.clkr = {
+		.enable_reg = 0x1098,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gfx3d_clk",
+			.parent_hws = (const struct clk_hw *[]){ &gfx3d_clk_src.clkr.hw },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch rbbmtimer_clk = {
+	.halt_reg = 0x10d0,
+	.clkr = {
+		.enable_reg = 0x10d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "rbbmtimer_clk",
+			.parent_hws = (const struct clk_hw *[]){ &rbbmtimer_clk_src.clkr.hw },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch gfx3d_isense_clk = {
+	.halt_reg = 0x1124,
+	.clkr = {
+		.enable_reg = 0x1124,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gfx3d_isense_clk",
+			.parent_hws = (const struct clk_hw *[]){ &gfx3d_isense_clk_src.clkr.hw },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+//static struct clk_hw *gpucc_msm8998_hws[] = {
+//	&gpucc_cxo_clk.clkr.hw,
+//};
+
+static struct gdsc gpu_cx_gdsc = {
+	.gdscr = 0x1004,
+	.pd = {
+		.name = "gpu_cx",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc gpu_gx_gdsc = {
+	.gdscr = 0x1094,
+	.clamp_io_ctrl = 0x130,
+	//.cxcs = (unsigned int []){ 0x1098 },
+	//.cxc_count = 1,
+	.pd = {
+		.name = "gpu_gx",
+	},
+	.parent = &gpu_cx_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO | AON_RESET,
+};
+
+static struct clk_regmap *gpucc_msm8998_clocks[] = {
+	[GPUPLL0] = &gpupll0.clkr,
+	[GPUPLL0_OUT_EVEN] = &gpupll0_out_even.clkr,
+	[RBCPR_CLK_SRC] = &rbcpr_clk_src.clkr,
+	[GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
+	[RBBMTIMER_CLK_SRC] = &rbbmtimer_clk_src.clkr,
+	[GFX3D_ISENSE_CLK_SRC] = &gfx3d_isense_clk_src.clkr,
+	[RBCPR_CLK] = &rbcpr_clk.clkr,
+	[GFX3D_CLK] = &gfx3d_clk.clkr,
+	[RBBMTIMER_CLK] = &rbbmtimer_clk.clkr,
+	[GFX3D_ISENSE_CLK] = &gfx3d_isense_clk.clkr,
+	[GPUCC_CXO_CLK] = &gpucc_cxo_clk.clkr,
+};
+
+static struct gdsc *gpucc_msm8998_gdscs[] = {
+	[GPU_CX_GDSC] = &gpu_cx_gdsc,
+	[GPU_GX_GDSC] = &gpu_gx_gdsc,
+};
+
+static const struct qcom_reset_map gpucc_msm8998_resets[] = {
+	[GPU_CX_BCR] = { 0x1000 },
+	[RBCPR_BCR] = { 0x1050 },
+	[GPU_GX_BCR] = { 0x1090 },
+	[GPU_ISENSE_BCR] = { 0x1120 },
+};
+
+static const struct regmap_config gpucc_msm8998_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x9000,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gpucc_msm8998_desc = {
+	.config = &gpucc_msm8998_regmap_config,
+	.clks = gpucc_msm8998_clocks,
+	.num_clks = ARRAY_SIZE(gpucc_msm8998_clocks),
+	.resets = gpucc_msm8998_resets,
+	.num_resets = ARRAY_SIZE(gpucc_msm8998_resets),
+	.gdscs = gpucc_msm8998_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpucc_msm8998_gdscs),
+	//.clk_hws = gpucc_msm8998_hws,
+	//.num_clk_hws = ARRAY_SIZE(gpucc_msm8998_hws),
+};
+
+static const struct of_device_id gpucc_msm8998_match_table[] = {
+	{ .compatible = "qcom,gpucc-msm8998" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpucc_msm8998_match_table);
+
+static int gpucc_msm8998_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	struct clk *xo;
+
+	/*
+	 * We must have a valid XO to continue until orphan probe defer is
+	 * implemented.
+	 */
+	xo = clk_get(&pdev->dev, "xo");
+	if (IS_ERR(xo))
+		return PTR_ERR(xo);
+	clk_put(xo);
+
+	regmap = qcom_cc_map(pdev, &gpucc_msm8998_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* force periph logic on to acoid perf counter corruption */
+	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT(13));
+	/* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakage */
+	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(0));
+
+	return qcom_cc_really_probe(pdev, &gpucc_msm8998_desc, regmap);
+}
+
+static struct platform_driver gpucc_msm8998_driver = {
+	.probe		= gpucc_msm8998_probe,
+	.driver		= {
+		.name	= "gpucc-msm8998",
+		.of_match_table = gpucc_msm8998_match_table,
+	},
+};
+module_platform_driver(gpucc_msm8998_driver);
+
+MODULE_DESCRIPTION("QCOM GPUCC MSM8998 Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

