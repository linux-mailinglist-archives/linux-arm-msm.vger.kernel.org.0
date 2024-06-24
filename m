Return-Path: <linux-arm-msm+bounces-24010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407939153F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 18:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 640881C23019
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3631E19E7EE;
	Mon, 24 Jun 2024 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZ1FBJ+d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B6419E7D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 16:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246837; cv=none; b=HoDIqt/0mOMgjbLepA9TkbIyytdYRipleMI/ytJoFYbThiQFF5hkT4VWK9VW4gu5qf9f5mXmrbKlbP5EWp0XRpKcBu6Xj3hYeIHGKcLTCE4GqYtFmfeqAFzRnFckZfezEkSphWkwm928FaUR8okE5CE9fIvcKA/SB7c0KJ9/ReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246837; c=relaxed/simple;
	bh=ePLTU3MVmoYysngJOsWhUdOR/IkiiLLf0YE6F/whMG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B7/cLYqaI0kQZDyzTSW7IIApl+rG2tVFJMpswul9TBP9CbPQW57pk2m+0JfFHdzdYRVy4wQjpDK8+dS+tTvVgBnI//kEpEcrvlAl6nByIGr/8oS3w7ffXaoAiPtSGZkwLqJymFZ5wwJ25ldbr6s6vs+lBE1wQzszSIJJQ5L1jSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BZ1FBJ+d; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-421d32fda86so50099305e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 09:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719246833; x=1719851633; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPB8AEXrk7JwEaJcT35joxIm2q6uTszDlsxeaOMhunQ=;
        b=BZ1FBJ+diHtsu4FKfuuOAYgBEO2Z74kwQcW6bvP2YZU8K5ptRJ7Koi9jU2FJ7mDrIS
         72IFxi5XSOKnxr8VzXr0UzoxU/qHvpQv9t+P7gjsjNs9bHkIqr8M8JcMKYgIjddY1/2y
         XooiQfa1kTzEvUAu81pUWpUy5PJJkJxJFHWEikJWzWrcACmoV+cN2yR5ym8NQNOPzTTN
         2+GF4TbKLUBUb+z31IKolvSFg6PZkfkLBzIF058bc+6LeJKKlsYrH0HqO2mAZ99uiAAC
         8rcU3Nrv1r7/Pae6V1pEBapiWE/UE/INnBfMvC1LhdDgYjkDKHVO9crsM1mdYnHemM2s
         ZycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246833; x=1719851633;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPB8AEXrk7JwEaJcT35joxIm2q6uTszDlsxeaOMhunQ=;
        b=Lauw6AfS+H9qz6gLX6qRCl6U+czd0KuXoFKC/VBiAg44Mp04Czx960mYZac+TUZQQF
         e4TsO2Cj6YLOrW+wiKm3qktX7rHUoevVG3cPRdv7oCvFU3PsFkwbfcf6VO2h4UX7GO23
         cbNNbtpVkEjG3HkvmL+hjASOMsKKqx/E/K8x43AcbHz/RQpOS3U/zRM+f+wD32xjB4OV
         XBK9qF0H7wHGHlPeL77T35fOZX1kjGazOlco6lHErBXI4nGaQWW1HVlRUhBUz6UhtMOP
         5FKo3vLx1l4zJ1B1ETAEBshv6mkNB+j9m1CEpSXjkAA/Wjrv/IZ3ZtR1P0ryaQLe8QEf
         6EQA==
X-Gm-Message-State: AOJu0Yxk8/RBAPURx05OAovnIVtrGQ2IELuSsmeJuARYEDoGroHyLuSx
	JWo6ii5E/VkHfTVEzCbiRS7kj5M0sh9esHQQY9agImWNSRHodYZG9hXdk4LYcHk=
X-Google-Smtp-Source: AGHT+IH6aHHAbz234y/LW0+FZWOgpjse2wJCMDlHm5Bpni+PpOamfKNE1xxUNOAddUF+INn4Tv6ruw==
X-Received: by 2002:a05:600c:354f:b0:424:798a:f803 with SMTP id 5b1f17b1804b1-4248cc586f7mr42319465e9.30.1719246833492;
        Mon, 24 Jun 2024 09:33:53 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c5179sm177636375e9.26.2024.06.24.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:33:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Mon, 24 Jun 2024 17:33:41 +0100
Subject: [PATCH] arm64: dts: qcom: x1e80100-qcp: add audio support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-qcp-audio-v1-1-323a6b5e1fe5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOSfeWYC/x2NQQ6CQAxFr0K6tglOihqvYlwMbZEunIGOGhLC3
 R1Yvvz381Yo6qYF7s0Krj8rllOF86kBHmN6KZpUhtAGai+BcOYJ41csowgF4quQdjeofh+LYu8
 x8bg/Zs5vHLJj0uWz75PrYMvRejy37Q9Lq67eewAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4810;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=ePLTU3MVmoYysngJOsWhUdOR/IkiiLLf0YE6F/whMG8=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmeZ/w0SYAwP1bn1baA4OosqYp1rsFUYRiDgylo
 /pEOKZFvwaJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnmf8AAKCRB6of1ZxzRV
 N3ehB/4gGk4RmImocaqA2JjLsDWZT0MqnyPqT0cRzlL9rXXJ7kYZjhP9bY/HKzi1JFSuaLBFM4z
 8BKJgndZ9MUKf0wvkVOA5+B8+jzcwPt1HUv10ANE55KLRL755To/6SASUTTZ/Rkk3zRxJsmm3gA
 ouaTk32WimG3jPD/5sssGAf60qiRdB6STOMes1gicrZEFOoHun/3OVzduH84B3bW2ODCmRR5urV
 GZqvmfBm44A60/nYbi30SWsWgkNxCi8mQHe3oEXdoeYzAo/SAgZePwfhsgeHls7ifoZiKm73JqH
 gmvkONPp3HwU2OEPmGlb26+oEBT3ng1ug1lHNx1Gh9jDOFSW
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Add audio support to QCP platform which includes 2 x Speakers
Headset Mic and Headset support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 155 ++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index b045b7bac9e0..02d30c0ada80 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -19,6 +19,32 @@ aliases {
 		serial0 = &uart21;
 	};
 
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
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -127,6 +153,66 @@ linux,cma {
 		};
 	};
 
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-QCP";
+		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
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
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -520,6 +606,16 @@ vreg_l3j_0p8: ldo3 {
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
 &mdss {
 	status = "okay";
 };
@@ -638,6 +734,57 @@ &smb2360_2_eusb2_repeater {
 	vdd3-supply = <&vreg_l8b_3p0>;
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
+		#sound-dai-cells = <0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+	};
+
+	/* WSA8845, Right Speaker */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
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
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
@@ -679,6 +826,14 @@ wake-n-pins {
 		       bias-pull-up;
 	       };
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart21 {

---
base-commit: 781025f172e19ca5682d7bfc5243e7aa74c4977f
change-id: 20240624-qcp-audio-dd424c7d4e58

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


