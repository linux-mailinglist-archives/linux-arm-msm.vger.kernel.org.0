Return-Path: <linux-arm-msm+bounces-22312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC5903DA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 15:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0F021C22E17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 13:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BCA17D340;
	Tue, 11 Jun 2024 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fwfJLBO7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670DF17CA13;
	Tue, 11 Jun 2024 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718113152; cv=none; b=P9oA5sS/5dvNRr2CuH+ca2p7SSwhVocz7mOsUQIqSNOI83dC0jV+gNGkvcOo9dGHdeYgGU7xIGatFTgwdyvHrwAt+4RZPJoeq/byCn9kAjMdPtvOAK3v8rLckgS1NsnarFq9tB70SC/d1wgWTKFSFLYK7tgBVbuIM3ers/76IHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718113152; c=relaxed/simple;
	bh=XoU2lFGtX1inJYtEwpPlKRKiu5JpMxsymzMVmp4wakU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sgdLBBye8g5qH+yVrqD+WzpkHsi/rj2wf20XnWbdnuHBUSdQV7ZFDg2GAZDmFvtIhGwGsL+K394epCXOiKuaT4+Kpi5k08Iw/I7nEogQ7RLzgCrZvwltLV40RLxFzApeEl4AgFqZ6/a6h9xM0WW98yGq5lJL8qOCOHkffhivjHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fwfJLBO7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B9gDcl018553;
	Tue, 11 Jun 2024 13:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkrTVHJ1MbdfRvlawKI4mzmoPypgVOh2jU/egsI6inc=; b=fwfJLBO7ZJkISf8B
	US/T+DK1PBFMZBdqUDpdrW48bpRX+qggsunIcxVGqtnMhe6YpvDasM21O3XImR8n
	NH2Rl1g5hL4op/kKxqaehpN7jOf3SGQ2Vi2FLr3991fO0qs5059RxJutI+IDAZ3u
	vqDty8l0LixirGo5MDTz78D4a8pA1t1rEFkRj7hs1IZ6NFhnlStn3SS9EFHj26J2
	OIcIPFR6XkJiiTFNhi+R+OKfyLt1p4xj5tWlHRraZef1HUIafz0/AThwLizjJDPU
	Md6juiVCFYNiUrgV97KP4z0rfGHppnnnZn6Ety4r98oC0RfIj2aSQerASSNiys59
	8HKw4w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm6b8m8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 13:39:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BDd3IO019282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 13:39:03 GMT
Received: from hu-ajipan-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 06:38:58 -0700
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
        Ajit Pandey <quic_ajipan@quicinc.com>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 2/8] dt-bindings: clock: qcom: add DISPCC clocks on SM4450
Date: Tue, 11 Jun 2024 19:07:46 +0530
Message-ID: <20240611133752.2192401-3-quic_ajipan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: JzHgcZvG3gOSIGNgDNCQf5ZUC-mvXsBo
X-Proofpoint-GUID: JzHgcZvG3gOSIGNgDNCQf5ZUC-mvXsBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110099

Add device tree bindings for the display clock controller on
Qualcomm SM4450 platform.

Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sm4450-dispcc.yaml    | 71 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm4450-dispcc.h    | 51 +++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-dispcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml
new file mode 100644
index 000000000000..2aa05353eff1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm4450-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller on SM4450
+
+maintainers:
+  - Ajit Pandey <quic_ajipan@quicinc.com>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on SM4450
+
+  See also:: include/dt-bindings/clock/qcom,sm4450-dispcc.h
+
+properties:
+  compatible:
+    const: qcom,sm4450-dispcc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Display AHB clock source from GCC
+      - description: sleep clock source
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
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
+    clock-controller@af00000 {
+      compatible = "qcom,sm4450-dispcc";
+      reg = <0x0af00000 0x20000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&gcc GCC_DISP_AHB_CLK>,
+               <&sleep_clk>,
+               <&dsi0_phy_pll_out_byteclk>,
+               <&dsi0_phy_pll_out_dsiclk>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm4450-dispcc.h b/include/dt-bindings/clock/qcom,sm4450-dispcc.h
new file mode 100644
index 000000000000..ca6f2ef90157
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm4450-dispcc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM4450_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM4450_H
+
+/* DISP_CC clocks */
+#define DISP_CC_MDSS_AHB1_CLK					0
+#define DISP_CC_MDSS_AHB_CLK					1
+#define DISP_CC_MDSS_AHB_CLK_SRC				2
+#define DISP_CC_MDSS_BYTE0_CLK					3
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				4
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				5
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				6
+#define DISP_CC_MDSS_ESC0_CLK					7
+#define DISP_CC_MDSS_ESC0_CLK_SRC				8
+#define DISP_CC_MDSS_MDP1_CLK					9
+#define DISP_CC_MDSS_MDP_CLK					10
+#define DISP_CC_MDSS_MDP_CLK_SRC				11
+#define DISP_CC_MDSS_MDP_LUT1_CLK				12
+#define DISP_CC_MDSS_MDP_LUT_CLK				13
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				14
+#define DISP_CC_MDSS_PCLK0_CLK					15
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				16
+#define DISP_CC_MDSS_ROT1_CLK					17
+#define DISP_CC_MDSS_ROT_CLK					18
+#define DISP_CC_MDSS_ROT_CLK_SRC				19
+#define DISP_CC_MDSS_RSCC_AHB_CLK				20
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				21
+#define DISP_CC_MDSS_VSYNC1_CLK					22
+#define DISP_CC_MDSS_VSYNC_CLK					23
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				24
+#define DISP_CC_PLL0						25
+#define DISP_CC_PLL1						26
+#define DISP_CC_SLEEP_CLK					27
+#define DISP_CC_SLEEP_CLK_SRC					28
+#define DISP_CC_XO_CLK						29
+#define DISP_CC_XO_CLK_SRC					30
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+#define DISP_CC_MDSS_CORE_INT2_GDSC				1
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+#endif
-- 
2.25.1


