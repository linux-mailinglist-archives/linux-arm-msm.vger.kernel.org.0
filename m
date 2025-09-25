Return-Path: <linux-arm-msm+bounces-74970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC912B9DB4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDCE016226A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6362F3612;
	Thu, 25 Sep 2025 06:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9X9GSR8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA32FBDE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782073; cv=none; b=n1LjzoDBvwvq+pWCXHFTiWM211kF/MBTZFlfJUsK3dLMhCYtp+auIrjQrRnp9+ajQFm4C/bHwF9lwE/a1MCRD1y4wgT1SoIk6XDOXGm5nsYpVZ8AKm7rPAxBJdXIqlKVQAwD9z5M8OkYg8uy8iFmx61RWMp5g8y+z38fOcKaFhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782073; c=relaxed/simple;
	bh=xY45EdffrBMLQN3eDVB38ZJyhhLfVOUzPeIepRrp9PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJBRXPauN4XKj+D/gVWX9WnDCKVCDZK5jrIR9CAJohXfdRwMWjrejLkrdTEVc0BnUP4amVmj+voAphPZzTGcO21PCd9lwkaIYy54sjvFNNm94IqOsYgZo3BUdX6EAE/Hi//Bk8sN+4tD3j8Ki8sZbE5vDl/gLqNQH2JgiD8Eshc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9X9GSR8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1MWVM024045
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/gQlYDqE+6SroS9br906aV1Ete64sbGoTONP1SpgC4=; b=C9X9GSR86qn6b3uI
	3VpHd8o2FEaAQzEsXwgp5NzMFsCOj3CYZHh8Lkb6XsP2BOl6q85TyRH4evN4OGkL
	bWesPNCERx+LiludiB2oKzS0QxuAdWLvJUxRpeW/9xZPemxgQckZh9taMl9xQZGe
	Cr2UzBQwDUT4nM/Fjqi1MMc1Ipqtx0nMLR8pI+fsa+RsJDNeQmAxvwv6MlZFBuId
	G/TncMDpYJa1JgRwU6VETSwyUL5sFzPjYo/pnEwJwhtMzJMvX9izaKD+RO9vaLRm
	VmQZFgrmhSCwQq6fIngc41RPpeGlq1TdDyJ07nxMq5F2Zi5MftNuKrW/lYrHC5d5
	SAtxHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0e2j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244582bc5e4so6664575ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782069; x=1759386869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/gQlYDqE+6SroS9br906aV1Ete64sbGoTONP1SpgC4=;
        b=UplrKRYJ7U4KcIkyf+CFOfkh5+YCys1fUr9c8SfnS+rZrJ1xglQQqQW1Qh1AP6KXYS
         gvxjis3jJ1X6F0OFDITqR7l0a9lbe4UKzRp6u/GmhJXXcbpZWjI2kZJDXH+2UcfA+YGT
         y1ndSxQ1Quzc7GCErfEWax58M7Kr4wOGdTdOFgMyoSqrjCqqrumSC3Xts/iuThmMcQ6l
         pFmIvKKIU9ec/6glEzjnzFEhacYb8ozyWT14jm+i8C9+TAYaWpH8yeZINyzYTPyGFc7T
         miCgijuTB1XGUf8pXm2kdr1y70x+ebbygPbEPugaDMbk1reUEBDCCNtX4Lk+8iL/Tp9Z
         1IRA==
X-Gm-Message-State: AOJu0Yyvz3BgWXHo6NXHkweY4IzbvaDIEHeVN/DGzAVFD+emtWbIRhSv
	re+Zkj19Eh/jgfMmPmgML7gI2udZcylBx1GCPLIxZzK4rpu/BqqzBDAr6iUg9JqeNRQFh0ZK6ck
	Ja/8eVx10eZ19yHPeB0VSya0+GWOG08VzqeBGDVdZxVRCaCsBPR7YfPtFGWdqL9Ktd2eJ
X-Gm-Gg: ASbGnctl2o8Nyrkx6BT15v/UNorti7CNNnsGjFXxMY7RIlW/ilBGoQ7SVGeKLVnK732
	LMAsX6wnVvoekBF1puYEFLRxHmHDzbOxErxI0T57Ta7yHyOpyXrDMYME1AucGADkLFZRgnUPd7Y
	4A/UzMzMe8gETxsireq8e+anzaO3+9ROxEuVPzH9DhuEnHLa3VEqL9Rlq0FBwAiEieMc7JMNm0d
	HXfaHk0Cos/O2V87JkGO/7cirZ7wctnooFbv/a8h6E79w2tCUZRc/II1LW7Er10aTKdMuVJbnKJ
	MXJXEsJRdyZJiH8F+rI4Xa9/3CsvbxaETJEz3xMcxDiy05zuyxb4N6ZI+9MqPubLcICs9YrXDEw
	tdBAvApL4L7+GJQ20vyyLsP2vZ+zIXdCsEhDZR1qRur1nIx9FHrRBq3XpW+Rs
