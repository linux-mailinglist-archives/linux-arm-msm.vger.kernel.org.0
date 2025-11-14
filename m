Return-Path: <linux-arm-msm+bounces-81876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31343C5D644
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB5C73AC362
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91D2325733;
	Fri, 14 Nov 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRbJSyjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0paXisG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4CB19AD5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127519; cv=none; b=cLJ7oWA79Ul6AlDBHZ/GGi5taGT7cA5Rk5jEp+hJ/P/lScnmdKCYMv4ib/oi+Ic6tnXvA6Q7035hg/tI09k2/vatLbRygjm0QBCTD66tfhYG9pQZJd0Z2NToweOnra4xB45Dzk16Q81Pd4JckBgKA1d+emOc7IPWmZlmhH00bmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127519; c=relaxed/simple;
	bh=9QruR1Mx5NdAeRhMoNEA8sd5876dKGByzxHRlJ8dKyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d8amJ1SKYBv174wtOVo8Cp+hQBLQsA/fYaQQkd9YDnS0FPs6bftU0ZoX+vK+koCFoDoPRHQjZrDRF98wJl3wer5H+xcvnUcVGVqJHVqasUUAYFIK3SxMuz/c6DU5JUCv3VOQ5LKLp9RRjnfmjoZvRV7F6Yb6X9j5IqPpx0DnnkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRbJSyjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0paXisG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8Kotd1423690
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KdnkIr5WkQ6
	QKcdZ8Gs3mw6XKqZ93l2WDjWmuqF3gx4=; b=DRbJSyjVBX9KkCQMr/D5xwi/l6Q
	kXw4tqqQwdSVQJhkNyAchyEjBQFP6qpiJf85KNz22u7D5tPPvgvZKELYCqOK0DYW
	gkdmRY0oF3OzXEx5KqtvSbl2wTt1uEdoZ9XpwVKj8HYxBJU9friG8Z09L7E71/4b
	GARQdW9gv3dNItBl3307/1yTUIF+lfJIgHY11B5YP60gQMqqxE4dJhB9Ed7x5hE1
	6K4+yu4qF3H+1DjEDGOoaa3EVZyJlo6YANkJOdgQ8HfOp8ZyDcEWcJLd4FPWQdDO
	F9suiblYjKmRO2uz1XlDiB6GZa0ORxnc4HvJEdg3vX44a62X1/udIEJyvBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g29fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8984d8833so86271731cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763127516; x=1763732316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdnkIr5WkQ6QKcdZ8Gs3mw6XKqZ93l2WDjWmuqF3gx4=;
        b=h0paXisG/Pz0lIJIAO3gxXT9ql/+gewtcVkQAF2FMPqcFtM0qbhpg6CJY0rh8kT+6X
         noiyIvR+G8SLfL5FejI77kDx9i7RxznW5zjGXLUTwKykqi3MD2IQa2QgivDtsW7pMpO2
         8h8p4VwP0gzIQW1Ap355KWXxpD0IT26UWW3SCzTIuJ6hKyzl022fZpW16W0Rh7/Zl/iH
         Z1CUGXn1iVOIUzl/osg4QwvOotC5XtUk4WaHC42PFLtQkvvct1P7+F7ZGyh5Yk8mMZY7
         6yXyn4SY8DRMXY6ON9Nxc5ymLnttRXG4ORato+chvMy9F4tB94dPtrSBZn67rSU5ZMXq
         7PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127516; x=1763732316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KdnkIr5WkQ6QKcdZ8Gs3mw6XKqZ93l2WDjWmuqF3gx4=;
        b=Da86Y81UQpT/Nt1LUaYf+vyCe0qN+xwKSeDr+a/0XDxyU8LB6dU4x5odAP13TrK/56
         PmxDVh40O9YWwx6sW3atr5lOZupd+o/KCkht1m9G5A0GBOqU6GnsrIa/ABH9WKuJTEsJ
         4jEOgz8+HXV8v7BElbkr1NKkGc0k1ExY0FwxmQm8e0EcHNa+BcqlZoaV8cMwzSU1JdlZ
         Lky6/NzU1umisjzYnvNaoB1G0mZvv/gw00w4ePSLeSs5YvJI7woNHFRFb1LkSmIalbFM
         0i6x3v5piqdZuKsmAAIwxfytlmNBBfrkrnm6EB3scaHaLnwYotDFYdd+q61b7w87DooE
         iwpA==
