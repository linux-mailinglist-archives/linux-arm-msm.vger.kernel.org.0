Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9B762F926
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 16:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242212AbiKRPUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 10:20:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242195AbiKRPUh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 10:20:37 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBDF2C671
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 07:20:36 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id d3so7199605ljl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 07:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt1Oc0ujq+8ARYNZpTY4my+ocgdokMPqWBidtFrPicc=;
        b=veZLUju0OZcLrca1Tev5vJEV7hltIl62XDCxKODQ7PQNYvXwgWv3nvesnEEirRUohl
         WhWgbXoZbyh1Sg4IMRI9qfX9O/mVR1YpWEeC54qRL0iDTxGVXcOxlhRmOO8DbGV8BZqD
         0KnQrkXnAQeSXMQGFYN5CW5sude1YMPaEEG9fCmSnJofMGn1ht4V//QLi5osUMWZCwWB
         RyW6/tBlkq8AvndrloX6PNOGxsmvnKz9nUdsWcbp6NQfepPC4S7EBsNNxoJBKZpicFM1
         Cdj4D20aEsaeKGjZrQocGO5Fq7gi2PZ1kAVK4sOPQQ/uw9/D1kgkkaalKVvoYQxpqFNQ
         2Clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mt1Oc0ujq+8ARYNZpTY4my+ocgdokMPqWBidtFrPicc=;
        b=UzbpQTHJBnWks46cGXRm+HMzh1rno/COzUc/oeHipzx9LERyqvx1jkLXVuP6GryVm+
         zcyaoBfH+0+Kn/qN5VGMKJj8hypU3XNEDIQaKbVrwZy0NKaANbmhV013PFbnsS3wmnpp
         9Mauge9IK2AS7Ks6AFK2zGj2oRCa0s5jvjFJarV/Q40UffPsTbsHAi0VIT97f2sHj1h+
         c1WLbUp1VXJEBgTFRBMUjT/r1/MJo87Sw6AFCO7Go+6Q4SOFHc5tH/EwjceFakX0BOss
         vKw3E6JP9pH2f6d9mRl7mn49ye3sDej/cOYTOavdKFsM0UKDNRwYDyblfD1Q8pLbpe6i
         oR3g==
X-Gm-Message-State: ANoB5pmWe7ohxQTnpP69MYI9Xjbwu3m+4l1yivg8RxzQFD+OOGMmFlkt
        /pC6FZ9LdU4nJL8PB7HE4Gp7QELFtd+T04l/
X-Google-Smtp-Source: AA0mqf5hlu4uHwk4LzPNIZkF/atO8Pz4NWHiF2ank783WcL1uP9fp09juYtV0GhRLysjeUsSj3RCug==
X-Received: by 2002:a05:651c:1250:b0:279:d87:7bc6 with SMTP id h16-20020a05651c125000b002790d877bc6mr2564785ljh.225.1668784834094;
        Fri, 18 Nov 2022 07:20:34 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 12-20020ac25f0c000000b004948ddb4e4dsm690597lfq.301.2022.11.18.07.20.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Nov 2022 07:20:33 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm8350-sagami: Configure SLG51000 PMIC on PDX215
Date:   Fri, 18 Nov 2022 16:20:27 +0100
Message-Id: <20221118152028.59312-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221118152028.59312-1-konrad.dybcio@linaro.org>
References: <20221118152028.59312-1-konrad.dybcio@linaro.org>
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

Remove the mention of this PMIC from the common DTSI, as it's not
used on PDX214. Add the required nodes to support it on PDX215.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../qcom/sm8350-sony-xperia-sagami-pdx215.dts | 66 +++++++++++++++++++
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  2 +-
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts
index c74c973a69d2..d4afaa393c9a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts
@@ -12,6 +12,72 @@ / {
 	compatible = "sony,pdx215-generic", "qcom,sm8350";
 };
 
+&i2c13 {
+	pmic@75 {
+		compatible = "dlg,slg51000";
+		reg = <0x75>;
+		dlg,cs-gpios = <&pm8350b_gpios 1 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_pwr_a_cs>;
+
+		regulators {
+			slg51000_a_ldo1: ldo1 {
+				regulator-name = "slg51000_a_ldo1";
+				regulator-min-microvolt = <2400000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			slg51000_a_ldo2: ldo2 {
+				regulator-name = "slg51000_a_ldo2";
+				regulator-min-microvolt = <2400000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			slg51000_a_ldo3: ldo3 {
+				regulator-name = "slg51000_a_ldo3";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3750000>;
+			};
+
+			slg51000_a_ldo4: ldo4 {
+				regulator-name = "slg51000_a_ldo4";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3750000>;
+			};
+
+			slg51000_a_ldo5: ldo5 {
+				regulator-name = "slg51000_a_ldo5";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			slg51000_a_ldo6: ldo6 {
+				regulator-name = "slg51000_a_ldo6";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			slg51000_a_ldo7: ldo7 {
+				regulator-name = "slg51000_a_ldo7";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3750000>;
+			};
+		};
+	};
+};
+
+&pm8350b_gpios {
+	cam_pwr_a_cs: cam-pwr-a-cs-state {
+		pins = "gpio1";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <1>;
+		drive-push-pull;
+		output-high;
+	};
+};
+
 &tlmm {
 	gpio-line-names = "APPS_I2C_0_SDA", /* GPIO_0 */
 			  "APPS_I2C_0_SCL",
diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index 6ae700e72d1e..8f32b2799bcb 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
  */
 
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8350.dtsi"
 #include "pm8350.dtsi"
@@ -506,7 +507,6 @@ &i2c13 {
 	clock-frequency = <100000>;
 
 	/* Qualcomm PM8008i/PM8008j (?) @ 8, 9, c, d */
-	/* Dialog SLG51000 CMIC @ 75 */
 };
 
 &i2c15 {
-- 
2.38.1