X-Received: by 2002:a17:903:1a43:b0:269:8072:5be7 with SMTP id d9443c01a7336-27ed4ab368fmr23764905ad.56.1758782068163;
        Wed, 24 Sep 2025 23:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENFBnxpD0DWLQRStVU1Z0hHXFOdPlHVifb79LouVrmIW+2J+KcxDkF6i0W59n+O9VAFiveww==
X-Received: by 2002:a17:903:1a43:b0:269:8072:5be7 with SMTP id d9443c01a7336-27ed4ab368fmr23764525ad.56.1758782067448;
        Wed, 24 Sep 2025 23:34:27 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:34:27 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:29 +0530
Subject: [PATCH 21/24] arm64: dts: qcom: glymur: Enable tsens and thermal
 zone nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-21-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4e276 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=l4z_L_1xOpJQCbPnF-wA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: jqn9osvd9LBzwyRXALNOMQ4UH-yHdahn
X-Proofpoint-ORIG-GUID: jqn9osvd9LBzwyRXALNOMQ4UH-yHdahn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX37I6PQpjSaSG
 XEbW7+Dm62DZc0QoyQdscZBr7cQpW8BUskiim5QjJJxwBqvmAiBy6NCmrHYnWFF3Mznr+gX91g+
 7+ixXLZChgO0wC4dE4IQ+t6sfMjZRJRbt/Hhl3c7PKjVTKSPYpHjmoWFcB1S9tMTY8E0zOAsqnL
 mcWeHZc5cpltR+vHJdOANZl/c8KfTKz2GiYX3ygSwqRFTdDNJFb7PAvGdHHClkNm96c/WRrsij+
 +ilcizB4wkUouCzF2EhlKNQGc/TGe2VyVRdMxO6K0r0bI5gwS+mTd0fo9EB4jtrdKJbHmYLr675
 L+bNfJEZOjH4NyzoTtE8yoFnC4G8zpIaOK+L8ULod5U5ZJhDWt9CCS0GH0IYLBxV6DEikG4jMw3
 CZI9zr8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Add tsens and thermal zones nodes for Glymur SoC.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 1998 ++++++++++++++++++++++++++++++++++
 1 file changed, 1998 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 17a07d33b9396dba00e61a3b4260fa1a535600f2..986dc385200029071136068ab79ff8dd66d5284a 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2790,6 +2790,134 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tsens0: thermal-sensor@c22c000 {
+			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c22c000 0 0x1000>, /* TM */
+			      <0 0x0c222000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 861 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <13>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c22d000 {
+			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c22d000 0 0x1000>, /* TM */
+			      <0 0x0c223000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 862 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <9>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c22e000 {
+			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c22e000 0 0x1000>, /* TM */
+			      <0 0x0c224000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <13>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens3: thermal-sensor@c22f000 {
+			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c22f000 0 0x1000>, /* TM */
+			      <0 0x0c225000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <8>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens4: thermal-sensor@c230000 {
+			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c230000 0 0x1000>, /* TM */
+			      <0 0x0c226000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <13>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens5: thermal-sensor@c231000 {
+			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c231000 0 0x1000>, /* TM */
+			      <0 0x0c227000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 814 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <8>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens6: thermal-sensor@c232000 {
+			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c232000 0 0x1000>, /* TM */
+			      <0 0x0c228000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 815 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <13>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens7: thermal-sensor@c233000 {
+			compatible = "qcom,glymur-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c233000 0 0x1000>, /* TM */
+			      <0 0x0c229000 0 0x1000>; /* SROT */
+
+			interrupts = <GIC_SPI 621 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 816 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <15>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
 		aoss_qmp: power-management@c300000 {
 			compatible = "qcom,glymur-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
@@ -4611,4 +4739,1874 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	thermal_zones: thermal-zones {
+		aoss-0-thermal {
+		thermal-sensors = <&tsens0 0>;
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+				aoss-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-0-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-0-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-0-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-1-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-1-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-2-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-2-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-3-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-3-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-0-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-4-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-1-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-4-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-0-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+				cpu-0-5-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-1-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-0-5-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-0-0-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-0-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-0-1-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-0-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-0-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-1-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-2-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-0-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				ddr-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-0-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-1-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-2-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-0-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-0-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-1-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-1-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-2-0-thermal {
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-2-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-2-1-thermal {
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-2-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-3-0-thermal {
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-3-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-3-1-thermal {
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-3-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-4-0-thermal {
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-4-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-4-1-thermal {
+			thermal-sensors = <&tsens2 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-4-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-5-0-thermal {
+			thermal-sensors = <&tsens2 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-5-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-5-1-thermal {
+			thermal-sensors = <&tsens2 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-1-5-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-3-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss-3-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-0-thermal {
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-1-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-1-thermal {
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-1-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-0-thermal {
+			thermal-sensors = <&tsens3 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-1-thermal {
+			thermal-sensors = <&tsens3 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-2-thermal {
+			thermal-sensors = <&tsens3 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-3-thermal {
+			thermal-sensors = <&tsens3 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-3-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-4-thermal {
+			thermal-sensors = <&tsens3 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-4-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-4-thermal {
+			thermal-sensors = <&tsens4 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss-4-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-0-0-thermal {
+			thermal-sensors = <&tsens4 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-0-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-0-1-thermal {
+			thermal-sensors = <&tsens4 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-0-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-1-0-thermal {
+			thermal-sensors = <&tsens4 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-1-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-1-1-thermal {
+			thermal-sensors = <&tsens4 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-1-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-2-0-thermal {
+			thermal-sensors = <&tsens4 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-2-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-2-1-thermal {
+			thermal-sensors = <&tsens4 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-2-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-3-0-thermal {
+			thermal-sensors = <&tsens4 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-3-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-3-1-thermal {
+			thermal-sensors = <&tsens4 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-3-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-4-0-thermal {
+			thermal-sensors = <&tsens4 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-4-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-4-1-thermal {
+			thermal-sensors = <&tsens4 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-4-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-5-0-thermal {
+			thermal-sensors = <&tsens4 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-5-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-2-5-1-thermal {
+			thermal-sensors = <&tsens4 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu-2-5-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-5-thermal {
+			thermal-sensors = <&tsens5 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss-5-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-2-0-thermal {
+			thermal-sensors = <&tsens5 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-2-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuillc-2-1-thermal {
+			thermal-sensors = <&tsens5 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-2-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-2-0-thermal {
+			thermal-sensors = <&tsens5 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-2-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-2-1-thermal {
+			thermal-sensors = <&tsens5 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-2-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-2-2-thermal {
+			thermal-sensors = <&tsens5 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-2-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-2-3-thermal {
+			thermal-sensors = <&tsens5 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-2-3-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-2-4-thermal {
+			thermal-sensors = <&tsens5 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-2-4-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-6-thermal {
+			thermal-sensors = <&tsens6 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss-6-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-0-thermal {
+			thermal-sensors = <&tsens6 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-1-thermal {
+			thermal-sensors = <&tsens6 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-2-thermal {
+			thermal-sensors = <&tsens6 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-3-thermal {
+			thermal-sensors = <&tsens6 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-3-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-0-thermal {
+			thermal-sensors = <&tsens6 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-1-thermal {
+			thermal-sensors = <&tsens6 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-2-thermal {
+			thermal-sensors = <&tsens6 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-3-thermal {
+			thermal-sensors = <&tsens6 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-3-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-0-thermal {
+			thermal-sensors = <&tsens6 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-1-thermal {
+			thermal-sensors = <&tsens6 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-1-thermal {
+			thermal-sensors = <&tsens6 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				ddr-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-2-thermal {
+			thermal-sensors = <&tsens6 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				ddr-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss-7-thermal {
+			thermal-sensors = <&tsens7 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss-7-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-0-0-thermal {
+			thermal-sensors = <&tsens7 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-0-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-0-1-thermal {
+			thermal-sensors = <&tsens7 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-0-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-0-2-thermal {
+			thermal-sensors = <&tsens7 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-0-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-1-0-thermal {
+			thermal-sensors = <&tsens7 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-1-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-1-1-thermal {
+			thermal-sensors = <&tsens7 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-1-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-1-2-thermal {
+			thermal-sensors = <&tsens7 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-1-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-2-0-thermal {
+			thermal-sensors = <&tsens7 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-2-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-2-1-thermal {
+			thermal-sensors = <&tsens7 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-2-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-2-2-thermal {
+			thermal-sensors = <&tsens7 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-2-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-3-0-thermal {
+			thermal-sensors = <&tsens7 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-3-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-3-1-thermal {
+			thermal-sensors = <&tsens7 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-3-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-3-2-thermal {
+			thermal-sensors = <&tsens7 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpu-3-2-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			thermal-sensors = <&tsens7 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-0-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			thermal-sensors = <&tsens7 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-1-critical {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };

-- 
2.34.1


