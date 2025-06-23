Return-Path: <linux-arm-msm+bounces-62054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278FAE3E19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C9D57A9043
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422C22459D5;
	Mon, 23 Jun 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxkPS62p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF3244686;
	Mon, 23 Jun 2025 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678640; cv=none; b=rFuPSsojDvnXnDTKCWT3D0zc4wj4MhmHVHYEcac2ARB0Jzz0owud/ZYWgNda4ucDVE4yvaaGp997pz3onfINfORj5QcZ95gWiR3Z+THnnzPcFBUtqwdrSxuA0eLi3iHvzaLNrDKZh+1CgxAjdu6ZsrOIjW3TAi5QH9gbRqh51QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678640; c=relaxed/simple;
	bh=NuQE+VtPULSKz99eMdkfjSu9DyOuAfygqQqlwXuz5DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VuxeiM+fixmzyaRR9jzoLj2vGpGhwEtWJSMdKgMpq3MzSEmfwIAF8LsFwSiz1WDJp07ulMFOsZ75Sx16dJpOb2/qJNgIH6VlKmnlO32gLAG59gEkGonHmarwBrWhgTqK1cEAxlaf2lEac7ZPLlJ7AoLDt0wkfaDw1+lDdtL7bU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxkPS62p; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so2482153f8f.2;
        Mon, 23 Jun 2025 04:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750678635; x=1751283435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jWXuDqdKGWMgc7gD/OXhFVC0MHK9ISnD4RaPQLw2w4=;
        b=YxkPS62pli3rdgZIzsishWp2LuOqGcr+jppJwRbKUht+Re/ZcyJ5Lo+spO1dpEM57n
         1vwQbUibZE10+rLd1BZ2AYSuUQtUfpQdQlvuDdKPt0cJIutaDvoQxAvEBG0ZAw+UCRqu
         FiyPHeV60+Kj4Xd6Tzj3np7mFD0bn6nJMDc4MmqgfiN6zxFwldLq02vFKYwz7cxwbZZE
         7XvSV0uXTJw+sCFFf93XwfE6jELe1trHa7w+//kLs5aKd2p9lQA+3epyGwEKxHlFdBbn
         Mv0hZzkZw/da48it3B8osQXtM/nfAu0T6psLHL1y2JQIxDvkXqmEEPlGudfDLUdwB0Ey
         bOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678635; x=1751283435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jWXuDqdKGWMgc7gD/OXhFVC0MHK9ISnD4RaPQLw2w4=;
        b=d8MvPd1fuGoIhZ3duUK2nvEUoxUfqlYZkQvBZ9hKFPnVaUbn9Oj+x7z1UamhtO/E0F
         OoPNA69HUi9QOcb/ieVoeBNSap2SMyQNc0ko7t553xli5S2miihc0ifnjJNIPack7i+Y
         02xPDGpmIvInVD4ZtwHR1cR5xc7mYAucUTFloT0abjTV3h/GFIEYd/jL3VhUgLoz4wWQ
         9iDT+Ms5Q4Ak3S2lJ8bmPvHOUfMBS5Dk57QXAxNuGgj9FzdFUC+r7wTVtmMaX2ezb7XM
         IF0Z1+GlBfMxDEdkL5k65ePAj1gs23pOVbbolx+WWC8LQ/I4j2UQec/6aG7JpgXkFcKT
         wNwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7D7rpb7PjJiphp//3qlmPGPL1oycr2gsP7lhiV9jEjSKJTNZh/yt/SOmLf8fUC6qnwAq7OT+nY9fwKBc4Wg==@vger.kernel.org, AJvYcCXvc2jpUXS54foALJxMzemW9gJTT/Re6ZEMljEpqhmCM8mCTSviItWTZ2Y+ME6Do69KfCaZruTrb3jG@vger.kernel.org, AJvYcCXydIE+g0wNws2iPKPXqAZSKPKB83gWQkYVYQuuUCvgeFTiWi3FXCSeUCwEs4dWnsOBlQhqN5VK6cnqi8mo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7tWig3aAxu1/c0gKVFRDdfFONJwHg4FbvzR5MpnpcqlwUZScB
	03VET6/qUOlI6LWlX4ZPl/6CC4n5iqjg8LsaTt9Q5Nd3uPr3JjUNanA=
