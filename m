Return-Path: <linux-arm-msm+bounces-22316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9287A903DB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 15:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5331C23579
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 13:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F6C17E459;
	Tue, 11 Jun 2024 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y+W5V6hD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF3417E453;
	Tue, 11 Jun 2024 13:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718113186; cv=none; b=VtAJiJYj3aBnKKwJQFvcMZZsIELt+A0kau4udhXv1NjvVxtqGMaNBBewUbJ5CRG3J+zubaE22okQ19yEwgtBiwQ7Bd+JGCIHRWy8WN+Q52l1BFFcp+IbvxngCfi8UOPbki4Xf4vFRUGLr5wfYM7/hOTeYpAOO1lRzT8AmKruu9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718113186; c=relaxed/simple;
	bh=UUX2kRBxg/IP6qeOnyd2a/qpqGLsQaNhpWvcCTP3zFg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKK4JaF5xJeVOie946KUTILnafB1NtBwJpxxzYKOtdevOyTvq9Zhmq4PNwBhEGyJiXD1wSqYV4vdf0tvsbrYMKqIjEFNEbql2I4O+qaH3tVf18xyyi4txtGeaFr8VM+YnInueQlVOL3GgRkbX+yWoPxgqtni0fF6NTNEpkXwXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y+W5V6hD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BC2wc3032603;
	Tue, 11 Jun 2024 13:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uw3u4OQfeLiKU3pmEDkUXX8ynTd/GeHRxMEzqZYtUqw=; b=Y+W5V6hDBd8oYdvX
	bfwTSHBhIrXijzkoAT2yFsSeN9xUhKXYeMoMElpkWYbEGPdKfoqwcyalo0UVeZAP
	O3btd/Gc0ZMSfEFKUNA/UaVMZ/G2zUyw89FpxxGfViJLkJ8Uqs8XML5Zqz+vFi/z
	g3CrTJiF49aVpklKBpbVHJg+zZOe7uamAsz8mMgcXHBG1As9VIaeN7ctSUOIQ5R8
	TgfTF7Nil9l3Y+hdi5OiMbDN8TbRMRERketBJmxZ4XiRhdYsOQyPBdZIyMHaZqeQ
	f/sOJ4ovcKMRTg4GgQ3MOYGWBNiHCaH1LhIwyxN9I83U4wFo30NXhkGyHt9TtpIa
	iyQDtA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypp87r9cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 13:39:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BDdeVN025075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 13:39:40 GMT
Received: from hu-ajipan-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 06:39:35 -0700
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
Subject: [PATCH V4 6/8] dt-bindings: clock: qcom: add GPUCC clocks on SM4450
Date: Tue, 11 Jun 2024 19:07:50 +0530
Message-ID: <20240611133752.2192401-7-quic_ajipan@quicinc.com>
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
X-Proofpoint-GUID: REMCKshSL1xbfCHeeL2rnAM1NqcDRSYK
X-Proofpoint-ORIG-GUID: REMCKshSL1xbfCHeeL2rnAM1NqcDRSYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406110099

Add device tree bindings for the graphics clock controller on
Qualcomm SM4450 platform.

Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml     |  2 +
 include/dt-bindings/clock/qcom,sm4450-gpucc.h | 62 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-gpucc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 36974309cf69..8ea4ccf6eb1c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -14,6 +14,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also::
+    include/dt-bindings/clock/qcom,sm4450-gpucc.h
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
     include/dt-bindings/clock/qcom,sm8550-gpucc.h
     include/dt-bindings/reset/qcom,sm8450-gpucc.h
@@ -23,6 +24,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sm4450-gpucc
       - qcom,sm8450-gpucc
       - qcom,sm8550-gpucc
       - qcom,sm8650-gpucc
diff --git a/include/dt-bindings/clock/qcom,sm4450-gpucc.h b/include/dt-bindings/clock/qcom,sm4450-gpucc.h
new file mode 100644
index 000000000000..304f83e5f645
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm4450-gpucc.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM4450_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM4450_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CRC_AHB_CLK					2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GFX3D_CLK					4
+#define GPU_CC_CX_GFX3D_SLV_CLK					5
+#define GPU_CC_CX_GMU_CLK					6
+#define GPU_CC_CX_SNOC_DVM_CLK					7
+#define GPU_CC_CXO_AON_CLK					8
+#define GPU_CC_CXO_CLK						9
+#define GPU_CC_DEMET_CLK					10
+#define GPU_CC_DEMET_DIV_CLK_SRC				11
+#define GPU_CC_FF_CLK_SRC					12
+#define GPU_CC_FREQ_MEASURE_CLK					13
+#define GPU_CC_GMU_CLK_SRC					14
+#define GPU_CC_GX_CXO_CLK					15
+#define GPU_CC_GX_FF_CLK					16
+#define GPU_CC_GX_GFX3D_CLK					17
+#define GPU_CC_GX_GFX3D_CLK_SRC					18
+#define GPU_CC_GX_GFX3D_RDVM_CLK				19
+#define GPU_CC_GX_GMU_CLK					20
+#define GPU_CC_GX_VSENSE_CLK					21
+#define GPU_CC_HUB_AHB_DIV_CLK_SRC				22
+#define GPU_CC_HUB_AON_CLK					23
+#define GPU_CC_HUB_CLK_SRC					24
+#define GPU_CC_HUB_CX_INT_CLK					25
+#define GPU_CC_HUB_CX_INT_DIV_CLK_SRC				26
+#define GPU_CC_MEMNOC_GFX_CLK					27
+#define GPU_CC_MND1X_0_GFX3D_CLK				28
+#define GPU_CC_PLL0						29
+#define GPU_CC_PLL1						30
+#define GPU_CC_SLEEP_CLK					31
+#define GPU_CC_XO_CLK_SRC					32
+#define GPU_CC_XO_DIV_CLK_SRC					33
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_XO_BCR						8
+#define GPU_CC_GX_ACD_IROOT_BCR					9
+#define GPU_CC_RBCPR_BCR					10
+
+#endif
-- 
2.25.1


