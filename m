Return-Path: <linux-arm-msm+bounces-29274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA3695B3C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 13:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B447C281D16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940C41C9443;
	Thu, 22 Aug 2024 11:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yghlv+5o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93FA1C9447;
	Thu, 22 Aug 2024 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724326067; cv=none; b=BUX3xwtBGEXGLwiGXW04zca2IDUEWYPLJZAJAO1sPwsewHXFbxMmPpcPG/PUF1oCAx6CA8TpXjl+m4XwFd8NNj+93pgA4PAaLR+7YzG0n9NuzyJr0CANR8x2ok2ieDRlSCY2MuWRtyXUdVTmVaem3hBsn4GkmyxRvSUrDdxbl9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724326067; c=relaxed/simple;
	bh=V+7Ia5GoQleXGzOZw/mJEfLTpTWZTf4dPJZjpnhR6nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QpPztJPdNGb/kqUKkupG/DZ5i4TmW/GIdHdFcnajTR2lzw4PKt3lRzYa3xF5usjL47wQLhSTs/EiZVk+ol6lKTAE0OdV7QZaBoyfVKlF6krYVDpfdDLhrIaDxRRMEuCk8E2fP2bTT2QLUhcHH4rfwTyG+RQK4D9u8RrsVQtMF28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yghlv+5o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MA2WNM006666;
	Thu, 22 Aug 2024 11:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f99jyWhV+mBGbMt7AEWno8lIdLQvMuFRZsg318ktDSs=; b=Yghlv+5oVJBiduY4
	4zCi5TkyLlpev+fw4OFtuzdk64zj2MJlo+6kpPHCH/UYDZXl0mkTdW6sb24oGJxV
	6WoqXuBG7qwsdRCxyICj2fzY1quB2ZOGt6rtRVv22/tmyUY4PU40vYdqo1nJLcMl
	ljftHQmBtj1BMq1hPx01E5TtyVBa+e922PDsg6F53fPaDbXTaBB/KB5KByvoo9Ku
	4lmqAenD07vS9fpciHWFHybUFnu8gnTCSDY7NQ/SAGQ3Hl+xU2jfOSZBKoXthL2I
	pS3N8QDUFhgroPUtvfwVTglaTS89RLe/5Ov3wZXGiVifEsAR+VI1Sw91xGlZN6Ym
	qz7Giw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415bkwcctc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 11:27:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MBRdac010779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 11:27:39 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 22 Aug 2024 04:27:34 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 22 Aug 2024 16:57:18 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add GCC clocks for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240822-qcs8300-gcc-v2-1-b310dfa70ad8@quicinc.com>
References: <20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com>
In-Reply-To: <20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, Imran Shaik
	<quic_imrashai@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: opfB5wHvEaR6SD-ROX9Zqf1S47H0C_rd
X-Proofpoint-GUID: opfB5wHvEaR6SD-ROX9Zqf1S47H0C_rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408220085

Add support for qcom global clock controller bindings for QCS8300 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 .../bindings/clock/qcom,qcs8300-gcc.yaml           |  66 ++++++
 include/dt-bindings/clock/qcom,qcs8300-gcc.h       | 234 +++++++++++++++++++++
 2 files changed, 300 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml
new file mode 100644
index 000000000000..081bc452081f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs8300-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Global Clock & Reset Controller on QCS8300
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+  - Imran Shaik <quic_imrashai@quicinc.com>
+
+description: |
+  Qualcomm Technologies, Inc. Global clock control module provides the clocks, resets and
+  power domains on QCS8300
+
+  See also: include/dt-bindings/clock/qcom,qcs8300-gcc.h
+
+properties:
+  compatible:
+    const: qcom,qcs8300-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIE 0 Pipe clock source
+      - description: PCIE 1 Pipe clock source
+      - description: PCIE Phy Auxiliary clock source
+      - description: First EMAC controller reference clock
+      - description: UFS Phy Rx symbol 0 clock source
+      - description: UFS Phy Rx symbol 1 clock source
+      - description: UFS Phy Tx symbol 0 clock source
+      - description: USB3 Phy wrapper pipe clock source
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,qcs8300-gcc";
+      reg = <0x00100000 0xc7018>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>,
+               <&pcie_0_pipe_clk>,
+               <&pcie_1_pipe_clk>,
+               <&pcie_phy_aux_clk>,
+               <&rxc0_ref_clk>,
+               <&ufs_phy_rx_symbol_0_clk>,
+               <&ufs_phy_rx_symbol_1_clk>,
+               <&ufs_phy_tx_symbol_0_clk>,
+               <&usb3_phy_wrapper_gcc_usb30_prim_pipe_clk>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcs8300-gcc.h b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
new file mode 100644
index 000000000000..a0083b1d2126
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
@@ -0,0 +1,234 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_QCS8300_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_QCS8300_H
+
+/* GCC clocks */
+#define GCC_GPLL0						0
+#define GCC_GPLL0_OUT_EVEN					1
+#define GCC_GPLL1						2
+#define GCC_GPLL4						3
+#define GCC_GPLL7						4
+#define GCC_GPLL9						5
+#define GCC_AGGRE_NOC_QUPV3_AXI_CLK				6
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				7
+#define GCC_AGGRE_USB2_PRIM_AXI_CLK				8
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				9
+#define GCC_AHB2PHY0_CLK					10
+#define GCC_AHB2PHY2_CLK					11
+#define GCC_AHB2PHY3_CLK					12
+#define GCC_BOOT_ROM_AHB_CLK					13
+#define GCC_CAMERA_AHB_CLK					14
+#define GCC_CAMERA_HF_AXI_CLK					15
+#define GCC_CAMERA_SF_AXI_CLK					16
+#define GCC_CAMERA_THROTTLE_XO_CLK				17
+#define GCC_CAMERA_XO_CLK					18
+#define GCC_CFG_NOC_USB2_PRIM_AXI_CLK				19
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				20
+#define GCC_DDRSS_GPU_AXI_CLK					21
+#define GCC_DISP_AHB_CLK					22
+#define GCC_DISP_HF_AXI_CLK					23
+#define GCC_DISP_XO_CLK						24
+#define GCC_EDP_REF_CLKREF_EN					25
+#define GCC_EMAC0_AXI_CLK					26
+#define GCC_EMAC0_PHY_AUX_CLK					27
+#define GCC_EMAC0_PHY_AUX_CLK_SRC				28
+#define GCC_EMAC0_PTP_CLK					29
+#define GCC_EMAC0_PTP_CLK_SRC					30
+#define GCC_EMAC0_RGMII_CLK					31
+#define GCC_EMAC0_RGMII_CLK_SRC					32
+#define GCC_EMAC0_SLV_AHB_CLK					33
+#define GCC_GP1_CLK						34
+#define GCC_GP1_CLK_SRC						35
+#define GCC_GP2_CLK						36
+#define GCC_GP2_CLK_SRC						37
+#define GCC_GP3_CLK						38
+#define GCC_GP3_CLK_SRC						39
+#define GCC_GP4_CLK						40
+#define GCC_GP4_CLK_SRC						41
+#define GCC_GP5_CLK						42
+#define GCC_GP5_CLK_SRC						43
+#define GCC_GPU_CFG_AHB_CLK					44
+#define GCC_GPU_GPLL0_CLK_SRC					45
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				46
+#define GCC_GPU_MEMNOC_GFX_CENTER_PIPELINE_CLK			47
+#define GCC_GPU_MEMNOC_GFX_CLK					48
+#define GCC_GPU_SNOC_DVM_GFX_CLK				49
+#define GCC_GPU_TCU_THROTTLE_AHB_CLK				50
+#define GCC_GPU_TCU_THROTTLE_CLK				51
+#define GCC_PCIE_0_AUX_CLK					52
+#define GCC_PCIE_0_AUX_CLK_SRC					53
+#define GCC_PCIE_0_CFG_AHB_CLK					54
+#define GCC_PCIE_0_MSTR_AXI_CLK					55
+#define GCC_PCIE_0_PHY_AUX_CLK					56
+#define GCC_PCIE_0_PHY_AUX_CLK_SRC				57
+#define GCC_PCIE_0_PHY_RCHNG_CLK				58
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				59
+#define GCC_PCIE_0_PIPE_CLK					60
+#define GCC_PCIE_0_PIPE_CLK_SRC					61
+#define GCC_PCIE_0_PIPE_DIV_CLK_SRC				62
+#define GCC_PCIE_0_PIPEDIV2_CLK					63
+#define GCC_PCIE_0_SLV_AXI_CLK					64
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				65
+#define GCC_PCIE_1_AUX_CLK					66
+#define GCC_PCIE_1_AUX_CLK_SRC					67
+#define GCC_PCIE_1_CFG_AHB_CLK					68
+#define GCC_PCIE_1_MSTR_AXI_CLK					69
+#define GCC_PCIE_1_PHY_AUX_CLK					70
+#define GCC_PCIE_1_PHY_AUX_CLK_SRC				71
+#define GCC_PCIE_1_PHY_RCHNG_CLK				72
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				73
+#define GCC_PCIE_1_PIPE_CLK					74
+#define GCC_PCIE_1_PIPE_CLK_SRC					75
+#define GCC_PCIE_1_PIPE_DIV_CLK_SRC				76
+#define GCC_PCIE_1_PIPEDIV2_CLK					77
+#define GCC_PCIE_1_SLV_AXI_CLK					78
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				79
+#define GCC_PCIE_CLKREF_EN					80
+#define GCC_PCIE_THROTTLE_CFG_CLK				81
+#define GCC_PDM2_CLK						82
+#define GCC_PDM2_CLK_SRC					83
+#define GCC_PDM_AHB_CLK						84
+#define GCC_PDM_XO4_CLK						85
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				86
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				87
+#define GCC_QMIP_DISP_AHB_CLK					88
+#define GCC_QMIP_DISP_ROT_AHB_CLK				89
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				90
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				91
+#define GCC_QMIP_VIDEO_VCPU_AHB_CLK				92
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				93
+#define GCC_QUPV3_WRAP0_CORE_CLK				94
+#define GCC_QUPV3_WRAP0_S0_CLK					95
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				96
+#define GCC_QUPV3_WRAP0_S1_CLK					97
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				98
+#define GCC_QUPV3_WRAP0_S2_CLK					99
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				100
+#define GCC_QUPV3_WRAP0_S3_CLK					101
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				102
+#define GCC_QUPV3_WRAP0_S4_CLK					103
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				104
+#define GCC_QUPV3_WRAP0_S5_CLK					105
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				106
+#define GCC_QUPV3_WRAP0_S6_CLK					107
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC				108
+#define GCC_QUPV3_WRAP0_S7_CLK					109
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC				110
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				111
+#define GCC_QUPV3_WRAP1_CORE_CLK				112
+#define GCC_QUPV3_WRAP1_S0_CLK					113
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				114
+#define GCC_QUPV3_WRAP1_S1_CLK					115
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				116
+#define GCC_QUPV3_WRAP1_S2_CLK					117
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				118
+#define GCC_QUPV3_WRAP1_S3_CLK					119
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				120
+#define GCC_QUPV3_WRAP1_S4_CLK					121
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				122
+#define GCC_QUPV3_WRAP1_S5_CLK					123
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				124
+#define GCC_QUPV3_WRAP1_S6_CLK					125
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				126
+#define GCC_QUPV3_WRAP1_S7_CLK					127
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				128
+#define GCC_QUPV3_WRAP3_CORE_2X_CLK				129
+#define GCC_QUPV3_WRAP3_CORE_CLK				130
+#define GCC_QUPV3_WRAP3_QSPI_CLK				131
+#define GCC_QUPV3_WRAP3_S0_CLK					132
+#define GCC_QUPV3_WRAP3_S0_CLK_SRC				133
+#define GCC_QUPV3_WRAP3_S0_DIV_CLK_SRC				134
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				135
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				136
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				137
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				138
+#define GCC_QUPV3_WRAP_3_M_AHB_CLK				139
+#define GCC_QUPV3_WRAP_3_S_AHB_CLK				140
+#define GCC_SDCC1_AHB_CLK					141
+#define GCC_SDCC1_APPS_CLK					142
+#define GCC_SDCC1_APPS_CLK_SRC					143
+#define GCC_SDCC1_ICE_CORE_CLK					144
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				145
+#define GCC_SGMI_CLKREF_EN					146
+#define GCC_UFS_PHY_AHB_CLK					147
+#define GCC_UFS_PHY_AXI_CLK					148
+#define GCC_UFS_PHY_AXI_CLK_SRC					149
+#define GCC_UFS_PHY_ICE_CORE_CLK				150
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				151
+#define GCC_UFS_PHY_PHY_AUX_CLK					152
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				153
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				154
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				155
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				156
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				157
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				158
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				159
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				160
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				161
+#define GCC_USB20_MASTER_CLK					162
+#define GCC_USB20_MASTER_CLK_SRC				163
+#define GCC_USB20_MOCK_UTMI_CLK					164
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				165
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			166
+#define GCC_USB20_SLEEP_CLK					167
+#define GCC_USB30_PRIM_MASTER_CLK				168
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				169
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				170
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			171
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		172
+#define GCC_USB30_PRIM_SLEEP_CLK				173
+#define GCC_USB3_PRIM_PHY_AUX_CLK				174
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				175
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				176
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				177
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				178
+#define GCC_USB_CLKREF_EN					179
+#define GCC_VIDEO_AHB_CLK					180
+#define GCC_VIDEO_AXI0_CLK					181
+#define GCC_VIDEO_AXI1_CLK					182
+#define GCC_VIDEO_XO_CLK					183
+
+/* GCC power domains */
+#define GCC_EMAC0_GDSC						0
+#define GCC_PCIE_0_GDSC						1
+#define GCC_PCIE_1_GDSC						2
+#define GCC_UFS_PHY_GDSC					3
+#define GCC_USB20_PRIM_GDSC					4
+#define GCC_USB30_PRIM_GDSC					5
+
+/* GCC resets */
+#define GCC_EMAC0_BCR						0
+#define GCC_PCIE_0_BCR						1
+#define GCC_PCIE_0_LINK_DOWN_BCR				2
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				3
+#define GCC_PCIE_0_PHY_BCR					4
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			5
+#define GCC_PCIE_1_BCR						6
+#define GCC_PCIE_1_LINK_DOWN_BCR				7
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				8
+#define GCC_PCIE_1_PHY_BCR					9
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			10
+#define GCC_SDCC1_BCR						11
+#define GCC_UFS_PHY_BCR						12
+#define GCC_USB20_PRIM_BCR					13
+#define GCC_USB2_PHY_PRIM_BCR					14
+#define GCC_USB2_PHY_SEC_BCR					15
+#define GCC_USB30_PRIM_BCR					16
+#define GCC_USB3_DP_PHY_PRIM_BCR				17
+#define GCC_USB3_PHY_PRIM_BCR					18
+#define GCC_USB3_PHY_TERT_BCR					19
+#define GCC_USB3_UNIPHY_MP0_BCR					20
+#define GCC_USB3_UNIPHY_MP1_BCR					21
+#define GCC_USB3PHY_PHY_PRIM_BCR				22
+#define GCC_USB3UNIPHY_PHY_MP0_BCR				23
+#define GCC_USB3UNIPHY_PHY_MP1_BCR				24
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				25
+#define GCC_VIDEO_BCR						26
+#define GCC_VIDEO_AXI0_CLK_ARES					27
+#define GCC_VIDEO_AXI1_CLK_ARES					28
+
+#endif

-- 
2.25.1


