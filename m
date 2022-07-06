Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6DE5689C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 15:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233178AbiGFNmm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 09:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233355AbiGFNmM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 09:42:12 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653FD25298;
        Wed,  6 Jul 2022 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WsSTQXUAlzOZEkqRDGyMCWe+lrSbnLg2ouMHceSrl8Q=; b=aksOTusOrMJ9hS6y26MliIDYix
        /g3m8w8MiS7MSeIiBS1ncwAJ0AkknQkLCTShy3Erxb+XDPgU4a0cBBpNA9S4W/ZrzZg6XehQrxYQm
        k7hExZ9MAe/LmozVas63GYKUKQ1v19yWcpatHzJJPGSNMRc3Jwgay5F9IHTgGnje4NP/Nm+t/nviE
        9lyYM/xLfjj+sRR24oNNMv3GmghLJksdl3n9svEHNoc25N1xcONHiB1aHa/gukrAAtHYH6iPWnzNR
        iwWi80tHcK+3wALdCS075vSsOvn6NtmvBmw15Xfur3FfqZe2DvWl7TiBDl6tOumDfcRS6WGzGm6XU
        Zg//kC3Q==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o95I0-007M5K-Rc; Wed, 06 Jul 2022 15:42:00 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH v2 1/6] dt-bindings: clock: Add schema for MSM8909 GCC
Date:   Wed,  6 Jul 2022 15:41:27 +0200
Message-Id: <20220706134132.3623415-2-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
References: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Global Clock Controller (GCC) in the MSM8909 SoC provides clocks,
resets and power domains for the various hardware blocks in the SoC.
Add a DT schema to describe it, similar to other Qualcomm SoCs.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Changes in v2:
  - Make "clocks" and "clock-names" required (thanks to Krzysztof)
---
 .../bindings/clock/qcom,gcc-msm8909.yaml      |  58 +++++
 include/dt-bindings/clock/qcom,gcc-msm8909.h  | 218 ++++++++++++++++++
 2 files changed, 276 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8909.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
