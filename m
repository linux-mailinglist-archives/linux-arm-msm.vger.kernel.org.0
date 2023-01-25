Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BBB67B00A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 11:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235700AbjAYKqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 05:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbjAYKqo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 05:46:44 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B19D30D4;
        Wed, 25 Jan 2023 02:46:33 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PAUTLa005496;
        Wed, 25 Jan 2023 10:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=uKA5kU1ffKoR3rWRnghNBXyGf0A9rx/tU3kRCIFbB+M=;
 b=VZzj/W1SutCyYqEQ+MA+sR3KwO4f4xjjLYgH+CT6h4LY1wc6n9fAvzE4UhC5DO4e96BI
 VThgv52FWLrzbCLTcrsKHQ1pes2g3S7SMUCNB1xTfmfZ7jXsBZewFCuztsXHJdor4Ml8
 NOPnMkTuAVJayJeijlf1wAKN92MgseVoyv++t3lmCoaUmkNl9bp5rOZ2X/GQsCTB6T1f
 Rf12+uJdan5a9lbUOHvvEwVIhpQjp+25zRLUDJWMVxX+N3UdZREy1DSvf5Vddbg1Zh15
 oRNgS+Ue2F93ZTYqMozeugqTyQPCwbMzpD+XgKcRdgDnAWPjAl115ABQJVI3IABS3rpg Yw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89hk6wt3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 10:46:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30PAkDAl002221
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 10:46:13 GMT
Received: from win-platform-upstream01.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 25 Jan 2023 02:46:05 -0800
From:   Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <shawnguo@kernel.org>, <arnd@arndb.de>,
        <marcel.ziswiler@toradex.com>, <dmitry.baryshkov@linaro.org>,
        <nfraprado@collabora.com>, <broonie@kernel.org>,
        <robimarko@gmail.com>, <quic_gurus@quicinc.com>,
        <bhupesh.sharma@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Kathiravan T <quic_kathirav@quicinc.com>
Subject: [PATCH 04/10] dt-bindings: clock: Add Qualcomm IPQ5332 GCC
Date:   Wed, 25 Jan 2023 16:15:14 +0530
Message-ID: <20230125104520.89684-5-quic_kathirav@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125104520.89684-1-quic_kathirav@quicinc.com>
References: <20230125104520.89684-1-quic_kathirav@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KSOlwYBBLUHp4a8ysNM3se-ZQ7r3BslL
X-Proofpoint-ORIG-GUID: KSOlwYBBLUHp4a8ysNM3se-ZQ7r3BslL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_05,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250099
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,UPPERCASE_50_75 autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kathiravan T <quic_kathirav@quicinc.com>

Add binding for the Qualcomm IPQ5332 Global Clock Controller.

Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
---
 .../bindings/clock/qcom,ipq5332-gcc.yaml      |  55 +++
 include/dt-bindings/clock/qcom,gcc-ipq5332.h  | 359 ++++++++++++++++++
 2 files changed, 414 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq5332.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