X-Gm-Gg: ASbGnctmsKQAtrVAm+dJzyiOrxM9vAQvXk4EJbNoIQMQMt5ou6CCfuzbiyukivHaEvI
	6ovlY3VCd435GjG5qCIK3x03lfpIDQ5kMOhb9D/9YAUlz7+03qvCGeBdhxqP/7djsxd510LwrMB
	a8a8Gnu323galNqbQClPUQMdrDW2KFuaKiQ+WPtQffb7GKF0nyJClHRCF0hPuIdhB/Xtv8Hq0w/
	YfVGQPVRQl+g/akG+y9yb94M4S+zkctSMl25TYR1Wp0vx854w50bEKur5iqNTMCC9FKs9fcOKUy
	jlJU4riaQs5fm1jAVgBxlgCS/kk1f8D6buCTD7M4Ms0pFQW83tk2lNqbDplChO6NMJEdc/ZhkKW
	pptEAAjcKkY5e7+Hyzesr1oUygBTo4w==
X-Google-Smtp-Source: AGHT+IEpOJX7JsN4jEoVIV5mmedD+hqVX4ncDzReHmiTrkvg01JZj1k7H6WngFlh2Lo69muO4QbzvQ==
X-Received: by 2002:a05:6000:65a:b0:3a6:d579:b78e with SMTP id ffacd0b85a97d-3a6d579b7f8mr8072036f8f.46.1750678635109;
        Mon, 23 Jun 2025 04:37:15 -0700 (PDT)
Received: from alex-x1.. (mob-194-230-148-213.cgn.sunrise.net. [194.230.148.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18215sm9092625f8f.29.2025.06.23.04.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:37:14 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: x1-asus-zenbook: support sound
Date: Mon, 23 Jun 2025 13:36:14 +0200
Message-ID: <20250623113709.21184-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623113709.21184-1-alex.vinarskis@gmail.com>
References: <20250623113709.21184-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Works:
* Both speakers
* Both MICs
* Headphones jack, L/R channels
* Headphones jack, MIC

Now working/untested:
* Sound over DisplayPort
* Sound over HDMI

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index c8d6d66d05c8..c771fd1d8029 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -22,6 +22,32 @@ aliases {
 		serial1 = &uart14;
 	};
 
+	wcd938x: audio-codec {
+		compatible = "qcom,wcd9385-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
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
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -149,6 +175,88 @@ linux,cma {
 		};
 	};
 
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-ASUS-Zenbook-A14";
+		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS1",
+				"VA DMIC1", "MIC BIAS1",
+				"VA DMIC0", "VA MIC BIAS1",
+				"VA DMIC1", "VA MIC BIAS1",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
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
+			codec {
+				sound-dai = <&wcd938x 1>, <&swr2 1>,
+					    <&lpass_txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			codec {
+				sound-dai = <&wcd938x 0>, <&swr1 0>,
+					    <&lpass_rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
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
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_edp_3p3: regulator-edp-3p3 {
 		compatible = "regulator-fixed";
 
@@ -372,6 +480,13 @@ vreg_bob2: bob2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l2b_3p0: ldo2 {
 			regulator-name = "vreg_l2b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -843,6 +958,24 @@ keyboard@15 {
 	};
 };
 
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
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &mdss {
 	status = "okay";
 };
@@ -1045,6 +1178,59 @@ &spi10 {
 	/* Unknown device */
 };
 
+&swr0 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-names = "default";
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
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
 			       <90 1>;	/* Unknown, TZ Protected */
@@ -1175,6 +1361,14 @@ usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
 		bias-disable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
 	wcn_bt_en: wcn-bt-en-state {
 		pins = "gpio116";
 		function = "gpio";
-- 
2.45.2


