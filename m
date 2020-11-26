Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0342C4F4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 08:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgKZHWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 02:22:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:41344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727468AbgKZHWs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 02:22:48 -0500
Received: from localhost.localdomain (unknown [157.49.218.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BF6A2173E;
        Thu, 26 Nov 2020 07:22:26 +0000 (UTC)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/6] dt-bindings: clock: Add SDX55 GCC clock bindings
Date:   Thu, 26 Nov 2020 12:51:41 +0530
Message-Id: <20201126072146.34842-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126072146.34842-1-manivannan.sadhasivam@linaro.org>
References: <20201126072146.34842-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Add device tree bindings for global clock controller on SDX55 SoCs.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/qcom,gcc-sdx55.yaml        |  77 ++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx55.h    | 112 ++++++++++++++++++
 2 files changed, 189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
new file mode 100644
index 000000000000..1121b3934cb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sdx55.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for SDX55
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SDX55
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sdx55.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sdx55
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PLL test clock source (Optional clock)
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: sleep_clk
+      - const: core_bi_pll_test_se # Optional clock
+    minItems: 2
+    maxItems: 3
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sdx55";
+      reg = <0x00100000 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>, <&pll_test_clk>;
+      clock-names = "bi_tcxo", "sleep_clk", "core_bi_pll_test_se";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-sdx55.h b/include/dt-bindings/clock/qcom,gcc-sdx55.h
new file mode 100644
index 000000000000..c372451b3461
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sdx55.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, Linaro Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SDX55_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SDX55_H
+
+#define GPLL0							3
+#define GPLL0_OUT_EVEN						4
+#define GPLL4							5
+#define GPLL4_OUT_EVEN						6
+#define GPLL5							7
+#define GCC_AHB_PCIE_LINK_CLK					8
+#define GCC_BLSP1_AHB_CLK					9
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK				10
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK_SRC				11
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK				12
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC				13
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK				14
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK_SRC				15
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK				16
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC				17
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK				18
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK_SRC				19
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK				20
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK_SRC				21
+#define GCC_BLSP1_QUP4_I2C_APPS_CLK				22
+#define GCC_BLSP1_QUP4_I2C_APPS_CLK_SRC				23
+#define GCC_BLSP1_QUP4_SPI_APPS_CLK				24
+#define GCC_BLSP1_QUP4_SPI_APPS_CLK_SRC				25
+#define GCC_BLSP1_UART1_APPS_CLK				26
+#define GCC_BLSP1_UART1_APPS_CLK_SRC				27
+#define GCC_BLSP1_UART2_APPS_CLK				28
+#define GCC_BLSP1_UART2_APPS_CLK_SRC				29
+#define GCC_BLSP1_UART3_APPS_CLK				30
+#define GCC_BLSP1_UART3_APPS_CLK_SRC				31
+#define GCC_BLSP1_UART4_APPS_CLK				32
+#define GCC_BLSP1_UART4_APPS_CLK_SRC				33
+#define GCC_BOOT_ROM_AHB_CLK					34
+#define GCC_CE1_AHB_CLK						35
+#define GCC_CE1_AXI_CLK						36
+#define GCC_CE1_CLK						37
+#define GCC_CPUSS_AHB_CLK					38
+#define GCC_CPUSS_AHB_CLK_SRC					39
+#define GCC_CPUSS_GNOC_CLK					40
+#define GCC_CPUSS_RBCPR_CLK					41
+#define GCC_CPUSS_RBCPR_CLK_SRC					42
+#define GCC_EMAC_CLK_SRC					43
+#define GCC_EMAC_PTP_CLK_SRC					44
+#define GCC_ETH_AXI_CLK						45
+#define GCC_ETH_PTP_CLK						46
+#define GCC_ETH_RGMII_CLK					47
+#define GCC_ETH_SLAVE_AHB_CLK					48
+#define GCC_GP1_CLK						49
+#define GCC_GP1_CLK_SRC						50
+#define GCC_GP2_CLK						51
+#define GCC_GP2_CLK_SRC						52
+#define GCC_GP3_CLK						53
+#define GCC_GP3_CLK_SRC						54
+#define GCC_PCIE_0_CLKREF_CLK					55
+#define GCC_PCIE_AUX_CLK					56
+#define GCC_PCIE_AUX_PHY_CLK_SRC				57
+#define GCC_PCIE_CFG_AHB_CLK					58
+#define GCC_PCIE_MSTR_AXI_CLK					59
+#define GCC_PCIE_PIPE_CLK					60
+#define GCC_PCIE_RCHNG_PHY_CLK					61
+#define GCC_PCIE_RCHNG_PHY_CLK_SRC				62
+#define GCC_PCIE_SLEEP_CLK					63
+#define GCC_PCIE_SLV_AXI_CLK					64
+#define GCC_PCIE_SLV_Q2A_AXI_CLK				65
+#define GCC_PDM2_CLK						66
+#define GCC_PDM2_CLK_SRC					67
+#define GCC_PDM_AHB_CLK						68
+#define GCC_PDM_XO4_CLK						69
+#define GCC_SDCC1_AHB_CLK					70
+#define GCC_SDCC1_APPS_CLK					71
+#define GCC_SDCC1_APPS_CLK_SRC					72
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				73
+#define GCC_USB30_MASTER_CLK					74
+#define GCC_USB30_MASTER_CLK_SRC				75
+#define GCC_USB30_MOCK_UTMI_CLK					76
+#define GCC_USB30_MOCK_UTMI_CLK_SRC				77
+#define GCC_USB30_MSTR_AXI_CLK					78
+#define GCC_USB30_SLEEP_CLK					79
+#define GCC_USB30_SLV_AHB_CLK					80
+#define GCC_USB3_PHY_AUX_CLK					81
+#define GCC_USB3_PHY_AUX_CLK_SRC				82
+#define GCC_USB3_PHY_PIPE_CLK					83
+#define GCC_USB3_PRIM_CLKREF_CLK				84
+#define GCC_USB_PHY_CFG_AHB2PHY_CLK				85
+#define GCC_XO_DIV4_CLK						86
+#define GCC_XO_PCIE_LINK_CLK					87
+
+#define GCC_EMAC_BCR						0
+#define GCC_PCIE_BCR						1
+#define GCC_PCIE_LINK_DOWN_BCR					2
+#define GCC_PCIE_NOCSR_COM_PHY_BCR				3
+#define GCC_PCIE_PHY_BCR					4
+#define GCC_PCIE_PHY_CFG_AHB_BCR				5
+#define GCC_PCIE_PHY_COM_BCR					6
+#define GCC_PCIE_PHY_NOCSR_COM_PHY_BCR				7
+#define GCC_PDM_BCR						8
+#define GCC_QUSB2PHY_BCR					9
+#define GCC_TCSR_PCIE_BCR					10
+#define GCC_USB30_BCR						11
+#define GCC_USB3_PHY_BCR					12
+#define GCC_USB3PHY_PHY_BCR					13
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
+
+#endif
-- 
2.25.1

