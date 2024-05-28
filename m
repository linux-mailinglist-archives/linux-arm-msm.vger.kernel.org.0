Return-Path: <linux-arm-msm+bounces-20729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2748D19FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1237728E251
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AE616D308;
	Tue, 28 May 2024 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T8Jpm8i3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FFB16B743;
	Tue, 28 May 2024 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896674; cv=none; b=KN2XI5aupLTKN7msQCnhQ4Uc8D9cJfOUfCQ3O/F7up4Dvm7dWLuidnePRqXI9UGSJ8PlsdplFhREptk8plmfKDgWWgng35A34crciLCDPtChLLjbXUUfFrmjjO7uYyUgUSgcnG03ELxSPYjkOCfVKmcrlyA1F5OMTha854kJJ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896674; c=relaxed/simple;
	bh=6zhAuaZSC5ROk5fF21P8Ccox1IXGuC/3v23yPP+4sRQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOF3rOMOkXd6Yp+4OQS2GVAz8WX5T9+VoL6QHD/sBX/n0svuVEegJPKWLMXVK+X3Oijv/tq0/c4/ITZHpU+5PJmSzk8C8PWQYSJVrYr6EnMyOytSp2A/fN+FlzCB1JMYg2IeY58nWrLfiGYWvpE5RBbtkCCldZIyEMhAuTOTi4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T8Jpm8i3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SAkvvw019559;
	Tue, 28 May 2024 11:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cOpdGxt2xLO65o6aMrivBvFXKEfR5ve86M+6jbM64RM=; b=T8Jpm8i3qm87yR9Y
	kKTxAStrwEUHlu1esNeXbrIdGieSJ3/6seaXI0wki6jWo++jl9qI4+tnu7z/5xqD
	E4M8pB6Re1xClmLA7mD52a8a1cJ7dZ4K1uPAJuzVf+XK00MDkUmnfeYNzraotgrB
	gcbFJvygq7wH1CSJWMM97NhwNRjFR70lrfD+Ko1NoXgpzbinguDiFfz6tsWNmJlJ
	WJE95ObyD3Fj4rRW52g6NzIRAbsPVemTK08yadOsceGHEdvuXwWtT/Fk9++2dO7x
	qnK1Xwx1cHuivvzo5VNZHwJ4M4J5xMXAA4hZJrP8CTZSvPUiNXZ6xQo3WyN0SEqH
	6IZ6RQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2mwur3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:44:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBiSpZ018251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:44:28 GMT
Received: from hu-ajipan-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:44:22 -0700
From: Ajit Pandey <quic_ajipan@quicinc.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
Subject: [PATCH V3 4/8] dt-bindings: clock: qcom: add CAMCC clocks on SM4450
Date: Tue, 28 May 2024 17:12:50 +0530
Message-ID: <20240528114254.3147988-5-quic_ajipan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240528114254.3147988-1-quic_ajipan@quicinc.com>
References: <20240528114254.3147988-1-quic_ajipan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dKhb_laWOyodK5PCl7H3XpNIK2y6sOej
X-Proofpoint-ORIG-GUID: dKhb_laWOyodK5PCl7H3XpNIK2y6sOej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280087

Add device tree bindings for the camera clock controller on
Qualcomm SM4450 platform.

Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/qcom,sm4450-camcc.yaml     |  63 +++++++++++
 include/dt-bindings/clock/qcom,sm4450-camcc.h | 106 ++++++++++++++++++
 2 files changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-camcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml
