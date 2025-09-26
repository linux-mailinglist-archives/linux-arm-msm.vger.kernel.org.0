Return-Path: <linux-arm-msm+bounces-75275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CF5BA2CFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C23A23A2D15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AA6288531;
	Fri, 26 Sep 2025 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXagsmun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5E272803
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872074; cv=none; b=Ofp+00kxvTJNlPMfD6fN0bjhK4cM/y1YaqdnNswBu/kzQ90fc7sFRRscyGCDqIjm3WA9aUWljk4c4dI2LQ1hLbVnbG2y0deqMvSR+ccvlvQfhZ2xp666rf6Kn4IHhKCBJIuYuRtQcPq0omuEqYgnVxn6gjNalwYDHIv/t0LGqyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872074; c=relaxed/simple;
	bh=eTSQJRLNVpqRNk7dZulLnwyOVl9KiWPfmgcL8ODH1AI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WEAxMwwlVayYmRy69LqII+x8uKLTa0eoMxX5zU8xqZcpwfpJScDnnbW5UY6wAZRZqGFvz0IZk0PIPF1Nl2h6zWEomdiW8tnGv+6okEeQJwB1VE45+M3gsQ2G1RR+031jvoQAunMqCYOrnPrdnr7sLt0gpSyN5/13a2p0p6Wvg2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXagsmun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6ocab011374
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaIamYDiNSb
	0xXfIe7Pmy/TEDF0fop9c573zzDyPXZ8=; b=TXagsmunZsqR0v5elepNgn7/Qxm
	4vSct0W6uCD4wM+z9XkMT/+eKY9DJKrdE1SdOKyScZYxsST301r9Kbuk+8GJ7yZf
	1ecngVDRQbeWaJV+Nn5VyklD9TyG62kLgFQdOsonQ6Ie1dwUOEpW/FdX18Tn9nnG
	00V68MV9n9ew4wDqu+pZIleDToUyB0vzYcLU19inbKeviCrw0oDgTWx3l/iBPyDy
	oPVP4A0RHxmiFbaPULjlm3yd5TzMBrp12YSDuonmcY1wMW4OysATVhDBUtn3Pcel
	+FPgbAX0uoBkzjr1A+s5bZDaOCpbv6je51SD+UTga43UbprMAtkbJzPlP0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q1x8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:34:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d6a82099cfso47284891cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758872070; x=1759476870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaIamYDiNSb0xXfIe7Pmy/TEDF0fop9c573zzDyPXZ8=;
        b=P/pQlbz5zcpvsG860HTdQN+OoF5EeVo/ShTOW9bCEsroQD0x8iuzWUqZWDhyVfkgba
         xyhQYdGMhUYf4YJrTArapFtX1EPB1N8X9doguX6nawh1CFXH4J76iEN29KcQ16I60Sty
         Xrtq4XjbXYob2sRL9rQY08Hq08CKQ7u2jIl/aXklCriDkaEjgM9EXnD/FUlHwqeEGQIZ
         GvncYMV3O3ehuEju4/C9E5BwOVWwlQIvW8UxbzetpxTfnZedVcPq0hqjCN4xKn0NvJ2J
         XIXIA/rrElv7NfD7ST52xWGZU4G26FSTPLfss+w/h287pc9Hv3sshZqHnV/Lczec/WFe
         JTQw==
X-Gm-Message-State: AOJu0YzftpPmQ4CgwKrcIVjtRuhe7wRtEwBXPP7BVusMiA8XAQTZwQBD
	ZMqwj7EkGjuk+pAbXNBgtudfOTZ+MBv2j8StY3i/I5c0Kb4h57wH4RAQmYzlBzpcEbCSm+qLGgK
	XyWHBXrTtA1UQSGoYfN2FNlQ3mb6qUCRHrdaFXEzMart7XVUKPhVlNru/R2nyZb5mBYeC
X-Gm-Gg: ASbGncv19y0V5LtRf4VBIHouNNMQOIjSbvm50JFzp3WUF05Cd+LznUWOgpJts4OFJ4L
	ZydUutEbZIPNbvv3sFJCXRaTh0gIf6/qOBTswQG4ndsgdyIfttyWpbbW35PydE1Av614tZ8G3JA
	HfmEYPhC5kkfBqe8jXLTIhzLjKKwn+ZBqlpcR+/3p3oN/mQa/2XZfjsPdGWN3/tEVciOoM5Cfkf
	Z2V8hYneEhALQSJTGNLbuAXlcqMLY4CMW5+z27wz7JQVHMxpJR5w6ScXXzI6jMsNUl1mj/Hhzig
	YO3TAAj6ZzyRWWFZInLxwqgSqL98fiqt0574UX2pLugzo3xtb96NObGW8E6PvQvQTPox3I5PDd/
	CjEcRw6ebN0sL5Zk9DRlf3hAe7Kze
X-Received: by 2002:ac8:5213:0:b0:4dd:3871:93d6 with SMTP id d75a77b69052e-4dd3871940dmr21090171cf.6.1758872070344;
        Fri, 26 Sep 2025 00:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEomDHwnqrNgSLZa3d9+J9ef+aR/0pZimtQ8JtUbDUBZgtnI4UeIiqdjGrrF8Oxvj4gdUm/xQ==
X-Received: by 2002:ac8:5213:0:b0:4dd:3871:93d6 with SMTP id d75a77b69052e-4dd3871940dmr21090001cf.6.1758872069828;
        Fri, 26 Sep 2025 00:34:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:5de9:cd6:92fe:bfb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a54sm320481666b.86.2025.09.26.00.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:34:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
Date: Fri, 26 Sep 2025 09:34:20 +0200
Message-Id: <20250926073421.17408-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: geKXxmuBjcL5WiUNf3xjZmdB0zMhcdj5
X-Proofpoint-GUID: geKXxmuBjcL5WiUNf3xjZmdB0zMhcdj5
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d64207 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=XkKmpa5t3BpS1E1QlwAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/6rwzRQ4BrHL
 KYGO86PpfqwvnFZENZSd14VWm8+G3SrqBzU9QuwYtPXZrdfts81tkRMoAciFrujf4GhK9A5RM8B
 r1x+t2wsU5C3zrf5ljOqkwhPAmOcn6EqbYSAbQFohhH7Hliagjrg0Pl66L35gDPcGhJCU/AWpMu
 OSQkX2hFJRefH4nvVzAy5hMYXQCiNhm6T8nybnhkS8WTOGnXxyMUlUWEikzoaKMrx6W+UsisX/h
 FUB2tMRT3U0drEAa6PRgOinWgCqy1rNMhqIruNfALHG4LrnTWRnGRZ57Ig3AibgULJUwaFzYQze
 DVRnsrBhC4Ngm43YFrbFhx6EA7pECaw6x/Z+Scf3vroMsggRjbO9i8SLLDrX8borlkPM0TTSKaA
 Hmmr3UkvXQWB+yWpg0Gd/nF0jaiPRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

The PM8008 device is a dedicated camera PMIC integrating all the necessary
camera power management features.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 75 ++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 67ba508e92ba..453e81412c5c 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -220,6 +220,81 @@ zap-shader {
 	};
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	pm8008: pmic@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+
+		interrupts-extended = <&tlmm 25 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&pm4125_s3>;
+		vdd-l3-l4-supply = <&vph_pwr>;
+		vdd-l5-supply = <&vph_pwr>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-supply = <&vph_pwr>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		status = "disabled";
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3404000>;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.34.1


