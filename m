Return-Path: <linux-arm-msm+bounces-53834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA8A84596
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682DB1BA141D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 14:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C6228C5AC;
	Thu, 10 Apr 2025 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DdJnIiA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB38A77102;
	Thu, 10 Apr 2025 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293658; cv=none; b=bewKkvBflmnkpzFovGPI0Ko4pVOsrkwG95vcIwTkrTr6pEksmnUi4y49/k+oCiOWBbGuaWvo7tVXJ2cvt3fCH8NwfiiphIx0PkyIh/uwvOhP6Dc97OdRmdqMLjTR9a4gZo5B+aDwalpfqbbSAf8GWuc101NCuAnCYyeLF96Qy/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293658; c=relaxed/simple;
	bh=Y8u57cU/qv1oWxvjKsOomDROclM3u76BU23Ri6SkweE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bjl9Vk+FBW/gvsUZ1T62P19lPyVJv8TsOJjulxV6yDu0Ll0ilci3k9fIykW4aq0mmbzZg4viFFTO8mhre0OH/Lxa8Lw1uWfpnh5gWTPI31udjAnP9OumIzqHmjlxKsZpxbc5DmiRyVQtq3eYRRHeVQ2CaraKr3MV3WRHOofY36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DdJnIiA3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75ivW030709;
	Thu, 10 Apr 2025 14:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8scFOGlwHhwPnFiWIKp8fbkq0FZvhAurHyRzpRUADQ=; b=DdJnIiA3+lahdBRc
	0I+ZfPMpvYvJz7SPiAtRRpnU1xnTt/SI1Bisy1ACCVECY27BXfwyVzCONkCNzzZh
	FyKXQlzDjOngfDUKe0c3joWOJeOOr5TMLPt1p/wxsi/yLsatNERNhJH06GDUh8z2
	N6RXpNYZA6E4ysX2lJ1FD43sJLllar+QKiivdWkXy9517oGdN7XU+pKLQ4mYmKEW
	QatZj4Ev9K0BgHG4yPJQdwzrHyDxpIptXPMbKVSUT51brTLJcrmyAWJHj1r3VtN6
	rbaG32FucCRKUK5gaAIOJqhlM0LLAGpdCLovV5/y1vpfXIp7oiZ9KZrgy3ilK6WH
	yJyp3w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftpxfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:00:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53AE0kOr031399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:00:46 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Apr 2025 07:00:42 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
        <rui.zhang@intel.com>, <lukasz.luba@arm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        <quic_gkohli@quicinc.com>
Subject: [PATCH v1 2/2] arm64: dts: qcom: Enable TSENS support for QCS615 SoC
Date: Thu, 10 Apr 2025 19:30:19 +0530
Message-ID: <76e0ce0e312f691abae7ce0fd422f73306166926.1744292503.git.quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744292503.git.quic_gkohli@quicinc.com>
References: <cover.1744292503.git.quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f7cf0f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=NZtI_tAI-osbjVYog2oA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DhR6cxYWczxUhtW4kVa3_rEusR1pfWhk
X-Proofpoint-ORIG-GUID: DhR6cxYWczxUhtW4kVa3_rEusR1pfWhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=781
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100102

Add TSENS and thermal devicetree node for QCS615 SoC.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 281 +++++++++++++++++++++++++++
 1 file changed, 281 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index edfb796d8dd3..f0d8aed7da29 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3668,6 +3668,17 @@ usb_2_dwc3: usb@a800000 {
 				maximum-speed = "high-speed";
 			};
 		};
+
+		tsens0: tsens@c222000 {
+			compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
+			reg = <0x0 0xc263000 0x0 0x1ff>,
+				<0x0 0xc222000 0x0 0x8>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <16>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
 	};
 
 	arch_timer: timer {
@@ -3677,4 +3688,274 @@ arch_timer: timer {
 			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	thermal-zones {
+		aoss-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <118000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+
+		};
+
+		cpuss-1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <118000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+
+		};
+
+		cpuss-2-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <118000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss-3-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <118000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <118000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-1-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <118000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+
+		};
+
+		cpu-1-2-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <118000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-3-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <118000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+
+		};
+
+		gpu-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+
+		};
+
+		q6-hvx-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		mdm-core-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+
+		camera-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		wlan-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		display-thermal {
+			thermal-sensors = <&tsens0 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens0 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+	};
 };
-- 
2.34.1


