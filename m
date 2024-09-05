Return-Path: <linux-arm-msm+bounces-30892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D66C96D846
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 088741F22FB6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1452619DF4C;
	Thu,  5 Sep 2024 12:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Tgj8gKhy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DF119D086
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538837; cv=none; b=E3JMCGSu5ya7lNg5BaHvoj4n6eZu7SLi3XPfLg+acewN+7KKLPvDkRFXKFrQNInRAWb3c/vfCCM1j1WKdXLEJAkq4KOoj2OUDh/RMPFTUQLGjM51IrJ9DHNtY5FQTQ1gGscHHRj/duJcsfTCOH5vCVX0TSmUvz5NyciOQ/IPg2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538837; c=relaxed/simple;
	bh=fv/FPM4pmmM5KSoZpboIcYP9DA2912Yd9jXwue78gJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOafB2xVHIOzIkqNB+vQn/jCe2sBsO9iEPSy0+JyF958Lp5tgctDvxi4yNJKyFSFBefHVD05tyDlClFjyZEfXt5ZnnVSRv2Aui7NamwkAxqW6x8Im2RvWjtNIFX2oo2h6uo0X7JZqiBePGLx1ig+3tgmxaGnsoVjiPwLKvJ2TVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Tgj8gKhy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42bbe908380so5804665e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 05:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725538834; x=1726143634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFz8HG1EFFNnkoU8rE7mzZtXM5s35Hdj2ky9Ik6Zogo=;
        b=Tgj8gKhyyFHnDW80VHaQSJN0Go31Jh2gULGzp/7mo+NEkauzW0xJmtVVH/7QVlfxxR
         OIJ4J6qqYTcP015NplJbXLwbLtZCHGLepuUN9b/r0EHPR+1Hzvz4SCg+GRylsTvoHC+V
         +25/iS4fl8JdHtDC7vJDidmJFhNjTLKOdE25NJ4HHgOM0CNHTn9lQzrAD0MtiDikOCK2
         vMVFej8gGuRxrkDevpM9CK2HErpcXGemz0/kCPqqnlmScghn6sD5Ie11grbE8X1ieG7/
         rvLWl5bOMNsLSJA0OzSgYv4VwEg8uqia6FEIrU+J7mAUHfvFCsfeiMlCWxG8+TsjxT2Q
         sBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538834; x=1726143634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFz8HG1EFFNnkoU8rE7mzZtXM5s35Hdj2ky9Ik6Zogo=;
        b=nVUCqH/uAuHw9ctIV8K6x4efRa4q9fDYF50dAu2fmrHkSpJ89qVGEl+qyTzuYsd7N6
         zhJ3roLC5LIXiLpZO7Pg7zi4M/GIUEYs2TM8x95GU0t8NFzWUd7MzT83SznpFeaQrc7s
         +zN2KAaHUpGMmvQbxdAHVepatIqs8BMgwqPSPiWjldtFSk/9Jq6RIgyP2t8Btk97p9GH
         tFKGCZVi5Owpg+wmFjcmTpiMkv69kW1BJi+/FSpIFJeg6lkDIv2IB/ERFcw/Ak/Ws4OB
         ZxU2nSYx2+yyDy0EyofZG3uFIfgZP3GkKLwf+fBpFbkhw0Mkq+zo+2t/UZ8TGSf5GHOA
         /53g==
X-Gm-Message-State: AOJu0YyJXE/wmBmnupeP80dU5OnVhyxwcYVifeGQdfU5AZREXK6VMm3M
	P7Fzz0C9HzXKur25wtCr+HwUuFr1eh1ao2vJYd3XQJvhiSVrDwd4QnbZRmsSg0F1o2VDhokTuHu
	F
X-Google-Smtp-Source: AGHT+IGsmkhudGVqCO3S4te6TqQf5pTP2Y2lo7VrszYsez/t6Ed3MGn2onQSNJWex54E9ttT4/biSA==
X-Received: by 2002:a5d:4086:0:b0:368:7583:54c7 with SMTP id ffacd0b85a97d-374bce97f92mr11236618f8f.8.1725538834116;
        Thu, 05 Sep 2024 05:20:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:cbe4:ce99:cb33:eb1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374be2edf08sm14645764f8f.6.2024.09.05.05.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:20:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 2/4] arm64: dts: qcom: sc8280xp-crd: enable bluetooth
Date: Thu,  5 Sep 2024 14:20:20 +0200
Message-ID: <20240905122023.47251-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905122023.47251-1-brgl@bgdev.pl>
References: <20240905122023.47251-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the bluetooth node for sc8280xp-crd and make it consume the outputs
from the PMU as per the new DT bindings contract.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 60 ++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 1f533c0d49ea..eac3a6ce0b65 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -20,6 +20,7 @@ aliases {
 		i2c4 = &i2c4;
 		i2c21 = &i2c21;
 		serial0 = &uart17;
+		serial1 = &uart2;
 	};
 
 	backlight: backlight {
@@ -275,10 +276,11 @@ usb1_sbu_mux: endpoint {
 	wcn6855-pmu {
 		compatible = "qcom,wcn6855-pmu";
 
-		pinctrl-0 = <&wlan_en>;
+		pinctrl-0 = <&bt_en>, <&wlan_en>;
 		pinctrl-names = "default";
 
 		wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
 
 		vddio-supply = <&vreg_s10b>;
 		vddaon-supply = <&vreg_s12b>;
@@ -745,6 +747,27 @@ &sdc2 {
 	status = "okay";
 };
 
+&uart2 {
+	pinctrl-0 = <&uart2_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
+
 &uart17 {
 	compatible = "qcom,geni-debug-uart";
 
@@ -890,6 +913,13 @@ hastings_reg_en: hastings-reg-en-state {
 &tlmm {
 	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
+	bt_en: bt-en-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio25";
 		function = "gpio";
@@ -1089,6 +1119,34 @@ reset-n-pins {
 		};
 	};
 
+	uart2_default: uart2-default-state {
+		cts-pins {
+			pins = "gpio121";
+			function = "qup2";
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio122";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio124";
+			function = "qup2";
+			bias-pull-up;
+		};
+
+		tx-pins {
+			pins = "gpio123";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio101";
-- 
2.43.0


