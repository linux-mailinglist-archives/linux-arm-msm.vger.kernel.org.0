Return-Path: <linux-arm-msm+bounces-57066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A3DAAD66B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26EC81BC56C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE922215068;
	Wed,  7 May 2025 06:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d6WZZVQA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D5F2116FB;
	Wed,  7 May 2025 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600695; cv=none; b=eXM1i0GfVYuuwyizDY00B5wep4XFMfQ0HxWx5k7oWf37HzI/i9vqX6KrNQd8Yjf9rbDxt1BXdtEXsOGyQNAZ8ArYguJ09Ff34toYYhps+MWCJ5CLTlr4mBJ02S2NwEZkKS+0mK150ayZdpEcM8XJjvBcIIT+2VYPP+ziF3gJjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600695; c=relaxed/simple;
	bh=ucYPIPRK/wb/jxL+fqsJw6q2MBPdTkDN6IKA+KqxXxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+OFDFEshHPNaqD+fXQYrybMW2aKKG+pPldviJafBe/yZczGuYPaIGl64TIB70Ps2dBb6Czfh9+4qakv3kFrkcNPcQcIW9dzjXio1pnL8yU2zYmnDngElRhJdVfeGisggH7JkJSznoYsUzfwr9t4TNalhzZCtQL0NO7oKML+e9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d6WZZVQA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GqqW003290;
	Wed, 7 May 2025 06:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qF9mKBp4h5p
	YJER1bBup/tipLlmzusRpK5zu5s6XZv4=; b=d6WZZVQA6jE9kANJKgL42phVVUk
	zDEFITobdZERTtcysVDNL/V4eMrFstNGIWii1HQ+Iulkur/M/gS3BAbRL83pM8Hn
	/FdjKWvB2yuDupZzVCBP7ctZ9Gj2p7KnO316S1LZyM8jNi8CPTBhNUCSj+dt9qME
	zw1dXHAUiBYTZLdAXCc+DJIeJqk1TJ+T6THtpySFt4schYqvNfsr6Nf005xxO5H0
	j0okhJHNqmzQD7zYkwSI5ISnOgLMo4YfC+NB3zpoy3BNx9g3Gup6Y0xx96V3LkEg
	GLxRTDlyvtFtVV/CF0dAEhc2T+JiaNTl8g3diDplMrX5nmxb9i94glFbx2g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv4t7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5476pP8v009511;
	Wed, 7 May 2025 06:51:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7ms9s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5476pQre009544;
	Wed, 7 May 2025 06:51:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5476pPhM009542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:26 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 46EA35B6; Wed,  7 May 2025 12:21:23 +0530 (+0530)
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
Subject: [PATCH 6/8] arm64: dts: qcom: sa8775p: Introduce QAM8775p SOM
Date: Wed,  7 May 2025 12:21:14 +0530
Message-ID: <20250507065116.353114-7-quic_wasimn@quicinc.com>
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
X-Proofpoint-GUID: zHxTd1JNTD3q9YTzl3cCRwfSRaKg5QL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MiBTYWx0ZWRfX66q5yhlN9Hl3
 w4fErhhjq6a0SEWwS9/dr0w1OH40L6VnnioBS7Q3VRxH96VI1BiE8OTBrniX9wCfz2yKTW+qS82
 WSlOs0w75FgRhhoDiQnpv+Jx+ISMh1tOEuEueZCBWBl/HfguqTUbiHMoGjumg762BR/OrM3vFt9
 Gy08kla5/rGa1g23kHJaI6fprpMG+fLUsVbhB1qzF7auW7SI/+3dciwAxvFFrWxiScOAq5cOuG2
 wg9lDJBD/kqLkcUbCOzBZz9K7DKPsso3op1ONT18w50KhG7nyBGdG6eJ07v/xfs0OSgk0TPLL1z
 CAh+a5cMep4EWKM9XoYKYo6sXbs1Cv8LtMvGgbNiETFvGGv1SXTjE8ryHrNPhemdepqJiRednbV
 ILS4PVV2Di8ciwAdI6/zE2qWuqBD5R1fYcO9dXPd1g5Tsvyw2DvXl7uTf4ujb/oM3/DaHnc1
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=681b02f2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=pd40ASZQSO3cjBnOgKgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zHxTd1JNTD3q9YTzl3cCRwfSRaKg5QL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=702 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070062

qam8775p-som.dtsi specifies SA8775p based SOM having SOC, PMICs & DDR.
sa8775p-ride & sa8775p-ride-r3 boards are based on QAM8775p SOM.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qam8775p-som.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts | 5 ++---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts    | 5 ++---
 3 files changed, 13 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qam8775p-som.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qam8775p-som.dtsi b/arch/arm64/boot/dts/qcom/qam8775p-som.dtsi
new file mode 100644
index 000000000000..92adebb2e18f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qam8775p-som.dtsi
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
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
index a9014095daba..f75e92e05bcd 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -6,13 +6,12 @@

 /dts-v1/;

-#include "sa8775p.dtsi"
-#include "sa8775p-pmics.dtsi"
+#include "qam8775p-som.dtsi"

 #include "sa8775p-ride-common.dtsi"
 #include "sa8775p-ride-ethernet-aqr115c.dtsi"

 / {
 	model = "Qualcomm SA8775P Ride Rev3";
-	compatible = "qcom,sa8775p-ride-r3", "qcom,sa8775p";
+	compatible = "qcom,sa8775p-ride-r3", "qcom,qam8775p-som", "qcom,sa8775p";
 };
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index e98554f825d5..568eff8c1999 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -6,13 +6,12 @@

 /dts-v1/;

-#include "sa8775p.dtsi"
-#include "sa8775p-pmics.dtsi"
+#include "qam8775p-som.dtsi"

 #include "sa8775p-ride-common.dtsi"
 #include "sa8775p-ride-ethernet-88ea1512.dtsi"

 / {
 	model = "Qualcomm SA8775P Ride";
-	compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
+	compatible = "qcom,sa8775p-ride", "qcom,qam8775p-som", "qcom,sa8775p";
 };
--
2.49.0


