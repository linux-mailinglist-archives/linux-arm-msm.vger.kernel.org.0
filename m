Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD32528D2E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 19:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388034AbgJMRMg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 13:12:36 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:13635 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387995AbgJMRMd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 13:12:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602609150; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gYG1J87Mmx3jysvStjd92ZGtcGqJJTy0yqiv/uile/I=; b=MIvDe4Td4I8Zzh6U4RJw2R9b+JxEUapqY5jcPrpWGclthEDxEs6RF6nDTi2Lt+ewjubQEHnx
 SOD2GLYp6wyI50Z9jiN9bL2iy2bw4rQstAEJaDbVyS+55njUEZdgFBx7wl6dBLoDoe//aa/u
 AuEAnrO5vShidNLi04dQqLSSzvU=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f85dffdaad2c3cd1c36c9ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 17:12:29
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 17F86C433AD; Tue, 13 Oct 2020 17:12:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 55255C433F1;
        Tue, 13 Oct 2020 17:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 55255C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 3/3] clk: qcom: camcc: Add camera clock controller driver for SC7180
Date:   Tue, 13 Oct 2020 22:41:50 +0530
Message-Id: <1602609110-11504-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602609110-11504-1-git-send-email-tdas@codeaurora.org>
References: <1602609110-11504-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the camera clock controller found on SC7180 based devices.
This would allow camera drivers to probe and control their clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig        |    9 +
 drivers/clk/qcom/Makefile       |    1 +
 drivers/clk/qcom/camcc-sc7180.c | 1737 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 1747 insertions(+)
 create mode 100644 drivers/clk/qcom/camcc-sc7180.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 0583273..7aeebe6 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -290,6 +290,15 @@ config QCS_GCC_404
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.

+config SC_CAMCC_7180
+	tristate "SC7180 Camera Clock Controller"
+	select SC_GCC_7180
+	help
+	  Support for the camera clock controller on Qualcomm Technologies, Inc
+	  SC7180 devices.
+	  Say Y if you want to support camera devices and functionality such as
+	  capturing pictures.
+
 config SC_DISPCC_7180
 	tristate "SC7180 Display Clock Controller"
 	select SC_GCC_7180
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9677e76..8e0579f 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
+obj-$(CONFIG_SC_CAMCC_7180) += camcc-sc7180.o
 obj-$(CONFIG_SC_DISPCC_7180) += dispcc-sc7180.o
 obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
 obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
