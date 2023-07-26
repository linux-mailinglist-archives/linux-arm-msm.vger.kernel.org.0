Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6368D7640DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 23:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjGZVCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 17:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjGZVB7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 17:01:59 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5632519AD
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 14:01:57 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99342a599e9so19870066b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690405316; x=1691010116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s650GH6eqpBwEm+o4kr4JN+XIhsv0wSwVJ8bWoio1M0=;
        b=V4huKQW1iXcJZ7ZqqAMakZlUy6tukW9IceMpH7GfJA09rbHbAhygEHK8VhXQUMtzm3
         TM7dpVLtZ+HvhCT3HLssQN5t/0ANpM2lh1GeWvlDMxjRigpZZ4KBu2ixNqkz8a2X4jNW
         zLn2490EpgVS/Q22YjOwCYIDZCKcq2NoTgBgVBQYh8xovv7Pitq9a24n2yY/aX8EHkkw
         8PUoY9+evWhSgqhp0fycBN7Mb2iSdKmjtxtWNKQBANGqA3MGx4CFjVm/ZlUHMyDWUrjQ
         V+i6hJgO0rkbnwV7FiWuxtjOpWm9H+hdj77TAe/UMjYWkYRdnJBdd7R97u/6XnruaNds
         +UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690405316; x=1691010116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s650GH6eqpBwEm+o4kr4JN+XIhsv0wSwVJ8bWoio1M0=;
        b=KxrzQVPVg8RPjOb9aCSWz42ftPgdpZiFqtaLpZ32W7F7wG7lrVM7kiB6Gvv3QYyiuN
         +igvJcTWeccgUBpnLFg3wBejHT0CsSA33wPcVSqlsfSg8eMCaiw6GIhGA0Eh8gudpoTs
         0Tt9G+qceOQdsJ/5wE9gxrI5AQtF7LdpvvOPPd3MLnJC+DLE83dR0uw8Am06NjaGgAwS
         6UlO8LMV1F4vew0xRaZjQ/MHzEgpkQP3D/xVVCQZP72zYNfijhozN4RTWE+wz/Ba58Dp
         YO70yu/0afZhSo/41Ie6ac6a89rBL465QKqpesHz83zOSUH2/crTTbGWsRNJkEDFkGr4
         vP0Q==
X-Gm-Message-State: ABy/qLaUBWJwJ1PSMetpNC1W4PyH7SC0Je/cAb1eaQuGhn4rFX+nYxLW
        1gz/f0yK2S7PNV5V8oSXbXOnVPwUbpPt1iHio5c=
X-Google-Smtp-Source: APBJJlGjFW1+WlPCquzPat2j2ADFTGHWCOc785NkIw/63RfTKsC/l1WUcfbz3p1p5WTIIwL07/x69A==
X-Received: by 2002:a17:906:53d2:b0:99a:e756:57bf with SMTP id p18-20020a17090653d200b0099ae75657bfmr256465ejo.7.1690405315831;
        Wed, 26 Jul 2023 14:01:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id d10-20020a17090648ca00b0099b6b8a0d04sm8749227ejt.157.2023.07.26.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 14:01:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: qcom: ipq8064: move keys and leds out of soc node
