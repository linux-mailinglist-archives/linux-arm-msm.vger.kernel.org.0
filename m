Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 316727B1978
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbjI1LEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbjI1LEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:04:01 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E3C010C4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-504a7f9204eso2434339e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899018; x=1696503818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/srTtQ3Lz+Fleu1LKcLJRlV5earLskJb/E1HQJfyU90=;
        b=rNL0zef30vfNbfxaY4SLFk/izR/hNclEEdXmAS1fc+Uk6j6v+uCAGSbYNZ2lsFfalb
         X0DtoQOjxHh0iCs+8grFjB1lGqoU3cLearPD5r75MBv8jeHamNhO+3osDPtWAmYwWCAQ
         TKJ4nIWHNkapnATe/AQn6LngodsLmVuj4zzCPfktEXcJahjbL6aCuc9+YZBP6P36GJ3m
         4VdCX3BMn09bt8VriOkz/2te7QpgG8gOwOSWvZy92rdJEn+tWG6o4+xw+4ObDY9BoMtc
         aJF2xYKL8Wsjkg2lDfzUIeEb1glD/FvHfz4kl1ZfWzfrn1CYN5XL1pjZiQgDUd6yA+YJ
         ONug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899018; x=1696503818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/srTtQ3Lz+Fleu1LKcLJRlV5earLskJb/E1HQJfyU90=;
        b=hfMvYv7aabFycPYc1eqgrBd3uRaIfctsVnD7lHs/aZeCRNfZqljZP5jg8V8sMqXKdm
         7w1zjJPXjLUO9G10hpeUEQ+zfNGBmEosQ7wSU3td8uaR+dDKtHD8MiTon/3J6ipKiFI5
         sBeXcqQoI+VqEel0Yux/gDbu7yCDSJT5TAd9cNjngUqvppdoEjKznA+XDYuTS7Wb4IGN
         fuODAJaEwblHgecrpyyjX0PvXIWL3lCOCXSA2esmumw43lcrej1EhgFLbVwayXK5GMim
         XieP3+EdBN+F/nLPbbBllOY5pX+EfL4QenTUbyGNbkXE/A/X2Z+MT4DAgvn9L515w7DE
         fpYQ==
X-Gm-Message-State: AOJu0YyVD3PxR/5q8iBQvlu0xD/mXCin6XTtVbU8boqR2ttuNS3Q8fW4
        dvRVgwAKyuurhpNvR7TRY3WQfw==
X-Google-Smtp-Source: AGHT+IF77eOocPnMs7y0Wea6NbCDNefbrDZzk8MHquW64FHVmt8ERyfWY7kHMka4RTpFOwLTLVTwEQ==
X-Received: by 2002:a05:6512:4011:b0:500:9d6c:913e with SMTP id br17-20020a056512401100b005009d6c913emr1026887lfb.52.1695899018683;
        Thu, 28 Sep 2023 04:03:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 32/36] ARM: dts: qcom: msm8974: move regulators to board files
Date:   Thu, 28 Sep 2023 14:03:05 +0300
Message-Id: <20230928110309.1212221-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The vph-pwr and boost regulators (even if they are unified by design)
are not a property of SoC, so move them to board files.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../dts/qcom/qcom-apq8074-dragonboard.dts     | 27 +++++++++++++++++++
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 27 +++++++++++++++++++
 .../qcom/qcom-msm8974-sony-xperia-rhine.dtsi  | 27 +++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi      | 27 -------------------
 .../qcom/qcom-msm8974pro-fairphone-fp2.dts    | 27 +++++++++++++++++++
 .../qcom/qcom-msm8974pro-oneplus-bacon.dts    | 27 +++++++++++++++++++
 .../dts/qcom/qcom-msm8974pro-samsung-klte.dts | 10 ++++++-
 ...-msm8974pro-sony-xperia-shinano-castor.dts | 27 +++++++++++++++++++
 8 files changed, 171 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
index 950fa652f985..d7fb3e0e8886 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
@@ -49,6 +49,33 @@ mpss_region: mpss@ac00000 {
 			no-map;
 		};
 	};
+
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &blsp1_uart2 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index da99f770d4f5..ca402b4a68bd 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -60,6 +60,33 @@ vibrator {
 		enable-gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;
 	};
 
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
+
 	vreg_wlan: wlan-regulator {
 		compatible = "regulator-fixed";
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index 23ae474698aa..a43341ae4495 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -65,6 +65,33 @@ ramoops@3e8e0000 {
 			pmsg-size = <0x80000>;
 		};
 	};
+
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &blsp1_i2c2 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 706fef53767e..d54be72fe3b2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -2376,31 +2376,4 @@ timer {
 			     <GIC_PPI 1 0xf08>;
 		clock-frequency = <19200000>;
 	};
-
-	vreg_boost: vreg-boost {
-		compatible = "regulator-fixed";
-
-		regulator-name = "vreg-boost";
-		regulator-min-microvolt = <3150000>;
-		regulator-max-microvolt = <3150000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-
-		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&boost_bypass_n_pin>;
-	};
-
-	vreg_vph_pwr: vreg-vph-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "vph-pwr";
-
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		regulator-always-on;
-	};
 };
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
index 6c4153689b39..66c422004dcd 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
@@ -57,6 +57,33 @@ vibrator {
 		enable-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
 		vcc-supply = <&pm8941_l18>;
 	};
+
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &blsp1_i2c2 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index c0ca264d8140..6d1412aec45a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -51,6 +51,33 @@ event-hall-sensor {
 			debounce-interval = <150>;
 		};
 	};
+
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &blsp1_i2c1 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
index 325feb89b343..ca3aa16b4b10 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
@@ -155,7 +155,15 @@ vreg_panel: panel-regulator {
 		enable-active-high;
 	};
 
-	/delete-node/ vreg-boost;
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &blsp1_i2c2 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 0798cce3dbea..818ff5835031 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -84,6 +84,33 @@ vreg_vsp: lcd-dcdc-regulator {
 		pinctrl-0 = <&lcd_dcdc_en_pin_a>;
 	};
 
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
+
 	vreg_wlan: wlan-regulator {
 		compatible = "regulator-fixed";
 
-- 
2.39.2

