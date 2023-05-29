Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41D57149A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 14:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbjE2MrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 08:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbjE2MrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 08:47:22 -0400
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.219])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45A2BE;
        Mon, 29 May 2023 05:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685364424; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jQOk+F4qfb/6cl+eoIfJJOT8eGdpA8QPwOCHY4BZwbcMxc4gSrI2OT3AGtE+CGbAWe
    9pCqafuj5NJPcn379YGGiKohbBZ0c7sd2HjfrVLWuNGPNwaG8U8EELsq82dh7IvK91C3
    1Twt9fJa9V2Fdd4Upnv+0CQUcMvmeR2azTVWKPuXKyl113O03X8B3ceCz62e3amSFnnz
    i7BsZaLgxSBMcz/c9/F8p6gYYXeQT7qf6Tt3/+y81uUriwpC4ua1oHhZLngESE00dEof
    spkADx107Imj+bLeNyqaPdiSifg/fiwmbmbLnKRMr2lUi/XmWKovbVJWnAjpMqNKeCJK
    PqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685364424;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=0O0F7J+bWFnrNk3PMNsrOZgTJpVzJGIvb5uQkiMN4r0=;
    b=Fic5heeC0ym4rgKqSB1ZdbJhHc07cvf9v557XQumDGMXRZYH8LJs/Y/rWDDpmFVacV
    bBuRombiF99TZEs7kGmVlwkhP3WimEy2MTVQ5+eHLbUyFV5217kujESyMyQKwfMX7awJ
    lVL1yIrdLBUjPkSVZWkoZS4MkLbz9NKXeYwXtTwvZKRkULNO7Q8MKyojHkMmWBlKW/Mr
    +XN62k91Dot2WfGGHJe467DcDOllr7d4iG4aOGX5a57TGkYn05v2u3y4x9+MZXk58juV
    r9L5LtdRs/50wst3MdM3wT70ogfyMkefC6nLeIETIW7JiFpTeMeK6oe8j88gxztywv/M
    xRLQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685364424;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=0O0F7J+bWFnrNk3PMNsrOZgTJpVzJGIvb5uQkiMN4r0=;
    b=TZjyHquAC76lROrt19EZ3F86+b+YZVgZK7FTLMveA2TRf4c1e3O9NZaX3J6MJawBkZ
    7OH/Sg3WV9QetGvtX/VDdU96LMkxcnhJ4au8aQg4tBY2qCXvbYHpeflgAtEs6hnaIlUC
    Sp54eCj5mvbLiWTp9Y61FPlhauTZbgQidcGexJGGwiRe4O8WLorwyw+AcNygKg+ta9Ab
    g73PPNSc+LJ2eENnBIY/PbQJaarjgp9D68zQFoYCM+Toh+Ilfhs/7gbHxABpzP7lFyBU
    ETqe6gw92iHBfEKh/SVS7qDF9IoJDqEfhK9G0i7qtYckoOhgK4CfsotZIbtnGgQIZYHc
    7Wrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685364424;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=0O0F7J+bWFnrNk3PMNsrOZgTJpVzJGIvb5uQkiMN4r0=;
    b=JZOuOIrsxkdRB8wQZRlvGnQuogLnkLMqXv5nc05M548kG/ZY4SOyDirRhLC2TAI0Um
    0CoizuvmSUlnpg92ADDQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQjVd4CteZ/7jYgS+mLFY+H0JAn9VOH8mT0="
Received: from [192.168.244.3]
    by smtp.strato.de (RZmta 49.4.0 DYNA|AUTH)
    with ESMTPSA id j6420az4TCl3f8U
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 29 May 2023 14:47:03 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
Date:   Mon, 29 May 2023 14:46:58 +0200
Subject: [PATCH 1/6] arm64: dts: qcom: msm8916: Rename &msmgpio -> &tlmm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230525-msm8916-labels-v1-1-bec0f5fb46fb@gerhold.net>
References: <20230525-msm8916-labels-v1-0-bec0f5fb46fb@gerhold.net>
In-Reply-To: <20230525-msm8916-labels-v1-0-bec0f5fb46fb@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 is the only ARM64 Qualcomm SoC that is still using the old
&msmgpio name. Change this to &tlmm to avoid confusion.

