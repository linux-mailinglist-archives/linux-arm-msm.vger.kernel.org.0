Return-Path: <linux-arm-msm+bounces-40831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B59E7793
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 18:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 782B216A76D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 17:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3C5204583;
	Fri,  6 Dec 2024 17:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lUcvQ1m/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8BA13D251;
	Fri,  6 Dec 2024 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506685; cv=none; b=A3nkVWeU6D4V0fXtMFZQ7/yZrxgNlJKxNIo6qA8j+cOttHqCm87sST9BfWO50dS+L0/2Ckbcalj0jt9CqQPvJCFL5q2G/OUTXR3Z5gLsCathO9ctY8jVPfc45ULYu1TcioTRTztr3JgS6Q7CXhAii5AR6qYjBQgLkwGZ//TdbpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506685; c=relaxed/simple;
	bh=bcYPmNc9w+Ze+XhMLMpE6kvlFueXES+bVKUY8pxMBpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uDl2gDkujPfXrM0DuMWGvCshGOTjsV2THaYqf6h9Hz9w8RqNs7YTIt9wQg4hBZy+E86bUvlqhjMZAggZcox3hoZa9jNul1yM3s7L2KnP+Rj/+Czi/N8Qw8Fw5tF7KvM/6qCJ+Unycll8prhnfrTBtU1WbPd9SXJZNqFe38/HKdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lUcvQ1m/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B69c0t6026486;
	Fri, 6 Dec 2024 17:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8p3XIucZ8zbsmjXILeceBBMXQuxCIzdgW7Fwux+ZUY=; b=lUcvQ1m/E8sAYztR
	znQ+KdADpJvLSfaFaO1iGEKr6qjKeXDPwY+1OMp6d25BZ1rhBq+HLInh11jFwGZ4
	b5Geb7dO/2657sNhXnsct/zpB/DDtXWWh1KXdNkJ1VnqIOkj943565X5e+drIaH2
	TEGr+jg/cW+1qmFly+OarIh63sZ7nwifpKG/nY8gTmnPfkW9dbdqcQHPOxDFZN0+
	i5RK22J1gV8x0ztLwcKHsHJ4HYarVuz3tuoJvmeks3juV8/VDIsyWRFB3iZI+Uhz
	rStXDymz4eja59At6iA4CcKLImqp9Iu0Bvc5q0qQvz1NfhPU3e576U0RvXxjedC8
	UvFNvw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bxtc997v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 17:38:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6HbxcO020825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 17:37:59 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 09:37:55 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 6 Dec 2024 23:07:12 +0530
Subject: [PATCH 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241206-sm8750_videocc-v1-2-5da6e7eea2bd@quicinc.com>
References: <20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com>
In-Reply-To: <20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EPgbfo8c4gaAFFu-SyzlVYKDYS0Phb1Q
X-Proofpoint-ORIG-GUID: EPgbfo8c4gaAFFu-SyzlVYKDYS0Phb1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=979 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060132

Add compatible string for SM8750 video clock controller and the bindings
for SM8750 Qualcomm SoC.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,sm8750-videocc.h    | 40 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 62714fa54db82491a7a108f7f18a253d737f8d61..3b1853072d6640afcff55ba5a0f17673d0c4c1aa 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
+    include/dt-bindings/clock/qcom,sm8750-videocc.h
 
 properties:
   compatible:
@@ -25,6 +26,7 @@ properties:
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
       - qcom,sm8650-videocc
+      - qcom,sm8750-videocc
 
   clocks:
     items:
@@ -56,6 +58,7 @@ allOf:
             enum:
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
+              - qcom,sm8750-videocc
     then:
       required:
         - required-opps
diff --git a/include/dt-bindings/clock/qcom,sm8750-videocc.h b/include/dt-bindings/clock/qcom,sm8750-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c5ecea6446aae3a580f11ac73eb1635f7ffdd607
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8750_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_FREERUN_CLK				5
+#define VIDEO_CC_MVS0_SHIFT_CLK					6
+#define VIDEO_CC_MVS0C_CLK					7
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				8
+#define VIDEO_CC_MVS0C_FREERUN_CLK				9
+#define VIDEO_CC_MVS0C_SHIFT_CLK				10
+#define VIDEO_CC_PLL0						11
+#define VIDEO_CC_SLEEP_CLK					12
+#define VIDEO_CC_SLEEP_CLK_SRC					13
+#define VIDEO_CC_XO_CLK						14
+#define VIDEO_CC_XO_CLK_SRC					15
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				4
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				5
+#define VIDEO_CC_XO_CLK_ARES					6
+
+#endif

-- 
2.45.2


