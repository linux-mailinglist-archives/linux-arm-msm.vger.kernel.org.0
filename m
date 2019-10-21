Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B244DE3A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 07:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfJUFOE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 01:14:04 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:36753 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbfJUFNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 01:13:36 -0400
Received: by mail-pf1-f169.google.com with SMTP id y22so7648939pfr.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 22:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kvDc0uUJGCnwA7GY5pu/Q7fyT9GvLtGHqVn8OAGcFSk=;
        b=IpXSAZrQi1U3dCdd41bFl+3B7klyHdmWOyXilVE4HuEnE1TXuL/fq7AH/0inBdnojJ
         bAg7C6XUkCrUDQrVv7kiu8Bw2JcFo/9k9FFw6maqEUnI2FRYPTUv+CBsbmR4rpm7Liih
         z/5GLdipmIw62xvBLpB5swKyaUJwwVY6rV7pQCYZDa1Wf5vdV2b52iNA3sdbJQ9W0khG
         Idu+ice0gtO4l4hT7mXmEac6kIvRRuziTIp24GreKrxeGfMy38EHf/1deTtgCDS5opMX
         eQjVRKHmI/x2aigpkDLsLXW/rSpbpYW4EyUXCa1XzbDZG3d3NaTM6LTi/4l+luc9IxWb
         K4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kvDc0uUJGCnwA7GY5pu/Q7fyT9GvLtGHqVn8OAGcFSk=;
        b=HhamZ8a3ZLwQugSdjJ7Ri4KYsHqhw7CotkvKfTESjFziOjqmWra9O/1s1hHMJyK3oP
         0FYn27eXRa2iS2yNmy5kEVsqNgMazuq+sq1KPvjRCBXvJeyaXpcJ3vskaKnUbqcWS5XV
         Q3QnjSwmmKqVOZtbF0gq/rZlghTbJgU5PcK4ekSGYnY86HvHD2A3bZv3KqlJK+Dnbdfh
         I/sBNDd96yeK7bMiiRVbeixeK5yqRV9jnTXKloihlXtBTNoYulsK9deot11sN1X0PtPV
         ILJkNJCwWw4r/1LN306s23hikXiwDSfp7LDMTQC9zEkA3nULiAcmLdRB4vJEr9EPsFxZ
         Nqog==
X-Gm-Message-State: APjAAAV+CCDhjZxyYZ87zsegxt2jOlInv1KojqTa272lqwIzlXzW+Sla
        TN+RfOCgEUyPxazo1b8FIt0fU7DxgQE=
X-Google-Smtp-Source: APXvYqznjcTk2jL0uxR4wwA5KVwXIFEUzOmzXjaYGmsqAFMBCB07xswg9znLYx7szIle5xdnW4WOsg==
X-Received: by 2002:a63:5848:: with SMTP id i8mr17607043pgm.217.1571634814081;
        Sun, 20 Oct 2019 22:13:34 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h68sm15716862pfb.149.2019.10.20.22.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 22:13:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] arm64: dts: qcom: db820c: Sort all nodes
Date:   Sun, 20 Oct 2019 22:13:17 -0700
Message-Id: <20191021051322.297560-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021051322.297560-1-bjorn.andersson@linaro.org>
References: <20191021051322.297560-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sort all nodes in db820c.dtsi based on address, then name.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 336 +++++++++----------
 1 file changed, 168 insertions(+), 168 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index aed34a461b19..99990a139938 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -124,6 +124,18 @@
 	};
 };
 
+&blsp1_i2c2 {
+	/* On Low speed expansion */
+	label = "LS-I2C0";
+	status = "okay";
+};
+
+&blsp1_spi0 {
+	/* On Low speed expansion */
+	label = "LS-SPI0";
+	status = "okay";
+};
+
 &blsp1_uart1 {
 	label = "BT-UART";
 	status = "okay";
@@ -141,6 +153,24 @@
 	};
 };
 
+&blsp2_i2c0 {
+	/* On High speed expansion */
+	label = "HS-I2C2";
+	status = "okay";
+};
+
+&blsp2_i2c1 {
+	/* On Low speed expansion */
+	label = "LS-I2C1";
+	status = "okay";
+};
+
+&blsp2_spi5 {
+	/* On High speed expansion */
+	label = "HS-SPI1";
+	status = "okay";
+};
+
 &blsp2_uart1 {
 	label = "LS-UART1";
 	status = "okay";
@@ -157,75 +187,49 @@
 	pinctrl-1 = <&blsp2_uart2_4pins_sleep>;
 };
 
