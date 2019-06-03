Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1088F325E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 03:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfFCBFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jun 2019 21:05:07 -0400
Received: from onstation.org ([52.200.56.107]:57720 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbfFCBFG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jun 2019 21:05:06 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 2291B3E915;
        Mon,  3 Jun 2019 01:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559523906;
        bh=sdl01qJ2uFOVm96mhhb77dF76U7n3aLmtqmCIxvMuGg=;
        h=From:To:Cc:Subject:Date:From;
        b=q4ARI7oZzDH/xdYeYGt65b39aYt9kSD8yB9o8pg+0AcOVD/pb2SiHcs1F2Y0xbMbe
         EIxkS9G7djE+H8pljVmDB5+oHYQ1pc4LDSSFyU5AptIdTGTtMpW9xm+3nII9MbhZ0W
         L76/ZwhPTA7Z62mFSXn05PGefAusaqjWrvDhXTh4=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
        linus.walleij@linaro.org, frank.rowand@sony.com,
        miquel.raynal@bootlin.com, absahu@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 1/2] ARM: dts: qcom: msm8974-hammerhead: add touchscreen support
Date:   Sun,  2 Jun 2019 21:04:54 -0400
Message-Id: <20190603010455.17060-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add support for the Synaptics RMI4 touchscreen that is found on the
Nexus 5.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
This is to be applied on top of the display patch series:
https://lore.kernel.org/lkml/20190531094619.31704-1-masneyb@onstation.org/

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index c92ea01e3918..06c33bd71620 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -280,6 +280,16 @@
 			};
 		};
 
+		i2c2_pins: i2c2 {
+			mux {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
 		i2c3_pins: i2c3 {
 			mux {
 				pins = "gpio10", "gpio11";
@@ -326,6 +336,25 @@
 				bias-disable;
 			};
 		};
+
+		touch_pin: touch {
+			int {
+				pins = "gpio5";
+				function = "gpio";
+
+				drive-strength = <2>;
+				bias-disable;
+				input-enable;
+			};
+
+			reset {
+				pins = "gpio8";
+				function = "gpio";
+
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+		};
 	};
 
 	sdhci@f9824900 {
@@ -468,6 +497,41 @@
 		};
 	};
 
+	i2c@f9924000 {
+		status = "ok";
+
+		clock-frequency = <355000>;
+		qcom,src-freq = <50000000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c2_pins>;
+
+		synaptics@70 {
+			compatible = "syna,rmi4-i2c";
+			reg = <0x70>;
+
+			interrupts-extended = <&msmgpio 5 IRQ_TYPE_EDGE_FALLING>;
+			vdd-supply = <&pm8941_l22>;
+			vio-supply = <&pm8941_lvs3>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&touch_pin>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			rmi4-f01@1 {
+				reg = <0x1>;
+				syna,nosleep-mode = <1>;
+			};
+
+			rmi4-f12@12 {
+				reg = <0x12>;
+				syna,sensor-type = <1>;
+			};
+		};
+	};
+
 	i2c@f9925000 {
 		status = "ok";
 		pinctrl-names = "default";
-- 
2.20.1

