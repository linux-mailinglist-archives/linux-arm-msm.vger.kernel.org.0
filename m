Return-Path: <linux-arm-msm+bounces-28418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958F950CD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 21:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCED41C21A7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 19:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E051A4F2F;
	Tue, 13 Aug 2024 19:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Aex+Uuzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1421A4F01
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 19:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723576010; cv=none; b=RpYhvnvYgGuLwjdh+jQOd86MCdms852VymxPnIy31Kj1wm+/cKg8Vd0ew/2UOuVl+DpivazrSBEE3aEf0E3Psu9gzLK1Hkj5jshVkfQ+Q8ziM7gFk7mNYUiMOsbK4ipRLD6HHivhPtUgkPzFdPn3zuKJHr+nt4WqUxCY5TGDlZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723576010; c=relaxed/simple;
	bh=gtgHTM1UFxXrz9L4YtJBp3T3xUlW0gwlZPb2v+0ZPoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DD3lquksXckpEMQfMRbelrulQqLMsk17GKYxSCNOvCFSKwQRZEBOu6WFhvnb38CTHxHpdAlhmQZ6UuHEpgqiLhHZeesJY0HY34HLNL7d5wvcjSEHpkBuo0rVa4voC5O8/myB+DE3f1ISNWPVpBweC43jdXZKskbyMcS1o6RrLiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Aex+Uuzm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so2672608f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 12:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723576007; x=1724180807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyC5WYmPikp2EDuYrl/4Ll75exF20mPZuNB2+scoNMA=;
        b=Aex+UuzmwVOCCZ3LN9hJHk0Etb8mPZmFmniGGSffe2tT88m/J0DN0Rh3vV/vDBeiff
         4Zha7qM/S0zCFwTD6omfPezKpUKu5sQaGD4o7pHsrw2CsLFFeJsT5PjkmtWighryj1fS
         EHt0vvDblHyjCur9+UglJ5ymbjp8CdhbsWJ3bWxR6aIpEHLlMWtRHtuuF6173QqMAgl/
         N36NBt4t3Qox6DIkUqX9ridAO/t2qWUWZHZkvibkGpmLAxR+UTk2B2J/PwVdL64yXBH0
         gLRd16WBXOzVBjklK2toXj+u4Fysq/qyPRuPsD/swm+/JjQ43oh8xvnAQGictmzHXEht
         Hkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723576007; x=1724180807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyC5WYmPikp2EDuYrl/4Ll75exF20mPZuNB2+scoNMA=;
        b=KOTMlVK6nqj0yVtPpaNpwb9Y06WsCcHvF3J4zWu4LKXWMXXCrx+0amgcW5nKQnHPNG
         cMqq9E16sM2zMK2oPEesElUCxvic+73mixKxffdaYi7cio+otE5peeDyMkdkcYUIAFYp
         4yQRVRaOd3WDvI4aL767Q9nRlw4ouKfq2hJU7ckzUeAw5OWGwNaCfj6hebIL6THgsYty
         BDo2hi60n9WR66Xms9X7YVvPDiZt2uuhae8lfuNy+f8xzEwz3b9Fg3vXzItAhNa4SsvO
         lUTU42Mo+C/WnEpTA16olDxKRCnI3dB3Ev6/dV/qhaIQg7GMkOr5OZ5hN/aiCtiG2Eet
         MVag==
X-Gm-Message-State: AOJu0Yx+CDVBKAyYsqOANoRqXErRCLjpER/9sT1dmUT91vi5F14PqxGz
	wxRbAFT+m1DksWsCqqj6VlOfPK5Sop1qXRlRoE9qp1BSqpUA5kw/glFR+mGlh64=
X-Google-Smtp-Source: AGHT+IGzXg3WdIQJuxglC6GveKMWthtuWY220LgDgDf+hmPjQ/gE3oB1s6MU25/YGuAQ8xF6PgHT2w==
X-Received: by 2002:a05:6000:b44:b0:368:334d:aad4 with SMTP id ffacd0b85a97d-371777696d6mr352147f8f.4.1723576006613;
        Tue, 13 Aug 2024 12:06:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3979:ff54:1b42:968a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c93708asm11119358f8f.29.2024.08.13.12.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 12:06:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sc8280xp-crd: enable bluetooth
Date: Tue, 13 Aug 2024 21:06:37 +0200
Message-ID: <20240813190639.154983-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813190639.154983-1-brgl@bgdev.pl>
References: <20240813190639.154983-1-brgl@bgdev.pl>
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 59 ++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 57efeefbc89e..7bd7cd310bf0 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -20,6 +20,7 @@ aliases {
 		i2c4 = &i2c4;
 		i2c21 = &i2c21;
 		serial0 = &uart17;
+		serial1 = &uart2;
 	};
 
 	backlight: backlight {
@@ -275,7 +276,7 @@ usb1_sbu_mux: endpoint {
 	wcn6855-pmu {
 		compatible = "qcom,wcn6855-pmu";
 
-		pinctrl-0 = <&wlan_en>;
+		pinctrl-0 = <&bt_en>, <&wlan_en>;
 		pinctrl-names = "default";
 
 		wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
@@ -748,6 +749,27 @@ &sdc2 {
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
 
@@ -893,6 +915,13 @@ hastings_reg_en: hastings-reg-en-state {
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
@@ -1093,6 +1122,34 @@ reset-n-pins {
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


