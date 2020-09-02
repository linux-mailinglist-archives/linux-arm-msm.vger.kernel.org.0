Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602CF25A3E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 05:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgIBDPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 23:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgIBDPD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 23:15:03 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52EFC061251
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 20:15:01 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id s15so1591358qvv.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cg0OjluGmrvlA0ToHyqwYplHDQ7mEtsmb4qb2ONLtBc=;
        b=RW5CxYCvXnkhNB7/KpkragMWHyfcBPtNT+08Fl1VyqA57ZP/xVdf6Vc7gl5NzeAla6
         gcZJLrYcI5hofg9nL2KxJ9rbXKHr51xkDvtPlzVIvQ7Elv8puOzVXNjFI7ChbyQe+h9N
         wjw9FmQNzlCi7LHUnD934DAYN3G1FgeTqmG6k90aZ3ChyMhE2NdSZM4CoKo8yV2WsW+V
         oasFtN73E5W94lUPAmBxX+up0+4YSnwE9oft2PkgkPpO01vWygFvbDFsQ8h9xdVkyncu
         etEzzmKgizbGbaeWDkgbyvo6yaQ1+byPwCaLtY8KHY7FhPlXLjJv9b4zZRdPq6mmRbaz
         eJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cg0OjluGmrvlA0ToHyqwYplHDQ7mEtsmb4qb2ONLtBc=;
        b=R2AhHVNBAnvFLoW5Wh7DwT21fbT0GJl8Qa423xVL8jjFX4qDeL1/eJqw7VrSJOw2wA
         x/bUSd2TFhwe4rO3Y9QsML3zWx5m4P9u3Ec+n9bAjplaTtZzC7jbYs9uvHCkVS9ClEV4
         Ap15EZzVzgxfGSKg/COJobFr+ui7HG/Ys5LE6leeVtO5roUIjrWZlZwn9MqXyfbmjmI7
         eiYXLgrDJFbqwnFXhg2jHLDPq19bbtmU92l7OyXfcAvUQq4d+X3RJQri+TZL5bys1JvN
         5nQWJ5xNPUIK1n3ymeZLeUS7PxQ5Iyo9bQpORk8BQtas5NJueLxBuq2w3kKe/WYfOmNC
         yn/A==
X-Gm-Message-State: AOAM5315oPaTcr52DPh17USrZr8rtuj+EvVWloEqnfJgmwqivgro29P0
        jG2BkdBBac39pek+hqvKf3MG/yGHMYfX4YveEY0=
X-Google-Smtp-Source: ABdhPJzhNUQssOkSMDNLKhQol8U6GdEt6q8mrjclbrlW37uHMa53hwT/CJIhDRpv3Ova5jx9oHC7dg==
X-Received: by 2002:ad4:5364:: with SMTP id e4mr602140qvv.155.1599016500775;
        Tue, 01 Sep 2020 20:15:00 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q35sm3755649qtd.75.2020.09.01.20.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 20:15:00 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 5/5] clk: qcom: add video clock controller driver for SM8250
Date:   Tue,  1 Sep 2020 23:13:55 -0400
Message-Id: <20200902031359.6703-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200902031359.6703-1-jonathan@marek.ca>
References: <20200902031359.6703-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the video clock controller found on SM8250 based devices.

Derived from the downstream driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/Kconfig          |   9 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sm8250.c | 516 ++++++++++++++++++++++++++++++
 3 files changed, 526 insertions(+)
 create mode 100644 drivers/clk/qcom/videocc-sm8250.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 40d7ee9886c9..95efa38211d5 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -453,6 +453,15 @@ config SM_VIDEOCC_8150
 	  Say Y if you want to support video devices and functionality such as
 	  video encode and decode.
 
+config SM_VIDEOCC_8250
+	tristate "SM8250 Video Clock Controller"
+	select SDM_GCC_8250
+	select QCOM_GDSC
+	help
+	  Support for the video clock controller on SM8250 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config SPMI_PMIC_CLKDIV
 	tristate "SPMI PMIC clkdiv Support"
 	depends on SPMI || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6f4c580d2728..55fb20800b66 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
 obj-$(CONFIG_SM_GPUCC_8150) += gpucc-sm8150.o
 obj-$(CONFIG_SM_GPUCC_8250) += gpucc-sm8250.o
 obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
+obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
new file mode 100644
index 000000000000..9fa3bd0b359b
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -0,0 +1,516 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,videocc-sm8250.h>
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
+	P_CHIP_SLEEP_CLK,
+	P_CORE_BI_PLL_TEST_SE,
+	P_VIDEO_PLL0_OUT_MAIN,
+	P_VIDEO_PLL1_OUT_MAIN,
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo_ao" },
+};
+
+static struct pll_vco lucid_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static const struct alpha_pll_config video_pll0_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0x329A699C,
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
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config video_pll1_config = {
+	.l = 0x2B,
+	.alpha = 0xC000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0x329A699C,
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
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &video_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &video_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(720000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0xb94,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
+	F(840000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs1_clk_src = {
+	.cmd_rcgr = 0xbb4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "video_cc_mvs1_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0xd54,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0xc54,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "video_cc_mvs0c_div2_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
+	.reg = 0xdd4,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "video_cc_mvs1_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
+	.reg = 0xcf4,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "video_cc_mvs1c_div2_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0xbd4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0xecc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch video_cc_ahb_clk = {
+	.halt_reg = 0xe58,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xe58,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0xd34,
+	.halt_check = BRANCH_HALT_SKIP, /* TODO: hw gated ? */
+	.clkr = {
+		.enable_reg = 0xd34,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_mvs0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0xc34,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xc34,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_mvs0c_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_clk = {
+	.halt_reg = 0xdb4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xdb4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_mvs1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_mvs1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_div2_clk = {
+	.halt_reg = 0xdf4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xdf4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_mvs1_div2_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1c_clk = {
+	.halt_reg = 0xcd4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xcd4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_mvs1c_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_xo_clk = {
+	.halt_reg = 0xeec,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xeec,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_xo_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
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
+};
+
+static struct gdsc mvs1c_gdsc = {
+	.gdscr = 0xc98,
+	.pd = {
+		.name = "mvs1c_gdsc",
+	},
+	.flags = 0,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc mvs0_gdsc = {
+	.gdscr = 0xd18,
+	.pd = {
+		.name = "mvs0_gdsc",
+	},
+	.flags = HW_CTRL,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc mvs1_gdsc = {
+	.gdscr = 0xd98,
+	.pd = {
+		.name = "mvs1_gdsc",
+	},
+	.flags = HW_CTRL,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct clk_regmap *video_cc_sm8250_clocks[] = {
+	[VIDEO_CC_AHB_CLK] = &video_cc_ahb_clk.clkr,
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
+	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
+	[VIDEO_CC_MVS1_DIV2_CLK] = &video_cc_mvs1_div2_clk.clkr,
+	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
+	[VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
+	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
+	[VIDEO_CC_XO_CLK] = &video_cc_xo_clk.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+	[VIDEO_CC_PLL0] = &video_pll0.clkr,
+	[VIDEO_CC_PLL1] = &video_pll1.clkr,
+};
+
+static const struct qcom_reset_map video_cc_sm8250_resets[] = {
+	[VIDEO_CC_CVP_INTERFACE_BCR] = { 0xe54 },
+	[VIDEO_CC_CVP_MVS0_BCR] = { 0xd14 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0xc34, 2 },
+	[VIDEO_CC_CVP_MVS0C_BCR] = { 0xbf4 },
+	[VIDEO_CC_CVP_MVS1_BCR] = { 0xd94 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0xcd4, 2 },
+	[VIDEO_CC_CVP_MVS1C_BCR] = { 0xc94 },
+};
+
+static struct gdsc *video_cc_sm8250_gdscs[] = {
+	[MVS0C_GDSC] = &mvs0c_gdsc,
+	[MVS1C_GDSC] = &mvs1c_gdsc,
+	[MVS0_GDSC] = &mvs0_gdsc,
+	[MVS1_GDSC] = &mvs1_gdsc,
+};
+
+static const struct regmap_config video_cc_sm8250_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf4c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc video_cc_sm8250_desc = {
+	.config = &video_cc_sm8250_regmap_config,
+	.clks = video_cc_sm8250_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_sm8250_clocks),
+	.resets = video_cc_sm8250_resets,
+	.num_resets = ARRAY_SIZE(video_cc_sm8250_resets),
+	.gdscs = video_cc_sm8250_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_sm8250_gdscs),
+};
+
+static const struct of_device_id video_cc_sm8250_match_table[] = {
+	{ .compatible = "qcom,sm8250-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_sm8250_match_table);
+
+static int video_cc_sm8250_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &video_cc_sm8250_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
+	clk_lucid_pll_configure(&video_pll1, regmap, &video_pll1_config);
+
+	return qcom_cc_really_probe(pdev, &video_cc_sm8250_desc, regmap);
+}
+
+static struct platform_driver video_cc_sm8250_driver = {
+	.probe	= video_cc_sm8250_probe,
+	.driver	= {
+		.name = "sm8250-videocc",
+		.of_match_table = video_cc_sm8250_match_table,
+	},
+};
+
+static int __init video_cc_sm8250_init(void)
+{
+	return platform_driver_register(&video_cc_sm8250_driver);
+}
+subsys_initcall(video_cc_sm8250_init);
+
+static void __exit video_cc_sm8250_exit(void)
+{
+	platform_driver_unregister(&video_cc_sm8250_driver);
+}
+module_exit(video_cc_sm8250_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("QTI VIDEOCC SM8250 Driver");
-- 
2.26.1

