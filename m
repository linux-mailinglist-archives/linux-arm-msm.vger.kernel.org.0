Return-Path: <linux-arm-msm+bounces-80525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEB9C395BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 08:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDC601A42DFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 07:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163562DE1FE;
	Thu,  6 Nov 2025 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/RXZj1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLnV5JWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564C2DE1E6
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762413205; cv=none; b=M9lllEtHNQY5mHue7f16aYDGK49uvs6+UO/gpPvWYOqYjkDTKWTcyy2QKJeOBTJjBCpJersxKoiRpqM6amoQcVW785IRQHLveNAlWWsfxEAweZneN1A1yGvDikgKi/+O/nWwr3mQzSLdt7r2nXDxZ3xtB2v/dBLXyqshF5iOPns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762413205; c=relaxed/simple;
	bh=MUGcFi8GfLNzzEBwGZDoyqGOApQoP636XmrpJ5mjW6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ErFbnLcdUlzh8YUVWkRt8ihsbRTdVPViEVZWYeKg9+fhSMQ12Vsc6ea+4KddvyZhY56+CNAOW0xinQ0Ywz8q7IUMQCcDANBg9IuZ+dU5VtkBaK02bENCmbgsCr8j5VUKdQQQokDtJj/3LZGalmC+CrLjIdfdnbxd7AdawWHnZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/RXZj1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLnV5JWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66t1Hw3155448
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 07:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=znZSjjZAL2HfRIU8aaSNx0
	qfDJdY6dUmHrDxE+rc1Cs=; b=i/RXZj1D6AhwiIm/bZPbnaKhmlIr+7ljE4mV24
	PMUcatQUDswwDxQkZN9zl4gz/HeCiP7KNZl9jHHM2TiWw5LaApy9ylF2RlKZa+NV
	kcR1zxUxB7LVQyUw1p6BhuOlisQdHxhVXFvzPrMHhztaI9WKybuxBg76jUVxEohS
	0mxPs4OzsNzvtGYSslQsaLM2aLGH0sNAMb8N7758hafx1Eaz3Vw4HP4U5PzrH+zM
	WZ1KnVzGhGyZySQVbhQ/DC/AgGtvlju10wBDZAkC732lEAB98vkL9E9A9T86UHIp
	MIgrFEcHapjyGGnzUPbqiHzRe0EF0SioCGPbvmQH/KvTEA+A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8pu0g1t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 07:13:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26e4fcc744dso104535ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 23:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762413201; x=1763018001; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=znZSjjZAL2HfRIU8aaSNx0qfDJdY6dUmHrDxE+rc1Cs=;
        b=KLnV5JWy8+BYPFMDrUWFG4fYcPPstPoIJnGkFAnegQrmoGvTiszvmnhMfEvwUDG3pb
         gDI2djkAjQ9hOdgOtyjsEDMbz8PSnHjomvQOJggqSi0KxinWweKJS5H4ALaAfzCj48jc
         k3xhRnsRfcFMw9ybNIw7RfGnw7mAMK68dFGqBax2rZLEqOJYs+4tt6Z/YyvhXbPexBdt
         c3reR8FqP291dXTT29cTjvs4RH5FHqRmBHWfTKLYy34qQdRIlUoB2EO7ypa6l4oOiwH4
         zxNfghbZOFkxb/VTmFCX3hVodNN7/MCOCicO45NAYJD+V3qESpv+gjX3kfhzj0PV+rZy
         42Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762413201; x=1763018001;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znZSjjZAL2HfRIU8aaSNx0qfDJdY6dUmHrDxE+rc1Cs=;
        b=f8jAQs03cKjDphUpQJSdl02DcQF/w5ngTJFJ88XkZ0cREMOxVyj9Echm1+eqW0wbDf
         v8FUj1jCOWXYlFnLHfpeGb0gOxi4L3UYcGmJ6s+hmG/eLFVu1iVkYD5+MqTRRlVQvq2D
         bTO8NYH44Ew8uev+rxEC4hGIWkDefO0lJYkN83EnF3j5IjB3HxCp3DKGcfKZlIy4EFOr
         cx+OddYt0UBav1TwJilxRblrdj3fcDqkgEiujqit+OfYiEKuGCm3c11InVZyNfJXYA6t
         L4WdltcD8PF1c92N5O+AbmoFiCsxW2tkxfI3HSTQJtXEVvNuQsoe47GHMbmj6X1/ZO6n
         +bgA==
X-Gm-Message-State: AOJu0YzI3+/PfWsCOMsCC5BzX8Ps+aKHl1jAzNsOUqH5F04ZC5dQbN19
	gkbD/wDaoaYRVdQJAEY0XDjUxc75dxFCeqMeaJrryY2Ac1WnSV/wrAvk9kXjamalTFuGrVsH6pN
	CfkOPfpon46/14GcrpWe+MBWbaolMefNNn0HgDb+nk7irbbF2WNp+f0SfCPf3z7xLRjbX
