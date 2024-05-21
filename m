Return-Path: <linux-arm-msm+bounces-20148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895F38CB3B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA41B1C20949
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 18:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606CF149DFF;
	Tue, 21 May 2024 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l2A3MT++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544161494C2;
	Tue, 21 May 2024 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716316850; cv=none; b=X/i20HHZmxRswgQsMCeXtGlf7qIi7+AFLwFv/ZQxgHge/tVvb08CeXS4XsB4754D+VBUnyzjOp8G/WzGgyP3acFHaHBmaN7CUXq2v4oYyHocoOtJc4AOd0RdkrvV/FV/vtkuyEH5gOf0OAIYuALpoDkd5iCU8ihKjwV5B3QMOxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716316850; c=relaxed/simple;
	bh=wOqQqKuDwpeZmXB6W8DCd1Alkczjf/k3SmlTLa2BxsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=g3XDoXDkEiZPjpBg099FCFOrIRBDhdOyDF1i/U/DwmhPD2M9fV6PmGoUvmG/Unqa83WCLSQxXiNTmBDSR1ZE8NR9NUAJWisTPqWr7R4rRhnRf9gyzj/R1lL3qMMXrz/cjCmIzC64ukwPMlcbtx7ldTBo88XMG27mS5u3OrpUSsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l2A3MT++; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LEwuoJ020201;
	Tue, 21 May 2024 18:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=QwY0YQr84zBHrkcdkKsTRVkrZiZJkP64GeSk1KtlB8w
	=; b=l2A3MT++e/5WyLDXOWF8BagMKmPI4Zuv6DXIRaW8dr2sPefaM2E8sR81zkp
	v+r0IRB4ONgWrA1ftyO+2dEnW8yCRShpGDK46RqMxsDNt+b73LTgPvf9ofRtdbsE
	gRNNAbUoWFU2txpwgyRJ53BSKYXvaFnbAhGXtvUnfSL2B2nL2KJsXcNXDn+VPoTN
	xzzXupdmhcpMrla/l4dmsKvc0vKh4eu6huPhvKjpBZckoax2crsxUvAdYesnj0Pt
	yNa4VFULQsqBSsILKkYMCxJlTFRZAwu1kEbLFvAdgziAka/29TYLlx67SHa7K9I/
	K7omTIqm+b5Kqe2IzDVVbQH6KJw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqapmmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LIcT7A016664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:29 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 11:38:28 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Tue, 21 May 2024 11:38:04 -0700
Subject: [PATCH RFC v3 7/9] arm64: boot: dts: qcom: Use phandles for
 thermal_zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-board-ids-v3-7-e6c71d05f4d2@quicinc.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
In-Reply-To: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Amrit Anand <quic_amrianan@quicinc.com>,
        Peter Griffin
	<peter.griffin@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Andy
 Gross" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Jon
 Hunter" <jonathanh@nvidia.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O8l3yje1EKD7HghNyRUlYyv4bHgIydEY
X-Proofpoint-ORIG-GUID: O8l3yje1EKD7HghNyRUlYyv4bHgIydEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_11,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=820 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405210140

In preparation for converting sm8550 to use devicetree overlays, use
phandles for thermal_zones.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 arch/arm64/boot/dts/qcom/pm8010.dtsi    |  62 ++++++++--------
 arch/arm64/boot/dts/qcom/pm8550.dtsi    |  32 ++++----
 arch/arm64/boot/dts/qcom/pm8550b.dtsi   |  36 +++++----
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi  |  38 +++++-----
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi  | 128 ++++++++++++++++----------------
 arch/arm64/boot/dts/qcom/pmr735d_a.dtsi |  38 +++++-----
 arch/arm64/boot/dts/qcom/pmr735d_b.dtsi |  38 +++++-----
 arch/arm64/boot/dts/qcom/sm8550.dtsi    |   2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    |   2 +-
 9 files changed, 181 insertions(+), 195 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8010.dtsi b/arch/arm64/boot/dts/qcom/pm8010.dtsi
