Return-Path: <linux-arm-msm+bounces-57071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2551AAD690
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43A19862BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8752135B8;
	Wed,  7 May 2025 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZVQtn99q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8C1DED7C;
	Wed,  7 May 2025 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600877; cv=none; b=U7XevG2G30te3Q3EOXucJbxUhM8gwQcV2qBqE0zdPX1sgJ+/zeoltY+5wYheygGAdPB2RcwpqkTqGX9AAS3kANxpFEyV1n4gHlO92q0qLASLW/4HXd+5yB5rQ/jLyRYAfi6fez8xhzsy6qBFoBpPNVO0Q4i0wbMsVyrY/RZi7cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600877; c=relaxed/simple;
	bh=7bKuOA+lRfOkeodVvD3JgPIzEky9dmK85zmk7GTZdM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrFfOUbpyvXdqnwmfTup4CegFtqBKehHx/1X4V5/lmzyi2E87CIvWNW33vbQXVDMSHroJfL0K4+1IN2E9cjnN9EB0HG/NlVzcBKWKpdFLaVPYK94wSnQAYddpJjGc1SlrmhIG2JPhoO3XBHp//yvW9Ljfp4MXd90D0uJIqipbHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZVQtn99q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5474Xr84014092;
	Wed, 7 May 2025 06:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bk/KMFIiMdA
	he5dhMs5+Pstsb3YM10/TgGloIi2WsB8=; b=ZVQtn99qOfa5MNF4csWqgG/WONC
	KHXaMTRqLOhKCGSLB2hHRilD2DTjQ3GUa1VeS9MRQ+UzM+0XOBuXanXB/VHcNONd
	FoscNWjKh4rZZ1GGFBenxRbDWwbEJibBEWEAcobffVctK68odGnuB4dT5pfDjGqj
	DBrwKGmdmHx/uP3xZVS9SctZWvDTCDY1caGJUTRsGJeTHtcTWQA+j4FoenNaB2FU
	skN6Ee00BBWZukLzXe0Cj8t1ZGEo8IF9sQSjMkLIBUSnDdcG07BthllVXqURjncm
	exaA24upiCSYMaGD6Nuq/ZgHAlCra43x78neQLJ3R5vsJhqsefT5/WlsTtA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46g0kh09vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:54:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5476sQHZ011862;
	Wed, 7 May 2025 06:54:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7ms9s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5476pOuo009456;
	Wed, 7 May 2025 06:51:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5476pPYO009541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:26 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 4E49F5B9; Wed,  7 May 2025 12:21:23 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 8/8] arm64: dts: qcom: qcs9100: Introduce QCS9100M SOM
Date: Wed,  7 May 2025 12:21:16 +0530
Message-ID: <20250507065116.353114-9-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507065116.353114-1-quic_wasimn@quicinc.com>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MyBTYWx0ZWRfXyIvNy+MzI4Sd
 HDHHtsLibeGXiPSIFOiXR/fs1JIwP13qq29r/uCWXSoXNnd9bT2jj1VGVIKc3tkjWzNRes0LFTT
 ZFpWQpwY+LQbu7a82eh1hv5/WMxwSjil/HCY2RBZ83t2esIHMl/p/CBPfSIYt+7plGu8bdksqiZ
 cBOt4dAsw+AT41iL4yOdEPueomBljjDDrD2Pqum1JIWAfDEtE/gh1sSLsShmohCAiEJs/v+obgd
 7VXgAmk8v3DbQpyeBgoVVzUZz3hbHvOEEs2j2KPWeZ5FnnGHs0HALqpy7Iy3Fq0WnomwAgLUtYB
 6fD+fixnHaH/RGVBDeNEY4voEAcpkEX0LyiMFjofRKF1mTJbq4pfHIQ/lp5ikRFPWjBQYORB/mr
 5FJI2q3s8gKpKjgsHOTOYlNJP0Sd30hxdQqSiIMVgkApeTPQyjpKdcIhTm0q70qNfSl2Npw3
X-Authority-Analysis: v=2.4 cv=PNUP+eqC c=1 sm=1 tr=0 ts=681b03a6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=u6l1T9LvMDkyw8qJF6gA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ovuvLgLx_0NV8-b2VMDXppGt020qpTMw
X-Proofpoint-GUID: ovuvLgLx_0NV8-b2VMDXppGt020qpTMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 mlxlogscore=943 malwarescore=0 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=9 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070063

qcs9100 SOC is IOT variant of sa8775p SOC and it supports safety
monitoring feature of Safety Island(SAIL) subsystem.
qcs9100-som.dtsi specifies qcs9100 based SOM having SOC, PMICs
& Memory-map updates (not added currently as part of code refactoring).
qcs9100-ride-r3 board is based on QCS9100M SOM.
qcs9100-ride-r3 also supports 2.5G ethernet phy i.e aqr115c.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts | 10 +++++++---
 arch/arm64/boot/dts/qcom/qcs9100-som.dtsi    |  9 +++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9100-som.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 759d1ec694b2..aadf9e4a8a05 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -1,11 +1,15 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
- * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 /dts-v1/;

-#include "sa8775p-ride-r3.dts"
+#include "qcs9100-som.dtsi"
+
+#include "sa8775p-ride-common.dtsi"
+#include "sa8775p-ride-ethernet-aqr115c.dtsi"
+
 / {
 	model = "Qualcomm QCS9100 Ride Rev3";
-	compatible = "qcom,qcs9100-ride-r3", "qcom,qcs9100", "qcom,sa8775p";
+	compatible = "qcom,qcs9100-ride-r3", "qcom,qcs9100-som", "qcom,qcs9100", "qcom,sa8775p";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-som.dtsi b/arch/arm64/boot/dts/qcom/qcs9100-som.dtsi
new file mode 100644
index 000000000000..92adebb2e18f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9100-som.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sa8775p.dtsi"
+#include "sa8775p-pmics.dtsi"
--
2.49.0


