Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA814339B01
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 03:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbhCMCDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 21:03:39 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:44995 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbhCMCDZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 21:03:25 -0500
Received: from localhost.localdomain (abac242.neoplus.adsl.tpnet.pl [83.6.166.242])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 1B53A3F356;
        Sat, 13 Mar 2021 03:03:18 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: Add MDM9607 GCC clock bindings
Date:   Sat, 13 Mar 2021 03:03:07 +0100
Message-Id: <20210313020310.386152-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for global clock controller on MDM9607 SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../devicetree/bindings/clock/qcom,gcc.yaml   |   2 +
 include/dt-bindings/clock/qcom,gcc-mdm9607.h  | 104 ++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gcc-mdm9607.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index ee0467fb5e31..5f7ea48d7c52 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -29,6 +29,7 @@ description: |
   - dt-bindings/clock/qcom,gcc-msm8974.h
   - dt-bindings/reset/qcom,gcc-msm8974.h
   - dt-bindings/clock/qcom,gcc-msm8994.h
+  - dt-bindings/clock/qcom,gcc-mdm9607.h
   - dt-bindings/clock/qcom,gcc-mdm9615.h
   - dt-bindings/reset/qcom,gcc-mdm9615.h
   - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
@@ -41,6 +42,7 @@ properties:
       - qcom,gcc-ipq4019
       - qcom,gcc-ipq6018
       - qcom,gcc-ipq8064
+      - qcom,gcc-mdm9607
       - qcom,gcc-msm8660
       - qcom,gcc-msm8916
       - qcom,gcc-msm8939
diff --git a/include/dt-bindings/clock/qcom,gcc-mdm9607.h b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
new file mode 100644
index 000000000000..357a680a40da
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MSM_GCC_9607_H
+#define _DT_BINDINGS_CLK_MSM_GCC_9607_H
+
+#define GPLL0							0
+#define GPLL0_EARLY						1
+#define GPLL1							2
+#define GPLL1_VOTE						3
+#define GPLL2							4
+#define GPLL2_EARLY						5
+#define PCNOC_BFDCD_CLK_SRC				6
+#define SYSTEM_NOC_BFDCD_CLK_SRC		7
+#define GCC_SMMU_CFG_CLK				8
+#define APSS_AHB_CLK_SRC				9
+#define GCC_QDSS_DAP_CLK				10
+#define BLSP1_QUP1_I2C_APPS_CLK_SRC		11
+#define BLSP1_QUP1_SPI_APPS_CLK_SRC		12
+#define BLSP1_QUP2_I2C_APPS_CLK_SRC		13
+#define BLSP1_QUP2_SPI_APPS_CLK_SRC		14
+#define BLSP1_QUP3_I2C_APPS_CLK_SRC		15
+#define BLSP1_QUP3_SPI_APPS_CLK_SRC		16
+#define BLSP1_QUP4_I2C_APPS_CLK_SRC		17
+#define BLSP1_QUP4_SPI_APPS_CLK_SRC		18
+#define BLSP1_QUP5_I2C_APPS_CLK_SRC		19
+#define BLSP1_QUP5_SPI_APPS_CLK_SRC		20
+#define BLSP1_QUP6_I2C_APPS_CLK_SRC		21
+#define BLSP1_QUP6_SPI_APPS_CLK_SRC		22
+#define BLSP1_UART1_APPS_CLK_SRC		23
+#define BLSP1_UART2_APPS_CLK_SRC		24
+#define CRYPTO_CLK_SRC					25
+#define GP1_CLK_SRC						26
+#define GP2_CLK_SRC						27
+#define GP3_CLK_SRC						28
+#define PDM2_CLK_SRC					29
+#define SDCC1_APPS_CLK_SRC				30
+#define SDCC2_APPS_CLK_SRC				31
+#define APSS_TCU_CLK_SRC				32
+#define USB_HS_SYSTEM_CLK_SRC			33
+#define GCC_BLSP1_AHB_CLK				34
+#define GCC_BLSP1_SLEEP_CLK				35
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK		36
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK		37
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK		38
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK		39
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK		40
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK		41
+#define GCC_BLSP1_QUP4_I2C_APPS_CLK		42
+#define GCC_BLSP1_QUP4_SPI_APPS_CLK		43
+#define GCC_BLSP1_QUP5_I2C_APPS_CLK		44
+#define GCC_BLSP1_QUP5_SPI_APPS_CLK		45
+#define GCC_BLSP1_QUP6_I2C_APPS_CLK		46
+#define GCC_BLSP1_QUP6_SPI_APPS_CLK		47
+#define GCC_BLSP1_UART1_APPS_CLK		48
+#define GCC_BLSP1_UART2_APPS_CLK		49
+#define GCC_BOOT_ROM_AHB_CLK			50
+#define GCC_CRYPTO_AHB_CLK				51
+#define GCC_CRYPTO_AXI_CLK				52
+#define GCC_CRYPTO_CLK					53
+#define GCC_GP1_CLK						54
+#define GCC_GP2_CLK						55
+#define GCC_GP3_CLK						56
+#define GCC_MSS_CFG_AHB_CLK				57
+#define GCC_PDM2_CLK					58
+#define GCC_PDM_AHB_CLK					59
+#define GCC_PRNG_AHB_CLK				60
+#define GCC_SDCC1_AHB_CLK				61
+#define GCC_SDCC1_APPS_CLK				62
+#define GCC_SDCC2_AHB_CLK				63
+#define GCC_SDCC2_APPS_CLK				64
+#define GCC_USB2A_PHY_SLEEP_CLK			65
+#define GCC_USB_HS_AHB_CLK				66
+#define GCC_USB_HS_SYSTEM_CLK			67
+#define GCC_APSS_TCU_CLK				68
+#define GCC_MSS_Q6_BIMC_AXI_CLK			69
+#define BIMC_PLL						70
+#define BIMC_PLL_VOTE					71
+#define BIMC_DDR_CLK_SRC				72
+#define BLSP1_UART3_APPS_CLK_SRC		73
+#define BLSP1_UART4_APPS_CLK_SRC		74
+#define BLSP1_UART5_APPS_CLK_SRC		75
+#define BLSP1_UART6_APPS_CLK_SRC		76
+#define GCC_BLSP1_UART3_APPS_CLK		77
+#define GCC_BLSP1_UART4_APPS_CLK		78
+#define GCC_BLSP1_UART5_APPS_CLK		79
+#define GCC_BLSP1_UART6_APPS_CLK		80
+#define GCC_APSS_AHB_CLK				81
+#define GCC_APSS_AXI_CLK				82
+#define GCC_USB_HS_PHY_CFG_AHB_CLK			83
+#define GCC_USB_HSIC_CLK_SRC			84
+#define GCC_USB_HSIC_IO_CAL_CLK_SRC		85
+#define GCC_USB_HSIC_SYSTEM_CLK_SRC		86
+
+/* Resets */
+#define USB2_HS_PHY_ONLY_BCR			0
+#define QUSB2_PHY_BCR					1
+#define GCC_MSS_RESTART					2
+#define USB_HS_HSIC_BCR					3
+#define USB_HS_BCR						4
+
+#endif
-- 
2.30.2