new file mode 100644
index 000000000000..f54ce865880d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm4450-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on SM4450
+
+maintainers:
+  - Ajit Pandey <quic_ajipan@quicinc.com>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm camera clock control module provides the clocks, resets and power
+  domains on SM4450
+
+  See also:: include/dt-bindings/clock/qcom,sm4450-camcc.h
+
+properties:
+  compatible:
+    const: qcom,sm4450-camcc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Camera AHB clock source from GCC
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
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,sm4450-gcc.h>
+    clock-controller@ade0000 {
+      compatible = "qcom,sm4450-camcc";
+      reg = <0x0ade0000 0x20000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&gcc GCC_CAMERA_AHB_CLK>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm4450-camcc.h b/include/dt-bindings/clock/qcom,sm4450-camcc.h
new file mode 100644
index 000000000000..bf077951bf1c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm4450-camcc.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SM4450_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SM4450_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_AREG_CLK					1
+#define CAM_CC_BPS_CLK						2
+#define CAM_CC_BPS_CLK_SRC					3
+#define CAM_CC_CAMNOC_ATB_CLK					4
+#define CAM_CC_CAMNOC_AXI_CLK					5
+#define CAM_CC_CAMNOC_AXI_CLK_SRC				6
+#define CAM_CC_CAMNOC_AXI_HF_CLK				7
+#define CAM_CC_CAMNOC_AXI_SF_CLK				8
+#define CAM_CC_CCI_0_CLK					9
+#define CAM_CC_CCI_0_CLK_SRC					10
+#define CAM_CC_CCI_1_CLK					11
+#define CAM_CC_CCI_1_CLK_SRC					12
+#define CAM_CC_CORE_AHB_CLK					13
+#define CAM_CC_CPAS_AHB_CLK					14
+#define CAM_CC_CPHY_RX_CLK_SRC					15
+#define CAM_CC_CRE_AHB_CLK					16
+#define CAM_CC_CRE_CLK						17
+#define CAM_CC_CRE_CLK_SRC					18
+#define CAM_CC_CSI0PHYTIMER_CLK					19
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				20
+#define CAM_CC_CSI1PHYTIMER_CLK					21
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				22
+#define CAM_CC_CSI2PHYTIMER_CLK					23
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				24
+#define CAM_CC_CSIPHY0_CLK					25
+#define CAM_CC_CSIPHY1_CLK					26
+#define CAM_CC_CSIPHY2_CLK					27
+#define CAM_CC_FAST_AHB_CLK_SRC					28
+#define CAM_CC_ICP_ATB_CLK					29
+#define CAM_CC_ICP_CLK						30
+#define CAM_CC_ICP_CLK_SRC					31
+#define CAM_CC_ICP_CTI_CLK					32
+#define CAM_CC_ICP_TS_CLK					33
+#define CAM_CC_MCLK0_CLK					34
+#define CAM_CC_MCLK0_CLK_SRC					35
+#define CAM_CC_MCLK1_CLK					36
+#define CAM_CC_MCLK1_CLK_SRC					37
+#define CAM_CC_MCLK2_CLK					38
+#define CAM_CC_MCLK2_CLK_SRC					39
+#define CAM_CC_MCLK3_CLK					40
+#define CAM_CC_MCLK3_CLK_SRC					41
+#define CAM_CC_OPE_0_AHB_CLK					42
+#define CAM_CC_OPE_0_AREG_CLK					43
+#define CAM_CC_OPE_0_CLK					44
+#define CAM_CC_OPE_0_CLK_SRC					45
+#define CAM_CC_PLL0						46
+#define CAM_CC_PLL0_OUT_EVEN					47
+#define CAM_CC_PLL0_OUT_ODD					48
+#define CAM_CC_PLL1						49
+#define CAM_CC_PLL1_OUT_EVEN					50
+#define CAM_CC_PLL2						51
+#define CAM_CC_PLL2_OUT_EVEN					52
+#define CAM_CC_PLL3						53
+#define CAM_CC_PLL3_OUT_EVEN					54
+#define CAM_CC_PLL4						55
+#define CAM_CC_PLL4_OUT_EVEN					56
+#define CAM_CC_SLOW_AHB_CLK_SRC					57
+#define CAM_CC_SOC_AHB_CLK					58
+#define CAM_CC_SYS_TMR_CLK					59
+#define CAM_CC_TFE_0_AHB_CLK					60
+#define CAM_CC_TFE_0_CLK					61
+#define CAM_CC_TFE_0_CLK_SRC					62
+#define CAM_CC_TFE_0_CPHY_RX_CLK				63
+#define CAM_CC_TFE_0_CSID_CLK					64
+#define CAM_CC_TFE_0_CSID_CLK_SRC				65
+#define CAM_CC_TFE_1_AHB_CLK					66
+#define CAM_CC_TFE_1_CLK					67
+#define CAM_CC_TFE_1_CLK_SRC					68
+#define CAM_CC_TFE_1_CPHY_RX_CLK				69
+#define CAM_CC_TFE_1_CSID_CLK					70
+#define CAM_CC_TFE_1_CSID_CLK_SRC				71
+
+/* CAM_CC power domains */
+#define CAM_CC_CAMSS_TOP_GDSC					0
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_CAMNOC_BCR					1
+#define CAM_CC_CAMSS_TOP_BCR					2
+#define CAM_CC_CCI_0_BCR					3
+#define CAM_CC_CCI_1_BCR					4
+#define CAM_CC_CPAS_BCR						5
+#define CAM_CC_CRE_BCR						6
+#define CAM_CC_CSI0PHY_BCR					7
+#define CAM_CC_CSI1PHY_BCR					8
+#define CAM_CC_CSI2PHY_BCR					9
+#define CAM_CC_ICP_BCR						10
+#define CAM_CC_MCLK0_BCR					11
+#define CAM_CC_MCLK1_BCR					12
+#define CAM_CC_MCLK2_BCR					13
+#define CAM_CC_MCLK3_BCR					14
+#define CAM_CC_OPE_0_BCR					15
+#define CAM_CC_TFE_0_BCR					16
+#define CAM_CC_TFE_1_BCR					17
+
+#endif
-- 
2.25.1


