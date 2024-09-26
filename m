Return-Path: <linux-arm-msm+bounces-32594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC04987581
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30BCAB259FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9289416130B;
	Thu, 26 Sep 2024 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDonNHOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF12B15ECD5;
	Thu, 26 Sep 2024 14:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360560; cv=none; b=kq3PmGmHgmoq0UAr/2rkWUSpy55/5CYriWSo+bnSkbcikTjsOPaezwhE/71cyM3rrv8gJK1Et59qYjtMo9MHIvYY+UJOkgki8HoO2WQTuKR1TDTzi/d5JyDu/wdGa+aII76+lL6rVnuD4zUA/SWeysojDZadFFCoGr01d/1Xm9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360560; c=relaxed/simple;
	bh=m6OV06yvZTly78RIXWubPCmTFCgJ5xL7zcSsivhUMzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YOFGErJFJFXYu40cGqK8jvrhbZTxaQGRI3NGoc8VWei4MlhtJ7WDB7xLSK5gJVIxnozWWFrFXO7NQWNaCkEF+ygSzrS68F+Cm3Q3Yksh1lZbkH3rMFL55MyuSwJoYgJpXrd8xW3179NsulAFxRm9qhdR0aRxmqzzVAfVVhy9eXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDonNHOY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53653ee23adso1025336e87.3;
        Thu, 26 Sep 2024 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360557; x=1727965357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEk6IbxyIRQciHxTowW56NnLoG79bbByuzI78rGWJC8=;
        b=TDonNHOY/gjCsnkF1oXXUsqWoyHt1PauGrY7ranxRJFCGvl1KAjY1hngg0iXrNe7Yh
         CzrChXh6//Zi8C1mxDVTX4MsFsZEklxUKOPHxubk3kKOyxMKHEtP6IsoZIx+IJjpI+SK
         cMqOn32Ond1WfnXb9T3SGNa4VXxKG09N5vtpQ65OBwgCnFQcH7tz8Wm4OiZm3/01Xcw4
         kbVpo402iCB0etbYP0lk01+qBSSr9XSEqSvEzTIsgmCHjVvYC667k+Qpmk2s7q5GJFus
         1vRxfk/xMKrsixKHEg81jJjB0FlzDfCdaVKUOm7VmVRpfwhs0k8aVTzipt2xafBW2YQJ
         SjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360557; x=1727965357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEk6IbxyIRQciHxTowW56NnLoG79bbByuzI78rGWJC8=;
        b=J/OYlaDByv8StVrDiwrX6okd8SVoTTjAPGEEK78R4bPAGk+1n2STeCFwql6Bl2A2G4
         +aV24I+YAn2682SET3IPlvhWWKHL+r8Xy+Df/xIhxLFTKgUIGQJi1GAogQnuRPbuV4jT
         E3AICkPgSg1f2sk7uMAZEaVPOMjdWhpeCXwjqOyws5g61pPxlZShplRuUcBI1fS55SJJ
         2fPhMfcq5IOnTnv3+Bw45EPpUIpZRubXLanE5xiBZN2RsmcrM/7YV8IHg3QVEZTuIKYA
         OkTBFV1uMVKDCJ+K/p7Ncg4O8bwWXwfKdkNjC4hyCmdTh7DYGXJVKEA4xBkaK42Peb1Y
         E1+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlqc4y/AwM5hL3GR6yrSQkka0+5D/RnDKpkWaxfWtikSnf43A1CqveI8LqM8059PtGzR2/2FeZJPWf@vger.kernel.org, AJvYcCXxrMhy5XD4j5MTCvk2ClWni2z9Lr44Z6vchnWb60QfzyQo1iMNYxFYAfzq+qqfiRswL8vDJK4+xWss5Py+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3+PYQ5/avdxHdfnmJui3nNGCdnyQCFmVSGL2huVXdSiLTS1eN
	Fao/B9K4GUzg/9aZpib7P/VJKrwnM1IuG6wxyLyLmOQhV1BcDZNj
X-Google-Smtp-Source: AGHT+IGLQoMOmf+PSm7/vA80PuVVDXP9OAskSmiV8zl9W69dwKVJH5YyZH1N3zXRe7QIalkZeSNwEQ==
X-Received: by 2002:a05:6512:3d12:b0:52c:e1cd:39b7 with SMTP id 2adb3069b0e04-5387048ab69mr4211288e87.5.1727360556624;
        Thu, 26 Sep 2024 07:22:36 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:35 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:11 +0300
Subject: [PATCH v5 11/12] arm64: dts: qcom: starqltechn: add graphics
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-11-d2084672ff2f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=2286;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=m6OV06yvZTly78RIXWubPCmTFCgJ5xL7zcSsivhUMzs=;
 b=9BTuRJ/+7XoneTgNY0DsKlb6cJRydLdALlIi+UOU8HXtAqKEw2pMn/QBJzvLMhubLNwAHHRNi
 XQVQpQDBEQNDTntm0GwitVpZB3GaiU6reU3+KUwkYnGgNp9FJB4c8Cv
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for gpu and panel.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes for v5:
- fix label names
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 230e984b5ba3..f7cb09734d2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -203,6 +203,52 @@ vib_pwm: pwm {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/starqltechn/a630_zap.mbn";
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l26a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e3ha8";
+		reg = <0>;
+		vci-supply = <&s2dos05_ldo4>;
+		vddr-supply = <&s2dos05_buck>;
+		vdd3-supply = <&s2dos05_ldo1>;
+		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&sde_dsi_default &sde_te>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te>;
+		pinctrl-names = "default", "suspend";
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
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+	status = "okay";
+};
 
 &apps_rsc {
 	regulators-0 {
@@ -837,6 +883,27 @@ &tlmm {
 	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
 			       <85 4>; /* SPI (fingerprint reader) */
 
+	sde_dsi_default: sde-dsi-default-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te: sde-te-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_clk_state: sdc2-clk-state {
 		pins = "sdc2_clk";
 		bias-disable;

-- 
2.39.2


