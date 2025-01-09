Return-Path: <linux-arm-msm+bounces-44527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C680DA07088
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AE851883F67
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D422153F8;
	Thu,  9 Jan 2025 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gjXcxQFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F0F2153D0;
	Thu,  9 Jan 2025 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413192; cv=none; b=s9cMTzEBKZFaCW8ZMS/1L8p5XUUmEf85OQaVWVaXfMOxIlBOSVsAhlVkG7sA7WKSwPAM5lw9st2WLGpKaq3Av5Ynsm2NZC+ISLY25blRb1nT10yPyyavkGQTdgnm6JMKMPcaxbvL6aybPcqYOW5/9gc8lvfeCyQi7QHmp5z5sw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413192; c=relaxed/simple;
	bh=DYRtSmkPEEVmpbnHS7tVxpDbPXw+zby8JHTuKPIF118=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jOfhAdjEivqcu2CDEJLl/XBogLnVIiTCcdrPdenNriRXaeD+z9cd5453MAK/3wuaCfkJzalgGuhJp4/k/9/jiJT7K34GC/Dxjv+gQgK1iAoGRMaVwSRoIzPyAgk9a/huhfeVywzgpVrZ62VShERivUXbYCzoe2xt94iJiCpuX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gjXcxQFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5098wbf2007216;
	Thu, 9 Jan 2025 08:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gh4rm2w0GbZD9XDvm6poDVJxMRpxEqy/C/APX1nvKog=; b=gjXcxQFihEDvy0qN
	/Iw/Xwipr2I33sHVHraXQfrQ43yCfrvDbFFR6PBIxVva13YV/1zYd+m7zyIqk1Gi
	5NLSdZ0tfzXT/tJxd+92K/b4VlPpeZu934AqVvoLDHFRfLqE34sFXD4XERBSfDt4
	ll1Dgv9keisC8cEYh4QqQHHwclq6DbFVHW+/i36J1qKWTqLLqAXPcYHHcgqesa/2
	XGVan+kuk2RDgnwaPhFeu6Ao0UJSEXQpr9mMD0+CgfEm3Lffg7AlytxBVCmT4KN/
	5N/NUF0Itznvq0dXJBvynfmfVPE8L2qQEtOpECxD7eWIAMUgaj92JD/cf8s3Jtos
	/n6Imw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442bdxg02t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 08:59:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5098xkjI019582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 08:59:46 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 00:59:41 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 9 Jan 2025 14:27:46 +0530
Subject: [PATCH v4 3/6] dt-bindings: clock: qcom: Add CAMCC clocks for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-qcs8300-mm-patches-new-v4-3-63e8ac268b02@quicinc.com>
References: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
In-Reply-To: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fuTGC5byASN8x58Kv_vwmXhfzFzyCfwn
X-Proofpoint-ORIG-GUID: fuTGC5byASN8x58Kv_vwmXhfzFzyCfwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090073

The QCS8300 camera clock controller is a derivative of SA8775P, but has
an additional clock and minor differences. Hence, reuse the SA8775P
camera bindings and add additional clock required for QCS8300.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sa8775p-camcc.yaml    |  6 +++++-
 include/dt-bindings/clock/qcom,qcs8300-camcc.h           | 16 ++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
index 36a60d8f5ae3..81623f59d11d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
@@ -8,16 +8,20 @@ title: Qualcomm Camera Clock & Reset Controller on SA8775P
 
 maintainers:
   - Taniya Das <quic_tdas@quicinc.com>
+  - Imran Shaik <quic_imrashai@quicinc.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
   domains on SA8775p.
 
-  See also: include/dt-bindings/clock/qcom,sa8775p-camcc.h
+  See also:
+    include/dt-bindings/clock/qcom,qcs8300-camcc.h
+    include/dt-bindings/clock/qcom,sa8775p-camcc.h
 
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-camcc
       - qcom,sa8775p-camcc
 
   clocks:
diff --git a/include/dt-bindings/clock/qcom,qcs8300-camcc.h b/include/dt-bindings/clock/qcom,qcs8300-camcc.h
new file mode 100644
index 000000000000..fc535c847859
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs8300-camcc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_QCS8300_CAM_CC_H
+#define _DT_BINDINGS_CLK_QCOM_QCS8300_CAM_CC_H
+
+#include "qcom,sa8775p-camcc.h"
+
+/* QCS8300 introduces below new clocks compared to SA8775P */
+
+/* CAM_CC clocks */
+#define CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK				86
+
+#endif

-- 
2.25.1


