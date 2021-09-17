Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD89F40F047
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 05:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243794AbhIQDSV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 23:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243799AbhIQDST (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 23:18:19 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443B0C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:16:55 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q68so8218002pga.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qeI4HEbliDaqCBnlmsBz4bDVfc1w3kJKEIktEfo5CvM=;
        b=yg/WfgTKCRsvzkKhegXbH/17MHsjGu74bN0QV8d0NrQ15p8U2RqlegNa8LA04FdrY2
         j744C7zNiI7ljsUomz8pFZ1kPYlzQulgBtKqTV6T5w197VkwBJ6fPlr9FzoZjiA4QEOf
         hJ3DFE2Cr1qu6VSz13IpfiGgTTL7epXGlzVqlS3ioF6YNauiW6xMj5w4iSU9DV+I08S7
         oHefWi32FA9JbRB3j257qSloVo+A3uxhX4yJhvdpymkupdWhtrcBxdEJGxE+DBUHCy6X
         4qukMzsspPo9xJ+4togV49YU2/L2j8/ar4yZuDzRGt/LtJB1eHi/uwzuG3vgmJWqTVqU
         ebBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qeI4HEbliDaqCBnlmsBz4bDVfc1w3kJKEIktEfo5CvM=;
        b=0jDUGNyybUSEwDv8ZF41uPaHqq667O2bEx0xh6FjegSLhB+f6w944WE12Yt65wRk5T
         PrzbmUtb+ghs5cX14YMdCHM6CLbw1nXW99hcmGqAgTBrS5+JdZy69b+x7ayAT2WwYr9q
         PH8IiWf+UCeeddcQ0wXi+lFhpJY89bnd3WdRi8oryctJCaNka47pTIzwHDpcPcpg/iDo
         xyAVVtxzBiFkxOQQm6VErUiDnK/ajvMyn3/gxarGG5qt6K7fnYTIMKQQKnoP4uV/RnFa
         eudk3uy90FDKBPgxGV2R+2lOtYTPY9PdHYv/K9+163267SSyrRO6DtwxZNHmtgnHMvQC
         nPIA==
X-Gm-Message-State: AOAM530L++9xv3ZlNhiAfvakg7emeMPTfXcD06TZ1Prx8dUM+1Vzx+FV
        X8Z8/ta/fA4vuO+1UWVUtVNBnQ==
X-Google-Smtp-Source: ABdhPJzpDncX+qEAuSk/VxWmkM8V0gmF1omXQZZUvYHvdaiqKUqqXpqBrDHs0l/XSgPOUiCmEOyrAw==
X-Received: by 2002:a63:4b24:: with SMTP id y36mr7998397pga.230.1631848614049;
        Thu, 16 Sep 2021 20:16:54 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id k3sm8823034pjg.43.2021.09.16.20.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 20:16:53 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 2/2] clk: qcom: Add Global Clock Controller driver for QCM2290
Date:   Fri, 17 Sep 2021 11:16:38 +0800
Message-Id: <20210917031638.27679-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917031638.27679-1-shawn.guo@linaro.org>
References: <20210917031638.27679-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Global Clock Controller (GCC) driver for QCM2290.  This is a porting
of gcc-scuba driver from CAF msm-4.19.  Because the alpha_pll on the
platform has a different register layout (offsets), its own
clk_alpha_pll_regs_offset[] is used in the driver.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/Kconfig                     |    7 +
 drivers/clk/qcom/Makefile                    |    1 +
 drivers/clk/qcom/gcc-qcm2290.c               | 2965 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-qcm2290.h |  178 ++
 4 files changed, 3151 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-qcm2290.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-qcm2290.h

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 0a5596797b93..738ae8b9e21e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -324,6 +324,13 @@ config MSM_MMCC_8998
 	  Say Y if you want to support multimedia devices such as display,
 	  graphics, video encode/decode, camera, etc.
 
+config QCM_GCC_2290
+	tristate "QCM2290 Global Clock Controller"
+	help
+	  Support for the global clock controller on QCM2290 devices.
+	  Say Y if you want to use multimedia devices or peripheral
+	  devices such as UART, SPI, I2C, USB, SD/eMMC etc.
+
 config QCS_GCC_404
 	tristate "QCS404 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9825ef843f4a..d2706d912103 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_QCOM_CLK_APCS_SDX55) += apcs-sdx55.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
