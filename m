Return-Path: <linux-arm-msm+bounces-74945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7BB9DA23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AAE517E832
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833792F2907;
	Thu, 25 Sep 2025 06:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nwmtjt+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AB62E8E0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781809; cv=none; b=dKF2hNh/a+o2oOyJK5s43qKTkme9KnXZ2sEzEOZGEHhCA2kQgZR1hSItR6lLbb4VCdKILdfgR73iGLWxsDSKlkgPIXeMOpCtdoXyDY0Lr9ehzb8wuq2EBWoV+MfVP7X7w9m8eOBsg3T4gvbTFLTQ0Apm7fyqZBy4dwebX5iBT74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781809; c=relaxed/simple;
	bh=xY45EdffrBMLQN3eDVB38ZJyhhLfVOUzPeIepRrp9PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kVtOpQ/O1NiMKED+u/ESG2vfusT3NIjOZz6VbJYHQsCluijc87Q+WMW7+hpg5kzCRLeYjdFCBPaAwAgsluK5vngcOdJJoJzZwK+Dk1brFF9YAUMixKNuv39uGVLJaqwM7MN1qi7OyOxG4xLN/K4NN7VLOHMq0M+YRs6dpV2Dx+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nwmtjt+8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P29oYQ029717
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/gQlYDqE+6SroS9br906aV1Ete64sbGoTONP1SpgC4=; b=Nwmtjt+8hLjTTqnt
	AYVOppAoqcxw5Jsd2cHYgXDBFLJYFIe7qtZfYmDNaXc06TkSFCLy9pwybYZs9sBO
	9QglMFfgWjn4SsuQpmANvIs93fxtOcVum6aOiSkiwJa5gMesB7RkhmHYRjqtH1lB
	kdS7L328CLyALGJUF/zYeUBV+azplrMEo4qQYXjP/GlzQwAqCVvraWfXjMHZFWtn
	jDtIqiGBZceKrsU0RPtus3Y+HICyGhlFOJkcP1MrV/gmd8kqgJcT8jX523Hy0up8
	G8TOqztq03+glgt8jSHSKFKr/XUQU3P9ZhoLmA/CQm604AOnoXBBEliVwHwWBnBj
	fIAvaA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fpwcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:30:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780f9cc532bso590203b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781805; x=1759386605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/gQlYDqE+6SroS9br906aV1Ete64sbGoTONP1SpgC4=;
        b=uZA5BzL+Ir3L2G/x3lK8UKHe8SpbPXE489Ee8w2gry5/6zA7X6goSeaj94znevN/jT
         zlxzBbZUa3npVuygqg7LKUoZch1drH0obA/NyB2zBtraP5bUBt3X7Bk+D/zXdKAWoSvg
         R7wJRWD92G27hBMN1o30VUYT6xPJ5Lv56p6AJH14D/gGu1TsRMIrHnETEdGYZXSOFwAG
         S1ZHFACtiTkczFlmq/faixWgtgDzqDKp7ekDkwfykYlRm6cZbhAoW7HM1pG99TqoUFWe
         NsAHNnL07/zPC/hsCtDfh34tXZXaZ4I3DtiqgljqYZE5WgW2B25ZWlgNbQJl9C0LxRoX
         uVNQ==
X-Gm-Message-State: AOJu0Yz+EeHRB01WgbqmrP5qh9+1W1zJN5UGOjhzWHZ000oRZxyHaRWd
	xWlvGa7vhIVId/IbBv6QLnjMIsf10ReQcC07QmYH+t8WD5v6Yb8EoDMWGVLuWk2Zhx0Fyj0RZ0u
	KYJThgSyBARllaes0jMEYEhx2L3n+t+bmUE9xYL/ArC0TvN69P0EerAjAR5No35f2byZ6UwKq3i
	02
X-Gm-Gg: ASbGncumH/NgIMVAj9eTQoxgDo4iOmZIOtklrkTfmUf3K8BNjuM3SALEViV7RvrHcwc
	zg4ToeTO/gL6GE/0xgZUcP3eQ/QBveLDjWCXNekUuznIkqgcjbZ3p0+nuJK3LNirRlWppSwh4MZ
	CPtk16Bj6V8D2+rPyPwECyTW++x1m9gGV1ud+2S4+ohky/6o03jCFlHgJgXvZq+5kzXP8S8BK4l
	JvuqiCZ9hMOzfvYU4wWT+MHRfh8IYVHOgXA/Qj2CoIChfQuMm9E06x5oq2d63XSfRJDAwferKo6
	CMobtA+eGtzdmMvREra6MLB21K/5hlaZGIJxU03mjYbn70w5QRxgiYWH2SEaFIkJ4kxXTTTDkaG
	iYDV/x1xVUCzmlmXUxqThmVPIeAj0mEqxzJNl49AU/Z2LfBQ4W47GO3ubbbaM
X-Received: by 2002:a05:6a00:600e:b0:76b:ecf2:7ece with SMTP id d2e1a72fcca58-78100fef9e8mr1637274b3a.12.1758781804550;
        Wed, 24 Sep 2025 23:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmlubtUqC/iUihYrvWOZ+ReF1mmWxGH49RoVao+QzbnBHYeUZnpiiDwovdcguzPsY8LpVphw==
X-Received: by 2002:a05:6a00:600e:b0:76b:ecf2:7ece with SMTP id d2e1a72fcca58-78100fef9e8mr1637224b3a.12.1758781803672;
        Wed, 24 Sep 2025 23:30:03 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:30:03 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:27 +0530
Subject: [PATCH v2 21/24] arm64: dts: qcom: glymur: Enable tsens and
 thermal zone nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-21-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 2R6wxJiA7aUfrosQYeGLg3ljKt6kkVzD
X-Proofpoint-GUID: 2R6wxJiA7aUfrosQYeGLg3ljKt6kkVzD
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4e16e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=l4z_L_1xOpJQCbPnF-wA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX4OewL3eWbZpO
 eYYvFq1Lj2zCd8ri8WJyJKuq0WeKxmhDKPx+LTpTUKngmPLTyNCZ/0vXGMFp74OfVblGxSzIHEY
 9JB4nc008BxFlKiBkyXKlo+mLdow54rOgHzmQ8fYfuRbPyx773+ETQ4Ckw0UG5wW9fYOVlStdSC
 PIAGcKkfMD5lDXquzHv9NxY9ZaILDhHh+jwmDoRPzTaDIrMoCoZb9QlDviwnxFRhD1fZAuvwCA2
 aFF6KorTw5Cttv54jbLKn70kdfF28J8v15OACHsQvWh6p/cEnN4Se/1DaiMqSK9Jc/fwp8c4uG3
 qOHF2knRX0qJeZS+eD+DU+K/Xo2kWO1piDPEmOskzoDR936zXfHiACljPauytwZAZiM5OBA9Hb6
 Vz+fdYeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

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