Note that the node ordering does not change because the MSM8916 device
trees have pinctrl separated at the bottom (similar to sc7180).

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           | 24 ++++++-------
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   | 14 ++++----
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      | 24 ++++++-------
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     | 20 +++++------
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts | 20 +++++------
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     | 34 +++++++++---------
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 20 +++++------
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      | 16 ++++-----
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi         |  2 +-
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     | 40 ++++++++++-----------
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      | 12 +++----
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |  6 ++--
 .../dts/qcom/msm8916-samsung-e2015-common.dtsi     |  6 ++--
 .../boot/dts/qcom/msm8916-samsung-grandmax.dts     |  6 ++--
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  | 14 ++++----
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts | 12 +++----
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts  |  8 ++---
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   | 16 ++++-----
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    | 42 +++++++++++-----------
 arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts    |  8 ++---
 arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts  | 10 +++---
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          |  2 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     | 16 ++++-----
 .../arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dts |  8 ++---
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  4 +--
 25 files changed, 192 insertions(+), 192 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 1c5d55854893..82f141b55eb3 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -75,7 +75,7 @@ usb2513 {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&msmgpio 121 GPIO_ACTIVE_HIGH>;
+		id-gpio = <&tlmm 121 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
@@ -101,13 +101,13 @@ gpio-keys {
 		button {
 			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 		};
 	};
 
 	leds {
 		pinctrl-names = "default";
-		pinctrl-0 = <&msmgpio_leds>,
+		pinctrl-0 = <&tlmm_leds>,
 			    <&pm8916_gpios_leds>,
 			    <&pm8916_mpps_leds>;
 
@@ -117,7 +117,7 @@ led@1 {
 			label = "apq8016-sbc:green:user1";
 			function = LED_FUNCTION_HEARTBEAT;
 			color = <LED_COLOR_ID_GREEN>;
-			gpios = <&msmgpio 21 GPIO_ACTIVE_HIGH>;
+			gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 			default-state = "off";
 		};
@@ -126,7 +126,7 @@ led@2 {
 			label = "apq8016-sbc:green:user2";
 			function = LED_FUNCTION_DISK_ACTIVITY;
 			color = <LED_COLOR_ID_GREEN>;
-			gpios = <&msmgpio 120 GPIO_ACTIVE_HIGH>;
+			gpios = <&tlmm 120 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
 			default-state = "off";
 		};
@@ -186,14 +186,14 @@ adv_bridge: bridge@39 {
 		compatible = "adi,adv7533";
 		reg = <0x39>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
 
 		adi,dsi-lanes = <4>;
 		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
 		clock-names = "cec";
 
-		pd-gpios = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
+		pd-gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
 
 		avdd-supply = <&pm8916_l6>;
 		v1p2-supply = <&pm8916_l6>;
@@ -276,8 +276,8 @@ camera_rear@3b {
 		compatible = "ovti,ov5640";
 		reg = <0x3b>;
 
-		enable-gpios = <&msmgpio 34 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&tlmm 34 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&camera_rear_default>;
 
@@ -373,7 +373,7 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
 
-	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 };
 
 &sound {
@@ -515,7 +515,7 @@ &i2c6_default {
  * ones actually used for GPIO.
  */
 
-&msmgpio {
+&tlmm {
 	gpio-line-names =
 		"[UART0_TX]", /* GPIO_0, LSEC pin 5 */
 		"[UART0_RX]", /* GPIO_1, LSEC pin 7 */
@@ -640,7 +640,7 @@ &msmgpio {
 		"USR_LED_2_CTRL", /* GPIO 120 */
 		"SB_HS_ID";
 
-	msmgpio_leds: msmgpio-leds-state {
+	tlmm_leds: tlmm-leds-state {
 		pins = "gpio21", "gpio120";
 		function = "gpio";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
index 753413b48751..7b77a80f049c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
@@ -39,14 +39,14 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
+		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
@@ -58,7 +58,7 @@ &blsp_i2c2 {
 	accelerometer@10 {
 		compatible = "bosch,bmc150_accel";
 		reg = <0x10>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
 
 		vdd-supply = <&pm8916_l17>;
@@ -89,10 +89,10 @@ touchscreen@38 {
 		compatible = "edt,edt-ft5406";
 		reg = <0x38>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 
-		reset-gpios = <&msmgpio 12 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
 
 		vcc-supply = <&pm8916_l16>;
 		iovcc-supply = <&pm8916_l6>;
@@ -143,7 +143,7 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
 
-	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_HIGH>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
 
 	status = "okay";
 };
@@ -165,7 +165,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	accel_int_default: accel-int-default-state {
 		pins = "gpio115";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 4bfbad669b1e..d2abbdec5fe6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -30,7 +30,7 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
@@ -42,7 +42,7 @@ gpio-leds {
 		pinctrl-0 = <&gpio_leds_default>;
 
 		led-0 {
-			gpios = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
+			gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "torch";
 			function = LED_FUNCTION_TORCH;
 		};
@@ -50,7 +50,7 @@ led-0 {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&msmgpio 69 GPIO_ACTIVE_HIGH>;
+		id-gpio = <&tlmm 69 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
@@ -66,9 +66,9 @@ &blsp_i2c4 {
 	touchscreen@26 {
 		compatible = "mstar,msg2638";
 		reg = <0x26>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&msmgpio 100 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&ts_int_reset_default>;
 		vdd-supply = <&pm8916_l17>;
@@ -86,7 +86,7 @@ magnetometer@c {
 		reg = <0x0c>;
 		vdd-supply = <&pm8916_l17>;
 		vid-supply = <&pm8916_l6>;
-		reset-gpios = <&msmgpio 8 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&mag_reset_default>;
 		mount-matrix = "0", "1", "0",
@@ -99,7 +99,7 @@ accelerometer@f {
 		reg = <0x0f>;
 		vdd-supply = <&pm8916_l17>;
 		vddio-supply = <&pm8916_l6>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&accel_int_default>;
@@ -111,7 +111,7 @@ accelerometer@f {
 	proximity@48 {
 		compatible = "sensortek,stk3310";
 		reg = <0x48>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&proximity_int_default>;
@@ -122,7 +122,7 @@ gyroscope@68 {
 		reg = <0x68>;
 		vdd-supply = <&pm8916_l17>;
 		vddio-supply = <&pm8916_l6>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <97 IRQ_TYPE_EDGE_RISING>,
 			     <98 IRQ_TYPE_EDGE_RISING>;
 		pinctrl-names = "default";
@@ -136,7 +136,7 @@ &blsp_i2c6 {
 	led-controller@68 {
 		compatible = "si-en,sn3190";
 		reg = <0x68>;
-		shutdown-gpios = <&msmgpio 89 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_enable_default &led_shutdown_default>;
 		#address-cells = <1>;
@@ -182,7 +182,7 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
 
-	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 };
 
 &usb {
@@ -202,7 +202,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	accel_int_default: accel-int-default-state {
 		pins = "gpio31";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
index 37755e885395..c58a70fdf36f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -30,14 +30,14 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 			debounce-interval = <15>;
 		};
 
 		button-volume-down {
 			label = "Volume Down";
-			gpios = <&msmgpio 117 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 			debounce-interval = <15>;
 		};
@@ -49,7 +49,7 @@ reg_sd_vmmc: regulator-sdcard-vmmc {
 		regulator-min-microvolt = <2950000>;
 		regulator-max-microvolt = <2950000>;
 
-		gpio = <&msmgpio 87 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		startup-delay-us = <200>;
@@ -60,7 +60,7 @@ reg_sd_vmmc: regulator-sdcard-vmmc {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpios = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
@@ -76,7 +76,7 @@ magnetometer@c {
 		vdd-supply = <&pm8916_l8>;
 		vid-supply = <&pm8916_l6>;
 
-		reset-gpios = <&msmgpio 112 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 112 GPIO_ACTIVE_LOW>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&mag_reset_default>;
@@ -86,7 +86,7 @@ imu@68 {
 		compatible = "invensense,mpu6515";
 		reg = <0x68>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <36 IRQ_TYPE_EDGE_RISING>;
 
 		vdd-supply = <&pm8916_l17>;
@@ -108,10 +108,10 @@ touchscreen@38 {
 		compatible = "edt,edt-ft5306";
 		reg = <0x38>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
 
-		reset-gpios = <&msmgpio 12 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
 
 		vcc-supply = <&pm8916_l11>;
 		iovcc-supply = <&pm8916_l6>;
@@ -150,7 +150,7 @@ &sdhc_2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
-	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 };
 
 &usb {
@@ -170,7 +170,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	gpio_keys_default: gpio-keys-default-state {
 		pins = "gpio107", "gpio117";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
index 4a6bf99c755f..221db7edec5e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
@@ -24,8 +24,8 @@ chosen {
 	flash-led-controller {
 		/* Actually qcom,leds-gpio-flash */
 		compatible = "sgmicro,sgm3140";
-		enable-gpios = <&msmgpio 31 GPIO_ACTIVE_HIGH>;
-		flash-gpios = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
+		flash-gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-0 = <&camera_flash_default>;
 		pinctrl-names = "default";
@@ -45,7 +45,7 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
@@ -59,21 +59,21 @@ gpio-leds {
 		led-red {
 			function = LED_FUNCTION_CHARGING;
 			color = <LED_COLOR_ID_RED>;
-			gpios = <&msmgpio 117 GPIO_ACTIVE_HIGH>;
+			gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 			retain-state-suspended;
 		};
 
 		led-green {
 			function = LED_FUNCTION_CHARGING;
 			color = <LED_COLOR_ID_GREEN>;
-			gpios = <&msmgpio 118 GPIO_ACTIVE_HIGH>;
+			gpios = <&tlmm 118 GPIO_ACTIVE_HIGH>;
 			retain-state-suspended;
 		};
 	};
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
+		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&usb_id_default>;
 		pinctrl-names = "default";
 	};
@@ -87,10 +87,10 @@ touchscreen@38 {
 		compatible = "edt,edt-ft5406";
 		reg = <0x38>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
 
-		reset-gpios = <&msmgpio 12 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
 
 		vcc-supply = <&pm8916_l17>;
 		iovcc-supply = <&pm8916_l6>;
@@ -138,7 +138,7 @@ &sdhc_2 {
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
 	pinctrl-names = "default", "sleep";
 
-	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 
 	status = "okay";
 };
@@ -160,7 +160,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	camera_flash_default: camera-flash-default-state {
 		pins = "gpio31", "gpio32";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index 29aaa35438a3..b02e8f9a8ca0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -43,7 +43,7 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
@@ -55,21 +55,21 @@ leds {
 		pinctrl-0 = <&gpio_leds_default>;
 
 		led-0 {
-			gpios = <&msmgpio 8 GPIO_ACTIVE_HIGH>;
+			gpios = <&tlmm 8 GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_RED>;
 			default-state = "off";
 			function = LED_FUNCTION_INDICATOR;
 		};
 
 		led-1 {
-			gpios = <&msmgpio 9 GPIO_ACTIVE_HIGH>;
+			gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
 			default-state = "off";
 			function = LED_FUNCTION_INDICATOR;
 		};
 
 		led-2 {
-			gpios = <&msmgpio 10 GPIO_ACTIVE_HIGH>;
+			gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_BLUE>;
 			default-state = "off";
 			function = LED_FUNCTION_INDICATOR;
@@ -78,7 +78,7 @@ led-2 {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&msmgpio 117 GPIO_ACTIVE_HIGH>;
+		id-gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
@@ -94,7 +94,7 @@ magnetometer@c {
 		vdd-supply = <&pm8916_l17>;
 		vid-supply = <&pm8916_l6>;
 
-		reset-gpios = <&msmgpio 36 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&mag_reset_default>;
@@ -104,7 +104,7 @@ accelerometer@1e {
 		compatible = "kionix,kx023-1025";
 		reg = <0x1e>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
 
 		vdd-supply = <&pm8916_l17>;
@@ -122,7 +122,7 @@ proximity@39 {
 		compatible = "avago,apds9930";
 		reg = <0x39>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <113 IRQ_TYPE_EDGE_FALLING>;
 
 		vdd-supply = <&pm8916_l17>;
@@ -146,7 +146,7 @@ reg_lcd_pos: outp {
 			regulator-name = "outp";
 			regulator-min-microvolt = <5400000>;
 			regulator-max-microvolt = <5400000>;
-			enable-gpios = <&msmgpio 97 GPIO_ACTIVE_HIGH>;
+			enable-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
 			regulator-active-discharge = <1>;
 		};
 
@@ -154,7 +154,7 @@ reg_lcd_neg: outn {
 			regulator-name = "outn";
 			regulator-min-microvolt = <5400000>;
 			regulator-max-microvolt = <5400000>;
-			enable-gpios = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
+			enable-gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
 			regulator-active-discharge = <1>;
 		};
 	};
@@ -169,7 +169,7 @@ rmi4@70 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
 
 		vdd-supply = <&pm8916_l17>;
@@ -199,11 +199,11 @@ nfc@28 {
 		compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
 		reg = <0x28>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <21 IRQ_TYPE_EDGE_RISING>;
 
-		enable-gpios = <&msmgpio 20 GPIO_ACTIVE_HIGH>;
-		firmware-gpios = <&msmgpio 2 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&nfc_default>;
@@ -264,7 +264,7 @@ &sdhc_2 {
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdhc2_cd_default>;
 
 	/*
-	 * The Huawei device tree sets cd-gpios = <&msmgpio 38 GPIO_ACTIVE_HIGH>.
+	 * The Huawei device tree sets cd-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>.
 	 * However, gpio38 does not change its state when inserting/removing the
 	 * SD card, it's just low all the time. The Huawei kernel seems to use
 	 * polling for SD card detection instead.
@@ -276,7 +276,7 @@ &sdhc_2 {
 	 * Maybe Huawei decided to replace the second SIM card slot with the
 	 * SD card slot and forgot to re-route to gpio38.
 	 */
-	cd-gpios = <&msmgpio 56 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
 };
 
 &sound {
@@ -338,7 +338,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	accel_irq_default: accel-irq-default-state {
 		pins = "gpio115";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index b7b1f1ceaf1f..56f74a892764 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -41,7 +41,7 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
@@ -53,7 +53,7 @@ reg_ctp: regulator-ctp {
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
 
-		gpio = <&msmgpio 17 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -62,8 +62,8 @@ reg_ctp: regulator-ctp {
 
 	flash-led-controller {
 		compatible = "sgmicro,sgm3140";
-		flash-gpios = <&msmgpio 31 GPIO_ACTIVE_HIGH>;
-		enable-gpios = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
+		flash-gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&camera_flash_default>;
@@ -122,7 +122,7 @@ accelerometer@10 {
 		 * to the BMC156. However, there are two pads next to the chip
 		 * that can be shorted to make it work if needed.
 		 *
-		 * interrupt-parent = <&msmgpio>;
+		 * interrupt-parent = <&tlmm>;
 		 * interrupts = <116 IRQ_TYPE_EDGE_RISING>;
 		 */
 
@@ -141,7 +141,7 @@ magnetometer@12 {
 		compatible = "bosch,bmc156_magn";
 		reg = <0x12>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <113 IRQ_TYPE_EDGE_RISING>;
 
 		pinctrl-names = "default";
@@ -156,7 +156,7 @@ light-sensor@23 {
 		reg = <0x23>;
 		proximity-near-level = <75>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <115 IRQ_TYPE_EDGE_FALLING>;
 
 		pinctrl-names = "default";
@@ -170,7 +170,7 @@ gyroscope@68 {
 		compatible = "bosch,bmg160";
 		reg = <0x68>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <23 IRQ_TYPE_EDGE_RISING>,
 			     <22 IRQ_TYPE_EDGE_RISING>;
 
@@ -191,7 +191,7 @@ rmi4@20 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
 
 		vdd-supply = <&reg_ctp>;
@@ -274,7 +274,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	accel_int_default: accel-int-default-state {
 		pins = "gpio116";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
index 630727ed1ed5..a1208c8e0620 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -22,8 +22,8 @@ chosen {
 
 	flash-led-controller {
 		compatible = "ocs,ocp8110";
-		enable-gpios = <&msmgpio 49 GPIO_ACTIVE_HIGH>;
-		flash-gpios = <&msmgpio 119 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tlmm 49 GPIO_ACTIVE_HIGH>;
+		flash-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-0 = <&camera_front_flash_default>;
 		pinctrl-names = "default";
@@ -45,7 +45,7 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
@@ -54,7 +54,7 @@ leds {
 		compatible = "gpio-leds";
 
 		led-0 {
-			gpios = <&msmgpio 17 GPIO_ACTIVE_HIGH>;
+			gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_WHITE>;
 			default-state = "off";
 			function = LED_FUNCTION_KBD_BACKLIGHT;
@@ -66,7 +66,7 @@ led-0 {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
+		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
@@ -82,7 +82,7 @@ magnetometer@d {
 		vdd-supply = <&pm8916_l17>;
 		vid-supply = <&pm8916_l6>;
 
-		reset-gpios = <&msmgpio 111 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&mag_reset_default>;
@@ -136,7 +136,7 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
 
-	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 };
 
 &usb {
@@ -156,7 +156,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	button_backlight_default: button-backlight-default-state {
 		pins = "gpio17";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 33dfcf318a81..1e07f70768f4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -3,7 +3,7 @@
  * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
  */
 
-&msmgpio {
+&tlmm {
 
 	blsp1_uart1_default: blsp1-uart1-default-state {
 		/* TX, RX, CTS_N, RTS_N */
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 37a872949851..550ba6b9d4cd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -44,13 +44,13 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		button-home {
 			label = "Home";
-			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOMEPAGE>;
 		};
 	};
@@ -65,7 +65,7 @@ gpio-hall-sensor {
 
 		event-hall-sensor {
 			label = "Hall Effect Sensor";
-			gpios = <&msmgpio 52 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_LID>;
 			linux,can-disable;
@@ -83,7 +83,7 @@ reg_motor_vdd: regulator-motor-vdd {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 
-		gpio = <&msmgpio 76 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 76 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -96,7 +96,7 @@ reg_vdd_tsp_a: regulator-vdd-tsp-a {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&msmgpio 73 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -105,8 +105,8 @@ reg_vdd_tsp_a: regulator-vdd-tsp-a {
 
 	i2c-muic {
 		compatible = "i2c-gpio";
-		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-		scl-gpios = <&msmgpio 106 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&tlmm 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 106 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&muic_i2c_default>;
@@ -118,7 +118,7 @@ muic: extcon@25 {
 			compatible = "siliconmitus,sm5502-muic";
 
 			reg = <0x25>;
-			interrupt-parent = <&msmgpio>;
+			interrupt-parent = <&tlmm>;
 			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
 
 			pinctrl-names = "default";
@@ -128,8 +128,8 @@ muic: extcon@25 {
 
 	i2c-tkey {
 		compatible = "i2c-gpio";
-		sda-gpios = <&msmgpio 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-		scl-gpios = <&msmgpio 17 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&tlmm 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 17 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&tkey_i2c_default>;
@@ -142,7 +142,7 @@ touchkey: touchkey@20 {
 			compatible = "coreriver,tc360-touchkey";
 			reg = <0x20>;
 
-			interrupt-parent = <&msmgpio>;
+			interrupt-parent = <&tlmm>;
 			interrupts = <98 IRQ_TYPE_EDGE_FALLING>;
 
 			/* vcc/vdd-supply are board-specific */
@@ -157,8 +157,8 @@ touchkey: touchkey@20 {
 
 	i2c-nfc {
 		compatible = "i2c-gpio";
-		sda-gpios = <&msmgpio 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-		scl-gpios = <&msmgpio 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&tlmm 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&nfc_i2c_default>;
@@ -170,11 +170,11 @@ nfc@27 {
 			compatible = "samsung,s3fwrn5-i2c";
 			reg = <0x27>;
 
-			interrupt-parent = <&msmgpio>;
+			interrupt-parent = <&tlmm>;
 			interrupts = <21 IRQ_TYPE_EDGE_RISING>;
 
-			en-gpios = <&msmgpio 20 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&msmgpio 49 GPIO_ACTIVE_HIGH>;
+			en-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+			wake-gpios = <&tlmm 49 GPIO_ACTIVE_HIGH>;
 
 			clocks = <&rpmcc RPM_SMD_BB_CLK2_PIN>;
 
@@ -200,7 +200,7 @@ &blsp_i2c2 {
 	accelerometer: accelerometer@10 {
 		compatible = "bosch,bmc150_accel";
 		reg = <0x10>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
 
 		vdd-supply = <&pm8916_l17>;
@@ -225,7 +225,7 @@ &blsp_i2c4 {
 	battery@35 {
 		compatible = "richtek,rt5033-battery";
 		reg = <0x35>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <121 IRQ_TYPE_EDGE_BOTH>;
 
 		pinctrl-names = "default";
@@ -274,7 +274,7 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
 
-	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 };
 
 &usb {
@@ -286,7 +286,7 @@ &usb_hs_phy {
 	extcon = <&muic>;
 };
 
-&msmgpio {
+&tlmm {
 	accel_int_default: accel-int-default-state {
 		pins = "gpio115";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index a1ca4d883420..9068aa6f7b29 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -15,7 +15,7 @@ reg_panel_vdd3: regulator-panel-vdd3 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 
-		gpio = <&msmgpio 9 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -28,7 +28,7 @@ reg_touch_key: regulator-touch-key {
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
 
-		gpio = <&msmgpio 86 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 86 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -41,7 +41,7 @@ reg_key_led: regulator-key-led {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&msmgpio 60 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 60 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -67,7 +67,7 @@ touchscreen@20 {
 		compatible = "zinitix,bt541";
 
 		reg = <0x20>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
 
 		touchscreen-size-x = <540>;
@@ -93,7 +93,7 @@ panel@0 {
 
 		vdd3-supply = <&reg_panel_vdd3>;
 		vci-supply = <&pm8916_l17>;
-		reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 25 GPIO_ACTIVE_HIGH>;
 
 		port {
 			panel_in: endpoint {
@@ -120,7 +120,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	panel_vdd3_default: panel-vdd3-default-state {
 		pins = "gpio9";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index 4e10b8a5e9f9..388482a1e3d9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -15,7 +15,7 @@ reg_touch_key: regulator-touch-key {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&msmgpio 97 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 97 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -36,7 +36,7 @@ touchscreen@48 {
 		compatible = "melfas,mms345l";
 
 		reg = <0x48>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
 
 		touchscreen-size-x = <720>;
@@ -71,7 +71,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3660b";
 };
 
-&msmgpio {
+&tlmm {
 	tkey_en_default: tkey-en-default-state {
 		pins = "gpio97";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
index f6c4a011fdfd..0cdd6af7817f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
@@ -18,7 +18,7 @@ muic: extcon@14 {
 			compatible = "siliconmitus,sm5504-muic";
 			reg = <0x14>;
 
-			interrupt-parent = <&msmgpio>;
+			interrupt-parent = <&tlmm>;
 			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
 
 			pinctrl-names = "default";
@@ -32,7 +32,7 @@ reg_touch_key: regulator-touch-key {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&msmgpio 97 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 97 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -66,7 +66,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	tkey_en_default: tkey-en-default-state {
 		pins = "gpio97";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
index 4cbd68b89448..3f145dde4059 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
@@ -33,7 +33,7 @@ led-keyled {
 			function = LED_FUNCTION_KBD_BACKLIGHT;
 			color = <LED_COLOR_ID_WHITE>;
 
-			gpios = <&msmgpio 60 GPIO_ACTIVE_HIGH>;
+			gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&gpio_leds_default>;
@@ -42,14 +42,14 @@ led-keyled {
 };
 
 &reg_motor_vdd {
-	gpio = <&msmgpio 72 GPIO_ACTIVE_HIGH>;
+	gpio = <&tlmm 72 GPIO_ACTIVE_HIGH>;
 };
 
 &reg_touch_key {
 	status = "disabled";
 };
 
-&msmgpio {
+&tlmm {
 	gpio_leds_default: gpio-led-default-state {
 		pins = "gpio60";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
index a49e1641e59b..cb1b6318a246 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
@@ -34,13 +34,13 @@ gpio-keys {
 
 		volume-up-button {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		home-button {
 			label = "Home";
-			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOMEPAGE>;
 		};
 	};
@@ -55,7 +55,7 @@ gpio-hall-sensor {
 
 		hall-sensor-switch {
 			label = "Hall Effect Sensor";
-			gpios = <&msmgpio 52 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_LID>;
 			linux,can-disable;
@@ -74,7 +74,7 @@ fuelgauge@36 {
 		maxim,over-heat-temp = <600>;
 		maxim,over-volt = <4400>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <121 IRQ_TYPE_EDGE_FALLING>;
 
 		pinctrl-0 = <&fuelgauge_int_default>;
@@ -97,7 +97,7 @@ accelerometer@1d {
 		vdd-supply = <&pm8916_l17>;
 		vddio-supply = <&pm8916_l5>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <115 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "INT1";
 
@@ -145,7 +145,7 @@ &sdhc_2 {
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
 	pinctrl-names = "default", "sleep";
 
-	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 
 	status = "okay";
 };
@@ -169,7 +169,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3660b";
 };
 
-&msmgpio {
+&tlmm {
 	accel_int_default: accel-int-default-state {
 		pins = "gpio115";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
index 607a5dc8a534..48111c6a2c78 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
@@ -25,7 +25,7 @@ reg_motor_vdd: regulator-motor-vdd {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 
-		gpio = <&msmgpio 76 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 76 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&motor_en_default>;
@@ -38,7 +38,7 @@ reg_tsp_1p8v: regulator-tsp-1p8v {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 
-		gpio = <&msmgpio 73 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&tsp_en_default>;
@@ -51,7 +51,7 @@ reg_tsp_3p3v: regulator-tsp-3p3v {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&msmgpio 73 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -71,20 +71,20 @@ &blsp_i2c5 {
 	touchscreen@4a {
 		compatible = "atmel,maxtouch";
 		reg = <0x4a>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&reg_tsp_1p8v>;
 		vdda-supply = <&reg_tsp_3p3v>;
 
-		reset-gpios = <&msmgpio 114 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
 
 		pinctrl-0 = <&tsp_int_rst_default>;
 		pinctrl-names = "default";
 	};
 };
 
-&msmgpio {
+&tlmm {
 	motor_en_default: motor-en-default-state {
 		pins = "gpio76";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
index 5d6f8383306b..98ceaad7fcea 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
@@ -15,7 +15,7 @@ reg_vdd_tsp: regulator-vdd-tsp {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&msmgpio 73 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&reg_tsp_en_default>;
@@ -24,7 +24,7 @@ reg_vdd_tsp: regulator-vdd-tsp {
 
 	vibrator {
 		compatible = "gpio-vibrator";
-		enable-gpios = <&msmgpio 76 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-0 = <&vibrator_en_default>;
 		pinctrl-names = "default";
@@ -37,7 +37,7 @@ &blsp_i2c5 {
 	touchscreen@20 {
 		compatible = "zinitix,bt532";
 		reg = <0x20>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
 
 		touchscreen-size-x = <768>;
@@ -51,7 +51,7 @@ touchscreen@20 {
 	};
 };
 
-&msmgpio {
+&tlmm {
 	reg_tsp_en_default: reg-tsp-en-default-state {
 		pins = "gpio73";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
index 6192d04a58ae..b2d2bc205ef2 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
@@ -32,7 +32,7 @@ gpio_hall_sensor: gpio-hall-sensor {
 
 		event-hall-sensor {
 			label = "Hall Effect Sensor";
-			gpios = <&msmgpio 52 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_LID>;
 			linux,can-disable;
@@ -49,21 +49,21 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		button-home {
 			label = "Home Key";
-			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOMEPAGE>;
 		};
 	};
 
 	i2c_muic: i2c-muic {
 		compatible = "i2c-gpio";
-		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-		scl-gpios = <&msmgpio 106 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&tlmm 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 106 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&muic_i2c_default>;
@@ -75,7 +75,7 @@ muic: extcon@25 {
 			compatible = "siliconmitus,sm5703-muic";
 			reg = <0x25>;
 
-			interrupt-parent = <&msmgpio>;
+			interrupt-parent = <&tlmm>;
 			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
 
 			pinctrl-names = "default";
@@ -108,7 +108,7 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
 
-	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 };
 
 &usb {
@@ -128,7 +128,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
 		pins = "gpio52";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index fc4c61c4e1e6..13a1d8828447 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -53,13 +53,13 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		button-home {
 			label = "Home";
-			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOMEPAGE>;
 		};
 	};
@@ -74,7 +74,7 @@ gpio-hall-sensor {
 
 		event-hall-sensor {
 			label = "Hall Effect Sensor";
-			gpios = <&msmgpio 52 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_LID>;
 			linux,can-disable;
@@ -87,7 +87,7 @@ reg_vdd_tsp: regulator-vdd-tsp {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&msmgpio 73 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -100,7 +100,7 @@ reg_touch_key: regulator-touch-key {
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
 
-		gpio = <&msmgpio 86 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 86 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -113,7 +113,7 @@ reg_key_led: regulator-key-led {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&msmgpio 60 GPIO_ACTIVE_HIGH>;
+		gpio = <&tlmm 60 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -122,8 +122,8 @@ reg_key_led: regulator-key-led {
 
 	i2c-muic {
 		compatible = "i2c-gpio";
-		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-		scl-gpios = <&msmgpio 106 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&tlmm 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 106 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&muic_i2c_default>;
@@ -135,7 +135,7 @@ muic: extcon@14 {
 			compatible = "siliconmitus,sm5504-muic";
 			reg = <0x14>;
 
-			interrupt-parent = <&msmgpio>;
+			interrupt-parent = <&tlmm>;
 			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
 
 			pinctrl-names = "default";
@@ -145,8 +145,8 @@ muic: extcon@14 {
 
 	i2c-tkey {
 		compatible = "i2c-gpio";
-		sda-gpios = <&msmgpio 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-		scl-gpios = <&msmgpio 17 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&tlmm 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 17 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&tkey_i2c_default>;
@@ -158,7 +158,7 @@ touchkey@20 {
 			compatible = "coreriver,tc360-touchkey";
 			reg = <0x20>;
 
-			interrupt-parent = <&msmgpio>;
+			interrupt-parent = <&tlmm>;
 			interrupts = <98 IRQ_TYPE_EDGE_FALLING>;
 
 			vcc-supply = <&reg_touch_key>;
@@ -174,8 +174,8 @@ touchkey@20 {
 
 	i2c-nfc {
 		compatible = "i2c-gpio";
-		sda-gpios = <&msmgpio 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-		scl-gpios = <&msmgpio 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&tlmm 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&nfc_i2c_default>;
@@ -187,11 +187,11 @@ nfc@2b {
 			compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
 			reg = <0x2b>;
 
-			interrupt-parent = <&msmgpio>;
+			interrupt-parent = <&tlmm>;
 			interrupts = <21 IRQ_TYPE_EDGE_RISING>;
 
-			enable-gpios = <&msmgpio 20 GPIO_ACTIVE_HIGH>;
-			firmware-gpios = <&msmgpio 49 GPIO_ACTIVE_HIGH>;
+			enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+			firmware-gpios = <&tlmm 49 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&nfc_default>;
@@ -206,7 +206,7 @@ imu@6b {
 		compatible = "st,lsm6ds3";
 		reg = <0x6b>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
 
 		pinctrl-names = "default";
@@ -230,7 +230,7 @@ battery@35 {
 		compatible = "richtek,rt5033-battery";
 		reg = <0x35>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <121 IRQ_TYPE_EDGE_FALLING>;
 
 		pinctrl-names = "default";
@@ -245,7 +245,7 @@ touchscreen@20 {
 		compatible = "zinitix,bt541";
 		reg = <0x20>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
 
 		touchscreen-size-x = <540>;
@@ -320,7 +320,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3660b";
 };
 
-&msmgpio {
+&tlmm {
 	fg_alert_default: fg-alert-default-state {
 		pins = "gpio121";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts b/arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts
index 82e260375174..6fe1850ba20e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts
@@ -10,19 +10,19 @@ / {
 };
 
 &button_restart {
-	gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+	gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 };
 
 &led_r {
-	gpios = <&msmgpio 82 GPIO_ACTIVE_HIGH>;
+	gpios = <&tlmm 82 GPIO_ACTIVE_HIGH>;
 };
 
 &led_g {
-	gpios = <&msmgpio 83 GPIO_ACTIVE_HIGH>;
+	gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
 };
 
 &led_b {
-	gpios = <&msmgpio 81 GPIO_ACTIVE_HIGH>;
+	gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
 };
 
 &button_default {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts b/arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts
index 978f0abcdf8f..16d4a91022be 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts
@@ -10,19 +10,19 @@ / {
 };
 
 &button_restart {
-	gpios = <&msmgpio 37 GPIO_ACTIVE_HIGH>;
+	gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
 };
 
 &led_r {
-	gpios = <&msmgpio 22 GPIO_ACTIVE_HIGH>;
+	gpios = <&tlmm 22 GPIO_ACTIVE_HIGH>;
 };
 
 &led_g {
-	gpios = <&msmgpio 21 GPIO_ACTIVE_HIGH>;
+	gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
 };
 
 &led_b {
-	gpios = <&msmgpio 20 GPIO_ACTIVE_HIGH>;
+	gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
 };
 
 &mpss {
@@ -40,7 +40,7 @@ &gpio_leds_default {
 };
 
 /* This selects the external SIM card slot by default */
-&msmgpio {
+&tlmm {
 	sim_ctrl_default: sim-ctrl-default-state {
 		esim-sel-pins {
 			pins = "gpio0", "gpio3";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi b/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
index 6a9219039572..f5613107ad1f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
@@ -126,7 +126,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	/* pins are board-specific */
 	button_default: button-default-state {
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
index 323590598113..12ce4dc236c6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
@@ -25,8 +25,8 @@ chosen {
 
 	flash-led-controller {
 		compatible = "ocs,ocp8110";
-		enable-gpios = <&msmgpio 31 GPIO_ACTIVE_HIGH>;
-		flash-gpios = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
+		flash-gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&camera_flash_default>;
@@ -47,14 +47,14 @@ gpio-keys {
 
 		button-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
+		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
@@ -67,7 +67,7 @@ imu@68 {
 		compatible = "invensense,mpu6880";
 		reg = <0x68>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
 
 		vdd-supply = <&pm8916_l17>;
@@ -90,10 +90,10 @@ touchscreen@38 {
 		compatible = "edt,edt-ft5506";
 		reg = <0x38>;
 
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
 
-		reset-gpios = <&msmgpio 12 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
 
 		vcc-supply = <&pm8916_l17>;
 		iovcc-supply = <&pm8916_l6>;
@@ -204,7 +204,7 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
-&msmgpio {
+&tlmm {
 	camera_flash_default: camera-flash-default-state {
 		pins = "gpio31", "gpio32";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dts b/arch/arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dts
index 74ce6563be18..5e6ba8c58bb5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dts
@@ -10,19 +10,19 @@ / {
 };
 
 &button_restart {
-	gpios = <&msmgpio 23 GPIO_ACTIVE_LOW>;
+	gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 };
 
 &led_r {
-	gpios = <&msmgpio 7 GPIO_ACTIVE_HIGH>;
+	gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
 };
 
 &led_g {
-	gpios = <&msmgpio 8 GPIO_ACTIVE_HIGH>;
+	gpios = <&tlmm 8 GPIO_ACTIVE_HIGH>;
 };
 
 &led_b {
-	gpios = <&msmgpio 6 GPIO_ACTIVE_HIGH>;
+	gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
 };
 
 &button_default {
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 97ad2a5ea0d5..56f35015746b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -993,12 +993,12 @@ etm3_out: endpoint {
 			};
 		};
 
-		msmgpio: pinctrl@1000000 {
+		tlmm: pinctrl@1000000 {
 			compatible = "qcom,msm8916-pinctrl";
 			reg = <0x01000000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
-			gpio-ranges = <&msmgpio 0 0 122>;
+			gpio-ranges = <&tlmm 0 0 122>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;

-- 
2.40.1

