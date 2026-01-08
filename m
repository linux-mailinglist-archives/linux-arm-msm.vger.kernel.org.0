Return-Path: <linux-arm-msm+bounces-88124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB23D0545D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 18:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BAAB33A1122
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 17:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E75C26560D;
	Thu,  8 Jan 2026 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjzIQFeV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YR921VKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312ED1D47B4
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891963; cv=none; b=jgyNtsq6R0sPQy/T9YTnITbDhcqzDuwyGZJOC7bxP033aeiRPWYl0UOk7aLiaQ5mo5Hl1JWJxwwNJo08WPkooRz0uXzI/6f/YQd+WvFvHItHJUDYaCoxNJzGJARfa+4Kib398aqHYG2wmeBwKP0CkZtD5gEW5bqDoCLCJwCWWi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891963; c=relaxed/simple;
	bh=m61eMS/4Zf1kuMzQQJkinZ8IQRWkDw0yg3iKL4VHoyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sT+voA5drQnjpenHxzZGfG6uG4jhC4CNC5rBuaO7beTTJbo++glOoqUlTbX9unxSyFhbAw0NuMGNvedW2P+9NEtR7rtH+uXUhOJu2xUDoC4bI0V4egm2YEMC7eVG+f4JKh65GIH6xwNLJJ8TFwzEMz7AvPI4EWHs4TObW78cfww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjzIQFeV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YR921VKt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Ahvb53701055
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 17:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=poTbLM0qPOc
	Pg8sP6szKFYdlzJPOHxetHWTXDuuHwzo=; b=XjzIQFeV4dPnIHd78Dx6CWf2Gib
	xJ6Z1o2lqod0WNAiacrH+mNVF/riXHYaUHLrAShekiJFqN1igTh7nRxehVbcIJX7
	reIEHS7gNu1P/p+H0Qzj2XoGivt7tr2t6HS9GbcGiUgRx4BLKPiQWBwPAjf1Ujl9
	HS4kUT0N/b2SaX6GjiwjkRQFZL8ft9LCVXD24mjJSIGRvgsK+M7HfazKfq8v8UH6
	KJN/vkW3clIbjMm/2RECiwQXwljhYDHFxnwUSc8o3v/F8aXeQBZXVt9P9hPZwVzN
	pIakfd4Z3xtLFYaqfgZe0u1OzK2DiYGrd3dyu6Z6B7voidsQ/a6vEEZZHvg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjb39s67j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 17:05:59 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-563642dd79dso1078e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767891959; x=1768496759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poTbLM0qPOcPg8sP6szKFYdlzJPOHxetHWTXDuuHwzo=;
        b=YR921VKt/Jx/8F80H+bTDvjSuZRv2Q31B7qBbhhUfVjc4mxuQkiMYvGmQdq9MuzqoG
         NnMkd3q088mg9B++fA2xo9Q/yZVHhwBtsXbuYUlqgqPLU1KdoOwBh3nsi4f45rAjvd6f
         yk/SL2i02egPQzmZYjasoVvzojnvudPQw2DSnXX1Rdc2pG+awn3tZWCE0pAjuDNDvMJW
         cyjYUIbAWO71+SvOvLSp9FSeNZk4vOhkDvT4ukSXHn0GyvhddZUYeIEWjEJg5AZJg7W6
         Hbd2QDVklYwpJIUWQFt0Wz6QyPP0JAw6pxq/dv2hS3dukXM6dgBbVnej8Lw4vy3Vt3aw
         vgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891959; x=1768496759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=poTbLM0qPOcPg8sP6szKFYdlzJPOHxetHWTXDuuHwzo=;
        b=EvGkB23prHay9gd8Gg7aX0XjVInpMjSPxfh4p8YYBsccVibPX1cRc7QEqh+5fyx9fw
         jA1uIl+pDMDTM7tbXP2wOWcmmE5YnopE1JGYWYXW50z+bcMfMmAEpIFIdfThzEEuu4hP
         Y+47Qd+ptgMHgROcv1zoBOhGVDJ9fSGk4W71tT/IFs8B8xkAl/F8HwgX7nymPqq/Bduh
         uMS9IXBjFwSu5FZawGiXSk1PWztjUUyIfo38rD8w0rpzTOussPxLajUjqJnIGz9PsC34
         u5iIhcg27YXmjQ9yAzkV2Ukwisuot2lPxiAovWZwwDX24/dXJ7gBv7BsbEoszrGmY+JY
         LbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwgMduzCnYulSJTrLupQxnUVwJ/3Pr1//W1oN4++wehH2GjZXWDzq28yH6sodwx4cTb/6adekYBy4h/WH3@vger.kernel.org
