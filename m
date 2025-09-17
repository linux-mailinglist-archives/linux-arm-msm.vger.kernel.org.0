Return-Path: <linux-arm-msm+bounces-73974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED8B810B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 18:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2259B1C80E7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E900F2D374D;
	Wed, 17 Sep 2025 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXN9gwIm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AA92F7AAE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758126945; cv=none; b=FkPErslscjpw6A+FMdgBlr9MPoM+hXk/fBjbPemDiInINnj5AuRSfFHEq0LHpOvzZphOFOGnOyFzb6njWDx+4kfvZFh6Bmeukk0cGsr2pc2rtj7vSI0VK51NT+wnNQ2JG5IVS9Ih85pbqgrPzGkG4d5BFgJ1rPKF6kWNdNOWu3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758126945; c=relaxed/simple;
	bh=KayNBG/XlQFNRJR9KeaycQUOH5g7lHPbdcq/Po7LzMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g6sN0P+MCiR18rIBALSlRqpXwC5nKraTTWFpwKvzjEbzXiK6R3Va1K+ucTL+X/WDYW25sxEliCmIrJR25S6ykDhQEA98M9WGErc5RBUXuXfHQyQV0Ljuo26U2dU54Hl6qCiSKRE7wIWewpLdklrpePt1XZBiSGdPAcpSyQwHdHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXN9gwIm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HG4Yqj021478
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dlgDaRk8qNR
	/uRRWcAA46IikKLsQaK0jeuOmT/UTWv0=; b=SXN9gwImlzgEgURDOXcTnjK4Noh
	XA42wYJhYRk7mggq4mpBrjOhz7XK4HqT694cF66NlN6G0lEsc8g0HnxMgfyfQOjQ
	I20PbPZi8AFdt+lnD/ZfuUbQ2XbN9r8kvqP+lVRSDIUn05vDTJHDsDDDYwzHaHJv
	NxgPW4j+H9XAoaUO893p6GHFB4O7XoAg1gKr4lSs2z52gNv6smYliYTDfVjuWVmi
	e/eSd0NCDDU9+htojdJtbu9/j5zkF8NcdkQnQnAi0caQuhH+fDVvgWD2yvwCjEIV
	qrXrEdWGQ6cL5L9ckEAs+ZDTVyNd9b+184AGQhJO3G+qtuNd8PtILmV6y8g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5b3x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:35:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-786c3986579so2841576d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 09:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758126942; x=1758731742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlgDaRk8qNR/uRRWcAA46IikKLsQaK0jeuOmT/UTWv0=;
        b=lkN6RGg2ZaU451BZgKjZA0UDROjd/00KyF7JWyvx3+ZeU9LU2odD9VtJ2DCEBj7s8l
         N0Ri8JYP34i7r1TiDHSZID3MdvxdOmpNqrCa4Qxg821HVXIDMGHw6uvgNf/BRCvOAb8+
         Wo3OOqdYoPCBxBk7rbHnpssMcL6/fKqCbW45SAKaSpmAuwsAP3TM7ojfy311OhJWfOUM
         Q3m3/rVCCrHJVH4qPbiLJnbL1lKJend2Ln433w6UXHgi8p//ClLLQu+YV8vTGxoTkyvy
         VSUdpQxT3qQxedLf9wcVFF5zgBFQx3gUpwJcPIjZofhkq4hAVglB+aVhYyrEVkAtzfiT
         QPYw==
X-Gm-Message-State: AOJu0YxSJTNtOaUSxY1iCzKnIF5qh3elS+MEjUEqu2g/pltfe5m+MPOt
	kEBH5MYfbdBzIrTJq0bpI/XBE8FIhuDdFYrDhfFWCw27rnIv+vwpL6+hcoeCYPBenPXoE2Udkxh
	aUpajJSXV+yHmPdfiUWGWKc4Es2D933SW8ThigvF3ouKY992qsqZkJjOrPI0mnEBDOQei
