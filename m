Return-Path: <linux-arm-msm+bounces-27480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA3F942671
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 786FA2856AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7494416D33B;
	Wed, 31 Jul 2024 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Cf08uzeF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54BF16D326;
	Wed, 31 Jul 2024 06:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406772; cv=none; b=EFHpWQnZMrymQPAZJpi9Pj15Bi75XZTWUP7qZ3fxEWj/oI1We7dBNvs0bPYt6s0VCTJ8HCUrMVEGm4Ds4+z0uIwkLt5mFLZ2F5k63RZGFl5aeEeid6JcRVK7Q9mqkp4PjUEAgyrcfhgFwEnXz/YrCfksYTUDOht7wieoy7SmxEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406772; c=relaxed/simple;
	bh=HGhNmscTLllRNAlkAcLvWKGyOF1yadzzxps8Ao8tcUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRtUXFdQCfUdbxbw6K1/mkjZsWyTTWfDgrJP/fuc24YvpS6xRSBQQov32/1OH9sdTg4iZmIBvYG4nWMJ/SxFgHJ9fmr++zgkkVLq/QgWIalU9PmzpFXvmZl1r77EHh8OhYSRflY39eTewwRVPomY7oGGmeVq33oQWaViYRFtUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Cf08uzeF; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WYhl624HCz9wV5;
	Wed, 31 Jul 2024 06:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406770; bh=HGhNmscTLllRNAlkAcLvWKGyOF1yadzzxps8Ao8tcUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cf08uzeFLGmBhRKVShibWKCepMM76iSIAKXV+P+EnBQFevXjwQ++iu7PvqdRP2SfV
	 Da+coEu8unUxL91HO4rV96ujyDR8OMUOMsOwQGJi4o+1iOW4GkQs/TMPMKVRDywcUo
	 wUXsJAXPfWSIk6dFJl1BRk7bUXavhKJELQDhuv1E=
X-Riseup-User-ID: 654E9151BF075245306FD3DA83F94EE879C727E99A8CA6AC86C0C910F6BCF921
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhl33nbpzJrXc;
	Wed, 31 Jul 2024 06:19:27 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Wed, 31 Jul 2024 13:18:44 +0700
Subject: [PATCH v3 03/11] arm64: dts: qcom: sm6115-pro1x: Add Goodix
 Touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-qx1050-feature-expansion-v3-3-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The Fxtec Pro1X touchscreen uses Goodix GT9286 chip.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 49 +++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 47e446249af6..813cd22907c8 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -63,6 +63,20 @@ key-volume-up {
 			wakeup-source;
 		};
 	};
+
+	ts_vdd_supply: ts-vdd-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_vdd_supply";
+		gpio = <&pca9534 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	ts_vddio_supply: ts-vddio-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_vddio_supply";
+		gpio = <&pca9534 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &dispcc {
@@ -87,6 +101,27 @@ pca9534: gpio@21 {
 	};
 };
 
+&i2c2 {
+	status = "okay";
+	/* Clock frequency was not specified downstream, let's park it to 100 KHz */
+	clock-frequency = <100000>;
+
+	touchscreen@14 {
+		compatible = "goodix,gt9286";
+		reg = <0x14>;
+
+		interrupts-extended = <&tlmm 80 IRQ_TYPE_LEVEL_LOW>;
+
+		irq-gpios = <&tlmm 80 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 71 GPIO_ACTIVE_HIGH>;
+		AVDD28-supply = <&ts_vdd_supply>;
+		VDDIO-supply = <&ts_vddio_supply>;
+
+		pinctrl-0 = <&ts_int_n>, <&ts_rst_n>;
+		pinctrl-names = "default";
+	};
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -257,6 +292,20 @@ key_camera_n: key-camera-n-state {
 		bias-pull-up;
 	};
 
+	ts_rst_n: ts-rst-n-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_int_n: ts-int-n-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
 	hall_sensor_n: hall-sensor-n-state {
 		pins = "gpio96";
 		function = "gpio";

-- 
2.46.0


