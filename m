Return-Path: <linux-arm-msm+bounces-49387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2F4A44EA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 22:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D606E3B538E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 21:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38208213E84;
	Tue, 25 Feb 2025 21:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="bHA9pBSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE05212B38;
	Tue, 25 Feb 2025 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518104; cv=none; b=KJ3t0ehsGjv8g2oZJoCM9jyBXNaT2V+Mo/hwCdb0lXmkLk2p/L9Hs+6Tlgru+SXlFz4fqfS5Nod5YcsQ3RcxEQZGpo5OpDLFwx7RDrW1klo8J7aLbJMQerLKWD16bDPA+XB1Li3/IdMG6dqojKuWX95skBwPu7mcDmyT6OphM/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518104; c=relaxed/simple;
	bh=V8zm/T/v89iW7Qxn5c4OjobqRw0lXZC27c2iSEMOnn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZpKCRYCqWljruw1l8jooFzXuALSYJrm2+hgWC7IvTmY7wBoA+ds6eorA0MM3ZNW0PVSyN5m8U4xsazSUD7/kJdm+sbV8cDVDmHArb1F5YFLqiCdBiIeXUN5EilHyZQjxfJW2KynauYIStQvX2cnWKN1jOwo/98CKnBzrQU7STPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=bHA9pBSy; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740518094; bh=V8zm/T/v89iW7Qxn5c4OjobqRw0lXZC27c2iSEMOnn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bHA9pBSyZxybVLBkGBxL+XQPqfwe7PIMBtMoImfwremXWYF7+4ujNADL8TOlNCZAI
	 xn45l+mjxxr0GRIa98XIbwhIZU+ErfQH9m1JHM09OQAxXGLc3ctdf1SqDU3JIXJRNQ
	 5Ik7PwoEvLkXS2cl/J8cWygkyFHh7/xLFLweVQfk=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 25 Feb 2025 22:14:32 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 display and GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-fp3-display-v2-4-0b1f05915fae@lucaweiss.eu>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
In-Reply-To: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
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
 Luca Weiss <luca@lucaweiss.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=V8zm/T/v89iW7Qxn5c4OjobqRw0lXZC27c2iSEMOnn8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnvjLLLxC/LXvqZR548r1l8YFfBF2H/HiCQs346
 JBrmX4EdJaJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ74yywAKCRBy2EO4nU3X
 Vq5ID/9mkGZ+E3Mi1lgJtZ0A+laMbxyjekOKGBvkS0VKwBQcRvRCq17iXyJlQeh4fDKbm00aiFU
 v/58MYo39g9G6Wxqi/0zrE5a+QNf2qYoYu9BJGpi7t7Sy5KUBUUf45yT1zk2XvZzrOiepmVipV0
 mowzmFBaihCmdO37D8PiqcOaCHkG8sWLu/4IKuvNSAFZWO1uhmpY09u/Rs3DdehW0XTyvAxolHP
 b5raB9EjvJZIs2U7VQGVBtxpvtJwSNBrqOCwGZi+VaYbwP4p/9VekdZoIogiPDYUKAhieiMujuK
 8Shka3vkvE/j/5x7NGEM5/UkrFgyA9lodTwWmC+tAov5pqZLgxAssU9R8Ec1yEvsMRi5p+bz5oD
 iaM8ad6N9MLnsCVv9UDUpnidpooLORlhZVM+G9TMIIpjd3b9pun/jf8QF9ziOXuXOPU8klpNwYh
 ExPnQUjQUeSWM31xAwLjthNtO1HkVSWTo0RBGbuuDzlV4+Zc+5kbBoKOGnMscLHspBjG5hYEawu
 +f3+5C+wKdOzZXrAeUik1PmpuoaFo3w8eMzVov/dk4JZM+3fVOUC4/54Y9jJvf4GKE3JB+SzkjT
 drjsKBg8eGXFAbf43zkiCzYMAQUU2vuKqIcAMLrXG5oqagllvGgYd2d3LUwgo7xFAN1vZqVrbyd
 HzpS/hAXEzmmbyg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the description for the display panel found on this phone.
Unfortunately the LCDB module on PMI632 isn't yet supported upstream so
we need to use a dummy regulator-fixed in the meantime.

And with this done we can also enable the GPU and set the zap shader
firmware path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
index 31ed26c31e6ea381a8942ccf569513df3300cdeb..55a45b528bd3f1bf9b6fe7882753338b43c62271 100644
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
+		compatible = "djn,98-03057-6598b-i";
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


