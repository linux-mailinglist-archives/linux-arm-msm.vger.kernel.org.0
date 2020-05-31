Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3FB1E999C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgEaRrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgEaRrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:47:07 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF869C061A0E;
        Sun, 31 May 2020 10:47:06 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h5so3258929wrc.7;
        Sun, 31 May 2020 10:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=54c/VkyG7zWK2wudUgkHaKc/UuvX1aZOp8mnK3ioXeI=;
        b=Y8wC0qoaxJdwNCDEQ+nKhvOlxZmvGiPXTlyNj+yWC2mwqTyP+f448StNT4RLN4aMXS
         n07xkJ8zwUC6F5l2768V4DAY9FdypIJG4m0iJzwbkGA1ov18gnBvOnvkcyf4vr/oFn2L
         a1FEgIbKr7UHnJmpekT/iYMSzdKskUxQKj9F7LEhuvXGEUhY3EmUv0whUSY02vL6ws7N
         T+IbfidhEqxJmGyIYjqtVX0rbPIeQTNT79C5ocT4PsxyY9Abt+Sv1gFuc0272V4E5go4
         ObNOzlw5xQbX8RqjhFQXi4KJNck8stwu4ygydDCH4/T6aO5nyn7PYeAyEv1byuu/uYHw
         BsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=54c/VkyG7zWK2wudUgkHaKc/UuvX1aZOp8mnK3ioXeI=;
        b=tO5Bv0Jd9bFKAqn5HtySq3d5992gUmZbL9oN+QQm411rPX3+R8FH5wBPDftFDOKfSV
         wzTxBe2DIOCI9hGlo1SBcqwZ1SmMHDeKTCnDlvMSoqjCCSeWpDXLAx6fgCR7aF1FcONw
         43b1QyvvIjNvGB6+BQ25wZ8hQiQs/YeFLfxCKWNU7q4DUBvO6ChqfOFaINlUKTA4LfmM
         y0GyXIluoOTgzB16G7wZEy2V4FH+3wnkGVTxcnwrbFGh5pKSfwIt4jJaOclWsnyns64e
         1tMn/xBI8k41ySgWVGuc4X40jeP3dtzXqS98/9s9Ii/N60K6T+79lGTeVj5sA3ZtkfCE
         cltQ==
X-Gm-Message-State: AOAM531wZoSU9IViyoREpc6coZN3FiAZ4tSlu+yrgD8IPGhk1/p0L6a1
        noSlu4RJerCdeovTk7OKi8E=
X-Google-Smtp-Source: ABdhPJzfVnGgRlyXkL1Nh1MyAf/R00KoeRBAkqtMQGMIqzv3vNVK2fC/yWugfNkZvaFbOv2UhDqjCQ==
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr17783858wrr.282.1590947224869;
        Sun, 31 May 2020 10:47:04 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id x186sm9716494wmg.8.2020.05.31.10.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:47:04 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drivers: clk: qcom: Add msm8992 GCC driver
Date:   Sun, 31 May 2020 19:46:07 +0200
Message-Id: <20200531174612.260113-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531174612.260113-1-konradybcio@gmail.com>
References: <20200531174612.260113-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for the msm8992 Global
Clock Controller with GDSC and resets support.
It is in fact very similar to msm8994, but features
less clocks (no PCIE1 or UFS) and adds support for the
missing ones (such as USB-related clocks).

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/clk/qcom/gcc-msm8992.c | 2429 ++++++++++++++++++++++++++++++++
 1 file changed, 2429 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-msm8992.c

