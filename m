Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A970E25A3E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 05:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgIBDPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 23:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgIBDPA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 23:15:00 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96ABC061245
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 20:14:59 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id g3so2559738qtq.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 20:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+o+L3nuztl1Bi1JkFVFEuyn0WDqJPiLw4ZBflO9H9hg=;
        b=mo7oiLjhft7fHcIqPBHwG9jljWSca2bXpINiR5+j1mZrVlS3SSAJ163K7K7bYFwOzU
         rYfTLLWnB3Oo7VKY7HOG5XgNLh/7D+8RZ7DmBsxrA4SaLij9dBT7q1XPrr3gpajeE4KE
         KksBefJki8qXGCS008dK+OXNzLl6pCBfHoUzTfnBfKfWOHJxhqoO4b521HHoz0tnrsnL
         LjAcnyEMpbHnPSpx0a5uZndpvJH23+LPgTW/Y4chnU/wrwJmSOSbEHyEfivVsdxH4bb7
         GIOrASBf3+E+4rZv2BZxr9OQlbTCu3oA1+1aVnTGt2d/4pHEzMDWNkmLCbRKMUNedn/g
         BbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+o+L3nuztl1Bi1JkFVFEuyn0WDqJPiLw4ZBflO9H9hg=;
        b=bMvdeEknQEr+RGCvfSW044CQXzVyExjg+0mjfETt2IirTZpdliHSH0nlKoHqyBu/Uz
         kz05E0xW2TZ49LIj+pF0I84EXVGFHFY0e32wUvr02DTKX3TQeJs4E/9vx4X4MbAN2uO0
         JvleHVMpfT6wyQ2WPA5sMdglIZdv/Ls/mKmOTXQP2fPkpz9N0XZcbfynqMT4W7aMC8TY
         z9xa850KH55SpEpKuYyUKbOHvJaVBgQ1XarpYBah0bfbVFRxZ2BXq2CkXFyC0L8SRucf
         psAbJNePkkNt8l13CpFsN25IFJYlkpvK6eYdm9GmUsPvJ4M/WhFLZc/Ww0kv+C7NQS84
         vKzg==
X-Gm-Message-State: AOAM532ClNo5yqKpJJJ+iIZ7ha5zFcFW4t/GUhItXgSVY3C2nJ3Kx8Hg
        HiWtjgk4pETXjJPaWrgb1msyt/EAtnqmmxBGax0=
X-Google-Smtp-Source: ABdhPJz5SjDnNpsC1ARasyQW06rJCFIrDcG5lwZN5cDi3D2x1xOMXL9tH15UNiP5lr2xucg4Euv82Q==
X-Received: by 2002:ac8:7c90:: with SMTP id y16mr4927863qtv.45.1599016498928;
        Tue, 01 Sep 2020 20:14:58 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q35sm3755649qtd.75.2020.09.01.20.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 20:14:58 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 4/5] clk: qcom: add video clock controller driver for SM8150
Date:   Tue,  1 Sep 2020 23:13:54 -0400
Message-Id: <20200902031359.6703-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200902031359.6703-1-jonathan@marek.ca>
References: <20200902031359.6703-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the video clock controller found on SM8150 based devices.

Derived from the downstream driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/Kconfig          |   9 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sm8150.c | 276 ++++++++++++++++++++++++++++++
 3 files changed, 286 insertions(+)
 create mode 100644 drivers/clk/qcom/videocc-sm8150.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 058327310c25..40d7ee9886c9 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -444,6 +444,15 @@ config SM_GPUCC_8250
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config SM_VIDEOCC_8150
+	tristate "SM8150 Video Clock Controller"
+	select SDM_GCC_8150
+	select QCOM_GDSC
+	help
+	  Support for the video clock controller on SM8150 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config SPMI_PMIC_CLKDIV
 	tristate "SPMI PMIC clkdiv Support"
 	depends on SPMI || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9677e769e7e9..6f4c580d2728 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
 obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
 obj-$(CONFIG_SM_GPUCC_8150) += gpucc-sm8150.o
 obj-$(CONFIG_SM_GPUCC_8250) += gpucc-sm8250.o
+obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
new file mode 100644
index 000000000000..3087e2ec8fd4
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,videocc-sm8150.h>
+
+#include "common.h"
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "reset.h"
+#include "gdsc.h"
+
+enum {
+	P_BI_TCXO,
+	P_CHIP_SLEEP_CLK,
+	P_CORE_BI_PLL_TEST_SE,
+	P_VIDEO_PLL0_OUT_EVEN,
+	P_VIDEO_PLL0_OUT_MAIN,
+	P_VIDEO_PLL0_OUT_ODD,
+};
+
+static struct pll_vco trion_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static struct alpha_pll_config video_pll0_config = {
+	.l = 0x14,
+	.alpha = 0xD555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002267,
+	.config_ctl_hi1_val = 0x00000024,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000805,
+	.user_ctl_hi1_val = 0x000000D0,
+};
+
+static struct clk_alpha_pll video_pll0 = {
+	.offset = 0x42c,
+	.vco_table = trion_vco,
+	.num_vco = ARRAY_SIZE(trion_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "video_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_trion_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &video_pll0.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_iris_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(240000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(365000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_iris_clk_src = {
+	.cmd_rcgr = 0x7f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_iris_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "video_cc_iris_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch video_cc_iris_ahb_clk = {
+	.halt_reg = 0x8f4,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x8f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_iris_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_iris_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_core_clk = {
+	.halt_reg = 0x890,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x890,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_mvs0_core_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_iris_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_core_clk = {
+	.halt_reg = 0x8d0,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x8d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_mvs1_core_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_iris_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvsc_core_clk = {
+	.halt_reg = 0x850,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x850,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_mvsc_core_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_iris_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
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
+	.flags = 0,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc vcodec0_gdsc = {
+	.gdscr = 0x874,
+	.pd = {
+		.name = "vcodec0_gdsc",
+	},
+	.flags = HW_CTRL,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc vcodec1_gdsc = {
+	.gdscr = 0x8b4,
+	.pd = {
+		.name = "vcodec1_gdsc",
+	},
+	.flags = HW_CTRL,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+static struct clk_regmap *video_cc_sm8150_clocks[] = {
+	[VIDEO_CC_IRIS_AHB_CLK] = &video_cc_iris_ahb_clk.clkr,
+	[VIDEO_CC_IRIS_CLK_SRC] = &video_cc_iris_clk_src.clkr,
+	[VIDEO_CC_MVS0_CORE_CLK] = &video_cc_mvs0_core_clk.clkr,
+	[VIDEO_CC_MVS1_CORE_CLK] = &video_cc_mvs1_core_clk.clkr,
+	[VIDEO_CC_MVSC_CORE_CLK] = &video_cc_mvsc_core_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_pll0.clkr,
+};
+
+static struct gdsc *video_cc_sm8150_gdscs[] = {
+	[VENUS_GDSC] = &venus_gdsc,
+	[VCODEC0_GDSC] = &vcodec0_gdsc,
+	[VCODEC1_GDSC] = &vcodec1_gdsc,
+};
+
+static const struct regmap_config video_cc_sm8150_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0xb94,
+	.fast_io	= true,
+};
+
+static const struct qcom_reset_map video_cc_sm8150_resets[] = {
+	[VIDEO_CC_MVSC_CORE_CLK_BCR] = { 0x850, 2 },
+};
+
+static const struct qcom_cc_desc video_cc_sm8150_desc = {
+	.config = &video_cc_sm8150_regmap_config,
+	.clks = video_cc_sm8150_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_sm8150_clocks),
+	.resets = video_cc_sm8150_resets,
+	.num_resets = ARRAY_SIZE(video_cc_sm8150_resets),
+	.gdscs = video_cc_sm8150_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_sm8150_gdscs),
+};
+
+static const struct of_device_id video_cc_sm8150_match_table[] = {
+	{ .compatible = "qcom,sm8150-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_sm8150_match_table);
+
+static int video_cc_sm8150_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &video_cc_sm8150_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_trion_pll_configure(&video_pll0, regmap, &video_pll0_config);
+
+	/* Keep VIDEO_CC_XO_CLK ALWAYS-ON */
+	regmap_update_bits(regmap, 0x984, 0x1, 0x1);
+
+	return qcom_cc_really_probe(pdev, &video_cc_sm8150_desc, regmap);
+}
+
+static struct platform_driver video_cc_sm8150_driver = {
+	.probe = video_cc_sm8150_probe,
+	.driver = {
+		.name	= "video_cc-sm8150",
+		.of_match_table = video_cc_sm8150_match_table,
+	},
+};
+
+static int __init video_cc_sm8150_init(void)
+{
+	return platform_driver_register(&video_cc_sm8150_driver);
+}
+subsys_initcall(video_cc_sm8150_init);
+
+static void __exit video_cc_sm8150_exit(void)
+{
+	platform_driver_unregister(&video_cc_sm8150_driver);
+}
+module_exit(video_cc_sm8150_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("QTI VIDEOCC SM8150 Driver");
-- 
2.26.1

