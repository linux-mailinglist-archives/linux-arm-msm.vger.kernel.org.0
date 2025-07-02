Return-Path: <linux-arm-msm+bounces-63340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D44AF0ECF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F240A3A3ACF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC43E23E320;
	Wed,  2 Jul 2025 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jdAMunbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255323C51B;
	Wed,  2 Jul 2025 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447135; cv=none; b=t8qUrH6h67oSWZCxK6o5rkOcAY2Lxlj1q51VYyc1qAQKly5livAVIlBx3btrqlls2oJKpuch4Pm2gd2eshC+/BM3Zj4q/ye+GPLn119Ng3yGrxo9VTmuqmardrP3xip88hF76TTo9RjPaGYvZd6yd1V0jEp63qji0MsX3saBnIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447135; c=relaxed/simple;
	bh=Y5fJ+YW8I/Bn/gmKAQXeGKsv1mjl4t+2W0JHf/3O0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WVvNgyJQvAHXD8yKHj6ZfRXMDY6ZOcd6Je1UBQktEhKldwusPtCLainv2Ew6QAqTWVqgjcufgBvSu75/FUCJcLQqGSvPUwL83btZxm/Y0muE2Cpof7wQG/UJ4bCr1tqaZ5RNGWt1p3ri6PWUqlR9MW0cLk7gwp0xBsi+P9dSr44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jdAMunbi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5620CLEi024441;
	Wed, 2 Jul 2025 09:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UYSO7cSGWu5WLYrl1FsKF6nwbpSJeKKnDcWKX8N0Ug=; b=jdAMunbi3cB+AXvs
	fBDELJTsdvnp5tgK2l+MFqpkVQk8VDK98gu1cGmfEQnduskqdi2isG55Qj+wV0Ki
	jSt3RkkVk0oSRyfEQBNm+3HGObQKWavE1SQbOzDCrdsSiYS6VndOqh+rnnJymfTq
	+zibJMlPVOdCumNh9zkXgWoSyMZP98Vcw+xvPxjPzD10LBGMXzOYUq/9WUD4oTkM
	fK62PpPksabigWLl2VjaZfY+5rEPopeI7KB8tD2cVimCfzaXs4lZdXau/Zo45TpO
	raYMiQQekO42OIh+mGjYLqo56pdqP2PENwkKusVd0jPab8bMXFXgTo69nkA2ywnM
	h5n76A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvuwnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:05:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5629588S026362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:05:08 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 02:05:03 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 2 Jul 2025 14:34:22 +0530
