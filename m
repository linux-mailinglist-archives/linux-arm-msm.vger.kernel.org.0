Return-Path: <linux-arm-msm+bounces-84723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDCBCAED8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 05:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9888301791E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 04:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B31E228CA9;
	Tue,  9 Dec 2025 04:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HejLrZU2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOzALkJH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED77C223DFF
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 04:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765253833; cv=none; b=bQpYYebCCPxQo30SKxeYbGKbw6WYd5+Aw7/wyIobK8AWoIkizg4mJdZOxaKjnaI/H9quEFN66KDMcSXOepI4JKyEruL6mZD+FE7WrR6vsrs3ySktcOO7bq2TTLMHWViohL65u13U/BRU0tiHrWKDXGTuVDfGjxvwpzJabYTOWd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765253833; c=relaxed/simple;
	bh=ouV4hu2Ckotx57nJ10BglicB7KhhnLHINmkBFwlrVyA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P3qgahgTfmLUVPiARY0yQId7zk10Li7FU/wK8CFoZZb9rx3Up1+yr78CNSdkNGl6ovfnk8FVC2ZaWY68+X9VVWLoSub3QRDBln7ED1KpjEBJtsG8JZun6fD9Xly+C7VwIiFjJdA2+Tp9r9KxJTbfOnEgu3x+xHPba9fJOEClGb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HejLrZU2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOzALkJH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NX6HQ2715890
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 04:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Rua47TYfgtzBn0mg9klTE9wMJ/ANQb1kuuu
	xs41BwTY=; b=HejLrZU2bfOilJiddAqrbl2MGzNTIVi15Se6vI39pU9mMa5eD+2
	6Hk3CQERXFfhSNG1sZL8rjdDRzJnprg03NT5LW/j0ttP4CqaP8tEJQvdrk8qZOiw
	zPIcCK7J+SZYD6K7mTE1DMAaYI8pByNhuFyTkQL5Z7kPiDBaRDIUyHvopNRwgUoO
	KjDgPc3qB857IYMCblRtWTwQ9uE8Oq75PhmnD9sxWFxwS/tu1dYZarBwCIU3QTFj
	NURJ3HrE/WYdftt4vmi2SJMmSowbVIsGza8qq2UMTfkBZjCmHuG27pI6md4DqLws
	2MHrXQ1v86Gjk8mzkvhB5TILFzDJvVbfptA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwfraqm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 04:17:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34378c914b4so10254406a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 20:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765253830; x=1765858630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rua47TYfgtzBn0mg9klTE9wMJ/ANQb1kuuuxs41BwTY=;
        b=bOzALkJHSSFQN5AfthQwgysMY1kRed0RNF3G+9VMFL7pvs21Aa8N2ATIm+iuv5Pb1u
         y74UcQobSYWP4A+6hfQIvGN93hiDXT6burFzBpXckRwJek4ecxhkxPfS1tRjCmttKwZr
         5dSxGu2ZH7S9J232c47s1KYpJiaz6yNLiVwLVD4yKLwG2PBkpu37DZAxe91W+18gJRB8
         b1wBQv1dv2MvWAqKEISdFO75VM3Aca+uSxsut+ctv5JyID/Csy+3cBrElVPUqBVmvfRl
         ov0GqUhKhVZiLdocsuVrK8rBS9POZXlfkhn06DBvIIblKsu4Znuj72jVCOybkT/0Hbhr
         d+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765253830; x=1765858630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rua47TYfgtzBn0mg9klTE9wMJ/ANQb1kuuuxs41BwTY=;
        b=IyGzrTKcnv17n8s3UB3aeNwTW5f8F7rw7CUMFnT9i3j47Q4dxEqda3IGddF5hYLLFv
         hZI5+khQRoljDn+z9munsIzvisGa0Cb3gGLzwlvcpb/G9O9OfnHBuuLd8nBCTBepDChq
         Y9gnp/VcQRLAOmyeCHzvIC5rIOom1WwJt5qSiTe0VB70cDX+VDk7k26ZUjTyU9NDTuCQ
         QsZOqrgPndNIfkOAh9nTqmqsBwhA3bJYzbxDJntXbC3YAIXZhz8PTg0iTn23MMAWR7mE
         toNumUI+TpGuDdvCKyR30mKS7nlpJxKO/RSoas+fr3FnieC64k2Qq3I6pcR4Eclu6eaM
         JURg==
X-Gm-Message-State: AOJu0YzQjneDcMy2dCUakqXO6brtj3VnuMRAb+LwsgI4L47Gq3UxjU6n
	HozOnyzbmhZGZ+7xvbCag99PWGPLIJv4nU2SghNJ3PNsMzbFl6uFvtVJzs5ia3TRmT4Bo4fPIQU
	1I7PjhiQQEYUEcBUYY8xy3l5OkJzd9u/t+FRhtIZDN5fne6JGr9ZGCLg6+n7H1XLEjoC+