X-Gm-Gg: ASbGnctQeAOaO6LPRa5CnwH9jXa6NZcuJ/ySL5fSaNH9jYdX5NvbsMJwK312sV8NcBG
	YlWAGLTRS2iVektEHW7pT60timajLjA8cd0zIatJ8oRwoKYa4LJZq9Iolbgmm7Ty2Z0QLCBu4Es
	7zxe4+p0OxhSZElQB+7niQ0v/FgsuqN2wBk8XFNwXPT9EwfEVxlNVCUODGD0VbtMDeqvlKFH3m3
	5dv7Lx6ArETjp9UUAiqODrk41x0ySeLnI0k+28oMrzMLM6tSXRncrPOMErS2KPXc6X5f/OsTXH6
	vqC639ersSQcK9dINaBHElNcZqQhpqt/z2LbjNnOoU3O6K8VXsL1jjiDrLivTx9vFmYIUvg/0hy
	/IgI/O/wiZa0d1PPXc4YQpvy094k+GrjWdoo+XdRZ02UyQZ2UKkHk2C5KZGVKPs2V4HBu
X-Received: by 2002:a17:903:1247:b0:290:dc5d:c0d0 with SMTP id d9443c01a7336-2962adb293bmr82518765ad.49.1762413201081;
        Wed, 05 Nov 2025 23:13:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG98/DJlkUkYzeeGj7g55hc9OSw60NHQU02P1tNEonDHlN/Oc0x/3QUMDOzmeriv820I/ALJw==
X-Received: by 2002:a17:903:1247:b0:290:dc5d:c0d0 with SMTP id d9443c01a7336-2962adb293bmr82518375ad.49.1762413200570;
        Wed, 05 Nov 2025 23:13:20 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5caf1sm17227635ad.34.2025.11.05.23.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 23:13:20 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 15:12:06 +0800
Subject: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add backlight support
 for eDP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-hamoa_dvt_backlight-v2-1-9f844c8f8110@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEVKDGkC/32O0Y7CIBBFf6WZ58UALYX6tP+xMYYOgyVrRQEbj
 em/L9b3fbnJucmcuS/IlAJl2DcvSLSEHOKlgvxqACd7ORELrjJILpXg0rDJztEe3VKOo8Xfczh
 NhbW6VdKMGkkT1MtrIh8em/Xn8OFEt3uVl08Jo83EMM5zKPvGaydbY4gIZTf0vcfOKfStdJr3n
 ivReTlYVPB2TSGXmJ7b4EVssn+3LYIJNmjC0ThuHRffMefd7W7P7/e7GnBY1/UPwFLfVQkBAAA
 =
X-Change-ID: 20251028-hamoa_dvt_backlight-373528b7ce7e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762413197; l=2985;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=MUGcFi8GfLNzzEBwGZDoyqGOApQoP636XmrpJ5mjW6k=;
 b=gLgELKm9Dyy46SmXQCftAwpgJOnBc2lYZua+NCpJ1uPluUUQSs8Rh7fMHqda0ItNlQl2bW3P/
 KBtJTcTbUMOBiZi1Jr20l5pGusNbyWAvQvwMJn8DfGg4fmq3vI5/5r+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA1NyBTYWx0ZWRfXwTZT//tc28zz
 41TmJ1AtrTwdViSSGF4nrDiek+BNNQa5kFZVq344OzvV4zf/1KoWAS3lkkxnnwCOsj/ba5jNr0q
 YnPVlNuN32rXr27OiE5HKdK5MZJ6GHxaVszp2hrG4QWIW3sJ4o8rIT0umQLy7zUJqCQz3NlCR6C
 UtX6myapGqJE/bv0JVSSDryiMDhq7gh6/S7jq2KTH0utoHA86/y8jTkFbOKJQHTKbR7a0PsZ2gH
 8sCPEf4o8ykA7xNAgD14QA0GDewkhJVLcF5/w3tDD5Sr/5iMp5sDh/EnFXoBC1q69GM0dN/KuLz
 597P/u17b3GpqxGboPIxvZE9ftXP5kwx66rnZwcFXLSuVGP3oNF9himsqym5Ct29OZFUnNdDrXf
 +hrPZnADACP04AlNZUt5oj/fY2gpjg==
X-Authority-Analysis: v=2.4 cv=bIYb4f+Z c=1 sm=1 tr=0 ts=690c4a92 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=I4knr0C1cHqesIZZmIQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: gvpzApxip-2ljWyO-gBWjZVc61yo8BM9
X-Proofpoint-GUID: gvpzApxip-2ljWyO-gBWjZVc61yo8BM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060057

Previously, the eDP panel backlight was enabled via UEFI. Added backlight
control node in kernel DTS due to some meta may not enable the backlight.

Aligned with other x1e80100-based platforms: the PWM signal is controlled
by PMK8550, and the backlight enable signal is handled by PMC8380.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v2:
- Add hamoa-iot-evk to the commit subject. [Konrad]
- Correct the property order in the vreg_edp_bl node. [Konrad]
- Link to v1: https://lore.kernel.org/r/20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 55 ++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b..454aad40de34 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -17,6 +17,16 @@ aliases {
 		serial1 = &uart14;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -183,6 +193,22 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VBL9";
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -819,6 +845,8 @@ &mdss_dp3 {
 	aux-bus {
 		panel {
 			compatible = "edp-panel";
+
+			backlight = <&backlight>;
 			power-supply = <&vreg_edp_3p3>;
 
 			port {
@@ -879,6 +907,22 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 	};
 };
 
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>;
+		input-disable;
+		output-enable;
+	};
+
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio10";
+		function = "normal";
+	};
+
+};
+
 &pmc8380_5_gpios {
 	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 		pins = "gpio8";
@@ -890,6 +934,17 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
 &smb2360_0 {
 	status = "okay";
 };

---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-hamoa_dvt_backlight-373528b7ce7e

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