+obj-$(CONFIG_QCM_GCC_2290) += gcc-qcm2290.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
new file mode 100644
index 000000000000..b4ef53739c10
--- /dev/null
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -0,0 +1,2965 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_AUX2,
+	P_GPLL0_OUT_EARLY,
+	P_GPLL10_OUT_MAIN,
+	P_GPLL11_OUT_AUX,
+	P_GPLL11_OUT_AUX2,
+	P_GPLL11_OUT_MAIN,
+	P_GPLL3_OUT_EARLY,
+	P_GPLL3_OUT_MAIN,
+	P_GPLL4_OUT_MAIN,
+	P_GPLL5_OUT_MAIN,
+	P_GPLL6_OUT_EARLY,
+	P_GPLL6_OUT_MAIN,
+	P_GPLL7_OUT_MAIN,
+	P_GPLL8_OUT_EARLY,
+	P_GPLL8_OUT_MAIN,
+	P_GPLL9_OUT_EARLY,
+	P_GPLL9_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static struct pll_vco brammo_vco[] = {
+	{ 500000000, 1250000000, 0 },
+};
+
+static struct pll_vco default_vco[] = {
+	{ 500000000, 1000000000, 2 },
+};
+
+static struct pll_vco spark_vco[] = {
+	{ 750000000, 1500000000, 1 },
+};
+
+static const u8 clk_alpha_pll_regs_offset[][PLL_OFF_MAX_REGS] = {
+	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_ALPHA_VAL_U] = 0x0c,
+		[PLL_OFF_TEST_CTL] = 0x10,
+		[PLL_OFF_TEST_CTL_U] = 0x14,
+		[PLL_OFF_USER_CTL] = 0x18,
+		[PLL_OFF_USER_CTL_U] = 0x1C,
+		[PLL_OFF_CONFIG_CTL] = 0x20,
+		[PLL_OFF_STATUS] = 0x24,
+	},
+	[CLK_ALPHA_PLL_TYPE_BRAMMO] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_ALPHA_VAL_U] = 0x0c,
+		[PLL_OFF_TEST_CTL] = 0x10,
+		[PLL_OFF_TEST_CTL_U] = 0x14,
+		[PLL_OFF_USER_CTL] = 0x18,
+		[PLL_OFF_CONFIG_CTL] = 0x1C,
+		[PLL_OFF_STATUS] = 0x20,
+	},
+};
+
+static struct clk_alpha_pll gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpll0_out_aux2[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpll0_out_aux2 = {
+	.offset = 0x0,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_gpll0_out_aux2,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpll0_out_aux2),
+	.width = 4,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll0_out_aux2",
+		.parent_hws = (const struct clk_hw *[]){ &gpll0.clkr.hw },
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll1 = {
+	.offset = 0x1000,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll1",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+/* 1152MHz configuration */
+static const struct alpha_pll_config gpll10_config = {
+	.l = 0x3c,
+	.alpha = 0x0,
+	.vco_val = 0x1 << 20,
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.config_ctl_val = 0x4001055B,
+	.test_ctl_hi1_val = 0x1,
+};
+
+static struct clk_alpha_pll gpll10 = {
+	.offset = 0xa000,
+	.vco_table = spark_vco,
+	.num_vco = ARRAY_SIZE(spark_vco),
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll10",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+/* 532MHz configuration */
+static const struct alpha_pll_config gpll11_config = {
+	.l = 0x1B,
+	.alpha = 0x55555555,
+	.alpha_hi = 0xB5,
+	.alpha_en_mask = BIT(24),
+	.vco_val = 0x2 << 20,
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.config_ctl_val = 0x4001055B,
+	.test_ctl_hi1_val = 0x1,
+};
+
+static struct clk_alpha_pll gpll11 = {
+	.offset = 0xb000,
+	.vco_table = default_vco,
+	.num_vco = ARRAY_SIZE(default_vco),
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll11",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll3 = {
+	.offset = 0x3000,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll3",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpll3_out_main[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpll3_out_main = {
+	.offset = 0x3000,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_gpll3_out_main,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpll3_out_main),
+	.width = 4,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll3_out_main",
+		.parent_hws = (const struct clk_hw *[]){ &gpll3.clkr.hw },
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll4 = {
+	.offset = 0x4000,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll4",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll5 = {
+	.offset = 0x5000,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll5",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll6 = {
+	.offset = 0x6000,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll6",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpll6_out_main[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpll6_out_main = {
+	.offset = 0x6000,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_gpll6_out_main,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpll6_out_main),
+	.width = 4,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll6_out_main",
+		.parent_hws = (const struct clk_hw *[]){ &gpll6.clkr.hw },
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll7 = {
+	.offset = 0x7000,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll7",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+/* 533.2MHz configuration */
+static const struct alpha_pll_config gpll8_config = {
+	.l = 0x1B,
+	.alpha = 0x55555555,
+	.alpha_hi = 0xC5,
+	.alpha_en_mask = BIT(24),
+	.vco_val = 0x2 << 20,
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.early_output_mask = BIT(3),
+	.post_div_val = 0x1 << 8,
+	.post_div_mask = GENMASK(11, 8),
+	.config_ctl_val = 0x4001055B,
+	.test_ctl_hi1_val = 0x1,
+};
+
+static struct clk_alpha_pll gpll8 = {
+	.offset = 0x8000,
+	.vco_table = default_vco,
+	.num_vco = ARRAY_SIZE(default_vco),
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(8),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll8",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpll8_out_main[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpll8_out_main = {
+	.offset = 0x8000,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_gpll8_out_main,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpll8_out_main),
+	.width = 4,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll8_out_main",
+		.parent_hws = (const struct clk_hw *[]){ &gpll8.clkr.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+/* 1152MHz configuration */
+static const struct alpha_pll_config gpll9_config = {
+	.l = 0x3C,
+	.alpha = 0x0,
+	.post_div_val = 0x1 << 8,
+	.post_div_mask = GENMASK(9, 8),
+	.main_output_mask = BIT(0),
+	.early_output_mask = BIT(3),
+	.config_ctl_val = 0x00004289,
+	.test_ctl_val = 0x08000000,
+};
+
+static struct clk_alpha_pll gpll9 = {
+	.offset = 0x9000,
+	.vco_table = brammo_vco,
+	.num_vco = ARRAY_SIZE(brammo_vco),
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_BRAMMO],
+	.clkr = {
+		.enable_reg = 0x79000,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll9",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpll9_out_main[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpll9_out_main = {
+	.offset = 0x9000,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_gpll9_out_main,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpll9_out_main),
+	.width = 2,
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_BRAMMO],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll9_out_main",
+		.parent_hws = (const struct clk_hw *[]){ &gpll9.clkr.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static const struct parent_map gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL0_OUT_AUX2, 2 },
+};
+
+static const struct clk_parent_data gcc_parents_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_aux2.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL0_OUT_AUX2, 2 },
+	{ P_GPLL6_OUT_MAIN, 4 },
+};
+
+static const struct clk_parent_data gcc_parents_1[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_aux2.clkr.hw },
+	{ .hw = &gpll6_out_main.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL0_OUT_AUX2, 2 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data gcc_parents_2[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_aux2.clkr.hw },
+	{ .fw_name = "sleep_clk" },
+};
+
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL9_OUT_EARLY, 2 },
+	{ P_GPLL10_OUT_MAIN, 3 },
+	{ P_GPLL9_OUT_MAIN, 5 },
+	{ P_GPLL3_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data gcc_parents_3[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll9.clkr.hw },
+	{ .hw = &gpll10.clkr.hw },
+	{ .hw = &gpll9_out_main.clkr.hw },
+	{ .hw = &gpll3_out_main.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL0_OUT_AUX2, 2 },
+	{ P_GPLL10_OUT_MAIN, 3 },
+	{ P_GPLL4_OUT_MAIN, 5 },
+	{ P_GPLL3_OUT_EARLY, 6 },
+};
+
+static const struct clk_parent_data gcc_parents_4[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_aux2.clkr.hw },
+	{ .hw = &gpll10.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+	{ .hw = &gpll3.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL0_OUT_AUX2, 2 },
+	{ P_GPLL4_OUT_MAIN, 5 },
+	{ P_GPLL3_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data gcc_parents_5[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_aux2.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+	{ .hw = &gpll3_out_main.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL8_OUT_EARLY, 2 },
+	{ P_GPLL10_OUT_MAIN, 3 },
+	{ P_GPLL8_OUT_MAIN, 4 },
+	{ P_GPLL9_OUT_MAIN, 5 },
+	{ P_GPLL3_OUT_EARLY, 6 },
+};
+
+static const struct clk_parent_data gcc_parents_6[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll8.clkr.hw },
+	{ .hw = &gpll10.clkr.hw },
+	{ .hw = &gpll8_out_main.clkr.hw },
+	{ .hw = &gpll9_out_main.clkr.hw },
+	{ .hw = &gpll3.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL8_OUT_EARLY, 2 },
+	{ P_GPLL10_OUT_MAIN, 3 },
+	{ P_GPLL8_OUT_MAIN, 4 },
+	{ P_GPLL9_OUT_MAIN, 5 },
+	{ P_GPLL3_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data gcc_parents_7[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll8.clkr.hw },
+	{ .hw = &gpll10.clkr.hw },
+	{ .hw = &gpll8_out_main.clkr.hw },
+	{ .hw = &gpll9_out_main.clkr.hw },
+	{ .hw = &gpll3_out_main.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_8[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL8_OUT_EARLY, 2 },
+	{ P_GPLL10_OUT_MAIN, 3 },
+	{ P_GPLL6_OUT_MAIN, 4 },
+	{ P_GPLL9_OUT_MAIN, 5 },
+	{ P_GPLL3_OUT_EARLY, 6 },
+};
+
+static const struct clk_parent_data gcc_parents_8[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll8.clkr.hw },
+	{ .hw = &gpll10.clkr.hw },
+	{ .hw = &gpll6_out_main.clkr.hw },
+	{ .hw = &gpll9_out_main.clkr.hw },
+	{ .hw = &gpll3.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_9[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL0_OUT_AUX2, 2 },
+	{ P_GPLL10_OUT_MAIN, 3 },
+	{ P_GPLL8_OUT_MAIN, 4 },
+	{ P_GPLL9_OUT_MAIN, 5 },
+	{ P_GPLL3_OUT_EARLY, 6 },
+};
+
+static const struct clk_parent_data gcc_parents_9[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_aux2.clkr.hw },
+	{ .hw = &gpll10.clkr.hw },
+	{ .hw = &gpll8_out_main.clkr.hw },
+	{ .hw = &gpll9_out_main.clkr.hw },
+	{ .hw = &gpll3.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_10[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL8_OUT_EARLY, 2 },
+	{ P_GPLL10_OUT_MAIN, 3 },
+	{ P_GPLL6_OUT_EARLY, 5 },
+	{ P_GPLL3_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data gcc_parents_10[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll8.clkr.hw },
+	{ .hw = &gpll10.clkr.hw },
+	{ .hw = &gpll6.clkr.hw },
+	{ .hw = &gpll3_out_main.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_12[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_EARLY, 1 },
+	{ P_GPLL0_OUT_AUX2, 2 },
+	{ P_GPLL7_OUT_MAIN, 3 },
+	{ P_GPLL4_OUT_MAIN, 5 },
+};
+
+static const struct clk_parent_data gcc_parents_12[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_aux2.clkr.hw },
+	{ .hw = &gpll7.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_13[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data gcc_parents_13[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "sleep_clk" },
+};
+
+static const struct parent_map gcc_parent_map_14[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL11_OUT_MAIN, 1 },
+	{ P_GPLL11_OUT_AUX, 2 },
+	{ P_GPLL11_OUT_AUX2, 3 },
+};
+
+static const struct clk_parent_data gcc_parents_14[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll11.clkr.hw },
+	{ .hw = &gpll11.clkr.hw },
+	{ .hw = &gpll11.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_gcc_usb30_prim_mock_utmi_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x1a034,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_usb30_prim_mock_utmi_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb30_prim_mock_utmi_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv = {
+	.reg = 0x1a04c,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gcc_usb30_prim_mock_utmi_postdiv",
+		.parent_hws = (const struct clk_hw *[])
+				{ &gcc_usb30_prim_mock_utmi_clk_src.clkr.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_camss_axi_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(150000000, P_GPLL0_OUT_AUX2, 2, 0, 0),
+	F(200000000, P_GPLL0_OUT_AUX2, 1.5, 0, 0),
+	F(300000000, P_GPLL0_OUT_AUX2, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_camss_axi_clk_src = {
+	.cmd_rcgr = 0x5802c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_gcc_camss_axi_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_axi_clk_src",
+		.parent_data = gcc_parents_4,
+		.num_parents = ARRAY_SIZE(gcc_parents_4),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_camss_cci_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(37500000, P_GPLL0_OUT_AUX2, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_camss_cci_clk_src = {
+	.cmd_rcgr = 0x56000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_9,
+	.freq_tbl = ftbl_gcc_camss_cci_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_cci_clk_src",
+		.parent_data = gcc_parents_9,
+		.num_parents = ARRAY_SIZE(gcc_parents_9),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_camss_csi0phytimer_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(100000000, P_GPLL0_OUT_AUX2, 3, 0, 0),
+	F(200000000, P_GPLL0_OUT_AUX2, 1.5, 0, 0),
+	F(268800000, P_GPLL4_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_camss_csi0phytimer_clk_src = {
+	.cmd_rcgr = 0x45000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_gcc_camss_csi0phytimer_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_csi0phytimer_clk_src",
+		.parent_data = gcc_parents_5,
+		.num_parents = ARRAY_SIZE(gcc_parents_5),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_camss_csi1phytimer_clk_src = {
+	.cmd_rcgr = 0x4501c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_gcc_camss_csi0phytimer_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_csi1phytimer_clk_src",
+		.parent_data = gcc_parents_5,
+		.num_parents = ARRAY_SIZE(gcc_parents_5),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_camss_mclk0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24000000, P_GPLL9_OUT_MAIN, 1, 1, 24),
+	F(64000000, P_GPLL9_OUT_EARLY, 9, 1, 2),
+	{ }
+};
+
+static struct clk_rcg2 gcc_camss_mclk0_clk_src = {
+	.cmd_rcgr = 0x51000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_camss_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_mclk0_clk_src",
+		.parent_data = gcc_parents_3,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
+		.flags = CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_camss_mclk1_clk_src = {
+	.cmd_rcgr = 0x5101c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_camss_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_mclk1_clk_src",
+		.parent_data = gcc_parents_3,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
+		.flags = CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_camss_mclk2_clk_src = {
+	.cmd_rcgr = 0x51038,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_camss_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_mclk2_clk_src",
+		.parent_data = gcc_parents_3,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
+		.flags = CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_camss_mclk3_clk_src = {
+	.cmd_rcgr = 0x51054,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_camss_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_mclk3_clk_src",
+		.parent_data = gcc_parents_3,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
+		.flags = CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_camss_ope_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(171428571, P_GPLL0_OUT_EARLY, 3.5, 0, 0),
+	F(240000000, P_GPLL0_OUT_EARLY, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_camss_ope_ahb_clk_src = {
+	.cmd_rcgr = 0x55024,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_6,
+	.freq_tbl = ftbl_gcc_camss_ope_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_ope_ahb_clk_src",
+		.parent_data = gcc_parents_6,
+		.num_parents = ARRAY_SIZE(gcc_parents_6),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_camss_ope_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_GPLL8_OUT_MAIN, 2, 0, 0),
+	F(266600000, P_GPLL8_OUT_MAIN, 1, 0, 0),
+	F(465000000, P_GPLL8_OUT_MAIN, 1, 0, 0),
+	F(580000000, P_GPLL8_OUT_EARLY, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_camss_ope_clk_src = {
+	.cmd_rcgr = 0x55004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_6,
+	.freq_tbl = ftbl_gcc_camss_ope_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_ope_clk_src",
+		.parent_data = gcc_parents_6,
+		.num_parents = ARRAY_SIZE(gcc_parents_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_camss_tfe_0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(128000000, P_GPLL10_OUT_MAIN, 9, 0, 0),
+	F(135529412, P_GPLL10_OUT_MAIN, 8.5, 0, 0),
+	F(144000000, P_GPLL10_OUT_MAIN, 8, 0, 0),
+	F(153600000, P_GPLL10_OUT_MAIN, 7.5, 0, 0),
+	F(164571429, P_GPLL10_OUT_MAIN, 7, 0, 0),
+	F(177230769, P_GPLL10_OUT_MAIN, 6.5, 0, 0),
+	F(192000000, P_GPLL10_OUT_MAIN, 6, 0, 0),
+	F(209454545, P_GPLL10_OUT_MAIN, 5.5, 0, 0),
+	F(230400000, P_GPLL10_OUT_MAIN, 5, 0, 0),
+	F(256000000, P_GPLL10_OUT_MAIN, 4.5, 0, 0),
+	F(288000000, P_GPLL10_OUT_MAIN, 4, 0, 0),
+	F(329142857, P_GPLL10_OUT_MAIN, 3.5, 0, 0),
+	F(384000000, P_GPLL10_OUT_MAIN, 3, 0, 0),
+	F(460800000, P_GPLL10_OUT_MAIN, 2.5, 0, 0),
+	F(576000000, P_GPLL10_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_camss_tfe_0_clk_src = {
+	.cmd_rcgr = 0x52004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.freq_tbl = ftbl_gcc_camss_tfe_0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_tfe_0_clk_src",
+		.parent_data = gcc_parents_7,
+		.num_parents = ARRAY_SIZE(gcc_parents_7),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_camss_tfe_0_csid_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(120000000, P_GPLL0_OUT_EARLY, 5, 0, 0),
+	F(192000000, P_GPLL6_OUT_MAIN, 2, 0, 0),
+	F(240000000, P_GPLL0_OUT_EARLY, 2.5, 0, 0),
+	F(384000000, P_GPLL6_OUT_MAIN, 1, 0, 0),
+	F(426400000, P_GPLL3_OUT_EARLY, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_camss_tfe_0_csid_clk_src = {
+	.cmd_rcgr = 0x52094,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_gcc_camss_tfe_0_csid_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_tfe_0_csid_clk_src",
+		.parent_data = gcc_parents_8,
+		.num_parents = ARRAY_SIZE(gcc_parents_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_camss_tfe_1_clk_src = {
+	.cmd_rcgr = 0x52024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.freq_tbl = ftbl_gcc_camss_tfe_0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_tfe_1_clk_src",
+		.parent_data = gcc_parents_7,
+		.num_parents = ARRAY_SIZE(gcc_parents_7),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_camss_tfe_1_csid_clk_src = {
+	.cmd_rcgr = 0x520b4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_gcc_camss_tfe_0_csid_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_tfe_1_csid_clk_src",
+		.parent_data = gcc_parents_8,
+		.num_parents = ARRAY_SIZE(gcc_parents_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_camss_tfe_cphy_rx_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(240000000, P_GPLL0_OUT_EARLY, 2.5, 0, 0),
+	F(341333333, P_GPLL6_OUT_EARLY, 1, 4, 9),
+	F(384000000, P_GPLL6_OUT_EARLY, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_camss_tfe_cphy_rx_clk_src = {
+	.cmd_rcgr = 0x52064,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_10,
+	.freq_tbl = ftbl_gcc_camss_tfe_cphy_rx_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_tfe_cphy_rx_clk_src",
+		.parent_data = gcc_parents_10,
+		.num_parents = ARRAY_SIZE(gcc_parents_10),
+		.flags = CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_camss_top_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(40000000, P_GPLL0_OUT_AUX2, 7.5, 0, 0),
+	F(80000000, P_GPLL0_OUT_EARLY, 7.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_camss_top_ahb_clk_src = {
+	.cmd_rcgr = 0x58010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_gcc_camss_top_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_camss_top_ahb_clk_src",
+		.parent_data = gcc_parents_4,
+		.num_parents = ARRAY_SIZE(gcc_parents_4),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(25000000, P_GPLL0_OUT_AUX2, 12, 0, 0),
+	F(50000000, P_GPLL0_OUT_AUX2, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_AUX2, 3, 0, 0),
+	F(200000000, P_GPLL0_OUT_AUX2, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x4d004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp1_clk_src",
+		.parent_data = gcc_parents_2,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x4e004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp2_clk_src",
+		.parent_data = gcc_parents_2,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp3_clk_src = {
+	.cmd_rcgr = 0x4f004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp3_clk_src",
+		.parent_data = gcc_parents_2,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pdm2_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(60000000, P_GPLL0_OUT_AUX2, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pdm2_clk_src = {
+	.cmd_rcgr = 0x20010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pdm2_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pdm2_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
+	F(7372800, P_GPLL0_OUT_AUX2, 1, 384, 15625),
+	F(14745600, P_GPLL0_OUT_AUX2, 1, 768, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_GPLL0_OUT_AUX2, 1, 1536, 15625),
+	F(32000000, P_GPLL0_OUT_AUX2, 1, 8, 75),
+	F(48000000, P_GPLL0_OUT_AUX2, 1, 4, 25),
+	F(64000000, P_GPLL0_OUT_AUX2, 1, 16, 75),
+	F(75000000, P_GPLL0_OUT_AUX2, 4, 0, 0),
+	F(80000000, P_GPLL0_OUT_AUX2, 1, 4, 15),
+	F(96000000, P_GPLL0_OUT_AUX2, 1, 8, 25),
+	F(100000000, P_GPLL0_OUT_AUX2, 3, 0, 0),
+	F(102400000, P_GPLL0_OUT_AUX2, 1, 128, 375),
+	F(112000000, P_GPLL0_OUT_AUX2, 1, 28, 75),
+	F(117964800, P_GPLL0_OUT_AUX2, 1, 6144, 15625),
+	F(120000000, P_GPLL0_OUT_AUX2, 2.5, 0, 0),
+	F(128000000, P_GPLL6_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s0_clk_src",
+	.parent_data = gcc_parents_1,
+	.num_parents = ARRAY_SIZE(gcc_parents_1),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
+	.cmd_rcgr = 0x1f148,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s0_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s1_clk_src",
+	.parent_data = gcc_parents_1,
+	.num_parents = ARRAY_SIZE(gcc_parents_1),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
+	.cmd_rcgr = 0x1f278,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s1_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s2_clk_src",
+	.parent_data = gcc_parents_1,
+	.num_parents = ARRAY_SIZE(gcc_parents_1),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
+	.cmd_rcgr = 0x1f3a8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s2_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s3_clk_src",
+	.parent_data = gcc_parents_1,
+	.num_parents = ARRAY_SIZE(gcc_parents_1),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
+	.cmd_rcgr = 0x1f4d8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s3_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s4_clk_src",
+	.parent_data = gcc_parents_1,
+	.num_parents = ARRAY_SIZE(gcc_parents_1),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
+	.cmd_rcgr = 0x1f608,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s4_clk_src_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
+	.name = "gcc_qupv3_wrap0_s5_clk_src",
+	.parent_data = gcc_parents_1,
+	.num_parents = ARRAY_SIZE(gcc_parents_1),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
+	.cmd_rcgr = 0x1f738,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s5_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_src[] = {
+	F(144000, P_BI_TCXO, 16, 3, 25),
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(20000000, P_GPLL0_OUT_AUX2, 5, 1, 3),
+	F(25000000, P_GPLL0_OUT_AUX2, 6, 1, 2),
+	F(50000000, P_GPLL0_OUT_AUX2, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_AUX2, 3, 0, 0),
+	F(192000000, P_GPLL6_OUT_MAIN, 2, 0, 0),
+	F(384000000, P_GPLL6_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x38028,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_sdcc1_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sdcc1_apps_clk_src",
+		.parent_data = gcc_parents_1,
+		.num_parents = ARRAY_SIZE(gcc_parents_1),
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_ice_core_clk_src[] = {
+	F(75000000, P_GPLL0_OUT_AUX2, 4, 0, 0),
+	F(100000000, P_GPLL0_OUT_AUX2, 3, 0, 0),
+	F(150000000, P_GPLL0_OUT_AUX2, 2, 0, 0),
+	F(200000000, P_GPLL0_OUT_EARLY, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_AUX2, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
+	.cmd_rcgr = 0x38010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_sdcc1_ice_core_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sdcc1_ice_core_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(25000000, P_GPLL0_OUT_AUX2, 12, 0, 0),
+	F(50000000, P_GPLL0_OUT_AUX2, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_AUX2, 3, 0, 0),
+	F(202000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
+	.cmd_rcgr = 0x1e00c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_12,
+	.freq_tbl = ftbl_gcc_sdcc2_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sdcc2_apps_clk_src",
+		.parent_data = gcc_parents_12,
+		.num_parents = ARRAY_SIZE(gcc_parents_12),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb30_prim_master_clk_src[] = {
+	F(66666667, P_GPLL0_OUT_AUX2, 4.5, 0, 0),
+	F(133333333, P_GPLL0_OUT_EARLY, 4.5, 0, 0),
+	F(200000000, P_GPLL0_OUT_EARLY, 3, 0, 0),
+	F(240000000, P_GPLL0_OUT_EARLY, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
+	.cmd_rcgr = 0x1a01c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_usb30_prim_master_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb30_prim_master_clk_src",
+		.parent_data = gcc_parents_0,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
+	.cmd_rcgr = 0x1a060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_13,
+	.freq_tbl = ftbl_gcc_usb30_prim_mock_utmi_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb3_prim_phy_aux_clk_src",
+		.parent_data = gcc_parents_13,
+		.num_parents = ARRAY_SIZE(gcc_parents_13),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_video_venus_clk_src[] = {
+	F(133333333, P_GPLL11_OUT_MAIN, 4.5, 0, 0),
+	F(240000000, P_GPLL11_OUT_MAIN, 2.5, 0, 0),
+	F(300000000, P_GPLL11_OUT_MAIN, 2, 0, 0),
+	F(384000000, P_GPLL11_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_video_venus_clk_src = {
+	.cmd_rcgr = 0x58060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_14,
+	.freq_tbl = ftbl_gcc_video_venus_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_video_venus_clk_src",
+		.parent_data = gcc_parents_14,
+		.num_parents = ARRAY_SIZE(gcc_parents_14),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_ahb2phy_csi_clk = {
+	.halt_reg = 0x1d004,
+	.halt_check = BRANCH_HALT_DELAY,
+	.hwcg_reg = 0x1d004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1d004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ahb2phy_csi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ahb2phy_usb_clk = {
+	.halt_reg = 0x1d008,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1d008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1d008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ahb2phy_usb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_bimc_gpu_axi_clk = {
+	.halt_reg = 0x71154,
+	.halt_check = BRANCH_HALT_DELAY,
+	.hwcg_reg = 0x71154,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x71154,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_bimc_gpu_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_boot_rom_ahb_clk = {
+	.halt_reg = 0x23004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x23004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_boot_rom_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cam_throttle_nrt_clk = {
+	.halt_reg = 0x17070,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x17070,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(27),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cam_throttle_nrt_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cam_throttle_rt_clk = {
+	.halt_reg = 0x1706c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1706c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(26),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cam_throttle_rt_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camera_ahb_clk = {
+	.halt_reg = 0x17008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.hwcg_reg = 0x17008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x17008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camera_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camera_xo_clk = {
+	.halt_reg = 0x17028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camera_xo_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_axi_clk = {
+	.halt_reg = 0x58044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x58044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_axi_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_axi_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_camnoc_atb_clk = {
+	.halt_reg = 0x5804c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.hwcg_reg = 0x5804c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x5804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_camnoc_atb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_camnoc_nts_xo_clk = {
+	.halt_reg = 0x58050,
+	.halt_check = BRANCH_HALT_DELAY,
+	.hwcg_reg = 0x58050,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x58050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_camnoc_nts_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_cci_0_clk = {
+	.halt_reg = 0x56018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x56018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_cci_0_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_cci_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_cphy_0_clk = {
+	.halt_reg = 0x52088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x52088,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_cphy_0_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_cphy_1_clk = {
+	.halt_reg = 0x5208c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5208c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_cphy_1_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi0phytimer_clk = {
+	.halt_reg = 0x45018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x45018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_csi0phytimer_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_camss_csi0phytimer_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi1phytimer_clk = {
+	.halt_reg = 0x45034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x45034,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_csi1phytimer_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_camss_csi1phytimer_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_mclk0_clk = {
+	.halt_reg = 0x51018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x51018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_mclk0_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_mclk0_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_mclk1_clk = {
+	.halt_reg = 0x51034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x51034,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_mclk1_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_mclk1_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_mclk2_clk = {
+	.halt_reg = 0x51050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x51050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_mclk2_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_mclk2_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_mclk3_clk = {
+	.halt_reg = 0x5106c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5106c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_mclk3_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_mclk3_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_nrt_axi_clk = {
+	.halt_reg = 0x58054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x58054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_nrt_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_ope_ahb_clk = {
+	.halt_reg = 0x5503c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5503c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_ope_ahb_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_ope_ahb_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_ope_clk = {
+	.halt_reg = 0x5501c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5501c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_ope_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_ope_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_rt_axi_clk = {
+	.halt_reg = 0x5805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_rt_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_tfe_0_clk = {
+	.halt_reg = 0x5201c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5201c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_tfe_0_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_tfe_0_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_tfe_0_cphy_rx_clk = {
+	.halt_reg = 0x5207c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5207c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_tfe_0_cphy_rx_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_tfe_0_csid_clk = {
+	.halt_reg = 0x520ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x520ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_tfe_0_csid_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_camss_tfe_0_csid_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_tfe_1_clk = {
+	.halt_reg = 0x5203c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5203c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_tfe_1_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_tfe_1_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_tfe_1_cphy_rx_clk = {
+	.halt_reg = 0x52080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x52080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_tfe_1_cphy_rx_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_tfe_1_csid_clk = {
+	.halt_reg = 0x520cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x520cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_tfe_1_csid_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_camss_tfe_1_csid_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_top_ahb_clk = {
+	.halt_reg = 0x58028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x58028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_camss_top_ahb_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_camss_top_ahb_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
+	.halt_reg = 0x1a084,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1a084,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1a084,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cfg_noc_usb3_prim_axi_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_usb30_prim_master_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_ahb_clk = {
+	.halt_reg = 0x1700c,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1700c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1700c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div gcc_disp_gpll0_clk_src = {
+	.reg = 0x17058,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gcc_disp_gpll0_clk_src",
+		.parent_hws = (const struct clk_hw *[]){ &gpll0.clkr.hw },
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_branch gcc_disp_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(20),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_disp_gpll0_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_hf_axi_clk = {
+	.halt_reg = 0x17020,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x17020,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x17020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_throttle_core_clk = {
+	.halt_reg = 0x17064,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x17064,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_throttle_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_disp_xo_clk = {
+	.halt_reg = 0x1702c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1702c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_disp_xo_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp1_clk = {
+	.halt_reg = 0x4d000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_gp1_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp2_clk = {
+	.halt_reg = 0x4e000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4e000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_gp2_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp3_clk = {
+	.halt_reg = 0x4f000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4f000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp3_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_gp3_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_cfg_ahb_clk = {
+	.halt_reg = 0x36004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x36004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x36004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_cfg_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_gpll0_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_gpll0_clk_src",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gpll0.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(16),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gpll0_out_aux2.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_iref_clk = {
+	.halt_reg = 0x36100,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x36100,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_iref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
+	.halt_reg = 0x3600c,
+	.halt_check = BRANCH_VOTED,
+	.hwcg_reg = 0x3600c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3600c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_snoc_dvm_gfx_clk = {
+	.halt_reg = 0x36018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x36018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_snoc_dvm_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gpu_throttle_core_clk = {
+	.halt_reg = 0x36048,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x36048,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(31),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_throttle_core_clk",
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm2_clk = {
+	.halt_reg = 0x2000c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2000c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm2_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_pdm2_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_ahb_clk = {
+	.halt_reg = 0x20004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x20004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x20004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_xo4_clk = {
+	.halt_reg = 0x20008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm_xo4_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pwm0_xo512_clk = {
+	.halt_reg = 0x2002c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2002c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pwm0_xo512_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_camera_nrt_ahb_clk = {
+	.halt_reg = 0x17014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x17014,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qmip_camera_nrt_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_camera_rt_ahb_clk = {
+	.halt_reg = 0x17060,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x17060,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qmip_camera_rt_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_disp_ahb_clk = {
+	.halt_reg = 0x17018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x17018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qmip_disp_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_gpu_cfg_ahb_clk = {
+	.halt_reg = 0x36040,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x36040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qmip_gpu_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qmip_video_vcodec_ahb_clk = {
+	.halt_reg = 0x17010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x17010,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(25),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qmip_video_vcodec_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_core_2x_clk = {
+	.halt_reg = 0x1f014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_core_clk = {
+	.halt_reg = 0x1f00c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(8),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
+	.halt_reg = 0x1f144,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s0_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_qupv3_wrap0_s0_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s1_clk = {
+	.halt_reg = 0x1f274,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s1_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_qupv3_wrap0_s1_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s2_clk = {
+	.halt_reg = 0x1f3a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(12),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s2_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_qupv3_wrap0_s2_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s3_clk = {
+	.halt_reg = 0x1f4d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(13),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s3_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_qupv3_wrap0_s3_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s4_clk = {
+	.halt_reg = 0x1f604,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(14),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s4_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_qupv3_wrap0_s4_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap0_s5_clk = {
+	.halt_reg = 0x1f734,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap0_s5_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_qupv3_wrap0_s5_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_0_m_ahb_clk = {
+	.halt_reg = 0x1f004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1f004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap_0_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_0_s_ahb_clk = {
+	.halt_reg = 0x1f008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1f008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x7900c,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_qupv3_wrap_0_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0x38008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x38008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0x38004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x38004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_sdcc1_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ice_core_clk = {
+	.halt_reg = 0x3800c,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x3800c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3800c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_ice_core_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_sdcc1_ice_core_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_ahb_clk = {
+	.halt_reg = 0x1e008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc2_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_apps_clk = {
+	.halt_reg = 0x1e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc2_apps_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_sdcc2_apps_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
+	.halt_reg = 0x2b06c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2b06c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_cpuss_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_usb3_prim_axi_clk = {
+	.halt_reg = 0x1a080,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1a080,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1a080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_usb3_prim_axi_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_usb30_prim_master_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_prim_master_clk = {
+	.halt_reg = 0x1a010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_prim_master_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_usb30_prim_master_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
+	.halt_reg = 0x1a018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_prim_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_usb30_prim_mock_utmi_postdiv.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_prim_sleep_clk = {
+	.halt_reg = 0x1a014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_prim_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_clkref_clk = {
+	.halt_reg = 0x9f000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9f000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_prim_clkref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
+	.halt_reg = 0x1a054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_prim_phy_com_aux_clk",
+			.parent_hws = (const struct clk_hw *[])
+				{ &gcc_usb3_prim_phy_aux_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
+	.halt_reg = 0x1a058,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1a058,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1a058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_prim_phy_pipe_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_vcodec0_axi_clk = {
+	.halt_reg = 0x6e008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_vcodec0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_venus_ahb_clk = {
+	.halt_reg = 0x6e010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6e010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_venus_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_venus_ctl_axi_clk = {
+	.halt_reg = 0x6e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_venus_ctl_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_ahb_clk = {
+	.halt_reg = 0x17004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x17004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x17004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_video_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_axi0_clk = {
+	.halt_reg = 0x1701c,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1701c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1701c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_video_axi0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_throttle_core_clk = {
+	.halt_reg = 0x17068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x17068,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(28),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_video_throttle_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_vcodec0_sys_clk = {
+	.halt_reg = 0x580a4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.hwcg_reg = 0x580a4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x580a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_video_vcodec0_sys_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_video_venus_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_venus_ctl_clk = {
+	.halt_reg = 0x5808c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_video_venus_ctl_clk",
+			.parent_hws = (const struct clk_hw *[])
+					{ &gcc_video_venus_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_video_xo_clk = {
+	.halt_reg = 0x17024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_video_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *gcc_qcm2290_clocks[] = {
+	[GCC_AHB2PHY_CSI_CLK] = &gcc_ahb2phy_csi_clk.clkr,
+	[GCC_AHB2PHY_USB_CLK] = &gcc_ahb2phy_usb_clk.clkr,
+	[GCC_BIMC_GPU_AXI_CLK] = &gcc_bimc_gpu_axi_clk.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_CAM_THROTTLE_NRT_CLK] = &gcc_cam_throttle_nrt_clk.clkr,
+	[GCC_CAM_THROTTLE_RT_CLK] = &gcc_cam_throttle_rt_clk.clkr,
+	[GCC_CAMERA_AHB_CLK] = &gcc_camera_ahb_clk.clkr,
+	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
+	[GCC_CAMSS_AXI_CLK] = &gcc_camss_axi_clk.clkr,
+	[GCC_CAMSS_AXI_CLK_SRC] = &gcc_camss_axi_clk_src.clkr,
+	[GCC_CAMSS_CAMNOC_ATB_CLK] = &gcc_camss_camnoc_atb_clk.clkr,
+	[GCC_CAMSS_CAMNOC_NTS_XO_CLK] = &gcc_camss_camnoc_nts_xo_clk.clkr,
+	[GCC_CAMSS_CCI_0_CLK] = &gcc_camss_cci_0_clk.clkr,
+	[GCC_CAMSS_CCI_CLK_SRC] = &gcc_camss_cci_clk_src.clkr,
+	[GCC_CAMSS_CPHY_0_CLK] = &gcc_camss_cphy_0_clk.clkr,
+	[GCC_CAMSS_CPHY_1_CLK] = &gcc_camss_cphy_1_clk.clkr,
+	[GCC_CAMSS_CSI0PHYTIMER_CLK] = &gcc_camss_csi0phytimer_clk.clkr,
+	[GCC_CAMSS_CSI0PHYTIMER_CLK_SRC] = &gcc_camss_csi0phytimer_clk_src.clkr,
+	[GCC_CAMSS_CSI1PHYTIMER_CLK] = &gcc_camss_csi1phytimer_clk.clkr,
+	[GCC_CAMSS_CSI1PHYTIMER_CLK_SRC] = &gcc_camss_csi1phytimer_clk_src.clkr,
+	[GCC_CAMSS_MCLK0_CLK] = &gcc_camss_mclk0_clk.clkr,
+	[GCC_CAMSS_MCLK0_CLK_SRC] = &gcc_camss_mclk0_clk_src.clkr,
+	[GCC_CAMSS_MCLK1_CLK] = &gcc_camss_mclk1_clk.clkr,
+	[GCC_CAMSS_MCLK1_CLK_SRC] = &gcc_camss_mclk1_clk_src.clkr,
+	[GCC_CAMSS_MCLK2_CLK] = &gcc_camss_mclk2_clk.clkr,
+	[GCC_CAMSS_MCLK2_CLK_SRC] = &gcc_camss_mclk2_clk_src.clkr,
+	[GCC_CAMSS_MCLK3_CLK] = &gcc_camss_mclk3_clk.clkr,
+	[GCC_CAMSS_MCLK3_CLK_SRC] = &gcc_camss_mclk3_clk_src.clkr,
+	[GCC_CAMSS_NRT_AXI_CLK] = &gcc_camss_nrt_axi_clk.clkr,
+	[GCC_CAMSS_OPE_AHB_CLK] = &gcc_camss_ope_ahb_clk.clkr,
+	[GCC_CAMSS_OPE_AHB_CLK_SRC] = &gcc_camss_ope_ahb_clk_src.clkr,
+	[GCC_CAMSS_OPE_CLK] = &gcc_camss_ope_clk.clkr,
+	[GCC_CAMSS_OPE_CLK_SRC] = &gcc_camss_ope_clk_src.clkr,
+	[GCC_CAMSS_RT_AXI_CLK] = &gcc_camss_rt_axi_clk.clkr,
+	[GCC_CAMSS_TFE_0_CLK] = &gcc_camss_tfe_0_clk.clkr,
+	[GCC_CAMSS_TFE_0_CLK_SRC] = &gcc_camss_tfe_0_clk_src.clkr,
+	[GCC_CAMSS_TFE_0_CPHY_RX_CLK] = &gcc_camss_tfe_0_cphy_rx_clk.clkr,
+	[GCC_CAMSS_TFE_0_CSID_CLK] = &gcc_camss_tfe_0_csid_clk.clkr,
+	[GCC_CAMSS_TFE_0_CSID_CLK_SRC] = &gcc_camss_tfe_0_csid_clk_src.clkr,
+	[GCC_CAMSS_TFE_1_CLK] = &gcc_camss_tfe_1_clk.clkr,
+	[GCC_CAMSS_TFE_1_CLK_SRC] = &gcc_camss_tfe_1_clk_src.clkr,
+	[GCC_CAMSS_TFE_1_CPHY_RX_CLK] = &gcc_camss_tfe_1_cphy_rx_clk.clkr,
+	[GCC_CAMSS_TFE_1_CSID_CLK] = &gcc_camss_tfe_1_csid_clk.clkr,
+	[GCC_CAMSS_TFE_1_CSID_CLK_SRC] = &gcc_camss_tfe_1_csid_clk_src.clkr,
+	[GCC_CAMSS_TFE_CPHY_RX_CLK_SRC] = &gcc_camss_tfe_cphy_rx_clk_src.clkr,
+	[GCC_CAMSS_TOP_AHB_CLK] = &gcc_camss_top_ahb_clk.clkr,
+	[GCC_CAMSS_TOP_AHB_CLK_SRC] = &gcc_camss_top_ahb_clk_src.clkr,
+	[GCC_CFG_NOC_USB3_PRIM_AXI_CLK] = &gcc_cfg_noc_usb3_prim_axi_clk.clkr,
+	[GCC_DISP_AHB_CLK] = &gcc_disp_ahb_clk.clkr,
+	[GCC_DISP_GPLL0_CLK_SRC] = &gcc_disp_gpll0_clk_src.clkr,
+	[GCC_DISP_GPLL0_DIV_CLK_SRC] = &gcc_disp_gpll0_div_clk_src.clkr,
+	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
+	[GCC_DISP_THROTTLE_CORE_CLK] = &gcc_disp_throttle_core_clk.clkr,
+	[GCC_DISP_XO_CLK] = &gcc_disp_xo_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP2_CLK_SRC] = &gcc_gp2_clk_src.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_GP3_CLK_SRC] = &gcc_gp3_clk_src.clkr,
+	[GCC_GPU_CFG_AHB_CLK] = &gcc_gpu_cfg_ahb_clk.clkr,
+	[GCC_GPU_GPLL0_CLK_SRC] = &gcc_gpu_gpll0_clk_src.clkr,
+	[GCC_GPU_GPLL0_DIV_CLK_SRC] = &gcc_gpu_gpll0_div_clk_src.clkr,
+	[GCC_GPU_IREF_CLK] = &gcc_gpu_iref_clk.clkr,
+	[GCC_GPU_MEMNOC_GFX_CLK] = &gcc_gpu_memnoc_gfx_clk.clkr,
+	[GCC_GPU_SNOC_DVM_GFX_CLK] = &gcc_gpu_snoc_dvm_gfx_clk.clkr,
+	[GCC_GPU_THROTTLE_CORE_CLK] = &gcc_gpu_throttle_core_clk.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PWM0_XO512_CLK] = &gcc_pwm0_xo512_clk.clkr,
+	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
+	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
+	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
+	[GCC_QMIP_GPU_CFG_AHB_CLK] = &gcc_qmip_gpu_cfg_ahb_clk.clkr,
+	[GCC_QMIP_VIDEO_VCODEC_AHB_CLK] = &gcc_qmip_video_vcodec_ahb_clk.clkr,
+	[GCC_QUPV3_WRAP0_CORE_2X_CLK] = &gcc_qupv3_wrap0_core_2x_clk.clkr,
+	[GCC_QUPV3_WRAP0_CORE_CLK] = &gcc_qupv3_wrap0_core_clk.clkr,
+	[GCC_QUPV3_WRAP0_S0_CLK] = &gcc_qupv3_wrap0_s0_clk.clkr,
+	[GCC_QUPV3_WRAP0_S0_CLK_SRC] = &gcc_qupv3_wrap0_s0_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S1_CLK] = &gcc_qupv3_wrap0_s1_clk.clkr,
+	[GCC_QUPV3_WRAP0_S1_CLK_SRC] = &gcc_qupv3_wrap0_s1_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S2_CLK] = &gcc_qupv3_wrap0_s2_clk.clkr,
+	[GCC_QUPV3_WRAP0_S2_CLK_SRC] = &gcc_qupv3_wrap0_s2_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S3_CLK] = &gcc_qupv3_wrap0_s3_clk.clkr,
+	[GCC_QUPV3_WRAP0_S3_CLK_SRC] = &gcc_qupv3_wrap0_s3_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S4_CLK] = &gcc_qupv3_wrap0_s4_clk.clkr,
+	[GCC_QUPV3_WRAP0_S4_CLK_SRC] = &gcc_qupv3_wrap0_s4_clk_src.clkr,
+	[GCC_QUPV3_WRAP0_S5_CLK] = &gcc_qupv3_wrap0_s5_clk.clkr,
+	[GCC_QUPV3_WRAP0_S5_CLK_SRC] = &gcc_qupv3_wrap0_s5_clk_src.clkr,
+	[GCC_QUPV3_WRAP_0_M_AHB_CLK] = &gcc_qupv3_wrap_0_m_ahb_clk.clkr,
+	[GCC_QUPV3_WRAP_0_S_AHB_CLK] = &gcc_qupv3_wrap_0_s_ahb_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC1_APPS_CLK_SRC] = &gcc_sdcc1_apps_clk_src.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK_SRC] = &gcc_sdcc1_ice_core_clk_src.clkr,
+	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
+	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
+	[GCC_SDCC2_APPS_CLK_SRC] = &gcc_sdcc2_apps_clk_src.clkr,
+	[GCC_SYS_NOC_CPUSS_AHB_CLK] = &gcc_sys_noc_cpuss_ahb_clk.clkr,
+	[GCC_SYS_NOC_USB3_PRIM_AXI_CLK] = &gcc_sys_noc_usb3_prim_axi_clk.clkr,
+	[GCC_USB30_PRIM_MASTER_CLK] = &gcc_usb30_prim_master_clk.clkr,
+	[GCC_USB30_PRIM_MASTER_CLK_SRC] = &gcc_usb30_prim_master_clk_src.clkr,
+	[GCC_USB30_PRIM_MOCK_UTMI_CLK] = &gcc_usb30_prim_mock_utmi_clk.clkr,
+	[GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC] =
+		&gcc_usb30_prim_mock_utmi_clk_src.clkr,
+	[GCC_USB30_PRIM_MOCK_UTMI_POSTDIV] =
+		&gcc_usb30_prim_mock_utmi_postdiv.clkr,
+	[GCC_USB30_PRIM_SLEEP_CLK] = &gcc_usb30_prim_sleep_clk.clkr,
+	[GCC_USB3_PRIM_CLKREF_CLK] = &gcc_usb3_prim_clkref_clk.clkr,
+	[GCC_USB3_PRIM_PHY_AUX_CLK_SRC] = &gcc_usb3_prim_phy_aux_clk_src.clkr,
+	[GCC_USB3_PRIM_PHY_COM_AUX_CLK] = &gcc_usb3_prim_phy_com_aux_clk.clkr,
+	[GCC_USB3_PRIM_PHY_PIPE_CLK] = &gcc_usb3_prim_phy_pipe_clk.clkr,
+	[GCC_VCODEC0_AXI_CLK] = &gcc_vcodec0_axi_clk.clkr,
+	[GCC_VENUS_AHB_CLK] = &gcc_venus_ahb_clk.clkr,
+	[GCC_VENUS_CTL_AXI_CLK] = &gcc_venus_ctl_axi_clk.clkr,
+	[GCC_VIDEO_AHB_CLK] = &gcc_video_ahb_clk.clkr,
+	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
+	[GCC_VIDEO_THROTTLE_CORE_CLK] = &gcc_video_throttle_core_clk.clkr,
+	[GCC_VIDEO_VCODEC0_SYS_CLK] = &gcc_video_vcodec0_sys_clk.clkr,
+	[GCC_VIDEO_VENUS_CLK_SRC] = &gcc_video_venus_clk_src.clkr,
+	[GCC_VIDEO_VENUS_CTL_CLK] = &gcc_video_venus_ctl_clk.clkr,
+	[GCC_VIDEO_XO_CLK] = &gcc_video_xo_clk.clkr,
+	[GPLL0] = &gpll0.clkr,
+	[GPLL0_OUT_AUX2] = &gpll0_out_aux2.clkr,
+	[GPLL1] = &gpll1.clkr,
+	[GPLL10] = &gpll10.clkr,
+	[GPLL11] = &gpll11.clkr,
+	[GPLL3] = &gpll3.clkr,
+	[GPLL3_OUT_MAIN] = &gpll3_out_main.clkr,
+	[GPLL4] = &gpll4.clkr,
+	[GPLL5] = &gpll5.clkr,
+	[GPLL6] = &gpll6.clkr,
+	[GPLL6_OUT_MAIN] = &gpll6_out_main.clkr,
+	[GPLL7] = &gpll7.clkr,
+	[GPLL8] = &gpll8.clkr,
+	[GPLL8_OUT_MAIN] = &gpll8_out_main.clkr,
+	[GPLL9] = &gpll9.clkr,
+	[GPLL9_OUT_MAIN] = &gpll9_out_main.clkr,
+};
+
+static const struct qcom_reset_map gcc_qcm2290_resets[] = {
+	[GCC_CAMSS_OPE_BCR] = { 0x55000 },
+	[GCC_CAMSS_TFE_BCR] = { 0x52000 },
+	[GCC_CAMSS_TOP_BCR] = { 0x58000 },
+	[GCC_GPU_BCR] = { 0x36000 },
+	[GCC_MMSS_BCR] = { 0x17000 },
+	[GCC_PDM_BCR] = { 0x20000 },
+	[GCC_QUPV3_WRAPPER_0_BCR] = { 0x1f000 },
+	[GCC_QUSB2PHY_PRIM_BCR] = { 0x1c000 },
+	[GCC_SDCC1_BCR] = { 0x38000 },
+	[GCC_SDCC2_BCR] = { 0x1e000 },
+	[GCC_USB30_PRIM_BCR] = { 0x1a000 },
+	[GCC_USB3_PHY_PRIM_SP0_BCR] = { 0x1b000 },
+	[GCC_USB3PHY_PHY_PRIM_SP0_BCR] = { 0x1b008 },
+	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x1d000 },
+	[GCC_VCODEC0_BCR] = { 0x58094 },
+	[GCC_VENUS_BCR] = { 0x58078 },
+	[GCC_VIDEO_INTERFACE_BCR] = { 0x6e000 },
+};
+
+static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk_src),
+};
+
+static const struct regmap_config gcc_qcm2290_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xc7000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc gcc_qcm2290_desc = {
+	.config = &gcc_qcm2290_regmap_config,
+	.clks = gcc_qcm2290_clocks,
+	.num_clks = ARRAY_SIZE(gcc_qcm2290_clocks),
+	.resets = gcc_qcm2290_resets,
+	.num_resets = ARRAY_SIZE(gcc_qcm2290_resets),
+};
+
+static const struct of_device_id gcc_qcm2290_match_table[] = {
+	{ .compatible = "qcom,gcc-qcm2290" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_qcm2290_match_table);
+
+static int gcc_qcm2290_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	regmap = qcom_cc_map(pdev, &gcc_qcm2290_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
+				       ARRAY_SIZE(gcc_dfs_clocks));
+	if (ret)
+		return ret;
+
+	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
+	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
+	clk_alpha_pll_configure(&gpll8, regmap, &gpll8_config);
+	clk_alpha_pll_configure(&gpll9, regmap, &gpll9_config);
+
+	return qcom_cc_really_probe(pdev, &gcc_qcm2290_desc, regmap);
+}
+
+static struct platform_driver gcc_qcm2290_driver = {
+	.probe = gcc_qcm2290_probe,
+	.driver = {
+		.name = "gcc-qcm2290",
+		.of_match_table = gcc_qcm2290_match_table,
+	},
+};
+
+static int __init gcc_qcm2290_init(void)
+{
+	return platform_driver_register(&gcc_qcm2290_driver);
+}
+subsys_initcall(gcc_qcm2290_init);
+
+static void __exit gcc_qcm2290_exit(void)
+{
+	platform_driver_unregister(&gcc_qcm2290_driver);
+}
+module_exit(gcc_qcm2290_exit);
+
+MODULE_DESCRIPTION("QTI GCC QCM2290 Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:gcc-qcm2290");
diff --git a/include/dt-bindings/clock/qcom,gcc-qcm2290.h b/include/dt-bindings/clock/qcom,gcc-qcm2290.h
new file mode 100644
index 000000000000..92130835e232
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-qcm2290.h
@@ -0,0 +1,178 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_QCM2290_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_QCM2290_H
+
+/* GCC clocks */
+#define GPLL0						0
+#define GPLL0_OUT_AUX2					1
+#define GPLL1						2
+#define GPLL10						3
+#define GPLL11						4
+#define GPLL3						5
+#define GPLL3_OUT_MAIN					6
+#define GPLL4						7
+#define GPLL5						8
+#define GPLL6						9
+#define GPLL6_OUT_MAIN					10
+#define GPLL7						11
+#define GPLL8						12
+#define GPLL8_OUT_MAIN					13
+#define GPLL9						14
+#define GPLL9_OUT_MAIN					15
+#define GCC_AHB2PHY_CSI_CLK				16
+#define GCC_AHB2PHY_USB_CLK				17
+#define GCC_APC_VS_CLK					18
+#define GCC_BIMC_GPU_AXI_CLK				19
+#define GCC_BOOT_ROM_AHB_CLK				20
+#define GCC_CAM_THROTTLE_NRT_CLK			21
+#define GCC_CAM_THROTTLE_RT_CLK				22
+#define GCC_CAMERA_AHB_CLK				23
+#define GCC_CAMERA_XO_CLK				24
+#define GCC_CAMSS_AXI_CLK				25
+#define GCC_CAMSS_AXI_CLK_SRC				26
+#define GCC_CAMSS_CAMNOC_ATB_CLK			27
+#define GCC_CAMSS_CAMNOC_NTS_XO_CLK			28
+#define GCC_CAMSS_CCI_0_CLK				29
+#define GCC_CAMSS_CCI_CLK_SRC				30
+#define GCC_CAMSS_CPHY_0_CLK				31
+#define GCC_CAMSS_CPHY_1_CLK				32
+#define GCC_CAMSS_CSI0PHYTIMER_CLK			33
+#define GCC_CAMSS_CSI0PHYTIMER_CLK_SRC			34
+#define GCC_CAMSS_CSI1PHYTIMER_CLK			35
+#define GCC_CAMSS_CSI1PHYTIMER_CLK_SRC			36
+#define GCC_CAMSS_MCLK0_CLK				37
+#define GCC_CAMSS_MCLK0_CLK_SRC				38
+#define GCC_CAMSS_MCLK1_CLK				39
+#define GCC_CAMSS_MCLK1_CLK_SRC				40
+#define GCC_CAMSS_MCLK2_CLK				41
+#define GCC_CAMSS_MCLK2_CLK_SRC				42
+#define GCC_CAMSS_MCLK3_CLK				43
+#define GCC_CAMSS_MCLK3_CLK_SRC				44
+#define GCC_CAMSS_NRT_AXI_CLK				45
+#define GCC_CAMSS_OPE_AHB_CLK				46
+#define GCC_CAMSS_OPE_AHB_CLK_SRC			47
+#define GCC_CAMSS_OPE_CLK				48
+#define GCC_CAMSS_OPE_CLK_SRC				49
+#define GCC_CAMSS_RT_AXI_CLK				50
+#define GCC_CAMSS_TFE_0_CLK				51
+#define GCC_CAMSS_TFE_0_CLK_SRC				52
+#define GCC_CAMSS_TFE_0_CPHY_RX_CLK			53
+#define GCC_CAMSS_TFE_0_CSID_CLK			54
+#define GCC_CAMSS_TFE_0_CSID_CLK_SRC			55
+#define GCC_CAMSS_TFE_1_CLK				56
+#define GCC_CAMSS_TFE_1_CLK_SRC				57
+#define GCC_CAMSS_TFE_1_CPHY_RX_CLK			58
+#define GCC_CAMSS_TFE_1_CSID_CLK			59
+#define GCC_CAMSS_TFE_1_CSID_CLK_SRC			60
+#define GCC_CAMSS_TFE_CPHY_RX_CLK_SRC			61
+#define GCC_CAMSS_TOP_AHB_CLK				62
+#define GCC_CAMSS_TOP_AHB_CLK_SRC			63
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK			64
+#define GCC_CPUSS_AHB_CLK				65
+#define GCC_CPUSS_AHB_CLK_SRC				66
+#define GCC_CPUSS_AHB_POSTDIV_CLK_SRC			67
+#define GCC_CPUSS_GNOC_CLK				68
+#define GCC_CPUSS_THROTTLE_CORE_CLK			69
+#define GCC_CPUSS_THROTTLE_XO_CLK			70
+#define GCC_DISP_AHB_CLK				71
+#define GCC_DISP_GPLL0_CLK_SRC				72
+#define GCC_DISP_GPLL0_DIV_CLK_SRC			73
+#define GCC_DISP_HF_AXI_CLK				74
+#define GCC_DISP_THROTTLE_CORE_CLK			75
+#define GCC_DISP_XO_CLK					76
+#define GCC_GP1_CLK					77
+#define GCC_GP1_CLK_SRC					78
+#define GCC_GP2_CLK					79
+#define GCC_GP2_CLK_SRC					80
+#define GCC_GP3_CLK					81
+#define GCC_GP3_CLK_SRC					82
+#define GCC_GPU_CFG_AHB_CLK				83
+#define GCC_GPU_GPLL0_CLK_SRC				84
+#define GCC_GPU_GPLL0_DIV_CLK_SRC			85
+#define GCC_GPU_IREF_CLK				86
+#define GCC_GPU_MEMNOC_GFX_CLK				87
+#define GCC_GPU_SNOC_DVM_GFX_CLK			88
+#define GCC_GPU_THROTTLE_CORE_CLK			89
+#define GCC_GPU_THROTTLE_XO_CLK				90
+#define GCC_PDM2_CLK					91
+#define GCC_PDM2_CLK_SRC				92
+#define GCC_PDM_AHB_CLK					93
+#define GCC_PDM_XO4_CLK					94
+#define GCC_PWM0_XO512_CLK				95
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK			96
+#define GCC_QMIP_CAMERA_RT_AHB_CLK			97
+#define GCC_QMIP_CPUSS_CFG_AHB_CLK			98
+#define GCC_QMIP_DISP_AHB_CLK				99
+#define GCC_QMIP_GPU_CFG_AHB_CLK			100
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK			101
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK			102
+#define GCC_QUPV3_WRAP0_CORE_CLK			103
+#define GCC_QUPV3_WRAP0_S0_CLK				104
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC			105
+#define GCC_QUPV3_WRAP0_S1_CLK				106
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC			107
+#define GCC_QUPV3_WRAP0_S2_CLK				108
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC			109
+#define GCC_QUPV3_WRAP0_S3_CLK				110
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC			111
+#define GCC_QUPV3_WRAP0_S4_CLK				112
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC			113
+#define GCC_QUPV3_WRAP0_S5_CLK				114
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC			115
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK			116
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK			117
+#define GCC_SDCC1_AHB_CLK				118
+#define GCC_SDCC1_APPS_CLK				119
+#define GCC_SDCC1_APPS_CLK_SRC				120
+#define GCC_SDCC1_ICE_CORE_CLK				121
+#define GCC_SDCC1_ICE_CORE_CLK_SRC			122
+#define GCC_SDCC2_AHB_CLK				123
+#define GCC_SDCC2_APPS_CLK				124
+#define GCC_SDCC2_APPS_CLK_SRC				125
+#define GCC_SYS_NOC_CPUSS_AHB_CLK			126
+#define GCC_SYS_NOC_USB3_PRIM_AXI_CLK			127
+#define GCC_USB30_PRIM_MASTER_CLK			128
+#define GCC_USB30_PRIM_MASTER_CLK_SRC			129
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK			130
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC		131
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV		132
+#define GCC_USB30_PRIM_SLEEP_CLK			133
+#define GCC_USB3_PRIM_CLKREF_CLK			134
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC			135
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK			136
+#define GCC_USB3_PRIM_PHY_PIPE_CLK			137
+#define GCC_VCODEC0_AXI_CLK				138
+#define GCC_VENUS_AHB_CLK				139
+#define GCC_VENUS_CTL_AXI_CLK				140
+#define GCC_VIDEO_AHB_CLK				141
+#define GCC_VIDEO_AXI0_CLK				142
+#define GCC_VIDEO_THROTTLE_CORE_CLK			143
+#define GCC_VIDEO_VCODEC0_SYS_CLK			144
+#define GCC_VIDEO_VENUS_CLK_SRC				145
+#define GCC_VIDEO_VENUS_CTL_CLK				146
+#define GCC_VIDEO_XO_CLK				147
+
+/* GCC resets */
+#define GCC_CAMSS_OPE_BCR				0
+#define GCC_CAMSS_TFE_BCR				1
+#define GCC_CAMSS_TOP_BCR				2
+#define GCC_GPU_BCR					3
+#define GCC_MMSS_BCR					4
+#define GCC_PDM_BCR					5
+#define GCC_QUPV3_WRAPPER_0_BCR				6
+#define GCC_SDCC1_BCR					7
+#define GCC_SDCC2_BCR					8
+#define GCC_USB30_PRIM_BCR				9
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR			10
+#define GCC_VCODEC0_BCR					11
+#define GCC_VENUS_BCR					12
+#define GCC_VIDEO_INTERFACE_BCR				13
+#define GCC_QUSB2PHY_PRIM_BCR				14
+#define GCC_USB3_PHY_PRIM_SP0_BCR			15
+#define GCC_USB3PHY_PHY_PRIM_SP0_BCR			16
+
+#endif
-- 
2.17.1