new file mode 100644
index 0000000..e954d21
--- /dev/null
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -0,0 +1,1737 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,camcc-sc7180.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	P_BI_TCXO,
+	P_CAM_CC_PLL0_OUT_EVEN,
+	P_CAM_CC_PLL1_OUT_EVEN,
+	P_CAM_CC_PLL2_OUT_AUX,
+	P_CAM_CC_PLL2_OUT_EARLY,
+	P_CAM_CC_PLL3_OUT_MAIN,
+	P_CORE_BI_PLL_TEST_SE,
+};
+
+static struct pll_vco agera_vco[] = {
+	{ 600000000, 3300000000, 0 },
+};
+
+static struct pll_vco fabia_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+/* 600MHz configuration */
+static const struct alpha_pll_config cam_cc_pll0_config = {
+	.l = 0x1F,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002067,
+	.test_ctl_val = 0x40000000,
+	.user_ctl_hi_val = 0x00004805,
+	.user_ctl_val = 0x00000001,
+};
+
+static struct clk_alpha_pll cam_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fabia_ops,
+		},
+	},
+};
+
+/* 860MHz configuration */
+static const struct alpha_pll_config cam_cc_pll1_config = {
+	.l = 0x2A,
+	.alpha = 0x1555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002067,
+	.test_ctl_val = 0x40000000,
+	.user_ctl_hi_val = 0x00004805,
+};
+
+static struct clk_alpha_pll cam_cc_pll1 = {
+	.offset = 0x1000,
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_pll1",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fabia_ops,
+		},
+	},
+};
+
+/* 1920MHz configuration */
+static const struct alpha_pll_config cam_cc_pll2_config = {
+	.l = 0x64,
+	.config_ctl_val = 0x20000800,
+	.config_ctl_hi_val = 0x400003D2,
+	.test_ctl_val = 0x04000400,
+	.test_ctl_hi_val = 0x00004000,
+	.user_ctl_val = 0x0000030F,
+};
+
+static struct clk_alpha_pll cam_cc_pll2 = {
+	.offset = 0x2000,
+	.vco_table = agera_vco,
+	.num_vco = ARRAY_SIZE(agera_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_AGERA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_pll2",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_agera_ops,
+		},
+	},
+};
+
+static struct clk_fixed_factor cam_cc_pll2_out_early = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_pll2_out_early",
+		.parent_names = (const char *[]){ "cam_cc_pll2" },
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll2_out_aux[] = {
+	{ 0x3, 4 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll2_out_aux = {
+	.offset = 0x2000,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_cam_cc_pll2_out_aux,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll2_out_aux),
+	.width = 2,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_AGERA],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_pll2_out_aux",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &cam_cc_pll2.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_ops,
+	},
+};
+
+/* 1080MHz configuration */
+static const struct alpha_pll_config cam_cc_pll3_config = {
+	.l = 0x38,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002067,
+	.test_ctl_val = 0x40000000,
+	.user_ctl_hi_val = 0x00004805,
+};
+
+static struct clk_alpha_pll cam_cc_pll3 = {
+	.offset = 0x3000,
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_pll3",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fabia_ops,
+		},
+	},
+};
+
+static const struct parent_map cam_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &cam_cc_pll1.clkr.hw },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map cam_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_AUX, 1 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &cam_cc_pll2_out_aux.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map cam_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_EARLY, 4 },
+	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_2[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &cam_cc_pll2_out_early.hw },
+	{ .hw = &cam_cc_pll3.clkr.hw },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map cam_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL2_OUT_EARLY, 4 },
+	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_3[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &cam_cc_pll1.clkr.hw },
+	{ .hw = &cam_cc_pll2_out_early.hw },
+	{ .hw = &cam_cc_pll3.clkr.hw },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map cam_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_4[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &cam_cc_pll3.clkr.hw },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map cam_cc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_5[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map cam_cc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_6[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &cam_cc_pll1.clkr.hw },
+	{ .hw = &cam_cc_pll3.clkr.hw },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
+	F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
+	F(360000000, P_CAM_CC_PLL3_OUT_MAIN, 3, 0, 0),
+	F(432000000, P_CAM_CC_PLL3_OUT_MAIN, 2.5, 0, 0),
+	F(480000000, P_CAM_CC_PLL2_OUT_EARLY, 2, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_bps_clk_src = {
+	.cmd_rcgr = 0x6010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_bps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_bps_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
+	F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
+	F(50000000, P_CAM_CC_PLL0_OUT_EVEN, 12, 0, 0),
+	F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cci_0_clk_src = {
+	.cmd_rcgr = 0xb0d8,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_5,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_cci_0_clk_src",
+		.parent_data = cam_cc_parent_data_5,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_cci_1_clk_src = {
+	.cmd_rcgr = 0xb14c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_5,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_cci_1_clk_src",
+		.parent_data = cam_cc_parent_data_5,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] = {
+	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
+	F(270000000, P_CAM_CC_PLL3_OUT_MAIN, 4, 0, 0),
+	F(360000000, P_CAM_CC_PLL3_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
+	.cmd_rcgr = 0x9064,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_cphy_rx_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_csi0phytimer_clk_src[] = {
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
+	.cmd_rcgr = 0x5004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_csi0phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
+	.cmd_rcgr = 0x5028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_csi1phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
+	.cmd_rcgr = 0x504c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_csi2phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
+	.cmd_rcgr = 0x5070,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_csi3phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_fast_ahb_clk_src[] = {
+	F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	F(404000000, P_CAM_CC_PLL1_OUT_EVEN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
+	.cmd_rcgr = 0x603c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_fast_ahb_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_icp_clk_src[] = {
+	F(240000000, P_CAM_CC_PLL0_OUT_EVEN, 2.5, 0, 0),
+	F(360000000, P_CAM_CC_PLL3_OUT_MAIN, 3, 0, 0),
+	F(432000000, P_CAM_CC_PLL3_OUT_MAIN, 2.5, 0, 0),
+	F(480000000, P_CAM_CC_PLL2_OUT_EARLY, 2, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_icp_clk_src = {
+	.cmd_rcgr = 0xb088,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_icp_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_icp_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_0_clk_src[] = {
+	F(240000000, P_CAM_CC_PLL0_OUT_EVEN, 2.5, 0, 0),
+	F(360000000, P_CAM_CC_PLL3_OUT_MAIN, 3, 0, 0),
+	F(432000000, P_CAM_CC_PLL3_OUT_MAIN, 2.5, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_0_clk_src = {
+	.cmd_rcgr = 0x9010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_4,
+	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_ife_0_clk_src",
+		.parent_data = cam_cc_parent_data_4,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_0_csid_clk_src[] = {
+	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
+	F(270000000, P_CAM_CC_PLL3_OUT_MAIN, 4, 0, 0),
+	F(360000000, P_CAM_CC_PLL3_OUT_MAIN, 3, 0, 0),
+	F(480000000, P_CAM_CC_PLL2_OUT_EARLY, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
+	.cmd_rcgr = 0x903c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_ife_0_csid_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_1_clk_src = {
+	.cmd_rcgr = 0xa010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_4,
+	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_ife_1_clk_src",
+		.parent_data = cam_cc_parent_data_4,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
+	.cmd_rcgr = 0xa034,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_ife_1_csid_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
+	.cmd_rcgr = 0xb004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_4,
+	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_ife_lite_clk_src",
+		.parent_data = cam_cc_parent_data_4,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
+	.cmd_rcgr = 0xb024,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_ife_lite_csid_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ipe_0_clk_src[] = {
+	F(240000000, P_CAM_CC_PLL0_OUT_EVEN, 2.5, 0, 0),
+	F(360000000, P_CAM_CC_PLL3_OUT_MAIN, 3, 0, 0),
+	F(432000000, P_CAM_CC_PLL3_OUT_MAIN, 2.5, 0, 0),
+	F(540000000, P_CAM_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
+	.cmd_rcgr = 0x7010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_ipe_0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_ipe_0_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_jpeg_clk_src[] = {
+	F(66666667, P_CAM_CC_PLL0_OUT_EVEN, 9, 0, 0),
+	F(133333333, P_CAM_CC_PLL0_OUT_EVEN, 4.5, 0, 0),
+	F(216000000, P_CAM_CC_PLL3_OUT_MAIN, 5, 0, 0),
+	F(320000000, P_CAM_CC_PLL2_OUT_EARLY, 3, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_jpeg_clk_src = {
+	.cmd_rcgr = 0xb04c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_jpeg_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_jpeg_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_lrme_clk_src[] = {
+	F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
+	F(216000000, P_CAM_CC_PLL3_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	F(404000000, P_CAM_CC_PLL1_OUT_EVEN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_lrme_clk_src = {
+	.cmd_rcgr = 0xb0f8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_6,
+	.freq_tbl = ftbl_cam_cc_lrme_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_lrme_clk_src",
+		.parent_data = cam_cc_parent_data_6,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_mclk0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24000000, P_CAM_CC_PLL2_OUT_AUX, 10, 1, 2),
+	F(64000000, P_CAM_CC_PLL2_OUT_AUX, 7.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_mclk0_clk_src = {
+	.cmd_rcgr = 0x4004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_mclk0_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk1_clk_src = {
+	.cmd_rcgr = 0x4024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_mclk1_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk2_clk_src = {
+	.cmd_rcgr = 0x4044,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_mclk2_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk3_clk_src = {
+	.cmd_rcgr = 0x4064,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_mclk3_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk4_clk_src = {
+	.cmd_rcgr = 0x4084,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_mclk4_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_slow_ahb_clk_src[] = {
+	F(80000000, P_CAM_CC_PLL0_OUT_EVEN, 7.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
+	.cmd_rcgr = 0x6058,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cam_cc_slow_ahb_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch cam_cc_bps_ahb_clk = {
+	.halt_reg = 0x6070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6070,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_bps_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_bps_areg_clk = {
+	.halt_reg = 0x6054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_bps_areg_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_bps_axi_clk = {
+	.halt_reg = 0x6038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_bps_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_bps_clk = {
+	.halt_reg = 0x6028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_bps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_bps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_axi_clk = {
+	.halt_reg = 0xb124,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb124,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_camnoc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_0_clk = {
+	.halt_reg = 0xb0f0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb0f0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_cci_0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_cci_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_1_clk = {
+	.halt_reg = 0xb164,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb164,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_cci_1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_cci_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_core_ahb_clk = {
+	.halt_reg = 0xb144,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0xb144,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_core_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cpas_ahb_clk = {
+	.halt_reg = 0xb11c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb11c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_cpas_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi0phytimer_clk = {
+	.halt_reg = 0x501c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x501c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_csi0phytimer_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_csi0phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi1phytimer_clk = {
+	.halt_reg = 0x5040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_csi1phytimer_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_csi1phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi2phytimer_clk = {
+	.halt_reg = 0x5064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5064,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_csi2phytimer_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_csi2phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi3phytimer_clk = {
+	.halt_reg = 0x5088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5088,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_csi3phytimer_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_csi3phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy0_clk = {
+	.halt_reg = 0x5020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_csiphy0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy1_clk = {
+	.halt_reg = 0x5044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_csiphy1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy2_clk = {
+	.halt_reg = 0x5068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5068,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_csiphy2_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy3_clk = {
+	.halt_reg = 0x508c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x508c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_csiphy3_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_clk = {
+	.halt_reg = 0xb0a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb0a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_icp_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_icp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_axi_clk = {
+	.halt_reg = 0x9080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_clk = {
+	.halt_reg = 0x9028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_cphy_rx_clk = {
+	.halt_reg = 0x907c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x907c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_0_cphy_rx_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_csid_clk = {
+	.halt_reg = 0x9054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_0_csid_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_ife_0_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_dsp_clk = {
+	.halt_reg = 0x9038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_0_dsp_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_axi_clk = {
+	.halt_reg = 0xa058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_1_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_clk = {
+	.halt_reg = 0xa028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_cphy_rx_clk = {
+	.halt_reg = 0xa054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_1_cphy_rx_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_csid_clk = {
+	.halt_reg = 0xa04c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa04c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_1_csid_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_ife_1_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_dsp_clk = {
+	.halt_reg = 0xa030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_1_dsp_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_clk = {
+	.halt_reg = 0xb01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_lite_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_ife_lite_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
+	.halt_reg = 0xb044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_lite_cphy_rx_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_csid_clk = {
+	.halt_reg = 0xb03c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb03c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ife_lite_csid_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_ife_lite_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_ahb_clk = {
+	.halt_reg = 0x7040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ipe_0_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_areg_clk = {
+	.halt_reg = 0x703c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x703c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ipe_0_areg_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_axi_clk = {
+	.halt_reg = 0x7038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ipe_0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_clk = {
+	.halt_reg = 0x7028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_ipe_0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_ipe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_jpeg_clk = {
+	.halt_reg = 0xb064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb064,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_jpeg_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_jpeg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_lrme_clk = {
+	.halt_reg = 0xb110,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb110,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_lrme_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_lrme_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk0_clk = {
+	.halt_reg = 0x401c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x401c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_mclk0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_mclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk1_clk = {
+	.halt_reg = 0x403c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x403c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_mclk1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_mclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk2_clk = {
+	.halt_reg = 0x405c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x405c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_mclk2_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_mclk2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk3_clk = {
+	.halt_reg = 0x407c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x407c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_mclk3_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_mclk3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk4_clk = {
+	.halt_reg = 0x409c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x409c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_mclk4_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &cam_cc_mclk4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_soc_ahb_clk = {
+	.halt_reg = 0xb140,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb140,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_soc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sys_tmr_clk = {
+	.halt_reg = 0xb0a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb0a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "cam_cc_sys_tmr_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc bps_gdsc = {
+	.gdscr = 0x6004,
+	.pd = {
+		.name = "bps_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
+};
+
+static struct gdsc ife_0_gdsc = {
+	.gdscr = 0x9004,
+	.pd = {
+		.name = "ife_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc ife_1_gdsc = {
+	.gdscr = 0xa004,
+	.pd = {
+		.name = "ife_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc ipe_0_gdsc = {
+	.gdscr = 0x7004,
+	.pd = {
+		.name = "ipe_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
+};
+
+static struct gdsc titan_top_gdsc = {
+	.gdscr = 0xb134,
+	.pd = {
+		.name = "titan_top_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct clk_hw *cam_cc_sc7180_hws[] = {
+	[CAM_CC_PLL2_OUT_EARLY] = &cam_cc_pll2_out_early.hw,
+};
+
+static struct clk_regmap *cam_cc_sc7180_clocks[] = {
+	[CAM_CC_BPS_AHB_CLK] = &cam_cc_bps_ahb_clk.clkr,
+	[CAM_CC_BPS_AREG_CLK] = &cam_cc_bps_areg_clk.clkr,
+	[CAM_CC_BPS_AXI_CLK] = &cam_cc_bps_axi_clk.clkr,
+	[CAM_CC_BPS_CLK] = &cam_cc_bps_clk.clkr,
+	[CAM_CC_BPS_CLK_SRC] = &cam_cc_bps_clk_src.clkr,
+	[CAM_CC_CAMNOC_AXI_CLK] = &cam_cc_camnoc_axi_clk.clkr,
+	[CAM_CC_CCI_0_CLK] = &cam_cc_cci_0_clk.clkr,
+	[CAM_CC_CCI_0_CLK_SRC] = &cam_cc_cci_0_clk_src.clkr,
+	[CAM_CC_CCI_1_CLK] = &cam_cc_cci_1_clk.clkr,
+	[CAM_CC_CCI_1_CLK_SRC] = &cam_cc_cci_1_clk_src.clkr,
+	[CAM_CC_CORE_AHB_CLK] = &cam_cc_core_ahb_clk.clkr,
+	[CAM_CC_CPAS_AHB_CLK] = &cam_cc_cpas_ahb_clk.clkr,
+	[CAM_CC_CPHY_RX_CLK_SRC] = &cam_cc_cphy_rx_clk_src.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK] = &cam_cc_csi0phytimer_clk.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK_SRC] = &cam_cc_csi0phytimer_clk_src.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK] = &cam_cc_csi1phytimer_clk.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK_SRC] = &cam_cc_csi1phytimer_clk_src.clkr,
+	[CAM_CC_CSI2PHYTIMER_CLK] = &cam_cc_csi2phytimer_clk.clkr,
+	[CAM_CC_CSI2PHYTIMER_CLK_SRC] = &cam_cc_csi2phytimer_clk_src.clkr,
+	[CAM_CC_CSI3PHYTIMER_CLK] = &cam_cc_csi3phytimer_clk.clkr,
+	[CAM_CC_CSI3PHYTIMER_CLK_SRC] = &cam_cc_csi3phytimer_clk_src.clkr,
+	[CAM_CC_CSIPHY0_CLK] = &cam_cc_csiphy0_clk.clkr,
+	[CAM_CC_CSIPHY1_CLK] = &cam_cc_csiphy1_clk.clkr,
+	[CAM_CC_CSIPHY2_CLK] = &cam_cc_csiphy2_clk.clkr,
+	[CAM_CC_CSIPHY3_CLK] = &cam_cc_csiphy3_clk.clkr,
+	[CAM_CC_FAST_AHB_CLK_SRC] = &cam_cc_fast_ahb_clk_src.clkr,
+	[CAM_CC_ICP_CLK] = &cam_cc_icp_clk.clkr,
+	[CAM_CC_ICP_CLK_SRC] = &cam_cc_icp_clk_src.clkr,
+	[CAM_CC_IFE_0_AXI_CLK] = &cam_cc_ife_0_axi_clk.clkr,
+	[CAM_CC_IFE_0_CLK] = &cam_cc_ife_0_clk.clkr,
+	[CAM_CC_IFE_0_CLK_SRC] = &cam_cc_ife_0_clk_src.clkr,
+	[CAM_CC_IFE_0_CPHY_RX_CLK] = &cam_cc_ife_0_cphy_rx_clk.clkr,
+	[CAM_CC_IFE_0_CSID_CLK] = &cam_cc_ife_0_csid_clk.clkr,
+	[CAM_CC_IFE_0_CSID_CLK_SRC] = &cam_cc_ife_0_csid_clk_src.clkr,
+	[CAM_CC_IFE_0_DSP_CLK] = &cam_cc_ife_0_dsp_clk.clkr,
+	[CAM_CC_IFE_1_AXI_CLK] = &cam_cc_ife_1_axi_clk.clkr,
+	[CAM_CC_IFE_1_CLK] = &cam_cc_ife_1_clk.clkr,
+	[CAM_CC_IFE_1_CLK_SRC] = &cam_cc_ife_1_clk_src.clkr,
+	[CAM_CC_IFE_1_CPHY_RX_CLK] = &cam_cc_ife_1_cphy_rx_clk.clkr,
+	[CAM_CC_IFE_1_CSID_CLK] = &cam_cc_ife_1_csid_clk.clkr,
+	[CAM_CC_IFE_1_CSID_CLK_SRC] = &cam_cc_ife_1_csid_clk_src.clkr,
+	[CAM_CC_IFE_1_DSP_CLK] = &cam_cc_ife_1_dsp_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK] = &cam_cc_ife_lite_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK_SRC] = &cam_cc_ife_lite_clk_src.clkr,
+	[CAM_CC_IFE_LITE_CPHY_RX_CLK] = &cam_cc_ife_lite_cphy_rx_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK] = &cam_cc_ife_lite_csid_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK_SRC] = &cam_cc_ife_lite_csid_clk_src.clkr,
+	[CAM_CC_IPE_0_AHB_CLK] = &cam_cc_ipe_0_ahb_clk.clkr,
+	[CAM_CC_IPE_0_AREG_CLK] = &cam_cc_ipe_0_areg_clk.clkr,
+	[CAM_CC_IPE_0_AXI_CLK] = &cam_cc_ipe_0_axi_clk.clkr,
+	[CAM_CC_IPE_0_CLK] = &cam_cc_ipe_0_clk.clkr,
+	[CAM_CC_IPE_0_CLK_SRC] = &cam_cc_ipe_0_clk_src.clkr,
+	[CAM_CC_JPEG_CLK] = &cam_cc_jpeg_clk.clkr,
+	[CAM_CC_JPEG_CLK_SRC] = &cam_cc_jpeg_clk_src.clkr,
+	[CAM_CC_LRME_CLK] = &cam_cc_lrme_clk.clkr,
+	[CAM_CC_LRME_CLK_SRC] = &cam_cc_lrme_clk_src.clkr,
+	[CAM_CC_MCLK0_CLK] = &cam_cc_mclk0_clk.clkr,
+	[CAM_CC_MCLK0_CLK_SRC] = &cam_cc_mclk0_clk_src.clkr,
+	[CAM_CC_MCLK1_CLK] = &cam_cc_mclk1_clk.clkr,
+	[CAM_CC_MCLK1_CLK_SRC] = &cam_cc_mclk1_clk_src.clkr,
+	[CAM_CC_MCLK2_CLK] = &cam_cc_mclk2_clk.clkr,
+	[CAM_CC_MCLK2_CLK_SRC] = &cam_cc_mclk2_clk_src.clkr,
+	[CAM_CC_MCLK3_CLK] = &cam_cc_mclk3_clk.clkr,
+	[CAM_CC_MCLK3_CLK_SRC] = &cam_cc_mclk3_clk_src.clkr,
+	[CAM_CC_MCLK4_CLK] = &cam_cc_mclk4_clk.clkr,
+	[CAM_CC_MCLK4_CLK_SRC] = &cam_cc_mclk4_clk_src.clkr,
+	[CAM_CC_PLL0] = &cam_cc_pll0.clkr,
+	[CAM_CC_PLL1] = &cam_cc_pll1.clkr,
+	[CAM_CC_PLL2] = &cam_cc_pll2.clkr,
+	[CAM_CC_PLL2_OUT_AUX] = &cam_cc_pll2_out_aux.clkr,
+	[CAM_CC_PLL3] = &cam_cc_pll3.clkr,
+	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
+	[CAM_CC_SOC_AHB_CLK] = &cam_cc_soc_ahb_clk.clkr,
+	[CAM_CC_SYS_TMR_CLK] = &cam_cc_sys_tmr_clk.clkr,
+};
+static struct gdsc *cam_cc_sc7180_gdscs[] = {
+	[BPS_GDSC] = &bps_gdsc,
+	[IFE_0_GDSC] = &ife_0_gdsc,
+	[IFE_1_GDSC] = &ife_1_gdsc,
+	[IPE_0_GDSC] = &ipe_0_gdsc,
+	[TITAN_TOP_GDSC] = &titan_top_gdsc,
+};
+
+static const struct regmap_config cam_cc_sc7180_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xd028,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc cam_cc_sc7180_desc = {
+	.config = &cam_cc_sc7180_regmap_config,
+	.clk_hws = cam_cc_sc7180_hws,
+	.num_clk_hws = ARRAY_SIZE(cam_cc_sc7180_hws),
+	.clks = cam_cc_sc7180_clocks,
+	.num_clks = ARRAY_SIZE(cam_cc_sc7180_clocks),
+	.gdscs = cam_cc_sc7180_gdscs,
+	.num_gdscs = ARRAY_SIZE(cam_cc_sc7180_gdscs),
+};
+
+static const struct of_device_id cam_cc_sc7180_match_table[] = {
+	{ .compatible = "qcom,sc7180-camcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cam_cc_sc7180_match_table);
+
+static int cam_cc_sc7180_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(&pdev->dev, "xo");
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to acquire XO clock\n");
+		goto disable_pm_runtime;
+	}
+
+	ret = pm_clk_add(&pdev->dev, "iface");
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to acquire iface clock\n");
+		goto disable_pm_runtime;
+	}
+
+	ret = pm_clk_runtime_resume(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "pm runtime resume failed\n");
+		goto destroy_pm_clk;
+	}
+
+	regmap = qcom_cc_map(pdev, &cam_cc_sc7180_desc);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		goto destroy_pm_clk;
+	}
+
+	clk_fabia_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
+	clk_fabia_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
+	clk_agera_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
+	clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
+
+	ret = qcom_cc_really_probe(pdev, &cam_cc_sc7180_desc, regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
+		goto suspend_pm_runtime;
+	}
+
+suspend_pm_runtime:
+	ret = pm_clk_runtime_suspend(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "pm runtime suspend failed\n");
+
+	return 0;
+
+destroy_pm_clk:
+	pm_clk_destroy(&pdev->dev);
+
+disable_pm_runtime:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static const struct dev_pm_ops cam_cc_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver cam_cc_sc7180_driver = {
+	.probe = cam_cc_sc7180_probe,
+	.driver = {
+		.name = "cam_cc-sc7180",
+		.of_match_table = cam_cc_sc7180_match_table,
+		.pm = &cam_cc_pm_ops,
+	},
+};
+
+static int __init cam_cc_sc7180_init(void)
+{
+	return platform_driver_register(&cam_cc_sc7180_driver);
+}
+subsys_initcall(cam_cc_sc7180_init);
+
+static void __exit cam_cc_sc7180_exit(void)
+{
+	platform_driver_unregister(&cam_cc_sc7180_driver);
+}
+module_exit(cam_cc_sc7180_exit);
+
+MODULE_DESCRIPTION("QTI CAM_CC SC7180 Driver");
+MODULE_LICENSE("GPL v2");
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

