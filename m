Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB29225A85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgGTIyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:54:31 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:13485 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgGTIyb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235262;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=SScqp96204IM4S8wg6d+/yQTN2AiO57bxfDgaIdikWo=;
        b=k0xVGsXgZQa0Mk2bLK7/iYmS7rxZagzsj8WySVj8+Fm4MsGRJGtgVhBGGIOy4zU9wL
        LNRM7vN/hOAHSBu8xcOuGMbucPXvyTj+qOkQRCQqQFzFYBgnB9R4I9QVNvEZzt0rPHER
        6//D+yMi0vmRHxBGvI98O6aCrtZkeblLZ7quakscullcDwYiehiZhS2AFdxMRIhf9CDN
        EbPEQlvofG2hFBSmzLJsOwviGj/ewsvkhgGE3A8Ml05hRzD6ytn+BTBBgfWt3Lint2m5
        +E4nt2fsbezBPToQlTrIbJU3KvezfKI7T1zRylELJytWS+iag3SVXDUv+ISNsi5d33Wp
        CA7A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sKdgH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:20 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 05/10] arm64: dts: qcom: msm8916: Use labels in board device trees
Date:   Mon, 20 Jul 2020 10:54:01 +0200
Message-Id: <20200720085406.6716-6-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Device trees for newer SoCs avoid replicating the entire device
hierarchy in the board-specific device tree part. Instead,
they set additional properties only by referencing labels,
sorted alphabetically.

Now that we have labels for all relevant nodes, convert the MSM8916
board device trees to use the same style and remove the "soc" node
entirely.

Note: There is a large block of coresight nodes in apq8016-sbc.dtsi,
which are enabled by setting status = "okay". I kept them grouped
together (not alphabetically sorted with everything else),
since that would be just unnecessarily verbose and hard to see.

This commit only moves all existing properties to nodes that reference
the respective label. The resulting binary DTBs are exactly the same.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Sorry for the large diff! I hope the fact that the resulting binary DTBs
are exactly the same (same checksum) simplifies review a bit.
Would just need to check that the resulting style looks good. :)
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     | 800 +++++++++---------
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 107 ++-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi     |  14 +-
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 139 ++-
 4 files changed, 514 insertions(+), 546 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 47a4ebd86bee..89cc53ddf6b5 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -11,30 +11,6 @@
 #include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
 #include <dt-bindings/sound/apq8016-lpass.h>
 