X-Gm-Message-State: AOJu0YwUUc2tK4tsvhlaM/imVj2wByV30sOL66x0/KFhxb5DZFBYHQ8A
	/OP7bzHR32Yw2HdgxGFIotpOFozxWL/i6+8g6YK2bjoMgIvhWuDydIHrzbDV7ePwzIw0+i4XJNk
	RhR6SMXbNYbzDWq1P5Y4uezEzSqX0ic0FBl1KVFoEAc+Iyju9vD9wp4nIAQ7tFrPGt5GL
X-Gm-Gg: AY/fxX5ZD0jmv2MArq/22FeJGjmZAd+1nc2ctGfgB7z63C9GTCroikPqCtHN0O6wlDD
	yB/hszxdCue/IekrpNnlCh7+KDUQn6J+VACd21vXG8NM834k6WZX7rh+exqbMKEm9ihg18OpxcQ
	Y4B8ps4GcrpXMMI45JoopFxmSxkrrQNk7NCqaN483Afzv4HyBcFAVrEiJSIIlcEwpSfyNT+6neL
	ZtBRejaGj3gdbGOF6fOwJFzoAHb0CAb6yL66+cfucmU2J+jCXnN3yegt3o6tBj+YhguPpcbcXen
	QKFrgY2t8bEMdHQZOZ7o/wICMRrTJ/SbsPMfqH4aMdN/LoI4pwTbxuUGHLwj4XoH1EGVjFage9/
	jPPmCPwbr/p1gGHzOoxrdVNqjQjSskvAqVljIoDTy1YEmPBXcCZd9isNJTPE84ymgsy8C4Blg0I
	C5
X-Received: by 2002:a05:6122:31a5:b0:544:93b6:a096 with SMTP id 71dfb90a1353d-56347d709ccmr2033201e0c.8.1767891958775;
        Thu, 08 Jan 2026 09:05:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb76LfjrtNIkVRqmQVTFXCumyvjfN1nLseaAzWjXeZ0LJbchDS1VZTVh+FseS+F4udfSN4FQ==
X-Received: by 2002:a05:6122:31a5:b0:544:93b6:a096 with SMTP id 71dfb90a1353d-56347d709ccmr2033142e0c.8.1767891958322;
        Thu, 08 Jan 2026 09:05:58 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:211d:6051:c853:ae97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2cffb3sm856373466b.31.2026.01.08.09.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 09:05:57 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/3] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
Date: Thu,  8 Jan 2026 18:05:49 +0100
Message-Id: <20260108170550.359968-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
References: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iGQ81cF40Pp73Nx7oiC4hZKzshoMBGsQ
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=695fe3f7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=XkKmpa5t3BpS1E1QlwAA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEyNiBTYWx0ZWRfXx9HMg7bcpu9H
 m8oNjSKQg59MKYWw9jLA8hblgOjZXmASj4Q7t3zMV7jIZvaVitT71ORooiL2JdA+Y1xc6yUNgxC
 nS4hjw2OiLV0Rs1s5SeWAijiPrtG/xVWsirEP1nh/c1rhI80iBBP7xnToaZztsp/JJE4NfGOCee
 ThDc4tngUGMvyuVThxK29lZ3vy342JtMtcubHeXpuCVuuLsghOD3S1cJ5BWD4d6qbPb5UlgEvnw
 qsaYp3q/0necCgcYFaiZn3V77pXzEnz4qjzSHVcJu1NVmGLLNaXjzwD6TqQAARj+1LPIRmCjkJf
 6X2GATH9Lp1urZ/dPB7FSadbhv2wEBfsEzpGpw7iTXQjvjuGyBFrrR0GWXA7dLFRebjYinU5cKb
 yL2KhF+pN4oltl8PA/JCUD33xNPKJxt7YPCL3cIbAAGmySGWNT5tVnkn3uJ0nRp18Rh4mPdkyYa
 4JyM2T/85qnzMcZVqbA==
X-Proofpoint-ORIG-GUID: iGQ81cF40Pp73Nx7oiC4hZKzshoMBGsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080126

The PM8008 device is a dedicated camera PMIC integrating all the necessary
camera power management features.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 75 ++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 1b9ca957a94b..9814ac4896c5 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -267,6 +267,81 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm2290/a702_zap.mbn";
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


