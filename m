Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74CD741A1A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 23:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237577AbhI0WAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 18:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237559AbhI0WAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 18:00:13 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1C1C061740
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 14:58:34 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6B9D21F968;
        Mon, 27 Sep 2021 23:58:31 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: clk: qcom: Document MSM8976 Global Clock Controller
Date:   Mon, 27 Sep 2021 23:58:27 +0200
Message-Id: <20210927215828.52357-2-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927215828.52357-1-marijn.suijten@somainline.org>
References: <20210927215828.52357-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the required properties and firmware clocks for gcc-msm8976 to
operate nominally, and add header definitions for referencing the clocks
from firmware.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../bindings/clock/qcom,gcc-msm8976.yaml      |  90 +++++++
 include/dt-bindings/clock/qcom,gcc-msm8976.h  | 240 ++++++++++++++++++
 2 files changed, 330 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8976.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
new file mode 100644
index 000000000000..b3c8e5dfc719
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8976.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8976
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8976.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8976.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-msm8976
+      - qcom,gcc-msm8976-v1.1
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Always-on XO source
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY1
+      - description: Byte clock from DSI PHY1
+
+  clock-names:
+    items:
+      - const: xo
+      - const: xo_a
+      - const: dsi0pll
+      - const: dsi0pllbyte
+      - const: dsi1pll
+      - const: dsi1pllbyte
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
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1800000 {
+      compatible = "qcom,gcc-msm8976";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      reg = <0x1800000 0x80000>;
+
+      clocks = <&xo_board>,
+               <&xo_board>,
+               <&dsi0_phy 1>,
+               <&dsi0_phy 0>,
+               <&dsi1_phy 1>,
+               <&dsi1_phy 0>;
+
+      clock-names = "xo",
+                    "xo_a",
+                    "dsi0pll",
+                    "dsi0pllbyte",
+                    "dsi1pll",
+                    "dsi1pllbyte";
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8976.h b/include/dt-bindings/clock/qcom,gcc-msm8976.h
new file mode 100644
index 000000000000..d28dc0234b4c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-msm8976.h
@@ -0,0 +1,240 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2016-2021, AngeloGioacchino Del Regno
+ *                     <angelogioacchino.delregno@somainline.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MSM_GCC_8976_H
+#define _DT_BINDINGS_CLK_MSM_GCC_8976_H
+
+#define GPLL0					0
+#define GPLL2					1
+#define GPLL3					2
+#define GPLL4					3
+#define GPLL6					4
+#define GPLL0_CLK_SRC				5
+#define GPLL2_CLK_SRC				6
+#define GPLL3_CLK_SRC				7
+#define GPLL4_CLK_SRC				8
+#define GPLL6_CLK_SRC				9
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK		10
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK		11
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK		12
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK		13
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK		14
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK		15
+#define GCC_BLSP1_QUP4_I2C_APPS_CLK		16
+#define GCC_BLSP1_QUP4_SPI_APPS_CLK		17
+#define GCC_BLSP1_UART1_APPS_CLK		18
+#define GCC_BLSP1_UART2_APPS_CLK		19
+#define GCC_BLSP2_QUP1_I2C_APPS_CLK		20
+#define GCC_BLSP2_QUP1_SPI_APPS_CLK		21
+#define GCC_BLSP2_QUP2_I2C_APPS_CLK		22
+#define GCC_BLSP2_QUP2_SPI_APPS_CLK		23
+#define GCC_BLSP2_QUP3_I2C_APPS_CLK		24
+#define GCC_BLSP2_QUP3_SPI_APPS_CLK		25
+#define GCC_BLSP2_QUP4_I2C_APPS_CLK		26
+#define GCC_BLSP2_QUP4_SPI_APPS_CLK		27
+#define GCC_BLSP2_UART1_APPS_CLK		28
+#define GCC_BLSP2_UART2_APPS_CLK		29
+#define GCC_CAMSS_CCI_AHB_CLK			30
+#define GCC_CAMSS_CCI_CLK			31
+#define GCC_CAMSS_CPP_AHB_CLK			32
+#define GCC_CAMSS_CPP_AXI_CLK			33
+#define GCC_CAMSS_CPP_CLK			34
+#define GCC_CAMSS_CSI0_AHB_CLK			35
+#define GCC_CAMSS_CSI0_CLK			36
+#define GCC_CAMSS_CSI0PHY_CLK			37
+#define GCC_CAMSS_CSI0PIX_CLK			38
+#define GCC_CAMSS_CSI0RDI_CLK			39
+#define GCC_CAMSS_CSI1_AHB_CLK			40
+#define GCC_CAMSS_CSI1_CLK			41
+#define GCC_CAMSS_CSI1PHY_CLK			42
+#define GCC_CAMSS_CSI1PIX_CLK			43
+#define GCC_CAMSS_CSI1RDI_CLK			44
+#define GCC_CAMSS_CSI2_AHB_CLK			45
+#define GCC_CAMSS_CSI2_CLK			46
+#define GCC_CAMSS_CSI2PHY_CLK			47
+#define GCC_CAMSS_CSI2PIX_CLK			48
+#define GCC_CAMSS_CSI2RDI_CLK			49
+#define GCC_CAMSS_CSI_VFE0_CLK			50
+#define GCC_CAMSS_CSI_VFE1_CLK			51
+#define GCC_CAMSS_GP0_CLK			52
+#define GCC_CAMSS_GP1_CLK			53
+#define GCC_CAMSS_ISPIF_AHB_CLK			54
+#define GCC_CAMSS_JPEG0_CLK			55
+#define GCC_CAMSS_JPEG_AHB_CLK			56
+#define GCC_CAMSS_JPEG_AXI_CLK			57
+#define GCC_CAMSS_MCLK0_CLK			58
+#define GCC_CAMSS_MCLK1_CLK			59
+#define GCC_CAMSS_MCLK2_CLK			60
+#define GCC_CAMSS_MICRO_AHB_CLK			61
+#define GCC_CAMSS_CSI0PHYTIMER_CLK		62
+#define GCC_CAMSS_CSI1PHYTIMER_CLK		63
+#define GCC_CAMSS_AHB_CLK			64
+#define GCC_CAMSS_TOP_AHB_CLK			65
+#define GCC_CAMSS_VFE0_CLK			66
+#define GCC_CAMSS_VFE_AHB_CLK			67
+#define GCC_CAMSS_VFE_AXI_CLK			68
+#define GCC_CAMSS_VFE1_AHB_CLK			69
+#define GCC_CAMSS_VFE1_AXI_CLK			70
+#define GCC_CAMSS_VFE1_CLK			71
+#define GCC_DCC_CLK				72
+#define GCC_GP1_CLK				73
+#define GCC_GP2_CLK				74
+#define GCC_GP3_CLK				75
+#define GCC_MDSS_AHB_CLK			76
+#define GCC_MDSS_AXI_CLK			77
+#define GCC_MDSS_ESC0_CLK			78
+#define GCC_MDSS_ESC1_CLK			79
+#define GCC_MDSS_MDP_CLK			80
+#define GCC_MDSS_VSYNC_CLK			81
+#define GCC_MSS_CFG_AHB_CLK			82
+#define GCC_MSS_Q6_BIMC_AXI_CLK			83
+#define GCC_PDM2_CLK				84
+#define GCC_PRNG_AHB_CLK			85
+#define GCC_PDM_AHB_CLK				86
+#define GCC_RBCPR_GFX_AHB_CLK			87
+#define GCC_RBCPR_GFX_CLK			88
+#define GCC_SDCC1_AHB_CLK			89
+#define GCC_SDCC1_APPS_CLK			90
+#define GCC_SDCC1_ICE_CORE_CLK			91
+#define GCC_SDCC2_AHB_CLK			92
+#define GCC_SDCC2_APPS_CLK			93
+#define GCC_SDCC3_AHB_CLK			94
+#define GCC_SDCC3_APPS_CLK			95
+#define GCC_USB2A_PHY_SLEEP_CLK			96
+#define GCC_USB_HS_PHY_CFG_AHB_CLK		97
+#define GCC_USB_FS_AHB_CLK			98
+#define GCC_USB_FS_IC_CLK			99
+#define GCC_USB_FS_SYSTEM_CLK			100
+#define GCC_USB_HS_AHB_CLK			101
+#define GCC_USB_HS_SYSTEM_CLK			102
+#define GCC_VENUS0_AHB_CLK			103
+#define GCC_VENUS0_AXI_CLK			104
+#define GCC_VENUS0_CORE0_VCODEC0_CLK		105
+#define GCC_VENUS0_CORE1_VCODEC0_CLK		106
+#define GCC_VENUS0_VCODEC0_CLK			107
+#define GCC_APSS_AHB_CLK			108
+#define GCC_APSS_AXI_CLK			109
+#define GCC_BLSP1_AHB_CLK			110
+#define GCC_BLSP2_AHB_CLK			111
+#define GCC_BOOT_ROM_AHB_CLK			112
+#define GCC_CRYPTO_AHB_CLK			113
+#define GCC_CRYPTO_AXI_CLK			114
+#define GCC_CRYPTO_CLK				115
+#define GCC_CPP_TBU_CLK				116
+#define GCC_APSS_TCU_CLK			117
+#define GCC_JPEG_TBU_CLK			118
+#define GCC_MDP_RT_TBU_CLK			119
+#define GCC_MDP_TBU_CLK				120
+#define GCC_SMMU_CFG_CLK			121
+#define GCC_VENUS_1_TBU_CLK			122
+#define GCC_VENUS_TBU_CLK			123
+#define GCC_VFE1_TBU_CLK			124
+#define GCC_VFE_TBU_CLK				125
+#define GCC_APS_0_CLK				126
+#define GCC_APS_1_CLK				127
+#define APS_0_CLK_SRC				128
+#define APS_1_CLK_SRC				129
+#define APSS_AHB_CLK_SRC			130
+#define BLSP1_QUP1_I2C_APPS_CLK_SRC		131
+#define BLSP1_QUP1_SPI_APPS_CLK_SRC		132
+#define BLSP1_QUP2_I2C_APPS_CLK_SRC		133
+#define BLSP1_QUP2_SPI_APPS_CLK_SRC		134
+#define BLSP1_QUP3_I2C_APPS_CLK_SRC		135
+#define BLSP1_QUP3_SPI_APPS_CLK_SRC		136
+#define BLSP1_QUP4_I2C_APPS_CLK_SRC		137
+#define BLSP1_QUP4_SPI_APPS_CLK_SRC		138
+#define BLSP1_UART1_APPS_CLK_SRC		139
+#define BLSP1_UART2_APPS_CLK_SRC		140
+#define BLSP2_QUP1_I2C_APPS_CLK_SRC		141
+#define BLSP2_QUP1_SPI_APPS_CLK_SRC		142
+#define BLSP2_QUP2_I2C_APPS_CLK_SRC		143
+#define BLSP2_QUP2_SPI_APPS_CLK_SRC		144
+#define BLSP2_QUP3_I2C_APPS_CLK_SRC		145
+#define BLSP2_QUP3_SPI_APPS_CLK_SRC		146
+#define BLSP2_QUP4_I2C_APPS_CLK_SRC		147
+#define BLSP2_QUP4_SPI_APPS_CLK_SRC		148
+#define BLSP2_UART1_APPS_CLK_SRC		149
+#define BLSP2_UART2_APPS_CLK_SRC		150
+#define CCI_CLK_SRC				151
+#define CPP_CLK_SRC				152
+#define CSI0_CLK_SRC				153
+#define CSI1_CLK_SRC				154
+#define CSI2_CLK_SRC				155
+#define CAMSS_GP0_CLK_SRC			156
+#define CAMSS_GP1_CLK_SRC			157
+#define JPEG0_CLK_SRC				158
+#define MCLK0_CLK_SRC				159
+#define MCLK1_CLK_SRC				160
+#define MCLK2_CLK_SRC				161
+#define CSI0PHYTIMER_CLK_SRC			162
+#define CSI1PHYTIMER_CLK_SRC			163
+#define CAMSS_TOP_AHB_CLK_SRC			164
+#define VFE0_CLK_SRC				165
+#define VFE1_CLK_SRC				166
+#define CRYPTO_CLK_SRC				167
+#define GP1_CLK_SRC				168
+#define GP2_CLK_SRC				169
+#define GP3_CLK_SRC				170
+#define ESC0_CLK_SRC				171
+#define ESC1_CLK_SRC				172
+#define MDP_CLK_SRC				173
+#define VSYNC_CLK_SRC				174
+#define PDM2_CLK_SRC				175
+#define RBCPR_GFX_CLK_SRC			176
+#define SDCC1_APPS_CLK_SRC			177
+#define SDCC1_ICE_CORE_CLK_SRC			178
+#define SDCC2_APPS_CLK_SRC			179
+#define SDCC3_APPS_CLK_SRC			180
+#define USB_FS_IC_CLK_SRC			181
+#define USB_FS_SYSTEM_CLK_SRC			182
+#define USB_HS_SYSTEM_CLK_SRC			183
+#define VCODEC0_CLK_SRC				184
+#define GCC_MDSS_BYTE0_CLK_SRC			185
+#define GCC_MDSS_BYTE1_CLK_SRC			186
+#define GCC_MDSS_BYTE0_CLK			187
+#define GCC_MDSS_BYTE1_CLK			188
+#define GCC_MDSS_PCLK0_CLK_SRC			189
+#define GCC_MDSS_PCLK1_CLK_SRC			190
+#define GCC_MDSS_PCLK0_CLK			191
+#define GCC_MDSS_PCLK1_CLK			192
+#define GCC_GFX3D_CLK_SRC			193
+#define GCC_GFX3D_OXILI_CLK			194
+#define GCC_GFX3D_BIMC_CLK			195
+#define GCC_GFX3D_OXILI_AHB_CLK			196
+#define GCC_GFX3D_OXILI_AON_CLK			197
+#define GCC_GFX3D_OXILI_GMEM_CLK		198
+#define GCC_GFX3D_OXILI_TIMER_CLK		199
+#define GCC_GFX3D_TBU0_CLK			200
+#define GCC_GFX3D_TBU1_CLK			201
+#define GCC_GFX3D_TCU_CLK			202
+#define GCC_GFX3D_GTCU_AHB_CLK			203
+
+/* GCC block resets */
+#define RST_CAMSS_MICRO_BCR			0
+#define RST_USB_HS_BCR				1
+#define RST_QUSB2_PHY_BCR			2
+#define RST_USB2_HS_PHY_ONLY_BCR		3
+#define RST_USB_HS_PHY_CFG_AHB_BCR		4
+#define RST_USB_FS_BCR				5
+#define RST_CAMSS_CSI1PIX_BCR			6
+#define RST_CAMSS_CSI_VFE1_BCR			7
+#define RST_CAMSS_VFE1_BCR			8
+#define RST_CAMSS_CPP_BCR			9
+
+/* GDSCs */
+#define VENUS_GDSC				0
+#define VENUS_CORE0_GDSC			1
+#define VENUS_CORE1_GDSC			2
+#define MDSS_GDSC				3
+#define JPEG_GDSC				4
+#define VFE0_GDSC				5
+#define VFE1_GDSC				6
+#define CPP_GDSC				7
+#define OXILI_GX_GDSC				8
+#define OXILI_CX_GDSC				9
+
+#endif /* _DT_BINDINGS_CLK_MSM_GCC_8976_H */
--
2.33.0