X-Forwarded-Encrypted: i=1; AJvYcCVMVKRwxfyrbuKWky9FbMbDG+WV3tLk0HhLepw62QYz9lWYQmwhE0WYtILQRml2i0417YZXTm9tQ/jiM/1b@vger.kernel.org
X-Gm-Message-State: AOJu0YxrKWr4mTtmBm1DNBGDvGXngiPqZHoDcJmVcYASiIWRGy36UWSN
	J4SuWSaUqW/2Pvv+qOe9ohJ7YQyrkCxGhzJRpYyzwF5YcHfI7dsRBuKEzVp7HhyfTzmobLXyn7H
	Bo8Cdjl7XHNU3POfWU8bXAJtknTWkolbjq8uZZz+qbTVP1NEaIybg79Pz0N6x4GEZLZLD
X-Gm-Gg: ASbGncti1l0XZPbRQhTMqaEM+SCahrcwzD0tF1QgSQOrI6kIs+qWY182eGxjkQQ6/07
	WN1hNmfbUwSuIq915p+gFTrkh02/SmJmrNyDVNLexYleYJP5v0Pj3nu4Ltcz5cYI8XRs0wWcpOr
	UzCehG5xoVs3D0zlIVR6vX8x1JMEtmyXpHTavCcIO0ZJBQDU/NqM/RKf07V9mZ723ptkCKnInU9
	WZyu1iszRvuCTGIJvUXsk+yF8DhjEXckVTyr9iggg5i2CYO/Vj+w3FTAOWFMjIZMnQFkHMhNGjF
	09tz5FpQI3cTH6WrmiSdj00Idcd+Nv7mclepVTJF2nDzjtVkDhQQTQpfIr7nDlKQRllJwkOLS7z
	Q1qH67w94qq9s1jPTy4FWocyz8T9rQLe2IBlOyim9MrXCZHa4HktO3jE2fo+oYEXsVw==
X-Received: by 2002:a05:622a:40d:b0:4ed:b7ad:6fd with SMTP id d75a77b69052e-4edf20f1efamr44182161cf.49.1763127516119;
        Fri, 14 Nov 2025 05:38:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7nuiryy5wLOzPoLCrBpQvxcS9nqor/7BWrjvbQcsaJkDel++CoGoooU8knJVTPssRHoL1hg==
X-Received: by 2002:a05:622a:40d:b0:4ed:b7ad:6fd with SMTP id d75a77b69052e-4edf20f1efamr44181311cf.49.1763127515256;
        Fri, 14 Nov 2025 05:38:35 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:a4af:3f59:b032:5434])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm3659659a12.34.2025.11.14.05.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:34 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH v3 4/4] arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine
Date: Fri, 14 Nov 2025 14:38:22 +0100
Message-Id: <20251114133822.434171-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=691730dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=7LMiiagzcmBKsUgaGM8A:9 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEwOSBTYWx0ZWRfXwUXznfjsl4Dy
 EHHj5+8ppqT7YMoMlCF5hk69MMo1LVvW29LqeZoNPageFXP5dNWRuet/aYcx+A85XuCcaxzGAb8
 DnGlX/TuoB82zDLh3YsXb20QeRmbZOWPYwfABRWhNnQ4KCPIEVtuX0nFFrxxgqYKnfoZSpLRyT4
 6rKlOVGIsL09heGXUMPhILdE3VcbAkY9SSBA4bOn6fwNJmNg/JlV+8G4Rej/Sx62O14W6IFAux1
 d5YT75UOeqZ0UtnL1IVqJDMyoR+p7TyM2jOx1NWpct/CIX0G960gcVK5Cur7v30xpS3gIbvb+8M
 eeUPqWq7gzB9DSq6OAiaSdrzJNyiEBW9rKfwnbKXckJS4USFIWqjZ38m/sTKD39o5hYlUOIIARf
 oe+hudOlLRmv3UMJ96WcuUMOBpIz+g==
X-Proofpoint-ORIG-GUID: q_QyyT8LOSdWwuW383ttLOnP1yuWY6J5
X-Proofpoint-GUID: q_QyyT8LOSdWwuW383ttLOnP1yuWY6J5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140109

This initial version includes support for OV9282 camera sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 65 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..af029d04758e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -144,6 +144,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
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
index 000000000000..6f3d8de950ad
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
@@ -0,0 +1,65 @@
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
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1>;
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
+	/* Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
+	camera@60 {
+		compatible = "ovti,ov9282";
+		reg = <0x60>;
+
+		reset-gpios = <&tlmm 18 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&mclk3_default>;
+		pinctrl-names = "default";
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


