Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F356E6A0F32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 19:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbjBWSKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 13:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjBWSKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 13:10:36 -0500
Received: from srv01.abscue.de (abscue.de [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28FFF55C09;
        Thu, 23 Feb 2023 10:10:19 -0800 (PST)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 389761C0046;
        Thu, 23 Feb 2023 19:10:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-092-073-085-163.092.073.pools.vodafone-ip.de [92.73.85.163])
        by srv01.abscue.de (Postfix) with ESMTPSA id 9E36C1C0064;
        Thu, 23 Feb 2023 19:10:17 +0100 (CET)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: clock: Add MSM8917 global clock controller
Date:   Thu, 23 Feb 2023 19:09:32 +0100
Message-Id: <20230223180935.60546-2-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223180935.60546-1-otto.pflueger@abscue.de>
References: <20230223180935.60546-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a device tree binding to describe clocks, resets and power domains
provided by the global clock controller on MSM8917 SoCs and the very
similar QM215 SoCs.

Add the new compatibles to qcom,gcc-msm8909.yaml. There is
no need to create another YAML file because the bindings are identical
(MSM8917 GCC requires the same parent clocks as the MSM8909 GCC).

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
 - Added Krzysztof's Reviewed-by
---
 .../bindings/clock/qcom,gcc-msm8909.yaml      |  13 +-
 include/dt-bindings/clock/qcom,gcc-msm8917.h  | 190 ++++++++++++++++++
 2 files changed, 199 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8917.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
index 6279a59c2e20..b91462587df5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
@@ -4,20 +4,25 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8909.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on MSM8909
+title: Qualcomm Global Clock & Reset Controller on MSM8909, MSM8917 and QM215
 
 maintainers:
   - Stephan Gerhold <stephan@gerhold.net>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on MSM8909.
+  domains on MSM8909, MSM8917 or QM215.
 
-  See also:: include/dt-bindings/clock/qcom,gcc-msm8909.h
+  See also::
+    include/dt-bindings/clock/qcom,gcc-msm8909.h
+    include/dt-bindings/clock/qcom,gcc-msm8917.h
 
 properties:
   compatible:
-    const: qcom,gcc-msm8909
+    enum:
+      - qcom,gcc-msm8909
+      - qcom,gcc-msm8917
+      - qcom,gcc-qm215
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bindings/clock/qcom,gcc-msm8917.h
new file mode 100644
index 000000000000..a371b1adc896
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -0,0 +1,190 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MSM_GCC_8917_H
+#define _DT_BINDINGS_CLK_MSM_GCC_8917_H
+
+/* Clocks */
+#define APSS_AHB_CLK_SRC			0
+#define BLSP1_QUP2_I2C_APPS_CLK_SRC		1
+#define BLSP1_QUP2_SPI_APPS_CLK_SRC		2
+#define BLSP1_QUP3_I2C_APPS_CLK_SRC		3
+#define BLSP1_QUP3_SPI_APPS_CLK_SRC		4
+#define BLSP1_QUP4_I2C_APPS_CLK_SRC		5
+#define BLSP1_QUP4_SPI_APPS_CLK_SRC		6
+#define BLSP1_UART1_APPS_CLK_SRC		7
+#define BLSP1_UART2_APPS_CLK_SRC		8
+#define BLSP2_QUP1_I2C_APPS_CLK_SRC		9
+#define BLSP2_QUP1_SPI_APPS_CLK_SRC		10
+#define BLSP2_QUP2_I2C_APPS_CLK_SRC		11
+#define BLSP2_QUP2_SPI_APPS_CLK_SRC		12
+#define BLSP2_QUP3_I2C_APPS_CLK_SRC		13
+#define BLSP2_QUP3_SPI_APPS_CLK_SRC		14
+#define BLSP2_UART1_APPS_CLK_SRC		15
+#define BLSP2_UART2_APPS_CLK_SRC		16
+#define BYTE0_CLK_SRC				17
+#define CAMSS_GP0_CLK_SRC			18
+#define CAMSS_GP1_CLK_SRC			19
+#define CAMSS_TOP_AHB_CLK_SRC			20
+#define CCI_CLK_SRC				21
+#define CPP_CLK_SRC				22
+#define CRYPTO_CLK_SRC				23
+#define CSI0PHYTIMER_CLK_SRC			24
+#define CSI0_CLK_SRC				25
+#define CSI1PHYTIMER_CLK_SRC			26
+#define CSI1_CLK_SRC				27
+#define CSI2_CLK_SRC				28
+#define ESC0_CLK_SRC				29
+#define GCC_APSS_TCU_CLK			30
+#define GCC_BIMC_GFX_CLK			31
+#define GCC_BIMC_GPU_CLK			32
+#define GCC_BLSP1_AHB_CLK			33
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK		34
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK		35
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK		36
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK		37
+#define GCC_BLSP1_QUP4_I2C_APPS_CLK		38
+#define GCC_BLSP1_QUP4_SPI_APPS_CLK		39
+#define GCC_BLSP1_UART1_APPS_CLK		40
+#define GCC_BLSP1_UART2_APPS_CLK		41
+#define GCC_BLSP2_AHB_CLK			42
+#define GCC_BLSP2_QUP1_I2C_APPS_CLK		43
+#define GCC_BLSP2_QUP1_SPI_APPS_CLK		44
+#define GCC_BLSP2_QUP2_I2C_APPS_CLK		45
+#define GCC_BLSP2_QUP2_SPI_APPS_CLK		46
+#define GCC_BLSP2_QUP3_I2C_APPS_CLK		47
+#define GCC_BLSP2_QUP3_SPI_APPS_CLK		48
+#define GCC_BLSP2_UART1_APPS_CLK		49
+#define GCC_BLSP2_UART2_APPS_CLK		50
+#define GCC_BOOT_ROM_AHB_CLK			51
+#define GCC_CAMSS_AHB_CLK			52
+#define GCC_CAMSS_CCI_AHB_CLK			53
+#define GCC_CAMSS_CCI_CLK			54
+#define GCC_CAMSS_CPP_AHB_CLK			55
+#define GCC_CAMSS_CPP_CLK			56
+#define GCC_CAMSS_CSI0PHYTIMER_CLK		57
+#define GCC_CAMSS_CSI0PHY_CLK			58
+#define GCC_CAMSS_CSI0PIX_CLK			59
+#define GCC_CAMSS_CSI0RDI_CLK			60
+#define GCC_CAMSS_CSI0_AHB_CLK			61
+#define GCC_CAMSS_CSI0_CLK			62
+#define GCC_CAMSS_CSI1PHYTIMER_CLK		63
+#define GCC_CAMSS_CSI1PHY_CLK			64
+#define GCC_CAMSS_CSI1PIX_CLK			65
+#define GCC_CAMSS_CSI1RDI_CLK			66
+#define GCC_CAMSS_CSI1_AHB_CLK			67
+#define GCC_CAMSS_CSI1_CLK			68
+#define GCC_CAMSS_CSI2PHY_CLK			69
+#define GCC_CAMSS_CSI2PIX_CLK			70
+#define GCC_CAMSS_CSI2RDI_CLK			71
+#define GCC_CAMSS_CSI2_AHB_CLK			72
+#define GCC_CAMSS_CSI2_CLK			73
+#define GCC_CAMSS_CSI_VFE0_CLK			74
+#define GCC_CAMSS_CSI_VFE1_CLK			75
+#define GCC_CAMSS_GP0_CLK			76
+#define GCC_CAMSS_GP1_CLK			77
+#define GCC_CAMSS_ISPIF_AHB_CLK			78
+#define GCC_CAMSS_JPEG0_CLK			79
+#define GCC_CAMSS_JPEG_AHB_CLK			80
+#define GCC_CAMSS_JPEG_AXI_CLK			81
+#define GCC_CAMSS_MCLK0_CLK			82
+#define GCC_CAMSS_MCLK1_CLK			83
+#define GCC_CAMSS_MCLK2_CLK			84
+#define GCC_CAMSS_MICRO_AHB_CLK			85
+#define GCC_CAMSS_TOP_AHB_CLK			86
+#define GCC_CAMSS_VFE0_AHB_CLK			87
+#define GCC_CAMSS_VFE0_AXI_CLK			88
+#define GCC_CAMSS_VFE0_CLK			89
+#define GCC_CAMSS_VFE1_AHB_CLK			90
+#define GCC_CAMSS_VFE1_AXI_CLK			91
+#define GCC_CAMSS_VFE1_CLK			92
+#define GCC_CPP_TBU_CLK				93
+#define GCC_CRYPTO_AHB_CLK			94
+#define GCC_CRYPTO_AXI_CLK			95
+#define GCC_CRYPTO_CLK				96
+#define GCC_DCC_CLK				97
+#define GCC_GFX_TBU_CLK				98
+#define GCC_GFX_TCU_CLK				99
+#define GCC_GP1_CLK				100
+#define GCC_GP2_CLK				101
+#define GCC_GP3_CLK				102
+#define GCC_GTCU_AHB_CLK			103
+#define GCC_JPEG_TBU_CLK			104
+#define GCC_MDP_TBU_CLK				105
+#define GCC_MDSS_AHB_CLK			106
+#define GCC_MDSS_AXI_CLK			107
+#define GCC_MDSS_BYTE0_CLK			108
+#define GCC_MDSS_ESC0_CLK			109
+#define GCC_MDSS_MDP_CLK			110
+#define GCC_MDSS_PCLK0_CLK			111
+#define GCC_MDSS_VSYNC_CLK			112
+#define GCC_MSS_CFG_AHB_CLK			113
+#define GCC_MSS_Q6_BIMC_AXI_CLK			114
+#define GCC_OXILI_AHB_CLK			115
+#define GCC_OXILI_GFX3D_CLK			116
+#define GCC_PDM2_CLK				117
+#define GCC_PDM_AHB_CLK				118
+#define GCC_PRNG_AHB_CLK			119
+#define GCC_QDSS_DAP_CLK			120
+#define GCC_SDCC1_AHB_CLK			121
+#define GCC_SDCC1_APPS_CLK			122
+#define GCC_SDCC1_ICE_CORE_CLK			123
+#define GCC_SDCC2_AHB_CLK			124
+#define GCC_SDCC2_APPS_CLK			125
+#define GCC_SMMU_CFG_CLK			126
+#define GCC_USB2A_PHY_SLEEP_CLK			127
+#define GCC_USB_HS_AHB_CLK			128
+#define GCC_USB_HS_PHY_CFG_AHB_CLK		129
+#define GCC_USB_HS_SYSTEM_CLK			130
+#define GCC_VENUS0_AHB_CLK			131
+#define GCC_VENUS0_AXI_CLK			132
+#define GCC_VENUS0_CORE0_VCODEC0_CLK		133
+#define GCC_VENUS0_VCODEC0_CLK			134
+#define GCC_VENUS_TBU_CLK			135
+#define GCC_VFE1_TBU_CLK			136
+#define GCC_VFE_TBU_CLK				137
+#define GFX3D_CLK_SRC				138
+#define GP1_CLK_SRC				139
+#define GP2_CLK_SRC				140
+#define GP3_CLK_SRC				141
+#define GPLL0					142
+#define GPLL0_EARLY				143
+#define GPLL3					144
+#define GPLL3_EARLY				145
+#define GPLL4					146
+#define GPLL4_EARLY				147
+#define GPLL6					148
+#define GPLL6_EARLY				149
+#define JPEG0_CLK_SRC				150
+#define MCLK0_CLK_SRC				151
+#define MCLK1_CLK_SRC				152
+#define MCLK2_CLK_SRC				153
+#define MDP_CLK_SRC				154
+#define PCLK0_CLK_SRC				155
+#define PDM2_CLK_SRC				156
+#define SDCC1_APPS_CLK_SRC			157
+#define SDCC1_ICE_CORE_CLK_SRC			158
+#define SDCC2_APPS_CLK_SRC			159
+#define USB_HS_SYSTEM_CLK_SRC			160
+#define VCODEC0_CLK_SRC				161
+#define VFE0_CLK_SRC				162
+#define VFE1_CLK_SRC				163
+#define VSYNC_CLK_SRC				164
+
+/* GCC block resets */
+#define GCC_CAMSS_MICRO_BCR			0
+#define GCC_MSS_BCR				1
+#define GCC_QUSB2_PHY_BCR			2
+#define GCC_USB_HS_BCR				3
+#define GCC_USB2_HS_PHY_ONLY_BCR		4
+
+/* GDSCs */
+#define CPP_GDSC				0
+#define JPEG_GDSC				1
+#define MDSS_GDSC				2
+#define OXILI_GX_GDSC				3
+#define VENUS_CORE0_GDSC			4
+#define VENUS_GDSC				5
+#define VFE0_GDSC				6
+#define VFE1_GDSC				7
+
+#endif
-- 
2.39.1
