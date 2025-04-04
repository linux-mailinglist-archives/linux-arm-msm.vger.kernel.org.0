Return-Path: <linux-arm-msm+bounces-53208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5935EA7B979
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 11:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7F701798C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 09:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6CA19F133;
	Fri,  4 Apr 2025 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Z6yoPb8y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E91819D8BC
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757286; cv=none; b=jIbmdFuEK/OeSjtqRyjcXBUsJFY/hAN2uFhUHP79vxUFRd6/gyXD7+cZGU0RaMgtcep1kWPS2rdSEABqRMjAkQocXkFmPNPaX7Wcx5fPMaPrC8CM9z9llu/+d8p5ZUF8bowX38u6prhH8iz6+KCftzDIk2WIW5oPLajvVwqAlNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757286; c=relaxed/simple;
	bh=YlQi7QiMeErxJhLIiownjUqajvDfdHA5sd+V51yb/xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3xm26Ef7b4CijWTay7wbXQqu7BUh7mFHziZkareg9z6tKmoqxqsbF4Gv9Zz/RxEAXc8bwoNWRV0wtYsZBTD1vXVDDpRd/pEzSIYT9dawTB1411wdbp5SfTGcR8A7wUK+xbs2qJOerCPnioo/l3Edhbj2DsOgYYa9gCu+pmM0B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Z6yoPb8y; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 58296400F7
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743757274;
	bh=MYXPYgE6U4gPAKLriBgAXc9YRlfOl+ssEnugWrjkOAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Z6yoPb8ybgj4aAjejChKKUi/tQkIEfUFD7n5O9G1uppMAfZXF59f2mf+fRgmbyJ+K
	 Hmn0CImeSjjTXnHNYbjgRsgu4P/X3XE5zbmBxMCCAjdNOHp4W/nVZ+EPgkU2j7U+av
	 kn7p308QIvXQvNZR2q4kZikM7svGMYSq46kLldaIRqbTTd4xMfCNBPSF6WhGuObVey
	 Ck39hjH5IzX5x/eRUb0mwjeMyR0kRo0oC45Xu3glOWAzxlmAwXC/oJkcxWhoGUKsqn
	 4ezh+IXNGjAYDOe/Ndat3+/ySV+sI2cM9dAKcbgQ3VCQGQeOWGO39HE265ZMrkb1e0
	 zhVm41Gvj8bww==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so14638895e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 02:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757273; x=1744362073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYXPYgE6U4gPAKLriBgAXc9YRlfOl+ssEnugWrjkOAo=;
        b=wqeC5nuQuxtf+XmzTqAWhhMJVZI9MgQ44k4efxFwNKXcQWtINgzHe/yisz54F2H1lZ
         PhatwKvGgFecAMfFCF3oSahesxQc7TLP80B7wRON7/3YNgF/KVAuC5LG61edZO+hyk/e
         5tFhjxObvUsL6q7NSU/lffSFUl2EZ+uXPwfGUVpmxxe6VvlspCjPNAgjHma11jBv5Po5
         jcqIVhMcNuWYGBRsFPkFpElYG1rwl6BgTVhguJUpnGd4wq7mNert3EUbsVs11La3ukmG
         JG+fx34aKGYLOMrJDMy8kVwnFfYjwPrviDNJJ3yMubPjSz0x1uHBMbHnfZhewXqpsZJJ
         Ocyw==
X-Forwarded-Encrypted: i=1; AJvYcCXCdlOW4qouL9222g2i1lbHSHrUfHNz1eik/1xzFGqBOggwVyIxEh1qrbyET85CCYp8ylHsBxKMYLhLGYIM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1VaWhQQwT6rjP3qFIwtXIrfmcD8u6O+hcaMBkQSmISOQW6uxm
	CluuPCkiFoG3ybS/pHsd+bICikU/CPQsJ3PXAgkx5gALWWwnxVk68EJOAc3O3yWn00bnwzPhzPq
	fCE6rpBx6ArlxVQtOUoGTS5xk3nsLHuetcHCyPNNpKNYEXAJ5qf2svBS88d8TzbKRa/4YADfRLH
	m1Kuo=
X-Gm-Gg: ASbGnctjCWISetu0Q6N+8jHJMwCGAdywBXNBvvgZ1BEJN81HWihLej5Berxkut5zn1X
	GhVdtC8KL7Al4+qictcqMpmRK89Qolt9FNQBdO+x3kd7W+I60NvH+2iWveMwLUdOOqCVER3GTNa
	j0klnCrad5OmAlcbwl9den5XHlEuvomTNrwlhl0/4aWre7hi1Ym1BTcMqy6kOTBwuQUfvvp0zcF
	w5+sv7gh8f4W6cb5vcudqIaU/wT6h9X+IP2w18Zg2nD5pEZkzIDPLxTFEGD8tIn3EF9nT93DYYA
	n1rc+zD57VtiwgoDwtDZZsKi4lWHWZnNK48KHHpczKy7eK0UI8e4d3glkJNE