new file mode 100644
index 000000000000..2272ea5f78d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8909.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8909
+
+maintainers:
+  - Stephan Gerhold <stephan@gerhold.net>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8909.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8909.h
+
+properties:
+  compatible:
+    const: qcom,gcc-msm8909
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: DSI phy instance 0 dsi clock
+      - description: DSI phy instance 0 byte clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: dsi0pll
+      - const: dsi0pllbyte
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gcc: clock-controller@1800000 {
+      compatible = "qcom,gcc-msm8909";
+      reg = <0x01800000 0x80000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      clocks = <&xo_board>, <&sleep_clk>, <&dsi0_phy 1>, <&dsi0_phy 0>;
+      clock-names = "xo", "sleep_clk", "dsi0pll", "dsi0pllbyte";
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8909.h b/include/dt-bindings/clock/qcom,gcc-msm8909.h
new file mode 100644
index 000000000000..4394ba003425
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-msm8909.h
@@ -0,0 +1,218 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022 Kernkonzept GmbH.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_8909_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_8909_H
+
+/* PLLs */
+#define GPLL0_EARLY				0
+#define GPLL0					1
+#define GPLL1					2
+#define GPLL1_VOTE				3
+#define GPLL2_EARLY				4
+#define GPLL2					5
+#define BIMC_PLL_EARLY				6
+#define BIMC_PLL				7
+
+/* RCGs */
+#define APSS_AHB_CLK_SRC			8
+#define BIMC_DDR_CLK_SRC			9
+#define BIMC_GPU_CLK_SRC			10
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
+#define BYTE0_CLK_SRC				25
+#define CAMSS_GP0_CLK_SRC			26
+#define CAMSS_GP1_CLK_SRC			27
+#define CAMSS_TOP_AHB_CLK_SRC			28
+#define CODEC_DIGCODEC_CLK_SRC			29
+#define CRYPTO_CLK_SRC				30
+#define CSI0_CLK_SRC				31
+#define CSI0PHYTIMER_CLK_SRC			32
+#define CSI1_CLK_SRC				33
+#define ESC0_CLK_SRC				34
+#define GFX3D_CLK_SRC				35
+#define GP1_CLK_SRC				36
+#define GP2_CLK_SRC				37
+#define GP3_CLK_SRC				38
+#define MCLK0_CLK_SRC				39
+#define MCLK1_CLK_SRC				40
+#define MDP_CLK_SRC				41
+#define PCLK0_CLK_SRC				42
+#define PCNOC_BFDCD_CLK_SRC			43
+#define PDM2_CLK_SRC				44
+#define SDCC1_APPS_CLK_SRC			45
+#define SDCC2_APPS_CLK_SRC			46
+#define SYSTEM_NOC_BFDCD_CLK_SRC		47
+#define ULTAUDIO_AHBFABRIC_CLK_SRC		48
+#define ULTAUDIO_LPAIF_AUX_I2S_CLK_SRC		49
+#define ULTAUDIO_LPAIF_PRI_I2S_CLK_SRC		50
+#define ULTAUDIO_LPAIF_SEC_I2S_CLK_SRC		51
+#define ULTAUDIO_XO_CLK_SRC			52
+#define USB_HS_SYSTEM_CLK_SRC			53
+#define VCODEC0_CLK_SRC				54
+#define VFE0_CLK_SRC				55
+#define VSYNC_CLK_SRC				56
+
+/* Voteable Clocks */
+#define GCC_APSS_TCU_CLK			57
+#define GCC_BLSP1_AHB_CLK			58
+#define GCC_BLSP1_SLEEP_CLK			59
+#define GCC_BOOT_ROM_AHB_CLK			60
+#define GCC_CRYPTO_CLK				61
+#define GCC_CRYPTO_AHB_CLK			62
+#define GCC_CRYPTO_AXI_CLK			63
+#define GCC_GFX_TBU_CLK				64
+#define GCC_GFX_TCU_CLK				65
+#define GCC_GTCU_AHB_CLK			66
+#define GCC_MDP_TBU_CLK				67
+#define GCC_PRNG_AHB_CLK			68
+#define GCC_SMMU_CFG_CLK			69
+#define GCC_VENUS_TBU_CLK			70
+#define GCC_VFE_TBU_CLK				71
+
+/* Branches */
+#define GCC_BIMC_GFX_CLK			72
+#define GCC_BIMC_GPU_CLK			73
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK		74
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK		75
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK		76
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK		77
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK		78
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK		79
+#define GCC_BLSP1_QUP4_I2C_APPS_CLK		80
+#define GCC_BLSP1_QUP4_SPI_APPS_CLK		81
+#define GCC_BLSP1_QUP5_I2C_APPS_CLK		82
+#define GCC_BLSP1_QUP5_SPI_APPS_CLK		83
+#define GCC_BLSP1_QUP6_I2C_APPS_CLK		84
+#define GCC_BLSP1_QUP6_SPI_APPS_CLK		85
+#define GCC_BLSP1_UART1_APPS_CLK		86
+#define GCC_BLSP1_UART2_APPS_CLK		87
+#define GCC_CAMSS_AHB_CLK			88
+#define GCC_CAMSS_CSI0_CLK			89
+#define GCC_CAMSS_CSI0_AHB_CLK			90
+#define GCC_CAMSS_CSI0PHY_CLK			91
+#define GCC_CAMSS_CSI0PHYTIMER_CLK		92
+#define GCC_CAMSS_CSI0PIX_CLK			93
+#define GCC_CAMSS_CSI0RDI_CLK			94
+#define GCC_CAMSS_CSI1_CLK			95
+#define GCC_CAMSS_CSI1_AHB_CLK			96
+#define GCC_CAMSS_CSI1PHY_CLK			97
+#define GCC_CAMSS_CSI1PIX_CLK			98
+#define GCC_CAMSS_CSI1RDI_CLK			99
+#define GCC_CAMSS_CSI_VFE0_CLK			100
+#define GCC_CAMSS_GP0_CLK			101
+#define GCC_CAMSS_GP1_CLK			102
+#define GCC_CAMSS_ISPIF_AHB_CLK			103
+#define GCC_CAMSS_MCLK0_CLK			104
+#define GCC_CAMSS_MCLK1_CLK			105
+#define GCC_CAMSS_TOP_AHB_CLK			106
+#define GCC_CAMSS_VFE0_CLK			107
+#define GCC_CAMSS_VFE_AHB_CLK			108
+#define GCC_CAMSS_VFE_AXI_CLK			109
+#define GCC_CODEC_DIGCODEC_CLK			110
+#define GCC_GP1_CLK				111
+#define GCC_GP2_CLK				112
+#define GCC_GP3_CLK				113
+#define GCC_MDSS_AHB_CLK			114
+#define GCC_MDSS_AXI_CLK			115
+#define GCC_MDSS_BYTE0_CLK			116
+#define GCC_MDSS_ESC0_CLK			117
+#define GCC_MDSS_MDP_CLK			118
+#define GCC_MDSS_PCLK0_CLK			119
+#define GCC_MDSS_VSYNC_CLK			120
+#define GCC_MSS_CFG_AHB_CLK			121
+#define GCC_MSS_Q6_BIMC_AXI_CLK			122
+#define GCC_OXILI_AHB_CLK			123
+#define GCC_OXILI_GFX3D_CLK			124
+#define GCC_PDM2_CLK				125
+#define GCC_PDM_AHB_CLK				126
+#define GCC_SDCC1_AHB_CLK			127
+#define GCC_SDCC1_APPS_CLK			128
+#define GCC_SDCC2_AHB_CLK			129
+#define GCC_SDCC2_APPS_CLK			130
+#define GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK	131
+#define GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_LPM_CLK	132
+#define GCC_ULTAUDIO_AVSYNC_XO_CLK		133
+#define GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK		134
+#define GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK		135
+#define GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK		136
+#define GCC_ULTAUDIO_PCNOC_MPORT_CLK		137
+#define GCC_ULTAUDIO_PCNOC_SWAY_CLK		138
+#define GCC_ULTAUDIO_STC_XO_CLK			139
+#define GCC_USB2A_PHY_SLEEP_CLK			140
+#define GCC_USB_HS_AHB_CLK			141
+#define GCC_USB_HS_PHY_CFG_AHB_CLK		142
+#define GCC_USB_HS_SYSTEM_CLK			143
+#define GCC_VENUS0_AHB_CLK			144
+#define GCC_VENUS0_AXI_CLK			145
+#define GCC_VENUS0_CORE0_VCODEC0_CLK		146
+#define GCC_VENUS0_VCODEC0_CLK			147
+
+/* Resets */
+#define GCC_AUDIO_CORE_BCR			0
+#define GCC_BLSP1_BCR				1
+#define GCC_BLSP1_QUP1_BCR			2
+#define GCC_BLSP1_QUP2_BCR			3
+#define GCC_BLSP1_QUP3_BCR			4
+#define GCC_BLSP1_QUP4_BCR			5
+#define GCC_BLSP1_QUP5_BCR			6
+#define GCC_BLSP1_QUP6_BCR			7
+#define GCC_BLSP1_UART1_BCR			8
+#define GCC_BLSP1_UART2_BCR			9
+#define GCC_CAMSS_CSI0_BCR			10
+#define GCC_CAMSS_CSI0PHY_BCR			11
+#define GCC_CAMSS_CSI0PIX_BCR			12
+#define GCC_CAMSS_CSI0RDI_BCR			13
+#define GCC_CAMSS_CSI1_BCR			14
+#define GCC_CAMSS_CSI1PHY_BCR			15
+#define GCC_CAMSS_CSI1PIX_BCR			16
+#define GCC_CAMSS_CSI1RDI_BCR			17
+#define GCC_CAMSS_CSI_VFE0_BCR			18
+#define GCC_CAMSS_GP0_BCR			19
+#define GCC_CAMSS_GP1_BCR			20
+#define GCC_CAMSS_ISPIF_BCR			21
+#define GCC_CAMSS_MCLK0_BCR			22
+#define GCC_CAMSS_MCLK1_BCR			23
+#define GCC_CAMSS_PHY0_BCR			24
+#define GCC_CAMSS_TOP_BCR			25
+#define GCC_CAMSS_TOP_AHB_BCR			26
+#define GCC_CAMSS_VFE_BCR			27
+#define GCC_CRYPTO_BCR				28
+#define GCC_MDSS_BCR				29
+#define GCC_OXILI_BCR				30
+#define GCC_PDM_BCR				31
+#define GCC_PRNG_BCR				32
+#define GCC_QUSB2_PHY_BCR			33
+#define GCC_SDCC1_BCR				34
+#define GCC_SDCC2_BCR				35
+#define GCC_ULT_AUDIO_BCR			36
+#define GCC_USB2A_PHY_BCR			37
+#define GCC_USB2_HS_PHY_ONLY_BCR		38
+#define GCC_USB_HS_BCR				39
+#define GCC_VENUS0_BCR				40
+
+/* Subsystem Restart */
+#define GCC_MSS_RESTART				41
+
+/* Power Domains */
+#define MDSS_GDSC				0
+#define OXILI_GDSC				1
+#define VENUS_GDSC				2
+#define VENUS_CORE0_GDSC			3
+#define VFE_GDSC				4
+
+#endif
-- 
2.30.2

