Return-Path: <linux-arm-msm+bounces-60875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE98AD4298
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 21:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A1CD17ACF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8147A26280A;
	Tue, 10 Jun 2025 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="NgZ+9dch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2AB2609FD;
	Tue, 10 Jun 2025 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749582625; cv=none; b=aWtxi9elDTh6gXkptyXKDKgahpio8Su8PKTkEoC7b6SBWdQeJDID3shXJIntSVPUS3V/Nd2eP9H/6d+Z0EvHgQ3TwiKdkUuzwwQOI1VkEa14jF65ce1DNx8FJdcFoiNQrudbWHMJGOpKdXwIqToEJXj8q2aGIzv7IDZC6l3LnIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749582625; c=relaxed/simple;
	bh=9PghBU/VAIibPl4YWoEbxb+Vq7pSne0KImwxsb0T908=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cm9B2LaqVP1OcyqIYxFzysoW3lb39vbmLThxYm1Cxb5QedZ8HrRWucSw1ZdfLkcKooVr+rUwLmrl9NlZYlBbcnzBG8iSQ9lGm/aWvMsTzTWaKHgQ6YNIlE7Gek87QrdRCISWal2nav+5myvb1EWQKztDjB3z9dIWDtB33LX7sEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=NgZ+9dch; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749582621; bh=9PghBU/VAIibPl4YWoEbxb+Vq7pSne0KImwxsb0T908=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NgZ+9dchwLHLyX5QwG6nLW0BiGcjCZp9ztHxyqxq91WxTjkTkWKulred7m6s1cyaZ
	 70xMuKBswka22pBplQk0EFGjQbzViloNWD5CVE2bISBHlEYlE2t5e7kPHX0dIexxKF
	 R7FaAQECY7cEUkTrEOcGMkgWzoBnOLAqiJuJHPBA=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 10 Jun 2025 21:09:22 +0200
Subject: [PATCH v3 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 display and GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-fp3-display-v3-4-e7e7561812e1@lucaweiss.eu>
References: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
In-Reply-To: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=9PghBU/VAIibPl4YWoEbxb+Vq7pSne0KImwxsb0T908=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSIMbVQn33U/0wn7OWYijoLqeygPuX+5kL/+NG
 RLEgoNYsGqJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEiDGwAKCRBy2EO4nU3X
 VlluD/9yJzeJybhxgvr7YBhDJtjiF4o/gSGIRaiKIe2Qn93t5b4VjrH2bCP+35IoC9Dh7IdLA9o
 R0WrFJA43wNXrFB9HQBhVcwny4uC8d9wAt+bzukVkUris7hLj9Tf/H7FRmzNBAl8EvY/lmDR9Tt
 eTguklCaqr6i6WHz6FClCfuXYRYDwHod3HdQ/Mq1cqIE/fKwGYC337gMxsDfUVcMH5+mDl9PN8l
 CsyXBfE+skBKj3PZ2mTzB+HKmZQhHQo+MoypkOKOOYj4vt7aLVlaIUBFIxpSMxLUALzna9o62sU
 B4z3gtN2d+XTQjomra7LSaZOx0fog0j63sOIMc/C+6+Vi1qvRf2/rr9Y4QmSn9PX78YfDVoTaVV
 T/eU0UgFsA84/GLzH32jfAuoFkJ3j+K2I1r0GHT+g+or0pHel0qLGbS+jzRl9TSYjw0i6CBQYIa
 mbpA6hfP3vulD1vPzt9O3bxo3CYlzopo/itC2XrNet3gw2CMu3IxNUFrHAZPwll+jQvHz5xNwVp
 xFf+gccuauOCodkRkJ/0R/+lXtxF0C3EX+kpYojH8dNNoH/o3YJT/xaetm5pS3MZpP6lwBVZDGk
 hDiKwQIta3kE1jIid+WosOqLohjQpufzVrtkSkP3lAtAmpTd3bWvH4AcMVmaJqdaSlqdOlUpUaj
 bLs4G2sjTkQlGmg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the description for the display panel found on this phone.
Unfortunately the LCDB module on PMI632 isn't yet supported upstream so
we need to use a dummy regulator-fixed in the meantime.

And with this done we can also enable the GPU and set the zap shader
firmware path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi             |  2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 62 +++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 273e79fb75695af1fd7a6f77273b95fe3b913fac..c5205d09c442e45e4a0cc3e6d8ff7d9d7bda0034 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1147,7 +1147,7 @@ &bimc SLV_EBI RPM_ALWAYS_TAG>,
 
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
2.49.0


