Return-Path: <linux-arm-msm+bounces-37508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E119C4B07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 01:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BE62B2C85C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43D71F6693;
	Tue, 12 Nov 2024 00:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oysaWjSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15C51F26DD;
	Tue, 12 Nov 2024 00:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371306; cv=none; b=JbJSwkfPyjzy+53I+63IAmdIMGl7HFTFFd9+62Xf1F977o2/ZnMhgxYzXdtfopNSRHkiyCIRddqyCHVCrlvVYRYehsd1/c7NfbpR8B/kff1X3TIS6tv7Q3hYR6R4IHUpkspSFB0t+1yLkNdVHmhc8SKSQ9ki2QFiLpq5l51k7mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371306; c=relaxed/simple;
	bh=CEr55xLzUPM8cnhjbrQwQBbBPIkvEQzyb7aHueF/ViI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DWIJOtBxVzIvHPpqKCh8Imxol0W7cb25ruNJORzEZjjOuRO5ILHcehsGZSkuH22DLSQCfsXOM7sK+bl6umSN4jLZDLZckIk9a2B7S2pVtbNYXK+CJXt7JllEbm+JNds8Ura/bT+XKhNXsewdq4QJ9M56FoEHls83Pf2pWnF5pd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oysaWjSK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABBsVV2022111;
	Tue, 12 Nov 2024 00:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQ0iabLTHvK4ee75atiV6+Z/1QEfU2y4ZX3ltuNcr6o=; b=oysaWjSKGJghttPh
	kkj6vjcxs7lCbdV5WDiYZuWAPL8/13r0t79iX//F/NqFPRXLFJVYDy1mAuZg6h5G
	HoGGou8z54sv3cQ01d54EP6Sb/1W0hE+hSpiFshf4bjgv1ouRt1BMUAIttm0AZVG
	+GBqNIMcr5UhZvneDtjgb0cc/G05Ao+JHsYCI/U25kBJP5T+q7Z31F1Kw9alLK6L
	BIQwmq7RvPI3EL7wmT1d2xffWTp8q0XF/wR/nZTh58PaEzS0yYdU1VIwk5wB9ZJR
	QpJ5OeHxfA9yU+7B3LFQv+d4J7iVFamzFKibfp1mZ92Puz83a2PmT3B6f5kNDsIm
	xkmttQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sw3m5udu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0SJc2032455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:19 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:28:18 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
Subject: [PATCH v2 4/7] dt-bindings: clock: qcom: Add SM8750 GCC
Date: Mon, 11 Nov 2024 16:28:04 -0800
Message-ID: <20241112002807.2804021-5-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241112002807.2804021-1-quic_molvera@quicinc.com>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: khzUXSCsW4YzCcC1gc-P_tR_0W1y-xT7
X-Proofpoint-ORIG-GUID: khzUXSCsW4YzCcC1gc-P_tR_0W1y-xT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120002

From: Taniya Das <quic_tdas@quicinc.com>

Add bindings documentation for the SM8750 General Clock Controller.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 .../bindings/clock/qcom,sm8650-gcc.yaml       |   8 +-
 include/dt-bindings/clock/qcom,sm8750-gcc.h   | 226 ++++++++++++++++++
 2 files changed, 232 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-gcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index 976f29cce809..e50b5f1cad75 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -13,11 +13,15 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on SM8650
 
-  See also:: include/dt-bindings/clock/qcom,sm8650-gcc.h
+  See also: include/dt-bindings/clock/qcom,sm8650-gcc.h
+            include/dt-bindings/reset/qcom,sm8750-gcc.h
 
 properties:
   compatible:
