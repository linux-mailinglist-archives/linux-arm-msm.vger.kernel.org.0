Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF54161F6C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 15:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbiKGO4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 09:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbiKGOz4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 09:55:56 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307B31DDE0
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 06:55:39 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id y14so30784346ejd.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 06:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9ReWYsqv/4y+sVAlfDMPpZttGbDSSM7AqAH827M+f0=;
        b=Tbi7dDc2Kv2SuE3Z8kIWoV3w8Cg/nM6Zh6Zt5fQuZ8xLSLjvkDkeTjUMsCacp8bRma
         WFkGv0GN8+7MOL1GoGAqE/RCYZh3VpIrzKUzygzebFUAkzezRBJZ41UQtSYS0rMTDhba
         ZBdADczQXDQZNCs/4ijObFqvuB+sio6jUYFIQyaEwxmxsHSTqi3Kt5qGzbN/38lTnprB
         AGH2uK629nS47IV5THztLlSIMXCzOOKT1vd0ImPNtr98IJW+Vw39rIx6KzI3WMEeiGsT
         t8PhF3uLEwggVrwFuYj0Xx/+bMFP9iQca0rvV4HwaKebk7Ep//kMbpY/tFxk0wImkYUc
         V8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9ReWYsqv/4y+sVAlfDMPpZttGbDSSM7AqAH827M+f0=;
        b=tYqx+LuePPk6RHl+UlV8gRme6ALGRRUQ43SasRe2+eKc7/wVgNzxAM+XCPGGFU5UvN
         p9SR2PmdaG279Chz3886fVD7S+LxMSJwKfaU4rGes3mNbP8u97N5HyuBuWNwN0pJkLPp
         gvte+SLD21wI9surPvRD22CpXQTf8JDwBAVKEFBkQZoL0jhwbL31dBpnJzFqHmpgAAIM
         puZYYUAxIP3hLo5bLrnu/hLA7uEWmcMByFDN0whd9mkMDuoX7JD1+mRy3XLnusLugLFb
         nWF8mfMlGnHqR3kSU0pEyn9jfWE5XhG8CqEOy+mO3K+f5uOv6Vem3CWIaTW3OH/YRmPR
         CBFA==
X-Gm-Message-State: ACrzQf2qjOpR7hQkTX21+Awwatfr6LM81xp7g+/0YeBv/+cMxH55CMIq
        u+Mj3Efnyyld7XBomX2PzWdbzF9eQgST3p+w
X-Google-Smtp-Source: AMsMyM73I1INxXt21DKrq/DTY1o/MBJffHEG4zDQZ9SajV/YuYDKAWKRI1NLGEMWcPAFVWojY9FjEQ==
X-Received: by 2002:a17:906:8a6a:b0:79e:2efe:e0 with SMTP id hy10-20020a1709068a6a00b0079e2efe00e0mr49217496ejc.401.1667832937413;
        Mon, 07 Nov 2022 06:55:37 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id d1-20020a1709067f0100b0078907275a44sm3503049ejr.42.2022.11.07.06.55.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 06:55:36 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] arm64: dts: qcom: sdm845-*: Fix up comments
Date:   Mon,  7 Nov 2022 15:55:16 +0100
Message-Id: <20221107145522.6706-7-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221107145522.6706-1-konrad.dybcio@linaro.org>
References: <20221107145522.6706-1-konrad.dybcio@linaro.org>
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

