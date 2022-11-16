Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E552262B76A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbiKPKOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbiKPKOD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:14:03 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF535B32
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:13:23 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id h12so21186746ljg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpQGpxdfbdlTnJsvlWY89+wp3XHFdGWgbsddTZ6kjtg=;
        b=uzZg58Qxmx+lhfFKd5kb5Tww3HMuSXyGSfJBY3aa3GhrV17xczFLJ4fgyiV2PleAHv
         tOFqXiPdb7mFoifmPnzGoQFXf/MvU13aPfzo4HxF/R3sv0QR5B0Bz9Yr3+8gbIoJKQT5
         uElKFlHsEahKL5jUrq63xZAm12lkP2xuobL5dja9r2gDsim5bU6JvlC1isOB6qg0bifb
         xkz1SGmwIAJK2tqH9US+yaC8W/gNCbWnGKhu6pQavB7BAkni4fPrhzMrBjXvBqrz6khO
         GU6EZtfdlKjXlPAh4e6E57koglom02mf437WjyFzpQ8+15V1uXnS0hdqKB7bGj60IKkJ
         Eo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpQGpxdfbdlTnJsvlWY89+wp3XHFdGWgbsddTZ6kjtg=;
        b=AJj6nQFM9svbs8Rmxvg4peLNQtPvoqs8n3My7uWxL9gmoXxvVSHURxFO0vVwQgVssK
         lPIlsWlaCf4Uhm9sjefqCeaTqz8/c871Zc3p22l0LIL02zjKMyzytcA7Mx1A4uuyruXI
         C8zChTnk8yRT88aRbNDqqbfs9SQYpee8mEuSj3hw/yAcx0Z5IuP55H99U5lUYT5U8bsT
         oE/2hWK98K83rAQDdOFELMgI4x1g0xr7PMFvR8sB4cy3U5YZzXrz4TGb06gILWbw03F5
         KogsHCzURKnxiaZJadleXrxGF/Ya9kPUhY9qUkz9zGXrjahlM55HSaol3mMHVhPcYCUu
         pUzA==
X-Gm-Message-State: ANoB5pm5ribV0Yr/JUEap3ml0scrqC2lT91838/jPUtcPn/GRFjN5LdS
        2b2P6Xi44jAgxDuRDu/uQ611RA==
X-Google-Smtp-Source: AA0mqf4IRx0qVeBXtgXWh7EjdMi0gKpWnpgKuso+SM63Ff1koG4h4C2PHoqTzbjOJQ6/Y6JQ8qCcsw==
X-Received: by 2002:a05:651c:19a6:b0:277:3a1:e86d with SMTP id bx38-20020a05651c19a600b0027703a1e86dmr8202384ljb.152.1668593602285;
        Wed, 16 Nov 2022 02:13:22 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a10-20020a056512020a00b004a45f2e49b1sm2514432lfo.273.2022.11.16.02.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:13:21 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8450-hdk: add sound support
Date:   Wed, 16 Nov 2022 11:13:14 +0100
Message-Id: <20221116101314.52887-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116101314.52887-1-krzysztof.kozlowski@linaro.org>
References: <20221116101314.52887-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add sound support to SM8450 HDK board.  Tested setup so far is only two
speakers (working) and head-phones (only one channel working).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v2:
1. Use ACTIVE_LOW for qcom,wcd9380-codec reset-gpios.
   https://lore.kernel.org/all/20221116053817.2929810-11-dmitry.torokhov@gmail.com/

Changes since v1:
1. Sort.
2. Correct include - do not use deprecated one and drop q6asm.h (not
   used).
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 160 ++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4d75f9db08c2..1e1393e732ca 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sm8450.dtsi"
 
 / {
@@ -406,6 +407,147 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&soc {
+	wcd938x: codec {
+		compatible = "qcom,wcd9380-codec";
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
+		reset-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <1>;
+
+		vdd-buck-supply = <&vreg_s10b_1p8>;
+		vdd-rxtx-supply = <&vreg_s10b_1p8>;
+		vdd-io-supply = <&vreg_s10b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob>;
+	};
+};
+
+&sound {
+	compatible = "qcom,sm8450-sndcard";
+	model = "SM8450-HDK";
+	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+			"SpkrRight IN", "WSA_SPK2 OUT",
+			"IN1_HPHL", "HPHL_OUT",
+			"IN2_HPHR", "HPHR_OUT",
+			"AMIC1", "MIC BIAS1",
+			"AMIC2", "MIC BIAS2",
+			"AMIC3", "MIC BIAS3",
+			"AMIC4", "MIC BIAS3",
+			"AMIC5", "MIC BIAS4";
+
+	wcd-playback-dai-link {
+		link-name = "WCD Playback";
+		cpu {
+			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+		};
+
+		codec {
+			sound-dai = <&wcd938x 0>, <&swr1 0>, <&rxmacro 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wcd-playback-dai-link {
+		link-name = "WCD Playback";
+		cpu {
+			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+		};
+
+		codec {
+			sound-dai = <&wcd938x 0>, <&swr1 0>, <&rxmacro 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wsa-dai-link {
+		link-name = "WSA Playback";
+		cpu {
+			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+		};
+
+		codec {
+			sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&wsamacro 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	va-dai-link {
+		link-name = "VA Capture";
+		cpu {
+			sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
+
+&swr0 {
+	right_spkr: speaker@0,1{
+		compatible = "sdw10217020200";
+		reg = <0 1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		powerdown-gpios = <&tlmm 1 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_s10b_1p8>;
+	};
+
+	left_spkr: speaker@0,2{
+		compatible = "sdw10217020200";
+		reg = <0 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		powerdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_s10b_1p8>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
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
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		/* ports: adc1_2, adc3_4, dmic0_3_mbhc, dmic4_7 */
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <36 4>;
 
@@ -461,3 +603,21 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l1b_0p91>;
 };
+
+&tlmm {
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio1";
+		function = "gpio";
+		drive-strength = <4>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio89";
+		function = "gpio";
+		drive-strength = <4>;
+		bias-disable;
+		output-low;
+	};
+};
-- 
2.34.1

