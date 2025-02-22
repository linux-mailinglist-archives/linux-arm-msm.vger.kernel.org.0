Return-Path: <linux-arm-msm+bounces-49042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D8CA40AD7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 18:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1044817F041
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 17:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CC320B7F3;
	Sat, 22 Feb 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="h56yv1t0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455E206F16;
	Sat, 22 Feb 2025 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740247098; cv=none; b=KRfOLayTk6ulJpqCTq5wNUFTJ2PNlHrXik1UpB8ST3q2Yzgi1YVgPS9lYh2xzxAoRyARBUItMJc6A8/y1JI+egS1TvoEDeQOsg70qMtevL/NqhloZnqK4KeYq2R9uzHeypQVmmaev3cxNEo8h02ub7dZteiVYa2We46igsdplYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740247098; c=relaxed/simple;
	bh=QBxvoEdUEK2SkbLndKPfxDjCEC5giUzyR0L2dQYitgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFD88qlk84Ok6fQVP1IZGCSJSjTRYhyUW70WMpAJRTX4tqTXKwNOlrsWVnqBR2A4yJPIov/QGZdhDOkdFjhyB0JdbQWjIJHktgLlFwdleeOA1N9T3E6LTkEk9/wPbRvKkKBzoHt4VO0XPI1UFTtXErWifTic/Tp1Mg0jMik8anI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=h56yv1t0; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740247094; bh=QBxvoEdUEK2SkbLndKPfxDjCEC5giUzyR0L2dQYitgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h56yv1t0sXYTHgejBLgeVLH+apEVGEN4YsAFvFxh0+F9ztOpQUCDveGLQX81Fw6hj
	 JXCXvuP6BRo/r4QP6Vuf8FYpvZIGYzcA8Y3ECZqE/EoO2popmRJSBlriBQlQqXMgu8
	 tilzEwDXGJ1kXcY04Z3cKR5BU69B9gnaddsHlgyc=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 22 Feb 2025 18:58:07 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable display
 and GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-fp3-display-v1-4-ccd812e16952@lucaweiss.eu>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
In-Reply-To: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3149; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=QBxvoEdUEK2SkbLndKPfxDjCEC5giUzyR0L2dQYitgE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnuhA0C0eBdK8p2uW3UrYwf4GANbkkpiNYOeG2d
 kcGvz5xZbKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7oQNAAKCRBy2EO4nU3X
 VhCzEACtJ33nle+xC4lPGedSNSLoxK1hqZ6G5y+oLE4Q1uu7UhZq4ru68B3VnhPERhOn5heL4+2
 XzWdrKzc6fppWeGjMQNe8TE1x46pCLJmW4UB45kmb/lhLLD4VqnRIyWwYEgz0JjGakZ0gsakiLF
 495FK9rPrNS+UYseKMCf9spI5Jvp0wscTbzn1BeHdSfaDiGIqOawdjc0SuXAPuslGiUIFv2oQh5
 hdkdNv36+LyEYtGHe0UC9+jrGE+U7xdYCaNBQMcRAjhblF8SmgzZcKowO2XlHs5VjHfi174dn21
 8GVF6UEIXlKtaU3/RJdJVo2yMhLZS8yg3J1Fu2N20OSU42uIvj5YqsYRN74Fviggr8BZHQ76xDb
 koptniR5BByVdgqWO4u/MN3gpa1hZxlvVQteij1SGOOy2gcs1S/iKF45/BUfo8fDU0b8ULsivdV
 olhjfLSI+gL3zjOuoo70gOA66iUHF7biyr3oAsC9qBcyeiEmNKSFzXmH5631oRZi5cBvdii3DQh
 uwpCbBbtHA9Zc+dZf23iCmsXTxPaOA/gd/IC/kTFxFZj6K2Qr2TPC+O22ne8JoB7fGr/QAQP73h
 H/lZci53Ltrno+b+DBoLUqTJN9WZb8uAzbz6z4hQrx1mCd3YdLSFxYn7lY5B/ckMhc2tQtKiZiT
 ffNVt1rRaZwoOGA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the description for the display panel found on this phone.
Unfortunately the LCDB module on PMI632 isn't yet supported upstream so
we need to use a dummy regulator-fixed in the meantime.

And with this done we can also enable the GPU and set the zap shader
firmware path.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi             |  2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 62 +++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index af4c341e2533ef2cca593e0dc97003334d3fd6b7..6f5e6c407194d16682d1e6401fd4d10f3b73c195 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1072,7 +1072,7 @@ gpu: gpu@1c00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&zap_shader_region>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 31ed26c31e6ea381a8942ccf569513df3300cdeb..b9af811f46c283c7e0ca72e30c6cba13462f6b5a 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -36,6 +36,14 @@ key-volume-up {
 		};
 	};
 
+	/* Dummy regulator until PMI632 has LCDB VSP/VSN support */
+	lcdb_dummy: regulator-lcdb-dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "lcdb_dummy";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -44,6 +52,14 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/msm8953/fairphone/fp3/a506_zap.mbn";
+};
+
 &hsusb_phy {
 	vdd-supply = <&pm8953_l3>;
 	vdda-pll-supply = <&pm8953_l7>;
@@ -87,6 +103,45 @@ &lpass {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8953_s3>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "djn,fairphone-fp3-panel";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+
+		iovcc-supply = <&pm8953_l6>;
+		vsn-supply = <&lcdb_dummy>;
+		vsp-supply = <&lcdb_dummy>;
+
+		pinctrl-0 = <&mdss_te_default>;
+		pinctrl-names = "default";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vcca-supply = <&pm8953_l3>;
+	status = "okay";
+};
+
 &mpss {
 	firmware-name = "qcom/msm8953/fairphone/fp3/mba.mbn",
 			"qcom/msm8953/fairphone/fp3/modem.mbn";
@@ -292,6 +347,13 @@ &tlmm {
 	 * 135-138: fingerprint reader (SPI)
 	 */
 	gpio-reserved-ranges = <0 4>, <135 4>;
+
+	mdss_te_default: mdss-te-default-state {
+		pins = "gpio24";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart_0 {

-- 
2.48.1


