Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75C6247A77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbgHQWdJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:33:09 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45861 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgHQWdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:33:07 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MWRmF-1k9J0Y3yAt-00XsAC; Tue, 18 Aug 2020 00:33:02 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: replace status value "ok" by "okay"
Date:   Tue, 18 Aug 2020 00:32:14 +0200
Message-Id: <20200817223214.62179-2-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200817223214.62179-1-freifunk@adrianschmutzler.de>
References: <20200817223214.62179-1-freifunk@adrianschmutzler.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zoxrT/AS+xFAdEvsEkmggdr8SpxJkFDX9IRE4iZaWkC2uh5GYm8
 jIO0BTrm8YpZbNP8ODNNfNFWfk5L0AC0ad/qekBxX41GLU1xiMJbZ5eYxlYeA0FTsvWSPSv
 SXEBROBrXamjYxr9f/9uIYWtxYsrDu7eOyckqgLUjMASGU0kFc5n4wXNXW01UQ/wXPGV8xW
 LTXDlDTRzT353v15EJPrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8ty343dMLBE=:eHlqmSK5SUsP0gojLc7dTs
 3t7/jDjbpJPx4E+M0UdaHImuCcmtQc6I3iOP09zXwVbAlX0ASKYqkAp1bbgrkkXWFcrXrPz7V
 TU5WBpprXk+g6jAMGLaEWr3CFfu86gZc9DJUplmZzfdeI2ksqSuKmwjd0qNxXmVtAw6BNDym6
 S71Y2VenXltqTcyEUd3epTmcRaquxoKs7isB0ANi/hZTDNreEeyFTvWtFRyyr1yx83PkKSkzz
 84kWBqPP/NPJPGhxibcdiK7moaE3XS0liKlo3EO8HsPjypz2qP8nNRz43bsAJdXsOw36TMirQ
 T60k6ugLo+xArU4AhJ4S7GbXx77d5O2K+oMk9GNZcuY8e2KN57+iCEwTved68kekDj4SOAGAc
 Vila2OZUTPdj241qUjIfMWLq+S70oKzQ4ib+wv8cc0nR3OJqf9WmK5sBg9eTB3WScAfokmeE1
 5ujF2kruC3+Q71EJ6lnjM+hgpVbViOHBo5ARgqHEpLn7v7k/jSjlz1aFx8KwedyR0ZDIbAfPR
 jB5iM+tqVVF+DgbXahoqeLJHME75MDZjeXpS3UBGiY62j6E0lySBhjE6oIS9dfY+CQuRbwXgc
 35sMvs/D2mT4JJzvwYdymQSCQOfqDRV3kHtkuf37fNz3Crynlnr8/K0rQp5APHSd/5aVRzEAN
 PeV330VqpRju8z/e6Ti6pG2t7IUeI9a+I5yoFc1xPskdfqxItSjiwA7MXg9Lu/1CzJF/3OfKv
 sitg6RmSbwKXLiiot9EGz0i/4e5Uw31+5aWjiXruILYDeyhjfm2jXbt1C9st5AMdYqKWjkLXp
 +VX0ewsYUf7hOGjyBfV97TUbwXuDxv4YcC1ROEaJubo2ITqvlQ5riUhzGc4rH2MduxdL+hYyZ
 tqHWSk8mHTsr8sbxnVxw==
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
 .../boot/dts/amd/amd-overdrive-rev-b0.dts     | 22 ++++++------
 .../boot/dts/amd/amd-overdrive-rev-b1.dts     | 24 ++++++-------
 arch/arm64/boot/dts/amd/amd-overdrive.dts     | 14 ++++----
 arch/arm64/boot/dts/amd/husky.dts             | 20 +++++------
 arch/arm64/boot/dts/apm/apm-merlin.dts        | 16 ++++-----
 arch/arm64/boot/dts/apm/apm-mustang.dts       | 16 ++++-----
 arch/arm64/boot/dts/apm/apm-storm.dtsi        | 12 +++----
 .../dts/broadcom/stingray/bcm958742-base.dtsi |  2 +-
 .../boot/dts/hisilicon/hi3660-hikey960.dts    |  6 ++--
 .../boot/dts/hisilicon/hi3670-hikey970.dts    |  2 +-
 .../arm64/boot/dts/hisilicon/hi6220-hikey.dts | 18 +++++-----
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |  2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts   |  6 ++--
 arch/arm64/boot/dts/hisilicon/hip06-d03.dts   | 18 +++++-----
 arch/arm64/boot/dts/hisilicon/hip07-d05.dts   | 20 +++++------
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |  4 +--
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts  |  6 ++--
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts     | 34 +++++++++----------
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts  |  2 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      | 12 +++----
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi  |  2 +-
 .../dts/rockchip/rk3368-orion-r68-meta.dts    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts   |  4 +--
 24 files changed, 133 insertions(+), 133 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