-&blsp1_i2c2 {
-	/* On Low speed expansion */
-	label = "LS-I2C0";
-	status = "okay";
+&camss {
+	vdda-supply = <&pm8994_l2>;
 };
 
-&blsp2_i2c1 {
-	/* On Low speed expansion */
-	label = "LS-I2C1";
+&hdmi {
 	status = "okay";
-};
 
-&blsp1_spi0 {
-	/* On Low speed expansion */
-	label = "LS-SPI0";
-	status = "okay";
-};
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
+	pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
 
-&blsp2_i2c0 {
-	/* On High speed expansion */
-	label = "HS-I2C2";
-	status = "okay";
+	core-vdda-supply = <&pm8994_l12>;
+	core-vcc-supply = <&pm8994_s4>;
 };
 
-&blsp2_spi5 {
-	/* On High speed expansion */
-	label = "HS-SPI1";
+&hdmi_phy {
 	status = "okay";
-};
 
-&camss {
-	vdda-supply = <&pm8994_l2>;
+	vddio-supply = <&pm8994_l12>;
+	vcca-supply = <&pm8994_l28>;
+	#phy-cells = <0>;
 };
 
-&sdhc2 {
-	/* External SD card */
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
-	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
-	cd-gpios = <&msmgpio 38 0x1>;
-	vmmc-supply = <&pm8994_l21>;
-	vqmmc-supply = <&pm8994_l13>;
+&hsusb_phy1 {
 	status = "okay";
+
+	vdda-pll-supply = <&pm8994_l12>;
+	vdda-phy-dpdm-supply = <&pm8994_l24>;
 };
 
-&ufsphy {
+&hsusb_phy2 {
 	status = "okay";
 
-	vdda-phy-supply = <&pm8994_l28>;
 	vdda-pll-supply = <&pm8994_l12>;
-
-	vdda-phy-max-microamp = <18380>;
-	vdda-pll-max-microamp = <9440>;
-
-	vddp-ref-clk-supply = <&pm8994_l25>;
-	vddp-ref-clk-max-microamp = <100>;
-	vddp-ref-clk-always-on;
+	vdda-phy-dpdm-supply = <&pm8994_l24>;
 };
 
-&ufshc {
+&mdp {
 	status = "okay";
+};
 
-	vcc-supply = <&pm8994_l20>;
-	vccq-supply = <&pm8994_l25>;
-	vccq2-supply = <&pm8994_s4>;
-
-	vcc-max-microamp = <600000>;
-	vccq-max-microamp = <450000>;
-	vccq2-max-microamp = <450000>;
+&mdss {
+	status = "okay";
 };
 
 &msmgpio {
@@ -382,6 +386,32 @@
 		"NC"; /* GPIO_149 */
 };
 
+&pcie0 {
+	status = "okay";
+	perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+	vddpe-3v3-supply = <&wlan_en>;
+	vdda-supply = <&pm8994_l28>;
+};
+
+&pcie1 {
+	status = "okay";
+	perst-gpio = <&msmgpio 130 GPIO_ACTIVE_LOW>;
+	vdda-supply = <&pm8994_l28>;
+};
+
+&pcie2 {
+	status = "okay";
+	perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
+	vdda-supply = <&pm8994_l28>;
+};
+
+&pcie_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&pm8994_l28>;
+	vdda-pll-supply = <&pm8994_l12>;
+};
+
 &pm8994_gpios {
 	gpio-line-names =
 		"NC",
@@ -434,114 +464,6 @@
 		"NC";
 };
 
-&pcie_phy {
-	status = "okay";
-
-	vdda-phy-supply = <&pm8994_l28>;
-	vdda-pll-supply = <&pm8994_l12>;
-};
-
-&usb3phy {
-	status = "okay";
-
-	vdda-phy-supply = <&pm8994_l28>;
-	vdda-pll-supply = <&pm8994_l12>;
-
-};
-
-&hsusb_phy1 {
-	status = "okay";
-
-	vdda-pll-supply = <&pm8994_l12>;
-	vdda-phy-dpdm-supply = <&pm8994_l24>;
-};
-
-&hsusb_phy2 {
-	status = "okay";
-
-	vdda-pll-supply = <&pm8994_l12>;
-	vdda-phy-dpdm-supply = <&pm8994_l24>;
-};
-
-&usb3 {
-	status = "okay";
-	extcon = <&usb3_id>;
-
-	dwc3@6a00000 {
-		extcon = <&usb3_id>;
-		dr_mode = "otg";
-	};
-};
-
-&usb2 {
-	status = "okay";
-	extcon = <&usb2_id>;
-
-	dwc3@7600000 {
-		extcon = <&usb2_id>;
-		dr_mode = "otg";
-		maximum-speed = "high-speed";
-	};
-};
-
-&pcie0 {
-	status = "okay";
-	perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
-	vddpe-3v3-supply = <&wlan_en>;
-	vdda-supply = <&pm8994_l28>;
-};
-
-&pcie1 {
-	status = "okay";
-	perst-gpio = <&msmgpio 130 GPIO_ACTIVE_LOW>;
-	vdda-supply = <&pm8994_l28>;
-};
-
-&pcie2 {
-	status = "okay";
-	perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
-	vdda-supply = <&pm8994_l28>;
-};
-
-&wcd9335 {
-	clock-names = "mclk", "slimbus";
-	clocks = <&div1_mclk>,
-		 <&rpmcc RPM_SMD_BB_CLK1>;
-
-	vdd-buck-supply = <&pm8994_s4>;
-	vdd-buck-sido-supply = <&pm8994_s4>;
-	vdd-tx-supply = <&pm8994_s4>;
-	vdd-rx-supply = <&pm8994_s4>;
-	vdd-io-supply = <&pm8994_s4>;
-};
-
-&mdss {
-	status = "okay";
-};
-
-&mdp {
-	status = "okay";
-};
-
-&hdmi_phy {
-	status = "okay";
-
-	vddio-supply = <&pm8994_l12>;
-	vcca-supply = <&pm8994_l28>;
-	#phy-cells = <0>;
-};
-
-&hdmi {
-	status = "okay";
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
-	pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
-
-	core-vdda-supply = <&pm8994_l12>;
-	core-vcc-supply = <&pm8994_s4>;
-};
-
 &rpm_requests {
 	pm8994-regulators {
 		compatible = "qcom,rpm-pm8994-regulators";
@@ -698,18 +620,15 @@
 	};
 };
 
-&spmi_bus {
-	pmic@0 {
-		pon@800 {
-			resin {
-				compatible = "qcom,pm8941-resin";
-				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-				debounce = <15625>;
-				bias-pull-up;
-				linux,code = <KEY_VOLUMEDOWN>;
-			};
-		};
-	};
+&sdhc2 {
+	/* External SD card */
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+	cd-gpios = <&msmgpio 38 0x1>;
+	vmmc-supply = <&pm8994_l21>;
+	vqmmc-supply = <&pm8994_l13>;
+	status = "okay";
 };
 
 &sound {
@@ -783,3 +702,84 @@
 		};
 	};
 };
+
+&spmi_bus {
+	pmic@0 {
+		pon@800 {
+			resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_VOLUMEDOWN>;
+			};
+		};
+	};
+};
+
+&ufsphy {
+	status = "okay";
+
+	vdda-phy-supply = <&pm8994_l28>;
+	vdda-pll-supply = <&pm8994_l12>;
+
+	vdda-phy-max-microamp = <18380>;
+	vdda-pll-max-microamp = <9440>;
+
+	vddp-ref-clk-supply = <&pm8994_l25>;
+	vddp-ref-clk-max-microamp = <100>;
+	vddp-ref-clk-always-on;
+};
+
+&ufshc {
+	status = "okay";
+
+	vcc-supply = <&pm8994_l20>;
+	vccq-supply = <&pm8994_l25>;
+	vccq2-supply = <&pm8994_s4>;
+
+	vcc-max-microamp = <600000>;
+	vccq-max-microamp = <450000>;
+	vccq2-max-microamp = <450000>;
+};
+
+&usb2 {
+	status = "okay";
+	extcon = <&usb2_id>;
+
+	dwc3@7600000 {
+		extcon = <&usb2_id>;
+		dr_mode = "otg";
+		maximum-speed = "high-speed";
+	};
+};
+
+&usb3 {
+	status = "okay";
+	extcon = <&usb3_id>;
+
+	dwc3@6a00000 {
+		extcon = <&usb3_id>;
+		dr_mode = "otg";
+	};
+};
+
+&usb3phy {
+	status = "okay";
+
+	vdda-phy-supply = <&pm8994_l28>;
+	vdda-pll-supply = <&pm8994_l12>;
+
+};
+
+&wcd9335 {
+	clock-names = "mclk", "slimbus";
+	clocks = <&div1_mclk>,
+		 <&rpmcc RPM_SMD_BB_CLK1>;
+
+	vdd-buck-supply = <&pm8994_s4>;
+	vdd-buck-sido-supply = <&pm8994_s4>;
+	vdd-tx-supply = <&pm8994_s4>;
+	vdd-rx-supply = <&pm8994_s4>;
+	vdd-io-supply = <&pm8994_s4>;
+};
-- 
2.23.0