diff --git a/drivers/clk/qcom/gcc-msm8992.c b/drivers/clk/qcom/gcc-msm8992.c
new file mode 100644
index 000000000000..3e8c0243be78
--- /dev/null
+++ b/drivers/clk/qcom/gcc-msm8992.c
@@ -0,0 +1,2429 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/ctype.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,gcc-msm8992.h>
+#include <dt-bindings/reset/qcom,gcc-msm8992.h>
+
+#include "common.h"
+#include "clk-regmap.h"
+#include "clk-alpha-pll.h"
+#include "clk-rcg.h"
+#include "clk-branch.h"
+#include "reset.h"
+#include "gdsc.h"
+
+enum {
+	P_XO,
+	P_GPLL0,
+	P_GPLL4,
+};
+
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+};
+
+static const char * const gcc_xo_gpll0[] = {
+	"xo",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 },
+};
+
+static const char * const gcc_xo_gpll0_gpll4[] = {
+	"xo",
+	"gpll0",
+	"gpll4",
+};
+
+static struct clk_fixed_factor xo = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data)
+	{
+		.name = "xo",
+		.parent_names = (const char *[]) { "xo_board" },
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll0_early = {
+	.offset = 0x00000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x1480,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gpll0_early",
+			.parent_names = (const char *[]) { "xo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll0 = {
+	.offset = 0x00000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "gpll0",
+		.parent_names = (const char *[]) { "gpll0_early" },
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll4_early = {
+	.offset = 0x1dc0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x1480,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gpll4_early",
+			.parent_names = (const char *[]) { "xo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll4 = {
+	.offset = 0x1dc0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "gpll4",
+		.parent_names = (const char *[]) { "gpll4_early" },
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ops,
+	},
+};
+
+static struct freq_tbl ftbl_usb30_master_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(125000000, P_GPLL0, 1, 5, 24),
+	{ }
+};
+
+static struct clk_rcg2 usb30_master_clk_src = {
+	.cmd_rcgr = 0x03d4,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_usb30_master_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "usb30_master_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_blsp_i2c_apps_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0660,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup1_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_blspqup_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
+	.cmd_rcgr = 0x064c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup1_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x06e0,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup2_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
+	.cmd_rcgr = 0x06cc,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup2_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0760,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup3_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
+	.cmd_rcgr = 0x074c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup3_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x07e0,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup4_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
+	.cmd_rcgr = 0x07cc,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup4_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0860,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup5_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
+	.cmd_rcgr = 0x084c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup5_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x08e0,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup6_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
+	.cmd_rcgr = 0x08cc,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_qup6_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_blsp_uart_apps_clk_src[] = {
+	F(3686400, P_GPLL0, 1, 96, 15625),
+	F(7372800, P_GPLL0, 1, 192, 15625),
+	F(14745600, P_GPLL0, 1, 384, 15625),
+	F(16000000, P_GPLL0, 5, 2, 15),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 5, 1, 5),
+	F(32000000, P_GPLL0, 1, 4, 75),
+	F(40000000, P_GPLL0, 15, 0, 0),
+	F(46400000, P_GPLL0, 1, 29, 375),
+	F(48000000, P_GPLL0, 12.5, 0, 0),
+	F(51200000, P_GPLL0, 1, 32, 375),
+	F(56000000, P_GPLL0, 1, 7, 75),
+	F(58982400, P_GPLL0, 1, 1536, 15625),
+	F(60000000, P_GPLL0, 10, 0, 0),
+	F(63160000, P_GPLL0, 9.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
+	.cmd_rcgr = 0x068c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_uart1_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
+	.cmd_rcgr = 0x070c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_uart2_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
+	.cmd_rcgr = 0x078c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_uart3_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
+	.cmd_rcgr = 0x080c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_uart4_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
+	.cmd_rcgr = 0x088c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_uart5_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
+	.cmd_rcgr = 0x090c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp1_uart6_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x09a0,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup1_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
+	.cmd_rcgr = 0x098c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup1_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0a20,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup2_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
+	.cmd_rcgr = 0x0a0c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup2_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0aa0,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup3_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
+	.cmd_rcgr = 0x0a8c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup3_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0b20,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup4_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
+	.cmd_rcgr = 0x0b0c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup4_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0ba0,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup5_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
+	.cmd_rcgr = 0x0b8c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup5_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0c20,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup6_i2c_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
+	.cmd_rcgr = 0x0c0c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_qup6_spi_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
+	.cmd_rcgr = 0x09cc,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_uart1_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
+	.cmd_rcgr = 0x0a4c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_uart2_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
+	.cmd_rcgr = 0x0acc,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_uart3_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
+	.cmd_rcgr = 0x0b4c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_uart4_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
+	.cmd_rcgr = 0x0bcc,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_uart5_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
+	.cmd_rcgr = 0x0c4c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "blsp2_uart6_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_gp1_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(200000000, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gp1_clk_src = {
+	.cmd_rcgr = 0x1904,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "gp1_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_gp2_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(200000000, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gp2_clk_src = {
+	.cmd_rcgr = 0x1944,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_gp2_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "gp2_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_gp3_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(200000000, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gp3_clk_src = {
+	.cmd_rcgr = 0x1984,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_gp3_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "gp3_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_pcie_0_aux_clk_src[] = {
+	F(1011000, P_XO, 1, 1, 19),
+	{ }
+};
+
+static struct clk_rcg2 pcie_0_aux_clk_src = {
+	.cmd_rcgr = 0x1b00,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.freq_tbl = ftbl_pcie_0_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "pcie_0_aux_clk_src",
+		.parent_names = (const char *[]) { "xo" },
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_pcie_pipe_clk_src[] = {
+	F(125000000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 pcie_0_pipe_clk_src = {
+	.cmd_rcgr = 0x1adc,
+	.hid_width = 5,
+	.freq_tbl = ftbl_pcie_pipe_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "pcie_0_pipe_clk_src",
+		.parent_names = (const char *[]) { "xo" },
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_pdm2_clk_src[] = {
+	F(60000000, P_GPLL0, 10, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 pdm2_clk_src = {
+	.cmd_rcgr = 0x0cd0,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_pdm2_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "pdm2_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_sdcc1_apps_clk_src[] = {
+	F(144000, P_XO, 16, 3, 25),
+	F(400000, P_XO, 12, 1, 4),
+	F(20000000, P_GPLL0, 15, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(192000000, P_GPLL4, 2, 0, 0),
+	F(384000000, P_GPLL4, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x04d0,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll4_map,
+	.freq_tbl = ftbl_sdcc1_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "sdcc1_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll4,
+		.num_parents = 3,
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static struct freq_tbl ftbl_sdcc2_4_apps_clk_src[] = {
+	F(144000, P_XO, 16, 3, 25),
+	F(400000, P_XO, 12, 1, 4),
+	F(20000000, P_GPLL0, 15, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(200000000, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 sdcc2_apps_clk_src = {
+	.cmd_rcgr = 0x0510,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "sdcc2_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static struct clk_rcg2 sdcc3_apps_clk_src = {
+	.cmd_rcgr = 0x0550,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "sdcc3_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static struct clk_rcg2 sdcc4_apps_clk_src = {
+	.cmd_rcgr = 0x0590,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "sdcc4_apps_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static struct freq_tbl ftbl_tsif_ref_clk_src[] = {
+	F(105500, P_XO, 1, 1, 182),
+	{ }
+};
+
+static struct clk_rcg2 tsif_ref_clk_src = {
+	.cmd_rcgr = 0x0d90,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.freq_tbl = ftbl_tsif_ref_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "tsif_ref_clk_src",
+		.parent_names = (const char *[]) { "xo" },
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_usb30_mock_utmi_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(60000000, P_GPLL0, 10, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 usb30_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x03e8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_usb30_mock_utmi_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "usb30_mock_utmi_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_usb3_phy_aux_clk_src[] = {
+	F(1200000, P_XO, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 usb3_phy_aux_clk_src = {
+	.cmd_rcgr = 0x1414,
+	.hid_width = 5,
+	.freq_tbl = ftbl_usb3_phy_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "usb3_phy_aux_clk_src",
+		.parent_names = (const char *[]) { "xo" },
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct freq_tbl ftbl_usb_hs_system_clk_src[] = {
+	F(75000000, P_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 usb_hs_system_clk_src = {
+	.cmd_rcgr = 0x0490,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_usb_hs_system_clk_src,
+	.clkr.hw.init = &(struct clk_init_data)
+	{
+		.name = "usb_hs_system_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_blsp1_ahb_clk = {
+	.halt_reg = 0x05c4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1484,
+		.enable_mask = BIT(17),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
+	.halt_reg = 0x0648,
+	.clkr = {
+		.enable_reg = 0x0648,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup1_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup1_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
+	.halt_reg = 0x0644,
+	.clkr = {
+		.enable_reg = 0x0644,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup1_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup1_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
+	.halt_reg = 0x06c8,
+	.clkr = {
+		.enable_reg = 0x06c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup2_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup2_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
+	.halt_reg = 0x06c4,
+	.clkr = {
+		.enable_reg = 0x06c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup2_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup2_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
+	.halt_reg = 0x0748,
+	.clkr = {
+		.enable_reg = 0x0748,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup3_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup3_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
+	.halt_reg = 0x0744,
+	.clkr = {
+		.enable_reg = 0x0744,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup3_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup3_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
+	.halt_reg = 0x07c8,
+	.clkr = {
+		.enable_reg = 0x07c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup4_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup4_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
+	.halt_reg = 0x07c4,
+	.clkr = {
+		.enable_reg = 0x07c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup4_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup4_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
+	.halt_reg = 0x0848,
+	.clkr = {
+		.enable_reg = 0x0848,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup5_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup5_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
+	.halt_reg = 0x0844,
+	.clkr = {
+		.enable_reg = 0x0844,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup5_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup5_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
+	.halt_reg = 0x08c8,
+	.clkr = {
+		.enable_reg = 0x08c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup6_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup6_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
+	.halt_reg = 0x08c4,
+	.clkr = {
+		.enable_reg = 0x08c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_qup6_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_qup6_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart1_apps_clk = {
+	.halt_reg = 0x0684,
+	.clkr = {
+		.enable_reg = 0x0684,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_uart1_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_uart1_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart2_apps_clk = {
+	.halt_reg = 0x0704,
+	.clkr = {
+		.enable_reg = 0x0704,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_uart2_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_uart2_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart3_apps_clk = {
+	.halt_reg = 0x0784,
+	.clkr = {
+		.enable_reg = 0x0784,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_uart3_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_uart3_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart4_apps_clk = {
+	.halt_reg = 0x0804,
+	.clkr = {
+		.enable_reg = 0x0804,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_uart4_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_uart4_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart5_apps_clk = {
+	.halt_reg = 0x0884,
+	.clkr = {
+		.enable_reg = 0x0884,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_uart5_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_uart5_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart6_apps_clk = {
+	.halt_reg = 0x0904,
+	.clkr = {
+		.enable_reg = 0x0904,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp1_uart6_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp1_uart6_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_ahb_clk = {
+	.halt_reg = 0x0944,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1484,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup1_i2c_apps_clk = {
+	.halt_reg = 0x0988,
+	.clkr = {
+		.enable_reg = 0x0988,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup1_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup1_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup1_spi_apps_clk = {
+	.halt_reg = 0x0984,
+	.clkr = {
+		.enable_reg = 0x0984,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup1_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup1_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup2_i2c_apps_clk = {
+	.halt_reg = 0x0a08,
+	.clkr = {
+		.enable_reg = 0x0a08,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup2_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup2_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup2_spi_apps_clk = {
+	.halt_reg = 0x0a04,
+	.clkr = {
+		.enable_reg = 0x0a04,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup2_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup2_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
+	.halt_reg = 0x0a88,
+	.clkr = {
+		.enable_reg = 0x0a88,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup3_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup3_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
+	.halt_reg = 0x0a84,
+	.clkr = {
+		.enable_reg = 0x0a84,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup3_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup3_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
+	.halt_reg = 0x0b08,
+	.clkr = {
+		.enable_reg = 0x0b08,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup4_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup4_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
+	.halt_reg = 0x0b04,
+	.clkr = {
+		.enable_reg = 0x0b04,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup4_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup4_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup5_i2c_apps_clk = {
+	.halt_reg = 0x0b88,
+	.clkr = {
+		.enable_reg = 0x0b88,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup5_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup5_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup5_spi_apps_clk = {
+	.halt_reg = 0x0b84,
+	.clkr = {
+		.enable_reg = 0x0b84,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup5_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup5_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup6_i2c_apps_clk = {
+	.halt_reg = 0x0c08,
+	.clkr = {
+		.enable_reg = 0x0c08,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup6_i2c_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup6_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup6_spi_apps_clk = {
+	.halt_reg = 0x0c04,
+	.clkr = {
+		.enable_reg = 0x0c04,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_qup6_spi_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_qup6_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_uart1_apps_clk = {
+	.halt_reg = 0x09c4,
+	.clkr = {
+		.enable_reg = 0x09c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_uart1_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_uart1_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_uart2_apps_clk = {
+	.halt_reg = 0x0a44,
+	.clkr = {
+		.enable_reg = 0x0a44,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_uart2_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_uart2_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_uart3_apps_clk = {
+	.halt_reg = 0x0ac4,
+	.clkr = {
+		.enable_reg = 0x0ac4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_uart3_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_uart3_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_uart4_apps_clk = {
+	.halt_reg = 0x0b44,
+	.clkr = {
+		.enable_reg = 0x0b44,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_uart4_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_uart4_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_uart5_apps_clk = {
+	.halt_reg = 0x0bc4,
+	.clkr = {
+		.enable_reg = 0x0bc4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_uart5_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_uart5_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_uart6_apps_clk = {
+	.halt_reg = 0x0c44,
+	.clkr = {
+		.enable_reg = 0x0c44,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_blsp2_uart6_apps_clk",
+			.parent_names = (const char *[]) {
+				"blsp2_uart6_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_boot_rom_ahb_clk = {
+	.halt_reg = 0x0e04,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1484,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_boot_rom_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp1_clk = {
+	.halt_reg = 0x1900,
+	.clkr = {
+		.enable_reg = 0x1900,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_gp1_clk",
+			.parent_names = (const char *[]) {
+				"gp1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp2_clk = {
+	.halt_reg = 0x1940,
+	.clkr = {
+		.enable_reg = 0x1940,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_gp2_clk",
+			.parent_names = (const char *[]) {
+				"gp2_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp3_clk = {
+	.halt_reg = 0x1980,
+	.clkr = {
+		.enable_reg = 0x1980,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_gp3_clk",
+			.parent_names = (const char *[]) {
+				"gp3_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_cfg_ahb_clk = {
+	.halt_reg = 0x0280,
+	.clkr = {
+		.enable_reg = 0x0280,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_mss_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x0284,
+	.clkr = {
+		.enable_reg = 0x0284,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_aux_clk = {
+	.halt_reg = 0x1ad4,
+	.clkr = {
+		.enable_reg = 0x1ad4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_0_aux_clk",
+			.parent_names = (const char *[]) {
+				"pcie_0_aux_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
+	.halt_reg = 0x1ad0,
+	.clkr = {
+		.enable_reg = 0x1ad0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_0_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
+	.halt_reg = 0x1acc,
+	.clkr = {
+		.enable_reg = 0x1acc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_0_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_pipe_clk = {
+	.halt_reg = 0x1ad8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1ad8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_0_pipe_clk",
+			.parent_names = (const char *[]) {
+				"pcie_0_pipe_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_slv_axi_clk = {
+	.halt_reg = 0x1ac8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1ac8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pcie_0_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm2_clk = {
+	.halt_reg = 0x0ccc,
+	.clkr = {
+		.enable_reg = 0x0ccc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pdm2_clk",
+			.parent_names = (const char *[]) {
+				"pdm2_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_ahb_clk = {
+	.halt_reg = 0x0cc4,
+	.clkr = {
+		.enable_reg = 0x0cc4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_pdm_ahb_clk",
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_prng_ahb_clk = {
+	.halt_reg = 0x0d04,
+	.clkr = {
+		.enable_reg = 0x0d04,
+		.enable_mask = BIT(13),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_prng_ahb_clk",
+			.ops = &clk_branch2_ops,
+		}
+	}
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0x04c8,
+	.clkr = {
+		.enable_reg = 0x04c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc1_ahb_clk",
+			.parent_names = (const char *[]){
+				"periph_noc_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0x04c4,
+	.clkr = {
+		.enable_reg = 0x04c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_names = (const char *[]) {
+				"sdcc1_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_ahb_clk = {
+	.halt_reg = 0x0508,
+	.clkr = {
+		.enable_reg = 0x0508,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc2_ahb_clk",
+			.parent_names = (const char *[]){
+				"periph_noc_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_apps_clk = {
+	.halt_reg = 0x0504,
+	.clkr = {
+		.enable_reg = 0x0504,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc2_apps_clk",
+			.parent_names = (const char *[]) {
+				"sdcc2_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc3_ahb_clk = {
+	.halt_reg = 0x0548,
+	.clkr = {
+		.enable_reg = 0x0548,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc3_ahb_clk",
+			.parent_names = (const char *[]){
+				"periph_noc_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc3_apps_clk = {
+	.halt_reg = 0x0544,
+	.clkr = {
+		.enable_reg = 0x0544,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc3_apps_clk",
+			.parent_names = (const char *[]) {
+				"sdcc3_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc4_ahb_clk = {
+	.halt_reg = 0x0588,
+	.clkr = {
+		.enable_reg = 0x0588,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc4_ahb_clk",
+			.parent_names = (const char *[]){
+				"periph_noc_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc4_apps_clk = {
+	.halt_reg = 0x0584,
+	.clkr = {
+		.enable_reg = 0x0584,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sdcc4_apps_clk",
+			.parent_names = (const char *[]) {
+				"sdcc4_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_usb3_axi_clk = {
+	.halt_reg = 0x03fc,
+	.clkr = {
+		.enable_reg = 0x03fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_sys_noc_usb3_axi_clk",
+			.parent_names = (const char *[]) {
+				"usb30_master_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_tsif_ahb_clk = {
+	.halt_reg = 0x0d84,
+	.clkr = {
+		.enable_reg = 0x0d84,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_tsif_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_tsif_ref_clk = {
+	.halt_reg = 0x0d88,
+	.clkr = {
+		.enable_reg = 0x0d88,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_tsif_ref_clk",
+			.parent_names = (const char *[]) {
+				"tsif_ref_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb2_hs_phy_sleep_clk = {
+	.halt_reg = 0x04ac,
+	.clkr = {
+		.enable_reg = 0x04ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb2_hs_phy_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_master_clk = {
+	.halt_reg = 0x03c8,
+	.clkr = {
+		.enable_reg = 0x03c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb30_master_clk",
+			.parent_names = (const char *[]) {
+				"usb30_master_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_mock_utmi_clk = {
+	.halt_reg = 0x03d0,
+	.clkr = {
+		.enable_reg = 0x03d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb30_mock_utmi_clk",
+			.parent_names = (const char *[]) {
+				"usb30_mock_utmi_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_sleep_clk = {
+	.halt_reg = 0x03cc,
+	.clkr = {
+		.enable_reg = 0x03cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb30_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_phy_aux_clk = {
+	.halt_reg = 0x1408,
+	.clkr = {
+		.enable_reg = 0x1408,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb3_phy_aux_clk",
+			.parent_names = (const char *[]) {
+				"usb3_phy_aux_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_phy_pipe_clk = {
+	.halt_reg = 0x140c,
+	.clkr = {
+		.enable_reg = 0x140c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb3_phy_pipe_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_hs_ahb_clk = {
+	.halt_reg = 0x0488,
+	.clkr = {
+		.enable_reg = 0x0488,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb_hs_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_hs_system_clk = {
+	.halt_reg = 0x0484,
+	.clkr = {
+		.enable_reg = 0x0484,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb_hs_system_clk",
+			.parent_names = (const char *[]) {
+				"usb_hs_system_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
+	.halt_reg = 0x1a84,
+	.clkr = {
+		.enable_reg = 0x1a84,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data)
+		{
+			.name = "gcc_usb_phy_cfg_ahb2phy_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc pcie_gdsc = {
+		.gdscr = 0x1e18,
+		.pd = {
+			.name = "pcie",
+		},
+		.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc pcie_0_gdsc = {
+		.gdscr = 0x1ac4,
+		.pd = {
+			.name = "pcie_0",
+		},
+		.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc usb30_gdsc = {
+		.gdscr = 0x3c4,
+		.pd = {
+			.name = "usb30",
+		},
+		.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct clk_regmap *gcc_msm8992_clocks[] = {
+	[GPLL0_EARLY] = &gpll0_early.clkr,
+	[GPLL0] = &gpll0.clkr,
+	[GPLL4_EARLY] = &gpll4_early.clkr,
+	[GPLL4] = &gpll4.clkr,
+	[USB30_MASTER_CLK_SRC] = &usb30_master_clk_src.clkr,
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
+	[BLSP1_UART3_APPS_CLK_SRC] = &blsp1_uart3_apps_clk_src.clkr,
+	[BLSP1_UART4_APPS_CLK_SRC] = &blsp1_uart4_apps_clk_src.clkr,
+	[BLSP1_UART5_APPS_CLK_SRC] = &blsp1_uart5_apps_clk_src.clkr,
+	[BLSP1_UART6_APPS_CLK_SRC] = &blsp1_uart6_apps_clk_src.clkr,
+	[BLSP2_QUP1_I2C_APPS_CLK_SRC] = &blsp2_qup1_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP1_SPI_APPS_CLK_SRC] = &blsp2_qup1_spi_apps_clk_src.clkr,
+	[BLSP2_QUP2_I2C_APPS_CLK_SRC] = &blsp2_qup2_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP2_SPI_APPS_CLK_SRC] = &blsp2_qup2_spi_apps_clk_src.clkr,
+	[BLSP2_QUP3_I2C_APPS_CLK_SRC] = &blsp2_qup3_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP3_SPI_APPS_CLK_SRC] = &blsp2_qup3_spi_apps_clk_src.clkr,
+	[BLSP2_QUP4_I2C_APPS_CLK_SRC] = &blsp2_qup4_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP4_SPI_APPS_CLK_SRC] = &blsp2_qup4_spi_apps_clk_src.clkr,
+	[BLSP2_QUP5_I2C_APPS_CLK_SRC] = &blsp2_qup5_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP5_SPI_APPS_CLK_SRC] = &blsp2_qup5_spi_apps_clk_src.clkr,
+	[BLSP2_QUP6_I2C_APPS_CLK_SRC] = &blsp2_qup6_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP6_SPI_APPS_CLK_SRC] = &blsp2_qup6_spi_apps_clk_src.clkr,
+	[BLSP2_UART1_APPS_CLK_SRC] = &blsp2_uart1_apps_clk_src.clkr,
+	[BLSP2_UART2_APPS_CLK_SRC] = &blsp2_uart2_apps_clk_src.clkr,
+	[BLSP2_UART3_APPS_CLK_SRC] = &blsp2_uart3_apps_clk_src.clkr,
+	[BLSP2_UART4_APPS_CLK_SRC] = &blsp2_uart4_apps_clk_src.clkr,
+	[BLSP2_UART5_APPS_CLK_SRC] = &blsp2_uart5_apps_clk_src.clkr,
+	[BLSP2_UART6_APPS_CLK_SRC] = &blsp2_uart6_apps_clk_src.clkr,
+	[GP1_CLK_SRC] = &gp1_clk_src.clkr,
+	[GP2_CLK_SRC] = &gp2_clk_src.clkr,
+	[GP3_CLK_SRC] = &gp3_clk_src.clkr,
+	[PCIE_0_AUX_CLK_SRC] = &pcie_0_aux_clk_src.clkr,
+	[PCIE_0_PIPE_CLK_SRC] = &pcie_0_pipe_clk_src.clkr,
+	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
+	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
+	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
+	[SDCC3_APPS_CLK_SRC] = &sdcc3_apps_clk_src.clkr,
+	[SDCC4_APPS_CLK_SRC] = &sdcc4_apps_clk_src.clkr,
+	[TSIF_REF_CLK_SRC] = &tsif_ref_clk_src.clkr,
+	[USB30_MOCK_UTMI_CLK_SRC] = &usb30_mock_utmi_clk_src.clkr,
+	[USB3_PHY_AUX_CLK_SRC] = &usb3_phy_aux_clk_src.clkr,
+	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
+	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
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
+	[GCC_BLSP1_UART3_APPS_CLK] = &gcc_blsp1_uart3_apps_clk.clkr,
+	[GCC_BLSP1_UART4_APPS_CLK] = &gcc_blsp1_uart4_apps_clk.clkr,
+	[GCC_BLSP1_UART5_APPS_CLK] = &gcc_blsp1_uart5_apps_clk.clkr,
+	[GCC_BLSP1_UART6_APPS_CLK] = &gcc_blsp1_uart6_apps_clk.clkr,
+	[GCC_BLSP2_AHB_CLK] = &gcc_blsp2_ahb_clk.clkr,
+	[GCC_BLSP2_QUP1_I2C_APPS_CLK] = &gcc_blsp2_qup1_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP1_SPI_APPS_CLK] = &gcc_blsp2_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP2_QUP2_I2C_APPS_CLK] = &gcc_blsp2_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP2_SPI_APPS_CLK] = &gcc_blsp2_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP2_QUP3_I2C_APPS_CLK] = &gcc_blsp2_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP3_SPI_APPS_CLK] = &gcc_blsp2_qup3_spi_apps_clk.clkr,
+	[GCC_BLSP2_QUP4_I2C_APPS_CLK] = &gcc_blsp2_qup4_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP4_SPI_APPS_CLK] = &gcc_blsp2_qup4_spi_apps_clk.clkr,
+	[GCC_BLSP2_QUP5_I2C_APPS_CLK] = &gcc_blsp2_qup5_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP5_SPI_APPS_CLK] = &gcc_blsp2_qup5_spi_apps_clk.clkr,
+	[GCC_BLSP2_QUP6_I2C_APPS_CLK] = &gcc_blsp2_qup6_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP6_SPI_APPS_CLK] = &gcc_blsp2_qup6_spi_apps_clk.clkr,
+	[GCC_BLSP2_UART1_APPS_CLK] = &gcc_blsp2_uart1_apps_clk.clkr,
+	[GCC_BLSP2_UART2_APPS_CLK] = &gcc_blsp2_uart2_apps_clk.clkr,
+	[GCC_BLSP2_UART3_APPS_CLK] = &gcc_blsp2_uart3_apps_clk.clkr,
+	[GCC_BLSP2_UART4_APPS_CLK] = &gcc_blsp2_uart4_apps_clk.clkr,
+	[GCC_BLSP2_UART5_APPS_CLK] = &gcc_blsp2_uart5_apps_clk.clkr,
+	[GCC_BLSP2_UART6_APPS_CLK] = &gcc_blsp2_uart6_apps_clk.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_MSS_CFG_AHB_CLK] = &gcc_mss_cfg_ahb_clk.clkr,
+	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
+	[GCC_PCIE_0_AUX_CLK] = &gcc_pcie_0_aux_clk.clkr,
+	[GCC_PCIE_0_CFG_AHB_CLK] = &gcc_pcie_0_cfg_ahb_clk.clkr,
+	[GCC_PCIE_0_MSTR_AXI_CLK] = &gcc_pcie_0_mstr_axi_clk.clkr,
+	[GCC_PCIE_0_PIPE_CLK] = &gcc_pcie_0_pipe_clk.clkr,
+	[GCC_PCIE_0_SLV_AXI_CLK] = &gcc_pcie_0_slv_axi_clk.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
+	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
+	[GCC_SDCC3_AHB_CLK] = &gcc_sdcc3_ahb_clk.clkr,
+	[GCC_SDCC3_APPS_CLK] = &gcc_sdcc3_apps_clk.clkr,
+	[GCC_SDCC4_AHB_CLK] = &gcc_sdcc4_ahb_clk.clkr,
+	[GCC_SDCC4_APPS_CLK] = &gcc_sdcc4_apps_clk.clkr,
+	[GCC_SYS_NOC_USB3_AXI_CLK] = &gcc_sys_noc_usb3_axi_clk.clkr,
+	[GCC_TSIF_AHB_CLK] = &gcc_tsif_ahb_clk.clkr,
+	[GCC_TSIF_REF_CLK] = &gcc_tsif_ref_clk.clkr,
+	[GCC_USB2_HS_PHY_SLEEP_CLK] = &gcc_usb2_hs_phy_sleep_clk.clkr,
+	[GCC_USB30_MASTER_CLK] = &gcc_usb30_master_clk.clkr,
+	[GCC_USB30_MOCK_UTMI_CLK] = &gcc_usb30_mock_utmi_clk.clkr,
+	[GCC_USB30_SLEEP_CLK] = &gcc_usb30_sleep_clk.clkr,
+	[GCC_USB3_PHY_AUX_CLK] = &gcc_usb3_phy_aux_clk.clkr,
+	[GCC_USB3_PHY_PIPE_CLK] = &gcc_usb3_phy_pipe_clk.clkr,
+	[GCC_USB_HS_AHB_CLK] = &gcc_usb_hs_ahb_clk.clkr,
+	[GCC_USB_HS_SYSTEM_CLK] = &gcc_usb_hs_system_clk.clkr,
+	[GCC_USB_PHY_CFG_AHB2PHY_CLK] = &gcc_usb_phy_cfg_ahb2phy_clk.clkr,
+};
+
+static struct gdsc *gcc_msm8992_gdscs[] = {
+	[PCIE_GDSC] = &pcie_gdsc,
+	[PCIE_0_GDSC] = &pcie_0_gdsc,
+	[USB30_GDSC] = &usb30_gdsc,
+};
+
+static const struct qcom_reset_map gcc_msm8992_resets[] = {
+	[PCIE_PHY_0_RESET] = { 0x1B18 },
+	[QUSB2_PHY_RESET] = { 0x04B8 },
+	[USB3_PHY_RESET] = { 0x1400 },
+};
+
+static const struct regmap_config gcc_msm8992_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x2000,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gcc_msm8992_desc = {
+	.config = &gcc_msm8992_regmap_config,
+	.clks = gcc_msm8992_clocks,
+	.num_clks = ARRAY_SIZE(gcc_msm8992_clocks),
+	.resets = gcc_msm8992_resets,
+	.num_resets = ARRAY_SIZE(gcc_msm8992_resets),
+	.gdscs = gcc_msm8992_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_msm8992_gdscs),
+};
+
+static const struct of_device_id gcc_msm8992_match_table[] = {
+	{ .compatible = "qcom,gcc-msm8992" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, gcc_msm8992_match_table);
+
+static int gcc_msm8992_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk *clk;
+
+	clk = devm_clk_register(dev, &xo.hw);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	return qcom_cc_probe(pdev, &gcc_msm8992_desc);
+}
+
+static struct platform_driver gcc_msm8992_driver = {
+	.probe		= gcc_msm8992_probe,
+	.driver		= {
+		.name	= "gcc-msm8992",
+		.of_match_table = gcc_msm8992_match_table,
+	},
+};
+
+static int __init gcc_msm8992_init(void)
+{
+	return platform_driver_register(&gcc_msm8992_driver);
+}
+core_initcall(gcc_msm8992_init);
+
+static void __exit gcc_msm8992_exit(void)
+{
+	platform_driver_unregister(&gcc_msm8992_driver);
+}
+module_exit(gcc_msm8992_exit);
+
+MODULE_DESCRIPTION("Qualcomm GCC MSM8992 Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:gcc-msm8992");
-- 
2.26.2

