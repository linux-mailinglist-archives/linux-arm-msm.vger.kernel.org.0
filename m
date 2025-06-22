Return-Path: <linux-arm-msm+bounces-61974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38833AE3036
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 15:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB4A4163F65
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 13:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C347C1EA7E4;
	Sun, 22 Jun 2025 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ov07dk9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76BC1E1DE7;
	Sun, 22 Jun 2025 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750599790; cv=none; b=OuJ3KE7eJysqJg6Zi/XYJ0Z4Er0njs+ZO+iZ5dPLuwBvEkke/kFaKelZS9DLpZTV6aQWTAOcYe00sDnU0vkCFZADiM0ImqFdgog+zkg1psReTWCGL93Cp2Y3zlIjB4tZc/WRQxyo8VzjS1ceQAsnDw09aWqKONMOP8ypAqAH95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750599790; c=relaxed/simple;
	bh=DcAbh50nJ/9+gl7gbnxkWQz+6p4e4XzKjPqGtKppBoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njsFpiGoHGJJwqThMaUeaVQQfhNz7I3azng54cJx++quIKa11HeFSctRstjfOPlDNoK2vPWv3jZjaqCP+dxp5q/S1NiLEyavlWuMpdJvFRl+kEN6+ybDph5zjaXuU7rM3+Ks/GIBGzRyOCItqZmFvAvg4R81I4EMl8+W0es71mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ov07dk9i; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so6470898a12.3;
        Sun, 22 Jun 2025 06:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750599787; x=1751204587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKxND9wDhUqTTJe60cYRYDByv8VnJJT28t+GbpuOw+w=;
        b=Ov07dk9ibMvwXbBuSomem/2yRePWXGi7pf1JxvCxPBCuZHp8MCErnOXEueN1R5ExsI
         bRzP+N1PrhNxRjf7oaUF6h0MY14QzKEOiOqx24yb1HIcvkDNdgr15ET5ecdHBGQ23bH5
         vRScPSoh+xS7nCUFIPdDi6UBaOeGES7+lHyNhWxQkOdrATSZH6FzjvHfS430b65oasRM
         IZS4KpELDLaBg4rAytY3iO6K6a67RLyuQv3Vz7/Q0TV0lDfRDrFEoSNuFQl+NP2T9cva
         zPjzIYdxhG0QF+4bf7IqowzBznJAeq0EYKKqpRh0gU11RtZjvLzv1NpdfOJnrz13ziqE
         Ew/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750599787; x=1751204587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKxND9wDhUqTTJe60cYRYDByv8VnJJT28t+GbpuOw+w=;
        b=NZy1RRyjrTM8npRtHszW+2URs3OQ2NRgdayHdbCl3t/JER6u2lmSzT6wg2S8O6L6/9
         OwU8VQREUksE3H8G4vcb1H+0EjD9dDvFEUzIVD3faj4cl5r60+dWu5wmEfFW+5E7hD1B
         fsoZGa29BUqi3/icSywo1jn7izpPtTOwdVfZaLfPYgOjEXoAba/4Zl9+A8i7dY524gbk
         EByP4DDECZL9PE7ANhGx9QoMs5XsJr/oLJKyh8+o6TqnWDDGPylEinEE+x++xIpUwJLL
         xDpX8Xf4HlyjC0mn81HWcyOyDyNNSo34Pnmxsm7PAjcdGkQraWy/2eY5c06vJF2fj7MQ
         DXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtEfbjbD0X77CrDEgJ9xMpAKsjMIR9CULpGE5pmfZcQH3GYAthPOYiwS/ESXi66X4USIIbkOJur2cU@vger.kernel.org, AJvYcCW+x296bnlGUq49caZWU+ssZrBl238gHrkJw6DsQniKSTfW/SEXTnNIwkMYG6vLtYeWtPe2Z489JuFqhEsM@vger.kernel.org, AJvYcCWz0990XIh1wSRsE0MAmLT77cn8+hEen99ndhqKS6NeoCZLYjwOywv4Ac6DtmUw9Zyq4jKS2QFLP5XU6QqsuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9bs72ke41ElzA8fYo0VjgidIfTALh5mXrwlF1xIG86hPjq9AX
	/B17LtH1jFn+FnkjzaxF6xYYPRnPaP/jPJUo+D+3I8vcApkZFfFQTz9Y7drrNQw=
X-Gm-Gg: ASbGncuWa7V7ar/DTGGsjm7WYs6e3Kwcm37+kn2aJdYtzq78KN61d2baCwtakvT7AVG
	O/FIfwqmwsCG3DZYiWx8IeRaSWp7+/MajCOYNNBOUJaPbN3WzA8XdNhZhDsXxlXI75IEDqxtpS6
	hV2n1Ocjcd6BCuGlg7R0kggRAof3z2L4Hv+31+VZyzzk6snE5Seup71bsIyLC9ancuH5HuJwJhZ
	lI3887i4sQV++Y6eRPFF/qjHorc1WUSsij23kN2NLPVAaQeWYAaH3lDEVNSXEtPU8Y31oL7vXtC
	DWNzfO+4F4IdN/Q88AwS4Vd2pTpQz3HBK9y4K68pOw4DUBB+ldPYbjdeuO6s2yv6epgqXp7h+nk
	RBmY=
X-Google-Smtp-Source: AGHT+IHeC3wpaGuXsxsGS1ou5yDXSrA2CWtnGo1/tOsnyk09UcUcyVKGoDq84C/WLDo5IEQIppyBxQ==
X-Received: by 2002:a05:6402:2355:b0:5f6:fab2:9128 with SMTP id 4fb4d7f45d1cf-60a1d16761dmr8484214a12.19.1750599786714;
        Sun, 22 Jun 2025 06:43:06 -0700 (PDT)
Received: from alex-x1.localdomain ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm4654457a12.53.2025.06.22.06.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 06:43:06 -0700 (PDT)
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
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 2/2] arm64: dts: qcom: x1-asus-zenbook: support sound
Date: Sun, 22 Jun 2025 15:40:01 +0200
Message-ID: <20250622134301.10403-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622134301.10403-1-alex.vinarskis@gmail.com>
References: <20250622134301.10403-1-alex.vinarskis@gmail.com>
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

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index c8d6d66d05c8..80cd3613c5b8 100644
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
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 1>, <&swr2 1>,
+					    <&lpass_txmacro 0>;
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
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 0>, <&swr1 0>,
+					    <&lpass_rxmacro 0>;
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
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
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


