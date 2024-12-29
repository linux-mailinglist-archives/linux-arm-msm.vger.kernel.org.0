Return-Path: <linux-arm-msm+bounces-43581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4B29FDFA5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 16:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43D3C3A1955
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 15:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A469198A11;
	Sun, 29 Dec 2024 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ULoiD26k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D63319644B;
	Sun, 29 Dec 2024 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735485839; cv=none; b=qCZiLTmWIjeLIKh6D6KmX3KBEPFyFmdQcSAxpdcBJEYjB73Wo2U5/oD9yEqhRA9NNzeB19uJt4ufL1a9HezXl/pOx5CWyFTkBWlI/5JufV1EgBbJnYehOwj8vA2VE1RYgJ7PF44smKjUz7tNkHuZsJfMpgm+tVPcJ+S+7DSdb/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735485839; c=relaxed/simple;
	bh=KtecEVc33S51Q392mZtAIDk0QBTz/kG7oSs7dfKRiLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwVUxVFePpD9QRg8PfutFh/2/sB8XIaRQKhubkPct9etVe5QAzllZd1OztzmQxoaNwpkXwPAK/+7hT5QnWMT2A5VBWYr7cRkuLjTkOUCncpHVi4ZPWEQWv6r3Az7oay9qB1gMimrtvYNJAG4uEt7mTLK6UbL/dpbla5ee+A+FvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ULoiD26k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTFNDHk021219;
	Sun, 29 Dec 2024 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IiRzQGvYDAz
	4MPsV15s205gnwIbUSzxfOnx1MkYKPcU=; b=ULoiD26kXrc8cv5RvwHArW6wJcQ
	FedDKYvYuU+uIQQ0BRcp82B4pI76f5iKzfvECfat7gs7NcKxqInv3Urlub7qapLq
	XUhm50r+EIeeMQJKiQz4qdiLX7Fi3R0Y4U9iguhCT8vUpW6mX31lLrbCaZ+OO+iM
	2L+B8reUumMI1O4a59npSEduWtjgCIuIpofw6FA7UPoOhICdqCiL41TJ0RjDSIqS
	T4jktVKOeqpbxssesL/gNK4lJxHpYxqGTbXuoD3YhntITEHS/Xqo3We4TQPy5NxC
	1r3d4q/362mfXLzJ3nBszjmDC9OJfwYZHmrf6nPevd0NBfp8HF4a2BBwPMQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ta3hrn7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 15:23:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTFNb5B004517;
	Sun, 29 Dec 2024 15:23:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43tadkk58t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 15:23:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BTFNbQS004507;
	Sun, 29 Dec 2024 15:23:37 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BTFNb6S004505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 15:23:37 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 2BD03B2E; Sun, 29 Dec 2024 20:53:35 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Subject: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for QCS9075 platforms
Date: Sun, 29 Dec 2024 20:53:32 +0530
Message-ID: <20241229152332.3068172-7-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: w4k3HRO5Qw5oYeQhB06bS3JV0o7J1zs0
X-Proofpoint-GUID: w4k3HRO5Qw5oYeQhB06bS3JV0o7J1zs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=726 bulkscore=2
 lowpriorityscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412290137

From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>

In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
does corrective action for each subsystem based on sensor violation
to comply safety standards. But as QCS9075 is non-safe SoC it
requires conventional thermal mitigation to control thermal for
different subsystems.

The cpu frequency throttling for different cpu tsens is enabled in
hardware as first defense for cpu thermal control. But QCS9075 SoC
has higher ambient specification. During high ambient condition, even
lowest frequency with multi cores can slowly build heat over the time
and it can lead to thermal run-away situations. This patch restrict
cpu cores during this scenario helps further thermal control and
avoids thermal critical violation.

Add cpu idle injection cooling bindings for cpu tsens thermal zones
as a mitigation for cpu subsystem prior to thermal shutdown.

Add cpu frequency cooling devices that will be used by userspace
thermal governor to mitigate skin thermal management.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      |   1 +
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |   1 +
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |   1 +
 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi | 287 ++++++++++++++++++
 4 files changed, 290 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
index ecaa383b6508..3ab6deeaacf1 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
@@ -9,6 +9,7 @@

 #include "sa8775p.dtsi"
 #include "sa8775p-pmics.dtsi"
+#include "qcs9075-thermal.dtsi"

 / {
 	model = "Qualcomm Technologies, Inc. Robotics RB8";
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
index d9a8956d3a76..5f2d9f416617 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
@@ -5,6 +5,7 @@
 /dts-v1/;

 #include "sa8775p-ride.dtsi"
+#include "qcs9075-thermal.dtsi"

 / {
 	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
index 3b524359a72d..10ce48e7ba2f 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
@@ -5,6 +5,7 @@
 /dts-v1/;

 #include "sa8775p-ride.dtsi"
+#include "qcs9075-thermal.dtsi"

 / {
 	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
new file mode 100644
index 000000000000..40544c8582c4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/thermal/thermal.h>
+
+&cpu0 {
+	#cooling-cells = <2>;
+};
+
+&cpu1 {
+	#cooling-cells = <2>;
+	cpu1_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu2 {
+	#cooling-cells = <2>;
+	cpu2_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu3 {
+	#cooling-cells = <2>;
+	cpu3_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu4 {
+	#cooling-cells = <2>;
+	cpu4_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu5 {
+	#cooling-cells = <2>;
+	cpu5_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu6 {
+	#cooling-cells = <2>;
+	cpu6_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+&cpu7 {
+	#cooling-cells = <2>;
+	cpu7_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <800000>;
+		exit-latency-us = <10000>;
+	};
+};
+
+/ {
+	thermal-zones {
+		cpu-0-1-0-thermal {
+			trips {
+				cpu_0_1_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_1_0_passive>;
+					cooling-device = <&cpu1_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			trips {
+				cpu_0_2_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_2_0_passive>;
+					cooling-device = <&cpu2_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			trips {
+				cpu_0_3_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_3_0_passive>;
+					cooling-device = <&cpu3_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			trips {
+				cpu_0_1_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_1_1_passive>;
+					cooling-device = <&cpu1_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			trips {
+				cpu_0_2_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_2_1_passive>;
+					cooling-device = <&cpu2_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			trips {
+				cpu_0_3_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_0_3_1_passive>;
+					cooling-device = <&cpu3_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			trips {
+				cpu_1_0_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_0_0_passive>;
+					cooling-device = <&cpu4_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			trips {
+				cpu_1_1_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_1_0_passive>;
+					cooling-device = <&cpu5_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-2-0-thermal {
+			trips {
+				cpu_1_2_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_2_0_passive>;
+					cooling-device = <&cpu6_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-3-0-thermal {
+			trips {
+				cpu_1_3_0_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_3_0_passive>;
+					cooling-device = <&cpu7_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			trips {
+				cpu_1_0_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_0_1_passive>;
+					cooling-device = <&cpu4_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			trips {
+				cpu_1_1_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_1_1_passive>;
+					cooling-device = <&cpu5_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-2-1-thermal {
+			trips {
+				cpu_1_2_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_2_1_passive>;
+					cooling-device = <&cpu6_idle 100 100>;
+				};
+			};
+		};
+
+		cpu-1-3-1-thermal {
+			trips {
+				cpu_1_3_1_passive: trip-point1 {
+					temperature = <116000>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_1_3_1_passive>;
+					cooling-device = <&cpu7_idle 100 100>;
+				};
+			};
+		};
+	};
+};
--
2.47.0


