Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41A32DB400
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 19:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731137AbgLOSty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 13:49:54 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:61372 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731688AbgLOStw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 13:49:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608058169; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=w9flKGbL5Ubb/6UNlquX6spYMUnFvQBbVOsDeBubOpU=; b=OqqOJug5GXz8f9ANT6nIuBAZrFAeQatd9zxtZmrYB2Arl90kGaL+2I/y9e2BTIPEimmXH8OD
 ya6Ixo7iQXNBNFcDwLJSHDU5j8J8rMV0LsvpUIKq8KLj5apQwsXowQiNxBnUBR+OaCY9rfEj
 i+gseD2crfoYF8LDfIQaA1hlEdc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fd90518253011a4b869e357 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Dec 2020 18:48:56
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 67D40C43461; Tue, 15 Dec 2020 18:48:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 493EAC433CA;
        Tue, 15 Dec 2020 18:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 493EAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 1/2] dt-bindings: clock: Add SC7280 GCC clock binding
Date:   Wed, 16 Dec 2020 00:18:33 +0530
Message-Id: <1608058114-29025-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608058114-29025-1-git-send-email-tdas@codeaurora.org>
References: <1608058114-29025-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for global clock subsystem clock
controller for Qualcomm Technology Inc's SC7280 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gcc-sc7280.yaml |  85 ++++++++
 include/dt-bindings/clock/qcom,gcc-sc7280.h        | 215 +++++++++++++++++++++
 2 files changed, 300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sc7280.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
