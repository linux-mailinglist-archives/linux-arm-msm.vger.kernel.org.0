Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6083427151D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgITOuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITOuL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:50:11 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6B8C061755;
        Sun, 20 Sep 2020 07:50:09 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l9so10054977wme.3;
        Sun, 20 Sep 2020 07:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZSvMlo2aCMi+j1f6z52wVET/s5K9zz3xW+5LPlJtd8=;
        b=plDb+g35fAY13YMG08mxxFMeHvKtOlWPU2hpQ7JKukN9G+8COKdQ8RFXj9F6sCPH9j
         +AwujXac41IpD627Y61LVOG8iu3NCFTa+Eg0TS1o+P8l319U4GIGLyj87VqKwmHxZt6u
         o28hStiqpazLfctl17dUNnZIHY6W8kibWIDRYOwg4cjKqZrKcHxnP1PL3khMqltlDgls
         NfVnnnAAd88cUbNrsdewJ+VJYTxv5TilPjrnd6FJuSuQoLjKgfJNfWIkqzrt7H77Og3t
         8H9csADghRDlDxw5/F54YyN1DcGQN+4MPvJg3tXdoZ1ovU8MJA672C4HAL3hhE9cPlHf
         URKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZSvMlo2aCMi+j1f6z52wVET/s5K9zz3xW+5LPlJtd8=;
        b=Fm5S25uHL6U83QB2PPCgPcT+zScD3TgD4eb5v/HtIw8m9mfULpO5RrYrAIqAEn187y
         mGU90yNEileq6lIO6djyVsbr71esNxt/YG+boMwOiK2QQ2P+eq2w8B2o1hFkfxtTe3k4
         fVauGrkRwZmTrbGYWsIOvka8dD2EaEM5JJhd7Hfo7HKUn3MIQpYmf759z+M9Z7QytJZ6
         Hb4OjD5aqKiieOl3YRCRkKfGGDKnNzskxPsuNltQyAfu2pcU19X7Z51NtT2y5e5VswJ2
         dztvaZfRKynOLDJcBzXYlYbMpojR/niSVuffVS7lsol0tnaG17zijuKFX+f15N6m45xz
         6hew==
X-Gm-Message-State: AOAM530xfVffEjHnVcVBDWaTc2CyoZ6Ty1zYljzBEW0FPOAuh86Q7rF/
        D/I9mj1MlLsc7qwrXVdSw7M=
X-Google-Smtp-Source: ABdhPJykbVX6jzB5wIsNbTqNWTCqHpDnAxDB5SrF+UN4hYaq7PhtCkZKhxSryMzEmbKx5c9AXFMkHw==
X-Received: by 2002:a1c:488:: with SMTP id 130mr19334218wme.164.1600613408522;
        Sun, 20 Sep 2020 07:50:08 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id m18sm15867228wrx.58.2020.09.20.07.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 07:50:07 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH RESEND 5/7] ARM: dts: qcom: msm8974-klte: Add gpio expander chip
Date:   Sun, 20 Sep 2020 17:48:57 +0300
Message-Id: <20200920144859.813032-6-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920144859.813032-1-iskren.chernev@gmail.com>
References: <20200920144859.813032-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Samsung Galaxy S5 has a GPIO Expander chip, the PCAL6416A with 16
ports on a i2c bus. These pins are used for WiFi, NFC, IR among other
things.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 7b398da9b75ed..29099b83b231d 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -236,10 +236,25 @@ i2c-gpio-led {
 		scl-gpios = <&msmgpio 121 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		sda-gpios = <&msmgpio 120 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&i2c_led_pins>;
+		pinctrl-0 = <&i2c_led_gpioex_pins>;
 
 		i2c-gpio,delay-us = <2>;
 
+		gpio_expander: gpio@20 {
+			compatible = "nxp,pcal6416";
+			reg = <0x20>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			vcc-supply = <&pma8084_s4>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpioex_pin>;
+
+			reset-gpios = <&msmgpio 145 GPIO_ACTIVE_LOW>;
+		};
+
 		led-controller@30 {
 			compatible = "panasonic,an30259a";
 			reg = <0x30>;
@@ -352,7 +367,7 @@ mux {
 			};
 		};
 
-		i2c_led_pins: i2c-led {
+		i2c_led_gpioex_pins: i2c-led-gpioex {
 			mux {
 				pins = "gpio120", "gpio121";
 				function = "gpio";
@@ -360,6 +375,16 @@ mux {
 				bias-pull-down;
 			};
 		};
+
+		gpioex_pin: gpioex {
+			res {
+				pins = "gpio145";
+				function = "gpio";
+
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+		};
 	};
 
 	sdhci@f9824900 {
-- 
2.28.0

