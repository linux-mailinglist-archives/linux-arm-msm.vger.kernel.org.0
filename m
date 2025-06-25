Return-Path: <linux-arm-msm+bounces-62268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B3AAE7615
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 06:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 151254A111E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 04:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4801D1FBEB0;
	Wed, 25 Jun 2025 04:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aBJLjz96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B661F8F04;
	Wed, 25 Jun 2025 04:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750826227; cv=none; b=R+a+rFSnitRI4EMOIWiRDlXmdUmGgj9n88uycERQccF4ijzgqGYl+S7IXj9qrKaYm7rk3WFHGjWQciebKCgRA76HJcOS9FIKa0v7421PA3aR+uIkQ/Qr5J7nh3GL4utwCBwWBCStWA+Ibd+MufzTJf8bIK5egVeQePrKMc2z4H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750826227; c=relaxed/simple;
	bh=pWn49LNA4I1yycTiwukHdmKBrPI5OFgqhgwsK4Mf4LE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IN9vpHtK/jwhqdaDf3yUjhcB/6YqCguv1i95hWEZAbhOF9p0hVyQBQtI1CfexcYDj8PAXCdUc8RZROV/4ngv4YZtORIofcQP6z3QkVmMU325X2IwjbbxOCXonzK1aFAHRWbYNPALprrjYph2GiYscP1zgrRALMFHC9fJ97QsfVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aBJLjz96; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4Cllq012117;
	Wed, 25 Jun 2025 04:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GoM+/GB7+CXx13oQ0cP6U3HrmC9OcVEyI/bcNQ4231s=; b=aBJLjz96YPShbWOK
	V+xDsVJ18iBpogq5j9NSl5/MhFU/DvMsZZvhHdcysLzF9obu5mccvKbHM8xrFKfc
	wJNkp4FaA4cWtAiqPHcIQnYFfvqZS1RM0vPrHNe67NDKGotRmnc3D0+iLr1E0wl/
	o/iq/uXn50JAgeXfoT17r9dFOU806i8Mx4K9o73Uk6E1Ie+vzQjs0OcwUA0I0mbP
	GxIC20m/AADJcnUsNP/hMqdHz9bUdLuYfH8/wJANQVjHyyhn2/LiZV1zRN2uRazp
	t34ostVzlF1ND3kNnF406t0YwOdmxnsqzqHa/Q9EeDeIdnG/a50PBT7HRsD5Guds
	dKb1UA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1w1hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 04:36:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P4atDl020263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 04:36:55 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Jun 2025 21:36:51 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v5 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC
Date: Wed, 25 Jun 2025 10:06:26 +0530
Message-ID: <20250625043626.2743155-3-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625043626.2743155-1-quic_gkohli@quicinc.com>
References: <20250625043626.2743155-1-quic_gkohli@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685b7ce8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=3mcCAZ4DCuo2i6UhkvcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8bzI6lswgQ9f81e4x5IumXPDbEJ7DXRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMyBTYWx0ZWRfXynE8DiqijWDt
 A5YwCMW5AJYx9Iw977XuVA2nnhRc6ovA2YJYD3KsYftGbJaajpApvAOh6bW550C539gMjagGYRS
 Uh1M7r9BqnOcA+d0dBKFa8Q+7XKor9CvnJBSQWPeVAfCORBXGGEt0tZUtXr1L2pgnMhmjq4Yb6U
 ZJGawllD6Hun/mNsqXWtim6REneQA4buQbLrZXKFVRGLxaedP27DCmz4jG5CRKIEURtwrEDM2g5
 chWg8rweyhPTUMGw/Ytbzm2kIikWCak568b9jtmyCEv3S0HKmdL3s+a2Ke4iB+OnEwRgDKrW/fA
 t6f4XwxF76xomhilh5qmjXaAJjvxQYgD2VjWi2+71wDJY1mxzRNUHwiVhu3QIOyckNa7py52Kd6
 9EvbDsW945rdYqtB4dtI6yxShU43uMhHC4Pa49Qb+BHFZz73SFGXXxdzqazFgugvvTg6koUn
X-Proofpoint-ORIG-GUID: 8bzI6lswgQ9f81e4x5IumXPDbEJ7DXRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=755
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250033

Add TSENS and thermal devicetree node for QCS615 SoC.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 205 +++++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

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