X-Gm-Gg: ASbGncs1PeEQej4zTZcm8zI5A4Vv0dOT34Mk33frTmwWGxtVjsJHKboBDxgLmLyrzPG
	x5jzrX9hMmfNBU1XA5oVELhUGVxxt8atYdM84/tjUfOodofKsY/L+AGB5QVReC6+YinygUUT1gU
	Y5WmsND0SmRlWQwlEHTZrDZssNohS7Ws9JvvxjF5QL3G/DSMY5C2FjsJST0RMrrGo7uyKBcmvYu
	6vkHUABC/VVnueRumXO+jIk0dZDjtSO2Ix/Ac6BwXxw+mpWk0+QOKQl8jeNsO/E6Rtr/dMNKbYv
	ze8wRyPf+azPBBAtPXOZs5FGg0CPgvy41Ngc3Os7Pn158GFcVncOoTmGuKoeviL1DdIzhGg4jQ9
	pBQzuQhLRBzCIIgOlwhpxwoujmQnpFq0n40X8cYA7VjpuGEE=
X-Received: by 2002:a17:90b:4c89:b0:343:6611:f21 with SMTP id 98e67ed59e1d1-349a24e3b08mr7662909a91.1.1765253829734;
        Mon, 08 Dec 2025 20:17:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIH4I/5geCVC6YIqRUZSlBlgyj8wEpwj1NWaFGsXD76bHJvgHvXApbLVFCtQbVQ6Vyv8xPSQ==
X-Received: by 2002:a17:90b:4c89:b0:343:6611:f21 with SMTP id 98e67ed59e1d1-349a24e3b08mr7662885a91.1.1765253829257;
        Mon, 08 Dec 2025 20:17:09 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49af0395sm761256a91.4.2025.12.08.20.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 20:17:08 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator support for Type-A ports
Date: Tue,  9 Dec 2025 09:47:01 +0530
Message-Id: <20251209041701.3245452-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAyOSBTYWx0ZWRfX2fpgtiksiUj3
 FPlqbMaY/8eDRZdE2VsFPviYlSKF9owM3p9VwswfW9FyqPuTGZI3bGI5zxFlUiLPDLsIzYx6dAu
 2qVVXOrIQcXBoNlPmLQsAloSzbAiB7bVjOxL21dPSqnCimHimL2LshN5OqmY5vBIxuvt9fg765U
 2lOtEKvx8Qj2hOmZ/5U4agfPli02o//4UCHUgWNDU0LzXjEcInCDotlIPPuVvU4BSS3b6nGpNgc
 KpuCjK1GTcoIN0jY+aroCnA1ZnQ+diBEjLDM71mBZ5Z/2e8A2Fr/GvixI3cLLPHrxRVDGW7eVKG
 RSXB1Hk7Cwak2ptFy68CvPOvN7nDSgD604oUxGhIoKUuXiUIk0WuO2sPQ+eAXfgSf9h/JVviXu8
 q8YTdaZiMkCdO9q/dfvMcLmTZSfSFA==
X-Proofpoint-ORIG-GUID: yGFBRzAyz6EXKgZrd_LkJY4TUY_qNJ75
X-Proofpoint-GUID: yGFBRzAyz6EXKgZrd_LkJY4TUY_qNJ75
X-Authority-Analysis: v=2.4 cv=fsXRpV4f c=1 sm=1 tr=0 ts=6937a2c6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_BliF1bqmBcd-Gst3x0A:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090029

The Multiport controller on Hamoa EVK platform is connected to Two Type-A
ports. VBUS for each of these ports are provided by a TPS2559QWDRCTQ1
regulator, controlled from PMIC GPIOs.

Add the necessary regulators and GPIO configuration to power these.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
- Re-ordered nodes to be in sorted order.

Link to v1:
https://lore.kernel.org/all/20251208085152.2597818-1-krishna.kurapati@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b..e53de768b0ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "hamoa-iot-som.dtsi"
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
@@ -344,6 +345,26 @@ vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
 		regulator-boot-on;
 	};
 
+	regulator-usb3-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB3_VBUS";
+		gpio = <&pm8550ve_9_gpios 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb3_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	regulator-usb6-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB6_VBUS";
+		gpio = <&pm8550ve_9_gpios 5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb6_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -877,6 +898,22 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 		input-disable;
 		output-enable;
 	};
+
+	usb3_en: usb3-en-state {
+		pins = "gpio4";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		output-enable;
+		power-source = <0>;
+	};
+
+	usb6_en: usb6-en-state {
+		pins = "gpio5";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		output-enable;
+		power-source = <0>;
+	};
 };
 
 &pmc8380_5_gpios {
-- 
2.34.1


