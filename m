Return-Path: <linux-arm-msm+bounces-79118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913FC133AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 08:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15DAF4E525D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BF126F467;
	Tue, 28 Oct 2025 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzP4qywS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B413221DAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761635079; cv=none; b=mq5HFtEOrgrY4V5IhacaHU0/vQYzjrxXbE729E8jyPHILHXdjpoZNcPbpiFQrkJu9dClFoYWDHxzvlhyq4CN6B0Oa7Cx2tuXwKYlCLduBYeR9wDmPrDx5sledtwD2GfK3LdyE+gGcoLqfO3KzkkPK8Mtr6bnpfY9g9E08iaUz04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761635079; c=relaxed/simple;
	bh=AYT3RVzsICMpupLHCjCVqyv7YtWQ3D8cjixobbkFe+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NJCh8decx/fkPUP9RlyxSEK/8GuH77PCrhs2jp/T19dN/TEMhPNMH6YjA0R2rzSAw3MdYWSAGpEzNrZ8YzRQ+dRRodBvVwOjWXyBwDGua9SYeWQPS29F6DnFqL7j6nvFyINWkXQDEdZE+Be/bIUAmIblW4ugrGGbQoPhDfBTcTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzP4qywS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RKjte33813156
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 07:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FmwXGY0VP8BuzjMKMv6qvB
	O3JftdefFSQp4wgibsrNI=; b=mzP4qywSj/KO186n/qZHRJquB3qVzJy/vWtzJW
	0HFpfmdBzNUKp9ulGxRmv8sfgxV+F+cK/AeyXB4y0tY15Fp/QPVfNJJTyPFEfmSy
	aMAlh8XH50Cad7QN4xyjvdb1aJOkkGTAKB32cVEuvX5fuwgXm4N1GDS7zeHSlKYu
	45mpIV3UCtr6TKm1dCOdZIqKjxTOR6Q3niVk7fubziZ6Y6kNa4g29U7UThnc6mzE
	H2/GpTN4eTnedDtHOz0KgCJnsfAHXPxu5XxOlBiGYIZHbsqVpUb0qafqk3rIctyR
	N8k4+xXRxIL3O/OcDbY19SszC+47rbmw8tj/PLrurehq1Mvg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2g2fscva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 07:04:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-792722e4ebeso5118764b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 00:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761635076; x=1762239876;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmwXGY0VP8BuzjMKMv6qvBO3JftdefFSQp4wgibsrNI=;
        b=UtDc7dZMXxqe+EMPsBvq1GYtrDMlbd7sJeXxItvEBK8Qfz5aj673ojhvmJfyzqmfmS
         W369su8H1KcefDlwvX5Oec7jmNTOJp4VfJb7S1NiYxW0DU9XpEev6agzDi9iEJk4O0k8
         xroZg6Ia4+DoAtpxBQWii+PEJHxXGShywETN4VIj4qcnpdpv2l/WQsZjX5zcuyfyO1mz
         lcTQwfgTKCI/TM7GS5QQFOgatz3CO8sVbx7A1CLjw2KuKTAtxi9KWhhROHkypQ8arUSP
         4QGf+A+AMSz/vP4PeCMSXUt8ToztOFwDQmZbaY4/lW05kh422vz+OGAAsV2LJdvZ3ddg
         Nvlw==
X-Gm-Message-State: AOJu0Yw6yHnE8w9vYXicHDJt5gR7khlWCiFORfZW5OObRmHCGk+vqrk1
	kSIlAs71oia91ZCzX22LggtAl9kkQTu05tK4KZ2WFEG6Ox5b0+aYno/xofO6tGGT/1c6CA2wMER
	0kUPwsTUugdHHhEnMU44hXlZ9gA4WiVoSpZ/3A/HsVa+wC2D7i7QYdxIE0qt08rlIwu8T
X-Gm-Gg: ASbGncvSel6PfMHWixJhswnWmNqYKCU6SGynv+0/gW6vJGmK9KaVBh/B5Kgs/Hduyhw
	woLIu0Uf9Dhrj+CE9h9ExwLTu9mIXM5Eazn9CeMsMIXhyEuR9FumRSG7ncizHiHntD8bXQ+sIyu
	yH0P5OANBr8JJA2L2WYYalLMTsa0VIPe2EjBQeda3flkEztMVOUOrtCL4fWTcjyBgIfIeAh39R1
	nwsYeUmfIXrU4C6aAK6BtN9EXZhvfb6/cB3t+WhwD0fTdEA+xUp9r5cvZ56+So6+RXAI5KHPjg4
	Vv2ve1kw8yq8OPydIlYQQ9tW5IVfec1FxPDs2LEOSBWUhqEHtJPrLG2sY8DYyu7pF2ifdIcumcm
	56yoxr7joIDeu0bPIA2UkS7AW8n3KIRvGHAA0Wp9yQ+dAgQJXpzAZftLXIZcEBBN1b78pcXw=
