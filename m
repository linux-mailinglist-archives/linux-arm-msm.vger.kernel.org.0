Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFBF825701E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Aug 2020 21:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgH3TSI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Aug 2020 15:18:08 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:52345 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbgH3TR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Aug 2020 15:17:57 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MhlCa-1kpuJe2bbM-00dm4n; Sun, 30 Aug 2020 21:17:46 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: replace status value "ok" by "okay"
Date:   Sun, 30 Aug 2020 21:16:43 +0200
Message-Id: <20200830191643.20717-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QF/EEKiH1jYu2o+Uh2Wsp4JMEB/C95C0reFKvdtz2Vowr3IAAX7
 Gu00M1vrVa9ufcIJpd2V067/9SyjzdmIC38g9WlV0VEwMkanP+9htirQgOLqfhc655gxLpK
 WPdmTRnG7gmGkjaDJFcE17ImPcIqCUjNtt9lIxQoBOrXaDhCWjbqWyfDvQoKxaXfflD3i/G
 i7LuPmjBFTh4YEiQGkh3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/1ZZhWYnAt8=:M2K+VDuDXVDi/eazSSJYCj
 yTfnFdji53Bkt93dqIO6m2lkBwNIepWq/eFMvSPZqUe6AISHPNQTXrQJihRznuXabGMCbbfb2
 jgi3cvEHagDdHAZ5oUnouF5JxKz4rq7riE8q4YdnLp0BwK2EBiWzbTNURd+GlksI2cViEjywD
 Fep50UCTg3FyNmAtF87HmpSvM8JO9mkWdEl4ihoMY6Cclhi56vPRpaOC8ubL+JDZKiBwdvC6N
 mPNKxXtgAwl/4M5hJCJQVKYwi3I9Or2CZBNBhp2pLZMha2PWtsEVIiOfZao1QxT2U+ZGHyR3N
 tECIia0ss4x2MFdeOPBlNv+vk2qasqepBMWaUwVrO9oO/AgxXQkn2nvfKasbJ/5ngmzCagGCd
 NGPgOdxpM0U1D/qs2P3TgtfMDx3JL74RDY0RmBxQS6rrpV96NcwOmshExMje63aRqwzQOnGDz
 DugmR5bb8yZzTfyzc0N8DOsfWZUHxBs5q3rG8hOfuscnUJ9vJqr5UVhcrvr5CNT5wQWkuLs3c
 hu9g2TpUMn8LoX1q95AK3Lll1KzK2RcfNkW/iMuGM1NoBk7kX6jC1jikS56OWkPS+ZqnTU2zU
 J/gx5PWgWf3j6ImHcahv5lZKRxnlUXhCHAChEMkfVpT90lrpgEES/9wCgfFyxXK3YcnWA7oz8
 b4ARzOxyvtywri/+jszgYrHUlETvD0sq00HF1NO0gB5yql6M6TG3YRKMHNuX2dkqXTCHOSuuW
 mnwkKGZ0J+NO5RJI1gs5CyWEA2BlpakGh6MVjpBDcVDNxOawL+bM0o6oAfuxoXvyjOyZV/k4e
 wl0WH+zx1N1YJDo40G29zYsqtLEogIQ5dpuxDkkO7rcktubGRWfGu8vWwUXbE1l619owys73F
 GWqNB34Y5q26PtZJWRGQ==
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
 23 files changed, 124 insertions(+), 124 deletions(-)

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
-- 
2.20.1

