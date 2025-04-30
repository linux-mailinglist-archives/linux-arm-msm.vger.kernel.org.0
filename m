Return-Path: <linux-arm-msm+bounces-56234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9ABAA4903
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14FC9188C6DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197CA25B670;
	Wed, 30 Apr 2025 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hMSsKivb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493A25B662;
	Wed, 30 Apr 2025 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009572; cv=none; b=ov+woldwQuY+FsuBn1YhP874r1oP8VZMtu6a1hyjrQSblBi6n+31x39m3fLg87CVelMYZI308hOYodkwxDYv4VtcRExHqs2sGZ1urW4niwL2wpWLjgdpQZYWa5RKf92Oi8PXmrKesDCGbcMr9fdx1X1Jq2OpbP63urx864WWA74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009572; c=relaxed/simple;
	bh=Dd4B2wW9qHxqEaql0wCX5ot188dyL6a5+KJ5LweDfNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BmuHaJjH+kkjNxc8omvp4QeIwP950mo3LVHmvfJRdmOWDh2rPYwDVCC6WQuxOQnF5tu1mGOaxCjZZDXeZT4fSfufGMopoLObzuPaMZ9OQbgTACv4qX9SFuMaRU4jcet6tOFlJ4bGia3UJRu5RrOEUoRF3Cg9GEgvHbCv4tTH5Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hMSsKivb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U98r5R029556;
	Wed, 30 Apr 2025 10:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjsQitocE+OEU7BDeevixf2f6ZN9kdXcorFsDlKHiP8=; b=hMSsKivbFxhAmVTf
	EV6qt5OfSfa9S8o7vlrQDSxcyII87TOZYrF6n5IrS3a7eJGxdzJCD57xcOCXuu54
	OO1tFaIQ98Bo7de14XF8yr9P4xuSmDPY+9MHjXhqs+2Tj/1lxvWKEx8NzxT2w0uK
	L2X+Bo+oZq/5IOkfAeVkhrl5v7Bwqql7FUma84viRC7nDjc7Gk9PA04V1Dhm7guc
	ZdxxnBQ3k3cOB+TLUzGNp8k3iqAoQ0xWnHtoEO5zOuKuqPE86ySgaNWkUYoZVRWC
	UrdsBZUYRQr/7aLtb4QE2SNyepOCfToQEglMRd/Uf2+S89QUR2jJ/bAAEept69au
	KH1nFw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u7st0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:39:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UAdQkj001078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:39:26 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 03:39:21 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 30 Apr 2025 16:08:56 +0530
Subject: [PATCH v2 2/4] dt-bindings: clock: Add Qualcomm SC8180X Camera
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250430-sc8180x-camcc-support-v2-2-6bbb514f467c@quicinc.com>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
In-Reply-To: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=6811fdde cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=RHnLDJrYhVebvSCuch4A:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JLYxvEDXLo4HiqIsc9A_732soC5PEVZo
X-Proofpoint-ORIG-GUID: JLYxvEDXLo4HiqIsc9A_732soC5PEVZo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfX/BW3z60DVeRi 6fTKJ1R1rhiaD0FlF6z5VEN4m4kAUXy48Xu/npZurGZqYeTgjEEKshyxYgIhAELl+KflYVgMXlr x//H6wtNyBfDbjzaEcMRdCvBhZU8eeQplJD1Gh9mx+rxNWYZ3w1wTC+QgrcewKiqcrr14LRzauH
 /MUt6ZbJq3UT6BWb1JzLxwjK7hLVQQMjWKPlBiDrcdCGzBUyjNpSQqx7CtR2nVYCcFtM2soB0Z+ UQQ8G9O/DS5HX9sBbtndwSeVq2v6rH3CKx8aVscvLDzg3j1lUnRPilEdv8WHGyPa2o3Rflms4qd iq6ZO8Q9GKqfe4AxmvWgdKpM1NqaEWEZqkHeUFzcahyHsPkddAJxkWBjPzj5QEuBEQGvJo4YHYB
 DjQGexLbr2sglrb8Axackuxk0HusbXqdjSP1yxd2bEbgMZPRTHv5Q54K0btFFLeVnBKy9QUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075