X-Received: by 2002:a05:600c:3b9f:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43ed0b80b25mr15142745e9.6.1743757272487;
        Fri, 04 Apr 2025 02:01:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNumhNeNLIfkf6NIeyipve2PfqW1u9DzwfLlO8EK3B/Dt7AAKKSCdi6dqBx3ew8XO1/+hlqg==
X-Received: by 2002:a05:600c:3b9f:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43ed0b80b25mr15141795e9.6.1743757271517;
        Fri, 04 Apr 2025 02:01:11 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d63csm3919259f8f.69.2025.04.04.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:01:11 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Create and include a dtsi
Date: Fri,  4 Apr 2025 11:01:06 +0200
Message-ID: <20250404090108.3333211-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a dtsi for the HP OmniBook so it can be reused for the HP EliteBook
which seems to be the same HW.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1554 +---------------
 .../dts/qcom/x1e80100-hp-omnibook-x14.dtsi    | 1557 +++++++++++++++++
 2 files changed, 1558 insertions(+), 1553 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtsi

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 03bbebff4576..55c4835d19c3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1,1557 +1,5 @@
 // SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
- * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
- */
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/gpio-keys.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-
-#include "x1e80100.dtsi"
-#include "x1e80100-pmics.dtsi"
-
-/ {
-	model = "HP Omnibook X 14";
-	compatible = "hp,omnibook-x14", "qcom,x1e80100";
-	chassis-type = "laptop";
-
-	aliases {
-		serial0 = &uart21;
-		serial1 = &uart14;
-	};
-
-	wcd938x: audio-codec {
-		compatible = "qcom,wcd9385-codec";
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&wcd_default>;
-
-		qcom,micbias1-microvolt = <1800000>;
-		qcom,micbias2-microvolt = <1800000>;
-		qcom,micbias3-microvolt = <1800000>;
-		qcom,micbias4-microvolt = <1800000>;
-		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
-		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
-		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
-		qcom,rx-device = <&wcd_rx>;
-		qcom,tx-device = <&wcd_tx>;
-
-		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
-
-		vdd-buck-supply = <&vreg_l15b_1p8>;
-		vdd-rxtx-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l15b_1p8>;
-		vdd-mic-bias-supply = <&vreg_bob1>;
-
-		#sound-dai-cells = <1>;
-	};
-
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pmk8550_pwm 0 5000000>;
-
-		brightness-levels = <0 2048 4096 8192 16384 65535>;
-		num-interpolated-steps = <20>;
-		default-brightness-level = <80>;
-
-		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
-		power-supply = <&vreg_edp_bl>;
-
-		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
-		pinctrl-names = "default";
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		pinctrl-0 = <&hall_int_n_default>;
-		pinctrl-names = "default";
-
-		switch-lid {
-			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_SW>;
-			linux,code = <SW_LID>;
-			wakeup-source;
-			wakeup-event-action = <EV_ACT_DEASSERTED>;
-		};
-	};
-
-	pmic-glink {
-		compatible = "qcom,x1e80100-pmic-glink",
-			     "qcom,sm8550-pmic-glink",
-			     "qcom,pmic-glink";
-		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
-				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		/* Left-side port, closer to the screen */
-		connector@0 {
-			compatible = "usb-c-connector";
-			reg = <0>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_ss0_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&retimer_ss0_ss_out>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-
-					pmic_glink_ss0_con_sbu_in: endpoint {
-						remote-endpoint = <&retimer_ss0_con_sbu_out>;
-					};
-				};
-			};
-		};
-
-		/* Left-side port, farther from the screen */
-		connector@1 {
-			compatible = "usb-c-connector";
-			reg = <1>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_ss1_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss1_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
-					};
-				};
-			};
-		};
-	};
-
-	reserved-memory {
-		linux,cma {
-			compatible = "shared-dma-pool";
-			size = <0x0 0x8000000>;
-			reusable;
-			linux,cma-default;
-		};
-	};
-
-	sound {
-		compatible = "qcom,x1e80100-sndcard";
-		model = "X1E80100-HP-OMNIBOOK-X14";
-		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
-				"SpkrRight IN", "WSA WSA_SPK2 OUT",
-				"IN1_HPHL", "HPHL_OUT",
-				"IN2_HPHR", "HPHR_OUT",
-				"AMIC2", "MIC BIAS2",
-				"VA DMIC0", "MIC BIAS3",
-				"VA DMIC1", "MIC BIAS3",
-				"VA DMIC2", "MIC BIAS1",
-				"VA DMIC3", "MIC BIAS1",
-				"VA DMIC0", "VA MIC BIAS3",
-				"VA DMIC1", "VA MIC BIAS3",
-				"VA DMIC2", "VA MIC BIAS1",
-				"VA DMIC3", "VA MIC BIAS1",
-				"TX SWR_INPUT1", "ADC2_OUTPUT";
-
-		wcd-playback-dai-link {
-			link-name = "WCD Playback";
-
-			cpu {
-				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
-			};
-
-			codec {
-				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wcd-capture-dai-link {
-			link-name = "WCD Capture";
-
-			cpu {
-				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
-			};
-
-			codec {
-				sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wsa-dai-link {
-			link-name = "WSA Playback";
-
-			cpu {
-				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
-			};
-
-			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		va-dai-link {
-			link-name = "VA Capture";
-
-			cpu {
-				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
-			};
-
-			codec {
-				sound-dai = <&lpass_vamacro 0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-	};
-
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_edp_bl: regulator-edp-bl {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VBL9";
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&edp_bl_reg_en>;
-
-		regulator-boot-on;
-	};
-
-	vreg_misc_3p3: regulator-misc-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_MISC_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&misc_3p3_reg_en>;
-
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	vreg_nvme: regulator-nvme {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_NVME_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&nvme_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_1P15";
-		regulator-min-microvolt = <1150000>;
-		regulator-max-microvolt = <1150000>;
-
-		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_1P8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_1p8_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_vph_pwr: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-
-		regulator-name = "vreg_vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	vreg_wcn_3p3: regulator-wcn-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wcn_sw_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	/*
-	 * TODO: These two regulators are actually part of the removable M.2
-	 * card and not the CRD mainboard. Need to describe this differently.
-	 * Functionally it works correctly, because all we need to do is to
-	 * turn on the actual 3.3V supply above.
-	 */
-	vreg_wcn_0p95: regulator-wcn-0p95 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_0P95";
-		regulator-min-microvolt = <950000>;
-		regulator-max-microvolt = <950000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_1p9: regulator-wcn-1p9 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_1P9";
-		regulator-min-microvolt = <1900000>;
-		regulator-max-microvolt = <1900000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	wcn6855-pmu {
-		compatible = "qcom,wcn6855-pmu";
-
-		vddaon-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_wcn_1p9>;
-		vddpcie1p3-supply = <&vreg_wcn_1p9>;
-		vddpcie1p9-supply = <&vreg_wcn_1p9>;
-		vddpmu-supply = <&vreg_wcn_0p95>;
-		vddpmumx-supply = <&vreg_wcn_0p95>;
-		vddpmucx-supply = <&vreg_wcn_0p95>;
-		vddrfa0p95-supply = <&vreg_wcn_0p95>;
-		vddrfa1p3-supply = <&vreg_wcn_1p9>;
-		vddrfa1p9-supply = <&vreg_wcn_1p9>;
-
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&wcn_wlan_bt_en>;
-		pinctrl-names = "default";
-
-		regulators {
-			vreg_pmu_rfa_cmn_0p8: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn_0p8";
-			};
-
-			vreg_pmu_aon_0p8: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p8";
-			};
-
-			vreg_pmu_wlcx_0p8: ldo2 {
-				regulator-name = "vreg_pmu_wlcx_0p8";
-			};
-
-			vreg_pmu_wlmx_0p8: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p8";
-			};
-
-			vreg_pmu_btcmx_0p8: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p8";
-			};
-
-			vreg_pmu_pcie_1p8: ldo5 {
-				regulator-name = "vreg_pmu_pcie_1p8";
-			};
-
-			vreg_pmu_pcie_0p9: ldo6 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
-
-			vreg_pmu_rfa_0p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_0p8";
-			};
-
-			vreg_pmu_rfa_1p2: ldo8 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
-
-			vreg_pmu_rfa_1p7: ldo9 {
-				regulator-name = "vreg_pmu_rfa_1p7";
-			};
-		};
-	};
-};
-
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pm8550-rpmh-regulators";
-		qcom,pmic-id = "b";
-
-		vdd-bob1-supply = <&vreg_vph_pwr>;
-		vdd-bob2-supply = <&vreg_vph_pwr>;
-		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
-		vdd-l2-l13-l14-supply = <&vreg_bob1>;
-		vdd-l5-l16-supply = <&vreg_bob1>;
-		vdd-l6-l7-supply = <&vreg_bob2>;
-		vdd-l8-l9-supply = <&vreg_bob1>;
-		vdd-l12-supply = <&vreg_s5j_1p2>;
-		vdd-l15-supply = <&vreg_s4c_1p8>;
-		vdd-l17-supply = <&vreg_bob2>;
-
-		vreg_bob1: bob1 {
-			regulator-name = "vreg_bob1";
-			regulator-min-microvolt = <3008000>;
-			regulator-max-microvolt = <3960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_bob2: bob2 {
-			regulator-name = "vreg_bob2";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <3008000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1b_1p8: ldo1 {
-			regulator-name = "vreg_l1b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b_3p0: ldo2 {
-			regulator-name = "vreg_l2b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4b_1p8: ldo4 {
-			regulator-name = "vreg_l4b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l5b_3p0: ldo5 {
-			regulator-name = "vreg_l5b_3p0";
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6b_1p8: ldo6 {
-			regulator-name = "vreg_l6b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b_2p8: ldo7 {
-			regulator-name = "vreg_l7b_2p8";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b_3p0: ldo8 {
-			regulator-name = "vreg_l8b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b_2p9: ldo9 {
-			regulator-name = "vreg_l9b_2p9";
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10b_1p8: ldo10 {
-			regulator-name = "vreg_l10b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l12b_1p2: ldo12 {
-			regulator-name = "vreg_l12b_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
-		};
-
-		vreg_l13b_3p0: ldo13 {
-			regulator-name = "vreg_l13b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l14b_3p0: ldo14 {
-			regulator-name = "vreg_l14b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b_1p8: ldo15 {
-			regulator-name = "vreg_l15b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
-		};
-
-		vreg_l16b_2p9: ldo16 {
-			regulator-name = "vreg_l16b_2p9";
-			regulator-min-microvolt = <2912000>;
-			regulator-max-microvolt = <2912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l17b_2p5: ldo17 {
-			regulator-name = "vreg_l17b_2p5";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <2504000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "c";
-
-		vdd-l1-supply = <&vreg_s5j_1p2>;
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s4-supply = <&vreg_vph_pwr>;
-
-		vreg_s4c_1p8: smps4 {
-			regulator-name = "vreg_s4c_1p8";
-			regulator-min-microvolt = <1856000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1c_1p2: ldo1 {
-			regulator-name = "vreg_l1c_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c_0p8: ldo2 {
-			regulator-name = "vreg_l2c_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c_0p8: ldo3 {
-			regulator-name = "vreg_l3c_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-2 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "d";
-
-		vdd-l1-supply = <&vreg_s1f_0p7>;
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s4c_1p8>;
-		vdd-s1-supply = <&vreg_vph_pwr>;
-
-		vreg_l1d_0p8: ldo1 {
-			regulator-name = "vreg_l1d_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2d_0p9: ldo2 {
-			regulator-name = "vreg_l2d_0p9";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3d_1p8: ldo3 {
-			regulator-name = "vreg_l3d_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-3 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "e";
-
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s5j_1p2>;
-
-		vreg_l2e_0p8: ldo2 {
-			regulator-name = "vreg_l2e_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3e_1p2: ldo3 {
-			regulator-name = "vreg_l3e_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-4 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "f";
-
-		vdd-l1-supply = <&vreg_s5j_1p2>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s5j_1p2>;
-		vdd-s1-supply = <&vreg_vph_pwr>;
-
-		vreg_s1f_0p7: smps1 {
-			regulator-name = "vreg_s1f_0p7";
-			regulator-min-microvolt = <700000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1f_1p0: ldo1 {
-			regulator-name = "vreg_l1f_1p0";
-			regulator-min-microvolt = <1024000>;
-			regulator-max-microvolt = <1024000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f_1p0: ldo2 {
-			regulator-name = "vreg_l2f_1p0";
-			regulator-min-microvolt = <1024000>;
-			regulator-max-microvolt = <1024000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f_1p0: ldo3 {
-			regulator-name = "vreg_l3f_1p0";
-			regulator-min-microvolt = <1024000>;
-			regulator-max-microvolt = <1024000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-6 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "i";
-
-		vdd-l1-supply = <&vreg_s4c_1p8>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s1-supply = <&vreg_vph_pwr>;
-		vdd-s2-supply = <&vreg_vph_pwr>;
-
-		vreg_s1i_0p9: smps1 {
-			regulator-name = "vreg_s1i_0p9";
-			regulator-min-microvolt = <900000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s2i_1p0: smps2 {
-			regulator-name = "vreg_s2i_1p0";
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1i_1p8: ldo1 {
-			regulator-name = "vreg_l1i_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2i_1p2: ldo2 {
-			regulator-name = "vreg_l2i_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3i_0p8: ldo3 {
-			regulator-name = "vreg_l3i_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-7 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "j";
-
-		vdd-l1-supply = <&vreg_s1f_0p7>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s5-supply = <&vreg_vph_pwr>;
-
-		vreg_s5j_1p2: smps5 {
-			regulator-name = "vreg_s5j_1p2";
-			regulator-min-microvolt = <1256000>;
-			regulator-max-microvolt = <1304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1j_0p8: ldo1 {
-			regulator-name = "vreg_l1j_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2j_1p2: ldo2 {
-			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3j_0p8: ldo3 {
-			regulator-name = "vreg_l3j_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
-&gpu {
-	status = "okay";
-
-	zap-shader {
-		firmware-name = "qcom/x1e80100/hp/omnibook-x14/qcdxkmsuc8380.mbn";
-	};
-};
-
-&i2c0 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	keyboard@3a {
-		compatible = "hid-over-i2c";
-		reg = <0x3a>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l12b_1p2>;
-
-		pinctrl-0 = <&kybd_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-
-	touchpad@15 {
-		compatible = "hid-over-i2c";
-		reg = <0x15>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l12b_1p2>;
-
-		pinctrl-0 = <&tpad_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-};
-
-&i2c1 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	/* type-c PS8830 Retimer #2 0x8 */
-	/* is active on Windows */
-};
-
-&i2c3 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	typec-mux@8 {
-		compatible = "parade,ps8830";
-		reg = <0x08>;
-
-		clocks = <&rpmhcc RPMH_RF_CLK3>;
-
-		vdd-supply = <&vreg_rtmr0_1p15>;
-		vdd33-supply = <&vreg_rtmr0_3p3>;
-		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
-		vddar-supply = <&vreg_rtmr0_1p15>;
-		vddat-supply = <&vreg_rtmr0_1p15>;
-		vddio-supply = <&vreg_rtmr0_1p8>;
-
-		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&rtmr0_default>;
-		pinctrl-names = "default";
-
-		orientation-switch;
-		retimer-switch;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				retimer_ss0_ss_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss0_ss_in>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				retimer_ss0_ss_in: endpoint {
-					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				retimer_ss0_con_sbu_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
-				};
-			};
-		};
-	};
-};
-
-&i2c4 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	/* is active on Windows */
-};
-
-&i2c5 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	eusb3_repeater: redriver@47 {
-		compatible = "nxp,ptn3222";
-		reg = <0x47>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b_3p0>;
-		vdd1v8-supply = <&vreg_l4b_1p8>;
-
-		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb3_reset_n>;
-		pinctrl-names = "default";
-
-	};
-};
-
-&i2c8 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	touchscreen@10 {
-		compatible = "hid-over-i2c";
-		reg = <0x10>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_1p8>;
-
-		pinctrl-0 = <&ts0_default>;
-		pinctrl-names = "default";
-	};
-};
-
-&i2c9 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	/* is active on Windows */
-};
-
-&lpass_tlmm {
-	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
-		pins = "gpio12";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-		output-low;
-	};
-};
-
-&lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
-	pinctrl-names = "default";
-
-	vdd-micb-supply = <&vreg_l1b_1p8>;
-	qcom,dmic-sample-rate = <4800000>;
-};
-
-&mdss {
-	status = "okay";
-};
-
-&mdss_dp0 {
-	status = "okay";
-};
-
-&mdss_dp0_out {
-	data-lanes = <0 1>;
-};
-
-&mdss_dp1 {
-	status = "okay";
-};
-
-&mdss_dp1_out {
-	data-lanes = <0 1>;
-};
-
-&mdss_dp3 {
-	compatible = "qcom,x1e80100-dp";
-	/delete-property/ #sound-dai-cells;
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "edp-panel";
-			power-supply = <&vreg_edp_3p3>;
-
-			backlight = <&backlight>;
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-
-	ports {
-		port@1 {
-			reg = <1>;
-
-			mdss_dp3_out: endpoint {
-				data-lanes = <0 1 2 3>;
-				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-				remote-endpoint = <&edp_panel_in>;
-			};
-		};
-	};
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
-	pinctrl-0 = <&pcie4_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie4_phy {
-	vdda-phy-supply = <&vreg_l3i_0p8>;
-	vdda-pll-supply = <&vreg_l3e_1p2>;
-
-	status = "okay";
-};
-
-&pcie4_port0 {
-	wifi@0 {
-		compatible = "pci17cb,1107";
-		reg = <0x10000 0x0 0x0 0x0 0x0>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
-	};
-};
-
-&pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-
-	vddpe-3v3-supply = <&vreg_nvme>;
-
-	pinctrl-0 = <&pcie6a_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie6a_phy {
-	vdda-phy-supply = <&vreg_l1d_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&pm8550_gpios {
-	rtmr0_default: rtmr0-reset-n-active-state {
-		pins = "gpio10";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-
-	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
-		pins = "gpio11";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
-&pm8550ve_8_gpios {
-	misc_3p3_reg_en: misc-3p3-reg-en-state {
-		pins = "gpio6";
-		function = "normal";
-		bias-disable;
-		drive-push-pull;
-		input-disable;
-		output-enable;
-		power-source = <1>; /* 1.8 V */
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
-	};
-};
-
-&pm8550ve_9_gpios {
-	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
-		pins = "gpio8";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
-&pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		input-disable;
-		output-enable;
-	};
-
-	edp_bl_reg_en: edp-bl-reg-en-state {
-		pins = "gpio10";
-		function = "normal";
-	};
-
-};
-
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
-&pmk8550_pwm {
-	status = "okay";
-};
-
-&pmc8380_5_gpios {
-	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
-		pins = "gpio8";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
-&qupv3_0 {
-	status = "okay";
-};
-
-&qupv3_1 {
-	status = "okay";
-};
-
-&qupv3_2 {
-	status = "okay";
-};
-
-&remoteproc_adsp {
-	firmware-name = "qcom/x1e80100/hp/omnibook-x14/qcadsp8380.mbn",
-			"qcom/x1e80100/hp/omnibook-x14/adsp_dtbs.elf";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/x1e80100/hp/omnibook-x14/qccdsp8380.mbn",
-			"qcom/x1e80100/hp/omnibook-x14/cdsp_dtbs.elf";
-
-	status = "okay";
-};
-
-&smb2360_0 {
-	status = "okay";
-};
-
-&smb2360_0_eusb2_repeater {
-	vdd18-supply = <&vreg_l3d_1p8>;
-	vdd3-supply = <&vreg_l2b_3p0>;
-};
-
-&smb2360_1 {
-	status = "okay";
-};
-
-&smb2360_1_eusb2_repeater {
-	vdd18-supply = <&vreg_l3d_1p8>;
-	vdd3-supply = <&vreg_l14b_3p0>;
-};
-
-&swr0 {
-	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	/* WSA8845, Left Speaker */
-	left_spkr: speaker@0,0 {
-		compatible = "sdw20217020400";
-		reg = <0 0>;
-		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrLeft";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Right Speaker */
-	right_spkr: speaker@0,1 {
-		compatible = "sdw20217020400";
-		reg = <0 1>;
-		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrRight";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <4 5 6 7 11 13>;
-	};
-};
-
-&swr1 {
-	status = "okay";
-
-	/* WCD9385 RX */
-	wcd_rx: codec@0,4 {
-		compatible = "sdw20217010d00";
-		reg = <0 4>;
-		qcom,rx-port-mapping = <1 2 3 4 5>;
-	};
-};
-
-&swr2 {
-	status = "okay";
-
-	/* WCD9385 TX */
-	wcd_tx: codec@0,3 {
-		compatible = "sdw20217010d00";
-		reg = <0 3>;
-		qcom,tx-port-mapping = <2 2 3 4>;
-	};
-};
-
-&tlmm {
-	gpio-reserved-ranges = <34 2>, /* Unused */
-			       <44 4>, /* SPI (TPM) */
-			       <72 2>, /* Secure EC I2C connection (?) */
-			       <238 1>; /* UFS Reset */
-
-	bt_en_default: bt-en-sleep {
-		pins = "gpio116";
-		function = "gpio";
-		output-low;
-		bias-disable;
-		drive-strength = <16>;
-	};
-
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	eusb3_reset_n: eusb3-reset-n-state {
-		pins = "gpio6";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-		output-low;
-	};
-
-	hall_int_n_default: hall-int-n-state {
-		pins = "gpio92";
-		function = "gpio";
-		bias-disable;
-	};
-
-	kybd_default: kybd-default-state {
-		pins = "gpio67";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	nvme_reg_en: nvme-reg-en-state {
-		pins = "gpio18";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	pcie4_default: pcie4-default-state {
-		clkreq-n-pins {
-			pins = "gpio147";
-			function = "pcie4_clk";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio146";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio148";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie6a_default: pcie6a-default-state {
-		clkreq-n-pins {
-			pins = "gpio153";
-			function = "pcie6a_clk";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio152";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio154";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	tpad_default: tpad-default-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	ts0_default: ts0-default-state {
-		int-n-pins {
-			pins = "gpio51";
-			function = "gpio";
-			bias-pull-up;
-		};
-
-		reset-n-pins {
-			pins = "gpio48";
-			function = "gpio";
-			output-high;
-			drive-strength = <16>;
-		};
-	};
-
-	wcd_default: wcd-reset-n-active-state {
-		pins = "gpio191";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-		output-low;
-	};
-
-	wcn_sw_en: wcn-sw-en-state {
-		pins = "gpio214";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
-		pins = "gpio116", "gpio117";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-};
-
-&uart14 {
-	status = "okay";
-
-	bluetooth {
-		compatible = "qcom,wcn6855-bt";
-		max-speed = <3200000>;
-
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
-		vddaon-supply = <&vreg_pmu_aon_0p8>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
-		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
-	};
-};
-
-&usb_1_ss0_hsphy {
-	vdd-supply = <&vreg_l3j_0p8>;
-	vdda12-supply = <&vreg_l2j_1p2>;
-
-	phys = <&smb2360_0_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
-
-	status = "okay";
-};
-
-&usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_1_ss0_dwc3_hs {
-	remote-endpoint = <&pmic_glink_ss0_hs_in>;
-};
-
-&usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&retimer_ss0_ss_in>;
-};
-
-&usb_1_ss1_hsphy {
-	vdd-supply = <&vreg_l3j_0p8>;
-	vdda12-supply = <&vreg_l2j_1p2>;
-
-	phys = <&smb2360_1_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
-
-	status = "okay";
-};
-
-&usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_1_ss1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_ss1_hs_in>;
-};
-
-&usb_1_ss1_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss1_ss_in>;
-};
-
-&usb_mp {
-	status = "okay";
-};
-
-&usb_mp_dwc3 {
-	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
-	phy-names = "usb2-0", "usb3-0";
-};
-
-&usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
-
-	phys = <&eusb3_repeater>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
-
-	status = "okay";
-};
+#include "x1e80100-hp-omnibook-x14.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtsi
new file mode 100644
index 000000000000..03bbebff4576
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtsi
@@ -0,0 +1,1557 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "x1e80100.dtsi"
+#include "x1e80100-pmics.dtsi"
+
+/ {
+	model = "HP Omnibook X 14";
+	compatible = "hp,omnibook-x14", "qcom,x1e80100";
+	chassis-type = "laptop";
+
+	aliases {
+		serial0 = &uart21;
+		serial1 = &uart14;
+	};
+
+	wcd938x: audio-codec {
+		compatible = "qcom,wcd9385-codec";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcd_default>;
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+
+		#sound-dai-cells = <1>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+
+		brightness-levels = <0 2048 4096 8192 16384 65535>;
+		num-interpolated-steps = <20>;
+		default-brightness-level = <80>;
+
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,x1e80100-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Left-side port, closer to the screen */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss0_ss_in: endpoint {
+						remote-endpoint = <&retimer_ss0_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss0_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss0_con_sbu_out>;
+					};
+				};
+			};
+		};
+
+		/* Left-side port, farther from the screen */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss1_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss1_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	reserved-memory {
+		linux,cma {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-HP-OMNIBOOK-X14";
+		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS3",
+				"VA DMIC1", "MIC BIAS3",
+				"VA DMIC2", "MIC BIAS1",
+				"VA DMIC3", "MIC BIAS1",
+				"VA DMIC0", "VA MIC BIAS3",
+				"VA DMIC1", "VA MIC BIAS3",
+				"VA DMIC2", "VA MIC BIAS1",
+				"VA DMIC3", "VA MIC BIAS1",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
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
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&misc_3p3_reg_en>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_1P15";
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+
+		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb0_1p8_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb0_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	/*
+	 * TODO: These two regulators are actually part of the removable M.2
+	 * card and not the CRD mainboard. Need to describe this differently.
+	 * Functionally it works correctly, because all we need to do is to
+	 * turn on the actual 3.3V supply above.
+	 */
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_1P9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_wcn_1p9>;
+		vddpcie1p3-supply = <&vreg_wcn_1p9>;
+		vddpcie1p9-supply = <&vreg_wcn_1p9>;
+		vddpmu-supply = <&vreg_wcn_0p95>;
+		vddpmumx-supply = <&vreg_wcn_0p95>;
+		vddpmucx-supply = <&vreg_wcn_0p95>;
+		vddrfa0p95-supply = <&vreg_wcn_0p95>;
+		vddrfa1p3-supply = <&vreg_wcn_1p9>;
+		vddrfa1p9-supply = <&vreg_wcn_1p9>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn_0p8: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			};
+
+			vreg_pmu_aon_0p8: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p8";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p8: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p8";
+			};
+
+			vreg_pmu_btcmx_0p8: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p8";
+			};
+
+			vreg_pmu_pcie_1p8: ldo5 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo6 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_rfa_0p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo8 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo9 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob1-supply = <&vreg_vph_pwr>;
+		vdd-bob2-supply = <&vreg_vph_pwr>;
+		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob2>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l12-supply = <&vreg_s5j_1p2>;
+		vdd-l15-supply = <&vreg_s4c_1p8>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_3p0: ldo5 {
+			regulator-name = "vreg_l5b_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_3p0: ldo8 {
+			regulator-name = "vreg_l8b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_1p2: ldo12 {
+			regulator-name = "vreg_l12b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_3p0: ldo14 {
+			regulator-name = "vreg_l14b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l16b_2p9: ldo16 {
+			regulator-name = "vreg_l16b_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-l1-supply = <&vreg_s5j_1p2>;
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s4-supply = <&vreg_vph_pwr>;
+
+		vreg_s4c_1p8: smps4 {
+			regulator-name = "vreg_s4c_1p8";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p2: ldo1 {
+			regulator-name = "vreg_l1c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_0p8: ldo2 {
+			regulator-name = "vreg_l2c_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_0p8: ldo3 {
+			regulator-name = "vreg_l3c_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vdd-l1-supply = <&vreg_s1f_0p7>;
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s4c_1p8>;
+		vdd-s1-supply = <&vreg_vph_pwr>;
+
+		vreg_l1d_0p8: ldo1 {
+			regulator-name = "vreg_l1d_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2d_0p9: ldo2 {
+			regulator-name = "vreg_l2d_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3d_1p8: ldo3 {
+			regulator-name = "vreg_l3d_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s5j_1p2>;
+
+		vreg_l2e_0p8: ldo2 {
+			regulator-name = "vreg_l2e_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p2: ldo3 {
+			regulator-name = "vreg_l3e_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-l1-supply = <&vreg_s5j_1p2>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s5j_1p2>;
+		vdd-s1-supply = <&vreg_vph_pwr>;
+
+		vreg_s1f_0p7: smps1 {
+			regulator-name = "vreg_s1f_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_1p0: ldo1 {
+			regulator-name = "vreg_l1f_1p0";
+			regulator-min-microvolt = <1024000>;
+			regulator-max-microvolt = <1024000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_1p0: ldo2 {
+			regulator-name = "vreg_l2f_1p0";
+			regulator-min-microvolt = <1024000>;
+			regulator-max-microvolt = <1024000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_1p0: ldo3 {
+			regulator-name = "vreg_l3f_1p0";
+			regulator-min-microvolt = <1024000>;
+			regulator-max-microvolt = <1024000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-6 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "i";
+
+		vdd-l1-supply = <&vreg_s4c_1p8>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s1-supply = <&vreg_vph_pwr>;
+		vdd-s2-supply = <&vreg_vph_pwr>;
+
+		vreg_s1i_0p9: smps1 {
+			regulator-name = "vreg_s1i_0p9";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2i_1p0: smps2 {
+			regulator-name = "vreg_s2i_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_1p8: ldo1 {
+			regulator-name = "vreg_l1i_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_0p8: ldo3 {
+			regulator-name = "vreg_l3i_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-7 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "j";
+
+		vdd-l1-supply = <&vreg_s1f_0p7>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s5-supply = <&vreg_vph_pwr>;
+
+		vreg_s5j_1p2: smps5 {
+			regulator-name = "vreg_s5j_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1j_0p8: ldo1 {
+			regulator-name = "vreg_l1j_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2j_1p2: ldo2 {
+			regulator-name = "vreg_l2j_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3j_0p8: ldo3 {
+			regulator-name = "vreg_l3j_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/x1e80100/hp/omnibook-x14/qcdxkmsuc8380.mbn";
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* type-c PS8830 Retimer #2 0x8 */
+	/* is active on Windows */
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK3>;
+
+		vdd-supply = <&vreg_rtmr0_1p15>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
+		vddar-supply = <&vreg_rtmr0_1p15>;
+		vddat-supply = <&vreg_rtmr0_1p15>;
+		vddio-supply = <&vreg_rtmr0_1p8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
+		orientation-switch;
+		retimer-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss0_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* is active on Windows */
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	eusb3_repeater: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb3_reset_n>;
+		pinctrl-names = "default";
+
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_1p8>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* is active on Windows */
+};
+
+&lpass_tlmm {
+	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp3 {
+	compatible = "qcom,x1e80100-dp";
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+			power-supply = <&vreg_edp_3p3>;
+
+			backlight = <&backlight>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			mdss_dp3_out: endpoint {
+				data-lanes = <0 1 2 3>;
+				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+				remote-endpoint = <&edp_panel_in>;
+			};
+		};
+	};
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+	};
+};
+
+&pcie6a {
+	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-0 = <&pcie6a_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie6a_phy {
+	vdda-phy-supply = <&vreg_l1d_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pm8550_gpios {
+	rtmr0_default: rtmr0-reset-n-active-state {
+		pins = "gpio10";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+
+	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
+		pins = "gpio11";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
+&pm8550ve_8_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		drive-push-pull;
+		input-disable;
+		output-enable;
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
+&pm8550ve_9_gpios {
+	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
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
+&pmc8380_5_gpios {
+	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
+&qupv3_0 {
+	status = "okay";
+};
+
+&qupv3_1 {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/hp/omnibook-x14/qcadsp8380.mbn",
+			"qcom/x1e80100/hp/omnibook-x14/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/hp/omnibook-x14/qccdsp8380.mbn",
+			"qcom/x1e80100/hp/omnibook-x14/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&smb2360_0 {
+	status = "okay";
+};
+
+&smb2360_0_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l2b_3p0>;
+};
+
+&smb2360_1 {
+	status = "okay";
+};
+
+&smb2360_1_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l14b_3p0>;
+};
+
+&swr0 {
+	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* WSA8845, Left Speaker */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Right Speaker */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9385 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010d00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9385 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <34 2>, /* Unused */
+			       <44 4>, /* SPI (TPM) */
+			       <72 2>, /* Secure EC I2C connection (?) */
+			       <238 1>; /* UFS Reset */
+
+	bt_en_default: bt-en-sleep {
+		pins = "gpio116";
+		function = "gpio";
+		output-low;
+		bias-disable;
+		drive-strength = <16>;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	eusb3_reset_n: eusb3-reset-n-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie6a_default: pcie6a-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie6a_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-pull-up;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			output-high;
+			drive-strength = <16>;
+		};
+	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+		max-speed = <3200000>;
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
+&usb_1_ss0_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	phys = <&smb2360_0_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_ss0_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l1j_0p8>;
+
+	status = "okay";
+};
+
+&usb_1_ss0 {
+	status = "okay";
+};
+
+&usb_1_ss0_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_ss0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss0_hs_in>;
+};
+
+&usb_1_ss0_qmpphy_out {
+	remote-endpoint = <&retimer_ss0_ss_in>;
+};
+
+&usb_1_ss1_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	phys = <&smb2360_1_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_ss1_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	status = "okay";
+};
+
+&usb_1_ss1 {
+	status = "okay";
+};
+
+&usb_1_ss1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_ss1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss1_hs_in>;
+};
+
+&usb_1_ss1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss1_ss_in>;
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_dwc3 {
+	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
+	phy-names = "usb2-0", "usb3-0";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb3_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p8>;
+
+	status = "okay";
+};
-- 
2.43.0


