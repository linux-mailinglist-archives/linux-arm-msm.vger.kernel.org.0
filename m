Return-Path: <linux-arm-msm+bounces-21768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 699688FCEF3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE6CD1F29921
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8430F19FA96;
	Wed,  5 Jun 2024 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VA3wO0Y/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB462195979;
	Wed,  5 Jun 2024 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717591575; cv=none; b=A3aR7KtNV+JeSGPBIqHikU+DXxCddZcXI1SDC/M/vS6zxmLVuQwm5Qg6csJGkD6aTypBecf/T8HrpiRPlhkgUhrWtD0tQZc1gNFzljr1MfgfdBml//+mXvs8UxMQXb2yQ+u5kXdIEXnBx3CxP5OuJaKDhIdWJFUkbxvfRQDk4nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717591575; c=relaxed/simple;
	bh=BGLHv4xpzk0UNA/mNHCdUqELp2BxvV/rdGcf5ulqilM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/s6IurpbWtJ6FwtOGkOYm3TMPofftLDMMFd1If4sHyD6uZ/xeyTst0WOopCuAzeidbmZ3KeGMDR/pKbcUe5RB/wEluWWvmxYOC9vq+WWdkiJBn2w5HmmRMQU0qhZXMtFpRfnQFbVnsdhEKB9r0Lys60BPxdFZQjxN9qmZFCaLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VA3wO0Y/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B1M9W031654;
	Wed, 5 Jun 2024 12:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MtRQw8ew8a5XIxUZQ8THrk/sDYTFfTJEdKKytbieSYE=; b=VA3wO0Y/hbgh1sP8
	txGE72cWiNkPS0Wo8x9L//FoOMukIfl7o2itIKMzK1E++XwGMJ2rhSMtXUcP/9pB
	fnb5vFy6YF+CcTndWq3AQ8uETR4aDGUIIKRDKVYA+AzYDJv81T6/0bc628Z//MpZ
	kZ5ZXz04xJ48QqLjzyF3/t1lsMHU6x0u9OjCl+5iiYyFNjPhh2eJh4K476SUFrsv
	yIEFcQDosX7P1Sln9if4XJqqms+jnMzuR5Iu5kEBrwqZEPVWJZ+Cr623rpM4HXiJ
	yASZ8z78SaUHg2FkikOMDAfT6XWMHr8xUUAie9RLM6SHEjGNTxgCKrQgdCEZ5xsB
	kfuEdg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjk898ttv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 12:46:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455Ck4S8024567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 12:46:04 GMT
Received: from luoj-gv.qualcomm.com (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 05:46:01 -0700
From: Luo Jie <quic_luoj@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH v15 2/4] dt-bindings: clock: add qca8386/qca8084 clock and reset definitions
Date: Wed, 5 Jun 2024 20:45:39 +0800
Message-ID: <20240605124541.2711467-3-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605124541.2711467-1-quic_luoj@quicinc.com>
References: <20240605124541.2711467-1-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PH_fiQCMIGAB50YogJGy5gCwZtsQCaJB
X-Proofpoint-ORIG-GUID: PH_fiQCMIGAB50YogJGy5gCwZtsQCaJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406050096

QCA8386/QCA8084 includes the clock & reset controller that is
accessed by MDIO bus. Two work modes are supported, qca8386 works
as switch mode, qca8084 works as PHY mode.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../bindings/clock/qcom,qca8k-nsscc.yaml      |  86 +++++++++++++++
 include/dt-bindings/clock/qcom,qca8k-nsscc.h  | 101 ++++++++++++++++++
 include/dt-bindings/reset/qcom,qca8k-nsscc.h  |  76 +++++++++++++
 3 files changed, 263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,qca8k-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,qca8k-nsscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
