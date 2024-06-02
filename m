Return-Path: <linux-arm-msm+bounces-21404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D482B8D7504
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 13:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 889452821FA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 11:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4147439FD7;
	Sun,  2 Jun 2024 11:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A3ahFpoS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7251862A;
	Sun,  2 Jun 2024 11:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717328728; cv=none; b=MIxjsqyXrdeDC0FEvS4fE6ir5270gydR5eKdqoRxB3slMe6fk69WpeTWQG6TxLqdgHKHkA6KX6jewJ/NOMwQDDhusa9314oyWb6zjF8BCfohfkJeBhMl3PwGbE7LzZ4xIBATvxNw+/HD3fcg294yNCTaz+HgaZQ5mrVdix1+rEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717328728; c=relaxed/simple;
	bh=2oKuUzpq9svnFaqrMsaJRiN3RYhK+lD3Ld/4pJiU3Rs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxaDjTODRcG8tjKPdtkRP6mqD/3l9qje7I66uFGTpaOC4G4+pAQKalvs1wT0IYQpBQwYU5LMygB6NsYeRNdAzdBaRDTcm5HYFbRqPTV260+8VqKLNaF7o0a06RTfD30QeHTcQ8q/r53gsGYzMlJg9USgxW4i6PuNcn9W9pqHTHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A3ahFpoS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452Bi3vs010059;
	Sun, 2 Jun 2024 11:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AI5dwdTcT+UIMStiAGspnQyamt3LjclaJcqW7Dt8Co=; b=A3ahFpoS9BtKb7Kk
	j8dOSVbDvzD9kbwySYunsXvtFvVNYrBGMm+5JlFcg5dR1l87fH6WuUYJ7itT4068
	icoS1SS2cGCFpXwZhMYFS1ySlhelq0w5pu3ISnBqZ9Xc28QI+ohxtxOYITCRVeB6
	eh8arRPbOWc/3fAPpMua77lBp+vDM32nVCD23nOqX2JVeBWGNwPLJN0AL+C3U6g8
	d6PZIx5/qHADiNRbmAFKJ08FWabh4KOCobPBisif2ZdZZTS6rz4wDrI/2lQkpWK6
	GrOn7p1AQfrFInSu+2R40GFy02cB7r+exivuar28R1JVr/bwwMEIT9sY3s5wY5/l
	bXzlrQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7dj0m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Jun 2024 11:45:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 452BjKvD021702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 2 Jun 2024 11:45:20 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Jun 2024 04:45:14 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 2/8] dt-bindings: clock: qcom: Add SM8650 video clock controller
Date: Sun, 2 Jun 2024 17:14:33 +0530
Message-ID: <20240602114439.1611-3-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240602114439.1611-1-quic_jkona@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Oqt4KhLZfx8Uo2ZQk0cKg_0QlAGFtCeg
X-Proofpoint-GUID: Oqt4KhLZfx8Uo2ZQk0cKg_0QlAGFtCeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-01_19,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406020099

SM8650 video clock controller has most clocks same as SM8450,
but it also has few additional clocks and resets. Add device tree
bindings for the video clock controller on Qualcomm SM8650 platform
by defining these additional clocks and resets on top of SM8450.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml   |  6 ++++-
 .../dt-bindings/clock/qcom,sm8650-videocc.h   | 23 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-videocc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b135aa2e9f06..8ce5972a65d5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -8,18 +8,22 @@ title: Qualcomm Video Clock & Reset Controller on SM8450
 
 maintainers:
   - Taniya Das <quic_tdas@quicinc.com>
+  - Jagadeesh Kona <quic_jkona@quicinc.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on SM8450.
 
-  See also: include/dt-bindings/clock/qcom,sm8450-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,sm8450-videocc.h
+    include/dt-bindings/clock/qcom,sm8650-videocc.h
 
 properties:
   compatible:
     enum:
       - qcom,sm8450-videocc
       - qcom,sm8550-videocc
+      - qcom,sm8650-videocc
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,sm8650-videocc.h b/include/dt-bindings/clock/qcom,sm8650-videocc.h
new file mode 100644
index 000000000000..4e3c2d87280f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8650-videocc.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8650_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8650_H
+
+#include "qcom,sm8450-videocc.h"
+
+/* SM8650 introduces below new clocks and resets compared to SM8450 */
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_MVS0_SHIFT_CLK					12
+#define VIDEO_CC_MVS0C_SHIFT_CLK				13
+#define VIDEO_CC_MVS1_SHIFT_CLK					14
+#define VIDEO_CC_MVS1C_SHIFT_CLK				15
+#define VIDEO_CC_XO_CLK_SRC					16
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_XO_CLK_ARES					7
+
+#endif
-- 
2.43.0