Subject: [PATCH v11 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250702-qcs615-mm-v10-clock-controllers-v11-2-9c216e1615ab@quicinc.com>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CorIlRvsvRNNI5fDt3Kj6eqSYIvyYtm9
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6864f654 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=Ql2orbCSbd2v8qn6OVgA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CorIlRvsvRNNI5fDt3Kj6eqSYIvyYtm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MyBTYWx0ZWRfX6qSgBcwlOEwG
 PtivvBBMmFjGRRUzSLaqBbEhFYUieWGWTyxnl4VaEQBlOoBFf8G6Ma+RyA/GagR77gPDPlsEOpj
 4QPFucsZeFvtq77XiOuBghtMoseejCH3JMonha8HgIXa3zfSsRY0RfzZu1VDj1Dntg/GTIRfDVD
 7ubfcLht6rmHPbW4ujjsE+DbNzNPctzEuU2Lv18+h261x4q+TibR6WQ9SuhGz1yzthnHGd9rZzO
 eRdwYWPpfPzj3lLvfqgsBuiwzRdT3BSN6p8ozGhychN+jCJpgSt63OkrtvwYFOBZ2h/4h+XfWLg
 PBwLgTVhLLos/Hv6CBagqxjlfuCaE4+BZU0KCiV6brdIXLI7Z1tQU7ADMSZOKWGRwx1Frl7VWQC
 OhvIOGMXWjI29RAjL0tHEfbuc407VqGDmpt9lJNl01Ip8FeCgKirNWq+DSHhe2bagsV2gMVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020073

Add DT bindings for the Camera clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,sm6350-camcc.yaml          |  11 ++-
 include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
 2 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6350-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6350-camcc.yaml
index c03b30f64f359abd03e61a543522c81ce542e274..e31cd4300f7db7f5dd3d71fc4a10ad6cc6537fde 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm6350-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6350-camcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Camera Clock & Reset Controller on SM6350
 
 maintainers:
   - Konrad Dybcio <konradybcio@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and  power
-  domains on SM6350.
+  domains on SM6350 and QCS615 SoC.
 
-  See also:: include/dt-bindings/clock/qcom,sm6350-camcc.h
+  See also:
+    include/dt-bindings/clock/qcom,qcs615-camcc.h
+    include/dt-bindings/clock/qcom,sm6350-camcc.h
 
 properties:
   compatible:
-    const: qcom,sm6350-camcc
+    enum:
+      - qcom,qcs615-camcc
+      - qcom,sm6350-camcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,qcs615-camcc.h b/include/dt-bindings/clock/qcom,qcs615-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..aec57dddc06735a5c6c48a1e93a8c498bdb8726a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs615-camcc.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_QCS615_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_QCS615_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_AREG_CLK					1
+#define CAM_CC_BPS_AXI_CLK					2
+#define CAM_CC_BPS_CLK						3
+#define CAM_CC_BPS_CLK_SRC					4
+#define CAM_CC_CAMNOC_ATB_CLK					5
+#define CAM_CC_CAMNOC_AXI_CLK					6
+#define CAM_CC_CCI_CLK						7
+#define CAM_CC_CCI_CLK_SRC					8
+#define CAM_CC_CORE_AHB_CLK					9
+#define CAM_CC_CPAS_AHB_CLK					10
+#define CAM_CC_CPHY_RX_CLK_SRC					11
+#define CAM_CC_CSI0PHYTIMER_CLK					12
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				13
+#define CAM_CC_CSI1PHYTIMER_CLK					14
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				15
+#define CAM_CC_CSI2PHYTIMER_CLK					16
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				17
+#define CAM_CC_CSIPHY0_CLK					18
+#define CAM_CC_CSIPHY1_CLK					19
+#define CAM_CC_CSIPHY2_CLK					20
+#define CAM_CC_FAST_AHB_CLK_SRC					21
+#define CAM_CC_ICP_ATB_CLK					22
+#define CAM_CC_ICP_CLK						23
+#define CAM_CC_ICP_CLK_SRC					24
+#define CAM_CC_ICP_CTI_CLK					25
+#define CAM_CC_ICP_TS_CLK					26
+#define CAM_CC_IFE_0_AXI_CLK					27
+#define CAM_CC_IFE_0_CLK					28
+#define CAM_CC_IFE_0_CLK_SRC					29
+#define CAM_CC_IFE_0_CPHY_RX_CLK				30
+#define CAM_CC_IFE_0_CSID_CLK					31
+#define CAM_CC_IFE_0_CSID_CLK_SRC				32
+#define CAM_CC_IFE_0_DSP_CLK					33
+#define CAM_CC_IFE_1_AXI_CLK					34
+#define CAM_CC_IFE_1_CLK					35
+#define CAM_CC_IFE_1_CLK_SRC					36
+#define CAM_CC_IFE_1_CPHY_RX_CLK				37
+#define CAM_CC_IFE_1_CSID_CLK					38
+#define CAM_CC_IFE_1_CSID_CLK_SRC				39
+#define CAM_CC_IFE_1_DSP_CLK					40
+#define CAM_CC_IFE_LITE_CLK					41
+#define CAM_CC_IFE_LITE_CLK_SRC					42
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				43
+#define CAM_CC_IFE_LITE_CSID_CLK				44
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				45
+#define CAM_CC_IPE_0_AHB_CLK					46
+#define CAM_CC_IPE_0_AREG_CLK					47
+#define CAM_CC_IPE_0_AXI_CLK					48
+#define CAM_CC_IPE_0_CLK					49
+#define CAM_CC_IPE_0_CLK_SRC					50
+#define CAM_CC_JPEG_CLK						51
+#define CAM_CC_JPEG_CLK_SRC					52
+#define CAM_CC_LRME_CLK						53
+#define CAM_CC_LRME_CLK_SRC					54
+#define CAM_CC_MCLK0_CLK					55
+#define CAM_CC_MCLK0_CLK_SRC					56
+#define CAM_CC_MCLK1_CLK					57
+#define CAM_CC_MCLK1_CLK_SRC					58
+#define CAM_CC_MCLK2_CLK					59
+#define CAM_CC_MCLK2_CLK_SRC					60
+#define CAM_CC_MCLK3_CLK					61
+#define CAM_CC_MCLK3_CLK_SRC					62
+#define CAM_CC_PLL0						63
+#define CAM_CC_PLL1						64
+#define CAM_CC_PLL2						65
+#define CAM_CC_PLL2_OUT_AUX2					66
+#define CAM_CC_PLL3						67
+#define CAM_CC_SLOW_AHB_CLK_SRC					68
+#define CAM_CC_SOC_AHB_CLK					69
+#define CAM_CC_SYS_TMR_CLK					70
+
+/* CAM_CC power domains */
+#define BPS_GDSC						0
+#define IFE_0_GDSC						1
+#define IFE_1_GDSC						2
+#define IPE_0_GDSC						3
+#define TITAN_TOP_GDSC						4
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_CAMNOC_BCR					1
+#define CAM_CC_CCI_BCR						2
+#define CAM_CC_CPAS_BCR						3
+#define CAM_CC_CSI0PHY_BCR					4
+#define CAM_CC_CSI1PHY_BCR					5
+#define CAM_CC_CSI2PHY_BCR					6
+#define CAM_CC_ICP_BCR						7
+#define CAM_CC_IFE_0_BCR					8
+#define CAM_CC_IFE_1_BCR					9
+#define CAM_CC_IFE_LITE_BCR					10
+#define CAM_CC_IPE_0_BCR					11
+#define CAM_CC_JPEG_BCR						12
+#define CAM_CC_LRME_BCR						13
+#define CAM_CC_MCLK0_BCR					14
+#define CAM_CC_MCLK1_BCR					15
+#define CAM_CC_MCLK2_BCR					16
+#define CAM_CC_MCLK3_BCR					17
+#define CAM_CC_TITAN_TOP_BCR					18
+
+#endif

-- 
2.34.1


