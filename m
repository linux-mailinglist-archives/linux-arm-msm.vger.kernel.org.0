Return-Path: <linux-arm-msm+bounces-86159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D13CD523F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 536343027587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660BE25392C;
	Mon, 22 Dec 2025 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpBs0I1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcpcYZP0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0226A30F815
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393085; cv=none; b=fK6Tet+hK8cFU6PzLVer3OaM/t0OwhPFMqZFn36/PbON2Hp1JQhQ4RDOZsh8gRMcl6edxDwg3TusF/LbUi/HxgMXk76o1ZYFZd/LIRxROzRzJJvbTv5Z5r1co7IWESMWaA/SbN+5d6UiyS2WhFRl/B5NFYqTpen0RxmBQ2uyi2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393085; c=relaxed/simple;
	bh=7gt9rdF09zV26dKn4AfD3LmVSrsUIEw52Kj+U95nasM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hb1fo6V7+tgLRUsEzyXV2F4ILI1HQgS7GjTTJnpTA3HnueneerfXqfRtziXCzXysd4u/5C6QnShoY/m4aKXkFCs+S+UcoQl1UCqbwWQE0TBT8+THPxh+o2S72uvlPTzw+7sRICbSK9h9hRP5liZGP1esOhbedOMEedujtuYyTyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpBs0I1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcpcYZP0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7ihkX3259704
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaIODbj5t1Vwb3sIoyQXLmOt7BQTZsz3mnUyS7+qz0U=; b=dpBs0I1LCHEU2rs0
	EOG82+zeOsY2iZupZomyyoun5t0nNMMNrMz1+zpZ2GT4kxYVfdR5coH9Xup7toWa
	x42nfrgPIebLaWlPuVrP0JDv20V2O0K60FVdmw6p2WD24lvXYK1z6HSXFEqn9Dz+
	cam849DJ+/0UggRVn/3kdTdOdu4FG3316HNbHFkUe/Csbu1PVp4cpXU39K0B5G84
	2dKiVthVKZscKxJNJQ4xvptd5tHxnhy6/zokC/Tcvo7ZE47d73CLBd9YWNb04DCi
	R1l+dJskE0c5YlliYwEhDVgLXUrI3+VrHMVebLRF3HQohLgIneoFeN5jKRibNGG3
	mZfJIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqmchf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:44:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b51db8ebd9so1210603985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766393080; x=1766997880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaIODbj5t1Vwb3sIoyQXLmOt7BQTZsz3mnUyS7+qz0U=;
        b=RcpcYZP0L57X7XSsuEdYuGBgha+agFVdBjDnExs4Xa8qV1qtkZJ9XD4CEzTsP7X80Z
         7KQYUngGAC3wKr5BS2/2wyxqcGlBMTDFsU27Q74rTrUWROFOwNvNoGCVfWpCT9JdNEfo
         +69z2onlGau3V4n9eETOjJ7ayL5RiUn/rVbq3M0L8ZLC1cWY6hT5J675y+jBtEED1UvR
         qDmTtWJE7qhRH1EIslphwj3P0XfhXIju3lNMroRlQuImb2pHryfugSVfDy9cJZM/BbsI
         2HN0va1Qgb7jXwqM2WCB7E0ghDuAdrDlQ92VH5I243C7PvO4VIyIQAVkqxwmLO1K/Edu
         9/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393080; x=1766997880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BaIODbj5t1Vwb3sIoyQXLmOt7BQTZsz3mnUyS7+qz0U=;
        b=dI/4tGWxTViFRAi/dDpprpVqsxk+t3Q9fL4yyBBu5o3nqkwen+/fagqT3atgSajlYA
         hiTJWIsHHEN6WsMzh0mNgAB3Yrst+nJctTPlDSTcdBD91W36TSu9zgG++IumSygVg2P1
         AE9M1P06+hQSdRui8Qe+KqY2iod4CjMVd8901gF5yT3XdA8mY3mEVFCgd+1j0MBg7aYU
         +6xE9KY+csgwkIfxHV3hMAIcvZs5dMyqCGjfrBr0bCFuOZn6eqgTe0zc1rhfrIIucC2o
         UB8k0HzhGfkmrZtdcAB9Ln2yRaziXj4htQLdT1XGPWvN+7vLHKZacwb8bcj9JKk8u3Bw
         bpWA==
X-Gm-Message-State: AOJu0YyT4WdXo7H23ha8JuhJVphvUSOcAcUiXm6FSSNhovUReKzOa0pY
	O1nK5GtJi706y5czZtHo7slyEl4mysSyzBIlc61L/8k5cNtKv4TDKjDDFAze5WUUzXnXrlhAcLT
	OP1vUVVnbpPZkdZDznW7Vl1r8Z4QvYK5KT68KitqVEab4+CPrJ5QiBoFuaFNhDqIto+W8