index 0ea641e12209..a889df2f2f25 100644
--- a/arch/arm64/boot/dts/qcom/pm8010.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8010.dtsi
@@ -6,47 +6,45 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
-/ {
-	thermal-zones {
-		pm8010-m-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
+&thermal_zones {
+	pm8010-m-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
 
-			thermal-sensors = <&pm8010_m_temp_alarm>;
+		thermal-sensors = <&pm8010_m_temp_alarm>;
 
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
 
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
+	};
 
-		pm8010-n-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
+	pm8010-n-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
 
-			thermal-sensors = <&pm8010_n_temp_alarm>;
+		thermal-sensors = <&pm8010_n_temp_alarm>;
 
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
 
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 797a18c249a4..cb5e70b28445 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -6,26 +6,24 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
-/ {
-	thermal-zones {
-		pm8550-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
+&thermal_zones {
+	pm8550-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
 
-			thermal-sensors = <&pm8550_temp_alarm>;
+		thermal-sensors = <&pm8550_temp_alarm>;
 
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
 
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/pm8550b.dtsi b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
index 72609f31c890..b3cfa030679a 100644
--- a/arch/arm64/boot/dts/qcom/pm8550b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
@@ -6,26 +6,24 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
-/ {
-	thermal-zones {
-		pm8550b-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
-			thermal-sensors = <&pm8550b_temp_alarm>;
-
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
+&thermal_zones {
+	pm8550b-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+
+		thermal-sensors = <&pm8550b_temp_alarm>;
+
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
 
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
index 4dc1f03ab2c7..8ef57a51b5cd 100644
--- a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
@@ -6,26 +6,24 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
-/ {
-	thermal-zones {
-		pm8550ve-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
-			thermal-sensors = <&pm8550ve_temp_alarm>;
-
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
-
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+&thermal_zones {
+	pm8550ve-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+
+		thermal-sensors = <&pm8550ve_temp_alarm>;
+
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
index 97b1c18aa7d8..258526abcc21 100644
--- a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
@@ -6,89 +6,87 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
-/ {
-	thermal-zones {
-		pm8550vs-c-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
-			thermal-sensors = <&pm8550vs_c_temp_alarm>;
-
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
-
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+&thermal_zones {
+	pm8550vs-c-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+
+		thermal-sensors = <&pm8550vs_c_temp_alarm>;
+
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
+	};
 
-		pm8550vs-d-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
+	pm8550vs-d-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
 
-			thermal-sensors = <&pm8550vs_d_temp_alarm>;
+		thermal-sensors = <&pm8550vs_d_temp_alarm>;
 
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
 
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
+	};
 
-		pm8550vs-e-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
+	pm8550vs-e-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
 
-			thermal-sensors = <&pm8550vs_e_temp_alarm>;
+		thermal-sensors = <&pm8550vs_e_temp_alarm>;
 
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
 
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
+	};
 
-		pm8550vs-g-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
+	pm8550vs-g-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
 
-			thermal-sensors = <&pm8550vs_g_temp_alarm>;
+		thermal-sensors = <&pm8550vs_g_temp_alarm>;
 
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
 
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi b/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi
index 37daaefe3431..251a16424d84 100644
--- a/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi
@@ -6,26 +6,24 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
-/ {
-	thermal-zones {
-		pmr735d-k-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
-			thermal-sensors = <&pmr735d_k_temp_alarm>;
-
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
-
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+&thermal_zones {
+	pmr735d-k-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+
+		thermal-sensors = <&pmr735d_k_temp_alarm>;
+
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi b/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi
index 3b470f6ac46f..dbcfeb53d8ec 100644
--- a/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi
@@ -6,26 +6,24 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
-/ {
-	thermal-zones {
-		pmr735d-l-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
-			thermal-sensors = <&pmr735d_l_temp_alarm>;
-
-			trips {
-				trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
-
-				trip1 {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "hot";
-				};
+&thermal_zones {
+	pmr735d-l-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+
+		thermal-sensors = <&pmr735d_l_temp_alarm>;
+
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "hot";
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index ee1ba5a8c8fc..c68e08747b6f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4452,7 +4452,7 @@ compute-cb@8 {
 		};
 	};
 
-	thermal-zones {
+	thermal_zones: thermal-zones {
 		aoss0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 2df77123a8c7..32198bf3cf7c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5030,7 +5030,7 @@ compute-cb@8 {
 		};
 	};
 
-	thermal-zones {
+	thermal_zones: thermal-zones {
 		aoss0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;

-- 
2.34.1


