Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF7C2C4F66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 08:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388494AbgKZHYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 02:24:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:42048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727760AbgKZHYf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 02:24:35 -0500
Received: from localhost.localdomain (unknown [157.49.218.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 359732068D;
        Thu, 26 Nov 2020 07:24:17 +0000 (UTC)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 6/6] clk: qcom: Add GDSC support for SDX55 GCC
Date:   Thu, 26 Nov 2020 12:51:46 +0530
Message-Id: <20201126072146.34842-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126072146.34842-1-manivannan.sadhasivam@linaro.org>
References: <20201126072146.34842-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add GDSC support to control the power supply of power domains in SDX55
GCC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/Kconfig     |  1 +
 drivers/clk/qcom/gcc-sdx55.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7897a3947e6d..05055fd18e6e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -415,6 +415,7 @@ config SDM_LPASSCC_845
 
 config SDX_GCC_55
 	tristate "SDX55 Global Clock Controller"
+	select QCOM_GDSC
 	help
 	  Support for the global clock controller on SDX55 devices.
 	  Say Y if you want to use peripheral devices such as UART,
diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index bf114165e24b..e3b9030b2bae 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -17,6 +17,7 @@
 #include "clk-pll.h"
 #include "clk-rcg.h"
 #include "clk-regmap.h"
+#include "gdsc.h"
 #include "reset.h"
 
 enum {
@@ -1455,6 +1456,30 @@ static struct clk_branch gcc_xo_pcie_link_clk = {
 	},
 };
 
+static struct gdsc usb30_gdsc = {
+	.gdscr = 0x0b004,
+	.pd = {
+		.name = "usb30_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc pcie_gdsc = {
+	.gdscr = 0x37004,
+	.pd = {
+		.name = "pcie_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc emac_gdsc = {
+	.gdscr = 0x47004,
+	.pd = {
+		.name = "emac_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_regmap *gcc_sdx55_clocks[] = {
 	[GCC_AHB_PCIE_LINK_CLK] = &gcc_ahb_pcie_link_clk.clkr,
 	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
@@ -1560,6 +1585,12 @@ static const struct qcom_reset_map gcc_sdx55_resets[] = {
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0xe000 },
 };
 
+static struct gdsc *gcc_sdx55_gdscs[] = {
+	[USB30_GDSC] = &usb30_gdsc,
+	[PCIE_GDSC] = &pcie_gdsc,
+	[EMAC_GDSC] = &emac_gdsc,
+};
+
 static const struct regmap_config gcc_sdx55_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
@@ -1574,6 +1605,8 @@ static const struct qcom_cc_desc gcc_sdx55_desc = {
 	.num_clks = ARRAY_SIZE(gcc_sdx55_clocks),
 	.resets = gcc_sdx55_resets,
 	.num_resets = ARRAY_SIZE(gcc_sdx55_resets),
+	.gdscs = gcc_sdx55_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_sdx55_gdscs),
 };
 
 static const struct of_device_id gcc_sdx55_match_table[] = {
-- 
2.25.1

