Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C127E3F3559
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 22:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239175AbhHTUhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 16:37:10 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:49891 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239084AbhHTUhK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 16:37:10 -0400
Received: from localhost.localdomain (83.6.167.97.neoplus.adsl.tpnet.pl [83.6.167.97])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 5580F3F34A;
        Fri, 20 Aug 2021 22:36:30 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: Add SM6350 GCC clock bindings
Date:   Fri, 20 Aug 2021 22:36:23 +0200
Message-Id: <20210820203624.232268-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210820203624.232268-1-konrad.dybcio@somainline.org>
References: <20210820203624.232268-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for global clock controller on SM6350 SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../bindings/clock/qcom,gcc-sm6350.yaml       |  76 ++++++++
 include/dt-bindings/clock/qcom,gcc-sm6350.h   | 178 ++++++++++++++++++
 2 files changed, 254 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
new file mode 100644
index 000000000000..20926cd8293e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sm6350.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for SM6350
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@somainline.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SM6350.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sm6350.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sm6350
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: sleep_clk
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
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
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
+      compatible = "qcom,gcc-sm6350";
+      reg = <0x00100000 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-sm6350.h b/include/dt-bindings/clock/qcom,gcc-sm6350.h
new file mode 100644
index 000000000000..ba584ca33c39
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sm6350.h
@@ -0,0 +1,178 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM6350_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM6350_H
+
+/* GCC clocks */
+#define GPLL0					0
+#define GPLL0_OUT_EVEN				1
+#define GPLL0_OUT_ODD				2
+#define GPLL6					3
+#define GPLL6_OUT_EVEN				4
+#define GPLL7					5
+#define GCC_AGGRE_CNOC_PERIPH_CENTER_AHB_CLK	6
+#define GCC_AGGRE_NOC_CENTER_AHB_CLK		7
+#define GCC_AGGRE_NOC_PCIE_SF_AXI_CLK		8
+#define GCC_AGGRE_NOC_PCIE_TBU_CLK		9
+#define GCC_AGGRE_NOC_WLAN_AXI_CLK		10
+#define GCC_AGGRE_UFS_PHY_AXI_CLK		11
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK		12
+#define GCC_BOOT_ROM_AHB_CLK			13
+#define GCC_CAMERA_AHB_CLK			14
+#define GCC_CAMERA_AXI_CLK			15
+#define GCC_CAMERA_THROTTLE_NRT_AXI_CLK		16
+#define GCC_CAMERA_THROTTLE_RT_AXI_CLK		17
+#define GCC_CAMERA_XO_CLK			18
+#define GCC_CE1_AHB_CLK				19
+#define GCC_CE1_AXI_CLK				20
+#define GCC_CE1_CLK				21
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK		22
+#define GCC_CPUSS_AHB_CLK			23
+#define GCC_CPUSS_AHB_CLK_SRC			24
+#define GCC_CPUSS_AHB_DIV_CLK_SRC		25
+#define GCC_CPUSS_GNOC_CLK			26
+#define GCC_CPUSS_RBCPR_CLK			27
+#define GCC_DDRSS_GPU_AXI_CLK			28
+#define GCC_DISP_AHB_CLK			29
+#define GCC_DISP_AXI_CLK			30
+#define GCC_DISP_CC_SLEEP_CLK			31
+#define GCC_DISP_CC_XO_CLK			32
+#define GCC_DISP_GPLL0_CLK			33
+#define GCC_DISP_THROTTLE_AXI_CLK		34
+#define GCC_DISP_XO_CLK				35
+#define GCC_GP1_CLK				36
+#define GCC_GP1_CLK_SRC				37
+#define GCC_GP2_CLK				38
+#define GCC_GP2_CLK_SRC				39
+#define GCC_GP3_CLK				40
+#define GCC_GP3_CLK_SRC				41
+#define GCC_GPU_CFG_AHB_CLK			42
+#define GCC_GPU_GPLL0_CLK			43
+#define GCC_GPU_GPLL0_DIV_CLK			44
+#define GCC_GPU_MEMNOC_GFX_CLK			45
+#define GCC_GPU_SNOC_DVM_GFX_CLK		46
+#define GCC_NPU_AXI_CLK				47
+#define GCC_NPU_BWMON_AXI_CLK			48
+#define GCC_NPU_BWMON_DMA_CFG_AHB_CLK		49
+#define GCC_NPU_BWMON_DSP_CFG_AHB_CLK		50
+#define GCC_NPU_CFG_AHB_CLK			51
+#define GCC_NPU_DMA_CLK				52
+#define GCC_NPU_GPLL0_CLK			53
+#define GCC_NPU_GPLL0_DIV_CLK			54
+#define GCC_PCIE_0_AUX_CLK			55
+#define GCC_PCIE_0_AUX_CLK_SRC			56
+#define GCC_PCIE_0_CFG_AHB_CLK			57
+#define GCC_PCIE_0_MSTR_AXI_CLK			58
+#define GCC_PCIE_0_PIPE_CLK			59
+#define GCC_PCIE_0_SLV_AXI_CLK			60
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK		61
+#define GCC_PCIE_PHY_RCHNG_CLK			62
+#define GCC_PCIE_PHY_RCHNG_CLK_SRC		63
+#define GCC_PDM2_CLK				64
+#define GCC_PDM2_CLK_SRC			65
+#define GCC_PDM_AHB_CLK				66
+#define GCC_PDM_XO4_CLK				67
+#define GCC_PRNG_AHB_CLK			68
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK		69
+#define GCC_QUPV3_WRAP0_CORE_CLK		70
+#define GCC_QUPV3_WRAP0_S0_CLK			71
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC		72
+#define GCC_QUPV3_WRAP0_S1_CLK			73
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC		74
+#define GCC_QUPV3_WRAP0_S2_CLK			75
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC		76
+#define GCC_QUPV3_WRAP0_S3_CLK			77
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC		78
+#define GCC_QUPV3_WRAP0_S4_CLK			79
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC		80
+#define GCC_QUPV3_WRAP0_S5_CLK			81
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC		82
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK		83
+#define GCC_QUPV3_WRAP1_CORE_CLK		84
+#define GCC_QUPV3_WRAP1_S0_CLK			85
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC		86
+#define GCC_QUPV3_WRAP1_S1_CLK			87
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC		88
+#define GCC_QUPV3_WRAP1_S2_CLK			89
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC		90
+#define GCC_QUPV3_WRAP1_S3_CLK			91
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC		92
+#define GCC_QUPV3_WRAP1_S4_CLK			93
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC		94
+#define GCC_QUPV3_WRAP1_S5_CLK			95
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC		96
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK		97
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK		98
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK		99
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK		100
+#define GCC_SDCC1_AHB_CLK			101
+#define GCC_SDCC1_APPS_CLK			102
+#define GCC_SDCC1_APPS_CLK_SRC			103
+#define GCC_SDCC1_ICE_CORE_CLK			104
+#define GCC_SDCC1_ICE_CORE_CLK_SRC		105
+#define GCC_SDCC2_AHB_CLK			106
+#define GCC_SDCC2_APPS_CLK			107
+#define GCC_SDCC2_APPS_CLK_SRC			108
+#define GCC_SYS_NOC_CPUSS_AHB_CLK		109
+#define GCC_UFS_MEM_CLKREF_CLK			110
+#define GCC_UFS_PHY_AHB_CLK			111
+#define GCC_UFS_PHY_AXI_CLK			112
+#define GCC_UFS_PHY_AXI_CLK_SRC			113
+#define GCC_UFS_PHY_ICE_CORE_CLK		114
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC		115
+#define GCC_UFS_PHY_PHY_AUX_CLK			116
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC		117
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK		118
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK		119
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK		120
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK		121
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC		122
+#define GCC_USB30_PRIM_MASTER_CLK		123
+#define GCC_USB30_PRIM_MASTER_CLK_SRC		124
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK		125
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC	126
+#define GCC_USB30_PRIM_MOCK_UTMI_DIV_CLK_SRC	127
+#define GCC_USB3_PRIM_CLKREF_CLK		128
+#define GCC_USB30_PRIM_SLEEP_CLK		129
+#define GCC_USB3_PRIM_PHY_AUX_CLK		130
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC		131
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK		132
+#define GCC_USB3_PRIM_PHY_PIPE_CLK		133
+#define GCC_VIDEO_AHB_CLK			134
+#define GCC_VIDEO_AXI_CLK			135
+#define GCC_VIDEO_THROTTLE_AXI_CLK		136
+#define GCC_VIDEO_XO_CLK			137
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK		138
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK		139
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK	140
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK	141
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK		142
+#define GCC_RX5_PCIE_CLKREF_CLK			143
+#define GCC_GPU_GPLL0_MAIN_DIV_CLK_SRC		144
+#define GCC_NPU_PLL0_MAIN_DIV_CLK_SRC		145
+
+/* GCC resets */
+#define GCC_QUSB2PHY_PRIM_BCR			0
+#define GCC_QUSB2PHY_SEC_BCR			1
+#define GCC_SDCC1_BCR				2
+#define GCC_SDCC2_BCR				3
+#define GCC_UFS_PHY_BCR				4
+#define GCC_USB30_PRIM_BCR			5
+#define GCC_PCIE_0_BCR				6
+#define GCC_PCIE_0_PHY_BCR			7
+#define GCC_QUPV3_WRAPPER_0_BCR			8
+#define GCC_QUPV3_WRAPPER_1_BCR			9
+#define GCC_USB3_PHY_PRIM_BCR			10
+#define GCC_USB3_DP_PHY_PRIM_BCR		11
+
+/* GCC GDSCs */
+#define USB30_PRIM_GDSC				0
+#define UFS_PHY_GDSC				1
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC	2
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC	3
+
+#endif
-- 
2.33.0