-/*
- * GPIO name legend: proper name = the GPIO line is used as GPIO
- *         NC = not connected (pin out but not routed from the chip to
- *              anything the board)
- *         "[PER]" = pin is muxed for [peripheral] (not GPIO)
- *         LSEC = Low Speed External Connector
- *         HSEC = High Speed External Connector
- *
- * Line names are taken from the schematic "DragonBoard410c"
- * dated monday, august 31, 2015. Page 5 in particular.
- *
- * For the lines routed to the external connectors the
- * lines are named after the 96Boards CE Specification 1.0,
- * Appendix "Expansion Connector Signal Description".
- *
- * When the 96Board naming of a line and the schematic name of
- * the same line are in conflict, the 96Board specification
- * takes precedence, which means that the external UART on the
- * LSEC is named UART0 while the schematic and SoC names this
- * UART3. This is only for the informational lines i.e. "[FOO]",
- * the GPIO named lines "GPIO-A" thru "GPIO-L" are the only
- * ones actually used for GPIO.
- */
-
 / {
 	aliases {
 		serial0 = &blsp1_uart2;
@@ -76,7 +52,7 @@ camera_vddd_1v5: camera-vddd-1v5 {
 	};
 
 	reserved-memory {
-		ramoops@bff00000{
+		ramoops@bff00000 {
 			compatible = "ramoops";
 			reg = <0x0 0xbff00000 0x0 0x100000>;
 
@@ -86,392 +62,6 @@ ramoops@bff00000{
 		};
 	};
 
-	soc {
-		pinctrl@1000000 {
-			gpio-line-names =
-				"[UART0_TX]", /* GPIO_0, LSEC pin 5 */
-				"[UART0_RX]", /* GPIO_1, LSEC pin 7 */
-				"[UART0_CTS_N]", /* GPIO_2, LSEC pin 3 */
-				"[UART0_RTS_N]", /* GPIO_3, LSEC pin 9 */
-				"[UART1_TX]", /* GPIO_4, LSEC pin 11 */
-				"[UART1_RX]", /* GPIO_5, LSEC pin 13 */
-				"[I2C0_SDA]", /* GPIO_8, LSEC pin 17 */
-				"[I2C0_SCL]", /* GPIO_7, LSEC pin 15 */
-				"[SPI1_DOUT]", /* SPI1_MOSI, HSEC pin 1 */
-				"[SPI1_DIN]", /* SPI1_MISO, HSEC pin 11 */
-				"[SPI1_CS]", /* SPI1_CS_N, HSEC pin 7 */
-				"[SPI1_SCLK]", /* SPI1_CLK, HSEC pin 9 */
-				"GPIO-B", /* LS_EXP_GPIO_B, LSEC pin 24 */
-				"GPIO-C", /* LS_EXP_GPIO_C, LSEC pin 25 */
-				"[I2C3_SDA]", /* HSEC pin 38 */
-				"[I2C3_SCL]", /* HSEC pin 36 */
-				"[SPI0_MOSI]", /* LSEC pin 14 */
-				"[SPI0_MISO]", /* LSEC pin 10 */
-				"[SPI0_CS_N]", /* LSEC pin 12 */
-				"[SPI0_CLK]", /* LSEC pin 8 */
-				"HDMI_HPD_N", /* GPIO 20 */
-				"USR_LED_1_CTRL",
-				"[I2C1_SDA]", /* GPIO_22, LSEC pin 21 */
-				"[I2C1_SCL]", /* GPIO_23, LSEC pin 19 */
-				"GPIO-G", /* LS_EXP_GPIO_G, LSEC pin 29 */
-				"GPIO-H", /* LS_EXP_GPIO_H, LSEC pin 30 */
-				"[CSI0_MCLK]", /* HSEC pin 15 */
-				"[CSI1_MCLK]", /* HSEC pin 17 */
-				"GPIO-K", /* LS_EXP_GPIO_K, LSEC pin 33 */
-				"[I2C2_SDA]", /* HSEC pin 34 */
-				"[I2C2_SCL]", /* HSEC pin 32 */
-				"DSI2HDMI_INT_N",
-				"DSI_SW_SEL_APQ",
-				"GPIO-L", /* LS_EXP_GPIO_L, LSEC pin 34 */
-				"GPIO-J", /* LS_EXP_GPIO_J, LSEC pin 32 */
-				"GPIO-I", /* LS_EXP_GPIO_I, LSEC pin 31 */
-				"GPIO-A", /* LS_EXP_GPIO_A, LSEC pin 23 */
-				"FORCED_USB_BOOT",
-				"SD_CARD_DET_N",
-				"[WCSS_BT_SSBI]",
-				"[WCSS_WLAN_DATA_2]", /* GPIO 40 */
-				"[WCSS_WLAN_DATA_1]",
-				"[WCSS_WLAN_DATA_0]",
-				"[WCSS_WLAN_SET]",
-				"[WCSS_WLAN_CLK]",
-				"[WCSS_FM_SSBI]",
-				"[WCSS_FM_SDI]",
-				"[WCSS_BT_DAT_CTL]",
-				"[WCSS_BT_DAT_STB]",
-				"NC",
-				"NC", /* GPIO 50 */
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC", /* GPIO 60 */
-				"NC",
-				"NC",
-				"[CDC_PDM0_CLK]",
-				"[CDC_PDM0_SYNC]",
-				"[CDC_PDM0_TX0]",
-				"[CDC_PDM0_RX0]",
-				"[CDC_PDM0_RX1]",
-				"[CDC_PDM0_RX2]",
-				"GPIO-D", /* LS_EXP_GPIO_D, LSEC pin 26 */
-				"NC", /* GPIO 70 */
-				"NC",
-				"NC",
-				"NC",
-				"NC", /* GPIO 74 */
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"BOOT_CONFIG_0", /* GPIO 80 */
-				"BOOT_CONFIG_1",
-				"BOOT_CONFIG_2",
-				"BOOT_CONFIG_3",
-				"NC",
-				"NC",
-				"BOOT_CONFIG_5",
-				"NC",
-				"NC",
-				"NC",
-				"NC", /* GPIO 90 */
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC",
-				"NC", /* GPIO 100 */
-				"NC",
-				"NC",
-				"NC",
-				"SSBI_GPS",
-				"NC",
-				"NC",
-				"KEY_VOLP_N",
-				"NC",
-				"NC",
-				"[LS_EXP_MI2S_WS]", /* GPIO 110 */
-				"NC",
-				"NC",
-				"[LS_EXP_MI2S_SCK]",
-				"[LS_EXP_MI2S_DATA0]",
-				"GPIO-E", /* LS_EXP_GPIO_E, LSEC pin 27 */
-				"NC",
-				"[DSI2HDMI_MI2S_WS]",
-				"[DSI2HDMI_MI2S_SCK]",
-				"[DSI2HDMI_MI2S_DATA0]",
-				"USR_LED_2_CTRL", /* GPIO 120 */
-				"SB_HS_ID";
-		};
-
-		dma@7884000 {
-			status = "okay";
-		};
-
-		serial@78af000 {
-			label = "LS-UART0";
-			status = "okay";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart1_default>;
-			pinctrl-1 = <&blsp1_uart1_sleep>;
-		};
-
-		serial@78b0000 {
-			label = "LS-UART1";
-			status = "okay";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart2_default>;
-			pinctrl-1 = <&blsp1_uart2_sleep>;
-		};
-
-		i2c@78b6000 {
-		/* On Low speed expansion */
-			label = "LS-I2C0";
-			status = "okay";
-		};
-
-		i2c@78b8000 {
-		/* On High speed expansion */
-			label = "HS-I2C2";
-			status = "okay";
-
-			adv_bridge: bridge@39 {
-				status = "okay";
-
-				compatible = "adi,adv7533";
-				reg = <0x39>;
-
-				interrupt-parent = <&msmgpio>;
-				interrupts = <31 2>;
-
-				adi,dsi-lanes = <4>;
-				clocks = <&rpmcc RPM_SMD_BB_CLK2>;
-				clock-names = "cec";
-
-				pd-gpios = <&msmgpio 32 0>;
-
-				avdd-supply = <&pm8916_l6>;
-				v1p2-supply = <&pm8916_l6>;
-				v3p3-supply = <&pm8916_l17>;
-
-				pinctrl-names = "default","sleep";
-				pinctrl-0 = <&adv7533_int_active &adv7533_switch_active>;
-				pinctrl-1 = <&adv7533_int_suspend &adv7533_switch_suspend>;
-				#sound-dai-cells = <1>;
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-						adv7533_in: endpoint {
-							remote-endpoint = <&dsi0_out>;
-						};
-					};
-
-					port@1 {
-						reg = <1>;
-						adv7533_out: endpoint {
-							remote-endpoint = <&hdmi_con>;
-						};
-					};
-				};
-			};
-		};
-
-		i2c@78ba000 {
-		/* On Low speed expansion */
-			label = "LS-I2C1";
-			status = "okay";
-		};
-
-		spi@78b7000 {
-		/* On High speed expansion */
-			label = "HS-SPI1";
-			status = "okay";
-		};
-
-		spi@78b9000 {
-		/* On Low speed expansion */
-			label = "LS-SPI0";
-			status = "okay";
-		};
-
-		sdhci@7824000 {
-			vmmc-supply = <&pm8916_l8>;
-			vqmmc-supply = <&pm8916_l5>;
-
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
-			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
-			status = "okay";
-		};
-
-		sdhci@7864000 {
-			vmmc-supply = <&pm8916_l11>;
-			vqmmc-supply = <&pm8916_l12>;
-
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
-			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
-
-			cd-gpios = <&msmgpio 38 0x1>;
-			status = "okay";
-		};
-
-		usb@78d9000 {
-			extcon = <&usb_id>, <&usb_id>;
-			status = "okay";
-			adp-disable;
-			hnp-disable;
-			srp-disable;
-			pinctrl-names = "default", "device";
-			pinctrl-0 = <&usb_sw_sel_pm &usb_hub_reset_pm>;
-			pinctrl-1 = <&usb_sw_sel_pm_device &usb_hub_reset_pm_device>;
-			ulpi {
-				phy {
-					v1p8-supply = <&pm8916_l7>;
-					v3p3-supply = <&pm8916_l13>;
-					extcon = <&usb_id>;
-				};
-			};
-		};
-
-		lpass@7708000 {
-			status = "okay";
-		};
-
-		mdss@1a00000 {
-			dsi@1a98000 {
-				vdda-supply = <&pm8916_l2>;
-				vddio-supply = <&pm8916_l6>;
-
-				ports {
-					port@1 {
-						endpoint {
-							remote-endpoint = <&adv7533_in>;
-							data-lanes = <0 1 2 3>;
-						};
-					};
-				};
-			};
-
-			dsi-phy@1a98300 {
-				vddio-supply = <&pm8916_l6>;
-			};
-		};
-
-		/*
-		Internal Codec
-			playback - Primary MI2S
-			capture - Ter MI2S
-
-		External Primary:
-			playback - secondary MI2S
-			capture - Quat MI2S
-
-		External Secondary:
-			playback - Quat MI2S
-			capture - Quat MI2S
-
-		*/
-
-		sound: sound@7702000 {
-			status = "okay";
-			pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
-			pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
-			pinctrl-names = "default", "sleep";
-			qcom,model = "DB410c";
-			qcom,audio-routing =
-				"AMIC2", "MIC BIAS Internal2",
-				"AMIC3", "MIC BIAS External1";
-
-			external-dai-link@0 {
-				link-name = "ADV7533";
-				cpu {
-					sound-dai = <&lpass MI2S_QUATERNARY>;
-				};
-				codec {
-					sound-dai = <&adv_bridge 0>;
-				};
-			};
-
-			internal-codec-playback-dai-link@0 {
-				link-name = "WCD";
-				cpu {
-					sound-dai = <&lpass MI2S_PRIMARY>;
-				};
-				codec {
-					sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
-				};
-			};
-
-			internal-codec-capture-dai-link@0 {
-				link-name = "WCD-Capture";
-				cpu {
-					sound-dai = <&lpass MI2S_TERTIARY>;
-				};
-				codec {
-					sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
-				};
-			};
-		};
-
-		spmi@200f000 {
-			pm8916@0 {
-				gpios@c000 {
-					gpio-line-names =
-						"USR_LED_3_CTRL",
-						"USR_LED_4_CTRL",
-						"USB_HUB_RESET_N_PM",
-						"USB_SW_SEL_PM";
-				};
-				mpps@a000 {
-					gpio-line-names =
-						"VDD_PX_BIAS",
-						"WLAN_LED_CTRL",
-						"BT_LED_CTRL",
-						"GPIO-F"; /* LS_EXP_GPIO_F, LSEC pin 28 */
-				};
-			};
-		};
-
-		wcnss@a21b000 {
-			status = "okay";
-		};
-
-		tpiu@820000 { status = "okay"; };
-		funnel@821000 { status = "okay"; };
-		replicator@824000 { status = "okay"; };
-		etf@825000 { status = "okay"; };
-		etr@826000 { status = "okay"; };
-		funnel@841000 { status = "okay"; };
-		debug@850000 { status = "okay"; };
-		debug@852000 { status = "okay"; };
-		debug@854000 { status = "okay"; };
-		debug@856000 { status = "okay"; };
-		etm@85c000 { status = "okay"; };
-		etm@85d000 { status = "okay"; };
-		etm@85e000 { status = "okay"; };
-		etm@85f000 { status = "okay"; };
-		cti@810000 { status = "okay"; };
-		cti@811000 { status = "okay"; };
-		cti@858000 { status = "okay"; };
-		cti@859000 { status = "okay"; };
-		cti@85a000 { status = "okay"; };
-		cti@85b000 { status = "okay"; };
-	};
-
 	usb2513 {
 		compatible = "smsc,usb3503";
 		reset-gpios = <&pm8916_gpios 3 GPIO_ACTIVE_LOW>;
@@ -565,6 +155,102 @@ led@6 {
 	};
 };
 
+&blsp_dma {
+	status = "okay";
+};
+
+&blsp_i2c2 {
+	/* On Low speed expansion */
+	status = "okay";
+	label = "LS-I2C0";
+};
+
+&blsp_i2c4 {
+	/* On High speed expansion */
+	status = "okay";
+	label = "HS-I2C2";
+
+	adv_bridge: bridge@39 {
+		status = "okay";
+
+		compatible = "adi,adv7533";
+		reg = <0x39>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+
+		adi,dsi-lanes = <4>;
+		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
+		clock-names = "cec";
+
+		pd-gpios = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
+
+		avdd-supply = <&pm8916_l6>;
+		v1p2-supply = <&pm8916_l6>;
+		v3p3-supply = <&pm8916_l17>;
+
+		pinctrl-names = "default","sleep";
+		pinctrl-0 = <&adv7533_int_active &adv7533_switch_active>;
+		pinctrl-1 = <&adv7533_int_suspend &adv7533_switch_suspend>;
+		#sound-dai-cells = <1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7533_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7533_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&blsp_i2c6 {
+	/* On Low speed expansion */
+	status = "okay";
+	label = "LS-I2C1";
+};
+
+&blsp_spi3 {
+	/* On High speed expansion */
+	status = "okay";
+	label = "HS-SPI1";
+};
+
+&blsp_spi5 {
+	/* On Low speed expansion */
+	status = "okay";
+	label = "LS-SPI0";
+};
+
+&blsp1_uart1 {
+	status = "okay";
+	label = "LS-UART0";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp1_uart1_default>;
+	pinctrl-1 = <&blsp1_uart1_sleep>;
+};
+
+&blsp1_uart2 {
+	status = "okay";
+	label = "LS-UART1";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp1_uart2_default>;
+	pinctrl-1 = <&blsp1_uart2_sleep>;
+};
+
 &camss {
 	status = "ok";
 	ports {
@@ -615,6 +301,98 @@ ov5640_ep: endpoint {
 	};
 };
 
+&dsi0 {
+	vdda-supply = <&pm8916_l2>;
+	vddio-supply = <&pm8916_l6>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&adv7533_in>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dsi_phy0 {
+	vddio-supply = <&pm8916_l6>;
+};
+
+&lpass {
+	status = "okay";
+};
+
+&pronto {
+	status = "okay";
+};
+
+&sdhc_1 {
+	status = "okay";
+
+	vmmc-supply = <&pm8916_l8>;
+	vqmmc-supply = <&pm8916_l5>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
+	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	vmmc-supply = <&pm8916_l11>;
+	vqmmc-supply = <&pm8916_l12>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+
+	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+};
+
+&sound {
+	status = "okay";
+
+	pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
+	pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
+	pinctrl-names = "default", "sleep";
+	qcom,model = "DB410c";
+	qcom,audio-routing =
+		"AMIC2", "MIC BIAS Internal2",
+		"AMIC3", "MIC BIAS External1";
+
+	external-dai-link@0 {
+		link-name = "ADV7533";
+		cpu {
+			sound-dai = <&lpass MI2S_QUATERNARY>;
+		};
+		codec {
+			sound-dai = <&adv_bridge 0>;
+		};
+	};
+
+	internal-codec-playback-dai-link@0 {
+		link-name = "WCD";
+		cpu {
+			sound-dai = <&lpass MI2S_PRIMARY>;
+		};
+		codec {
+			sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+		};
+	};
+
+	internal-codec-capture-dai-link@0 {
+		link-name = "WCD-Capture";
+		cpu {
+			sound-dai = <&lpass MI2S_TERTIARY>;
+		};
+		codec {
+			sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
+		};
+	};
+};
+
 &spmi_bus {
 	pm8916_0: pm8916@0 {
 		pon@800 {
@@ -629,6 +407,24 @@ resin {
 	};
 };
 
+&usb {
+	status = "okay";
+	extcon = <&usb_id>, <&usb_id>;
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+
+	pinctrl-names = "default", "device";
+	pinctrl-0 = <&usb_sw_sel_pm &usb_hub_reset_pm>;
+	pinctrl-1 = <&usb_sw_sel_pm_device &usb_hub_reset_pm_device>;
+};
+
+&usb_hs_phy {
+	v1p8-supply = <&pm8916_l7>;
+	v3p3-supply = <&pm8916_l13>;
+	extcon = <&usb_id>;
+};
+
 &wcd_codec {
 	clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
 	clock-names = "mclk";
@@ -636,6 +432,28 @@ &wcd_codec {
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
 };
 
+/* Enable CoreSight */
+&cti0 { status = "okay"; };
+&cti1 { status = "okay"; };
+&cti12 { status = "okay"; };
+&cti13 { status = "okay"; };
+&cti14 { status = "okay"; };
+&cti15 { status = "okay"; };
+&debug0 { status = "okay"; };
+&debug1 { status = "okay"; };
+&debug2 { status = "okay"; };
+&debug3 { status = "okay"; };
+&etf { status = "okay"; };
+&etm0 { status = "okay"; };
+&etm1 { status = "okay"; };
+&etm2 { status = "okay"; };
+&etm3 { status = "okay"; };
+&etr { status = "okay"; };
+&funnel0 { status = "okay"; };
+&funnel1 { status = "okay"; };
+&replicator { status = "okay"; };
+&tpiu { status = "okay"; };
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
@@ -773,7 +591,155 @@ &i2c6_default {
 	drive-strength = <16>;
 };
 
+/*
+ * GPIO name legend: proper name = the GPIO line is used as GPIO
+ *         NC = not connected (pin out but not routed from the chip to
+ *              anything the board)
+ *         "[PER]" = pin is muxed for [peripheral] (not GPIO)
+ *         LSEC = Low Speed External Connector
+ *         HSEC = High Speed External Connector
+ *
+ * Line names are taken from the schematic "DragonBoard410c"
+ * dated monday, august 31, 2015. Page 5 in particular.
+ *
+ * For the lines routed to the external connectors the
+ * lines are named after the 96Boards CE Specification 1.0,
+ * Appendix "Expansion Connector Signal Description".
+ *
+ * When the 96Board naming of a line and the schematic name of
+ * the same line are in conflict, the 96Board specification
+ * takes precedence, which means that the external UART on the
+ * LSEC is named UART0 while the schematic and SoC names this
+ * UART3. This is only for the informational lines i.e. "[FOO]",
+ * the GPIO named lines "GPIO-A" thru "GPIO-L" are the only
+ * ones actually used for GPIO.
+ */
+
 &msmgpio {
+	gpio-line-names =
+		"[UART0_TX]", /* GPIO_0, LSEC pin 5 */
+		"[UART0_RX]", /* GPIO_1, LSEC pin 7 */
+		"[UART0_CTS_N]", /* GPIO_2, LSEC pin 3 */
+		"[UART0_RTS_N]", /* GPIO_3, LSEC pin 9 */
+		"[UART1_TX]", /* GPIO_4, LSEC pin 11 */
+		"[UART1_RX]", /* GPIO_5, LSEC pin 13 */
+		"[I2C0_SDA]", /* GPIO_8, LSEC pin 17 */
+		"[I2C0_SCL]", /* GPIO_7, LSEC pin 15 */
+		"[SPI1_DOUT]", /* SPI1_MOSI, HSEC pin 1 */
+		"[SPI1_DIN]", /* SPI1_MISO, HSEC pin 11 */
+		"[SPI1_CS]", /* SPI1_CS_N, HSEC pin 7 */
+		"[SPI1_SCLK]", /* SPI1_CLK, HSEC pin 9 */
+		"GPIO-B", /* LS_EXP_GPIO_B, LSEC pin 24 */
+		"GPIO-C", /* LS_EXP_GPIO_C, LSEC pin 25 */
+		"[I2C3_SDA]", /* HSEC pin 38 */
+		"[I2C3_SCL]", /* HSEC pin 36 */
+		"[SPI0_MOSI]", /* LSEC pin 14 */
+		"[SPI0_MISO]", /* LSEC pin 10 */
+		"[SPI0_CS_N]", /* LSEC pin 12 */
+		"[SPI0_CLK]", /* LSEC pin 8 */
+		"HDMI_HPD_N", /* GPIO 20 */
+		"USR_LED_1_CTRL",
+		"[I2C1_SDA]", /* GPIO_22, LSEC pin 21 */
+		"[I2C1_SCL]", /* GPIO_23, LSEC pin 19 */
+		"GPIO-G", /* LS_EXP_GPIO_G, LSEC pin 29 */
+		"GPIO-H", /* LS_EXP_GPIO_H, LSEC pin 30 */
+		"[CSI0_MCLK]", /* HSEC pin 15 */
+		"[CSI1_MCLK]", /* HSEC pin 17 */
+		"GPIO-K", /* LS_EXP_GPIO_K, LSEC pin 33 */
+		"[I2C2_SDA]", /* HSEC pin 34 */
+		"[I2C2_SCL]", /* HSEC pin 32 */
+		"DSI2HDMI_INT_N",
+		"DSI_SW_SEL_APQ",
+		"GPIO-L", /* LS_EXP_GPIO_L, LSEC pin 34 */
+		"GPIO-J", /* LS_EXP_GPIO_J, LSEC pin 32 */
+		"GPIO-I", /* LS_EXP_GPIO_I, LSEC pin 31 */
+		"GPIO-A", /* LS_EXP_GPIO_A, LSEC pin 23 */
+		"FORCED_USB_BOOT",
+		"SD_CARD_DET_N",
+		"[WCSS_BT_SSBI]",
+		"[WCSS_WLAN_DATA_2]", /* GPIO 40 */
+		"[WCSS_WLAN_DATA_1]",
+		"[WCSS_WLAN_DATA_0]",
+		"[WCSS_WLAN_SET]",
+		"[WCSS_WLAN_CLK]",
+		"[WCSS_FM_SSBI]",
+		"[WCSS_FM_SDI]",
+		"[WCSS_BT_DAT_CTL]",
+		"[WCSS_BT_DAT_STB]",
+		"NC",
+		"NC", /* GPIO 50 */
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC", /* GPIO 60 */
+		"NC",
+		"NC",
+		"[CDC_PDM0_CLK]",
+		"[CDC_PDM0_SYNC]",
+		"[CDC_PDM0_TX0]",
+		"[CDC_PDM0_RX0]",
+		"[CDC_PDM0_RX1]",
+		"[CDC_PDM0_RX2]",
+		"GPIO-D", /* LS_EXP_GPIO_D, LSEC pin 26 */
+		"NC", /* GPIO 70 */
+		"NC",
+		"NC",
+		"NC",
+		"NC", /* GPIO 74 */
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"BOOT_CONFIG_0", /* GPIO 80 */
+		"BOOT_CONFIG_1",
+		"BOOT_CONFIG_2",
+		"BOOT_CONFIG_3",
+		"NC",
+		"NC",
+		"BOOT_CONFIG_5",
+		"NC",
+		"NC",
+		"NC",
+		"NC", /* GPIO 90 */
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC", /* GPIO 100 */
+		"NC",
+		"NC",
+		"NC",
+		"SSBI_GPS",
+		"NC",
+		"NC",
+		"KEY_VOLP_N",
+		"NC",
+		"NC",
+		"[LS_EXP_MI2S_WS]", /* GPIO 110 */
+		"NC",
+		"NC",
+		"[LS_EXP_MI2S_SCK]",
+		"[LS_EXP_MI2S_DATA0]",
+		"GPIO-E", /* LS_EXP_GPIO_E, LSEC pin 27 */
+		"NC",
+		"[DSI2HDMI_MI2S_WS]",
+		"[DSI2HDMI_MI2S_SCK]",
+		"[DSI2HDMI_MI2S_DATA0]",
+		"USR_LED_2_CTRL", /* GPIO 120 */
+		"SB_HS_ID";
+
 	msmgpio_leds: msmgpio-leds {
 		pins = "gpio21", "gpio120";
 		function = "gpio";
@@ -833,6 +799,12 @@ msm_key_volp_n_default: msm-key-volp-n-default {
 };
 
 &pm8916_gpios {
+	gpio-line-names =
+		"USR_LED_3_CTRL",
+		"USR_LED_4_CTRL",
+		"USB_HUB_RESET_N_PM",
+		"USB_SW_SEL_PM";
+
 	usb_hub_reset_pm: usb-hub-reset-pm {
 		pins = "gpio3";
 		function = PMIC_GPIO_FUNC_NORMAL;
@@ -875,6 +847,12 @@ pm8916_gpios_leds: pm8916-gpios-leds {
 };
 
 &pm8916_mpps {
+	gpio-line-names =
+		"VDD_PX_BIAS",
+		"WLAN_LED_CTRL",
+		"BT_LED_CTRL",
+		"GPIO-F"; /* LS_EXP_GPIO_F, LSEC pin 28 */
+
 	pinctrl-names = "default";
 	pinctrl-0 = <&ls_exp_gpio_f>;
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 9f2c8e94fd26..68d89a8acbcf 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -29,61 +29,6 @@ wcnss_mem: wcnss@8b600000 {
 		};
 	};
 
-	soc {
-		sdhci@7824000 {
-			status = "okay";
-
-			vmmc-supply = <&pm8916_l8>;
-			vqmmc-supply = <&pm8916_l5>;
-
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
-			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
-		};
-
-		sdhci@7864000 {
-			status = "okay";
-
-			vmmc-supply = <&pm8916_l11>;
-			vqmmc-supply = <&pm8916_l12>;
-
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
-			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
-
-			non-removable;
-		};
-
-		serial@78b0000 {
-			status = "okay";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart2_default>;
-			pinctrl-1 = <&blsp1_uart2_sleep>;
-		};
-
-		usb@78d9000 {
-			status = "okay";
-			dr_mode = "peripheral";
-			extcon = <&usb_vbus>;
-
-			hnp-disable;
-			srp-disable;
-			adp-disable;
-
-			ulpi {
-				phy {
-					extcon = <&usb_vbus>;
-					v1p8-supply = <&pm8916_l7>;
-					v3p3-supply = <&pm8916_l13>;
-				};
-			};
-		};
-
-		wcnss@a21b000 {
-			status = "okay";
-		};
-	};
-
 	// FIXME: Use extcon device provided by charger driver when available
 	usb_vbus: usb-vbus {
 		compatible = "linux,extcon-usb-gpio";
@@ -108,6 +53,42 @@ volume-up {
 	};
 };
 
+&blsp1_uart2 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp1_uart2_default>;
+	pinctrl-1 = <&blsp1_uart2_sleep>;
+};
+
+&pronto {
+	status = "okay";
+};
+
+&sdhc_1 {
+	status = "okay";
+
+	vmmc-supply = <&pm8916_l8>;
+	vqmmc-supply = <&pm8916_l5>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
+	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	vmmc-supply = <&pm8916_l11>;
+	vqmmc-supply = <&pm8916_l12>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
+
+	non-removable;
+};
+
 &spmi_bus {
 	pm8916@0 {
 		pon@800 {
@@ -121,6 +102,22 @@ volume-down {
 	};
 };
 
+&usb {
+	status = "okay";
+	dr_mode = "peripheral";
+	extcon = <&usb_vbus>;
+
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+};
+
+&usb_hs_phy {
+	extcon = <&usb_vbus>;
+	v1p8-supply = <&pm8916_l7>;
+	v3p3-supply = <&pm8916_l13>;
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
index 0c6e81fb8c01..453e6acb5203 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
@@ -15,13 +15,11 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+};
 
-	soc {
-		serial@78b0000 {
-			status = "okay";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart2_default>;
-			pinctrl-1 = <&blsp1_uart2_sleep>;
-		};
-	};
+&blsp1_uart2 {
+	status = "okay";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp1_uart2_default>;
+	pinctrl-1 = <&blsp1_uart2_sleep>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index a0c00d9d62c4..89b1418eeeb4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -23,78 +23,6 @@ tz-apps@85500000 {
 		};
 	};
 
-	soc {
-		sdhci@7824000 {
-			status = "okay";
-
-			vmmc-supply = <&pm8916_l8>;
-			vqmmc-supply = <&pm8916_l5>;
-
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
-			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
-		};
-
-		sdhci@7864000 {
-			status = "okay";
-
-			vmmc-supply = <&pm8916_l11>;
-			vqmmc-supply = <&pm8916_l12>;
-
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
-			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
-
-			cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
-		};
-
-		serial@78b0000 {
-			status = "okay";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart2_default>;
-			pinctrl-1 = <&blsp1_uart2_sleep>;
-		};
-
-		usb@78d9000 {
-			status = "okay";
-			extcon = <&muic>, <&muic>;
-
-			hnp-disable;
-			srp-disable;
-			adp-disable;
-
-			ulpi {
-				phy {
-					extcon = <&muic>;
-					v1p8-supply = <&pm8916_l7>;
-					v3p3-supply = <&pm8916_l13>;
-				};
-			};
-		};
-
-		mdss@1a00000 {
-			dsi@1a98000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				vdda-supply = <&pm8916_l2>;
-				vddio-supply = <&pm8916_l6>;
-
-				pinctrl-names = "default", "sleep";
-				pinctrl-0 = <&mdss_default>;
-				pinctrl-1 = <&mdss_sleep>;
-			};
-
-			dsi-phy@1a98300 {
-				vddio-supply = <&pm8916_l6>;
-			};
-		};
-
-		wcnss@a21b000 {
-			status = "okay";
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -186,6 +114,58 @@ magnetometer@12 {
 	};
 };
 
+&blsp1_uart2 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp1_uart2_default>;
+	pinctrl-1 = <&blsp1_uart2_sleep>;
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	vdda-supply = <&pm8916_l2>;
+	vddio-supply = <&pm8916_l6>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&mdss_default>;
+	pinctrl-1 = <&mdss_sleep>;
+};
+
+&dsi_phy0 {
+	vddio-supply = <&pm8916_l6>;
+};
+
+&pronto {
+	status = "okay";
+};
+
+&sdhc_1 {
+	status = "okay";
+
+	vmmc-supply = <&pm8916_l8>;
+	vqmmc-supply = <&pm8916_l5>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
+	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	vmmc-supply = <&pm8916_l11>;
+	vqmmc-supply = <&pm8916_l12>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+
+	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+};
+
 &spmi_bus {
 	pm8916@0 {
 		pon@800 {
@@ -199,6 +179,21 @@ volume-down {
 	};
 };
 
+&usb {
+	status = "okay";
+	extcon = <&muic>, <&muic>;
+
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+};
+
+&usb_hs_phy {
+	extcon = <&muic>;
+	v1p8-supply = <&pm8916_l7>;
+	v3p3-supply = <&pm8916_l13>;
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
-- 
2.27.0

