Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097B1247A78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbgHQWdX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:33:23 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:49809 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729578AbgHQWdM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:33:12 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MVMuN-1kGyWA2nVn-00SNSG; Tue, 18 Aug 2020 00:33:01 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm: dts: replace status value "ok" by "okay"
Date:   Tue, 18 Aug 2020 00:32:13 +0200
Message-Id: <20200817223214.62179-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ViMvLIvIAUwOCh1/z8wihiiHTB5J7imJDgR+Xv2AIDMQ9N3Jxwa
 JfzbZxkHo3fTFfoN11ScwZyLtIhrKw57HbI8vWK9K1VfQ2TMvEGNFnqjSppCWBEfQQGLBqx
 1ZFZKkkgGi4N4ijYvrvZ3GLyK7zKZztj6ayouonzcA6uD4Hac2SwipS+2zdDQ1Y+M72wOsK
 wlNWC8ZhVwxxGnweTuMhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S67bbY4jfnQ=:AQ8W3Y1oBBDPkgqeMSN7+h
 QpuCyo8G9SVnxo/qPTTs0EbrMrBbyIqXTn6r1ZAImP0RcziTAz7GfIK+rQg3f7Y8jaFGdhqAZ
 V+FOyG6GvfanVV8G2h8YT5FI0mUb/6++pBSP/qhamjRElvgN2SoaaorHnc/nGzWVmv5LvzNhB
 P85vuClxaqjeHS5dEuo11f01gid4X+CiTJ0aNsMSPeB06pafQBpQjegYjTmQCzPHkbZJcGmBM
 ypSGarX5gV2zLwlL4a9nzuhhqCMEyovo/yGkUKPxNFfNhS/I1/s3Hr2KtozJhi5Emaft+LMgz
 /BTAFZ1EbRHFMWwwrVpBdYIXMRl/KV04U92OjU/0zWTX6Nyqr03KF7q42j4H0oo9t3Yu8pMJV
 8ny1dDzFoj3hEbKfOlsbXx8PFFEta762pNbQMmetuoxXQ8VpqDhtMW5s1aBiTbLK70rmb6jsg
 DRdNysMueEVIAr+HblQTJs4UV3767nMD4NpiTycS1zzMQhrvrb5p/HcPEF866dcqjR9g1xhKa
 S7/oQAtfDzeoCtYey/Ey75399i3H070LODDsRUPsSIQIoQufOpsLv7OFj/N+rn9y9ncQa4cK+
 CVqsnAV9Ja1qFObvqIy7zbz30Bzg/fLW5kicKCn1PQw4ZIoAI3hfhfHFSPQ1jbAW3hiLwi8AV
 ZZo0ck7RlJa2OoiFUp+HT1uvsRUTeLxjWXt1/78U1K2avSQVl8OIGkAAdAdiqDo/vLuwZgZKn
 uOlca4BcfcW1QZrkPVbq1+/BVl0Z+m10IaP2lqXWJoJl5UYUQ+sbQZROGgDxRKT3BslEE9BHQ
 IZB2fZTbaytZzmxaTi14cZgYn5v/ZXDT7hY6pqfOG/340ZQJvoa/5Ge82i8pOYniKbOjItdQv
 fGBKDVJLcrN14a6zl8yg==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While the DT parser recognizes "ok" as a valid value for the
"status" property, it is actually mentioned nowhere. Use the
proper value "okay" instead, as done in the majority of files
already.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
---
 arch/arm/boot/dts/am3517-evm-ui.dtsi          |  4 +--
 arch/arm/boot/dts/am3517-evm.dts              |  2 +-
 arch/arm/boot/dts/am437x-gp-evm.dts           |  2 +-
 arch/arm/boot/dts/am437x-sbc-t43.dts          |  2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts          |  2 +-
 .../boot/dts/am57xx-beagle-x15-common.dtsi    |  6 ++--
 arch/arm/boot/dts/am57xx-sbc-am57x.dts        |  4 +--
 arch/arm/boot/dts/armada-388-db.dts           |  2 +-
 arch/arm/boot/dts/bcm958525xmc.dts            |  2 +-
 arch/arm/boot/dts/bcm958625k.dts              |  2 +-
 arch/arm/boot/dts/da850-evm.dts               |  2 +-
 arch/arm/boot/dts/dove.dtsi                   |  2 +-
 arch/arm/boot/dts/dra7-evm.dts                |  2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi       |  6 ++--
 arch/arm/boot/dts/dra76-evm.dts               |  4 +--
 arch/arm/boot/dts/efm32gg-dk3750.dts          | 12 +++----
 arch/arm/boot/dts/efm32gg.dtsi                |  2 +-
 arch/arm/boot/dts/exynos4210-i9100.dts        |  2 +-
 arch/arm/boot/dts/exynos4210-trats.dts        |  2 +-
 .../boot/dts/exynos4210-universal_c210.dts    |  2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi       |  2 +-
 arch/arm/boot/dts/hi3620-hi4511.dts           | 12 +++----
 arch/arm/boot/dts/hip04-d01.dts               |  2 +-
 arch/arm/boot/dts/keystone-k2e-evm.dts        |  2 +-
 arch/arm/boot/dts/keystone-k2g-evm.dts        |  2 +-
 arch/arm/boot/dts/keystone-k2hk-evm.dts       |  2 +-
 arch/arm/boot/dts/keystone-k2l-evm.dts        |  2 +-
 arch/arm/boot/dts/kirkwood-dockstar.dts       |  2 +-
 arch/arm/boot/dts/kirkwood-dreamplug.dts      |  2 +-
 arch/arm/boot/dts/kirkwood-goflexnet.dts      |  2 +-
 .../dts/kirkwood-guruplug-server-plus.dts     |  2 +-
 arch/arm/boot/dts/kirkwood-iconnect.dts       |  2 +-
 arch/arm/boot/dts/kirkwood-iomega_ix2_200.dts |  2 +-
 arch/arm/boot/dts/kirkwood-nsa3x0-common.dtsi |  2 +-
 arch/arm/boot/dts/kirkwood.dtsi               |  4 +--
 .../boot/dts/logicpd-som-lv-baseboard.dtsi    |  2 +-
 .../boot/dts/logicpd-torpedo-baseboard.dtsi   |  2 +-
 arch/arm/boot/dts/omap3-beagle-xm.dts         |  4 +--
 arch/arm/boot/dts/omap3-beagle.dts            |  6 ++--
 arch/arm/boot/dts/omap3-cm-t3517.dts          |  2 +-
 arch/arm/boot/dts/omap3-cm-t3530.dts          |  2 +-
 arch/arm/boot/dts/omap3-cm-t3730.dts          |  2 +-
 arch/arm/boot/dts/omap3-cm-t3x.dtsi           |  4 +--
 .../arm/boot/dts/omap3-devkit8000-common.dtsi |  4 +--
 arch/arm/boot/dts/omap3-gta04.dtsi            |  8 ++---
 arch/arm/boot/dts/omap3-ha-lcd.dts            |  2 +-
 arch/arm/boot/dts/omap3-igep0020-common.dtsi  |  2 +-
 arch/arm/boot/dts/omap3-n900.dts              |  6 ++--
 arch/arm/boot/dts/omap3-n950.dts              |  4 +--
 arch/arm/boot/dts/omap3-overo-common-dvi.dtsi |  2 +-
 .../boot/dts/omap3-overo-common-lcd35.dtsi    |  2 +-
 .../boot/dts/omap3-overo-common-lcd43.dtsi    |  2 +-
 arch/arm/boot/dts/omap3-pandora-common.dtsi   |  4 +--
 .../dts/omap3-panel-sharp-ls037v7dw01.dtsi    |  2 +-
 arch/arm/boot/dts/omap3-thunder.dts           |  2 +-
 arch/arm/boot/dts/omap34xx.dtsi               |  2 +-
 arch/arm/boot/dts/omap36xx.dtsi               |  2 +-
 arch/arm/boot/dts/omap4-duovero-parlor.dts    |  4 +--
 arch/arm/boot/dts/omap4-panda-common.dtsi     |  6 ++--
 arch/arm/boot/dts/omap4-sdp.dts               |  8 ++---
 arch/arm/boot/dts/omap5-board-common.dtsi     |  4 +--
 arch/arm/boot/dts/omap5-cm-t54.dts            |  6 ++--
 .../arm/boot/dts/qcom-apq8060-dragonboard.dts | 12 +++----
 .../boot/dts/qcom-apq8064-asus-nexus7-flo.dts |  8 ++---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts   |  8 ++---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts    | 10 +++---
 .../dts/qcom-apq8064-sony-xperia-yuga.dts     |  4 +--
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 10 +++---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 18 +++++------
 .../boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts    |  4 +--
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi | 10 +++---
 .../boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |  8 ++---
 .../boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts    |  2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi | 10 +++---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts      |  2 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi      | 12 +++----
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi    | 16 +++++-----
 arch/arm/boot/dts/qcom-msm8660-surf.dts       |  4 +--
 arch/arm/boot/dts/qcom-msm8960-cdp.dts        |  8 ++---
 .../boot/dts/qcom-msm8974-fairphone-fp2.dts   | 14 ++++----
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 32 +++++++++----------
 .../boot/dts/qcom-msm8974-samsung-klte.dts    |  8 ++---
 .../dts/qcom-msm8974-sony-xperia-amami.dts    | 14 ++++----
 .../dts/qcom-msm8974-sony-xperia-castor.dts   | 18 +++++------
 .../dts/qcom-msm8974-sony-xperia-honami.dts   | 16 +++++-----
 arch/arm/boot/dts/rk3288-evb.dtsi             |  2 +-
 .../boot/dts/rk3288-firefly-reload-core.dtsi  |  2 +-
 arch/arm/boot/dts/rk3288-firefly.dtsi         |  2 +-
 arch/arm/boot/dts/rk3288-miqi.dts             |  2 +-
 arch/arm/boot/dts/rk3288-popmetal.dts         |  2 +-
 arch/arm/boot/dts/rk3288-r89.dts              |  2 +-
 arch/arm/boot/dts/rk3288-rock2-square.dts     |  2 +-
 arch/arm/boot/dts/rk3288-tinker.dtsi          |  2 +-
 93 files changed, 233 insertions(+), 233 deletions(-)

