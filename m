Return-Path: <linux-arm-msm+bounces-49121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56619A41584
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 07:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80A8C1896CE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 06:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CB31FCD17;
	Mon, 24 Feb 2025 06:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QBPnJ6Rl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30A71FC7E4;
	Mon, 24 Feb 2025 06:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740378964; cv=none; b=Qu8uwizpuyRb/Mczb96NmIEeQSHsmUS14N8p4RGaroROSU8xl4Egs3vRb/AP3T6o9++IzidOa3GTSN8Y4tSeDxvT1FuG8SUbwVqMvTYrIi4hkJfwCtP2YNrM8VpWdCm30QWKFt6Q1ZOOXBC8CcEi1odaGO3MxuXERjuS3r9nm9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740378964; c=relaxed/simple;
	bh=92T1WYc3Ruwv3Fd6K42BdQT8YF9DAkPDA4Eu2pQPB10=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhAIZDAAPQGzsniigke/jPlj8ePNZp04fyp+fJsfn4lOFHOINQXLZ6FYam0M4ApGX6BC0caZoTJfPUdSSOE4+OtyahsOGVNgKTYIxUxDF95emu3kyOSvnQMoPw8Ud/GvauEoy+ByLaYLQOh+jGOxr65jAoLzMrIbrnpIm3+asM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QBPnJ6Rl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NMPJ3d004412;
	Mon, 24 Feb 2025 06:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2uwKVw8YSeF6hqg8y72CIOXtE+Ffv/gUAg5+EYmKyk=; b=QBPnJ6RlcUmpAQyr
	iA//zzekZ4wMyjdf47ghPTWIm86Aq6xdk1cj5oSFo6W9nlBrOA5Gaa5vToJ27SwZ
	ra2C13Nf5mFwqsH/6Wy0ij/8HctUwZhVVux+/jShlkSYwqqJCO8ffWWFi8wPqz1o
	SSwcXUL9lGN0P+/TmyJ4K4m1ZlYJ0vTm2W2DaD6svPKVd42ok5skKbU8pJzkVrqd
	SuxkFyv2zzJ1duYzuJNqCbJEtPZEQ9vipq68Z24UzFh3Cd26HHXj/3YI2q+GFByB
	GM8NvN0I/Ak6yzNii3f4ZYq4epTt7Tm4XqR6T3d367mOCLV3OMsErSX3vUXyry8f
	a8yxRw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xnc332-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:35:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O6ZwHo011299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:35:58 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Feb 2025 22:35:54 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v12 4/4] arm64: dts: qcom: ipq5424: Add thermal zone nodes
Date: Mon, 24 Feb 2025 12:05:31 +0530
Message-ID: <20250224063531.2691961-5-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224063531.2691961-1-quic_mmanikan@quicinc.com>
References: <20250224063531.2691961-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 8E7cAhxpT9x-YF9i5qWgvFkYWLbyg3y6
X-Proofpoint-GUID: 8E7cAhxpT9x-YF9i5qWgvFkYWLbyg3y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=831 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240046

Add thermal zone nodes for sensors present in IPQ5424.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V12:
	- Removed 'thermal_zones' from the node name.

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 114 ++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 774386d785d5..2c4fa42f766d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -595,6 +595,120 @@ frame@f42d000 {
 
 	};
 
+	thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&tsens 14>;
+
+			trips {
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+
+				cpu-passive {
+					temperature = <110000>;
+					hysteresis = <9000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&tsens 12>;
+
+			trips {
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+
+				cpu-passive {
+					temperature = <110000>;
+					hysteresis = <9000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu2-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&tsens 11>;
+
+			trips {
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+
+				cpu-passive {
+					temperature = <110000>;
+					hysteresis = <9000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu3-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&tsens 13>;
+
+			trips {
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+
+				cpu-passive {
+					temperature = <110000>;
+					hysteresis = <9000>;
+					type = "passive";
+				};
+			};
+		};
+
+		wcss-tile2-thermal {
+			thermal-sensors = <&tsens 9>;
+
+			trips {
+				wcss-tile2-critical {
+					temperature = <125000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+			};
+		};
+
+		wcss-tile3-thermal {
+			thermal-sensors = <&tsens 10>;
+
+			trips {
+				wcss-tile3-critical {
+					temperature = <125000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+			};
+		};
+
+		top-glue-thermal {
+			thermal-sensors = <&tsens 15>;
+
+			trips {
+				top-glue-critical {
+					temperature = <125000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-- 
2.34.1


