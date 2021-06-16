Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D167B3A9D2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 16:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233923AbhFPON6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 10:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbhFPONm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 10:13:42 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04273C0611C3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:33 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id z8so2840261wrp.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aWWrpMg5EQCo1CMScKf8Q/dtUiywBeWzbtmUXhiWRfA=;
        b=WQ4EMF8zDq0UtrncKXrGygZsPkuDCf6fXAMkPawJqzwtLFbnS2dXRI1QoUXg9yU7hL
         Fk6ivYeKrSkVPLK4f6rZlq5MIBOKD4gzhl0x4T5Q4wtVOSoAEIdak5aud47xFvdwMsle
         /EOQw1u/pvHlMkNC+VYE1z9fq9m/CBXVPW4DjcJfl+vMhqQlRShSO2o6J9x37CLtzLoQ
         8u2nJlNrKPUEZBQ3nrBrFkQxIVwzF8fpv5fBCYbALXKnGpHRx3CiiuQvLef8m3QwEcjm
         VRCGOQnx8tJRNYHLmqhcJ04vpupX9crQL+pp9ul3KmKD9hsVV3F/8fb5P8tNfLZOhN6S
         8D7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aWWrpMg5EQCo1CMScKf8Q/dtUiywBeWzbtmUXhiWRfA=;
        b=twhEdCGncjn8FgltkTjfJLbKKeEUcN/0m5q3o9cL8IQWXHix/PBTVeq8tMmh5RXoxa
         +R5kFo7WOG3ElSO+F+XRi6LqPd+YLtGEwybQ9h4xT6O1DVe2RL42sKebvFAqskpewVlv
         ku7c6LPMJ/r9BOu7j26x4oBbq00Pvw+kFXW9wIgNUYDegztxI0UYtkauH2fMNb+7rpfy
         i5SYqqRjVTPQA52MQBDDR38bAcdYLbcJQ9uaX/A3ajt5GKi2weImxIjALVAxwQnIzzza
         tjI7M0hd5mD8hgrl/neNrJyeHxXJ68nrV2Y7Koz5TRlWSFgEtcZiZn822Q1Ktsj/U3ay
         djFw==
X-Gm-Message-State: AOAM532S+GLZ9F5ZDKFEulDrGTkyu0iBrHrSwTQRg9OIbgKSlI2OFsqc
        KEoXDIMrgrQ7T5G8ozf9gSOVgg==
X-Google-Smtp-Source: ABdhPJw2cCO1jNRBvl4ANe5nsbjdv273anOIYjKiQQ6zqG0rkcZub+3zOZI/VVmoGF8gIKySPocEIg==
X-Received: by 2002:adf:8061:: with SMTP id 88mr5636483wrk.233.1623852691517;
        Wed, 16 Jun 2021 07:11:31 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:31 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 08/11] clk: qcom: Add video clock controller driver for SM8350
Date:   Wed, 16 Jun 2021 16:11:04 +0200
Message-Id: <20210616141107.291430-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the video clock controller found on SM8350 based devices.

Derived from the downstream driver.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/Kconfig          |   9 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sm8350.c | 593 ++++++++++++++++++++++++++++++
 3 files changed, 603 insertions(+)
 create mode 100644 drivers/clk/qcom/videocc-sm8350.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index f7c99f97fa57..181967e90a8a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -558,6 +558,15 @@ config SM_VIDEOCC_8250
 	  Say Y if you want to support video devices and functionality such as
 	  video encode and decode.
 
+config SM_VIDEOCC_8350
+	tristate "SM8350 Video Clock Controller"
+	select SDM_GCC_8350
+	select QCOM_GDSC
+	help
+	  Support for the video clock controller on SM8350 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config SPMI_PMIC_CLKDIV
 	tristate "SPMI PMIC clkdiv Support"
 	depends on SPMI || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 69dc2a9f43d7..adf644b5c1ba 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_SM_GPUCC_8150) += gpucc-sm8150.o
 obj-$(CONFIG_SM_GPUCC_8250) += gpucc-sm8250.o
 obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
 obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