X-Gm-Gg: AY/fxX4NJ+zVoEnCvcB/7dfQ/alSzHh5TKihy/jxFBpRLuxm2FInD4CUMbrLBtpQXuX
	St36yYuyCRWKrRY5/Hn/ocaVSYWihNgtprg+/b09OJ4MjFRZ3CkR3rtfID9kx8tD0ieOvehfj+4
	4OM5orVdyvzuxpZc0EKslc+x923L2ex1xbjXUBt4VR5d8mvrCaGuP535c915dtaysREPY72tYAk
	mfRdBFVNGpnTu6oWoK/JodqqegnpE5wW5k1XkwZYYxmwEHAtBICYrPxsbfZsTMVMm8+RyrCzbkZ
	qdaW3RgaMuy3nYGn1vai62lvYMMtbRzWetpi8OsWJc1b3hpgaDkevd4EJo/jIr5/udcWqf2ekyV
	Dne+k+DTmzSAfAS31dT8DHrafir2zGDpB1OKkXu+L6+AD5J6oihnx6ot4EbRMsmObslUUDY7hIx
	Iv
X-Received: by 2002:a05:620a:3192:b0:8b2:f182:694e with SMTP id af79cd13be357-8c08fa9bef3mr1513932185a.54.1766393080329;
        Mon, 22 Dec 2025 00:44:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8p2TuYlhtHkErf/TyoB4VeujGLXiYuxUhHF7dDe9F7rgovKxdAQ/DP3CLNB/BM5J1+O+92Q==
X-Received: by 2002:a05:620a:3192:b0:8b2:f182:694e with SMTP id af79cd13be357-8c08fa9bef3mr1513929885a.54.1766393079879;
        Mon, 22 Dec 2025 00:44:39 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ec0f0sm782975385a.50.2025.12.22.00.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:44:39 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:44:16 +0800
Subject: [PATCH 3/3] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-sm6150_evk-v1-3-4d260a31c00d@oss.qualcomm.com>
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
In-Reply-To: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766393057; l=3996;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=7gt9rdF09zV26dKn4AfD3LmVSrsUIEw52Kj+U95nasM=;
 b=ehfA6j1xdbR2dqGrIZ0q6RzUvUZc1m7dzERkKgY19RlZ43ev/RMQso2jIUsCPT4p5MsgGKTrz
 6/EF9snR/w0CRagIi4GO82fSO1l5kVU5eq8RRvMfGH+33A35vmSUwLn
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: sfWs05WAMMt4oHvyXq5Dyvi-eruY37xc
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=694904f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=J1dVCXqo_rgSG01D--QA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: sfWs05WAMMt4oHvyXq5Dyvi-eruY37xc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OCBTYWx0ZWRfXzvazDeWLgqtF
 tXrH2ATNuSUEdlb+xis3jKO23twNMMD195YLy0mikYSEY7fOkdIrhbMTr46qo3dbX/f2xZzN1Rs
 on+vMhIvgs+R15+Z2VWs6GhPk5KbqAdQCNHDstUD856uVzEGRlQwscMjLjTiyhkgM7/HWPsHmfa
 uXQHxq2Y7gY/qzF1deAtZcYhhLTIClOBYIkg4gLZ3PgdNVqG5hql6NFE7hyuiRqT7GJWtba4jbs
 VnycbeTEWUpZT9ERHM7lddJIGVpzB39w9LtSAyu12qtOlQNd36uy2yVBQrYINdIikencAG/IOZt
 QYRDq9j6dKVfUeVRHkb+MN/z5JpbSKEgQNC5XLPKBldCso1aG0MD291R8fT3BX+C6p652RfbFqj
 QD7Hu7iSRwW0FtdrK0x/sIiueuYJm7ZT+sNyDizL5COV/LDuzfvuey05suim1KiQ/8vN5RkZZJa
 q9ALMcRaIACw5uwVAjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220078

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this overlay reflects the possibility of
attaching an optional camera sensor.
For this reason, the camera sensor configuration is
placed in talos-evk-camera.dtso, rather than
modifying the base talos-evk.dts.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  2 +
 arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 64 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi            | 21 +++++++++
 3 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 60121f133078b2754f98e6f45a3db4031b478cc8..b1d85b1f4a94714f2a5c976d162482d70ae920f2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -325,7 +325,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+talos-evk-camera-dtbs		:= talos-evk.dtb talos-evk-camera.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..ae1a02295b4dc48212aad40980a329ff458fe69a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
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
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ebb1807f0222c075d4207163ed4359a55616d903..3626312f138f2e8f1888eb6aa43fa474cdee884f 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1550,6 +1550,27 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_default: cci0-default-state {
 				cci_i2c0_default: cci-i2c0-default-pins {
 					/* SDA, SCL */

-- 
2.34.1