index 8e341be9a399..a77f19ac63cd 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
@@ -25,7 +25,7 @@
 };
 
 &ccp0 {
-	status = "ok";
+	status = "okay";
 	amd,zlib-support = <1>;
 };
 
@@ -33,39 +33,39 @@
  * NOTE: In Rev.B, gpio0 is reserved.
  */
 &gpio1 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio2 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio3 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio4 {
-	status = "ok";
+	status = "okay";
 };
 
 &i2c0 {
-	status = "ok";
+	status = "okay";
 };
 
 &i2c1 {
-	status = "ok";
+	status = "okay";
 };
 
 &pcie0 {
-	status = "ok";
+	status = "okay";
 };
 
 &spi0 {
-	status = "ok";
+	status = "okay";
 };
 
 &spi1 {
-	status = "ok";
+	status = "okay";
 	sdcard0: sdcard@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
@@ -80,7 +80,7 @@
 };
 
 &ipmi_kcs {
-	status = "ok";
+	status = "okay";
 };
 
 &smb0 {
diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
index 92cef05c6b74..09fc9c3ac60f 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
@@ -25,7 +25,7 @@
 };
 
 &ccp0 {
-	status = "ok";
+	status = "okay";
 	amd,zlib-support = <1>;
 };
 
@@ -33,43 +33,43 @@
  * NOTE: In Rev.B, gpio0 is reserved.
  */
 &gpio1 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio2 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio3 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio4 {
-	status = "ok";
+	status = "okay";
 };
 
 &i2c0 {
-	status = "ok";
+	status = "okay";
 };
 
 &i2c1 {
-	status = "ok";
+	status = "okay";
 };
 
 &pcie0 {
-	status = "ok";
+	status = "okay";
 };
 
 &sata1 {
-	status = "ok";
+	status = "okay";
 };
 
 &spi0 {
-	status = "ok";
+	status = "okay";
 };
 
 &spi1 {
-	status = "ok";
+	status = "okay";
 	sdcard0: sdcard@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
@@ -84,7 +84,7 @@
 };
 
 &ipmi_kcs {
-	status = "ok";
+	status = "okay";
 };
 
 &smb0 {
diff --git a/arch/arm64/boot/dts/amd/amd-overdrive.dts b/arch/arm64/boot/dts/amd/amd-overdrive.dts
index 41b3a6c0993d..56f27c71a15b 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive.dts
@@ -19,31 +19,31 @@
 };
 
 &ccp0 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio0 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio1 {
-	status = "ok";
+	status = "okay";
 };
 
 &i2c0 {
-	status = "ok";
+	status = "okay";
 };
 
 &pcie0 {
-	status = "ok";
+	status = "okay";
 };
 
 &spi0 {
-	status = "ok";
+	status = "okay";
 };
 
 &spi1 {
-	status = "ok";
+	status = "okay";
 	sdcard0: sdcard@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
diff --git a/arch/arm64/boot/dts/amd/husky.dts b/arch/arm64/boot/dts/amd/husky.dts
index 7acde34772cb..f68c95fe0e90 100644
--- a/arch/arm64/boot/dts/amd/husky.dts
+++ b/arch/arm64/boot/dts/amd/husky.dts
@@ -25,7 +25,7 @@
 };
 
 &ccp0 {
-	status = "ok";
+	status = "okay";
 	amd,zlib-support = <1>;
 };
 