Add device tree bindings for the camera clock controller on
Qualcomm SC8180X platform.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../bindings/clock/qcom,sc8180x-camcc.yaml         |  67 ++++++++
 include/dt-bindings/clock/qcom,sc8180x-camcc.h     | 181 +++++++++++++++++++++
 2 files changed, 248 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..18b1a4f9d1d845ce7fcae50361096d3d10ef4d2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc8180x-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on SC8180X
+
+maintainers:
+  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
+
+description: |
+  Qualcomm camera clock control module provides the clocks, resets and
+  power domains on SC8180X.
+
+  See also: include/dt-bindings/clock/qcom,sc8180x-camcc.h
+
+properties:
+  compatible:
+    const: qcom,sc8180x-camcc
+
+  clocks:
+    items:
+      - description: Camera AHB clock from GCC
+      - description: Board XO source
+      - description: Sleep clock source
+
+  power-domains:
+    maxItems: 1
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+
+  required-opps:
+    maxItems: 1
+    description:
+      A phandle to an OPP node describing required MMCX performance point.
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    clock-controller@ad00000 {
+      compatible = "qcom,sc8180x-camcc";
+      reg = <0x0ad00000 0x20000>;
+      clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+               <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd SC8180X_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sc8180x-camcc.h b/include/dt-bindings/clock/qcom,sc8180x-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3e57b80f65e82518247bac5a7d73d1218df8bd4e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sc8180x-camcc.h
@@ -0,0 +1,181 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SC8180X_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SC8180X_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_AREG_CLK					1
+#define CAM_CC_BPS_AXI_CLK					2
+#define CAM_CC_BPS_CLK						3
+#define CAM_CC_BPS_CLK_SRC					4
+#define CAM_CC_CAMNOC_AXI_CLK					5
+#define CAM_CC_CAMNOC_AXI_CLK_SRC				6
+#define CAM_CC_CAMNOC_DCD_XO_CLK				7
+#define CAM_CC_CCI_0_CLK					8
+#define CAM_CC_CCI_0_CLK_SRC					9
+#define CAM_CC_CCI_1_CLK					10
+#define CAM_CC_CCI_1_CLK_SRC					11
+#define CAM_CC_CCI_2_CLK					12
+#define CAM_CC_CCI_2_CLK_SRC					13
+#define CAM_CC_CCI_3_CLK					14
+#define CAM_CC_CCI_3_CLK_SRC					15
+#define CAM_CC_CORE_AHB_CLK					16
+#define CAM_CC_CPAS_AHB_CLK					17
+#define CAM_CC_CPHY_RX_CLK_SRC					18
+#define CAM_CC_CSI0PHYTIMER_CLK					19
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				20
+#define CAM_CC_CSI1PHYTIMER_CLK					21
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				22
+#define CAM_CC_CSI2PHYTIMER_CLK					23
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				24
+#define CAM_CC_CSI3PHYTIMER_CLK					25
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				26
+#define CAM_CC_CSIPHY0_CLK					27
+#define CAM_CC_CSIPHY1_CLK					28
+#define CAM_CC_CSIPHY2_CLK					29
+#define CAM_CC_CSIPHY3_CLK					30
+#define CAM_CC_FAST_AHB_CLK_SRC					31
+#define CAM_CC_FD_CORE_CLK					32
+#define CAM_CC_FD_CORE_CLK_SRC					33
+#define CAM_CC_FD_CORE_UAR_CLK					34
+#define CAM_CC_ICP_AHB_CLK					35
+#define CAM_CC_ICP_CLK						36
+#define CAM_CC_ICP_CLK_SRC					37
+#define CAM_CC_IFE_0_AXI_CLK					38
+#define CAM_CC_IFE_0_CLK					39
+#define CAM_CC_IFE_0_CLK_SRC					40
+#define CAM_CC_IFE_0_CPHY_RX_CLK				41
+#define CAM_CC_IFE_0_CSID_CLK					42
+#define CAM_CC_IFE_0_CSID_CLK_SRC				43
+#define CAM_CC_IFE_0_DSP_CLK					44
+#define CAM_CC_IFE_1_AXI_CLK					45
+#define CAM_CC_IFE_1_CLK					46
+#define CAM_CC_IFE_1_CLK_SRC					47
+#define CAM_CC_IFE_1_CPHY_RX_CLK				48
+#define CAM_CC_IFE_1_CSID_CLK					49
+#define CAM_CC_IFE_1_CSID_CLK_SRC				50
+#define CAM_CC_IFE_1_DSP_CLK					51
+#define CAM_CC_IFE_2_AXI_CLK					52
+#define CAM_CC_IFE_2_CLK					53
+#define CAM_CC_IFE_2_CLK_SRC					54
+#define CAM_CC_IFE_2_CPHY_RX_CLK				55
+#define CAM_CC_IFE_2_CSID_CLK					56
+#define CAM_CC_IFE_2_CSID_CLK_SRC				57
+#define CAM_CC_IFE_2_DSP_CLK					58
+#define CAM_CC_IFE_3_AXI_CLK					59
+#define CAM_CC_IFE_3_CLK					60
+#define CAM_CC_IFE_3_CLK_SRC					61
+#define CAM_CC_IFE_3_CPHY_RX_CLK				62
+#define CAM_CC_IFE_3_CSID_CLK					63
+#define CAM_CC_IFE_3_CSID_CLK_SRC				64
+#define CAM_CC_IFE_3_DSP_CLK					65
+#define CAM_CC_IFE_LITE_0_CLK					66
+#define CAM_CC_IFE_LITE_0_CLK_SRC				67
+#define CAM_CC_IFE_LITE_0_CPHY_RX_CLK				68
+#define CAM_CC_IFE_LITE_0_CSID_CLK				69
+#define CAM_CC_IFE_LITE_0_CSID_CLK_SRC				70
+#define CAM_CC_IFE_LITE_1_CLK					71
+#define CAM_CC_IFE_LITE_1_CLK_SRC				72
+#define CAM_CC_IFE_LITE_1_CPHY_RX_CLK				73
+#define CAM_CC_IFE_LITE_1_CSID_CLK				74
+#define CAM_CC_IFE_LITE_1_CSID_CLK_SRC				75
+#define CAM_CC_IFE_LITE_2_CLK					76
+#define CAM_CC_IFE_LITE_2_CLK_SRC				77
+#define CAM_CC_IFE_LITE_2_CPHY_RX_CLK				78
+#define CAM_CC_IFE_LITE_2_CSID_CLK				79
+#define CAM_CC_IFE_LITE_2_CSID_CLK_SRC				80
+#define CAM_CC_IFE_LITE_3_CLK					81
+#define CAM_CC_IFE_LITE_3_CLK_SRC				82
+#define CAM_CC_IFE_LITE_3_CPHY_RX_CLK				83
+#define CAM_CC_IFE_LITE_3_CSID_CLK				84
+#define CAM_CC_IFE_LITE_3_CSID_CLK_SRC				85
+#define CAM_CC_IPE_0_AHB_CLK					86
+#define CAM_CC_IPE_0_AREG_CLK					87
+#define CAM_CC_IPE_0_AXI_CLK					88
+#define CAM_CC_IPE_0_CLK					89
+#define CAM_CC_IPE_0_CLK_SRC					90
+#define CAM_CC_IPE_1_AHB_CLK					91
+#define CAM_CC_IPE_1_AREG_CLK					92
+#define CAM_CC_IPE_1_AXI_CLK					93
+#define CAM_CC_IPE_1_CLK					94
+#define CAM_CC_JPEG_CLK						95
+#define CAM_CC_JPEG_CLK_SRC					96
+#define CAM_CC_LRME_CLK						97
+#define CAM_CC_LRME_CLK_SRC					98
+#define CAM_CC_MCLK0_CLK					99
+#define CAM_CC_MCLK0_CLK_SRC					100
+#define CAM_CC_MCLK1_CLK					101
+#define CAM_CC_MCLK1_CLK_SRC					102
+#define CAM_CC_MCLK2_CLK					103
+#define CAM_CC_MCLK2_CLK_SRC					104
+#define CAM_CC_MCLK3_CLK					105
+#define CAM_CC_MCLK3_CLK_SRC					106
+#define CAM_CC_MCLK4_CLK					107
+#define CAM_CC_MCLK4_CLK_SRC					108
+#define CAM_CC_MCLK5_CLK					109
+#define CAM_CC_MCLK5_CLK_SRC					110
+#define CAM_CC_MCLK6_CLK					111
+#define CAM_CC_MCLK6_CLK_SRC					112
+#define CAM_CC_MCLK7_CLK					113
+#define CAM_CC_MCLK7_CLK_SRC					114
+#define CAM_CC_PLL0						115
+#define CAM_CC_PLL0_OUT_EVEN					116
+#define CAM_CC_PLL0_OUT_ODD					117
+#define CAM_CC_PLL1						118
+#define CAM_CC_PLL2						119
+#define CAM_CC_PLL2_OUT_MAIN					120
+#define CAM_CC_PLL3						121
+#define CAM_CC_PLL4						122
+#define CAM_CC_PLL5						123
+#define CAM_CC_PLL6						124
+#define CAM_CC_SLOW_AHB_CLK_SRC					125
+#define CAM_CC_XO_CLK_SRC					126
+
+
+/* CAM_CC power domains */
+#define BPS_GDSC						0
+#define IFE_0_GDSC						1
+#define IFE_1_GDSC						2
+#define IFE_2_GDSC						3
+#define IFE_3_GDSC						4
+#define IPE_0_GDSC						5
+#define IPE_1_GDSC						6
+#define TITAN_TOP_GDSC						7
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_CAMNOC_BCR					1
+#define CAM_CC_CCI_BCR						2
+#define CAM_CC_CPAS_BCR						3
+#define CAM_CC_CSI0PHY_BCR					4
+#define CAM_CC_CSI1PHY_BCR					5
+#define CAM_CC_CSI2PHY_BCR					6
+#define CAM_CC_CSI3PHY_BCR					7
+#define CAM_CC_FD_BCR						8
+#define CAM_CC_ICP_BCR						9
+#define CAM_CC_IFE_0_BCR					10
+#define CAM_CC_IFE_1_BCR					11
+#define CAM_CC_IFE_2_BCR					12
+#define CAM_CC_IFE_3_BCR					13
+#define CAM_CC_IFE_LITE_0_BCR					14
+#define CAM_CC_IFE_LITE_1_BCR					15
+#define CAM_CC_IFE_LITE_2_BCR					16
+#define CAM_CC_IFE_LITE_3_BCR					17
+#define CAM_CC_IPE_0_BCR					18
+#define CAM_CC_IPE_1_BCR					19
+#define CAM_CC_JPEG_BCR						20
+#define CAM_CC_LRME_BCR						21
+#define CAM_CC_MCLK0_BCR					22
+#define CAM_CC_MCLK1_BCR					23
+#define CAM_CC_MCLK2_BCR					24
+#define CAM_CC_MCLK3_BCR					25
+#define CAM_CC_MCLK4_BCR					26
+#define CAM_CC_MCLK5_BCR					27
+#define CAM_CC_MCLK6_BCR					28
+#define CAM_CC_MCLK7_BCR					29
+
+#endif

-- 
2.25.1