-    const: qcom,sm8650-gcc
+    items:
+      - enum:
+          - qcom,sm8650-gcc
+          - qcom,sm8750-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,sm8750-gcc.h b/include/dt-bindings/clock/qcom,sm8750-gcc.h
new file mode 100644
index 000000000000..e234595d7f42
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-gcc.h
@@ -0,0 +1,226 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM8750_H
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK				0
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				1
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			2
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				3
+#define GCC_BOOT_ROM_AHB_CLK					4
+#define GCC_CAM_BIST_MCLK_AHB_CLK				5
+#define GCC_CAMERA_AHB_CLK					6
+#define GCC_CAMERA_HF_AXI_CLK					7
+#define GCC_CAMERA_SF_AXI_CLK					8
+#define GCC_CAMERA_XO_CLK					9
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				10
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				11
+#define GCC_CNOC_PCIE_SF_AXI_CLK				12
+#define GCC_DDRSS_GPU_AXI_CLK					13
+#define GCC_DDRSS_PCIE_SF_QTB_CLK				14
+#define GCC_DISP_AHB_CLK					15
+#define GCC_DISP_HF_AXI_CLK					16
+#define GCC_EVA_AHB_CLK						17
+#define GCC_EVA_AXI0_CLK					18
+#define GCC_EVA_AXI0C_CLK					19
+#define GCC_EVA_XO_CLK						20
+#define GCC_GP1_CLK						21
+#define GCC_GP1_CLK_SRC						22
+#define GCC_GP2_CLK						23
+#define GCC_GP2_CLK_SRC						24
+#define GCC_GP3_CLK						25
+#define GCC_GP3_CLK_SRC						26
+#define GCC_GPLL0						27
+#define GCC_GPLL0_OUT_EVEN					28
+#define GCC_GPLL1						29
+#define GCC_GPLL4						30
+#define GCC_GPLL7						31
+#define GCC_GPLL9						32
+#define GCC_GPU_CFG_AHB_CLK					33
+#define GCC_GPU_GEMNOC_GFX_CLK					34
+#define GCC_GPU_GPLL0_CLK_SRC					35
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				36
+#define GCC_PCIE_0_AUX_CLK					37
+#define GCC_PCIE_0_AUX_CLK_SRC					38
+#define GCC_PCIE_0_CFG_AHB_CLK					39
+#define GCC_PCIE_0_MSTR_AXI_CLK					40
+#define GCC_PCIE_0_PHY_RCHNG_CLK				41
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				42
+#define GCC_PCIE_0_PIPE_CLK					43
+#define GCC_PCIE_0_PIPE_CLK_SRC					44
+#define GCC_PCIE_0_SLV_AXI_CLK					45
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				46
+#define GCC_PCIE_RSCC_CFG_AHB_CLK				47
+#define GCC_PCIE_RSCC_XO_CLK					48
+#define GCC_PDM2_CLK						49
+#define GCC_PDM2_CLK_SRC					50
+#define GCC_PDM_AHB_CLK						51
+#define GCC_PDM_XO4_CLK						52
+#define GCC_QMIP_CAMERA_CMD_AHB_CLK				53
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				54
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				55
+#define GCC_QMIP_GPU_AHB_CLK					56
+#define GCC_QMIP_PCIE_AHB_CLK					57
+#define GCC_QMIP_VIDEO_CV_CPU_AHB_CLK				58
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				59
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				60
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				61
+#define GCC_QUPV3_I2C_CORE_CLK					62
+#define GCC_QUPV3_I2C_S0_CLK					63
+#define GCC_QUPV3_I2C_S0_CLK_SRC				64
+#define GCC_QUPV3_I2C_S1_CLK					65
+#define GCC_QUPV3_I2C_S1_CLK_SRC				66
+#define GCC_QUPV3_I2C_S2_CLK					67
+#define GCC_QUPV3_I2C_S2_CLK_SRC				68
+#define GCC_QUPV3_I2C_S3_CLK					69
+#define GCC_QUPV3_I2C_S3_CLK_SRC				70
+#define GCC_QUPV3_I2C_S4_CLK					71
+#define GCC_QUPV3_I2C_S4_CLK_SRC				72
+#define GCC_QUPV3_I2C_S5_CLK					73
+#define GCC_QUPV3_I2C_S5_CLK_SRC				74
+#define GCC_QUPV3_I2C_S6_CLK					75
+#define GCC_QUPV3_I2C_S6_CLK_SRC				76
+#define GCC_QUPV3_I2C_S7_CLK					77
+#define GCC_QUPV3_I2C_S7_CLK_SRC				78
+#define GCC_QUPV3_I2C_S8_CLK					79
+#define GCC_QUPV3_I2C_S8_CLK_SRC				80
+#define GCC_QUPV3_I2C_S9_CLK					81
+#define GCC_QUPV3_I2C_S9_CLK_SRC				82
+#define GCC_QUPV3_I2C_S_AHB_CLK					83
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				84
+#define GCC_QUPV3_WRAP1_CORE_CLK				85
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK				86
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK_SRC			87
+#define GCC_QUPV3_WRAP1_S0_CLK					88
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				89
+#define GCC_QUPV3_WRAP1_S1_CLK					90
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				91
+#define GCC_QUPV3_WRAP1_S2_CLK					92
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				93
+#define GCC_QUPV3_WRAP1_S3_CLK					94
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				95
+#define GCC_QUPV3_WRAP1_S4_CLK					96
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				97
+#define GCC_QUPV3_WRAP1_S5_CLK					98
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				99
+#define GCC_QUPV3_WRAP1_S6_CLK					100
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				101
+#define GCC_QUPV3_WRAP1_S7_CLK					102
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				103
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				104
+#define GCC_QUPV3_WRAP2_CORE_CLK				105
+#define GCC_QUPV3_WRAP2_IBI_CTRL_0_CLK_SRC			106
+#define GCC_QUPV3_WRAP2_IBI_CTRL_2_CLK				107
+#define GCC_QUPV3_WRAP2_IBI_CTRL_3_CLK				108
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
+#define GCC_QUPV3_WRAP2_S6_CLK					121
+#define GCC_QUPV3_WRAP2_S6_CLK_SRC				122
+#define GCC_QUPV3_WRAP2_S7_CLK					123
+#define GCC_QUPV3_WRAP2_S7_CLK_SRC				124
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				125
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				126
+#define GCC_QUPV3_WRAP_2_IBI_2_AHB_CLK				127
+#define GCC_QUPV3_WRAP_2_IBI_3_AHB_CLK				128
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				129
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				130
+#define GCC_SDCC2_AHB_CLK					131
+#define GCC_SDCC2_APPS_CLK					132
+#define GCC_SDCC2_APPS_CLK_SRC					133
+#define GCC_SDCC4_AHB_CLK					134
+#define GCC_SDCC4_APPS_CLK					135
+#define GCC_SDCC4_APPS_CLK_SRC					136
+#define GCC_UFS_PHY_AHB_CLK					137
+#define GCC_UFS_PHY_AXI_CLK					138
+#define GCC_UFS_PHY_AXI_CLK_SRC					139
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				140
+#define GCC_UFS_PHY_ICE_CORE_CLK				141
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				142
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				143
+#define GCC_UFS_PHY_PHY_AUX_CLK					144
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				145
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				146
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				147
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				148
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				149
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				150
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				151
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				152
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				153
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				154
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			155
+#define GCC_USB30_PRIM_MASTER_CLK				156
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				157
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				158
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			159
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		160
+#define GCC_USB30_PRIM_SLEEP_CLK				161
+#define GCC_USB3_PRIM_PHY_AUX_CLK				162
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				163
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				164
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				165
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				166
+#define GCC_VIDEO_AHB_CLK					167
+#define GCC_VIDEO_AXI0_CLK					168
+#define GCC_VIDEO_AXI1_CLK					169
+#define GCC_VIDEO_XO_CLK					170
+
+/* GCC power domains */
+#define GCC_PCIE_0_GDSC						0
+#define GCC_PCIE_0_PHY_GDSC					1
+#define GCC_UFS_MEM_PHY_GDSC					2
+#define GCC_UFS_PHY_GDSC					3
+#define GCC_USB30_PRIM_GDSC					4
+#define GCC_USB3_PHY_GDSC					5
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_EVA_BCR						2
+#define GCC_GPU_BCR						3
+#define GCC_PCIE_0_BCR						4
+#define GCC_PCIE_0_LINK_DOWN_BCR				5
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				6
+#define GCC_PCIE_0_PHY_BCR					7
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			8
+#define GCC_PCIE_PHY_BCR					9
+#define GCC_PCIE_PHY_CFG_AHB_BCR				10
+#define GCC_PCIE_PHY_COM_BCR					11
+#define GCC_PCIE_RSCC_BCR					12
+#define GCC_PDM_BCR						13
+#define GCC_QUPV3_WRAPPER_1_BCR					14
+#define GCC_QUPV3_WRAPPER_2_BCR					15
+#define GCC_QUPV3_WRAPPER_I2C_BCR				16
+#define GCC_QUSB2PHY_PRIM_BCR					17
+#define GCC_QUSB2PHY_SEC_BCR					18
+#define GCC_SDCC2_BCR						19
+#define GCC_SDCC4_BCR						20
+#define GCC_UFS_PHY_BCR						21
+#define GCC_USB30_PRIM_BCR					22
+#define GCC_USB3_DP_PHY_PRIM_BCR				23
+#define GCC_USB3_DP_PHY_SEC_BCR					24
+#define GCC_USB3_PHY_PRIM_BCR					25
+#define GCC_USB3_PHY_SEC_BCR					26
+#define GCC_USB3PHY_PHY_PRIM_BCR				27
+#define GCC_USB3PHY_PHY_SEC_BCR					28
+#define GCC_VIDEO_AXI0_CLK_ARES					29
+#define GCC_VIDEO_AXI1_CLK_ARES					30
+#define GCC_VIDEO_BCR						31
+#define GCC_EVA_AXI0_CLK_ARES					32
+#define GCC_EVA_AXI0C_CLK_ARES					33
+
+#endif
-- 
2.46.1


