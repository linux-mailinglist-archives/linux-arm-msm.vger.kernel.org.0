Return-Path: <linux-arm-msm+bounces-42474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC32A9F447C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 07:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EB83188E457
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 06:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D8D1F03FB;
	Tue, 17 Dec 2024 06:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GGvE/6Mb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD21F03CE;
	Tue, 17 Dec 2024 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734418165; cv=none; b=j7XDmr8YuWa+hvq1d0U6WOkkvbbWndyrDV04rK9EDP5nWkbnxQri2bRuqPR5wuWOpbIDfPelkLpCOD++RmMeQVyjeyEYow4eTxyI9w2Gbshtz+fe01P7n9MYFgs0xYoBi3IJL25AOWMnHgdXm/5CTIz9rpdtEKf4KDRoGty4RcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734418165; c=relaxed/simple;
	bh=KtecEVc33S51Q392mZtAIDk0QBTz/kG7oSs7dfKRiLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1BTNQVW5mC5nQ3OYJfifXjaCXizF2bnFYbHV/0ajmUk4q3UcM/rmQgthzeGWy01UNxZdcZB2XhwPqUrjfzWvnD8hRS+I2/7Pkmqj6g8HWUFaksGd29EzUXig45WTSK1QzFNaRGFjom9p80RbY1FjM5dSIHtWBTYsYhoKYI/yTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GGvE/6Mb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIbjAo010023;
	Tue, 17 Dec 2024 06:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IiRzQGvYDAz
	4MPsV15s205gnwIbUSzxfOnx1MkYKPcU=; b=GGvE/6Mbf6VIYpvE4gkJ0a+7loQ
	8OrqOBECi1euq4mstJioV/fmpJKe4nymFO/VXQzDYg4y2vH7fr7fgTm5c0Oejc3C
	w7Wva5lpDElKHFAr9SRDpxCMrM/c7+Kll3CnyKGGpjmSeVq+7uelOYMlYKN51elQ
	pA3FUxnI67v0zLKMeWowEpKgT6fL/9rqsk9f1FIt444ltlmHl5LJhknJwWUDiA35
	hBD8h+HRVhMH0ll8AxuqcP6HWkSItLcB4Q+Is91/SMNQYyXqbfWcosZIyvpezybV
	sZIy+L0THCYpCZz7GM/+0UJrfPHLS2P+s3w3NW20cI0mHBMR+WufVc564ZA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsn9hf4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:05 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6n0Jf014904;
	Tue, 17 Dec 2024 06:49:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33kx8yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:01 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BH6n1oR014949;
	Tue, 17 Dec 2024 06:49:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BH6n1Yr014926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:01 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 1292E5B0; Tue, 17 Dec 2024 12:18:59 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Subject: [PATCH v4 7/7] arm64: dts: qcom: Enable cpu cooling devices for QCS9075 platforms
Date: Tue, 17 Dec 2024 12:18:56 +0530
Message-ID: <20241217064856.2772305-8-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
References: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-GUID: dSHkelXadJpWJJ5GJ8BhFYwoLPGczhge
X-Proofpoint-ORIG-GUID: dSHkelXadJpWJJ5GJ8BhFYwoLPGczhge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=1
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=840 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170054

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


