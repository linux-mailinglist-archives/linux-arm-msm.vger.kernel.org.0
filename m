Return-Path: <linux-arm-msm+bounces-61218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 280D6AD8A68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 13:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D27B3166AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 11:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21332D5C9C;
	Fri, 13 Jun 2025 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DHk5QEed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195C926B745;
	Fri, 13 Jun 2025 11:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813879; cv=none; b=hWsSzbGgbceqpi9b9FGNMxbbUi1hhh+Vt80m1Of9vXRdM7i0iy5zRhQOY/+goG7V0HMYOdO8OrBXAUnR9IxylNZn0omtLCzhR+105EVJVgAOBjRuPHUd8XaT3zjZuNSKhfLrON2w5Cy/3lFdwJLZCpu2AM/S9VNX9Gr7QQACRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813879; c=relaxed/simple;
	bh=Vr0BYLVgJmGh43aLN8Y2IXbI6GnXc6MbfvoBmV5P0hU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EN/HLuHGWvvt5uAxyXXwpakTWM8iZPqGEY59kXwsQHTrngEDXl1iZG072sIlt8+lUqe1rEF/NNMYhZWYEGQH1ADZHBBtKSu7cRaGrvxxQXD8r7umGEwwZA8L8oSE6BKjDojvKeyI3tZImMq9wJrQQanVzkokabOROTxyNWNVZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DHk5QEed; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9Vc8Q013459;
	Fri, 13 Jun 2025 11:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Z/hpQrT7cY5RAjxxyfPnuwJGteKh/9RFGSqViY9kkU=; b=DHk5QEed9Q/VI61y
	h5tLkj0OYNvG+7Oo6VIvUfM18FMMNlTUGFWOED2LiD31OG+4o2xcq4oiqM6LCZo7
	LYzheVEMZfCkY6Q6F9pchYlsDvh4WfdFfVewkOreH8gX20RX7A1Fm5DAmHgwBktd
	84A/F3Q3Ky7d5ftyMQcN9DR81REbxFTg0IXwF+auyEHwLk/Vs9JGuTv1MfQGgPSs
	IFjOXVDFeRKytFTZJhZJBZ/XmOJ6gqw3wsr13VjT8A+ym7sI+7PmY32xneS9ogw9
	x0f4MqNLKWPd2CQ8ZDHm+q8Ov5073mqY589oVxRieeL1iaNmdCDMPI0PQVhoS6Xi
	ZKmrkQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnk0cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 11:24:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55DBOXqX003424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 11:24:33 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Jun 2025 04:24:30 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <=linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC
Date: Fri, 13 Jun 2025 16:54:02 +0530
Message-ID: <20250613112402.2203617-3-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613112402.2203617-1-quic_gkohli@quicinc.com>
References: <20250613112402.2203617-1-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iuQ9Igom1UnOpolZ4MTO-Z6G3dRnvf8o
X-Proofpoint-GUID: iuQ9Igom1UnOpolZ4MTO-Z6G3dRnvf8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA4MyBTYWx0ZWRfX6nTiSgj6gmb8
 cEsjhB7+PJzF/d9IRvKxGCbi3guGARFko1xvoEBovrNWHh93ElLMacq/dzm9Dh3mDGXxxZlaA/R
 UVgvXzuOFzt9VaFWDL1lnGd3RwCWhP5NwuDK5VWfi2nQRyT6cN5H9GC47vY53yJjiVubMfpn8L4
 UZDZq5Ty5o0rQFAJDNFgVTdyuRJmWxabFKKWiSQQtvcYksOIyJh9iCTiQg0sk2mRi8nONbgZsPW
 JO+lF2nwLD9/JkhKks0qUNwEaNHEAxhJXsvFgTxFjaV3L+o7StvuQHIrWdKfk3BrNinmHdb3iUm
 TYUrJ9ihXCeDiN2gjAuXYA+l/AZLf6Q1HNObPm7yASkS02IsogVlRHxzamnYaDbePTAn902/9UR
 QvQCeTOIq5uLL1PI45K3/k+8IEtwrec18X9CNFgQiSdCLpZlVyWDh1tTPz8Tn37aov4bQrxq
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684c0a72 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=3mcCAZ4DCuo2i6UhkvcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=560 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130083

Add TSENS and thermal devicetree node for QCS615 SoC.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index bb8b6c3ebd03..fda8b8638718 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3692,6 +3692,17 @@ usb_2_dwc3: usb@a800000 {
 				maximum-speed = "high-speed";
 			};
 		};
+
+		tsens0: tsens@c222000 {
+			compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c263000 0x0 0x1ff>,
+				<0x0 0x0c222000 0x0 0x8>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#qcom,sensors = <16>;
+			#thermal-sensor-cells = <1>;
+		};
 	};
 
 	arch_timer: timer {
@@ -3701,4 +3712,198 @@ arch_timer: timer {
 			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	thermal-zones {
+		aoss-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				aoss-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpuss0-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				cpuss1-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-2-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				cpuss2-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-3-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				cpuss3-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				cpu-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				cpu-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-2-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				cpu-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-3-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				cpu-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				gpu-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		q6-hvx-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				q6-hvx-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdm-core-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				mdm-core-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				camera-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		wlan-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				wlan-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		display-thermal {
+			thermal-sensors = <&tsens0 14>;
+
+			trips {
+				display-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens0 15>;
+
+			trips {
+				video-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };
-- 
2.34.1