Date:   Wed, 26 Jul 2023 23:01:52 +0200
Message-Id: <20230726210152.273161-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GPIO keys and LEDs are not part of the SoC, so move them to top-level to
fix dtbs_check warnings like:

  qcom-ipq8064-rb3011.dtb: soc: gpio-keys: {'compatible': ['gpio-keys'], ... should not be valid under {'type': 'object'}
        from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts |  55 ++++----
 arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi | 122 +++++++++---------
 2 files changed, 88 insertions(+), 89 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts
index 1796ded31d17..12e806adcda8 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts
@@ -20,6 +20,33 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&buttons_pins>;
+		pinctrl-names = "default";
+
+		button {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&qcom_pinmux 66 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			debounce-interval = <60>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&leds_pins>;
+		pinctrl-names = "default";
+
+		led-0 {
+			label = "rb3011:green:user";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&qcom_pinmux 33 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
 	memory@42000000 {
 		reg = <0x42000000 0x3e000000>;
 		device_type = "memory";
@@ -302,34 +329,6 @@ partition@0 {
 				};
 			};
 		};
-
-		gpio-keys {
-			compatible = "gpio-keys";
-			pinctrl-0 = <&buttons_pins>;
-			pinctrl-names = "default";
-
-			button {
-				label = "reset";
-				linux,code = <KEY_RESTART>;
-				gpios = <&qcom_pinmux 66 GPIO_ACTIVE_LOW>;
-				linux,input-type = <1>;
-				debounce-interval = <60>;
-			};
-		};
-
-		leds {
-			compatible = "gpio-leds";
-			pinctrl-0 = <&leds_pins>;
-			pinctrl-names = "default";
-
-			led-0 {
-				label = "rb3011:green:user";
-				color = <LED_COLOR_ID_GREEN>;
-				gpios = <&qcom_pinmux 33 GPIO_ACTIVE_HIGH>;
-				default-state = "off";
-			};
-		};
-
 	};
 };
 
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi
index 17f65e140e02..49de9752632f 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi
@@ -14,6 +14,67 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&buttons_pins>;
+		pinctrl-names = "default";
+
+		button-1 {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&qcom_pinmux 54 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			debounce-interval = <60>;
+		};
+		button-2 {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&qcom_pinmux 65 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			debounce-interval = <60>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&leds_pins>;
+		pinctrl-names = "default";
+
+		led-0 {
+			label = "led_usb1";
+			gpios = <&qcom_pinmux 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "usbdev";
+			default-state = "off";
+		};
+
+		led-1 {
+			label = "led_usb3";
+			gpios = <&qcom_pinmux 8 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "usbdev";
+			default-state = "off";
+		};
+
+		led-2 {
+			label = "status_led_fail";
+			function = LED_FUNCTION_STATUS;
+			gpios = <&qcom_pinmux 9 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-3 {
+			label = "sata_led";
+			gpios = <&qcom_pinmux 26 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-4 {
+			label = "status_led_pass";
+			function = LED_FUNCTION_STATUS;
+			gpios = <&qcom_pinmux 53 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
 	soc {
 		gsbi@16300000 {
 			qcom,mode = <GSBI_PROT_I2C_UART>;
@@ -64,66 +125,5 @@ sata@29000000 {
 			ports-implemented = <0x1>;
 			status = "okay";
 		};
-
-		gpio-keys {
-			compatible = "gpio-keys";
-			pinctrl-0 = <&buttons_pins>;
-			pinctrl-names = "default";
-
-			button-1 {
-				label = "reset";
-				linux,code = <KEY_RESTART>;
-				gpios = <&qcom_pinmux 54 GPIO_ACTIVE_LOW>;
-				linux,input-type = <1>;
-				debounce-interval = <60>;
-			};
-			button-2 {
-				label = "wps";
-				linux,code = <KEY_WPS_BUTTON>;
-				gpios = <&qcom_pinmux 65 GPIO_ACTIVE_LOW>;
-				linux,input-type = <1>;
-				debounce-interval = <60>;
-			};
-		};
-
-		leds {
-			compatible = "gpio-leds";
-			pinctrl-0 = <&leds_pins>;
-			pinctrl-names = "default";
-
-			led-0 {
-				label = "led_usb1";
-				gpios = <&qcom_pinmux 7 GPIO_ACTIVE_HIGH>;
-				linux,default-trigger = "usbdev";
-				default-state = "off";
-			};
-
-			led-1 {
-				label = "led_usb3";
-				gpios = <&qcom_pinmux 8 GPIO_ACTIVE_HIGH>;
-				linux,default-trigger = "usbdev";
-				default-state = "off";
-			};
-
-			led-2 {
-				label = "status_led_fail";
-				function = LED_FUNCTION_STATUS;
-				gpios = <&qcom_pinmux 9 GPIO_ACTIVE_HIGH>;
-				default-state = "off";
-			};
-
-			led-3 {
-				label = "sata_led";
-				gpios = <&qcom_pinmux 26 GPIO_ACTIVE_HIGH>;
-				default-state = "off";
-			};
-
-			led-4 {
-				label = "status_led_pass";
-				function = LED_FUNCTION_STATUS;
-				gpios = <&qcom_pinmux 53 GPIO_ACTIVE_HIGH>;
-				default-state = "off";
-			};
-		};
 	};
 };
-- 
2.34.1

