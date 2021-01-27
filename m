Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B74C30543F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 08:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233240AbhA0HNB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 02:13:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:45612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232736AbhA0HJW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 02:09:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EEF320732;
        Wed, 27 Jan 2021 07:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611731320;
        bh=f6xyWan9Xa8gZy7zOijZSVU4hptonVTozERI8W5lxTE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=giO3HJmmIfEprYGoH6Xfr8yEPsWdbiVQhZgF+pal1rDlGv6SUHFvHF4x9xdOLCb9b
         d81lvxgX80wwgaINuMEE32mNbR0ls41mxsKwuMCMkCubyitsFwp0BIckrsRSUdfIlg
         WVDF006DcoSwbfj0RKUN8wqq3q5Fqv4twq+MtKrjkpYIrztuSFQFBwkv8Dtlzn/x5p
         l5VHCm2nx1chMH/kuhjb5rrdgLpj8D23ZoUgGiHNawIVMHuMQorfYq8DICF2sL5l1T
         txx1ApvWN4VDyF6+eK4v+J74QB+zMOgArfENS5G9CSpqUQ0IKrsaPzUcO6KhRQU7bi
         2evWO2sgJHhrw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 4/5] dt-bindings: clock: Add SM8350 GCC clock bindings
Date:   Wed, 27 Jan 2021 12:38:10 +0530
Message-Id: <20210127070811.152690-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127070811.152690-1-vkoul@kernel.org>
References: <20210127070811.152690-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for global clock controller on SM8350 SoCs.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../bindings/clock/qcom,gcc-sm8350.yaml       |  96 +++++++
 include/dt-bindings/clock/qcom,gcc-sm8350.h   | 254 ++++++++++++++++++
 2 files changed, 350 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
