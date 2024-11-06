Return-Path: <linux-arm-msm+bounces-37125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A94D09BE324
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 10:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBD0B1C21B3B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 09:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F4F1DD872;
	Wed,  6 Nov 2024 09:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="frUV+/NI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B281DD552;
	Wed,  6 Nov 2024 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886757; cv=none; b=U2mb/UsiHHCYFpl2Gk85onQUxNZled7RNaFa4+762+jh71gqG8cE3RdHlWufRcMWcF2Qd/OOKWJm6E3ZVqdw7CTmgv4jvMkaANK1RwXM6Bcwci/ZuInpZ+bZ0AUy8hHHPaPnEFGfBJ18xEPsI+ZnaJBDzLdJsyyBqhHP72eM3KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886757; c=relaxed/simple;
	bh=F2hzbZ/yoMyJ0Lm/6lCnlOg6wKGfFPPc407263Hxj2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Wcug4AKH9RLlPTHrOaQE6xRjpNyVNjPv3mHXQ/IpdEE+w5PsFN91AzZ6iyY6dqeQGyKOmt4popkjXgh6ZER+JaSDZsB7+WnA5aCsOuy5eLXwQFu5lpzW8FLroUiwpGb2kIuXb9x1nA/fX0Kf16Doo9k5qnLNYYfXewMj5ZZSvws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=frUV+/NI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A68GiYm004743;
	Wed, 6 Nov 2024 09:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQQZexWbb5u5k57oXSvSrmv8g4Ow2fu5iQ3YTWc42Nc=; b=frUV+/NIJNoAP3Ob
	5Kh6nwpwsYZuopXJdGbfGWWW6EyUxJa+IdwE3ymrASSDMz8wCSt6HZdqiYvg/0mH
	f7KkZMSL7bA3D6tVSteMCyBnVZG0cG2RjQXRhbZz4Hs/Lla+v2F7tjBlL9I+yinQ
	Notja1NlR+iWY5zJkBmdHPsdNJfMX3hOQz93dCOSEF3ox0S7kBOr4L+vrm2y5JD9
	79X58GkgKYGzNJebO24ynHkAshrBxlhmDjqWHILPgbU89A5uza+9+CQrF0TxwgoY
	QggztqdwfPPM00nJNEpbSQge6FPZFTKRoWZVPX17JXs/+2BtLN6QJ7yeW8qiNL0/
	jVYLww==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx3rba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 09:52:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A69qW02001651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 09:52:32 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 01:52:28 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Wed, 6 Nov 2024 15:21:58 +0530
Subject: [PATCH v3 3/6] dt-bindings: clock: qcom: Add CAMCC clocks for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241106-qcs8300-mm-patches-v3-3-f611a8f87f15@quicinc.com>
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
In-Reply-To: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
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
        Imran Shaik <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GThQXOpjd1x2yeZ0WRyYNLR7a6x5Ag0x
X-Proofpoint-ORIG-GUID: GThQXOpjd1x2yeZ0WRyYNLR7a6x5Ag0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=960
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060080

The QCS8300 camera clock controller is mostly identical to SA8775P, but
QCS8300 has one additional clock and minor differences. Hence, reuse the
SA8775P camera bindings and add additional clock required for QCS8300.

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


