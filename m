Return-Path: <linux-arm-msm+bounces-70235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB8B30D8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 415AD18920A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 04:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B419E28C5AA;
	Fri, 22 Aug 2025 04:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CCyz3XYY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C4128B3E7;
	Fri, 22 Aug 2025 04:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755836635; cv=none; b=CuPfzhxVN50Sk8Vc9ehUSq+VwjlvRnspnRhjDN46nE9n01QEAv7A43LKinpwS68OqCI43UX+lTBgh6kdK6N9Xir7mH11Xvc/bK/Wxils9R5KtXmn9tLZajDoP037M6/QCPpKOM7cNyvGsoB9RslOO8sH0F0whDemHapImP3BLvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755836635; c=relaxed/simple;
	bh=yGSeQ6xrjvs04Qzt+bYsmNnakQJ7SuT57GaigscfxX0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YJFqtrOhp/C+7TKnHTWUuOs+U474mlIObav7tl7v5kwpqnRK0Kok4JaYeFAEoIuPW3S9a9XjcYyDFmR8B+m+Ndv4TEf3AX9KTlyiJJ6LpHIm4TPxPU76of7PA2Cr9N6jH/cy7NfenGAiETqKUNenRWPgU8NdWjieMNQ0SLt4fPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CCyz3XYY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9Box025035;
	Fri, 22 Aug 2025 04:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6oCc5+tI3tnoETgo+qpNKWgGBlDvY/3sPWSix3VB8k=; b=CCyz3XYYY6XH1yan
	UTuTC8JeBHMwGdh3DM2uPMLGo2EmyCnwnbW9ZXYG38GBsVgj1oVhISOlhj7d+dYW
	1VAYtIpcZ+wbpM0IuoNLm0gc5gTlLS286ex+a6kDKoSeMEc010OZLlOrv3mPlgFY
	WO00uIyTjtYzJ6qEvtWGy8rU2zHCHdxiZve6Fh2ORNUOBRYW+sNyDj2WGUxMQ3FN
	NMUvxClnBG8iaq8XaFYmn/6Vuabpl9LoybTrg4CTt2BAO3Anobu1dpqBBxhB9MUe
	bPZhckZVwl+yeVQWOqCknv4RztUNTuP0p66aFAnT7wHa08dW+6Ogpfv/+MpAMarJ
	qCHvmA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ayn4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 04:23:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M4Njho020535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 04:23:45 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 21:23:41 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v1 2/2] arm64: dts: qcom: qcs8300: Enable TSENS support for QCS8300 SoC
Date: Fri, 22 Aug 2025 09:53:16 +0530
Message-ID: <20250822042316.1762153-3-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
References: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8/TejmfbSK2z
 p3z+9UYLhbtB3gxhHgBu+Sy0aTR45ksgibEcRMr59rh6hYuehd52G5Mhkkk+z3PcKGDy6VaX3Jl
 iPqVUrUL+Kah/3Mnj80Bvl9ZPxarAWR8mESYCabPW2T4WOW19A5XKyj2bh0EBWbjHkob5j8seo4
 BeNtQ7FO5PEG/Ve3dqXbL3aTITfMGGmIjUDYXCbCKwkSZykGY7cZXdNO2h+sO/RSBgrxJNzrsWq
 jnx5IfldywSkpRCz4yXsXg6c24+9NMDWwT1Qgb4zbE7ebq5im/PGdhcWfShAZxZ+r5wrucV4fsG
 zPq2JQPYVWkpr7f1QzrxF3JqyHR4KoPv4MKrz9WtIItJPB4pnOF/elwMH1oLEkGZYad6VEuSJg1
 lTdtIOotnsySslKJefGiLLHSVNAeXQ==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a7f0d2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=myw-7xqAkLZB6mJvAdkA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: X3gyDpPnhSdBYiBdeFcoSOcS7kdt3peT
X-Proofpoint-GUID: X3gyDpPnhSdBYiBdeFcoSOcS7kdt3peT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add TSENS and thermal devicetree node for QCS8300 SoC.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 526 ++++++++++++++++++++++++++
 1 file changed, 526 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1..0024a75916d0 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -5632,6 +5632,532 @@ compute-cb@4 {
 				};
 			};
 		};
+
+		tsens2: thermal-sensor@c251000 {
+			compatible = "qcom,qcs8300-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c251000 0x0 0x1000>,
+			      <0x0 0x0c224000 0x0 0x1000>;
+			interrupts = <GIC_SPI 572 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 609 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#qcom,sensors = <10>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens3: thermal-sensor@c252000 {
+			compatible = "qcom,qcs8300-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c252000 0x0 0x1000>,
+			      <0x0 0x0c225000 0x0 0x1000>;
+			interrupts = <GIC_SPI 573 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#qcom,sensors = <10>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,qcs8300-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c263000 0x0 0x1000>,
+			      <0x0 0x0c222000 0x0 0x1000>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#qcom,sensors = <10>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,qcs8300-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c265000 0x0 0x1000>,
+			      <0x0 0x0c223000 0x0 0x1000>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#qcom,sensors = <10>;
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	thermal_zones: thermal-zones {
+		aoss-0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				aoss0-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-0-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				gpuss0-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		audio-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				audio-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camss-0-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				camss-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		pcie-0-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				pcie-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-0-0-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				cpuss0-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				aoss1-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-1-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				gpuss1-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				video-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camss-1-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				camss1-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		pcie-1-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				pcie-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-0-1-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				cpuss0-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-2-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				aoss2-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-2-0-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-3-0-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-0-0-0-thermal {
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				nsp-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-0-1-0-thermal {
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				nsp-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-0-2-0-thermal {
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				nsp-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddrss-0-thermal {
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				ddrss-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-1-0-thermal {
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				cpuss1-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-3-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				aoss3-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-2-1-thermal {
+			thermal-sensors = <&tsens3 3>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-3-1-thermal {
+			thermal-sensors = <&tsens3 4>;
+
+			trips {
+				cpu-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-0-0-1-thermal {
+			thermal-sensors = <&tsens3 5>;
+
+			trips {
+				nsp-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-0-1-1-thermal {
+			thermal-sensors = <&tsens3 6>;
+
+			trips {
+				nsp-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-0-2-1-thermal {
+			thermal-sensors = <&tsens3 7>;
+
+			trips {
+				nsp-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddrss-1-thermal {
+			thermal-sensors = <&tsens3 8>;
+
+			trips {
+				ddrss-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss-1-1-thermal {
+			thermal-sensors = <&tsens3 9>;
+
+			trips {
+				cpuss1-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
 	};
 
 	timer {
-- 
2.34.1