new file mode 100644
index 000000000000..61473385da2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qca8k-nsscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm NSS Clock & Reset Controller on QCA8386/QCA8084
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Luo Jie <quic_luoj@quicinc.com>
+
+description: |
+  Qualcomm NSS clock control module provides the clocks and resets
+  on QCA8386(switch mode)/QCA8084(PHY mode)
+
+  See also::
+    include/dt-bindings/clock/qcom,qca8k-nsscc.h
+    include/dt-bindings/reset/qcom,qca8k-nsscc.h
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,qca8084-nsscc
+      - items:
+          - enum:
+              - qcom,qca8082-nsscc
+              - qcom,qca8085-nsscc
+              - qcom,qca8384-nsscc
+              - qcom,qca8385-nsscc
+              - qcom,qca8386-nsscc
+          - const: qcom,qca8084-nsscc
+
+  clocks:
+    items:
+      - description: Chip reference clock source
+      - description: UNIPHY0 RX 312P5M/125M clock source
+      - description: UNIPHY0 TX 312P5M/125M clock source
+      - description: UNIPHY1 RX 312P5M/125M clock source
+      - description: UNIPHY1 TX 312P5M/125M clock source
+      - description: UNIPHY1 RX 312P5M clock source
+      - description: UNIPHY1 TX 312P5M clock source
+
+  reg:
+    items:
+      - description: MDIO bus address for Clock & Reset Controller register
+
+  reset-gpios:
+    description: GPIO connected to the chip
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - reset-gpios
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    mdio {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@18 {
+        compatible = "qcom,qca8084-nsscc";
+        reg = <0x18>;
+        reset-gpios = <&tlmm 51 GPIO_ACTIVE_LOW>;
+        clocks = <&pcs0_pll>,
+                 <&qca8k_uniphy0_rx>,
+                 <&qca8k_uniphy0_tx>,
+                 <&qca8k_uniphy1_rx>,
+                 <&qca8k_uniphy1_tx>,
+                 <&qca8k_uniphy1_rx312p5m>,
+                 <&qca8k_uniphy1_tx312p5m>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+      };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qca8k-nsscc.h b/include/dt-bindings/clock/qcom,qca8k-nsscc.h
new file mode 100644
index 000000000000..0ac3e4c69a1a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qca8k-nsscc.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_QCA8K_NSS_CC_H
+#define _DT_BINDINGS_CLK_QCOM_QCA8K_NSS_CC_H
+
+#define NSS_CC_SWITCH_CORE_CLK_SRC				0
+#define NSS_CC_SWITCH_CORE_CLK					1
+#define NSS_CC_APB_BRIDGE_CLK					2
+#define NSS_CC_MAC0_TX_CLK_SRC					3
+#define NSS_CC_MAC0_TX_DIV_CLK_SRC				4
+#define NSS_CC_MAC0_TX_CLK					5
+#define NSS_CC_MAC0_TX_SRDS1_CLK				6
+#define NSS_CC_MAC0_RX_CLK_SRC					7
+#define NSS_CC_MAC0_RX_DIV_CLK_SRC				8
+#define NSS_CC_MAC0_RX_CLK					9
+#define NSS_CC_MAC0_RX_SRDS1_CLK				10
+#define NSS_CC_MAC1_TX_CLK_SRC					11
+#define NSS_CC_MAC1_TX_DIV_CLK_SRC				12
+#define NSS_CC_MAC1_SRDS1_CH0_XGMII_RX_DIV_CLK_SRC		13
+#define NSS_CC_MAC1_SRDS1_CH0_RX_CLK				14
+#define NSS_CC_MAC1_TX_CLK					15
+#define NSS_CC_MAC1_GEPHY0_TX_CLK				16
+#define NSS_CC_MAC1_SRDS1_CH0_XGMII_RX_CLK			17
+#define NSS_CC_MAC1_RX_CLK_SRC					18
+#define NSS_CC_MAC1_RX_DIV_CLK_SRC				19
+#define NSS_CC_MAC1_SRDS1_CH0_XGMII_TX_DIV_CLK_SRC		20
+#define NSS_CC_MAC1_SRDS1_CH0_TX_CLK				21
+#define NSS_CC_MAC1_RX_CLK					22
+#define NSS_CC_MAC1_GEPHY0_RX_CLK				23
+#define NSS_CC_MAC1_SRDS1_CH0_XGMII_TX_CLK			24
+#define NSS_CC_MAC2_TX_CLK_SRC					25
+#define NSS_CC_MAC2_TX_DIV_CLK_SRC				26
+#define NSS_CC_MAC2_SRDS1_CH1_XGMII_RX_DIV_CLK_SRC		27
+#define NSS_CC_MAC2_SRDS1_CH1_RX_CLK				28
+#define NSS_CC_MAC2_TX_CLK					29
+#define NSS_CC_MAC2_GEPHY1_TX_CLK				30
+#define NSS_CC_MAC2_SRDS1_CH1_XGMII_RX_CLK			31
+#define NSS_CC_MAC2_RX_CLK_SRC					32
+#define NSS_CC_MAC2_RX_DIV_CLK_SRC				33
+#define NSS_CC_MAC2_SRDS1_CH1_XGMII_TX_DIV_CLK_SRC		34
+#define NSS_CC_MAC2_SRDS1_CH1_TX_CLK				35
+#define NSS_CC_MAC2_RX_CLK					36
+#define NSS_CC_MAC2_GEPHY1_RX_CLK				37
+#define NSS_CC_MAC2_SRDS1_CH1_XGMII_TX_CLK			38
+#define NSS_CC_MAC3_TX_CLK_SRC					39
+#define NSS_CC_MAC3_TX_DIV_CLK_SRC				40
+#define NSS_CC_MAC3_SRDS1_CH2_XGMII_RX_DIV_CLK_SRC		41
+#define NSS_CC_MAC3_SRDS1_CH2_RX_CLK				42
+#define NSS_CC_MAC3_TX_CLK					43
+#define NSS_CC_MAC3_GEPHY2_TX_CLK				44
+#define NSS_CC_MAC3_SRDS1_CH2_XGMII_RX_CLK			45
+#define NSS_CC_MAC3_RX_CLK_SRC					46
+#define NSS_CC_MAC3_RX_DIV_CLK_SRC				47
+#define NSS_CC_MAC3_SRDS1_CH2_XGMII_TX_DIV_CLK_SRC		48
+#define NSS_CC_MAC3_SRDS1_CH2_TX_CLK				49
+#define NSS_CC_MAC3_RX_CLK					50
+#define NSS_CC_MAC3_GEPHY2_RX_CLK				51
+#define NSS_CC_MAC3_SRDS1_CH2_XGMII_TX_CLK			52
+#define NSS_CC_MAC4_TX_CLK_SRC					53
+#define NSS_CC_MAC4_TX_DIV_CLK_SRC				54
+#define NSS_CC_MAC4_SRDS1_CH3_XGMII_RX_DIV_CLK_SRC		55
+#define NSS_CC_MAC4_SRDS1_CH3_RX_CLK				56
+#define NSS_CC_MAC4_TX_CLK					57
+#define NSS_CC_MAC4_GEPHY3_TX_CLK				58
+#define NSS_CC_MAC4_SRDS1_CH3_XGMII_RX_CLK			59
+#define NSS_CC_MAC4_RX_CLK_SRC					60
+#define NSS_CC_MAC4_RX_DIV_CLK_SRC				61
+#define NSS_CC_MAC4_SRDS1_CH3_XGMII_TX_DIV_CLK_SRC		62
+#define NSS_CC_MAC4_SRDS1_CH3_TX_CLK				63
+#define NSS_CC_MAC4_RX_CLK					64
+#define NSS_CC_MAC4_GEPHY3_RX_CLK				65
+#define NSS_CC_MAC4_SRDS1_CH3_XGMII_TX_CLK			66
+#define NSS_CC_MAC5_TX_CLK_SRC					67
+#define NSS_CC_MAC5_TX_DIV_CLK_SRC				68
+#define NSS_CC_MAC5_TX_SRDS0_CLK				69
+#define NSS_CC_MAC5_TX_CLK					70
+#define NSS_CC_MAC5_RX_CLK_SRC					71
+#define NSS_CC_MAC5_RX_DIV_CLK_SRC				72
+#define NSS_CC_MAC5_RX_SRDS0_CLK				73
+#define NSS_CC_MAC5_RX_CLK					74
+#define NSS_CC_MAC5_TX_SRDS0_CLK_SRC				75
+#define NSS_CC_MAC5_RX_SRDS0_CLK_SRC				76
+#define NSS_CC_AHB_CLK_SRC					77
+#define NSS_CC_AHB_CLK						78
+#define NSS_CC_SEC_CTRL_AHB_CLK					79
+#define NSS_CC_TLMM_CLK						80
+#define NSS_CC_TLMM_AHB_CLK					81
+#define NSS_CC_CNOC_AHB_CLK					82
+#define NSS_CC_MDIO_AHB_CLK					83
+#define NSS_CC_MDIO_MASTER_AHB_CLK				84
+#define NSS_CC_SYS_CLK_SRC					85
+#define NSS_CC_SRDS0_SYS_CLK					86
+#define NSS_CC_SRDS1_SYS_CLK					87
+#define NSS_CC_GEPHY0_SYS_CLK					88
+#define NSS_CC_GEPHY1_SYS_CLK					89
+#define NSS_CC_GEPHY2_SYS_CLK					90
+#define NSS_CC_GEPHY3_SYS_CLK					91
+#endif
diff --git a/include/dt-bindings/reset/qcom,qca8k-nsscc.h b/include/dt-bindings/reset/qcom,qca8k-nsscc.h
new file mode 100644
index 000000000000..c71167a3bd41
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,qca8k-nsscc.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_RESET_QCOM_QCA8K_NSS_CC_H
+#define _DT_BINDINGS_RESET_QCOM_QCA8K_NSS_CC_H
+
+#define NSS_CC_SWITCH_CORE_ARES				1
+#define NSS_CC_APB_BRIDGE_ARES				2
+#define NSS_CC_MAC0_TX_ARES				3
+#define NSS_CC_MAC0_TX_SRDS1_ARES			4
+#define NSS_CC_MAC0_RX_ARES				5
+#define NSS_CC_MAC0_RX_SRDS1_ARES			6
+#define NSS_CC_MAC1_SRDS1_CH0_RX_ARES			7
+#define NSS_CC_MAC1_TX_ARES				8
+#define NSS_CC_MAC1_GEPHY0_TX_ARES			9
+#define NSS_CC_MAC1_SRDS1_CH0_XGMII_RX_ARES		10
+#define NSS_CC_MAC1_SRDS1_CH0_TX_ARES			11
+#define NSS_CC_MAC1_RX_ARES				12
+#define NSS_CC_MAC1_GEPHY0_RX_ARES			13
+#define NSS_CC_MAC1_SRDS1_CH0_XGMII_TX_ARES		14
+#define NSS_CC_MAC2_SRDS1_CH1_RX_ARES			15
+#define NSS_CC_MAC2_TX_ARES				16
+#define NSS_CC_MAC2_GEPHY1_TX_ARES			17
+#define NSS_CC_MAC2_SRDS1_CH1_XGMII_RX_ARES		18
+#define NSS_CC_MAC2_SRDS1_CH1_TX_ARES			19
+#define NSS_CC_MAC2_RX_ARES				20
+#define NSS_CC_MAC2_GEPHY1_RX_ARES			21
+#define NSS_CC_MAC2_SRDS1_CH1_XGMII_TX_ARES		22
+#define NSS_CC_MAC3_SRDS1_CH2_RX_ARES			23
+#define NSS_CC_MAC3_TX_ARES				24
+#define NSS_CC_MAC3_GEPHY2_TX_ARES			25
+#define NSS_CC_MAC3_SRDS1_CH2_XGMII_RX_ARES		26
+#define NSS_CC_MAC3_SRDS1_CH2_TX_ARES			27
+#define NSS_CC_MAC3_RX_ARES				28
+#define NSS_CC_MAC3_GEPHY2_RX_ARES			29
+#define NSS_CC_MAC3_SRDS1_CH2_XGMII_TX_ARES		30
+#define NSS_CC_MAC4_SRDS1_CH3_RX_ARES			31
+#define NSS_CC_MAC4_TX_ARES				32
+#define NSS_CC_MAC4_GEPHY3_TX_ARES			33
+#define NSS_CC_MAC4_SRDS1_CH3_XGMII_RX_ARES		34
+#define NSS_CC_MAC4_SRDS1_CH3_TX_ARES			35
+#define NSS_CC_MAC4_RX_ARES				36
+#define NSS_CC_MAC4_GEPHY3_RX_ARES			37
+#define NSS_CC_MAC4_SRDS1_CH3_XGMII_TX_ARES		38
+#define NSS_CC_MAC5_TX_ARES				39
+#define NSS_CC_MAC5_TX_SRDS0_ARES			40
+#define NSS_CC_MAC5_RX_ARES				41
+#define NSS_CC_MAC5_RX_SRDS0_ARES			42
+#define NSS_CC_AHB_ARES					43
+#define NSS_CC_SEC_CTRL_AHB_ARES			44
+#define NSS_CC_TLMM_ARES				45
+#define NSS_CC_TLMM_AHB_ARES				46
+#define NSS_CC_CNOC_AHB_ARES				47
+#define NSS_CC_MDIO_AHB_ARES				48
+#define NSS_CC_MDIO_MASTER_AHB_ARES			49
+#define NSS_CC_SRDS0_SYS_ARES				50
+#define NSS_CC_SRDS1_SYS_ARES				51
+#define NSS_CC_GEPHY0_SYS_ARES				52
+#define NSS_CC_GEPHY1_SYS_ARES				53
+#define NSS_CC_GEPHY2_SYS_ARES				54
+#define NSS_CC_GEPHY3_SYS_ARES				55
+#define NSS_CC_SEC_CTRL_ARES				56
+#define NSS_CC_SEC_CTRL_SENSE_ARES			57
+#define NSS_CC_SLEEP_ARES				58
+#define NSS_CC_DEBUG_ARES				59
+#define NSS_CC_GEPHY0_ARES				60
+#define NSS_CC_GEPHY1_ARES				61
+#define NSS_CC_GEPHY2_ARES				62
+#define NSS_CC_GEPHY3_ARES				63
+#define NSS_CC_DSP_ARES					64
+#define NSS_CC_GEPHY_FULL_ARES				65
+#define NSS_CC_GLOBAL_ARES				66
+#define NSS_CC_XPCS_ARES				67
+#endif
-- 
2.34.1