@@ -33,39 +33,39 @@
  * NOTE: In Rev.B, gpio0 is reserved.
  */
 &gpio1 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio2 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio3 {
-	status = "ok";
+	status = "okay";
 };
 
 &gpio4 {
-	status = "ok";
+	status = "okay";
 };
 
 &i2c0 {
-	status = "ok";
+	status = "okay";
 };
 
 &i2c1 {
-	status = "ok";
+	status = "okay";
 };
 
 &pcie0 {
-	status = "ok";
+	status = "okay";
 };
 
 &spi0 {
-	status = "ok";
+	status = "okay";
 };
 
 &spi1 {
-	status = "ok";
+	status = "okay";
 	sdcard0: sdcard@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
diff --git a/arch/arm64/boot/dts/apm/apm-merlin.dts b/arch/arm64/boot/dts/apm/apm-merlin.dts
index 217d7728b63a..a538dd333f1a 100644
--- a/arch/arm64/boot/dts/apm/apm-merlin.dts
+++ b/arch/arm64/boot/dts/apm/apm-merlin.dts
@@ -45,38 +45,38 @@
 };
 
 &serial0 {
-	status = "ok";
+	status = "okay";
 };
 
 &sata1 {
-	status = "ok";
+	status = "okay";
 };
 
 &sata2 {
-	status = "ok";
+	status = "okay";
 };
 
 &sata3 {
-	status = "ok";
+	status = "okay";
 };
 
 &sgenet0 {
-	status = "ok";
+	status = "okay";
 };
 
 &xgenet1 {
-	status = "ok";
+	status = "okay";
 };
 
 &mmc0 {
-	status = "ok";
+	status = "okay";
 };
 
 &i2c4 {
 	rtc68: rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
-		status = "ok";
+		status = "okay";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/apm/apm-mustang.dts b/arch/arm64/boot/dts/apm/apm-mustang.dts
index e927811ade28..f8d0f9926a4d 100644
--- a/arch/arm64/boot/dts/apm/apm-mustang.dts
+++ b/arch/arm64/boot/dts/apm/apm-mustang.dts
@@ -45,36 +45,36 @@
 };
 
 &pcie0clk {
-	status = "ok";
+	status = "okay";
 };
 
 &pcie0 {
-	status = "ok";
+	status = "okay";
 };
 
 &serial0 {
-	status = "ok";
+	status = "okay";
 };
 
 &menet {
-	status = "ok";
+	status = "okay";
 };
 
 &sgenet0 {
-	status = "ok";
+	status = "okay";
 };
 
 &sgenet1 {
-	status = "ok";
+	status = "okay";
 };
 
 &xgenet {
-	status = "ok";
+	status = "okay";
 	rxlos-gpios = <&sbgpio 12 1>;
 };
 
 &mmc0 {
-	status = "ok";
+	status = "okay";
 };
 
 &mdio {
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 8c802d87e751..d8572f683367 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -270,7 +270,7 @@
 				reg = <0x0 0x1f22c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "sataphy2clk";
-				status = "ok";
+				status = "okay";
 				csr-offset = <0x4>;
 				csr-mask = <0x3a>;
 				enable-offset = <0x0>;
@@ -284,7 +284,7 @@
 				reg = <0x0 0x1f23c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "sataphy3clk";
-				status = "ok";
+				status = "okay";
 				csr-offset = <0x4>;
 				csr-mask = <0x3a>;
 				enable-offset = <0x0>;
@@ -864,7 +864,7 @@
 			reg = <0x0 0x1f22a000 0x0 0x100>;
 			#phy-cells = <1>;
 			clocks = <&sataphy2clk 0>;
-			status = "ok";
+			status = "okay";
 			apm,tx-boost-gain = <30 30 30 30 30 30>;
 			apm,tx-eye-tuning = <1 10 10 2 10 10>;
 		};
