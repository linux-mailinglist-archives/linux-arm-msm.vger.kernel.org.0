Return-Path: <linux-arm-msm+bounces-63326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C764EAF0DDE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B3A24E4FFF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 08:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CC9239E87;
	Wed,  2 Jul 2025 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W06VDGbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A2A2376FF;
	Wed,  2 Jul 2025 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444630; cv=none; b=V1GEhCUXoEapGhFXf8SUKCVubvtgN9h8DdknwM0pFky2BkeAgXDZcRi+1gPgCRrsgo/d1WIywrDZ7KkfNoeg0YfXPV3Nn/j0e3SvKbTLcguozxN0PTQsLXz4Ea+bQMCfNMXfUL+KXMh89A1fx6vPuzHZFQZE9RmVZh8O/zanpc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444630; c=relaxed/simple;
	bh=L9i92jFaAACyOw7d3NDbDtgeZVEFheqR8s3fdi4XEaY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RvIH/2ZV+ec7M81vOmhtXITBDL3SMBdGOf6cVSwqrRAUxYJkt2Qc0KRBaG/yAHDj7N0YqjwnWaVp7XGy/FH8gyl9rsZpTmhEC03aPNarsnU3swMj2ZoUo8DPe3kORZIExB0DbNQbka9haCNOi3XMlqXOJEXvPRFSWdjjUNMSk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W06VDGbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56289uZ2024893;
	Wed, 2 Jul 2025 08:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOfH8A59zCMGBNgUzITq75nBa7NlULlrPT9xI7uNOsQ=; b=W06VDGbE4jiliXBY
	DsFP4g8X6p8G1bVm0CSXEnBFB++Y63i8mmJgFD2jjkhJHwu7DkwvlVjACMKhT8r/
	uRPFtZLgFDwEqyVch1EWI28R01/Cpb6boBOXfRZ5VSyISPyjR0rvO9UM5/0qb8Zs
	8YrqTjicbVyIwZCmPXvGTq9RB7Ng2h577OMuChoXNz8znI1kQDY+MKKEHQZG8j+r
	BBCij3TQ11SlU3gA727D23YeDsaQFmNoOEa+b5SReBy/O3K+4020UYLOYdPVeFcv
	WelBZDpMQPFHizKurOy2NtqdTNbKHoqzsAJRI0sbLbh113TDcPSVYd7GGt4g5npy
	rW884g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8023n96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:23:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5628NfYO026711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 08:23:41 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 01:23:37 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v6 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC
Date: Wed, 2 Jul 2025 13:53:11 +0530
Message-ID: <20250702082311.4123461-3-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
References: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
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
X-Proofpoint-GUID: OlFzicdvidR-IyZFpk4BzI7rMtw2HImZ
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6864ec8e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=3mcCAZ4DCuo2i6UhkvcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OlFzicdvidR-IyZFpk4BzI7rMtw2HImZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA2NiBTYWx0ZWRfXzaObO/ayU2vB
 NjxkugzJUH9Q6/sLFHuyPq/8YiO0aZQ86Z16gsqlPh0m9LD0FuMGE+qTHF4fcNmDgJWwj5xTdyE
 rnHwFh6RYG3qDToBz+YX8rZSnaAHInj45KNk4quYa4UlBEnbgvmMWp9FqKsmGAlgVLfXtiZ7F+y
 3KNyiwmhpbtU67KMMzwmMpDAL5P0BgZYx1u1wKXCAIiJ5IxRsy/dQJFoyl8vrzCuAn4Qv/FnUj3
 Oa+on6FuZzcekP76kcYkIfWsq14XmUP01W19bW1D2WhZmKnV0duCHOXZ6DfDNWlS3NZvySkRjhG
 D+P/k95PfSe3luSsyxecuAGhZkmFyex7TVy7vqLEij/mOp7mFQY5/0z2bedauDKa6KBYcZV8Zeg
 cakjGFJl8BWJl7JTBFkTz4/CkWb48WaM9GABvfLBC02iAvepFivSt+2ID8g3Qi4bI4CpYadT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=756 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020066

Add TSENS and thermal devicetree node for QCS615 SoC.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 205 +++++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index bb8b6c3ebd03..6997627935bd 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3692,6 +3692,17 @@ usb_2_dwc3: usb@a800000 {
 				maximum-speed = "high-speed";
 			};
 		};
+
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c263000 0x0 0x1000>,
+			      <0x0 0x0c222000 0x0 0x1000>;
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


