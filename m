Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46808435468
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 22:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhJTURB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 16:17:01 -0400
Received: from ixit.cz ([94.230.151.217]:57890 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229910AbhJTURB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 16:17:01 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 38C3820064;
        Wed, 20 Oct 2021 22:14:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634760884;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3xm0DPHOl9yQRCEmN8ie1WfoCaoHVhNhOOGY6/WiZ+U=;
        b=zssKQ5/ABu0ZdhEyxx0NaaTXMQf/9BA4ggeYiFMkPMkudu46R4x+8A5x/NpvSL8K0CCgFZ
        bslcrbkgWNByYvft5xhez87Y7UvF8ttPOTY8x9N2/hnf9xcRG1v8gYdIiWkgrBu155lPUa
        EZTu6DoU3wxybt7Esy3RR9ALOT1MF5E=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: correct mmc node naming
Date:   Wed, 20 Oct 2021 22:14:39 +0200
Message-Id: <20211020201440.229196-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MMC nodes has to be named mmc@ to comply with dt-bindings.

Fix warnings as:
arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml: sdcc@12400000: $nodename:0: 'sdcc@12400000' does not match '^mmc(@.*)?$'
	From schema: Documentation/devicetree/bindings/mmc/arm,pl18x.yaml

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts      |  6 +++---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts  |  2 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts         |  6 +++---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts          |  6 +++---
 arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts |  4 ++--
 arch/arm/boot/dts/qcom-apq8064.dtsi                 |  6 +++---
 arch/arm/boot/dts/qcom-ipq8064.dtsi                 |  4 ++--
 arch/arm/boot/dts/qcom-mdm9615.dtsi                 |  4 ++--
 arch/arm/boot/dts/qcom-msm8660-surf.dts             |  4 ++--
 arch/arm/boot/dts/qcom-msm8660.dtsi                 | 10 +++++-----
 arch/arm/boot/dts/qcom-msm8960-cdp.dts              |  4 ++--
 arch/arm/boot/dts/qcom-msm8960.dtsi                 |  4 ++--
 12 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index 5bedbb902ad5..d664ccd454c5 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -899,7 +899,7 @@ ncp {
 		};
 		amba {
 			/* Internal 3.69 GiB eMMC */
-			sdcc@12400000 {
+			mmc@12400000 {
 				status = "okay";
 				pinctrl-names = "default";
 				pinctrl-0 = <&dragon_sdcc1_pins>;
@@ -908,7 +908,7 @@ sdcc@12400000 {
 			};
 
 			/* External micro SD card, directly connected, pulled up to 2.85 V */
-			sdcc@12180000 {
+			mmc@12180000 {
 				status = "okay";
 				/* Enable SSBI GPIO 22 as input, use for card detect */
 				pinctrl-names = "default";
@@ -922,7 +922,7 @@ sdcc@12180000 {
 			 * Second external micro SD card, using two TXB104RGYR levelshifters
 			 * to lift from 1.8 V to 2.85 V
 			 */
-			sdcc@12200000 {
+			mmc@12200000 {
 				status = "okay";
 				/* Enable SSBI GPIO 26 as input, use for card detect */
 				pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index 197494ef887b..b2cd32f440e0 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -367,7 +367,7 @@ phy {
 
 		amba {
 			/* eMMC */
-			sdcc@12400000 {
+			mmc@12400000 {
 				status = "okay";
 				vmmc-supply = <&pm8921_l5>;
 				vqmmc-supply = <&pm8921_s4>;
diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index 0148148a8e0a..e068a8d0adf0 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -220,14 +220,14 @@ pci@1b500000 {
 
 		amba {
 			/* eMMC */
-			sdcc1: sdcc@12400000 {
+			sdcc1: mmc@12400000 {
 				status = "okay";
 				vmmc-supply = <&pm8921_l5>;
 				vqmmc-supply = <&pm8921_s4>;
 			};
 
 			/* External micro SD card */
-			sdcc3: sdcc@12180000 {
+			sdcc3: mmc@12180000 {
 				status = "okay";
 				vmmc-supply = <&v3p3_fixed>;
 				pinctrl-names	= "default";
@@ -235,7 +235,7 @@ sdcc3: sdcc@12180000 {
 				cd-gpios	= <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
 			};
 			/* WLAN */
-			sdcc4: sdcc@121c0000 {
+			sdcc4: mmc@121c0000 {
 				status = "okay";
 				vmmc-supply = <&v3p3_fixed>;
 				vqmmc-supply = <&v3p3_fixed>;
diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index d0a17b5a5fa3..2638b380be20 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -314,14 +314,14 @@ pios {
 
 		amba {
 			/* eMMC */
-			sdcc1: sdcc@12400000 {
+			sdcc1: mmc@12400000 {
 				status = "okay";
 				vmmc-supply = <&pm8921_l5>;
 				vqmmc-supply = <&pm8921_s4>;
 			};
 
 			/* External micro SD card */
-			sdcc3: sdcc@12180000 {
+			sdcc3: mmc@12180000 {
 				status = "okay";
 				vmmc-supply = <&pm8921_l6>;
 				pinctrl-names	= "default";
@@ -329,7 +329,7 @@ sdcc3: sdcc@12180000 {
 				cd-gpios	= <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
 			};
 			/* WLAN */
-			sdcc4: sdcc@121c0000 {
+			sdcc4: mmc@121c0000 {
 				status = "okay";
 				vmmc-supply = <&ext_3p3v>;
 				vqmmc-supply = <&pm8921_lvs1>;
diff --git a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
index 72e47bdc5c12..f8c97efc61fc 100644
--- a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
@@ -374,14 +374,14 @@ serial@1a240000 {
 		};
 
 		amba {
-			sdcc1: sdcc@12400000 {
+			sdcc1: mmc@12400000 {
 				status = "okay";
 
 				vmmc-supply = <&pm8921_l5>;
 				vqmmc-supply = <&pm8921_s4>;
 			};
 
-			sdcc3: sdcc@12180000 {
+			sdcc3: mmc@12180000 {
 				status = "okay";
 
 				vmmc-supply = <&pm8921_l6>;
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 8a389323a474..ed1cd2c529cc 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1073,7 +1073,7 @@ amba {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-			sdcc1: sdcc@12400000 {
+			sdcc1: mmc@12400000 {
 				status		= "disabled";
 				compatible	= "arm,pl18x", "arm,primecell";
 				pinctrl-names	= "default";
@@ -1093,7 +1093,7 @@ sdcc1: sdcc@12400000 {
 				dma-names = "tx", "rx";
 			};
 
-			sdcc3: sdcc@12180000 {
+			sdcc3: mmc@12180000 {
 				compatible	= "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
 				status		= "disabled";
@@ -1111,7 +1111,7 @@ sdcc3: sdcc@12180000 {
 				dma-names = "tx", "rx";
 			};
 
-			sdcc4: sdcc@121c0000 {
+			sdcc4: mmc@121c0000 {
 				compatible	= "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
 				status		= "disabled";
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 110113f3b8e2..7f67b282da10 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -1181,7 +1181,7 @@ amba: amba {
 			#size-cells = <1>;
 			ranges;
 
-			sdcc1: sdcc@12400000 {
+			sdcc1: mmc@12400000 {
 				status          = "disabled";
 				compatible      = "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
@@ -1201,7 +1201,7 @@ sdcc1: sdcc@12400000 {
 				dma-names = "tx", "rx";
 			};
 
-			sdcc3: sdcc@12180000 {
+			sdcc3: mmc@12180000 {
 				compatible      = "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
 				status          = "disabled";
diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 6e90c5d5a050..c32415f0e66d 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -354,7 +354,7 @@ amba {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-			sdcc1: sdcc@12180000 {
+			sdcc1: mmc@12180000 {
 				status = "disabled";
 				compatible = "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
@@ -374,7 +374,7 @@ sdcc1: sdcc@12180000 {
 				assigned-clock-rates = <400000>;
 			};
 
-			sdcc2: sdcc@12140000 {
+			sdcc2: mmc@12140000 {
 				compatible = "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom-msm8660-surf.dts
index 6a321ccb0bd0..414280d9bdba 100644
--- a/arch/arm/boot/dts/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom-msm8660-surf.dts
@@ -35,13 +35,13 @@ vsdcc_fixed: vsdcc-regulator {
 
 		amba {
 			/* eMMC */
-			sdcc1: sdcc@12400000 {
+			sdcc1: mmc@12400000 {
 				status = "okay";
 				vmmc-supply = <&vsdcc_fixed>;
 			};
 
 			/* External micro SD card */
-			sdcc3: sdcc@12180000 {
+			sdcc3: mmc@12180000 {
 				status = "okay";
 				vmmc-supply = <&vsdcc_fixed>;
 			};
diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 21cb58ab68ac..1e8aab357f9c 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -483,7 +483,7 @@ amba {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-			sdcc1: sdcc@12400000 {
+			sdcc1: mmc@12400000 {
 				status		= "disabled";
 				compatible	= "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
@@ -499,7 +499,7 @@ sdcc1: sdcc@12400000 {
 				cap-mmc-highspeed;
 			};
 
-			sdcc2: sdcc@12140000 {
+			sdcc2: mmc@12140000 {
 				status		= "disabled";
 				compatible	= "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
@@ -514,7 +514,7 @@ sdcc2: sdcc@12140000 {
 				cap-mmc-highspeed;
 			};
 
-			sdcc3: sdcc@12180000 {
+			sdcc3: mmc@12180000 {
 				compatible	= "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
 				status		= "disabled";
@@ -530,7 +530,7 @@ sdcc3: sdcc@12180000 {
 				no-1-8-v;
 			};
 
-			sdcc4: sdcc@121c0000 {
+			sdcc4: mmc@121c0000 {
 				compatible	= "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
 				status		= "disabled";
@@ -545,7 +545,7 @@ sdcc4: sdcc@121c0000 {
 				cap-mmc-highspeed;
 			};
 
-			sdcc5: sdcc@12200000 {
+			sdcc5: mmc@12200000 {
 				compatible	= "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
 				status		= "disabled";
diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
index e7d2e937ea4c..4af01039c3b2 100644
--- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
@@ -26,12 +26,12 @@ serial@16440000 {
 
 		amba {
 			/* eMMC */
-			sdcc1: sdcc@12400000 {
+			sdcc1: mmc@12400000 {
 				status = "okay";
 			};
 
 			/* External micro SD card */
-			sdcc3: sdcc@12180000 {
+			sdcc3: mmc@12180000 {
 				status = "okay";
 			};
 		};
diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index 172ea3c70eac..2a0ec97a264f 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -263,7 +263,7 @@ amba {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-			sdcc1: sdcc@12400000 {
+			sdcc1: mmc@12400000 {
 				status		= "disabled";
 				compatible	= "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
@@ -280,7 +280,7 @@ sdcc1: sdcc@12400000 {
 				vmmc-supply = <&vsdcc_fixed>;
 			};
 
-			sdcc3: sdcc@12180000 {
+			sdcc3: mmc@12180000 {
 				compatible	= "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
 				status		= "disabled";
-- 
2.33.0

