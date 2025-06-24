Return-Path: <linux-arm-msm+bounces-62168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2DAE5D28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D50D7AF90D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98C8248869;
	Tue, 24 Jun 2025 06:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W2sEeJ5C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EB11C8601;
	Tue, 24 Jun 2025 06:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747883; cv=none; b=ee4Sif2oqk+Aezlq+s30Xk0ucCeCDUdV8IDlcw3UlS7E2wvsgrBbWSToplcAwTFlf1ScQ+xJ8xNPLKPwt7pIKjH1gwtfhHNakqM8YKYsWI4FOlP3xKa0vCBm1cVjx7ux5MnMlpq02kdFVjSD1LBX3or0fw9fwXvE8o9eA99ePEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747883; c=relaxed/simple;
	bh=1I9edxjOnRw1ePLBhQCISmAFTTIyvaLzM0ZlUdKoKIk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUNv77cPGKltAzpWgf7g1C1IOntb3zq2KrosyR8j7S4upMWCKvwpJImBzR7Kh8WJmz0AZI2PZvvuVgBcjb6JrnH1RglS+o897rV0imwC+mFlEoSl5TBkc4wTY/oyivzbWsy9p9qxTZ7evdZ05BLghN2exhOcmVP7yi7gw4AL9n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W2sEeJ5C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKkotI007072;
	Tue, 24 Jun 2025 06:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YBgYYjcR6blvX1BWYLIv9YR7FOPC3z3KJNpXmqv6D40=; b=W2sEeJ5CHu4zFTLF
	5skw2ED6ZgL+T4QBqqHi3F+4XV6Jepw/gQs/q6KDnFBM6T8UEK7BqhqnNQ66DX96
	FM/iutYg5dQm+P71AvPLQbe3R/x7nSFmz2ad6s0TTr1Okm+1BISkEO0PUL4i/4O6
	AG+D3Rp+63+VARDveoKmXpxF50bPiBW1NtQRhdXoBsBFWPAdKed4ZgcJt1xmV5bV
	AOwrqYW02agJuM8hG46dimkvM+yV2QddUeNGfrv4yyHvcts/3SmZiKaFEoYzsS7u
	9Tsn9PwpgDfgORBBqqYuUO+37WLPPrsOv3B7RhTJgG4pB1f61c9w5W9XOMSiq2S8
	+Z35mw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttt9bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:51:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55O6pDeb000710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:51:13 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Jun 2025 23:50:09 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
        <rui.zhang@intel.com>, <lukasz.luba@arm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC
Date: Tue, 24 Jun 2025 12:19:45 +0530
Message-ID: <20250624064945.764245-3-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624064945.764245-1-quic_gkohli@quicinc.com>
References: <20250624064945.764245-1-quic_gkohli@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a4ae2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=3mcCAZ4DCuo2i6UhkvcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Q9w0ijpMSN53WnibOBbUkO53qIO7G1by
X-Proofpoint-GUID: Q9w0ijpMSN53WnibOBbUkO53qIO7G1by
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1NyBTYWx0ZWRfXzCp5OmokkihS
 TWfbzthS46TEpbffXCs0HQ9cknFoH6SM863CLL4G3I87Qcu5uhs0hRiuzt6ZXz3BYZA7iuNcLAb
 OxbIqq8TO2sTE7gvSZfIpurX0GevKy8TxAel6YkNKHYqX4dumD3zP3FXkQiYqDIQ/I2xM8F5F7a
 Zsc7oh5ltYGC5MMUzcegURch8jwuEjiK5636tn8BYbmUKA4YCmX/5vqsWuh13F7IXu3JLXOXsTx
 RnIuWeLjoynFXCQuGzWf5zo4irALyYmd47fcGBpHpTyZeU1dC1ACkSL/OW2KUW2eL2atibonjmJ
 39HJUM/mMaeKM2akpBF4je19UF8uTG3D2yNVTJ9FQESkbjbSeItxy5Viq8kHVYty1c9BNlXmIGP
 McKDbIXl1PEiyMqvwfqavOWas/9vMJG8r26/BjAy8sMoGw5AZWN30CfBy46IqvqWsTfwdOPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=677 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240057

Add TSENS and thermal devicetree node for QCS615 SoC.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index bb8b6c3ebd03..c20e98f8399f 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3692,6 +3692,17 @@ usb_2_dwc3: usb@a800000 {
 				maximum-speed = "high-speed";
 			};
 		};
+
+		tsens0: thermal-sensor@c222000 {
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