new file mode 100644
index 000000000000..78f35832aa41
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sm8350.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for SM8350
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SM8350.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sm8350.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sm8350
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PLL test clock source (Optional clock)
+      - description: PCIE 0 Pipe clock source (Optional clock)
+      - description: PCIE 1 Pipe clock source (Optional clock)
+      - description: UFS card Rx symbol 0 clock source (Optional clock)
+      - description: UFS card Rx symbol 1 clock source (Optional clock)
+      - description: UFS card Tx symbol 0 clock source (Optional clock)
+      - description: UFS phy Rx symbol 0 clock source (Optional clock)
+      - description: UFS phy Rx symbol 1 clock source (Optional clock)
+      - description: UFS phy Tx symbol 0 clock source (Optional clock)
+      - description: USB3 phy wrapper pipe clock source (Optional clock)
+      - description: USB3 phy sec pipe clock source (Optional clock)
+    minItems: 2
+    maxItems: 13
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: sleep_clk
+      - const: core_bi_pll_test_se # Optional clock
+      - const: pcie_0_pipe_clk # Optional clock
+      - const: pcie_1_pipe_clk # Optional clock
+      - const: ufs_card_rx_symbol_0_clk # Optional clock
+      - const: ufs_card_rx_symbol_1_clk # Optional clock
+      - const: ufs_card_tx_symbol_0_clk # Optional clock
+      - const: ufs_phy_rx_symbol_0_clk # Optional clock
+      - const: ufs_phy_rx_symbol_1_clk # Optional clock
+      - const: ufs_phy_tx_symbol_0_clk # Optional clock
+      - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
+      - const: usb3_uni_phy_sec_gcc_usb30_pipe_clk # Optional clock
+    minItems: 2
+    maxItems: 13
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
+      compatible = "qcom,gcc-sm8350";
+      reg = <0x00100000 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8350.h b/include/dt-bindings/clock/qcom,gcc-sm8350.h
new file mode 100644
index 000000000000..1331da65f669
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sm8350.h
@@ -0,0 +1,254 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020-2021, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
+
+/* GCC HW clocks */
+#define CORE_BI_PLL_TEST_SE					0
+#define PCIE_0_PIPE_CLK						1
+#define PCIE_1_PIPE_CLK						2
+#define UFS_CARD_RX_SYMBOL_0_CLK				3
+#define UFS_CARD_RX_SYMBOL_1_CLK				4
+#define UFS_CARD_TX_SYMBOL_0_CLK				5
+#define UFS_PHY_RX_SYMBOL_0_CLK					6
+#define UFS_PHY_RX_SYMBOL_1_CLK					7
+#define UFS_PHY_TX_SYMBOL_0_CLK					8
+#define USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK			9
+#define USB3_UNI_PHY_SEC_GCC_USB30_PIPE_CLK			10
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_0_AXI_CLK				11
+#define GCC_AGGRE_NOC_PCIE_1_AXI_CLK				12
+#define GCC_AGGRE_NOC_PCIE_TBU_CLK				13
+#define GCC_AGGRE_UFS_CARD_AXI_CLK				14
+#define GCC_AGGRE_UFS_CARD_AXI_HW_CTL_CLK			15
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				16
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			17
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				18
+#define GCC_AGGRE_USB3_SEC_AXI_CLK				19
+#define GCC_BOOT_ROM_AHB_CLK					20
+#define GCC_CAMERA_HF_AXI_CLK					21
+#define GCC_CAMERA_SF_AXI_CLK					22
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				23
+#define GCC_CFG_NOC_USB3_SEC_AXI_CLK				24
+#define GCC_DDRSS_GPU_AXI_CLK					25
+#define GCC_DDRSS_PCIE_SF_TBU_CLK				26
+#define GCC_DISP_HF_AXI_CLK					27
+#define GCC_DISP_SF_AXI_CLK					28
+#define GCC_GP1_CLK						29
+#define GCC_GP1_CLK_SRC						30
+#define GCC_GP2_CLK						31
+#define GCC_GP2_CLK_SRC						32
+#define GCC_GP3_CLK						33
+#define GCC_GP3_CLK_SRC						34
+#define GCC_GPLL0						35
+#define GCC_GPLL0_OUT_EVEN					36
+#define GCC_GPLL4						37
+#define GCC_GPLL9						38
+#define GCC_GPU_GPLL0_CLK_SRC					39
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				40
+#define GCC_GPU_IREF_EN						41
+#define GCC_GPU_MEMNOC_GFX_CLK					42
+#define GCC_GPU_SNOC_DVM_GFX_CLK				43
+#define GCC_PCIE0_PHY_RCHNG_CLK					44
+#define GCC_PCIE1_PHY_RCHNG_CLK					45
+#define GCC_PCIE_0_AUX_CLK					46
+#define GCC_PCIE_0_AUX_CLK_SRC					47
+#define GCC_PCIE_0_CFG_AHB_CLK					48
+#define GCC_PCIE_0_CLKREF_EN					49
+#define GCC_PCIE_0_MSTR_AXI_CLK					50
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				51
+#define GCC_PCIE_0_PIPE_CLK					52
+#define GCC_PCIE_0_PIPE_CLK_SRC					53
+#define GCC_PCIE_0_SLV_AXI_CLK					54
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				55
+#define GCC_PCIE_1_AUX_CLK					56
+#define GCC_PCIE_1_AUX_CLK_SRC					57
+#define GCC_PCIE_1_CFG_AHB_CLK					58
+#define GCC_PCIE_1_CLKREF_EN					59
+#define GCC_PCIE_1_MSTR_AXI_CLK					60
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				61
+#define GCC_PCIE_1_PIPE_CLK					62
+#define GCC_PCIE_1_PIPE_CLK_SRC					63
+#define GCC_PCIE_1_SLV_AXI_CLK					64
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				65
+#define GCC_PDM2_CLK						66
+#define GCC_PDM2_CLK_SRC					67
+#define GCC_PDM_AHB_CLK						68
+#define GCC_PDM_XO4_CLK						69
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				70
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				71
+#define GCC_QMIP_DISP_AHB_CLK					72
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				73
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				74
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				75
+#define GCC_QUPV3_WRAP0_CORE_CLK				76
+#define GCC_QUPV3_WRAP0_S0_CLK					77
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				78
+#define GCC_QUPV3_WRAP0_S1_CLK					79
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				80
+#define GCC_QUPV3_WRAP0_S2_CLK					81
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				82
+#define GCC_QUPV3_WRAP0_S3_CLK					83
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				84
+#define GCC_QUPV3_WRAP0_S4_CLK					85
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				86
+#define GCC_QUPV3_WRAP0_S5_CLK					87
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				88
+#define GCC_QUPV3_WRAP0_S6_CLK					89
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC				90
+#define GCC_QUPV3_WRAP0_S7_CLK					91
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC				92
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				93
+#define GCC_QUPV3_WRAP1_CORE_CLK				94
+#define GCC_QUPV3_WRAP1_S0_CLK					95
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				96
+#define GCC_QUPV3_WRAP1_S1_CLK					97
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				98
+#define GCC_QUPV3_WRAP1_S2_CLK					99
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				100
+#define GCC_QUPV3_WRAP1_S3_CLK					101
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				102
+#define GCC_QUPV3_WRAP1_S4_CLK					103
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				104
+#define GCC_QUPV3_WRAP1_S5_CLK					105
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				106
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				107
+#define GCC_QUPV3_WRAP2_CORE_CLK				108
+#define GCC_QUPV3_WRAP2_S0_CLK					109
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				110
+#define GCC_QUPV3_WRAP2_S1_CLK					111
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				112
+#define GCC_QUPV3_WRAP2_S2_CLK					113
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				114
+#define GCC_QUPV3_WRAP2_S3_CLK					115
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				116
+#define GCC_QUPV3_WRAP2_S4_CLK					117
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				118
+#define GCC_QUPV3_WRAP2_S5_CLK					119
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				120
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				121
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				122
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				123
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				124
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				125
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				126
+#define GCC_SDCC2_AHB_CLK					127
+#define GCC_SDCC2_APPS_CLK					128
+#define GCC_SDCC2_APPS_CLK_SRC					129
+#define GCC_SDCC4_AHB_CLK					130
+#define GCC_SDCC4_APPS_CLK					131
+#define GCC_SDCC4_APPS_CLK_SRC					132
+#define GCC_THROTTLE_PCIE_AHB_CLK				133
+#define GCC_UFS_1_CLKREF_EN					134
+#define GCC_UFS_CARD_AHB_CLK					135
+#define GCC_UFS_CARD_AXI_CLK					136
+#define GCC_UFS_CARD_AXI_CLK_SRC				137
+#define GCC_UFS_CARD_AXI_HW_CTL_CLK				138
+#define GCC_UFS_CARD_ICE_CORE_CLK				139
+#define GCC_UFS_CARD_ICE_CORE_CLK_SRC				140
+#define GCC_UFS_CARD_ICE_CORE_HW_CTL_CLK			141
+#define GCC_UFS_CARD_PHY_AUX_CLK				142
+#define GCC_UFS_CARD_PHY_AUX_CLK_SRC				143
+#define GCC_UFS_CARD_PHY_AUX_HW_CTL_CLK				144
+#define GCC_UFS_CARD_RX_SYMBOL_0_CLK				145
+#define GCC_UFS_CARD_RX_SYMBOL_0_CLK_SRC			146
+#define GCC_UFS_CARD_RX_SYMBOL_1_CLK				147
+#define GCC_UFS_CARD_RX_SYMBOL_1_CLK_SRC			148
+#define GCC_UFS_CARD_TX_SYMBOL_0_CLK				149
+#define GCC_UFS_CARD_TX_SYMBOL_0_CLK_SRC			150
+#define GCC_UFS_CARD_UNIPRO_CORE_CLK				151
+#define GCC_UFS_CARD_UNIPRO_CORE_CLK_SRC			152
+#define GCC_UFS_CARD_UNIPRO_CORE_HW_CTL_CLK			153
+#define GCC_UFS_PHY_AHB_CLK					154
+#define GCC_UFS_PHY_AXI_CLK					155
+#define GCC_UFS_PHY_AXI_CLK_SRC					156
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				157
+#define GCC_UFS_PHY_ICE_CORE_CLK				158
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				159
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				160
+#define GCC_UFS_PHY_PHY_AUX_CLK					161
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				162
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				163
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				164
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				165
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				166
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				167
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				168
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				169
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				170
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				171
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			172
+#define GCC_USB30_PRIM_MASTER_CLK				173
+#define GCC_USB30_PRIM_MASTER_CLK__FORCE_MEM_CORE_ON		174
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				175
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				176
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			177
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		178
+#define GCC_USB30_PRIM_SLEEP_CLK				179
+#define GCC_USB30_SEC_MASTER_CLK				180
+#define GCC_USB30_SEC_MASTER_CLK__FORCE_MEM_CORE_ON		181
+#define GCC_USB30_SEC_MASTER_CLK_SRC				182
+#define GCC_USB30_SEC_MOCK_UTMI_CLK				183
+#define GCC_USB30_SEC_MOCK_UTMI_CLK_SRC				184
+#define GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC			185
+#define GCC_USB30_SEC_SLEEP_CLK					186
+#define GCC_USB3_PRIM_PHY_AUX_CLK				187
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				188
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				189
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				190
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				191
+#define GCC_USB3_SEC_CLKREF_EN					192
+#define GCC_USB3_SEC_PHY_AUX_CLK				193
+#define GCC_USB3_SEC_PHY_AUX_CLK_SRC				194
+#define GCC_USB3_SEC_PHY_COM_AUX_CLK				195
+#define GCC_USB3_SEC_PHY_PIPE_CLK				196
+#define GCC_USB3_SEC_PHY_PIPE_CLK_SRC				197
+#define GCC_VIDEO_AXI0_CLK					198
+#define GCC_VIDEO_AXI1_CLK					199
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_GPU_BCR						2
+#define GCC_MMSS_BCR						3
+#define GCC_PCIE_0_BCR						4
+#define GCC_PCIE_0_LINK_DOWN_BCR				5
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				6
+#define GCC_PCIE_0_PHY_BCR					7
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			8
+#define GCC_PCIE_1_BCR						9
+#define GCC_PCIE_1_LINK_DOWN_BCR				10
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				11
+#define GCC_PCIE_1_PHY_BCR					12
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			13
+#define GCC_PCIE_PHY_CFG_AHB_BCR				14
+#define GCC_PCIE_PHY_COM_BCR					15
+#define GCC_PDM_BCR						16
+#define GCC_QUPV3_WRAPPER_0_BCR					17
+#define GCC_QUPV3_WRAPPER_1_BCR					18
+#define GCC_QUPV3_WRAPPER_2_BCR					19
+#define GCC_QUSB2PHY_PRIM_BCR					20
+#define GCC_QUSB2PHY_SEC_BCR					21
+#define GCC_SDCC2_BCR						22
+#define GCC_SDCC4_BCR						23
+#define GCC_UFS_CARD_BCR					24
+#define GCC_UFS_PHY_BCR						25
+#define GCC_USB30_PRIM_BCR					26
+#define GCC_USB30_SEC_BCR					27
+#define GCC_USB3_DP_PHY_PRIM_BCR				28
+#define GCC_USB3_DP_PHY_SEC_BCR					29
+#define GCC_USB3_PHY_PRIM_BCR					30
+#define GCC_USB3_PHY_SEC_BCR					31
+#define GCC_USB3PHY_PHY_PRIM_BCR				32
+#define GCC_USB3PHY_PHY_SEC_BCR					33
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				34
+#define GCC_VIDEO_AXI0_CLK_ARES					35
+#define GCC_VIDEO_AXI1_CLK_ARES					36
+#define GCC_VIDEO_BCR						37
+
+#endif
-- 
2.26.2