@@ -874,7 +874,7 @@
 			reg = <0x0 0x1f23a000 0x0 0x100>;
 			#phy-cells = <1>;
 			clocks = <&sataphy3clk 0>;
-			status = "ok";
+			status = "okay";
 			apm,tx-boost-gain = <31 31 31 31 31 31>;
 			apm,tx-eye-tuning = <2 10 10 2 10 10>;
 		};
@@ -903,7 +903,7 @@
 			      <0x0 0x1f227000 0x0 0x1000>;
 			interrupts = <0x0 0x87 0x4>;
 			dma-coherent;
-			status = "ok";
+			status = "okay";
 			clocks = <&sata23clk 0>;
 			phys = <&phy2 0>;
 			phy-names = "sata-phy";
@@ -917,7 +917,7 @@
 			      <0x0 0x1f23e000 0x0 0x1000>;
 			interrupts = <0x0 0x88 0x4>;
 			dma-coherent;
-			status = "ok";
+			status = "okay";
 			clocks = <&sata45clk 0>;
 			phys = <&phy3 0>;
 			phy-names = "sata-phy";
diff --git a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
index a9b92e52d50e..43aa5e9c0020 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
@@ -151,7 +151,7 @@
 };
 
 &nand {
-	status = "ok";
+	status = "okay";
 	nandcs@0 {
 		compatible = "brcm,nandcs";
 		reg = <0>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index c1b614dabb8e..963300eede17 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -530,7 +530,7 @@
 	rt1711h: rt1711h@4e {
 		compatible = "richtek,rt1711h";
 		reg = <0x4e>;
-		status = "ok";
+		status = "okay";
 		interrupt-parent = <&gpio27>;
 		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
@@ -570,7 +570,7 @@
 	};
 
 	adv7533: adv7533@39 {
-		status = "ok";
+		status = "okay";
 		compatible = "adi,adv7533";
 		reg = <0x39>;
 		adi,dsi-lanes = <4>;
@@ -656,7 +656,7 @@
 		     &sdio_cfg_func>;
 	/* WL_EN */
 	vmmc-supply = <&wlan_en>;
-	status = "ok";
+	status = "okay";
 
 	wlcore: wlcore@2 {
 		compatible = "ti,wl1837";
diff --git a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
index 7dac33d4fd5c..7f9f9886c349 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
@@ -418,7 +418,7 @@
 		     &sdio_cfg_func>;
 	/* WL_EN */
 	vmmc-supply = <&wlan_en>;
-	status = "ok";
+	status = "okay";
 
 	wlcore: wlcore@2 {
 		compatible = "ti,wl1837";
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 533ed523888d..91d08673c02e 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -267,7 +267,7 @@
 &uart1 {
 	assigned-clocks = <&sys_ctrl HI6220_UART1_SRC>;
 	assigned-clock-rates = <150000000>;
-	status = "ok";
+	status = "okay";
 
 	bluetooth {
 		compatible = "ti,wl1835-st";
@@ -278,21 +278,21 @@
 };
 
 &uart2 {
-	status = "ok";
+	status = "okay";
 	label = "LS-UART0";
 };
 
 &uart3 {
-	status = "ok";
+	status = "okay";
 	label = "LS-UART1";
 };
 
 &ade {
-	status = "ok";
+	status = "okay";
 };
 
 &dsi {
-	status = "ok";
+	status = "okay";
 
 	ports {
 		/* 1 for output port */
@@ -489,17 +489,17 @@
 
 
 &i2c0 {
-	status = "ok";
+	status = "okay";
 };
 
 &i2c1 {
-	status = "ok";
+	status = "okay";
 };
 
 &i2c2 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-	status = "ok";
+	status = "okay";
 
 	adv7533: adv7533@39 {
 		compatible = "adi,adv7533";
@@ -541,5 +541,5 @@
 };
 
 &spi0 {
-	status = "ok";
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 3d189d9f0d24..3bab4bc6ff99 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -371,7 +371,7 @@
 			clocks = <&sys_ctrl HI6220_EDMAC_ACLK>;
 			dma-no-cci;
 			dma-type = "hi6220_dma";
-			status = "ok";
+			status = "okay";
 		};
 
 		dual_timer0: timer@f8008000 {
diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
index e93c65ede06c..369b69b17b91 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
@@ -42,15 +42,15 @@
 };
 
 &uart0 {
-	status = "ok";
+	status = "okay";
 };
 
 &peri_gpio0 {
-	status = "ok";
+	status = "okay";
 };
 
 &lbc {
-	status = "ok";
+	status = "okay";
 	#address-cells = <2>;
 	#size-cells = <1>;
 	ranges = <0 0 0x0 0x90000000 0x08000000>,
diff --git a/arch/arm64/boot/dts/hisilicon/hip06-d03.dts b/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
index 677862beebef..9f4a930e734d 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
@@ -22,37 +22,37 @@
 };
 
 &ipmi0 {
-	status = "ok";
+	status = "okay";
 };
 
 &uart0 {
-	status = "ok";
+	status = "okay";
 };
 
 &eth0 {
-	status = "ok";
+	status = "okay";
 };
 
 &eth1 {
-	status = "ok";
+	status = "okay";
 };
 
 &eth2 {
-	status = "ok";
+	status = "okay";
 };
 
 &eth3 {
-	status = "ok";
+	status = "okay";
 };
 
 &sas1 {
-	status = "ok";
+	status = "okay";
 };
 
 &usb_ohci {
-	status = "ok";
+	status = "okay";
 };
 
 &usb_ehci {
-	status = "ok";
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/hisilicon/hip07-d05.dts b/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
index fcbdffe0868b..81a2312c8a26 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
@@ -50,41 +50,41 @@
 };
 
 &uart0 {
-	status = "ok";
+	status = "okay";
 };
 
 &ipmi0 {
-	status = "ok";
+	status = "okay";
 };
 
 &usb_ohci {
-	status = "ok";
+	status = "okay";
 };
 
 &usb_ehci {
-	status = "ok";
+	status = "okay";
 };
 
 &eth0 {
-	status = "ok";
+	status = "okay";
 };
 
 &eth1 {
-	status = "ok";
+	status = "okay";
 };
 
 &eth2 {
-	status = "ok";
+	status = "okay";
 };
 
 &eth3 {
-	status = "ok";
+	status = "okay";
 };
 
 &sas1 {
-	status = "ok";
+	status = "okay";
 };
 
 &p0_pcie2_a {
-	status = "ok";
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 194343510dcb..8665d3464e9b 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -585,7 +585,7 @@
 };
 
 &camss {
-	status = "ok";
+	status = "okay";
 	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -602,7 +602,7 @@
 };
 
 &cci {
-	status = "ok";
+	status = "okay";
 };
 
 &cci_i2c0 {
diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index b31117a93995..e8eaa958c199 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -26,18 +26,18 @@
 &blsp1_uart3 {
 	pinctrl-0 = <&serial_3_pins>;
 	pinctrl-names = "default";
-	status = "ok";
+	status = "okay";
 };
 
 &i2c_1 {
 	pinctrl-0 = <&i2c_1_pins>;
 	pinctrl-names = "default";
-	status = "ok";
+	status = "okay";
 };
 
 &spi_0 {
 	cs-select = <0>;
-	status = "ok";
+	status = "okay";
 
 	m25p80@0 {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index f4a76162ab5f..e8c37a1693d3 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -27,11 +27,11 @@
 };
 
 &blsp1_i2c2 {
-	status = "ok";
+	status = "okay";
 };
 
 &blsp1_spi1 {
-	status = "ok";
+	status = "okay";
 
 	m25p80@0 {
 		#address-cells = <1>;
@@ -43,37 +43,37 @@
 };
 
 &blsp1_uart3 {
-	status = "ok";
+	status = "okay";
 };
 
 &blsp1_uart5 {
-	status = "ok";
+	status = "okay";
 };
 
 &pcie0 {
-	status = "ok";
+	status = "okay";
 	perst-gpio = <&tlmm 61 0x1>;
 };
 
 &pcie1 {
-	status = "ok";
+	status = "okay";
 	perst-gpio = <&tlmm 58 0x1>;
 };
 
 &pcie_phy0 {
-	status = "ok";
+	status = "okay";
 };
 
 &pcie_phy1 {
-	status = "ok";
+	status = "okay";
 };
 
 &qpic_bam {
-	status = "ok";
+	status = "okay";
 };
 
 &qpic_nand {
-	status = "ok";
+	status = "okay";
 
 	nand@0 {
 		reg = <0>;
@@ -84,29 +84,29 @@
 };
 
 &sdhc_1 {
-	status = "ok";
+	status = "okay";
 };
 
 &qusb_phy_0 {
-	status = "ok";
+	status = "okay";
 };
 
 &qusb_phy_1 {
-	status = "ok";
+	status = "okay";
 };
 
 &ssphy_0 {
-	status = "ok";
+	status = "okay";
 };
 
 &ssphy_1 {
-	status = "ok";
+	status = "okay";
 };
 
 &usb_0 {
-	status = "ok";
+	status = "okay";
 };
 
 &usb_1 {
-	status = "ok";
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
index 479ad3ac6c28..08d5d51221cf 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
@@ -13,7 +13,7 @@
 };
 
 &ethernet {
-	status = "ok";
+	status = "okay";
 
 	snps,reset-gpio = <&tlmm 60 GPIO_ACTIVE_LOW>;
 	snps,reset-active-low;
diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 6422cf9d5855..a80c578484ba 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -97,7 +97,7 @@
 };
 
 &pcie {
-	status = "ok";
+	status = "okay";
 
 	perst-gpio = <&tlmm 43 GPIO_ACTIVE_LOW>;
 
@@ -106,22 +106,22 @@
 };
 
 &pcie_phy {
-	status = "ok";
+	status = "okay";
 
 	vdda-vp-supply = <&vreg_l3_1p05>;
 	vdda-vph-supply = <&vreg_l5_1p8>;
 };
 
 &remoteproc_adsp {
-	status = "ok";
+	status = "okay";
 };
 
 &remoteproc_cdsp {
-	status = "ok";
+	status = "okay";
 };
 
 &remoteproc_wcss {
-	status = "ok";
+	status = "okay";
 };
 
 &rpm_requests {
@@ -215,7 +215,7 @@
 };
 
 &sdcc1 {
-	status = "ok";
+	status = "okay";
 
 	supports-cqe;
 	mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a2a98680ccf5..8443451ac8cd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1103,7 +1103,7 @@
 };
 
 &cci {
-	status = "ok";
+	status = "okay";
 };
 
 &cci_i2c0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi b/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
index 1c52f47c43a6..87fabc64cc39 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
@@ -134,7 +134,7 @@
 	pinctrl-0 = <&rmii_pins>;
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
-	status = "ok";
+	status = "okay";
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
index b058ce999e3b..ecce16ecc9c3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
@@ -183,7 +183,7 @@
 	snps,reset-delays-us = <0 10000 1000000>;
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
-	status = "ok";
+	status = "okay";
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
index 236ab0f1b206..2582fa4b90e2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
@@ -167,7 +167,7 @@
 	pinctrl-0 = <&rmii_pins>;
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
-	status = "ok";
+	status = "okay";
 };
 
 &i2c0 {
@@ -198,7 +198,7 @@
 };
 
 &io_domains {
-	status = "ok";
+	status = "okay";
 
 	audio-supply = <&vcc_io>;
 	gpio30-supply = <&vcc_io>;
-- 
2.20.1

