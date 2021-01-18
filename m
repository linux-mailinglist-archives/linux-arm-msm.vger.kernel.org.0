Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0797E2F98CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 05:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731034AbhAREo5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 23:44:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:56888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731303AbhAREot (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 23:44:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCF8A22517;
        Mon, 18 Jan 2021 04:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610945047;
        bh=Dj6UjTAwYqsElBxPB3WMiNnsl+dE+0niY2sVQBHBe70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c8bbhZyj9KY+/15+4KB1fjrtnLLfMA1eeFONOQrhifv4+fm8wx5wAXXoSJanibgV8
         ghqqR657ptXALAgDrpDk3MBsSAWXf5y/Si05B400I3rG5Bq9ZXdNhKuovDmcW1t2Yr
         Ay/Z2m5CtefyH/JkyVMOigSIKtOgpsi02gD3dax3JGbAhUIZnxXazcwD1IrHq8odLa
         aEg9izbgCWIUfQL+ZqYD6eUdjUavxHU55QvPCN3S3KGOFFF4toBMeB+ccz+8kvM9h1
         Io9yKpX9ITP+zAVWoBs+NoFAgm+mi4ysHne+UyIuRZ9gIuhacfeQ0bVV2+iFgQFdmT
         dsZnvY3sc1raA==
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
Subject: [PATCH v4 4/5] dt-bindings: clock: Add SM8350 GCC clock bindings
Date:   Mon, 18 Jan 2021 10:13:20 +0530
Message-Id: <20210118044321.2571775-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118044321.2571775-1-vkoul@kernel.org>
References: <20210118044321.2571775-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for global clock controller on SM8350 SoCs.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../bindings/clock/qcom,gcc-sm8350.yaml       |  96 +++++++
 include/dt-bindings/clock/qcom,gcc-sm8350.h   | 261 ++++++++++++++++++
 2 files changed, 357 insertions(+)
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
index 000000000000..2b289c5c109f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sm8350.h
@@ -0,0 +1,261 @@
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
+#define GCC_CAMERA_AHB_CLK					21
+#define GCC_CAMERA_HF_AXI_CLK					22
+#define GCC_CAMERA_SF_AXI_CLK					23
+#define GCC_CAMERA_XO_CLK					24
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				25
+#define GCC_CFG_NOC_USB3_SEC_AXI_CLK				26
+#define GCC_DDRSS_GPU_AXI_CLK					27
+#define GCC_DDRSS_PCIE_SF_TBU_CLK				28
+#define GCC_DISP_AHB_CLK					29
+#define GCC_DISP_HF_AXI_CLK					30
+#define GCC_DISP_SF_AXI_CLK					31
+#define GCC_DISP_XO_CLK						32
+#define GCC_GP1_CLK						33
+#define GCC_GP1_CLK_SRC						34
+#define GCC_GP2_CLK						35
+#define GCC_GP2_CLK_SRC						36
+#define GCC_GP3_CLK						37
+#define GCC_GP3_CLK_SRC						38
+#define GCC_GPLL0						39
+#define GCC_GPLL0_OUT_EVEN					40
+#define GCC_GPLL4						41
+#define GCC_GPLL9						42
+#define GCC_GPU_CFG_AHB_CLK					43
+#define GCC_GPU_GPLL0_CLK_SRC					44
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				45
+#define GCC_GPU_IREF_EN						46
+#define GCC_GPU_MEMNOC_GFX_CLK					47
+#define GCC_GPU_SNOC_DVM_GFX_CLK				48
+#define GCC_PCIE0_PHY_RCHNG_CLK					49
+#define GCC_PCIE1_PHY_RCHNG_CLK					50
+#define GCC_PCIE_0_AUX_CLK					51
+#define GCC_PCIE_0_AUX_CLK_SRC					52
+#define GCC_PCIE_0_CFG_AHB_CLK					53
+#define GCC_PCIE_0_CLKREF_EN					54
+#define GCC_PCIE_0_MSTR_AXI_CLK					55
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				56
+#define GCC_PCIE_0_PIPE_CLK					57
+#define GCC_PCIE_0_PIPE_CLK_SRC					58
+#define GCC_PCIE_0_SLV_AXI_CLK					59
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				60
+#define GCC_PCIE_1_AUX_CLK					61
+#define GCC_PCIE_1_AUX_CLK_SRC					62
+#define GCC_PCIE_1_CFG_AHB_CLK					63
+#define GCC_PCIE_1_CLKREF_EN					64
+#define GCC_PCIE_1_MSTR_AXI_CLK					65
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				66
+#define GCC_PCIE_1_PIPE_CLK					67
+#define GCC_PCIE_1_PIPE_CLK_SRC					68
+#define GCC_PCIE_1_SLV_AXI_CLK					69
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				70
+#define GCC_PDM2_CLK						71
+#define GCC_PDM2_CLK_SRC					72
+#define GCC_PDM_AHB_CLK						73
+#define GCC_PDM_XO4_CLK						74
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				75
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				76
+#define GCC_QMIP_DISP_AHB_CLK					77
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				78
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				79
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				80
+#define GCC_QUPV3_WRAP0_CORE_CLK				81
+#define GCC_QUPV3_WRAP0_S0_CLK					82
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				83
+#define GCC_QUPV3_WRAP0_S1_CLK					84
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				85
+#define GCC_QUPV3_WRAP0_S2_CLK					86
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				87
+#define GCC_QUPV3_WRAP0_S3_CLK					88
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				89
+#define GCC_QUPV3_WRAP0_S4_CLK					90
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				91
+#define GCC_QUPV3_WRAP0_S5_CLK					92
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				93
+#define GCC_QUPV3_WRAP0_S6_CLK					94
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC				95
+#define GCC_QUPV3_WRAP0_S7_CLK					96
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC				97
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				98
+#define GCC_QUPV3_WRAP1_CORE_CLK				99
+#define GCC_QUPV3_WRAP1_S0_CLK					100
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				101
+#define GCC_QUPV3_WRAP1_S1_CLK					102
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				103
+#define GCC_QUPV3_WRAP1_S2_CLK					104
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				105
+#define GCC_QUPV3_WRAP1_S3_CLK					106
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				107
+#define GCC_QUPV3_WRAP1_S4_CLK					108
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				109
+#define GCC_QUPV3_WRAP1_S5_CLK					110
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				111
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				112
+#define GCC_QUPV3_WRAP2_CORE_CLK				113
+#define GCC_QUPV3_WRAP2_S0_CLK					114
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				115
+#define GCC_QUPV3_WRAP2_S1_CLK					116
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				117
+#define GCC_QUPV3_WRAP2_S2_CLK					118
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				119
+#define GCC_QUPV3_WRAP2_S3_CLK					120
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				121
+#define GCC_QUPV3_WRAP2_S4_CLK					122
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				123
+#define GCC_QUPV3_WRAP2_S5_CLK					124
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				125
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				126
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				127
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				128
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				129
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				130
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				131
+#define GCC_SDCC2_AHB_CLK					132
+#define GCC_SDCC2_APPS_CLK					133
+#define GCC_SDCC2_APPS_CLK_SRC					134
+#define GCC_SDCC4_AHB_CLK					135
+#define GCC_SDCC4_APPS_CLK					136
+#define GCC_SDCC4_APPS_CLK_SRC					137
+#define GCC_THROTTLE_PCIE_AHB_CLK				138
+#define GCC_UFS_1_CLKREF_EN					139
+#define GCC_UFS_CARD_AHB_CLK					140
+#define GCC_UFS_CARD_AXI_CLK					141
+#define GCC_UFS_CARD_AXI_CLK_SRC				142
+#define GCC_UFS_CARD_AXI_HW_CTL_CLK				143
+#define GCC_UFS_CARD_ICE_CORE_CLK				144
+#define GCC_UFS_CARD_ICE_CORE_CLK_SRC				145
+#define GCC_UFS_CARD_ICE_CORE_HW_CTL_CLK			146
+#define GCC_UFS_CARD_PHY_AUX_CLK				147
+#define GCC_UFS_CARD_PHY_AUX_CLK_SRC				148
+#define GCC_UFS_CARD_PHY_AUX_HW_CTL_CLK				149
+#define GCC_UFS_CARD_RX_SYMBOL_0_CLK				150
+#define GCC_UFS_CARD_RX_SYMBOL_0_CLK_SRC			151
+#define GCC_UFS_CARD_RX_SYMBOL_1_CLK				152
+#define GCC_UFS_CARD_RX_SYMBOL_1_CLK_SRC			153
+#define GCC_UFS_CARD_TX_SYMBOL_0_CLK				154
+#define GCC_UFS_CARD_TX_SYMBOL_0_CLK_SRC			155
+#define GCC_UFS_CARD_UNIPRO_CORE_CLK				156
+#define GCC_UFS_CARD_UNIPRO_CORE_CLK_SRC			157
+#define GCC_UFS_CARD_UNIPRO_CORE_HW_CTL_CLK			158
+#define GCC_UFS_PHY_AHB_CLK					159
+#define GCC_UFS_PHY_AXI_CLK					160
+#define GCC_UFS_PHY_AXI_CLK_SRC					161
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				162
+#define GCC_UFS_PHY_ICE_CORE_CLK				163
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				164
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				165
+#define GCC_UFS_PHY_PHY_AUX_CLK					166
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				167
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				168
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				169
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				170
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				171
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				172
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				173
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				174
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				175
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				176
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			177
+#define GCC_USB30_PRIM_MASTER_CLK				178
+#define GCC_USB30_PRIM_MASTER_CLK__FORCE_MEM_CORE_ON		179
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				180
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				181
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			182
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		183
+#define GCC_USB30_PRIM_SLEEP_CLK				184
+#define GCC_USB30_SEC_MASTER_CLK				185
+#define GCC_USB30_SEC_MASTER_CLK__FORCE_MEM_CORE_ON		186
+#define GCC_USB30_SEC_MASTER_CLK_SRC				187
+#define GCC_USB30_SEC_MOCK_UTMI_CLK				188
+#define GCC_USB30_SEC_MOCK_UTMI_CLK_SRC				189
+#define GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC			190
+#define GCC_USB30_SEC_SLEEP_CLK					191
+#define GCC_USB3_PRIM_PHY_AUX_CLK				192
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				193
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				194
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				195
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				196
+#define GCC_USB3_SEC_CLKREF_EN					197
+#define GCC_USB3_SEC_PHY_AUX_CLK				198
+#define GCC_USB3_SEC_PHY_AUX_CLK_SRC				199
+#define GCC_USB3_SEC_PHY_COM_AUX_CLK				200
+#define GCC_USB3_SEC_PHY_PIPE_CLK				201
+#define GCC_USB3_SEC_PHY_PIPE_CLK_SRC				202
+#define GCC_VIDEO_AHB_CLK					203
+#define GCC_VIDEO_AXI0_CLK					204
+#define GCC_VIDEO_AXI1_CLK					205
+#define GCC_VIDEO_XO_CLK					206
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