new file mode 100644
index 000000000000..42d55f6bffcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on IPQ5332
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on IPQ5332.
+
+  See also:: include/dt-bindings/clock/qcom,gcc-ipq5332.h
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+properties:
+  compatible:
+    const: qcom,ipq5332-gcc
+
+  clocks:
+    items:
+      - description: Board XO clock source
+      - description: Sleep clock source
+      - description: PCIE 2lane PHY pipe clock source
+      - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
+      - description: USB PCIE wrapper pipe clock source
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: pcie_2lane_phy_pipe_clk
+      - const: pcie_2lane_phy_pipe_clk_x1
+      - const: usb_pcie_wrapper_pipe_clk
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@1800000 {
+      compatible = "qcom,ipq5332-gcc";
+      reg = <0x01800000 0x80000>;
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-ipq5332.h b/include/dt-bindings/clock/qcom,gcc-ipq5332.h
new file mode 100644
index 000000000000..a305c648b724
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-ipq5332.h
@@ -0,0 +1,359 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_IPQ5332_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_IPQ5332_H
+
+#define GPLL0_MAIN					0
+#define GPLL0						1
+#define GPLL2_MAIN					2
+#define GPLL2						3
+#define GPLL4_MAIN					4
+#define GPLL4						5
+#define GCC_ADSS_PWM_CLK				6
+#define GCC_ADSS_PWM_CLK_SRC				7
+#define GCC_AHB_CLK					8
+#define GCC_APSS_AHB_CLK				9
+#define GCC_APSS_AHB_CLK_SRC				10
+#define GCC_APSS_AXI_CLK				11
+#define GCC_APSS_AXI_CLK_SRC				12
+#define GCC_BLSP1_AHB_CLK				13
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK			14
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK			15
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC			16
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK			17
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK			18
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC			19
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK			20
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK			21
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK_SRC			22
+#define GCC_BLSP1_SLEEP_CLK				23
+#define GCC_BLSP1_UART1_APPS_CLK			24
+#define GCC_BLSP1_UART1_APPS_CLK_SRC			25
+#define GCC_BLSP1_UART2_APPS_CLK			26
+#define GCC_BLSP1_UART2_APPS_CLK_SRC			27
+#define GCC_BLSP1_UART3_APPS_CLK			28
+#define GCC_BLSP1_UART3_APPS_CLK_SRC			29
+#define GCC_CE_AHB_CLK					30
+#define GCC_CE_AXI_CLK					31
+#define GCC_CE_PCNOC_AHB_CLK				32
+#define GCC_CMN_12GPLL_AHB_CLK				33
+#define GCC_CMN_12GPLL_APU_CLK				34
+#define GCC_CMN_12GPLL_SYS_CLK				35
+#define GCC_GP1_CLK					36
+#define GCC_GP1_CLK_SRC					37
+#define GCC_GP2_CLK					38
+#define GCC_GP2_CLK_SRC					39
+#define GCC_LPASS_CORE_AXIM_CLK				40
+#define GCC_LPASS_SWAY_CLK				41
+#define GCC_LPASS_SWAY_CLK_SRC				42
+#define GCC_MDIO_AHB_CLK				43
+#define GCC_MDIO_SLAVE_AHB_CLK				44
+#define GCC_MEM_NOC_Q6_AXI_CLK				45
+#define GCC_MEM_NOC_TS_CLK				46
+#define GCC_NSS_TS_CLK					47
+#define GCC_NSS_TS_CLK_SRC				48
+#define GCC_NSSCC_CLK					49
+#define GCC_NSSCFG_CLK					50
+#define GCC_NSSNOC_ATB_CLK				51
+#define GCC_NSSNOC_NSSCC_CLK				52
+#define GCC_NSSNOC_QOSGEN_REF_CLK			53
+#define GCC_NSSNOC_SNOC_1_CLK				54
+#define GCC_NSSNOC_SNOC_CLK				55
+#define GCC_NSSNOC_TIMEOUT_REF_CLK			56
+#define GCC_NSSNOC_XO_DCD_CLK				57
+#define GCC_PCIE3X1_0_AHB_CLK				58
+#define GCC_PCIE3X1_0_AUX_CLK				59
+#define GCC_PCIE3X1_0_AXI_CLK_SRC			60
+#define GCC_PCIE3X1_0_AXI_M_CLK				61
+#define GCC_PCIE3X1_0_AXI_S_BRIDGE_CLK			62
+#define GCC_PCIE3X1_0_AXI_S_CLK				63
+#define GCC_PCIE3X1_0_PIPE_CLK				64
+#define GCC_PCIE3X1_0_RCHG_CLK				65
+#define GCC_PCIE3X1_0_RCHG_CLK_SRC			66
+#define GCC_PCIE3X1_1_AHB_CLK				67
+#define GCC_PCIE3X1_1_AUX_CLK				68
+#define GCC_PCIE3X1_1_AXI_CLK_SRC			69
+#define GCC_PCIE3X1_1_AXI_M_CLK				70
+#define GCC_PCIE3X1_1_AXI_S_BRIDGE_CLK			71
+#define GCC_PCIE3X1_1_AXI_S_CLK				72
+#define GCC_PCIE3X1_1_PIPE_CLK				73
+#define GCC_PCIE3X1_1_RCHG_CLK				74
+#define GCC_PCIE3X1_1_RCHG_CLK_SRC			75
+#define GCC_PCIE3X1_PHY_AHB_CLK				76
+#define GCC_PCIE3X2_AHB_CLK				77
+#define GCC_PCIE3X2_AUX_CLK				78
+#define GCC_PCIE3X2_AXI_M_CLK				79
+#define GCC_PCIE3X2_AXI_M_CLK_SRC			80
+#define GCC_PCIE3X2_AXI_S_BRIDGE_CLK			81
+#define GCC_PCIE3X2_AXI_S_CLK				82
+#define GCC_PCIE3X2_AXI_S_CLK_SRC			83
+#define GCC_PCIE3X2_PHY_AHB_CLK				84
+#define GCC_PCIE3X2_PIPE_CLK				85
+#define GCC_PCIE3X2_RCHG_CLK				86
+#define GCC_PCIE3X2_RCHG_CLK_SRC			87
+#define GCC_PCIE_AUX_CLK_SRC				88
+#define GCC_PCNOC_AT_CLK				89
+#define GCC_PCNOC_BFDCD_CLK_SRC				90
+#define GCC_PCNOC_LPASS_CLK				91
+#define GCC_PRNG_AHB_CLK				92
+#define GCC_Q6_AHB_CLK					93
+#define GCC_Q6_AHB_S_CLK				94
+#define GCC_Q6_AXIM_CLK					95
+#define GCC_Q6_AXIM_CLK_SRC				96
+#define GCC_Q6_AXIS_CLK					97
+#define GCC_Q6_TSCTR_1TO2_CLK				98
+#define GCC_Q6SS_ATBM_CLK				99
+#define GCC_Q6SS_PCLKDBG_CLK				100
+#define GCC_Q6SS_TRIG_CLK				101
+#define GCC_QDSS_AT_CLK					102
+#define GCC_QDSS_AT_CLK_SRC				103
+#define GCC_QDSS_CFG_AHB_CLK				104
+#define GCC_QDSS_DAP_AHB_CLK				105
+#define GCC_QDSS_DAP_CLK				106
+#define GCC_QDSS_DAP_DIV_CLK_SRC			107
+#define GCC_QDSS_ETR_USB_CLK				108
+#define GCC_QDSS_EUD_AT_CLK				109
+#define GCC_QDSS_TSCTR_CLK_SRC				110
+#define GCC_QPIC_AHB_CLK				111
+#define GCC_QPIC_CLK					112
+#define GCC_QPIC_IO_MACRO_CLK				113
+#define GCC_QPIC_IO_MACRO_CLK_SRC			114
+#define GCC_QPIC_SLEEP_CLK				115
+#define GCC_SDCC1_AHB_CLK				116
+#define GCC_SDCC1_APPS_CLK				117
+#define GCC_SDCC1_APPS_CLK_SRC				118
+#define GCC_SLEEP_CLK_SRC				119
+#define GCC_SNOC_LPASS_CFG_CLK				120
+#define GCC_SNOC_NSSNOC_1_CLK				121
+#define GCC_SNOC_NSSNOC_CLK				122
+#define GCC_SNOC_PCIE3_1LANE_1_M_CLK			123
+#define GCC_SNOC_PCIE3_1LANE_1_S_CLK			124
+#define GCC_SNOC_PCIE3_1LANE_M_CLK			125
+#define GCC_SNOC_PCIE3_1LANE_S_CLK			126
+#define GCC_SNOC_PCIE3_2LANE_M_CLK			127
+#define GCC_SNOC_PCIE3_2LANE_S_CLK			128
+#define GCC_SNOC_USB_CLK				129
+#define GCC_SYS_NOC_AT_CLK				130
+#define GCC_SYS_NOC_WCSS_AHB_CLK			131
+#define GCC_SYSTEM_NOC_BFDCD_CLK_SRC			132
+#define GCC_UNIPHY0_AHB_CLK				133
+#define GCC_UNIPHY0_SYS_CLK				134
+#define GCC_UNIPHY1_AHB_CLK				135
+#define GCC_UNIPHY1_SYS_CLK				136
+#define GCC_UNIPHY_SYS_CLK_SRC				137
+#define GCC_USB0_AUX_CLK				138
+#define GCC_USB0_AUX_CLK_SRC				139
+#define GCC_USB0_EUD_AT_CLK				140
+#define GCC_USB0_LFPS_CLK				141
+#define GCC_USB0_LFPS_CLK_SRC				142
+#define GCC_USB0_MASTER_CLK				143
+#define GCC_USB0_MASTER_CLK_SRC				144
+#define GCC_USB0_MOCK_UTMI_CLK				145
+#define GCC_USB0_MOCK_UTMI_CLK_SRC			146
+#define GCC_USB0_MOCK_UTMI_DIV_CLK_SRC			147
+#define GCC_USB0_PHY_CFG_AHB_CLK			148
+#define GCC_USB0_PIPE_CLK				149
+#define GCC_USB0_SLEEP_CLK				150
+#define GCC_WCSS_AHB_CLK_SRC				151
+#define GCC_WCSS_AXIM_CLK				152
+#define GCC_WCSS_AXIS_CLK				153
+#define GCC_WCSS_DBG_IFC_APB_BDG_CLK			154
+#define GCC_WCSS_DBG_IFC_APB_CLK			155
+#define GCC_WCSS_DBG_IFC_ATB_BDG_CLK			156
+#define GCC_WCSS_DBG_IFC_ATB_CLK			157
+#define GCC_WCSS_DBG_IFC_NTS_BDG_CLK			158
+#define GCC_WCSS_DBG_IFC_NTS_CLK			159
+#define GCC_WCSS_ECAHB_CLK				160
+#define GCC_WCSS_MST_ASYNC_BDG_CLK			161
+#define GCC_WCSS_SLV_ASYNC_BDG_CLK			162
+#define GCC_XO_CLK					163
+#define GCC_XO_CLK_SRC					164
+#define GCC_XO_DIV4_CLK					165
+#define GCC_IM_SLEEP_CLK				166
+#define GCC_NSSNOC_PCNOC_1_CLK				167
+#define GCC_MEM_NOC_AHB_CLK				168
+#define GCC_MEM_NOC_APSS_AXI_CLK			169
+#define GCC_SNOC_QOSGEN_EXTREF_DIV_CLK_SRC		170
+#define GCC_MEM_NOC_QOSGEN_EXTREF_CLK			171
+#define GCC_PCIE3X2_PIPE_CLK_SRC			172
+#define GCC_PCIE3X1_0_PIPE_CLK_SRC			173
+#define GCC_PCIE3X1_1_PIPE_CLK_SRC			174
+#define GCC_USB0_PIPE_CLK_SRC				175
+
+#define GCC_ADSS_BCR					0
+#define GCC_ADSS_PWM_CLK_ARES				1
+#define GCC_AHB_CLK_ARES				2
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR		3
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_GPLL0_CLK_ARES	4
+#define GCC_APSS_AHB_CLK_ARES				5
+#define GCC_APSS_AXI_CLK_ARES				6
+#define GCC_BLSP1_AHB_CLK_ARES				7
+#define GCC_BLSP1_BCR					8
+#define GCC_BLSP1_QUP1_BCR				9
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK_ARES		10
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK_ARES		11
+#define GCC_BLSP1_QUP2_BCR				12
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK_ARES		13
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK_ARES		14
+#define GCC_BLSP1_QUP3_BCR				15
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK_ARES		16
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK_ARES		17
+#define GCC_BLSP1_SLEEP_CLK_ARES			18
+#define GCC_BLSP1_UART1_APPS_CLK_ARES			19
+#define GCC_BLSP1_UART1_BCR				20
+#define GCC_BLSP1_UART2_APPS_CLK_ARES			21
+#define GCC_BLSP1_UART2_BCR				22
+#define GCC_BLSP1_UART3_APPS_CLK_ARES			23
+#define GCC_BLSP1_UART3_BCR				24
+#define GCC_CE_BCR					25
+#define GCC_CMN_BLK_BCR					26
+#define GCC_CMN_LDO0_BCR				27
+#define GCC_CMN_LDO1_BCR				28
+#define GCC_DCC_BCR					29
+#define GCC_GP1_CLK_ARES				30
+#define GCC_GP2_CLK_ARES				31
+#define GCC_LPASS_BCR					32
+#define GCC_LPASS_CORE_AXIM_CLK_ARES			33
+#define GCC_LPASS_SWAY_CLK_ARES				34
+#define GCC_MDIOM_BCR					35
+#define GCC_MDIOS_BCR					36
+#define GCC_NSS_BCR					37
+#define GCC_NSS_TS_CLK_ARES				38
+#define GCC_NSSCC_CLK_ARES				39
+#define GCC_NSSCFG_CLK_ARES				40
+#define GCC_NSSNOC_ATB_CLK_ARES				41
+#define GCC_NSSNOC_NSSCC_CLK_ARES			42
+#define GCC_NSSNOC_QOSGEN_REF_CLK_ARES			43
+#define GCC_NSSNOC_SNOC_1_CLK_ARES			44
+#define GCC_NSSNOC_SNOC_CLK_ARES			45
+#define GCC_NSSNOC_TIMEOUT_REF_CLK_ARES			46
+#define GCC_NSSNOC_XO_DCD_CLK_ARES			47
+#define GCC_PCIE3X1_0_AHB_CLK_ARES			48
+#define GCC_PCIE3X1_0_AUX_CLK_ARES			49
+#define GCC_PCIE3X1_0_AXI_M_CLK_ARES			50
+#define GCC_PCIE3X1_0_AXI_S_BRIDGE_CLK_ARES		51
+#define GCC_PCIE3X1_0_AXI_S_CLK_ARES			52
+#define GCC_PCIE3X1_0_BCR				53
+#define GCC_PCIE3X1_0_LINK_DOWN_BCR			54
+#define GCC_PCIE3X1_0_PHY_BCR				55
+#define GCC_PCIE3X1_0_PHY_PHY_BCR			56
+#define GCC_PCIE3X1_1_AHB_CLK_ARES			57
+#define GCC_PCIE3X1_1_AUX_CLK_ARES			58
+#define GCC_PCIE3X1_1_AXI_M_CLK_ARES			59
+#define GCC_PCIE3X1_1_AXI_S_BRIDGE_CLK_ARES		60
+#define GCC_PCIE3X1_1_AXI_S_CLK_ARES			61
+#define GCC_PCIE3X1_1_BCR				62
+#define GCC_PCIE3X1_1_LINK_DOWN_BCR			63
+#define GCC_PCIE3X1_1_PHY_BCR				64
+#define GCC_PCIE3X1_1_PHY_PHY_BCR			65
+#define GCC_PCIE3X1_PHY_AHB_CLK_ARES			66
+#define GCC_PCIE3X2_AHB_CLK_ARES			67
+#define GCC_PCIE3X2_AUX_CLK_ARES			68
+#define GCC_PCIE3X2_AXI_M_CLK_ARES			69
+#define GCC_PCIE3X2_AXI_S_BRIDGE_CLK_ARES		70
+#define GCC_PCIE3X2_AXI_S_CLK_ARES			71
+#define GCC_PCIE3X2_BCR					72
+#define GCC_PCIE3X2_LINK_DOWN_BCR			73
+#define GCC_PCIE3X2_PHY_AHB_CLK_ARES			74
+#define GCC_PCIE3X2_PHY_BCR				75
+#define GCC_PCIE3X2PHY_PHY_BCR				76
+#define GCC_PCNOC_BCR					77
+#define GCC_PCNOC_LPASS_CLK_ARES			78
+#define GCC_PRNG_AHB_CLK_ARES				79
+#define GCC_PRNG_BCR					80
+#define GCC_Q6_AHB_CLK_ARES				81
+#define GCC_Q6_AHB_S_CLK_ARES				82
+#define GCC_Q6_AXIM_CLK_ARES				83
+#define GCC_Q6_AXIS_CLK_ARES				84
+#define GCC_Q6_TSCTR_1TO2_CLK_ARES			85
+#define GCC_Q6SS_ATBM_CLK_ARES				86
+#define GCC_Q6SS_PCLKDBG_CLK_ARES			87
+#define GCC_Q6SS_TRIG_CLK_ARES				88
+#define GCC_QDSS_APB2JTAG_CLK_ARES			89
+#define GCC_QDSS_AT_CLK_ARES				90
+#define GCC_QDSS_BCR					91
+#define GCC_QDSS_CFG_AHB_CLK_ARES			92
+#define GCC_QDSS_DAP_AHB_CLK_ARES			93
+#define GCC_QDSS_DAP_CLK_ARES				94
+#define GCC_QDSS_ETR_USB_CLK_ARES			95
+#define GCC_QDSS_EUD_AT_CLK_ARES			96
+#define GCC_QDSS_STM_CLK_ARES				97
+#define GCC_QDSS_TRACECLKIN_CLK_ARES			98
+#define GCC_QDSS_TS_CLK_ARES				99
+#define GCC_QDSS_TSCTR_DIV16_CLK_ARES			100
+#define GCC_QDSS_TSCTR_DIV2_CLK_ARES			101
+#define GCC_QDSS_TSCTR_DIV3_CLK_ARES			102
+#define GCC_QDSS_TSCTR_DIV4_CLK_ARES			103
+#define GCC_QDSS_TSCTR_DIV8_CLK_ARES			104
+#define GCC_QPIC_AHB_CLK_ARES				105
+#define GCC_QPIC_CLK_ARES				106
+#define GCC_QPIC_BCR					107
+#define GCC_QPIC_IO_MACRO_CLK_ARES			108
+#define GCC_QPIC_SLEEP_CLK_ARES				109
+#define GCC_QUSB2_0_PHY_BCR				110
+#define GCC_SDCC1_AHB_CLK_ARES				111
+#define GCC_SDCC1_APPS_CLK_ARES				112
+#define GCC_SDCC_BCR					113
+#define GCC_SNOC_BCR					114
+#define GCC_SNOC_LPASS_CFG_CLK_ARES			115
+#define GCC_SNOC_NSSNOC_1_CLK_ARES			116
+#define GCC_SNOC_NSSNOC_CLK_ARES			117
+#define GCC_SYS_NOC_QDSS_STM_AXI_CLK_ARES		118
+#define GCC_SYS_NOC_WCSS_AHB_CLK_ARES			119
+#define GCC_UNIPHY0_AHB_CLK_ARES			120
+#define GCC_UNIPHY0_BCR					121
+#define GCC_UNIPHY0_SYS_CLK_ARES			122
+#define GCC_UNIPHY1_AHB_CLK_ARES			123
+#define GCC_UNIPHY1_BCR					124
+#define GCC_UNIPHY1_SYS_CLK_ARES			125
+#define GCC_USB0_AUX_CLK_ARES				126
+#define GCC_USB0_EUD_AT_CLK_ARES			127
+#define GCC_USB0_LFPS_CLK_ARES				128
+#define GCC_USB0_MASTER_CLK_ARES			129
+#define GCC_USB0_MOCK_UTMI_CLK_ARES			130
+#define GCC_USB0_PHY_BCR				131
+#define GCC_USB0_PHY_CFG_AHB_CLK_ARES			132
+#define GCC_USB0_SLEEP_CLK_ARES				133
+#define GCC_USB3PHY_0_PHY_BCR				134
+#define GCC_USB_BCR					135
+#define GCC_WCSS_AXIM_CLK_ARES				136
+#define GCC_WCSS_AXIS_CLK_ARES				137
+#define GCC_WCSS_BCR					138
+#define GCC_WCSS_DBG_IFC_APB_BDG_CLK_ARES		139
+#define GCC_WCSS_DBG_IFC_APB_CLK_ARES			140
+#define GCC_WCSS_DBG_IFC_ATB_BDG_CLK_ARES		141
+#define GCC_WCSS_DBG_IFC_ATB_CLK_ARES			142
+#define GCC_WCSS_DBG_IFC_NTS_BDG_CLK_ARES		143
+#define GCC_WCSS_DBG_IFC_NTS_CLK_ARES			144
+#define GCC_WCSS_ECAHB_CLK_ARES				145
+#define GCC_WCSS_MST_ASYNC_BDG_CLK_ARES			146
+#define GCC_WCSS_Q6_BCR					147
+#define GCC_WCSS_SLV_ASYNC_BDG_CLK_ARES			148
+#define GCC_XO_CLK_ARES					149
+#define GCC_XO_DIV4_CLK_ARES				150
+#define GCC_Q6SS_DBG_ARES				151
+#define GCC_WCSS_DBG_BDG_ARES				152
+#define GCC_WCSS_DBG_ARES				153
+#define GCC_WCSS_AXI_S_ARES				154
+#define GCC_WCSS_AXI_M_ARES				155
+#define GCC_WCSSAON_ARES				156
+#define GCC_PCIE3X2_PIPE_ARES				157
+#define GCC_PCIE3X2_CORE_STICKY_ARES			158
+#define GCC_PCIE3X2_AXI_S_STICKY_ARES			159
+#define GCC_PCIE3X2_AXI_M_STICKY_ARES			160
+#define GCC_PCIE3X1_0_PIPE_ARES				161
+#define GCC_PCIE3X1_0_CORE_STICKY_ARES			162
+#define GCC_PCIE3X1_0_AXI_S_STICKY_ARES			163
+#define GCC_PCIE3X1_0_AXI_M_STICKY_ARES			164
+#define GCC_PCIE3X1_1_PIPE_ARES				165
+#define GCC_PCIE3X1_1_CORE_STICKY_ARES			166
+#define GCC_PCIE3X1_1_AXI_S_STICKY_ARES			167
+#define GCC_PCIE3X1_1_AXI_M_STICKY_ARES			168
+#define GCC_IM_SLEEP_CLK_ARES				169
+#define GCC_NSSNOC_PCNOC_1_CLK_ARES			170
+#define GCC_UNIPHY0_XPCS_ARES				171
+#define GCC_UNIPHY1_XPCS_ARES				172
+#endif
-- 
2.34.1