+obj-$(CONFIG_SM_VIDEOCC_8350) += videocc-sm8350.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
new file mode 100644
index 000000000000..37e1248454c2
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -0,0 +1,593 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,videocc-sm8350.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "reset.h"
+#include "gdsc.h"
+
+enum {
+	P_BI_TCXO,
+	P_CORE_BI_PLL_TEST_SE,
+	P_SLEEP_CLK,
+	P_VIDEO_PLL0_OUT_MAIN,
+	P_VIDEO_PLL1_OUT_MAIN,
+};
+
+static struct pll_vco lucid_vco[] = {
+	{ 249600000, 1750000000, 0 },
+};
+
+static const struct alpha_pll_config video_pll0_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0x2A9A699C,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000000,
+	.test_ctl_hi1_val = 0x01800000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000805,
+	.user_ctl_hi1_val = 0x00000000,
+};
+
+static struct clk_alpha_pll video_pll0 = {
+	.offset = 0x42c,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "video_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+				.name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_5lpe_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config video_pll1_config = {
+	.l = 0x2B,
+	.alpha = 0xC000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0x2A9A699C,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000000,
+	.test_ctl_hi1_val = 0x01800000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000805,
+	.user_ctl_hi1_val = 0x00000000,
+};
+
+static struct clk_alpha_pll video_pll1 = {
+	.offset = 0x7d0,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "video_pll1",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+				.name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_5lpe_ops,
+		},
+	},
+};
+
+static const struct parent_map videocc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data videocc_parent_data_0_ao[] = {
+	{ .fw_name = "bi_tcxo_ao", .name = "bi_tcxo_ao" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map videocc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data videocc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &video_pll0.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map videocc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL1_OUT_MAIN, 1 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data videocc_parent_data_2[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &video_pll1.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map videocc_parent_map_3[] = {
+	{ P_SLEEP_CLK, 0 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data videocc_parent_data_3[] = {
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct freq_tbl ftbl_videocc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 videocc_ahb_clk_src = {
+	.cmd_rcgr = 0xbd4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = videocc_parent_map_0,
+	.freq_tbl = ftbl_videocc_ahb_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "videocc_ahb_clk_src",
+		.parent_data = videocc_parent_data_0_ao,
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_videocc_mvs0_clk_src[] = {
+	F(720000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 videocc_mvs0_clk_src = {
+	.cmd_rcgr = 0xb94,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = videocc_parent_map_1,
+	.freq_tbl = ftbl_videocc_mvs0_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "videocc_mvs0_clk_src",
+		.parent_data = videocc_parent_data_1,
+		.num_parents =  ARRAY_SIZE(videocc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_videocc_mvs1_clk_src[] = {
+	F(840000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 videocc_mvs1_clk_src = {
+	.cmd_rcgr = 0xbb4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = videocc_parent_map_2,
+	.freq_tbl = ftbl_videocc_mvs1_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "videocc_mvs1_clk_src",
+		.parent_data = videocc_parent_data_2,
+		.num_parents = ARRAY_SIZE(videocc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_videocc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 videocc_sleep_clk_src = {
+	.cmd_rcgr = 0xef0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = videocc_parent_map_3,
+	.freq_tbl = ftbl_videocc_sleep_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "videocc_sleep_clk_src",
+		.parent_data = videocc_parent_data_3,
+		.num_parents = ARRAY_SIZE(videocc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 videocc_xo_clk_src = {
+	.cmd_rcgr = 0xecc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = videocc_parent_map_0,
+	.freq_tbl = ftbl_videocc_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "videocc_xo_clk_src",
+		.parent_data = videocc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(videocc_parent_data_0_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div videocc_mvs0_div_clk_src = {
+	.reg = 0xd54,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "videocc_mvs0_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &videocc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div videocc_mvs0c_div2_div_clk_src = {
+	.reg = 0xc54,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "videocc_mvs0c_div2_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &videocc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div videocc_mvs1_div_clk_src = {
+	.reg = 0xdd4,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "videocc_mvs1_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &videocc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div videocc_mvs1c_div2_div_clk_src = {
+	.reg = 0xcf4,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "videocc_mvs1c_div2_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &videocc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch videocc_mvs0_clk = {
+	.halt_reg = 0xd34,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0xd34,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0xd34,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "videocc_mvs0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &videocc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_mvs0c_clk = {
+	.halt_reg = 0xc34,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xc34,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "videocc_mvs0c_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &videocc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_mvs1_clk = {
+	.halt_reg = 0xdb4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0xdb4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0xdb4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "videocc_mvs1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &videocc_mvs1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_mvs1_div2_clk = {
+	.halt_reg = 0xdf4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0xdf4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0xdf4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "videocc_mvs1_div2_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &videocc_mvs1c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_mvs1c_clk = {
+	.halt_reg = 0xcd4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xcd4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "videocc_mvs1c_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &videocc_mvs1c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch videocc_sleep_clk = {
+	.halt_reg = 0xf10,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xf10,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "videocc_sleep_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &videocc_sleep_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc mvs0c_gdsc = {
+	.gdscr = 0xbf8,
+	.pd = {
+		.name = "mvs0c_gdsc",
+	},
+	.flags = 0,
+	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
+};
+
+static struct gdsc mvs1c_gdsc = {
+	.gdscr = 0xc98,
+	.pd = {
+		.name = "mvs1c_gdsc",
+	},
+	.flags = 0,
+	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
+};
+
+static struct gdsc mvs0_gdsc = {
+	.gdscr = 0xd18,
+	.pd = {
+		.name = "mvs0_gdsc",
+	},
+	.flags = HW_CTRL,
+	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
+};
+
+static struct gdsc mvs1_gdsc = {
+	.gdscr = 0xd98,
+	.pd = {
+		.name = "mvs1_gdsc",
+	},
+	.flags = HW_CTRL,
+	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
+};
+
+static struct clk_regmap *videocc_sm8350_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &videocc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &videocc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &videocc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &videocc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &videocc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &videocc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS1_CLK] = &videocc_mvs1_clk.clkr,
+	[VIDEO_CC_MVS1_CLK_SRC] = &videocc_mvs1_clk_src.clkr,
+	[VIDEO_CC_MVS1_DIV2_CLK] = &videocc_mvs1_div2_clk.clkr,
+	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &videocc_mvs1_div_clk_src.clkr,
+	[VIDEO_CC_MVS1C_CLK] = &videocc_mvs1c_clk.clkr,
+	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &videocc_mvs1c_div2_div_clk_src.clkr,
+	[VIDEO_CC_SLEEP_CLK] = &videocc_sleep_clk.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &videocc_sleep_clk_src.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &videocc_xo_clk_src.clkr,
+	[VIDEO_PLL0] = &video_pll0.clkr,
+	[VIDEO_PLL1] = &video_pll1.clkr,
+};
+
+static const struct qcom_reset_map videocc_sm8350_resets[] = {
+	[VIDEO_CC_CVP_INTERFACE_BCR] = { 0xe54 },
+	[VIDEO_CC_CVP_MVS0_BCR] = { 0xd14 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0xc34, 2 },
+	[VIDEO_CC_CVP_MVS0C_BCR] = { 0xbf4 },
+	[VIDEO_CC_CVP_MVS1_BCR] = { 0xd94 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0xcd4, 2 },
+	[VIDEO_CC_CVP_MVS1C_BCR] = { 0xc94 },
+};
+
+static struct gdsc *videocc_sm8350_gdscs[] = {
+	[MVS0C_GDSC] = &mvs0c_gdsc,
+	[MVS1C_GDSC] = &mvs1c_gdsc,
+	[MVS0_GDSC] = &mvs0_gdsc,
+	[MVS1_GDSC] = &mvs1_gdsc,
+};
+
+static const struct regmap_config videocc_sm8350_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf4c,
+	.fast_io = true,
+};
+
+static struct qcom_cc_desc videocc_sm8350_desc = {
+	.config = &videocc_sm8350_regmap_config,
+	.clks = videocc_sm8350_clocks,
+	.num_clks = ARRAY_SIZE(videocc_sm8350_clocks),
+	.resets = videocc_sm8350_resets,
+	.num_resets = ARRAY_SIZE(videocc_sm8350_resets),
+	.gdscs = videocc_sm8350_gdscs,
+	.num_gdscs = ARRAY_SIZE(videocc_sm8350_gdscs),
+};
+
+static const struct of_device_id videocc_sm8350_match_table[] = {
+	{ .compatible = "qcom,sm8350-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, videocc_sm8350_match_table);
+
+static int videocc_sm8350_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	regmap = qcom_cc_map(pdev, &videocc_sm8350_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ret = qcom_cc_runtime_init(pdev, &videocc_sm8350_desc);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		goto err_pm;
+
+	clk_lucid_5lpe_pll_configure(&video_pll0, regmap, &video_pll0_config);
+	clk_lucid_5lpe_pll_configure(&video_pll1, regmap, &video_pll1_config);
+
+	/*
+	 * Keep clocks always enabled:
+	 *	videocc_ahb_clk
+	 *	videocc_xo_clk
+	 */
+	regmap_update_bits(regmap, 0xe58, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0xeec, BIT(0), BIT(0));
+
+	ret = qcom_cc_really_probe(pdev, &videocc_sm8350_desc, regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register VIDEOCC clocks\n");
+		goto err_pm;
+	}
+
+	pm_runtime_put_sync(&pdev->dev);
+	dev_info(&pdev->dev, "Registered VIDEOCC clocks\n");
+
+	return ret;
+
+err_pm:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static const struct dev_pm_ops videocc_sm8350_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_cc_runtime_suspend, qcom_cc_runtime_resume, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static struct platform_driver videocc_sm8350_driver = {
+	.probe = videocc_sm8350_probe,
+	.driver = {
+		.name = "sm8350-videocc",
+		.of_match_table = videocc_sm8350_match_table,
+		.pm = &videocc_sm8350_pm_ops,
+	},
+};
+
+static int __init videocc_sm8350_init(void)
+{
+	return platform_driver_register(&videocc_sm8350_driver);
+}
+subsys_initcall(videocc_sm8350_init);
+
+static void __exit videocc_sm8350_exit(void)
+{
+	platform_driver_unregister(&videocc_sm8350_driver);
+}
+module_exit(videocc_sm8350_exit);
+
+MODULE_DESCRIPTION("QTI VIDEOCC SM8350 Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.30.2

