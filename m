Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CEF459C70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 07:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhKWGzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 01:55:50 -0500
Received: from mx1.riseup.net ([198.252.153.129]:33602 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229728AbhKWGzu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 01:55:50 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HyvwB34LrzDv2X;
        Mon, 22 Nov 2021 22:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1637650362; bh=2crRhYBlklLB+/OAkE79DuwqwJdO0OVKUmuw9Rbx/s0=;
        h=From:To:Cc:Subject:Date:From;
        b=a3ZcqkLIwwPx12xnNt+1HVT/uXYXrdX+fUUOhyaC/zqsYGYaWQ8rBS/tuNXSVV7NR
         Codl/V0ndNaKzOcafwvJH1/4gNTqmQjJ8YU7GLqwHJM1gYyBdRhFKtBRHa5BvyBlF0
         0f3wE383rvsKBXPyOJsizuDJHOZiqgEp9PCZsETg=
X-Riseup-User-ID: 8F6499043B028B14909275667E193D2CE092DEEBFD8526408BBAAD791A8AF191
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4Hyvw62NdVz5vcc;
        Mon, 22 Nov 2021 22:52:38 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org
Subject: [PATCH] dts: treewide: Drop input-name property
Date:   Tue, 23 Nov 2021 13:51:58 +0700
Message-Id: <20211123065158.1383182-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This property doesn't seem to exist in the documentation nor
in source code, but for some reason it is defined in a bunch
of device trees.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts          | 1 -
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts             | 1 -
 arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 1 -
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts              | 1 -
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts         | 1 -
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts        | 1 -
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts        | 1 -
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi                       | 1 -
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi             | 1 -
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts            | 1 -
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi     | 1 -
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts              | 3 ---
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi    | 2 --
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi        | 1 -
 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts | 1 -
 16 files changed, 19 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
index f8c97efc61fc..0cee62c7b8b0 100644
--- a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
@@ -19,7 +19,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index ea15b645b229..6d77e0f8ca4d 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 30ee913faae6..069136170198 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -450,7 +450,6 @@ bcrmf@1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 003f0fa9c857..96e1c978b878 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -349,7 +349,6 @@ bluetooth {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
index 398a3eaf306b..79e2cfbbb1ba 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
index b4dd85bd4faf..e66937e3f7dd 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
index 9743beebd84d..a62e5c25b23c 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
index c7c3e7d8b3c8..1eabc69462d4 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
@@ -75,7 +75,6 @@ led-1 {
 
 	r_gpio_keys {
 		compatible = "gpio-keys";
-		input-name = "k1";
 
 		k1 {
 			label = "k1";
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index fcddec14738d..7a717f926929 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -25,7 +25,6 @@ optee: optee@4fd00000 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_default>;
 
diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 69fcb6b0398d..84558ab5fe86 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -42,7 +42,6 @@ framebuffer0: framebuffer@3404000 {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		autorepeat;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 3a3790a52a2c..cc038f9b641f 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -62,7 +62,6 @@ divclk4: divclk4 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		autorepeat;
 
 		volupkey {
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 7cc564d8ca7c..dde7ed159c4d 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -29,7 +29,6 @@ / {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		autorepeat;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index 3d495ce3f46a..dc5b9b274df3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -29,7 +29,6 @@ extcon_usb: extcon-usb {
 
 	gpio-hall-sensors {
 		compatible = "gpio-keys";
-		input-name = "hall-sensors";
 		label = "Hall sensors";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hall_sensor1_default>;
@@ -46,7 +45,6 @@ hall-sensor1 {
 
 	gpio-kb-extra-keys {
 		compatible = "gpio-keys";
-		input-name = "extra-kb-keys";
 		label = "Keyboard extra keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_kb_pins_extra>;
@@ -102,7 +100,6 @@ alt {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "side-buttons";
 		label = "Side buttons";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 91e391282181..47488a1aecae 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -93,7 +93,6 @@ vph_pwr: vph-pwr-regulator {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		label = "Side buttons";
 		pinctrl-names = "default";
 		pinctrl-0 = <&vol_down_pin_a>, <&cam_focus_pin_a>,
@@ -126,7 +125,6 @@ camera-focus {
 
 	gpio-hall-sensor {
 		compatible = "gpio-keys";
-		input-name = "hall-sensors";
 		label = "Hall sensors";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hall_sensor0_default>;
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index e90c9ec84675..42af1fade461 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -90,7 +90,6 @@ cam_vana_rear_vreg: cam_vana_rear_vreg {
 	gpio_keys {
 		status = "okay";
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 45eab0235d66..871ccbba445b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -42,7 +42,6 @@ extcon_usb: extcon-usb {
 	gpio-keys {
 		status = "okay";
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		autorepeat;
-- 
2.34.0