new file mode 100644
index 0000000..79c64d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sc7280.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for SC7280
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SC7280.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sc7280.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sc7280
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+      - description: PCIE-0 pipe clock source
+      - description: PCIE-1 pipe clock source
+      - description: USB30 phy wrapper pipe clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: sleep_clk
+      - const: pcie_0_pipe_clk
+      - const: pcie_1_pipe_clk
+      - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
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
+      compatible = "qcom,gcc-sc7280";
+      reg = <0x00100000 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>,
+               <&pcie_0_pipe_clk>, <&pcie_1_pipe_clk>,
+               <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk", "pcie_0_pipe_clk",
+                     "pcie_1_pipe_clk", "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-sc7280.h b/include/dt-bindings/clock/qcom,gcc-sc7280.h
new file mode 100644
index 0000000..3295bd4
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sc7280.h
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SC7280_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SC7280_H
+
+/* GCC clocks */
+#define GCC_GPLL0					0
+#define GCC_GPLL0_OUT_EVEN				1
+#define GCC_GPLL0_OUT_ODD				2
+#define GCC_GPLL1					3
+#define GCC_GPLL10					4
+#define GCC_GPLL4					5
+#define GCC_GPLL9					6
+#define GCC_AGGRE_NOC_PCIE_0_AXI_CLK			7
+#define GCC_AGGRE_NOC_PCIE_1_AXI_CLK			8
+#define GCC_AGGRE_UFS_PHY_AXI_CLK			9
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK			10
+#define GCC_CAMERA_AHB_CLK				11
+#define GCC_CAMERA_HF_AXI_CLK				12
+#define GCC_CAMERA_SF_AXI_CLK				13
+#define GCC_CAMERA_XO_CLK				14
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK			15
+#define GCC_CFG_NOC_USB3_SEC_AXI_CLK			16
+#define GCC_CPUSS_AHB_CLK				17
+#define GCC_CPUSS_AHB_CLK_SRC				18
+#define GCC_CPUSS_AHB_POSTDIV_CLK_SRC			19
+#define GCC_DDRSS_GPU_AXI_CLK				20
+#define GCC_DDRSS_PCIE_SF_CLK				21
+#define GCC_DISP_AHB_CLK				22
+#define GCC_DISP_GPLL0_CLK_SRC				23
+#define GCC_DISP_HF_AXI_CLK				24
+#define GCC_DISP_SF_AXI_CLK				25
+#define GCC_DISP_XO_CLK					26
+#define GCC_GP1_CLK					27
+#define GCC_GP1_CLK_SRC					28
+#define GCC_GP2_CLK					29
+#define GCC_GP2_CLK_SRC					30
+#define GCC_GP3_CLK					31
+#define GCC_GP3_CLK_SRC					32
+#define GCC_GPU_CFG_AHB_CLK				33
+#define GCC_GPU_GPLL0_CLK_SRC				34
+#define GCC_GPU_GPLL0_DIV_CLK_SRC			35
+#define GCC_GPU_IREF_EN					36
+#define GCC_GPU_MEMNOC_GFX_CLK				37
+#define GCC_GPU_SNOC_DVM_GFX_CLK			38
+#define GCC_PCIE0_PHY_RCHNG_CLK				39
+#define GCC_PCIE1_PHY_RCHNG_CLK				40
+#define GCC_PCIE_0_AUX_CLK				41
+#define GCC_PCIE_0_AUX_CLK_SRC				42
+#define GCC_PCIE_0_CFG_AHB_CLK				43
+#define GCC_PCIE_0_MSTR_AXI_CLK				44
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC			45
+#define GCC_PCIE_0_PIPE_CLK				46
+#define GCC_PCIE_0_PIPE_CLK_SRC				47
+#define GCC_PCIE_0_SLV_AXI_CLK				48
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK			49
+#define GCC_PCIE_1_AUX_CLK				50
+#define GCC_PCIE_1_AUX_CLK_SRC				51
+#define GCC_PCIE_1_CFG_AHB_CLK				52
+#define GCC_PCIE_1_MSTR_AXI_CLK				53
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC			54
+#define GCC_PCIE_1_PIPE_CLK				55
+#define GCC_PCIE_1_PIPE_CLK_SRC				56
+#define GCC_PCIE_1_SLV_AXI_CLK				57
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK			58
+#define GCC_PCIE_THROTTLE_CORE_CLK			59
+#define GCC_PDM2_CLK					60
+#define GCC_PDM2_CLK_SRC				61
+#define GCC_PDM_AHB_CLK					62
+#define GCC_PDM_XO4_CLK					63
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK			64
+#define GCC_QMIP_CAMERA_RT_AHB_CLK			65
+#define GCC_QMIP_DISP_AHB_CLK				66
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK			67
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK			68
+#define GCC_QUPV3_WRAP0_CORE_CLK			69
+#define GCC_QUPV3_WRAP0_S0_CLK				70
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC			71
+#define GCC_QUPV3_WRAP0_S1_CLK				72
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC			73
+#define GCC_QUPV3_WRAP0_S2_CLK				74
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC			75
+#define GCC_QUPV3_WRAP0_S3_CLK				76
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC			77
+#define GCC_QUPV3_WRAP0_S4_CLK				78
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC			79
+#define GCC_QUPV3_WRAP0_S5_CLK				80
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC			81
+#define GCC_QUPV3_WRAP0_S6_CLK				82
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC			83
+#define GCC_QUPV3_WRAP0_S7_CLK				84
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC			85
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK			86
+#define GCC_QUPV3_WRAP1_CORE_CLK			87
+#define GCC_QUPV3_WRAP1_S0_CLK				88
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC			89
+#define GCC_QUPV3_WRAP1_S1_CLK				90
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC			91
+#define GCC_QUPV3_WRAP1_S2_CLK				92
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC			93
+#define GCC_QUPV3_WRAP1_S3_CLK				94
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC			95
+#define GCC_QUPV3_WRAP1_S4_CLK				96
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC			97
+#define GCC_QUPV3_WRAP1_S5_CLK				98
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC			99
+#define GCC_QUPV3_WRAP1_S6_CLK				100
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC			101
+#define GCC_QUPV3_WRAP1_S7_CLK				102
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC			103
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK			104
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK			105
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK			106
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK			107
+#define GCC_SDCC1_AHB_CLK				108
+#define GCC_SDCC1_APPS_CLK				109
+#define GCC_SDCC1_APPS_CLK_SRC				110
+#define GCC_SDCC1_ICE_CORE_CLK				111
+#define GCC_SDCC1_ICE_CORE_CLK_SRC			112
+#define GCC_SDCC2_AHB_CLK				113
+#define GCC_SDCC2_APPS_CLK				114
+#define GCC_SDCC2_APPS_CLK_SRC				115
+#define GCC_SDCC4_AHB_CLK				116
+#define GCC_SDCC4_APPS_CLK				117
+#define GCC_SDCC4_APPS_CLK_SRC				118
+#define GCC_SYS_NOC_CPUSS_AHB_CLK			119
+#define GCC_THROTTLE_PCIE_AHB_CLK			120
+#define GCC_TITAN_NRT_THROTTLE_CORE_CLK			121
+#define GCC_TITAN_RT_THROTTLE_CORE_CLK			122
+#define GCC_UFS_1_CLKREF_EN				123
+#define GCC_UFS_PHY_AHB_CLK				124
+#define GCC_UFS_PHY_AXI_CLK				125
+#define GCC_UFS_PHY_AXI_CLK_SRC				126
+#define GCC_UFS_PHY_ICE_CORE_CLK			127
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC			128
+#define GCC_UFS_PHY_PHY_AUX_CLK				129
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC			130
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK			131
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC			132
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK			133
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC			134
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK			135
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC			136
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK			137
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC			138
+#define GCC_USB30_PRIM_MASTER_CLK			139
+#define GCC_USB30_PRIM_MASTER_CLK_SRC			140
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK			141
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC		142
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC	143
+#define GCC_USB30_PRIM_SLEEP_CLK			144
+#define GCC_USB30_SEC_MASTER_CLK			145
+#define GCC_USB30_SEC_MASTER_CLK_SRC			146
+#define GCC_USB30_SEC_MOCK_UTMI_CLK			147
+#define GCC_USB30_SEC_MOCK_UTMI_CLK_SRC			148
+#define GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC		149
+#define GCC_USB30_SEC_SLEEP_CLK				150
+#define GCC_USB3_PRIM_PHY_AUX_CLK			151
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC			152
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK			153
+#define GCC_USB3_PRIM_PHY_PIPE_CLK			154
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC			155
+#define GCC_USB3_SEC_PHY_AUX_CLK			156
+#define GCC_USB3_SEC_PHY_AUX_CLK_SRC			157
+#define GCC_USB3_SEC_PHY_COM_AUX_CLK			158
+#define GCC_USB3_SEC_PHY_PIPE_CLK			159
+#define GCC_USB3_SEC_PHY_PIPE_CLK_SRC			160
+#define GCC_VIDEO_AHB_CLK				161
+#define GCC_VIDEO_AXI0_CLK				162
+#define GCC_VIDEO_MVP_THROTTLE_CORE_CLK			163
+#define GCC_VIDEO_XO_CLK				164
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK		165
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK			166
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK			167
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK			168
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK		169
+#define GCC_GPLL0_MAIN_DIV_CDIV				170
+#define GCC_QSPI_CNOC_PERIPH_AHB_CLK			171
+#define GCC_QSPI_CORE_CLK				172
+#define GCC_QSPI_CORE_CLK_SRC				173
+
+/* GCC power domains */
+#define GCC_PCIE_0_GDSC				0
+#define GCC_PCIE_1_GDSC				1
+#define GCC_UFS_PHY_GDSC			2
+#define GCC_USB30_PRIM_GDSC			3
+#define GCC_USB30_SEC_GDSC			4
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC	5
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC	6
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC	7
+#define HLOS1_VOTE_TURING_MMU_TBU0_GDSC		8
+#define HLOS1_VOTE_TURING_MMU_TBU1_GDSC		9
+
+/* GCC resets */
+#define GCC_PCIE_0_BCR				0
+#define GCC_PCIE_0_PHY_BCR			1
+#define GCC_PCIE_1_BCR				2
+#define GCC_PCIE_1_PHY_BCR			3
+#define GCC_QUSB2PHY_PRIM_BCR			4
+#define GCC_QUSB2PHY_SEC_BCR			5
+#define GCC_SDCC1_BCR				6
+#define GCC_SDCC2_BCR				7
+#define GCC_SDCC4_BCR				8
+#define GCC_UFS_PHY_BCR				9
+#define GCC_USB30_PRIM_BCR			10
+#define GCC_USB30_SEC_BCR			11
+#define GCC_USB3_DP_PHY_PRIM_BCR		12
+#define GCC_USB3_PHY_PRIM_BCR			13
+#define GCC_USB3PHY_PHY_PRIM_BCR		14
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR		15
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