diff --git a/arch/arm/boot/dts/am3517-evm-ui.dtsi b/arch/arm/boot/dts/am3517-evm-ui.dtsi
index 250c40da2535..7d8f32bf70db 100644
--- a/arch/arm/boot/dts/am3517-evm-ui.dtsi
+++ b/arch/arm/boot/dts/am3517-evm-ui.dtsi
@@ -183,14 +183,14 @@
 };
 
 &mcbsp1 {
-	status = "ok";
+	status = "okay";
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp1_pins>;
 };
 
 &mcbsp2 {
-	status = "ok";
+	status = "okay";
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp2_pins>;
diff --git a/arch/arm/boot/dts/am3517-evm.dts b/arch/arm/boot/dts/am3517-evm.dts
index 04f20e7680b1..0d2fac98ce7d 100644
--- a/arch/arm/boot/dts/am3517-evm.dts
+++ b/arch/arm/boot/dts/am3517-evm.dts
@@ -176,7 +176,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index b28e5c8cd02a..7c1ee35e6a1c 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -1024,7 +1024,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_pins>;
diff --git a/arch/arm/boot/dts/am437x-sbc-t43.dts b/arch/arm/boot/dts/am437x-sbc-t43.dts
index 94cf07ea27f7..8ea3780f939d 100644
--- a/arch/arm/boot/dts/am437x-sbc-t43.dts
+++ b/arch/arm/boot/dts/am437x-sbc-t43.dts
@@ -136,7 +136,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_pinctrl_default>;
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index de4fc78498a0..76f48ff051e8 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -948,7 +948,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_pins>;
diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index b3a0206ebd6c..1809f97d491d 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -582,13 +582,13 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	vdda_video-supply = <&ldoln_reg>;
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&ldo4_reg>;
 
 	port {
@@ -599,7 +599,7 @@
 };
 
 &pcie1_rc {
-	status = "ok";
+	status = "okay";
 	gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
 };
 
diff --git a/arch/arm/boot/dts/am57xx-sbc-am57x.dts b/arch/arm/boot/dts/am57xx-sbc-am57x.dts
index ce5bf1d92eab..beef63e8a005 100644
--- a/arch/arm/boot/dts/am57xx-sbc-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-sbc-am57x.dts
@@ -120,7 +120,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	vdda_video-supply = <&ldoln_reg>;
 
@@ -148,7 +148,7 @@
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&ldo4_reg>;
 
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/armada-388-db.dts b/arch/arm/boot/dts/armada-388-db.dts
index a2bec07bf4c5..f7b48926371b 100644
--- a/arch/arm/boot/dts/armada-388-db.dts
+++ b/arch/arm/boot/dts/armada-388-db.dts
@@ -57,7 +57,7 @@
 			};
 
 			usb@58000 {
-				status = "ok";
+				status = "okay";
 			};
 
 			ethernet@70000 {
diff --git a/arch/arm/boot/dts/bcm958525xmc.dts b/arch/arm/boot/dts/bcm958525xmc.dts
index 716da62f5788..21f922dc6019 100644
--- a/arch/arm/boot/dts/bcm958525xmc.dts
+++ b/arch/arm/boot/dts/bcm958525xmc.dts
@@ -196,7 +196,7 @@
 };
 
 &sdio {
-	status = "ok";
+	status = "okay";
 };
 
 &uart0 {
diff --git a/arch/arm/boot/dts/bcm958625k.dts b/arch/arm/boot/dts/bcm958625k.dts
index 7b84b54436ed..7782b61c51a1 100644
--- a/arch/arm/boot/dts/bcm958625k.dts
+++ b/arch/arm/boot/dts/bcm958625k.dts
@@ -208,7 +208,7 @@
 &sdio {
 	bus-width = <4>;
 	no-1-8-v;
-	status = "ok";
+	status = "okay";
 };
 
 &srab {
diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 87c517d65f62..9dc79b5977bf 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -415,7 +415,7 @@
 &aemif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&nand_pins>;
-	status = "ok";
+	status = "okay";
 	cs3 {
 		#address-cells = <2>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index 89e0bdaf3a85..d6230d762bb8 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -407,7 +407,7 @@
 				clocks = <&gate_clk 3>;
 				clock-names = "sata";
 				#phy-cells = <0>;
-				status = "ok";
+				status = "okay";
 			};
 
 			audio0: audio-controller@b0000 {
diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index a952d934fcf2..bda6f7eeef4f 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -565,7 +565,7 @@
 };
 
 &dcan1 {
-	status = "ok";
+	status = "okay";
 	pinctrl-names = "default", "sleep", "active";
 	pinctrl-0 = <&dcan1_pins_sleep>;
 	pinctrl-1 = <&dcan1_pins_sleep>;
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index 9273a7d6fa29..7506e415b08f 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -467,7 +467,7 @@
 };
 
 &dcan1 {
-	status = "ok";
+	status = "okay";
 	pinctrl-names = "default", "sleep", "active";
 	pinctrl-0 = <&dcan1_pins_sleep>;
 	pinctrl-1 = <&dcan1_pins_sleep>;
@@ -536,11 +536,11 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 
 	port {
 		hdmi_out: endpoint {
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 803981cc762e..81590ef36937 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -522,12 +522,12 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 	vdda_video-supply = <&ldo5_reg>;
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&ldo1_reg>;
 
diff --git a/arch/arm/boot/dts/efm32gg-dk3750.dts b/arch/arm/boot/dts/efm32gg-dk3750.dts
index adfa559a488b..7133cb5f502b 100644
--- a/arch/arm/boot/dts/efm32gg-dk3750.dts
+++ b/arch/arm/boot/dts/efm32gg-dk3750.dts
@@ -24,12 +24,12 @@
 
 	soc {
 		adc@40002000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		i2c@4000a000 {
 			energymicro,location = <3>;
-			status = "ok";
+			status = "okay";
 
 			temp@48 {
 				compatible = "st,stds75";
@@ -46,7 +46,7 @@
 		spi0: spi@4000c000 { /* USART0 */
 			cs-gpios = <&gpio 68 1>; // E4
 			energymicro,location = <1>;
-			status = "ok";
+			status = "okay";
 
 			microsd@0 {
 				compatible = "mmc-spi-slot";
@@ -60,7 +60,7 @@
 		spi1: spi@4000c400 { /* USART1 */
 			cs-gpios = <&gpio 51 1>; // D3
 			energymicro,location = <1>;
-			status = "ok";
+			status = "okay";
 
 			ks8851@0 {
 				compatible = "ks8851";
@@ -73,7 +73,7 @@
 
 		uart4: uart@4000e400 { /* UART1 */
 			energymicro,location = <2>;
-			status = "ok";
+			status = "okay";
 		};
 
 		boardfpga: boardfpga@80000000 {
@@ -82,7 +82,7 @@
 			irq-gpios = <&gpio 64 1>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
-			status = "ok";
+			status = "okay";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/efm32gg.dtsi b/arch/arm/boot/dts/efm32gg.dtsi
index 8a58e49144cc..20db696a0fbf 100644
--- a/arch/arm/boot/dts/efm32gg.dtsi
+++ b/arch/arm/boot/dts/efm32gg.dtsi
@@ -44,7 +44,7 @@
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			clocks = <&cmu clk_HFPERCLKGPIO>;
-			status = "ok";
+			status = "okay";
 		};
 
 		i2c0: i2c@4000a000 {
diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
index 6d0c04d77a39..43b68d100d56 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -113,7 +113,7 @@
 		ok {
 			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_OK>;
-			label = "ok";
+			label = "okay";
 			debounce-interval = <10>;
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 5cc96f04a4fa..13ffca1aefc5 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -112,7 +112,7 @@
 		ok-key {
 			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
 			linux,code = <352>;
-			label = "ok";
+			label = "okay";
 			debounce-interval = <10>;
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 99ce53b120ac..c3388b6c4b81 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -98,7 +98,7 @@
 		ok-key {
 			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
 			linux,code = <352>;
-			label = "ok";
+			label = "okay";
 			debounce-interval = <1>;
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 2c8111c6b065..97bc1b029068 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -132,7 +132,7 @@
 		key-ok {
 			gpios = <&gpx0 1 GPIO_ACTIVE_LOW>;
 			linux,code = <139>;
-			label = "ok";
+			label = "okay";
 			debounce-interval = <10>;
 			wakeup-source;
 		};
diff --git a/arch/arm/boot/dts/hi3620-hi4511.dts b/arch/arm/boot/dts/hi3620-hi4511.dts
index 8c703c3f2fe0..f6b0ddeaea84 100644
--- a/arch/arm/boot/dts/hi3620-hi4511.dts
+++ b/arch/arm/boot/dts/hi3620-hi4511.dts
@@ -24,42 +24,42 @@
 
 	amba {
 		dual_timer0: dual_timer@800000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		uart0: uart@b00000 {	/* console */
 			pinctrl-names = "default", "idle";
 			pinctrl-0 = <&uart0_pmx_func &uart0_cfg_func>;
 			pinctrl-1 = <&uart0_pmx_idle &uart0_cfg_idle>;
-			status = "ok";
+			status = "okay";
 		};
 
 		uart1: uart@b01000 { /* modem */
 			pinctrl-names = "default", "idle";
 			pinctrl-0 = <&uart1_pmx_func &uart1_cfg_func>;
 			pinctrl-1 = <&uart1_pmx_idle &uart1_cfg_idle>;
-			status = "ok";
+			status = "okay";
 		};
 
 		uart2: uart@b02000 { /* audience */
 			pinctrl-names = "default", "idle";
 			pinctrl-0 = <&uart2_pmx_func &uart2_cfg_func>;
 			pinctrl-1 = <&uart2_pmx_idle &uart2_cfg_idle>;
-			status = "ok";
+			status = "okay";
 		};
 
 		uart3: uart@b03000 {
 			pinctrl-names = "default", "idle";
 			pinctrl-0 = <&uart3_pmx_func &uart3_cfg_func>;
 			pinctrl-1 = <&uart3_pmx_idle &uart3_cfg_idle>;
-			status = "ok";
+			status = "okay";
 		};
 
 		uart4: uart@b04000 {
 			pinctrl-names = "default", "idle";
 			pinctrl-0 = <&uart4_pmx_func &uart4_cfg_func>;
 			pinctrl-1 = <&uart4_pmx_idle &uart4_cfg_func>;
-			status = "ok";
+			status = "okay";
 		};
 
 		pmx0: pinmux@803000 {
diff --git a/arch/arm/boot/dts/hip04-d01.dts b/arch/arm/boot/dts/hip04-d01.dts
index 9019e0d2ef60..05d25f5a3b85 100644
--- a/arch/arm/boot/dts/hip04-d01.dts
+++ b/arch/arm/boot/dts/hip04-d01.dts
@@ -23,7 +23,7 @@
 
 	soc {
 		uart0: uart@4007000 {
-			status = "ok";
+			status = "okay";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/keystone-k2e-evm.dts b/arch/arm/boot/dts/keystone-k2e-evm.dts
index 66fec5f5d081..acac242ebdf7 100644
--- a/arch/arm/boot/dts/keystone-k2e-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2e-evm.dts
@@ -159,7 +159,7 @@
 };
 
 &mdio {
-	status = "ok";
+	status = "okay";
 	ethphy0: ethernet-phy@0 {
 		compatible = "marvell,88E1514", "marvell,88E1510", "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
diff --git a/arch/arm/boot/dts/keystone-k2g-evm.dts b/arch/arm/boot/dts/keystone-k2g-evm.dts
index 8b3d64c913d8..a11457c7fc88 100644
--- a/arch/arm/boot/dts/keystone-k2g-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2g-evm.dts
@@ -449,7 +449,7 @@
 &dss {
 	pinctrl-names = "default";
 	pinctrl-0 = <&vout_pins>;
-	status = "ok";
+	status = "okay";
 
 	port {
 		dpi_out: endpoint {
diff --git a/arch/arm/boot/dts/keystone-k2hk-evm.dts b/arch/arm/boot/dts/keystone-k2hk-evm.dts
index ad4e22afe133..5e85f000acc3 100644
--- a/arch/arm/boot/dts/keystone-k2hk-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2hk-evm.dts
@@ -183,7 +183,7 @@
 };
 
 &mdio {
-	status = "ok";
+	status = "okay";
 	ethphy0: ethernet-phy@0 {
 		compatible = "marvell,88E1111", "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
diff --git a/arch/arm/boot/dts/keystone-k2l-evm.dts b/arch/arm/boot/dts/keystone-k2l-evm.dts
index e200533d26a4..a6cbff4cfe20 100644
--- a/arch/arm/boot/dts/keystone-k2l-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2l-evm.dts
@@ -132,7 +132,7 @@
 };
 
 &mdio {
-	status = "ok";
+	status = "okay";
 	ethphy0: ethernet-phy@0 {
 		compatible = "marvell,88E1514", "marvell,88E1510", "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
diff --git a/arch/arm/boot/dts/kirkwood-dockstar.dts b/arch/arm/boot/dts/kirkwood-dockstar.dts
index 6a3f1bf6d9f1..264938dfa4d9 100644
--- a/arch/arm/boot/dts/kirkwood-dockstar.dts
+++ b/arch/arm/boot/dts/kirkwood-dockstar.dts
@@ -34,7 +34,7 @@
 			};
 		};
 		serial@12000 {
-			status = "ok";
+			status = "okay";
 		};
 	};
 	gpio-leds {
diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boot/dts/kirkwood-dreamplug.dts
index 7f326e267494..328516351e84 100644
--- a/arch/arm/boot/dts/kirkwood-dreamplug.dts
+++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
@@ -34,7 +34,7 @@
 			};
 		};
 		serial@12000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		spi@10600 {
diff --git a/arch/arm/boot/dts/kirkwood-goflexnet.dts b/arch/arm/boot/dts/kirkwood-goflexnet.dts
index 02d87e0a1061..d4cb3cd3e2a2 100644
--- a/arch/arm/boot/dts/kirkwood-goflexnet.dts
+++ b/arch/arm/boot/dts/kirkwood-goflexnet.dts
@@ -66,7 +66,7 @@
 			};
 		};
 		serial@12000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		sata@80000 {
diff --git a/arch/arm/boot/dts/kirkwood-guruplug-server-plus.dts b/arch/arm/boot/dts/kirkwood-guruplug-server-plus.dts
index ff1260ee3fe8..dfb41393941d 100644
--- a/arch/arm/boot/dts/kirkwood-guruplug-server-plus.dts
+++ b/arch/arm/boot/dts/kirkwood-guruplug-server-plus.dts
@@ -38,7 +38,7 @@
 			};
 		};
 		serial@12000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		sata@80000 {
diff --git a/arch/arm/boot/dts/kirkwood-iconnect.dts b/arch/arm/boot/dts/kirkwood-iconnect.dts
index 4a512d80912c..95af7aa1fdcb 100644
--- a/arch/arm/boot/dts/kirkwood-iconnect.dts
+++ b/arch/arm/boot/dts/kirkwood-iconnect.dts
@@ -72,7 +72,7 @@
 			};
 		};
 		serial@12000 {
-			status = "ok";
+			status = "okay";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/kirkwood-iomega_ix2_200.dts b/arch/arm/boot/dts/kirkwood-iomega_ix2_200.dts
index 62272d58664f..2338f495d517 100644
--- a/arch/arm/boot/dts/kirkwood-iomega_ix2_200.dts
+++ b/arch/arm/boot/dts/kirkwood-iomega_ix2_200.dts
@@ -112,7 +112,7 @@
 		};
 
 		serial@12000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		sata@80000 {
diff --git a/arch/arm/boot/dts/kirkwood-nsa3x0-common.dtsi b/arch/arm/boot/dts/kirkwood-nsa3x0-common.dtsi
index 2c4037b07282..8f73197f251a 100644
--- a/arch/arm/boot/dts/kirkwood-nsa3x0-common.dtsi
+++ b/arch/arm/boot/dts/kirkwood-nsa3x0-common.dtsi
@@ -45,7 +45,7 @@
 		};
 
 		serial@12000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		sata@80000 {
diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
index 6c8d94beae78..fca31a5d5ac7 100644
--- a/arch/arm/boot/dts/kirkwood.dtsi
+++ b/arch/arm/boot/dts/kirkwood.dtsi
@@ -369,7 +369,7 @@
 			clocks = <&gate_clk 14>;
 			clock-names = "sata";
 			#phy-cells = <0>;
-			status = "ok";
+			status = "okay";
 		};
 
 		sata_phy1: sata-phy@84000 {
@@ -378,7 +378,7 @@
 			clocks = <&gate_clk 15>;
 			clock-names = "sata";
 			#phy-cells = <0>;
-			status = "ok";
+			status = "okay";
 		};
 
 		audio0: audio-controller@a0000 {
diff --git a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
index 100396f6c2fe..133e2ab5cda5 100644
--- a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
@@ -77,7 +77,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 	vdds_dsi-supply = <&vpll2>;
 	vdda_video-supply = <&video_reg>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index 381f0e82bb70..39539724e236 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -113,7 +113,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 	vdds_dsi-supply = <&vpll2>;
 	vdda_video-supply = <&vpll2>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/omap3-beagle-xm.dts b/arch/arm/boot/dts/omap3-beagle-xm.dts
index 05077f3c75cd..252507cf300b 100644
--- a/arch/arm/boot/dts/omap3-beagle-xm.dts
+++ b/arch/arm/boot/dts/omap3-beagle-xm.dts
@@ -389,7 +389,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <
@@ -406,7 +406,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&vdac>;
 
diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
index 79bc710c05fc..f9f34b8458e9 100644
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -386,7 +386,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
@@ -400,7 +400,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&vdac>;
 
@@ -413,7 +413,7 @@
 };
 
 &gpmc {
-	status = "ok";
+	status = "okay";
 	ranges = <0 0 0x30000000 0x1000000>;	/* CS0 space, 16MB */
 
 	/* Chip select 0 */
diff --git a/arch/arm/boot/dts/omap3-cm-t3517.dts b/arch/arm/boot/dts/omap3-cm-t3517.dts
index 632f52efdf98..3b8349094baa 100644
--- a/arch/arm/boot/dts/omap3-cm-t3517.dts
+++ b/arch/arm/boot/dts/omap3-cm-t3517.dts
@@ -147,7 +147,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <
diff --git a/arch/arm/boot/dts/omap3-cm-t3530.dts b/arch/arm/boot/dts/omap3-cm-t3530.dts
index 32dbaeaed147..bc545ee23e71 100644
--- a/arch/arm/boot/dts/omap3-cm-t3530.dts
+++ b/arch/arm/boot/dts/omap3-cm-t3530.dts
@@ -49,7 +49,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <
diff --git a/arch/arm/boot/dts/omap3-cm-t3730.dts b/arch/arm/boot/dts/omap3-cm-t3730.dts
index 683819bf0915..48e48b0c8190 100644
--- a/arch/arm/boot/dts/omap3-cm-t3730.dts
+++ b/arch/arm/boot/dts/omap3-cm-t3730.dts
@@ -87,7 +87,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <
diff --git a/arch/arm/boot/dts/omap3-cm-t3x.dtsi b/arch/arm/boot/dts/omap3-cm-t3x.dtsi
index cdb632df152a..e61b8a2bfb7d 100644
--- a/arch/arm/boot/dts/omap3-cm-t3x.dtsi
+++ b/arch/arm/boot/dts/omap3-cm-t3x.dtsi
@@ -246,7 +246,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	port {
 		venc_out: endpoint {
@@ -257,7 +257,7 @@
 };
 
 &mcbsp2 {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp2_pins>;
diff --git a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
index ac3d996cec5c..2c19d6e255bd 100644
--- a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
+++ b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
@@ -337,7 +337,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
@@ -361,7 +361,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&vdac>;
 
diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index ecc45862b4f3..c8745bc800f7 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -822,27 +822,27 @@
 };
 
 &mcbsp1 { /* FM Transceiver PCM */
-	status = "ok";
+	status = "okay";
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp1_pins>;
 };
 
 &mcbsp2 { /* TPS65950 I2S */
-	status = "ok";
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp2_pins>;
 };
 
 &mcbsp3 { /* Bluetooth PCM */
-	status = "ok";
+	status = "okay";
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp3_pins>;
 };
 
 &mcbsp4 { /* GSM voice PCM */
-	status = "ok";
+	status = "okay";
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp4_pins>;
diff --git a/arch/arm/boot/dts/omap3-ha-lcd.dts b/arch/arm/boot/dts/omap3-ha-lcd.dts
index b3f7f9966c3c..643283f0c3db 100644
--- a/arch/arm/boot/dts/omap3-ha-lcd.dts
+++ b/arch/arm/boot/dts/omap3-ha-lcd.dts
@@ -100,7 +100,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/omap3-igep0020-common.dtsi b/arch/arm/boot/dts/omap3-igep0020-common.dtsi
index 91caa50b74c4..af8aa5f0feb7 100644
--- a/arch/arm/boot/dts/omap3-igep0020-common.dtsi
+++ b/arch/arm/boot/dts/omap3-igep0020-common.dtsi
@@ -245,7 +245,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	port {
 		dpi_out: endpoint {
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index bc24e3dc7cda..32335d4ce478 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -1083,7 +1083,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_sdi_pins>;
@@ -1106,7 +1106,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&vdac>;
 
@@ -1119,7 +1119,7 @@
 };
 
 &mcbsp2 {
-	status = "ok";
+	status = "okay";
 };
 
 &ssi_port1 {
diff --git a/arch/arm/boot/dts/omap3-n950.dts b/arch/arm/boot/dts/omap3-n950.dts
index 31d47a1fad84..6a260998a837 100644
--- a/arch/arm/boot/dts/omap3-n950.dts
+++ b/arch/arm/boot/dts/omap3-n950.dts
@@ -205,13 +205,13 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	vdda_video-supply = <&vdac>;
 };
 
 &dsi {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dsi_pins>;
diff --git a/arch/arm/boot/dts/omap3-overo-common-dvi.dtsi b/arch/arm/boot/dts/omap3-overo-common-dvi.dtsi
index c9e62e414abb..339a51fa4119 100644
--- a/arch/arm/boot/dts/omap3-overo-common-dvi.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-common-dvi.dtsi
@@ -48,7 +48,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi b/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
index 185ce53de0ec..1d6e88f99eb3 100644
--- a/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
@@ -76,7 +76,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi b/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
index 7fe0f9148232..7e30f9d45790 100644
--- a/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
@@ -75,7 +75,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/omap3-pandora-common.dtsi b/arch/arm/boot/dts/omap3-pandora-common.dtsi
index 150d5be42d27..37608af6c07f 100644
--- a/arch/arm/boot/dts/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/omap3-pandora-common.dtsi
@@ -702,7 +702,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&vdac>;
 
@@ -718,7 +718,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = < &dss_dpi_pins >;
 
-	status = "ok";
+	status = "okay";
 	vdds_dsi-supply = <&vpll2>;
 
 	port {
diff --git a/arch/arm/boot/dts/omap3-panel-sharp-ls037v7dw01.dtsi b/arch/arm/boot/dts/omap3-panel-sharp-ls037v7dw01.dtsi
index b8b9fcc41ef1..2dbb687d4df2 100644
--- a/arch/arm/boot/dts/omap3-panel-sharp-ls037v7dw01.dtsi
+++ b/arch/arm/boot/dts/omap3-panel-sharp-ls037v7dw01.dtsi
@@ -46,7 +46,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 	port {
 		dpi_out: endpoint {
 			remote-endpoint = <&lcd_in>;
diff --git a/arch/arm/boot/dts/omap3-thunder.dts b/arch/arm/boot/dts/omap3-thunder.dts
index f7930f198ce5..d82cab8e213a 100644
--- a/arch/arm/boot/dts/omap3-thunder.dts
+++ b/arch/arm/boot/dts/omap3-thunder.dts
@@ -64,7 +64,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
index 9c3ee4ac8165..fc9753b134a8 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -182,7 +182,7 @@
 };
 
 &ssi {
-	status = "ok";
+	status = "okay";
 
 	clocks = <&ssi_ssr_fck>,
 		 <&ssi_sst_fck>,
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 9c3beefc0fe0..593aad1a54ad 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -234,7 +234,7 @@
 };
 
 &ssi {
-	status = "ok";
+	status = "okay";
 
 	clocks = <&ssi_ssr_fck>,
 		 <&ssi_sst_fck>,
diff --git a/arch/arm/boot/dts/omap4-duovero-parlor.dts b/arch/arm/boot/dts/omap4-duovero-parlor.dts
index 4548d87534e3..b294c22177cb 100644
--- a/arch/arm/boot/dts/omap4-duovero-parlor.dts
+++ b/arch/arm/boot/dts/omap4-duovero-parlor.dts
@@ -171,11 +171,11 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&vdac>;
 
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
index 3e78caefa2b8..609a8dea946b 100644
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -566,7 +566,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	port {
 		dpi_out: endpoint {
@@ -577,12 +577,12 @@
 };
 
 &dsi2 {
-	status = "ok";
+	status = "okay";
 	vdd-supply = <&vcxio>;
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&vdac>;
 
 	port {
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
index 79e7a41ecb7e..5aa84db5e2be 100644
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -648,11 +648,11 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 };
 
 &dsi1 {
-	status = "ok";
+	status = "okay";
 	vdd-supply = <&vcxio>;
 
 	port {
@@ -677,7 +677,7 @@
 };
 
 &dsi2 {
-	status = "ok";
+	status = "okay";
 	vdd-supply = <&vcxio>;
 
 	port {
@@ -702,7 +702,7 @@
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&vdac>;
 
 	port {
diff --git a/arch/arm/boot/dts/omap5-board-common.dtsi b/arch/arm/boot/dts/omap5-board-common.dtsi
index edf1906016c8..d8f13626cfd1 100644
--- a/arch/arm/boot/dts/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/omap5-board-common.dtsi
@@ -743,11 +743,11 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 
 	/* vdda-supply populated in board specific dts file */
 
diff --git a/arch/arm/boot/dts/omap5-cm-t54.dts b/arch/arm/boot/dts/omap5-cm-t54.dts
index e78d3718f145..ca759b7b8a58 100644
--- a/arch/arm/boot/dts/omap5-cm-t54.dts
+++ b/arch/arm/boot/dts/omap5-cm-t54.dts
@@ -653,7 +653,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
@@ -677,12 +677,12 @@
 };
 
 &dsi2 {
-	status = "ok";
+	status = "okay";
 	vdd-supply = <&ldo4_reg>;
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&ldo4_reg>;
 
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index 4e6c50d45cb2..dace8ffeb991 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -461,11 +461,11 @@
 		};
 
 		gsbi@19800000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C>;
 
 			i2c@19880000 {
-				status = "ok";
+				status = "okay";
 				pinctrl-names = "default";
 				pinctrl-0 = <&dragon_gsbi8_i2c_pins>;
 
@@ -497,17 +497,17 @@
 		};
 
 		gsbi@19c00000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C_UART>;
 
 			serial@19c40000 {
-				status = "ok";
+				status = "okay";
 				pinctrl-names = "default";
 				pinctrl-0 = <&dragon_gsbi12_serial_pins>;
 			};
 
 			i2c@19c80000 {
-				status = "ok";
+				status = "okay";
 				pinctrl-names = "default";
 				pinctrl-0 = <&dragon_gsbi12_i2c_pins>;
 
@@ -571,7 +571,7 @@
 
 		external-bus@1a100000 {
 			/* The EBI2 will instantiate first, then populate its children */
-			status = "ok";
+			status = "okay";
 			pinctrl-names = "default";
 			pinctrl-0 = <&dragon_ebi2_pins>;
 
diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index a701d4bac320..3bce47d16ab3 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -302,11 +302,11 @@
 		};
 
 		gsbi@16500000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C_UART>;
 
 			serial@16540000 {
-				status = "ok";
+				status = "okay";
 
 				pinctrl-names = "default";
 				pinctrl-0 = <&gsbi6_uart_4pins>;
@@ -314,10 +314,10 @@
 		};
 
 		gsbi@16600000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C_UART>;
 			serial@16640000 {
-				status = "ok";
+				status = "okay";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index 209eb21cea00..0148148a8e0a 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -141,10 +141,10 @@
 		};
 
 		gsbi@16600000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C_UART>;
 			serial@16640000 {
-				status = "ok";
+				status = "okay";
 				pinctrl-names = "default";
 				pinctrl-0 = <&gsbi7_uart_2pins>;
 			};
@@ -152,7 +152,7 @@
 
 		/* OTG */
 		usb@12500000 {
-			status = "ok";
+			status = "okay";
 			dr_mode = "otg";
 			ulpi {
 				phy {
@@ -209,7 +209,7 @@
 		};
 
 		pci@1b500000 {
-			status = "ok";
+			status = "okay";
 			vdda-supply = <&pm8921_s3>;
 			vdda_phy-supply = <&pm8921_lvs6>;
 			vdda_refclk-supply = <&v3p3_fixed>;
diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 83aaf4a74398..d0a17b5a5fa3 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -215,21 +215,21 @@
 		};
 
 		gsbi@16500000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_UART_W_FC>;
 
 			serial@16540000 {
-				status = "ok";
+				status = "okay";
 				pinctrl-names = "default";
 				pinctrl-0 = <&gsbi6_uart_4pins>;
 			};
 		};
 
 		gsbi@16600000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C_UART>;
 			serial@16640000 {
-				status = "ok";
+				status = "okay";
 				pinctrl-names = "default";
 				pinctrl-0 = <&gsbi7_uart_2pins>;
 			};
@@ -279,7 +279,7 @@
 		};
 
 		pci@1b500000 {
-			status = "ok";
+			status = "okay";
 			vdda-supply = <&pm8921_s3>;
 			vdda_phy-supply = <&pm8921_lvs6>;
 			vdda_refclk-supply = <&ext_3p3v>;
diff --git a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
index 8bf488fb86ad..72e47bdc5c12 100644
--- a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
@@ -362,11 +362,11 @@
 		};
 
 		gsbi@1a200000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C_UART>;
 
 			serial@1a240000 {
-				status = "ok";
+				status = "okay";
 
 				pinctrl-names = "default";
 				pinctrl-0 = <&gsbi5_uart_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 244f04e19c9d..83793b835d40 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -19,13 +19,13 @@
 
 	soc {
 		serial@f991e000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		sdhci@f9824900 {
 			bus-width = <8>;
 			non-removable;
-			status = "ok";
+			status = "okay";
 
 			vmmc-supply = <&pm8941_l20>;
 			vqmmc-supply = <&pm8941_s3>;
@@ -39,14 +39,14 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&sdhc2_pin_a>, <&sdhc2_cd_pin_a>;
 			bus-width = <4>;
-			status = "ok";
+			status = "okay";
 
 			vmmc-supply = <&pm8941_l21>;
 			vqmmc-supply = <&pm8941_l13>;
 		};
 
 		usb@f9a55000 {
-			status = "ok";
+			status = "okay";
 			phys = <&usb_hs2_phy>;
 			phy-select = <&tcsr 0xb000 1>;
 			extcon = <&smbb>, <&usb_id>;
@@ -56,7 +56,7 @@
 			adp-disable;
 			ulpi {
 				phy@b {
-					status = "ok";
+					status = "okay";
 					v3p3-supply = <&pm8941_l24>;
 					v1p8-supply = <&pm8941_l6>;
 					extcon = <&smbb>;
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
index 418f9a022336..c93b2164db44 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
@@ -30,7 +30,7 @@
 
 	soc {
 		rng@22000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		pinctrl@1000000 {
@@ -66,13 +66,13 @@
 		};
 
 		blsp_dma: dma@7884000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		spi@78b5000 {
 			pinctrl-0 = <&spi_0_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 			cs-gpios = <&tlmm 54 0>;
 
 			mx25l25635e@0 {
@@ -87,27 +87,27 @@
 		serial@78af000 {
 			pinctrl-0 = <&serial_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 		};
 
 		cryptobam: dma@8e04000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		crypto@8e3a000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		watchdog@b017000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		wifi@a000000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		wifi@a800000 {
-			status = "ok";
+			status = "okay";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
index 7a96f300bc8d..b0f476ff017f 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
@@ -9,11 +9,11 @@
 
 	soc {
 		dma@7984000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		qpic-nand@79b0000 {
-			status = "ok";
+			status = "okay";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
index 7c1eb1963c67..7a337dc08741 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
@@ -70,23 +70,23 @@
 		serial@78af000 {
 			pinctrl-0 = <&serial_0_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 		};
 
 		serial@78b0000 {
 			pinctrl-0 = <&serial_1_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 		};
 
 		dma@7884000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		spi@78b5000 { /* BLSP1 QUP1 */
 			pinctrl-0 = <&spi_0_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 			cs-gpios = <&tlmm 12 0>;
 
 			m25p80@0 {
@@ -99,7 +99,7 @@
 		};
 
 		pci@40000000 {
-			status = "ok";
+			status = "okay";
 			perst-gpio = <&tlmm 38 0x1>;
 		};
 
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
index 8c7ef6537ae6..f343a2244386 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
@@ -9,12 +9,12 @@
 
 	soc {
 		pci@40000000 {
-			status = "ok";
+			status = "okay";
 			perst-gpio = <&tlmm 38 0x1>;
 		};
 
 		spi@78b6000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		pinctrl@1000000 {
@@ -43,13 +43,13 @@
 		serial@78b0000 {
 			pinctrl-0 = <&serial_1_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 		};
 
 		spi@78b5000 {
 			pinctrl-0 = <&spi_0_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 			cs-gpios = <&tlmm 12 0>;
 
 			m25p80@0 {
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts
index af7a9028d492..582acb681a98 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts
@@ -19,7 +19,7 @@
 		serial@78b0000 {
 			pinctrl-0 = <&serial_1_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi
index 9f1a5a668772..94872518b5a2 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi
@@ -49,27 +49,27 @@
 		serial@78af000 {
 			pinctrl-0 = <&serial_0_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 		};
 
 		dma@7884000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		i2c@78b7000 { /* BLSP1 QUP2 */
 			pinctrl-0 = <&i2c_0_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 		};
 
 		dma@7984000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		qpic-nand@79b0000 {
 			pinctrl-0 = <&nand_pins>;
 			pinctrl-names = "default";
-			status = "ok";
+			status = "okay";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index 554c65e7aa0e..e5b9b9cf6097 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -24,7 +24,7 @@
 
 		gsbi@16300000 {
 			i2c@16380000 {
-				status = "ok";
+				status = "okay";
 				clock-frequency = <200000>;
 				pinctrl-0 = <&i2c4_pins>;
 				pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
index e239a0486936..65330065390a 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
@@ -16,19 +16,19 @@
 	soc {
 		gsbi@16300000 {
 			qcom,mode = <GSBI_PROT_I2C_UART>;
-			status = "ok";
+			status = "okay";
 
 			serial@16340000 {
-				status = "ok";
+				status = "okay";
 			};
 		};
 
 		gsbi5: gsbi@1a200000 {
 			qcom,mode = <GSBI_PROT_SPI>;
-			status = "ok";
+			status = "okay";
 
 			spi4: spi@1a280000 {
-				status = "ok";
+				status = "okay";
 				spi-max-frequency = <50000000>;
 
 				pinctrl-0 = <&spi_pins>;
@@ -57,12 +57,12 @@
 		};
 
 		sata-phy@1b400000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		sata@29000000 {
 			ports-implemented = <0x1>;
-			status = "ok";
+			status = "okay";
 		};
 
 		gpio_keys {
diff --git a/arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi
index 26b034bd19d2..a725b73b5a2e 100644
--- a/arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi
@@ -125,12 +125,12 @@
 };
 
 &gsbi3 {
-	status = "ok";
+	status = "okay";
 	qcom,mode = <GSBI_PROT_SPI>;
 };
 
 &gsbi3_spi {
-	status = "ok";
+	status = "okay";
 	pinctrl-0 = <&gsbi3_pins>;
 	pinctrl-names = "default";
 	assigned-clocks = <&gcc GSBI3_QUP_CLK>;
@@ -138,34 +138,34 @@
 };
 
 &gsbi4 {
-	status = "ok";
+	status = "okay";
 	qcom,mode = <GSBI_PROT_UART_W_FC>;
 };
 
 &gsbi4_serial {
-	status = "ok";
+	status = "okay";
 	pinctrl-0 = <&gsbi4_pins>;
 	pinctrl-names = "default";
 };
 
 &gsbi5 {
-	status = "ok";
+	status = "okay";
 	qcom,mode = <GSBI_PROT_I2C_UART>;
 };
 
 &gsbi5_i2c {
-	status = "ok";
+	status = "okay";
 	clock-frequency = <200000>;
 	pinctrl-0 = <&gsbi5_i2c_pins>;
 	pinctrl-names = "default";
 };
 
 &gsbi5_serial {
-	status = "ok";
+	status = "okay";
 	pinctrl-0 = <&gsbi5_uart_pins>;
 	pinctrl-names = "default";
 };
 
 &sdcc1 {
-	status = "ok";
+	status = "okay";
 };
diff --git a/arch/arm/boot/dts/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom-msm8660-surf.dts
index f01a11b18d6a..6a321ccb0bd0 100644
--- a/arch/arm/boot/dts/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom-msm8660-surf.dts
@@ -17,10 +17,10 @@
 
 	soc {
 		gsbi@19c00000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C_UART>;
 			serial@19c40000 {
-				status = "ok";
+				status = "okay";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
index 82d5d8267adf..e7d2e937ea4c 100644
--- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
@@ -17,10 +17,10 @@
 
 	soc {
 		gsbi@16400000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C_UART>;
 			serial@16440000 {
-				status = "ok";
+				status = "okay";
 			};
 		};
 
@@ -273,12 +273,12 @@
 		};
 
 		gsbi@16000000 {
-			status = "ok";
+			status = "okay";
 			qcom,mode = <GSBI_PROT_SPI>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_default>;
 			spi@16080000 {
-				status = "ok";
+				status = "okay";
 				eth@0 {
 					compatible = "micrel,ks8851";
 					reg = <0>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index d2d48770ec0f..ea15b645b229 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -256,11 +256,11 @@
 
 &soc {
 	serial@f991e000 {
-		status = "ok";
+		status = "okay";
 	};
 
 	remoteproc@fb21b000 {
-		status = "ok";
+		status = "okay";
 
 		vddmx-supply = <&pm8841_s1>;
 		vddcx-supply = <&pm8841_s2>;
@@ -273,7 +273,7 @@
 			label = "pronto";
 
 			wcnss {
-				status = "ok";
+				status = "okay";
 			};
 		};
 	};
@@ -335,7 +335,7 @@
 	};
 
 	sdhci@f9824900 {
-		status = "ok";
+		status = "okay";
 
 		vmmc-supply = <&pm8941_l20>;
 		vqmmc-supply = <&pm8941_s3>;
@@ -348,7 +348,7 @@
 	};
 
 	sdhci@f98a4900 {
-		status = "ok";
+		status = "okay";
 
 		vmmc-supply = <&pm8941_l21>;
 		vqmmc-supply = <&pm8941_l13>;
@@ -360,7 +360,7 @@
 	};
 
 	usb@f9a55000 {
-		status = "ok";
+		status = "okay";
 
 		phys = <&usb_hs1_phy>;
 		phy-select = <&tcsr 0xb000 0>;
@@ -373,7 +373,7 @@
 
 		ulpi {
 			phy@a {
-				status = "ok";
+				status = "okay";
 
 				v1p8-supply = <&pm8941_l6>;
 				v3p3-supply = <&pm8941_l24>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 32b474bfeec3..047387e5eaee 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -239,7 +239,7 @@
 
 &soc {
 	serial@f991d000 {
-		status = "ok";
+		status = "okay";
 	};
 
 	pinctrl@fd510000 {
@@ -410,7 +410,7 @@
 	};
 
 	sdhci@f9824900 {
-		status = "ok";
+		status = "okay";
 
 		vmmc-supply = <&pm8941_l20>;
 		vqmmc-supply = <&pm8941_s3>;
@@ -423,7 +423,7 @@
 	};
 
 	sdhci@f98a4900 {
-		status = "ok";
+		status = "okay";
 
 		max-frequency = <100000000>;
 		bus-width = <4>;
@@ -471,7 +471,7 @@
 	};
 
 	serial@f9960000 {
-		status = "ok";
+		status = "okay";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&blsp2_uart10_pin_a>;
@@ -490,7 +490,7 @@
 	};
 
 	i2c@f9967000 {
-		status = "ok";
+		status = "okay";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c11_pins>;
 		clock-frequency = <355000>;
@@ -498,7 +498,7 @@
 
 		led-controller@38 {
 			compatible = "ti,lm3630a";
-			status = "ok";
+			status = "okay";
 			reg = <0x38>;
 
 			#address-cells = <1>;
@@ -514,7 +514,7 @@
 	};
 
 	i2c@f9968000 {
-		status = "ok";
+		status = "okay";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c12_pins>;
 		clock-frequency = <100000>;
@@ -551,7 +551,7 @@
 	};
 
 	i2c@f9923000 {
-		status = "ok";
+		status = "okay";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c1_pins>;
 		clock-frequency = <100000>;
@@ -569,7 +569,7 @@
 	};
 
 	i2c@f9924000 {
-		status = "ok";
+		status = "okay";
 
 		clock-frequency = <355000>;
 		qcom,src-freq = <50000000>;
@@ -604,7 +604,7 @@
 	};
 
 	i2c@f9925000 {
-		status = "ok";
+		status = "okay";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c3_pins>;
 		clock-frequency = <100000>;
@@ -622,7 +622,7 @@
 	};
 
 	usb@f9a55000 {
-		status = "ok";
+		status = "okay";
 
 		phys = <&usb_hs1_phy>;
 		phy-select = <&tcsr 0xb000 0>;
@@ -636,7 +636,7 @@
 
 		ulpi {
 			phy@a {
-				status = "ok";
+				status = "okay";
 
 				v1p8-supply = <&pm8941_l6>;
 				v3p3-supply = <&pm8941_l24>;
@@ -647,14 +647,14 @@
 	};
 
 	mdss@fd900000 {
-		status = "ok";
+		status = "okay";
 
 		mdp@fd900000 {
-			status = "ok";
+			status = "okay";
 		};
 
 		dsi@fd922800 {
-			status = "ok";
+			status = "okay";
 
 			vdda-supply = <&pm8941_l2>;
 			vdd-supply = <&pm8941_lvs3>;
@@ -688,7 +688,7 @@
 		};
 
 		dsi-phy@fd922a00 {
-			status = "ok";
+			status = "okay";
 
 			vddio-supply = <&pm8941_l12>;
 		};
diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index d4dc98214225..2dd01e665f27 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -208,7 +208,7 @@
 
 &soc {
 	serial@f991e000 {
-		status = "ok";
+		status = "okay";
 	};
 
 	gpio-keys {
@@ -261,7 +261,7 @@
 	};
 
 	sdhci@f9824900 {
-		status = "ok";
+		status = "okay";
 
 		vmmc-supply = <&pma8084_l20>;
 		vqmmc-supply = <&pma8084_s4>;
@@ -274,7 +274,7 @@
 	};
 
 	usb@f9a55000 {
-		status = "ok";
+		status = "okay";
 
 		phys = <&usb_hs1_phy>;
 		phy-select = <&tcsr 0xb000 0>;
@@ -287,7 +287,7 @@
 
 		ulpi {
 			phy@a {
-				status = "ok";
+				status = "okay";
 
 				v1p8-supply = <&pma8084_l6>;
 				v3p3-supply = <&pma8084_l24>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
index 5669f5f58a86..398a3eaf306b 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
@@ -261,7 +261,7 @@
 
 &soc {
 	sdhci@f9824900 {
-		status = "ok";
+		status = "okay";
 
 		vmmc-supply = <&pm8941_l20>;
 		vqmmc-supply = <&pm8941_s3>;
@@ -274,7 +274,7 @@
 	};
 
 	sdhci@f98a4900 {
-		status = "ok";
+		status = "okay";
 
 		bus-width = <4>;
 
@@ -288,7 +288,7 @@
 	};
 
 	serial@f991e000 {
-		status = "ok";
+		status = "okay";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&blsp1_uart2_pin_a>;
@@ -366,7 +366,7 @@
 	};
 
 	usb@f9a55000 {
-		status = "ok";
+		status = "okay";
 
 		phys = <&usb_hs1_phy>;
 		phy-select = <&tcsr 0xb000 0>;
@@ -379,7 +379,7 @@
 
 		ulpi {
 			phy@a {
-				status = "ok";
+				status = "okay";
 
 				v1p8-supply = <&pm8941_l6>;
 				v3p3-supply = <&pm8941_l24>;
@@ -415,7 +415,7 @@
 		};
 
 		coincell@2800 {
-			status = "ok";
+			status = "okay";
 			qcom,rset-ohms = <2100>;
 			qcom,vset-millivolts = <3000>;
 		};
@@ -423,7 +423,7 @@
 
 	pm8941@1 {
 		wled@d800 {
-			status = "ok";
+			status = "okay";
 
 			qcom,cs-out;
 			qcom,current-limit = <20>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
index 701b396719c7..f4ec08f13003 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
@@ -279,7 +279,7 @@
 
 &soc {
 	sdhci@f9824900 {
-		status = "ok";
+		status = "okay";
 
 		vmmc-supply = <&pm8941_l20>;
 		vqmmc-supply = <&pm8941_s3>;
@@ -292,7 +292,7 @@
 	};
 
 	sdhci@f9864900 {
-		status = "ok";
+		status = "okay";
 
 		max-frequency = <100000000>;
 		non-removable;
@@ -316,7 +316,7 @@
 	};
 
 	sdhci@f98a4900 {
-		status = "ok";
+		status = "okay";
 
 		bus-width = <4>;
 
@@ -330,14 +330,14 @@
 	};
 
 	serial@f991e000 {
-		status = "ok";
+		status = "okay";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&blsp1_uart2_pin_a>;
 	};
 
 	usb@f9a55000 {
-		status = "ok";
+		status = "okay";
 
 		phys = <&usb_hs1_phy>;
 		phy-select = <&tcsr 0xb000 0>;
@@ -350,7 +350,7 @@
 
 		ulpi {
 			phy@a {
-				status = "ok";
+				status = "okay";
 
 				v1p8-supply = <&pm8941_l6>;
 				v3p3-supply = <&pm8941_l24>;
@@ -482,7 +482,7 @@
 	};
 
 	i2c@f9964000 {
-		status = "ok";
+		status = "okay";
 
 		clock-frequency = <355000>;
 		qcom,src-freq = <50000000>;
@@ -522,7 +522,7 @@
 	};
 
 	i2c@f9967000 {
-		status = "ok";
+		status = "okay";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c11_pins>;
 		clock-frequency = <355000>;
@@ -635,7 +635,7 @@
 		};
 
 		coincell@2800 {
-			status = "ok";
+			status = "okay";
 			qcom,rset-ohms = <2100>;
 			qcom,vset-millivolts = <3000>;
 		};
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
index 611bae9fe66b..9743beebd84d 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
@@ -261,7 +261,7 @@
 
 &soc {
 	usb@f9a55000 {
-		status = "ok";
+		status = "okay";
 
 		phys = <&usb_hs1_phy>;
 		phy-select = <&tcsr 0xb000 0>;
@@ -274,7 +274,7 @@
 
 		ulpi {
 			phy@a {
-				status = "ok";
+				status = "okay";
 
 				v1p8-supply = <&pm8941_l6>;
 				v3p3-supply = <&pm8941_l24>;
@@ -286,7 +286,7 @@
 	};
 
 	sdhci@f9824900 {
-		status = "ok";
+		status = "okay";
 
 		vmmc-supply = <&pm8941_l20>;
 		vqmmc-supply = <&pm8941_s3>;
@@ -299,7 +299,7 @@
 	};
 
 	sdhci@f98a4900 {
-		status = "ok";
+		status = "okay";
 
 		bus-width = <4>;
 
@@ -313,14 +313,14 @@
 	};
 
 	serial@f991e000 {
-		status = "ok";
+		status = "okay";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&blsp1_uart2_pin_a>;
 	};
 
 	i2c@f9924000 {
-		status = "ok";
+		status = "okay";
 
 		clock-frequency = <355000>;
 		qcom,src-freq = <50000000>;
@@ -464,7 +464,7 @@
 		};
 
 		coincell@2800 {
-			status = "ok";
+			status = "okay";
 			qcom,rset-ohms = <2100>;
 			qcom,vset-millivolts = <3000>;
 		};
@@ -472,7 +472,7 @@
 
 	pm8941@1 {
 		wled@d800 {
-			status = "ok";
+			status = "okay";
 
 			qcom,cs-out;
 			qcom,current-limit = <20>;
diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index 018802df4c0e..c4ca73b40d4a 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -247,7 +247,7 @@
 	pinctrl-0 = <&rgmii_pins>;
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
-	status = "ok";
+	status = "okay";
 };
 
 &gpu {
diff --git a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
index 61435d8ee37b..36efa36b7190 100644
--- a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
+++ b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
@@ -61,7 +61,7 @@
 	snps,reset-gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
-	status = "ok";
+	status = "okay";
 };
 
 &i2c0 {
diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi b/arch/arm/boot/dts/rk3288-firefly.dtsi
index e5c4fd4ea67e..7fb582302b32 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
@@ -191,7 +191,7 @@
 	snps,reset-gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
-	status = "ok";
+	status = "okay";
 };
 
 &gpu {
diff --git a/arch/arm/boot/dts/rk3288-miqi.dts b/arch/arm/boot/dts/rk3288-miqi.dts
index 213c9eb84f76..e3d13d66f405 100644
--- a/arch/arm/boot/dts/rk3288-miqi.dts
+++ b/arch/arm/boot/dts/rk3288-miqi.dts
@@ -108,7 +108,7 @@
 	snps,reset-gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
-	status = "ok";
+	status = "okay";
 };
 
 &hdmi {
diff --git a/arch/arm/boot/dts/rk3288-popmetal.dts b/arch/arm/boot/dts/rk3288-popmetal.dts
index 6a51940398b5..e738eb732800 100644
--- a/arch/arm/boot/dts/rk3288-popmetal.dts
+++ b/arch/arm/boot/dts/rk3288-popmetal.dts
@@ -149,7 +149,7 @@
 	pinctrl-0 = <&rgmii_pins>;
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
-	status = "ok";
+	status = "okay";
 };
 
 &hdmi {
diff --git a/arch/arm/boot/dts/rk3288-r89.dts b/arch/arm/boot/dts/rk3288-r89.dts
index a258c7ae5329..527c529c8934 100644
--- a/arch/arm/boot/dts/rk3288-r89.dts
+++ b/arch/arm/boot/dts/rk3288-r89.dts
@@ -107,7 +107,7 @@
 	pinctrl-0 = <&rgmii_pins>;
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
-	status = "ok";
+	status = "okay";
 };
 
 &hdmi {
diff --git a/arch/arm/boot/dts/rk3288-rock2-square.dts b/arch/arm/boot/dts/rk3288-rock2-square.dts
index 3cca4d0f9b09..c4d1d142d8c6 100644
--- a/arch/arm/boot/dts/rk3288-rock2-square.dts
+++ b/arch/arm/boot/dts/rk3288-rock2-square.dts
@@ -156,7 +156,7 @@
 };
 
 &gmac {
-	status = "ok";
+	status = "okay";
 };
 
 &hdmi {
diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
index 90e9be443fe6..9c1e38c54eae 100644
--- a/arch/arm/boot/dts/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
@@ -137,7 +137,7 @@
 	snps,reset-delays-us = <0 10000 1000000>;
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
-	status = "ok";
+	status = "okay";
 };
 
 &gpu {
-- 
2.20.1