Switch '//' comments to C-style /* */.
Make sure all multiline C-style commends begin with just '/*' with
the comment text starting on a new line.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 38 +++++++++++--------
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  5 ++-
 .../boot/dts/qcom/sdm850-samsung-w737.dts     |  2 +-
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 8ba3188ac4c3..ea092e884b45 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -120,9 +120,11 @@ lt9611_3v3: lt9611-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		// TODO: make it possible to drive same GPIO from two clients
-		// gpio = <&tlmm 89 GPIO_ACTIVE_HIGH>;
-		// enable-active-high;
+		/*
+		 * TODO: make it possible to drive same GPIO from two clients
+		 * gpio = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		 * enable-active-high;
+		 */
 	};
 
 	pcie0_1p05v: pcie-0-1p05v-regulator {
@@ -133,9 +135,11 @@ pcie0_1p05v: pcie-0-1p05v-regulator {
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
 
-		// TODO: make it possible to drive same GPIO from two clients
-		// gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
-		// enable-active-high;
+		/*
+		 * TODO: make it possible to drive same GPIO from two clients
+		 * gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
+		 * enable-active-high;
+		 */
 	};
 
 	cam0_dvdd_1v2: reg_cam0_dvdd_1v2 {
@@ -195,9 +199,11 @@ v5p0_hdmiout: v5p0-hdmiout-regulator {
 		regulator-min-microvolt = <500000>;
 		regulator-max-microvolt = <500000>;
 
-		// TODO: make it possible to drive same GPIO from two clients
-		// gpio = <&tlmm 89 GPIO_ACTIVE_HIGH>;
-		// enable-active-high;
+		/*
+		 * TODO: make it possible to drive same GPIO from two clients
+		 * gpio = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		 * enable-active-high;
+		 */
 	};
 
 	vbat: vbat-regulator {
@@ -1192,7 +1198,7 @@ camera@10 {
 		compatible = "ovti,ov8856";
 		reg = <0x10>;
 
-		// CAM0_RST_N
+		/* CAM0_RST_N */
 		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam0_default>;
@@ -1201,7 +1207,8 @@ camera@10 {
 		clock-names = "xvclk";
 		clock-frequency = <19200000>;
 
-		/* The &vreg_s4a_1p8 trace is powered on as a,
+		/*
+		 * The &vreg_s4a_1p8 trace is powered on as a,
 		 * so it is represented by a fixed regulator.
 		 *
 		 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
@@ -1229,10 +1236,10 @@ &cci_i2c1 {
 	camera@60 {
 		compatible = "ovti,ov7251";
 
-		// I2C address as per ov7251.txt linux documentation
+		/* I2C address as per ov7251.txt linux documentation */
 		reg = <0x60>;
 
-		// CAM3_RST_N
+		/* CAM3_RST_N */
 		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam3_default>;
@@ -1241,7 +1248,8 @@ camera@60 {
 		clock-names = "xclk";
 		clock-frequency = <24000000>;
 
-		/* The &vreg_s4a_1p8 trace always powered on.
+		/*
+		 * The &vreg_s4a_1p8 trace always powered on.
 		 *
 		 * The 2.8V vdda-supply regulator is enabled when the
 		 * vreg_s4a_1p8 trace is pulled high.
@@ -1257,7 +1265,7 @@ camera@60 {
 		port {
 			ov7251_ep: endpoint {
 				data-lanes = <0 1>;
-//				remote-endpoint = <&csiphy3_ep>;
+/*				remote-endpoint = <&csiphy3_ep>; */
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 5d99908d4628..a51ec7fb1746 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -50,7 +50,8 @@ key-vol-up {
 	};
 
 	reserved-memory {
-		/* The rmtfs_mem needs to be guarded due to "XPU limitations"
+		/*
+		 * The rmtfs_mem needs to be guarded due to "XPU limitations"
 		 * it is otherwise possible for an allocation adjacent to the
 		 * rmtfs_mem region to trigger an XPU violation, causing a crash.
 		 */
@@ -433,7 +434,7 @@ &mdss {
 	status = "okay";
 };
 
-/* Modem/wifi*/
+/* Modem/wifi */
 &mss_pil {
 	status = "okay";
 	firmware-name = "qcom/sdm845/oneplus6/mba.mbn", "qcom/sdm845/oneplus6/modem.mbn";
diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index f93d748e2c94..b712834a5d64 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -43,7 +43,7 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		// Firmware initialized the display at 1280p instead of 1440p
+		/* Firmware initialized the display at 1280p instead of 1440p */
 		framebuffer0: framebuffer@80400000 {
 			compatible = "simple-framebuffer";
 			reg = <0 0x80400000 0 (1920 * 1280 * 4)>;
-- 
2.38.1