X-Received: by 2002:a05:6a00:2b44:b0:7a2:6caa:38b6 with SMTP id d2e1a72fcca58-7a441c5feeemr2192869b3a.29.1761635076535;
        Tue, 28 Oct 2025 00:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv9hWQskoOsPqVsxZXg35dKJmU8ygeh5oH20cYyBIOZftSEP3su6q91llCCVtocmFxd0LfKg==
X-Received: by 2002:a05:6a00:2b44:b0:7a2:6caa:38b6 with SMTP id d2e1a72fcca58-7a441c5feeemr2192845b3a.29.1761635076082;
        Tue, 28 Oct 2025 00:04:36 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414065418sm10662426b3a.41.2025.10.28.00.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 00:04:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 15:04:26 +0800
Subject: [PATCH] arm64: dts: qcom: Add backlight support for eDP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPlqAGkC/yXM4QqDIBSG4VsJf0+wU6Z1KyPCjseSrdrUxSC69
 8n6+XzwvQeLFDxF1hUHC7T76Lc1o7wVDGezTsS9zWYgQJYCNJ/NspnB7mkYDT6efpoTr1QlQY8
 KSRHLz1cg57//6r2/HOj9yfF0jWw0kThuy+JTVzhlodKaiBDqtmkc1laiq8Aq0Tghy9pBa1Cy/
 jx/iCzMobEAAAA=
X-Change-ID: 20251028-hamoa_dvt_backlight-373528b7ce7e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761635073; l=2798;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=AYT3RVzsICMpupLHCjCVqyv7YtWQ3D8cjixobbkFe+4=;
 b=MeacmXm4s2Vc6Tv/AqoCu1wPSkQUq+YAckqk0Y8QOTdRpiSa6cCzG6uqyC8z0iK68h42Q2fhb
 s7tosjseM7GDR+jFL0bhE+J9Gp2Qy9FqgJB2h82xNNe/QikJ4T0lN32
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1OSBTYWx0ZWRfX9RKXvykFj7DJ
 L4/JOlrtIPMdHRJQOznQTKJBJHMvlNqLVZ/E/zFEyj6xx/licUkj4nJ77sJQFJCehbkhk4CZYF8
 bd4ngbZkiLQPbaMznrcfae6z0WVIJrw1bTYo19lsLsk/3qeHfyWv0hQ6J6nqJu8zFtRZZ7MrHJe
 GDS2AdilUCkvnATF2v38gRAmUXg0p6N5NnvZ6gJAwnxtEsqm4wrlsXBhNanc/CrjFdeV6UO8j8p
 H1KiRD+Oj5GQhghncjY+uChE4LaqDIcEL9tBM+RVwoPME9lUsZAriYaHIVsCIvQg64BU8jSyzQb
 bI9k1/E3YWZ39NVK6c5aSeWGWEB21epOou4BHsaq9z8iQxnW/17cPQeJ3p6NjNua4YkppB52PWi
 seRvUTm9h9YQ1OK6tP3lDpF/PddbKg==
X-Proofpoint-ORIG-GUID: 45fMcJqKq_ATelSyLfy-poABAfdglnNO
X-Proofpoint-GUID: 45fMcJqKq_ATelSyLfy-poABAfdglnNO
X-Authority-Analysis: v=2.4 cv=FIMWBuos c=1 sm=1 tr=0 ts=69006b05 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=I4knr0C1cHqesIZZmIQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280059

Previously, the eDP panel backlight was enabled via UEFI. Added backlight
control node in kernel DTS due to some meta may not enable the backlight.

Aligned with other x1e80100-based platforms: the PWM signal is controlled
by PMK8550, and the backlight enable signal is handled by PMC8380.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 55 ++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b4650b7f8ad2c0cd22212116a25fe..fda1b3a3c7673be74832c27849231cba4bc1f25f 100644
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_bl_reg_en>;
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