X-Gm-Gg: ASbGncu76+esFdNLW7XC8XoE0nJjYYckPfZOmYgZXcO+Kroy5oNO1L/nW4Q8mryrPVz
	4jU/mwrNJi6/coBjdgN6V14XkUfG8C+F/b59o/bew/WtGUrsYnfGn3AO+tC8Fo0G+z+oSzhRRjH
	vCZLHpQW+0FhDYpCVmM4YPJrPxrIkZFGl4XiE2yafAEUsuNXtqTRSUH+nGffMX43H9S33O49n+9
	E/RjHCGXjvwm4iLWkGFkkgRD+Em/E8Jk5TwVPMcra68jiJkT29gAGotQMCgJ1f3tosHaTMy0E4o
	SeluXZbEL3mkgWUtV1VWM+CF/ft0467kwgZ41IcBDE2DQWb31sAxEif123gCDeyIg9/zrbEmd/E
	=
X-Received: by 2002:ad4:5c6e:0:b0:77a:d6cc:f1ce with SMTP id 6a1803df08f44-78ecfaddbd9mr30226396d6.59.1758126942021;
        Wed, 17 Sep 2025 09:35:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFUL5aRZykeZ6wFS/hNKcb4tkn5ew7j67JxUv6W6tQkQ0cAYBoRcpwm8TjX+Ab89bQeRiZ1Q==
X-Received: by 2002:ad4:5c6e:0:b0:77a:d6cc:f1ce with SMTP id 6a1803df08f44-78ecfaddbd9mr30225956d6.59.1758126941351;
        Wed, 17 Sep 2025 09:35:41 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:81ce:8337:616d:c2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32141ae9sm41337025e9.5.2025.09.17.09.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 09:35:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine
Date: Wed, 17 Sep 2025 18:35:34 +0200
Message-Id: <20250917163534.832523-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com>
References: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _bV6byujj2NrCuhKyHqDzpP5gp2VEKvW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX931u7VZX7Phe
 WfX/FGtE+TtNHlWxEloGC3GehOA9nHi4aiv+74GOWMftOuqKIlQ+buf2S2hERNCD9MrAivbgS+h
 6E+U3U1IxWe4F0VuIYHXj+OM07hqTMWYKk0OfGiY3919ttnfnYV3ZlsYu4NbsXrxH4VcuiZ0lNZ
 rzPXxfLUnL2wJdg0mVAb3Jn9BHmg1PfWkQ6MqISbNyjnjPu3yuw5DLRf6RiPjGPTo20bDV+8Fey
 TMtFzTTfQ1z1O5E9rJRJ/xWHWKvdgVXFMceL2iHvGlmAUbC/EzSiJbJyoH/hCwMSsaRt3w4MZl0
 8UorNpudcR13IhHAQEg1zbAs/Yl/EWR3+yGAOdc2VUYYyAcrXl7/39t4xvdIR0lAPlewOoiyTBd
 JeiMKqQb
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cae35f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=adKDawEoGyzw0LH5ae4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: _bV6byujj2NrCuhKyHqDzpP5gp2VEKvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

This initial version includes support for OV9282 camera sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 78 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d7f22476d510..bee021efc249 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -138,6 +138,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
+
+qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1-vision-mezzanine.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
new file mode 100644
index 000000000000..e97287324840
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&tlmm {
+	cam0a_default: cam0a-default-state {
+		pins = "gpio28";
+		function = "cam_mclk";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
+
+&pm8008 {
+	status = "okay";
+};
+
+&camss {
+	status = "okay";
+
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+	/* Add PLL reg */
+
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+                                data-lanes = <0 1>;
+				remote-endpoint = <&ov9282_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/*  Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
+	camera@60 {
+		compatible = "ovti,ov9282";
+		reg = <0x60>;
+
+		/* Note: Reset is active-low but ov9282 driver logic is inverted... */
+		reset-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0a_default>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_l3p>;
+		dvdd-supply = <&vreg_l1p>;
+		dovdd-supply = <&vreg_l7p>;
+
+		port {
+			ov9282_ep: endpoint {
+				link-frequencies = /bits/ 64 <400000000>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&csiphy0_ep>;
+                        };
+                };
+	};
+};
-- 
2.34.1


