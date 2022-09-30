Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3635F1204
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbiI3SxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232454AbiI3SxA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:53:00 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D72F1664BC
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:55 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b24so5719346ljk.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jrts8SArb2L0T/Qvk02DOv2eN6AIQ1KP08ybqYsrYRw=;
        b=YAjNXdUDjvTMOaZnvKZsUIa8Z83yTzUj1vUEbO5kNOCB0xYndllm6MaevdldZCStR7
         gG2ayyZKsLMnSZ1RouD9ESiencMNUo0xoDd3VodmrBiP2W9eRbMKFe85ypBpX0nRooa/
         IwObYo5VRdpAqFADPPvMVg8zFNUnDnzxQwNqwaVS6QLM0HtSeoRUYv67Y1M7x+k2xhNx
         iV7QpLRsq1CGrTuFs+6JDLrB5aZ5Y5hl+MN/DYYS0dLIq7MSRDkpROfBqr/NtlNOFvSl
         r+vq+dtW9q+0vm8fo9Qzw1hkYGnq5hVrKeQXlE3EidZFUD/TGV60vMnvBgti4GzmLfuV
         dxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jrts8SArb2L0T/Qvk02DOv2eN6AIQ1KP08ybqYsrYRw=;
        b=ADQvbq0wv+UV4HDDmWwWIeKc5XS26Zql7rMWEWmHx91mrybkuyO7AmmQvSmKsCV6vs
         LAgBzVQpDpzYey12/hNdI+tYYbFxN6gIL7BO5OgPCe7W+JDax0NBwVSscxpYaq5OBL49
         VKse/ggRFWn8rRrmXxv2vX7RKmCo5zHy+pYXRiUdd9wDAufpe8UTjIjzzSK777XlpDUD
         RVx8FQOVVC2AysZMLrYzkwvuH/5M6+7BertSNYOAYAs3rPgaq8K7MCkF5YdZlJNkfDaO
         ElVdHqfPt/GUL+EJsiMMcMexZ/uuNe9aOeeXt3xzE1ffj0uM0sSQxcDvnltohSPo4bcd
         heFA==
X-Gm-Message-State: ACrzQf3pAjzg9Mv5n6dkuxxn3KvEnle764CtT+I3m1f+o2nL+Q5w00b1
        OA9hdinatu8Rchtm5VWdH2nS5w==
X-Google-Smtp-Source: AMsMyM40lncExQd3g2FxoQJRC6aGk+TZvkU0K5VtfhRvkcvCoASDU0HnTSM+zuXJ8EoZew9gy2QtXQ==
X-Received: by 2002:a2e:910c:0:b0:26d:b452:44ed with SMTP id m12-20020a2e910c000000b0026db45244edmr2986901ljg.188.1664563972741;
        Fri, 30 Sep 2022 11:52:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 21/23] ARM: dts: qcom: apq8060-dragonboard: use labels to patch device tree
Date:   Fri, 30 Sep 2022 21:52:34 +0300
Message-Id: <20220930185236.867655-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use labels to add device-specific properties to DT nodes rather than
duplicating SoC DT structure in the device DT.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8060-dragonboard.dts | 1774 ++++++++---------
 arch/arm/boot/dts/qcom-msm8660.dtsi           |   51 +-
 2 files changed, 911 insertions(+), 914 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index dd409ff31e21..0baf202a82ba 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -81,927 +81,923 @@ cm3605 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&dragon_cm3605_gpios>, <&dragon_cm3605_mpps>;
 	};
+};
 
-	soc {
-		pinctrl@800000 {
-			/* eMMC pins, all 8 data lines connected */
-			dragon_sdcc1_pins: sdcc1 {
-				mux {
-					pins = "gpio159", "gpio160", "gpio161",
-					     "gpio162", "gpio163", "gpio164",
-					     "gpio165", "gpio166", "gpio167",
-					     "gpio168";
-					     function = "sdc1";
-				};
-				clk {
-					pins = "gpio167"; /* SDC1 CLK */
-					drive-strength = <16>;
-					bias-disable;
-				};
-				cmd {
-					pins = "gpio168"; /* SDC1 CMD */
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-				data {
-					/* SDC1 D0 to D7 */
-					pins = "gpio159", "gpio160", "gpio161", "gpio162",
-					     "gpio163", "gpio164", "gpio165", "gpio166";
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-			};
+&ebi2 {
+	/* The EBI2 will instantiate first, then populate its children */
+	pinctrl-names = "default";
+	pinctrl-0 = <&dragon_ebi2_pins>;
+	status = "okay";
 
-			/*
-			 * The SDCC3 pins are hardcoded (non-muxable) but need some pin
-			 * configuration.
-			 */
-			dragon_sdcc3_pins: sdcc3 {
-				clk {
-					pins = "sdc3_clk";
-					drive-strength = <8>;
-					bias-disable;
-				};
-				cmd {
-					pins = "sdc3_cmd";
-					drive-strength = <8>;
-					bias-pull-up;
-				};
-				data {
-					pins = "sdc3_data";
-					drive-strength = <8>;
-					bias-pull-up;
-				};
-			};
+	/*
+	 * An on-board SMSC LAN9221 chip for "debug ethernet",
+	 * which is actually just an ordinary ethernet on the
+	 * EBI2. This has a 25MHz chrystal next to it, so no
+	 * clocking is needed.
+	 */
+	ethernet@2,0 {
+		compatible = "smsc,lan9221", "smsc,lan9115";
+		reg = <2 0x0 0x100>;
+		/*
+		 * The second interrupt is the PME interrupt
+		 * for network wakeup, connected to the TLMM.
+		 */
+		interrupts-extended = <&pm8058_gpio 7 IRQ_TYPE_EDGE_FALLING>,
+				    <&tlmm 29 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
+		vdd33a-supply = <&dragon_veth>;
+		vddvario-supply = <&dragon_vario>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dragon_ethernet_gpios>;
+		phy-mode = "mii";
+		reg-io-width = <2>;
+		smsc,force-external-phy;
+		smsc,irq-push-pull;
+
+		/*
+		 * SLOW chipselect config
+		 * Delay 9 cycles (140ns@64MHz) between SMSC
+		 * LAN9221 Ethernet controller reads and writes
+		 * on CS2.
+		 */
+		qcom,xmem-recovery-cycles = <0>;
+		qcom,xmem-write-hold-cycles = <3>;
+		qcom,xmem-write-delta-cycles = <31>;
+		qcom,xmem-read-delta-cycles = <28>;
+		qcom,xmem-write-wait-cycles = <9>;
+		qcom,xmem-read-wait-cycles = <9>;
+	};
+};
 
-			/* Second SD card slot pins */
-			dragon_sdcc5_pins: sdcc5 {
-				mux {
-					pins = "gpio95", "gpio96", "gpio97",
-					    "gpio98", "gpio99", "gpio100";
-					function = "sdc5";
-				};
-				clk {
-					pins = "gpio97"; /* SDC5 CLK */
-					drive-strength = <16>;
-					bias-disable;
-				};
-				cmd {
-					pins = "gpio95"; /* SDC5 CMD */
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-				data {
-					/* SDC5 D0 to D3 */
-					pins = "gpio96", "gpio98", "gpio99", "gpio100";
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-			};
+&gsbi3 {
+	qcom,mode = <GSBI_PROT_I2C>;
+	status = "okay";
+};
 
-			dragon_gsbi3_i2c_pins: gsbi3_i2c {
-				mux {
-					pins = "gpio43", "gpio44";
-					function = "gsbi3";
-				};
-				pinconf {
-					pins = "gpio43", "gpio44";
-					drive-strength = <8>;
-					/* These have external pull-up 2.2kOhm to 1.8V */
-					bias-disable;
-				};
-			};
+&gsbi3_i2c {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dragon_gsbi3_i2c_pins>;
+	status = "okay";
+
+	touchscreen@24 {
+		compatible = "cypress,cy8ctma340";
+		reg = <0x24>;
+		/* Certainly we can do at least 400 kHz */
+		clock-frequency = <400000>;
+		/* IRQ on GPIO61 called /CTP_INT */
+		interrupt-parent = <&tlmm>;
+		interrupts = <61 IRQ_TYPE_EDGE_FALLING>;
+		/*
+		 * The I2C bus is using a PCA9306 level translator from L16A
+		 * to L2B so these two voltages are needed and L16A is
+		 * kind of the IO voltage, however L16Aisn't really fed to
+		 * the TMA340, which relies entirely on L2B (PM8901 L2).
+		 */
+		vcpin-supply = <&pm8058_l16>;
+		vdd-supply = <&pm8901_l2>;
+		/* GPIO58, called WAKE_CTP */
+		reset-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <800>;
+		active-interval-ms = <0>;
+		touch-timeout-ms = <255>;
+		lowpower-interval-ms = <10>;
+		bootloader-key = /bits/ 8 <0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dragon_tma340_gpios>;
+	};
+};
 
-			dragon_gsbi8_i2c_pins: gsbi8_i2c {
-				mux {
-					pins = "gpio64", "gpio65";
-					function = "gsbi8";
-				};
-				pinconf {
-					pins = "gpio64", "gpio65";
-					drive-strength = <16>;
-					/* These have external pull-up 2.2kOhm to 1.8V */
-					bias-disable;
-				};
-			};
+&gsbi8 {
+	qcom,mode = <GSBI_PROT_I2C>;
+	status = "okay";
+};
 
-			dragon_gsbi12_i2c_pins: gsbi12_i2c {
-				mux {
-					pins = "gpio115", "gpio116";
-					function = "gsbi12";
-				};
-				pinconf {
-					pins = "gpio115", "gpio116";
-					drive-strength = <16>;
-					/* These have external pull-up 4.7kOhm to 1.8V */
-					bias-disable;
-				};
-			};
+&gsbi8_i2c {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dragon_gsbi8_i2c_pins>;
+	status = "okay";
+
+	eeprom@52 {
+		/* A 16KiB Platform ID EEPROM on the CPU carrier board */
+		compatible = "atmel,24c128";
+		reg = <0x52>;
+		vcc-supply = <&pm8058_s3>;
+		pagesize = <64>;
+	};
+	wm8903: wm8903@1a {
+		/* This Woolfson Micro device has an unrouted interrupt line */
+		compatible = "wlf,wm8903";
+		reg = <0x1a>;
+
+		AVDD-supply = <&pm8058_l16>;
+		CPVDD-supply = <&pm8058_l16>;
+		DBVDD-supply = <&pm8058_s3>;
+		DCVDD-supply = <&pm8058_l0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		micdet-cfg = <0>;
+		micdet-delay = <100>;
+		gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
+	};
+};
 
-			/* Primary serial port uart 0 pins */
-			dragon_gsbi12_serial_pins: gsbi12_serial {
-				mux {
-					pins = "gpio117", "gpio118";
-					function = "gsbi12";
-				};
-				tx {
-					pins = "gpio117";
-					drive-strength = <8>;
-					bias-disable;
-				};
-				rx {
-					pins = "gpio118";
-					drive-strength = <2>;
-					bias-pull-up;
-				};
-			};
+&gsbi12 {
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+	status = "okay";
+};
 
-			dragon_ebi2_pins: ebi2 {
-				/*
-				 * Pins used by EBI2 on the Dragonboard, actually only
-				 * CS2 is used by a real peripheral. CS0 is just
-				 * routed to a test point.
-				 */
-				mux0 {
-					pins =
-					    /* "gpio39", CS1A_N this is not good to mux */
-					    "gpio40", /* CS2A_N */
-					    "gpio134"; /* CS0_N testpoint TP29 */
-					function = "ebi2cs";
-				};
-				mux1 {
-					pins =
-					    /* EBI2_ADDR_7 downto EBI2_ADDR_0 address bus */
-					    "gpio123", "gpio124", "gpio125", "gpio126",
-					    "gpio127", "gpio128", "gpio129", "gpio130",
-					    /* EBI2_DATA_15 downto EBI2_DATA_0 data bus */
-					    "gpio135", "gpio136", "gpio137", "gpio138",
-					    "gpio139", "gpio140", "gpio141", "gpio142",
-					    "gpio143", "gpio144", "gpio145", "gpio146",
-					    "gpio147", "gpio148", "gpio149", "gpio150",
-					    "gpio151", /* EBI2_OE_N */
-					    "gpio153", /* EBI2_ADV */
-					    "gpio157"; /* EBI2_WE_N */
-					function = "ebi2";
-				};
-			};
+&gsbi12_serial {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dragon_gsbi12_serial_pins>;
+	status = "okay";
+};
 
-			/* Interrupt line for the KXSD9 accelerometer */
-			dragon_kxsd9_gpios: kxsd9 {
-				irq {
-					pins = "gpio57"; /* IRQ line */
-					bias-pull-up;
-				};
-			};
+&gsbi12_i2c {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dragon_gsbi12_i2c_pins>;
+	status = "okay";
+
+	ak8975@c {
+		compatible = "asahi-kasei,ak8975";
+		reg = <0x0c>;
+		interrupt-parent = <&pm8058_gpio>;
+		interrupts = <33 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dragon_ak8975_gpios>;
+		vid-supply = <&pm8058_lvs0>; // 1.8V
+		vdd-supply = <&pm8058_l14>; // 2.85V
+	};
+	bmp085@77 {
+		compatible = "bosch,bmp085";
+		reg = <0x77>;
+		interrupt-parent = <&pm8058_gpio>;
+		interrupts = <16 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 86 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dragon_bmp085_gpios>;
+		vddd-supply = <&pm8058_lvs0>; // 1.8V
+		vdda-supply = <&pm8058_l14>; // 2.85V
+	};
+	mpu3050@68 {
+		compatible = "invensense,mpu3050";
+		reg = <0x68>;
+		/*
+		 * GPIO17 is pulled high by a 10k
+		 * resistor to VLOGIC so needs to be
+		 * active low/falling edge.
+		 */
+		interrupts-extended = <&pm8058_gpio 17 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dragon_mpu3050_gpios>;
+		vlogic-supply = <&pm8058_lvs0>; // 1.8V
+		vdd-supply = <&pm8058_l14>; // 2.85V
 
-			dragon_tma340_gpios: tma340 {
-				reset {
-					/* RESET line, TS_ATTN, WAKE_CTP */
-					pins = "gpio58";
-					function = "gpio";
-					drive-strength = <6>;
-					bias-disable;
-				};
-				irq {
-					pins = "gpio61"; /* IRQ line */
-					function = "gpio";
-					drive-strength = <2>;
-					bias-pull-up;
-				};
+		/*
+		 * The MPU-3050 acts as a hub for the
+		 * accelerometer.
+		 */
+		i2c-gate {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			kxsd9@18 {
+				compatible = "kionix,kxsd9";
+				reg = <0x18>;
+				interrupt-parent = <&tlmm>;
+				interrupts = <57 IRQ_TYPE_EDGE_FALLING>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&dragon_kxsd9_gpios>;
+				iovdd-supply = <&pm8058_lvs0>; // 1.8V
+				vdd-supply = <&pm8058_l14>; // 2.85V
 			};
 		};
+	};
+};
 
-		qcom,ssbi@500000 {
-			pmic@0 {
-				keypad@148 {
-					linux,keymap = <
-					MATRIX_KEY(0, 0, KEY_MENU)
-					MATRIX_KEY(0, 2, KEY_1)
-					MATRIX_KEY(0, 3, KEY_4)
-					MATRIX_KEY(0, 4, KEY_7)
-					MATRIX_KEY(1, 0, KEY_UP)
-					MATRIX_KEY(1, 1, KEY_LEFT)
-					MATRIX_KEY(1, 2, KEY_DOWN)
-					MATRIX_KEY(1, 3, KEY_5)
-					MATRIX_KEY(1, 3, KEY_8)
-					MATRIX_KEY(2, 0, KEY_HOME)
-					MATRIX_KEY(2, 1, KEY_REPLY)
-					MATRIX_KEY(2, 2, KEY_2)
-					MATRIX_KEY(2, 3, KEY_6)
-					MATRIX_KEY(3, 0, KEY_VOLUMEUP)
-					MATRIX_KEY(3, 1, KEY_RIGHT)
-					MATRIX_KEY(3, 2, KEY_3)
-					MATRIX_KEY(3, 3, KEY_9)
-					MATRIX_KEY(3, 4, KEY_SWITCHVIDEOMODE)
-					MATRIX_KEY(4, 0, KEY_VOLUMEDOWN)
-					MATRIX_KEY(4, 1, KEY_BACK)
-					MATRIX_KEY(4, 2, KEY_CAMERA)
-					MATRIX_KEY(4, 3, KEY_KBDILLUMTOGGLE)
-					>;
-					keypad,num-rows = <6>;
-					keypad,num-columns = <5>;
-				};
-
-				gpio@150 {
-					dragon_ethernet_gpios: ethernet-state {
-						pinconf {
-							pins = "gpio7";
-							function = "normal";
-							input-enable;
-							bias-disable;
-							power-source = <PM8058_GPIO_S3>;
-						};
-					};
-					dragon_bmp085_gpios: bmp085-state {
-						pinconf {
-							pins = "gpio16";
-							function = "normal";
-							input-enable;
-							bias-disable;
-							power-source = <PM8058_GPIO_S3>;
-						};
-					};
-					dragon_mpu3050_gpios: mpu3050-state {
-						pinconf {
-							pins = "gpio17";
-							function = "normal";
-							input-enable;
-							bias-disable;
-							power-source = <PM8058_GPIO_S3>;
-						};
-					};
-					dragon_sdcc3_gpios: sdcc3-state {
-						pinconf {
-							pins = "gpio22";
-							function = "normal";
-							input-enable;
-							bias-disable;
-							power-source = <PM8058_GPIO_S3>;
-						};
-					};
-					dragon_sdcc5_gpios: sdcc5-state {
-						pinconf {
-							pins = "gpio26";
-							function = "normal";
-							input-enable;
-							bias-pull-up;
-							qcom,pull-up-strength = <PMIC_GPIO_PULL_UP_30>;
-							power-source = <PM8058_GPIO_S3>;
-						};
-					};
-					dragon_ak8975_gpios: ak8975-state {
-						pinconf {
-							pins = "gpio33";
-							function = "normal";
-							input-enable;
-							bias-disable;
-							power-source = <PM8058_GPIO_S3>;
-						};
-					};
-					dragon_cm3605_gpios: cm3605-state {
-						/* Pin 34 connected to the proxy IRQ */
-						gpio34-pins {
-							pins = "gpio34";
-							function = "normal";
-							input-enable;
-							bias-disable;
-							power-source = <PM8058_GPIO_S3>;
-						};
-						/* Pin 35 connected to ASET */
-						gpio35-pins {
-							pins = "gpio35";
-							function = "normal";
-							output-high;
-							bias-disable;
-							power-source = <PM8058_GPIO_S3>;
-						};
-					};
-					dragon_veth_gpios: veth-state {
-						pinconf {
-							pins = "gpio40";
-							function = "normal";
-							bias-disable;
-							drive-push-pull;
-						};
-					};
-				};
-
-				mpps@50 {
-					dragon_cm3605_mpps: cm3605-mpps-state {
-						mpp5 {
-							pins = "mpp5";
-							function = "analog";
-							input-enable;
-							bias-high-impedance;
-							/* Let's use channel 5 */
-							qcom,amux-route = <PMIC_MPP_AMUX_ROUTE_CH5>;
-							power-source = <PM8058_GPIO_S3>;
-						};
-					};
-				};
-
-				xoadc@197 {
-					/* Reference voltage 2.2 V */
-					xoadc-ref-supply = <&pm8058_l18>;
-
-					/* Board-specific channels */
-					mpp5@5 {
-						/* Connected to AOUT of ALS sensor */
-						reg = <0x00 0x05>;
-					};
-					mpp6@6 {
-						/* Connected to test point TP43 */
-						reg = <0x00 0x06>;
-					};
-					mpp7@7 {
-						/* Connected to battery thermistor */
-						reg = <0x00 0x07>;
-					};
-					mpp8@8 {
-						/* Connected to battery ID detector */
-						reg = <0x00 0x08>;
-					};
-					mpp9@9 {
-						/* Connected to XO thermistor */
-						reg = <0x00 0x09>;
-					};
-				};
-
-				led@48 {
-					/*
-					 * The keypad LED @0x48 is routed to
-					 * the sensor board where it is
-					 * connected to an infrared LED
-					 * SFH4650 (60mW, @850nm) next to the
-					 * ambient light and proximity sensor
-					 * Capella Microsystems CM3605.
-					 */
-					label = "pm8058:infrared:proximitysensor";
-					default-state = "off";
-					linux,default-trigger = "cm3605";
-					status = "okay";
-				};
-				led@131 {
-					label = "pm8058:red";
-					color = <LED_COLOR_ID_RED>;
-					default-state = "off";
-					status = "okay";
-				};
-				led@132 {
-					/*
-					 * This is actually green too on my
-					 * board, but documented as yellow.
-					 */
-					label = "pm8058:yellow";
-					color = <LED_COLOR_ID_YELLOW>;
-					default-state = "off";
-					linux,default-trigger = "mmc0";
-					status = "okay";
-				};
-				led@133 {
-					label = "pm8058:green";
-					function = LED_FUNCTION_HEARTBEAT;
-					color = <LED_COLOR_ID_GREEN>;
-					default-state = "on";
-					linux,default-trigger = "heartbeat";
-					status = "okay";
-				};
-			};
+&pm8058_gpio {
+	dragon_ethernet_gpios: ethernet-state {
+		pinconf {
+			pins = "gpio7";
+			function = "normal";
+			input-enable;
+			bias-disable;
+			power-source = <PM8058_GPIO_S3>;
+		};
+	};
+	dragon_bmp085_gpios: bmp085-state {
+		pinconf {
+			pins = "gpio16";
+			function = "normal";
+			input-enable;
+			bias-disable;
+			power-source = <PM8058_GPIO_S3>;
+		};
+	};
+	dragon_mpu3050_gpios: mpu3050-state {
+		pinconf {
+			pins = "gpio17";
+			function = "normal";
+			input-enable;
+			bias-disable;
+			power-source = <PM8058_GPIO_S3>;
 		};
+	};
+	dragon_sdcc3_gpios: sdcc3-state {
+		pinconf {
+			pins = "gpio22";
+			function = "normal";
+			input-enable;
+			bias-disable;
+			power-source = <PM8058_GPIO_S3>;
+		};
+	};
+	dragon_sdcc5_gpios: sdcc5-state {
+		pinconf {
+			pins = "gpio26";
+			function = "normal";
+			input-enable;
+			bias-pull-up;
+			qcom,pull-up-strength = <PMIC_GPIO_PULL_UP_30>;
+			power-source = <PM8058_GPIO_S3>;
+		};
+	};
+	dragon_ak8975_gpios: ak8975-state {
+		pinconf {
+			pins = "gpio33";
+			function = "normal";
+			input-enable;
+			bias-disable;
+			power-source = <PM8058_GPIO_S3>;
+		};
+	};
+	dragon_cm3605_gpios: cm3605-state {
+		/* Pin 34 connected to the proxy IRQ */
+		gpio34-pins {
+			pins = "gpio34";
+			function = "normal";
+			input-enable;
+			bias-disable;
+			power-source = <PM8058_GPIO_S3>;
+		};
+		/* Pin 35 connected to ASET */
+		gpio35-pins {
+			pins = "gpio35";
+			function = "normal";
+			output-high;
+			bias-disable;
+			power-source = <PM8058_GPIO_S3>;
+		};
+	};
+	dragon_veth_gpios: veth-state {
+		pinconf {
+			pins = "gpio40";
+			function = "normal";
+			bias-disable;
+			drive-push-pull;
+		};
+	};
+};
 
-		gsbi@16200000 {
-			qcom,mode = <GSBI_PROT_I2C>;
-			status = "okay";
+&pm8058_keypad {
+	linux,keymap = <
+		MATRIX_KEY(0, 0, KEY_MENU)
+		MATRIX_KEY(0, 2, KEY_1)
+		MATRIX_KEY(0, 3, KEY_4)
+		MATRIX_KEY(0, 4, KEY_7)
+		MATRIX_KEY(1, 0, KEY_UP)
+		MATRIX_KEY(1, 1, KEY_LEFT)
+		MATRIX_KEY(1, 2, KEY_DOWN)
+		MATRIX_KEY(1, 3, KEY_5)
+		MATRIX_KEY(1, 3, KEY_8)
+		MATRIX_KEY(2, 0, KEY_HOME)
+		MATRIX_KEY(2, 1, KEY_REPLY)
+		MATRIX_KEY(2, 2, KEY_2)
+		MATRIX_KEY(2, 3, KEY_6)
+		MATRIX_KEY(3, 0, KEY_VOLUMEUP)
+		MATRIX_KEY(3, 1, KEY_RIGHT)
+		MATRIX_KEY(3, 2, KEY_3)
+		MATRIX_KEY(3, 3, KEY_9)
+		MATRIX_KEY(3, 4, KEY_SWITCHVIDEOMODE)
+		MATRIX_KEY(4, 0, KEY_VOLUMEDOWN)
+		MATRIX_KEY(4, 1, KEY_BACK)
+		MATRIX_KEY(4, 2, KEY_CAMERA)
+		MATRIX_KEY(4, 3, KEY_KBDILLUMTOGGLE)
+	>;
+	keypad,num-rows = <6>;
+	keypad,num-columns = <5>;
+};
 
-			gsbi3_i2c: i2c@16280000 {
-				pinctrl-names = "default";
-				pinctrl-0 = <&dragon_gsbi3_i2c_pins>;
-				status = "okay";
-
-				touchscreen@24 {
-					compatible = "cypress,cy8ctma340";
-					reg = <0x24>;
-					/* Certainly we can do at least 400 kHz */
-					clock-frequency = <400000>;
-					/* IRQ on GPIO61 called /CTP_INT */
-					interrupt-parent = <&tlmm>;
-					interrupts = <61 IRQ_TYPE_EDGE_FALLING>;
-					/*
-					 * The I2C bus is using a PCA9306 level translator from L16A
-					 * to L2B so these two voltages are needed and L16A is
-					 * kind of the IO voltage, however L16Aisn't really fed to
-					 * the TMA340, which relies entirely on L2B (PM8901 L2).
-					 */
-					vcpin-supply = <&pm8058_l16>;
-					vdd-supply = <&pm8901_l2>;
-					/* GPIO58, called WAKE_CTP */
-					reset-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
-					touchscreen-size-x = <480>;
-					touchscreen-size-y = <800>;
-					active-interval-ms = <0>;
-					touch-timeout-ms = <255>;
-					lowpower-interval-ms = <10>;
-					bootloader-key = /bits/ 8 <0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&dragon_tma340_gpios>;
-				};
-			};
+&pm8058_led48 {
+	/*
+	 * The keypad LED @0x48 is routed to
+	 * the sensor board where it is
+	 * connected to an infrared LED
+	 * SFH4650 (60mW, @850nm) next to the
+	 * ambient light and proximity sensor
+	 * Capella Microsystems CM3605.
+	 */
+	label = "pm8058:infrared:proximitysensor";
+	default-state = "off";
+	linux,default-trigger = "cm3605";
+	status = "okay";
+};
+
+&pm8058_led131 {
+	label = "pm8058:red";
+	color = <LED_COLOR_ID_RED>;
+	default-state = "off";
+	status = "okay";
+};
+
+&pm8058_led132 {
+	/*
+	 * This is actually green too on my
+	 * board, but documented as yellow.
+	 */
+	label = "pm8058:yellow";
+	color = <LED_COLOR_ID_YELLOW>;
+	default-state = "off";
+	linux,default-trigger = "mmc0";
+	status = "okay";
+};
+
+&pm8058_led133 {
+	label = "pm8058:green";
+	function = LED_FUNCTION_HEARTBEAT;
+	color = <LED_COLOR_ID_GREEN>;
+	default-state = "on";
+	linux,default-trigger = "heartbeat";
+	status = "okay";
+};
+
+&pm8058_mpps {
+	dragon_cm3605_mpps: cm3605-mpps-state {
+		mpp5 {
+			pins = "mpp5";
+			function = "analog";
+			input-enable;
+			bias-high-impedance;
+			/* Let's use channel 5 */
+			qcom,amux-route = <PMIC_MPP_AMUX_ROUTE_CH5>;
+			power-source = <PM8058_GPIO_S3>;
 		};
+	};
+};
 
-		gsbi@19800000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C>;
+&rpm {
+	/*
+	 * Set up of the PMIC RPM regulators for this board
+	 * PM8901 supplies "preliminary regulators" whatever
+	 * that means
+	 */
+	pm8901-regulators {
+		vdd_l0-supply = <&pm8901_s4>;
+		vdd_l1-supply = <&vph>;
+		vdd_l2-supply = <&vph>;
+		vdd_l3-supply = <&vph>;
+		vdd_l4-supply = <&vph>;
+		vdd_l5-supply = <&vph>;
+		vdd_l6-supply = <&vph>;
+		/* vdd_s0-supply, vdd_s1-supply: SAW regulators */
+		vdd_s2-supply = <&vph>;
+		vdd_s3-supply = <&vph>;
+		vdd_s4-supply = <&vph>;
+		lvs0_in-supply = <&pm8058_s3>;
+		lvs1_in-supply = <&pm8901_s4>;
+		lvs2_in-supply = <&pm8058_l0>;
+		lvs3_in-supply = <&pm8058_s2>;
+		mvs_in-supply = <&pm8058_s3>;
+
+		l0 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+		l1 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			bias-pull-down;
+		};
+		l2 {
+			/* TMA340 requires strictly 3.3V */
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			bias-pull-down;
+		};
+		l3 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			bias-pull-down;
+		};
+		l4 {
+			regulator-min-microvolt = <2600000>;
+			regulator-max-microvolt = <2600000>;
+			bias-pull-down;
+		};
+		l5 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+		l6 {
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2200000>;
+			bias-pull-down;
+		};
 
-			i2c@19880000 {
-				status = "okay";
-				pinctrl-names = "default";
-				pinctrl-0 = <&dragon_gsbi8_i2c_pins>;
-
-				eeprom@52 {
-					/* A 16KiB Platform ID EEPROM on the CPU carrier board */
-					compatible = "atmel,24c128";
-					reg = <0x52>;
-					vcc-supply = <&pm8058_s3>;
-					pagesize = <64>;
-				};
-				wm8903: wm8903@1a {
-					/* This Woolfson Micro device has an unrouted interrupt line */
-					compatible = "wlf,wm8903";
-					reg = <0x1a>;
-
-					AVDD-supply = <&pm8058_l16>;
-					CPVDD-supply = <&pm8058_l16>;
-					DBVDD-supply = <&pm8058_s3>;
-					DCVDD-supply = <&pm8058_l0>;
-
-					gpio-controller;
-					#gpio-cells = <2>;
-
-					micdet-cfg = <0>;
-					micdet-delay = <100>;
-					gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
-				};
-			};
+		/* s0 and s1 are SAW regulators controlled over SPM */
+		s2 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+		s3 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+		s4 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
 		};
 
-		gsbi@19c00000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C_UART>;
+		/* LVS0 thru 3 and mvs are just switches */
+		lvs0 {
+			regulator-always-on;
+		};
+		lvs1 { };
+		lvs2 { };
+		lvs3 { };
+		mvs { };
 
-			serial@19c40000 {
-				status = "okay";
-				pinctrl-names = "default";
-				pinctrl-0 = <&dragon_gsbi12_serial_pins>;
-			};
+	};
 
-			i2c@19c80000 {
-				status = "okay";
-				pinctrl-names = "default";
-				pinctrl-0 = <&dragon_gsbi12_i2c_pins>;
-
-				ak8975@c {
-					compatible = "asahi-kasei,ak8975";
-					reg = <0x0c>;
-					interrupt-parent = <&pm8058_gpio>;
-					interrupts = <33 IRQ_TYPE_EDGE_RISING>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&dragon_ak8975_gpios>;
-					vid-supply = <&pm8058_lvs0>; // 1.8V
-					vdd-supply = <&pm8058_l14>; // 2.85V
-				};
-				bmp085@77 {
-					compatible = "bosch,bmp085";
-					reg = <0x77>;
-					interrupt-parent = <&pm8058_gpio>;
-					interrupts = <16 IRQ_TYPE_EDGE_RISING>;
-					reset-gpios = <&tlmm 86 GPIO_ACTIVE_LOW>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&dragon_bmp085_gpios>;
-					vddd-supply = <&pm8058_lvs0>; // 1.8V
-					vdda-supply = <&pm8058_l14>; // 2.85V
-				};
-				mpu3050@68 {
-					compatible = "invensense,mpu3050";
-					reg = <0x68>;
-					/*
-					 * GPIO17 is pulled high by a 10k
-					 * resistor to VLOGIC so needs to be
-					 * active low/falling edge.
-					 */
-					interrupts-extended = <&pm8058_gpio 17 IRQ_TYPE_EDGE_FALLING>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&dragon_mpu3050_gpios>;
-					vlogic-supply = <&pm8058_lvs0>; // 1.8V
-					vdd-supply = <&pm8058_l14>; // 2.85V
-
-					/*
-					 * The MPU-3050 acts as a hub for the
-					 * accelerometer.
-					 */
-					i2c-gate {
-						#address-cells = <1>;
-						#size-cells = <0>;
-
-						kxsd9@18 {
-							compatible = "kionix,kxsd9";
-							reg = <0x18>;
-							interrupt-parent = <&tlmm>;
-							interrupts = <57 IRQ_TYPE_EDGE_FALLING>;
-							pinctrl-names = "default";
-							pinctrl-0 = <&dragon_kxsd9_gpios>;
-							iovdd-supply = <&pm8058_lvs0>; // 1.8V
-							vdd-supply = <&pm8058_l14>; // 2.85V
-						};
-					};
-				};
-			};
+	pm8058-regulators {
+		vdd_l0_l1_lvs-supply = <&pm8058_s3>;
+		vdd_l2_l11_l12-supply = <&vph>;
+		vdd_l3_l4_l5-supply = <&vph>;
+		vdd_l6_l7-supply = <&vph>;
+		vdd_l8-supply = <&vph>;
+		vdd_l9-supply = <&vph>;
+		vdd_l10-supply = <&vph>;
+		vdd_l13_l16-supply = <&pm8058_s4>;
+		vdd_l14_l15-supply = <&vph>;
+		vdd_l17_l18-supply = <&vph>;
+		vdd_l19_l20-supply = <&vph>;
+		vdd_l21-supply = <&pm8058_s3>;
+		vdd_l22-supply = <&pm8058_s3>;
+		vdd_l23_l24_l25-supply = <&pm8058_s3>;
+		vdd_s0-supply = <&vph>;
+		vdd_s1-supply = <&vph>;
+		vdd_s2-supply = <&vph>;
+		vdd_s3-supply = <&vph>;
+		vdd_s4-supply = <&vph>;
+		vdd_ncp-supply = <&vph>;
+
+		l0 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+		l1 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+		l2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2600000>;
+			bias-pull-down;
+		};
+		l3 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+		l4 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+		l5 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+		l6 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3600000>;
+			bias-pull-down;
+		};
+		l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+		l8 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <3050000>;
+			bias-pull-down;
+		};
+		l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+		l10 {
+			regulator-min-microvolt = <2600000>;
+			regulator-max-microvolt = <2600000>;
+			bias-pull-down;
+		};
+		l11 {
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <1500000>;
+			bias-pull-down;
+		};
+		l12 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+			bias-pull-down;
+		};
+		l13 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+			bias-pull-down;
+		};
+		l14 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+		l15 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+		l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+			regulator-always-on;
+		};
+		l17 {
+			// 1.5V according to schematic
+			regulator-min-microvolt = <2600000>;
+			regulator-max-microvolt = <2600000>;
+			bias-pull-down;
+		};
+		l18 {
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2200000>;
+			bias-pull-down;
+		};
+		l19 {
+			regulator-min-microvolt = <2500000>;
+			regulator-max-microvolt = <2500000>;
+			bias-pull-down;
+		};
+		l20 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+		l21 {
+			// 1.1 V according to schematic
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+			regulator-always-on;
+		};
+		l22 {
+			// 1.2 V according to schematic
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+			bias-pull-down;
+		};
+		l23 {
+			// Unused
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+		l24 {
+			// Unused
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+		l25 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
 		};
 
-		external-bus@1a100000 {
-			/* The EBI2 will instantiate first, then populate its children */
-			status = "okay";
-			pinctrl-names = "default";
-			pinctrl-0 = <&dragon_ebi2_pins>;
-
-			/*
-			 * An on-board SMSC LAN9221 chip for "debug ethernet",
-			 * which is actually just an ordinary ethernet on the
-			 * EBI2. This has a 25MHz chrystal next to it, so no
-			 * clocking is needed.
-			 */
-			ethernet@2,0 {
-				compatible = "smsc,lan9221", "smsc,lan9115";
-				reg = <2 0x0 0x100>;
-				/*
-				 * The second interrupt is the PME interrupt
-				 * for network wakeup, connected to the TLMM.
-				 */
-				interrupts-extended = <&pm8058_gpio 7 IRQ_TYPE_EDGE_FALLING>,
-						    <&tlmm 29 IRQ_TYPE_EDGE_RISING>;
-				reset-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
-				vdd33a-supply = <&dragon_veth>;
-				vddvario-supply = <&dragon_vario>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&dragon_ethernet_gpios>;
-				phy-mode = "mii";
-				reg-io-width = <2>;
-				smsc,force-external-phy;
-				smsc,irq-push-pull;
-
-				/*
-				 * SLOW chipselect config
-				 * Delay 9 cycles (140ns@64MHz) between SMSC
-				 * LAN9221 Ethernet controller reads and writes
-				 * on CS2.
-				 */
-				qcom,xmem-recovery-cycles = <0>;
-				qcom,xmem-write-hold-cycles = <3>;
-				qcom,xmem-write-delta-cycles = <31>;
-				qcom,xmem-read-delta-cycles = <28>;
-				qcom,xmem-write-wait-cycles = <9>;
-				qcom,xmem-read-wait-cycles = <9>;
-			};
+		s0 {
+			// regulator-min-microvolt = <500000>;
+			// regulator-max-microvolt = <1325000>;
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+		s1 {
+			// regulator-min-microvolt = <500000>;
+			// regulator-max-microvolt = <1250000>;
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+		s2 {
+			// 1.3 V according to schematic
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1400000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+		s3 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+			regulator-always-on;
+			bias-pull-down;
+		};
+		s4 {
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2200000>;
+			qcom,switch-mode-frequency = <1600000>;
+			regulator-always-on;
+			bias-pull-down;
 		};
 
-		rpm@104000 {
-			/*
-			 * Set up of the PMIC RPM regulators for this board
-			 * PM8901 supplies "preliminary regulators" whatever
-			 * that means
-			 */
-			pm8901-regulators {
-				vdd_l0-supply = <&pm8901_s4>;
-				vdd_l1-supply = <&vph>;
-				vdd_l2-supply = <&vph>;
-				vdd_l3-supply = <&vph>;
-				vdd_l4-supply = <&vph>;
-				vdd_l5-supply = <&vph>;
-				vdd_l6-supply = <&vph>;
-				/* vdd_s0-supply, vdd_s1-supply: SAW regulators */
-				vdd_s2-supply = <&vph>;
-				vdd_s3-supply = <&vph>;
-				vdd_s4-supply = <&vph>;
-				lvs0_in-supply = <&pm8058_s3>;
-				lvs1_in-supply = <&pm8901_s4>;
-				lvs2_in-supply = <&pm8058_l0>;
-				lvs3_in-supply = <&pm8058_s2>;
-				mvs_in-supply = <&pm8058_s3>;
-
-				l0 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-				};
-				l1 {
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-					bias-pull-down;
-				};
-				l2 {
-					/* TMA340 requires strictly 3.3V */
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-					bias-pull-down;
-				};
-				l3 {
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-					bias-pull-down;
-				};
-				l4 {
-					regulator-min-microvolt = <2600000>;
-					regulator-max-microvolt = <2600000>;
-					bias-pull-down;
-				};
-				l5 {
-					regulator-min-microvolt = <2850000>;
-					regulator-max-microvolt = <2850000>;
-					bias-pull-down;
-				};
-				l6 {
-					regulator-min-microvolt = <2200000>;
-					regulator-max-microvolt = <2200000>;
-					bias-pull-down;
-				};
-
-				/* s0 and s1 are SAW regulators controlled over SPM */
-				s2 {
-					regulator-min-microvolt = <1300000>;
-					regulator-max-microvolt = <1300000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-				s3 {
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-				s4 {
-					regulator-min-microvolt = <1225000>;
-					regulator-max-microvolt = <1225000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-
-				/* LVS0 thru 3 and mvs are just switches */
-				lvs0 {
-					regulator-always-on;
-				};
-				lvs1 { };
-				lvs2 { };
-				lvs3 { };
-				mvs { };
+		/* LVS0 and LVS1 are just switches */
+		lvs0 {
+			bias-pull-down;
+		};
+		lvs1 {
+			bias-pull-down;
+		};
 
-			};
+		ncp {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+		};
+	};
+};
 
-			pm8058-regulators {
-				vdd_l0_l1_lvs-supply = <&pm8058_s3>;
-				vdd_l2_l11_l12-supply = <&vph>;
-				vdd_l3_l4_l5-supply = <&vph>;
-				vdd_l6_l7-supply = <&vph>;
-				vdd_l8-supply = <&vph>;
-				vdd_l9-supply = <&vph>;
-				vdd_l10-supply = <&vph>;
-				vdd_l13_l16-supply = <&pm8058_s4>;
-				vdd_l14_l15-supply = <&vph>;
-				vdd_l17_l18-supply = <&vph>;
-				vdd_l19_l20-supply = <&vph>;
-				vdd_l21-supply = <&pm8058_s3>;
-				vdd_l22-supply = <&pm8058_s3>;
-				vdd_l23_l24_l25-supply = <&pm8058_s3>;
-				vdd_s0-supply = <&vph>;
-				vdd_s1-supply = <&vph>;
-				vdd_s2-supply = <&vph>;
-				vdd_s3-supply = <&vph>;
-				vdd_s4-supply = <&vph>;
-				vdd_ncp-supply = <&vph>;
-
-				l0 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-				};
-				l1 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-				};
-				l2 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <2600000>;
-					bias-pull-down;
-				};
-				l3 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-				l4 {
-					regulator-min-microvolt = <2850000>;
-					regulator-max-microvolt = <2850000>;
-					bias-pull-down;
-				};
-				l5 {
-					regulator-min-microvolt = <2850000>;
-					regulator-max-microvolt = <2850000>;
-					bias-pull-down;
-				};
-				l6 {
-					regulator-min-microvolt = <3000000>;
-					regulator-max-microvolt = <3600000>;
-					bias-pull-down;
-				};
-				l7 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-				l8 {
-					regulator-min-microvolt = <2900000>;
-					regulator-max-microvolt = <3050000>;
-					bias-pull-down;
-				};
-				l9 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-				l10 {
-					regulator-min-microvolt = <2600000>;
-					regulator-max-microvolt = <2600000>;
-					bias-pull-down;
-				};
-				l11 {
-					regulator-min-microvolt = <1500000>;
-					regulator-max-microvolt = <1500000>;
-					bias-pull-down;
-				};
-				l12 {
-					regulator-min-microvolt = <2900000>;
-					regulator-max-microvolt = <2900000>;
-					bias-pull-down;
-				};
-				l13 {
-					regulator-min-microvolt = <2050000>;
-					regulator-max-microvolt = <2050000>;
-					bias-pull-down;
-				};
-				l14 {
-					regulator-min-microvolt = <2850000>;
-					regulator-max-microvolt = <2850000>;
-				};
-				l15 {
-					regulator-min-microvolt = <2850000>;
-					regulator-max-microvolt = <2850000>;
-					bias-pull-down;
-				};
-				l16 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-					regulator-always-on;
-				};
-				l17 {
-					// 1.5V according to schematic
-					regulator-min-microvolt = <2600000>;
-					regulator-max-microvolt = <2600000>;
-					bias-pull-down;
-				};
-				l18 {
-					regulator-min-microvolt = <2200000>;
-					regulator-max-microvolt = <2200000>;
-					bias-pull-down;
-				};
-				l19 {
-					regulator-min-microvolt = <2500000>;
-					regulator-max-microvolt = <2500000>;
-					bias-pull-down;
-				};
-				l20 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-				l21 {
-					// 1.1 V according to schematic
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-					regulator-always-on;
-				};
-				l22 {
-					// 1.2 V according to schematic
-					regulator-min-microvolt = <1150000>;
-					regulator-max-microvolt = <1150000>;
-					bias-pull-down;
-				};
-				l23 {
-					// Unused
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-				};
-				l24 {
-					// Unused
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-				};
-				l25 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-				};
-
-				s0 {
-					// regulator-min-microvolt = <500000>;
-					// regulator-max-microvolt = <1325000>;
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-				s1 {
-					// regulator-min-microvolt = <500000>;
-					// regulator-max-microvolt = <1250000>;
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-				s2 {
-					// 1.3 V according to schematic
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1400000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-				s3 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,switch-mode-frequency = <1600000>;
-					regulator-always-on;
-					bias-pull-down;
-				};
-				s4 {
-					regulator-min-microvolt = <2200000>;
-					regulator-max-microvolt = <2200000>;
-					qcom,switch-mode-frequency = <1600000>;
-					regulator-always-on;
-					bias-pull-down;
-				};
-
-				/* LVS0 and LVS1 are just switches */
-				lvs0 {
-					bias-pull-down;
-				};
-				lvs1 {
-					bias-pull-down;
-				};
-
-				ncp {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,switch-mode-frequency = <1600000>;
-				};
-			};
+/* Internal 3.69 GiB eMMC */
+&sdcc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dragon_sdcc1_pins>;
+	vmmc-supply = <&pm8901_l5>;
+	vqmmc-supply = <&pm8901_lvs0>;
+	status = "okay";
+};
+
+/* External micro SD card, directly connected, pulled up to 2.85 V */
+&sdcc3 {
+	/* Enable SSBI GPIO 22 as input, use for card detect */
+	pinctrl-names = "default";
+	pinctrl-0 = <&dragon_sdcc3_pins>, <&dragon_sdcc3_gpios>;
+	cd-gpios = <&pm8058_gpio 22 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&pm8058_l14>;
+	status = "okay";
+};
+
+/*
+ * Second external micro SD card, using two TXB104RGYR levelshifters
+ * to lift from 1.8 V to 2.85 V
+ */
+&sdcc5 {
+	/* Enable SSBI GPIO 26 as input, use for card detect */
+	pinctrl-names = "default";
+	pinctrl-0 = <&dragon_sdcc5_pins>, <&dragon_sdcc5_gpios>;
+	cd-gpios = <&pm8058_gpio 26 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&tlmm 106 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&pm8058_l14>;
+	vqmmc-supply = <&dragon_vio_txb>;
+	status = "okay";
+};
+
+&tlmm {
+	/* eMMC pins, all 8 data lines connected */
+	dragon_sdcc1_pins: sdcc1 {
+		mux {
+			pins = "gpio159", "gpio160", "gpio161",
+			     "gpio162", "gpio163", "gpio164",
+			     "gpio165", "gpio166", "gpio167",
+			     "gpio168";
+			     function = "sdc1";
 		};
-		amba {
-			/* Internal 3.69 GiB eMMC */
-			mmc@12400000 {
-				status = "okay";
-				pinctrl-names = "default";
-				pinctrl-0 = <&dragon_sdcc1_pins>;
-				vmmc-supply = <&pm8901_l5>;
-				vqmmc-supply = <&pm8901_lvs0>;
-			};
+		clk {
+			pins = "gpio167"; /* SDC1 CLK */
+			drive-strength = <16>;
+			bias-disable;
+		};
+		cmd {
+			pins = "gpio168"; /* SDC1 CMD */
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+		data {
+			/* SDC1 D0 to D7 */
+			pins = "gpio159", "gpio160", "gpio161", "gpio162",
+			     "gpio163", "gpio164", "gpio165", "gpio166";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+	};
 
-			/* External micro SD card, directly connected, pulled up to 2.85 V */
-			mmc@12180000 {
-				status = "okay";
-				/* Enable SSBI GPIO 22 as input, use for card detect */
-				pinctrl-names = "default";
-				pinctrl-0 = <&dragon_sdcc3_pins>, <&dragon_sdcc3_gpios>;
-				cd-gpios = <&pm8058_gpio 22 GPIO_ACTIVE_LOW>;
-				wp-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
-				vmmc-supply = <&pm8058_l14>;
-			};
+	/*
+	 * The SDCC3 pins are hardcoded (non-muxable) but need some pin
+	 * configuration.
+	 */
+	dragon_sdcc3_pins: sdcc3 {
+		clk {
+			pins = "sdc3_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+		cmd {
+			pins = "sdc3_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+		data {
+			pins = "sdc3_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
 
-			/*
-			 * Second external micro SD card, using two TXB104RGYR levelshifters
-			 * to lift from 1.8 V to 2.85 V
-			 */
-			mmc@12200000 {
-				status = "okay";
-				/* Enable SSBI GPIO 26 as input, use for card detect */
-				pinctrl-names = "default";
-				pinctrl-0 = <&dragon_sdcc5_pins>, <&dragon_sdcc5_gpios>;
-				cd-gpios = <&pm8058_gpio 26 GPIO_ACTIVE_LOW>;
-				wp-gpios = <&tlmm 106 GPIO_ACTIVE_HIGH>;
-				vmmc-supply = <&pm8058_l14>;
-				vqmmc-supply = <&dragon_vio_txb>;
-			};
+	/* Second SD card slot pins */
+	dragon_sdcc5_pins: sdcc5 {
+		mux {
+			pins = "gpio95", "gpio96", "gpio97",
+			    "gpio98", "gpio99", "gpio100";
+			function = "sdc5";
+		};
+		clk {
+			pins = "gpio97"; /* SDC5 CLK */
+			drive-strength = <16>;
+			bias-disable;
+		};
+		cmd {
+			pins = "gpio95"; /* SDC5 CMD */
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+		data {
+			/* SDC5 D0 to D3 */
+			pins = "gpio96", "gpio98", "gpio99", "gpio100";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+	};
+
+	dragon_gsbi3_i2c_pins: gsbi3_i2c {
+		mux {
+			pins = "gpio43", "gpio44";
+			function = "gsbi3";
+		};
+		pinconf {
+			pins = "gpio43", "gpio44";
+			drive-strength = <8>;
+			/* These have external pull-up 2.2kOhm to 1.8V */
+			bias-disable;
+		};
+	};
+
+	dragon_gsbi8_i2c_pins: gsbi8_i2c {
+		mux {
+			pins = "gpio64", "gpio65";
+			function = "gsbi8";
+		};
+		pinconf {
+			pins = "gpio64", "gpio65";
+			drive-strength = <16>;
+			/* These have external pull-up 2.2kOhm to 1.8V */
+			bias-disable;
+		};
+	};
+
+	dragon_gsbi12_i2c_pins: gsbi12_i2c {
+		mux {
+			pins = "gpio115", "gpio116";
+			function = "gsbi12";
+		};
+		pinconf {
+			pins = "gpio115", "gpio116";
+			drive-strength = <16>;
+			/* These have external pull-up 4.7kOhm to 1.8V */
+			bias-disable;
+		};
+	};
+
+	/* Primary serial port uart 0 pins */
+	dragon_gsbi12_serial_pins: gsbi12_serial {
+		mux {
+			pins = "gpio117", "gpio118";
+			function = "gsbi12";
+		};
+		tx {
+			pins = "gpio117";
+			drive-strength = <8>;
+			bias-disable;
 		};
+		rx {
+			pins = "gpio118";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	dragon_ebi2_pins: ebi2 {
+		/*
+		 * Pins used by EBI2 on the Dragonboard, actually only
+		 * CS2 is used by a real peripheral. CS0 is just
+		 * routed to a test point.
+		 */
+		mux0 {
+			pins =
+			    /* "gpio39", CS1A_N this is not good to mux */
+			    "gpio40", /* CS2A_N */
+			    "gpio134"; /* CS0_N testpoint TP29 */
+			function = "ebi2cs";
+		};
+		mux1 {
+			pins =
+			    /* EBI2_ADDR_7 downto EBI2_ADDR_0 address bus */
+			    "gpio123", "gpio124", "gpio125", "gpio126",
+			    "gpio127", "gpio128", "gpio129", "gpio130",
+			    /* EBI2_DATA_15 downto EBI2_DATA_0 data bus */
+			    "gpio135", "gpio136", "gpio137", "gpio138",
+			    "gpio139", "gpio140", "gpio141", "gpio142",
+			    "gpio143", "gpio144", "gpio145", "gpio146",
+			    "gpio147", "gpio148", "gpio149", "gpio150",
+			    "gpio151", /* EBI2_OE_N */
+			    "gpio153", /* EBI2_ADV */
+			    "gpio157"; /* EBI2_WE_N */
+			function = "ebi2";
+		};
+	};
+
+	/* Interrupt line for the KXSD9 accelerometer */
+	dragon_kxsd9_gpios: kxsd9 {
+		irq {
+			pins = "gpio57"; /* IRQ line */
+			bias-pull-up;
+		};
+	};
+
+	dragon_tma340_gpios: tma340 {
+		reset {
+			/* RESET line, TS_ATTN, WAKE_CTP */
+			pins = "gpio58";
+			function = "gpio";
+			drive-strength = <6>;
+			bias-disable;
+		};
+		irq {
+			pins = "gpio61"; /* IRQ line */
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&xoadc {
+	/* Reference voltage 2.2 V */
+	xoadc-ref-supply = <&pm8058_l18>;
+
+	/* Board-specific channels */
+	mpp5@5 {
+		/* Connected to AOUT of ALS sensor */
+		reg = <0x00 0x05>;
+	};
+	mpp6@6 {
+		/* Connected to test point TP43 */
+		reg = <0x00 0x06>;
+	};
+	mpp7@7 {
+		/* Connected to battery thermistor */
+		reg = <0x00 0x07>;
+	};
+	mpp8@8 {
+		/* Connected to battery ID detector */
+		reg = <0x00 0x08>;
+	};
+	mpp9@9 {
+		/* Connected to XO thermistor */
+		reg = <0x00 0x09>;
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 35e90d188e05..4b0f58c417d5 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -316,7 +316,7 @@ gsbi12_i2c: i2c@19c80000 {
 			};
 		};
 
-		external-bus@1a100000 {
+		ebi2: external-bus@1a100000 {
 			compatible = "qcom,msm8660-ebi2";
 			#address-cells = <2>;
 			#size-cells = <1>;
@@ -359,12 +359,6 @@ pm8058_gpio: gpio@150 {
 
 				};
 
-				pm8058_led48: led@48 {
-					compatible = "qcom,pm8058-keypad-led";
-					reg = <0x48>;
-					status = "disabled";
-				};
-
 				pm8058_mpps: mpps@50 {
 					compatible = "qcom,pm8058-mpp",
 						     "qcom,ssbi-mpp";
@@ -385,24 +379,6 @@ pwrkey@1c {
 					pull-up;
 				};
 
-				pm8058_led131: led@131 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x131>;
-					status = "disabled";
-				};
-
-				pm8058_led132: led@132 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x132>;
-					status = "disabled";
-				};
-
-				pm8058_led133: led@133 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x133>;
-					status = "disabled";
-				};
-
 				pm8058_keypad: keypad@148 {
 					compatible = "qcom,pm8058-keypad";
 					reg = <0x148>;
@@ -468,6 +444,31 @@ vibrator@4a {
 					compatible = "qcom,pm8058-vib";
 					reg = <0x4a>;
 				};
+
+				pm8058_led48: led@48 {
+					compatible = "qcom,pm8058-keypad-led";
+					reg = <0x48>;
+					status = "disabled";
+				};
+
+				pm8058_led131: led@131 {
+					compatible = "qcom,pm8058-led";
+					reg = <0x131>;
+					status = "disabled";
+				};
+
+				pm8058_led132: led@132 {
+					compatible = "qcom,pm8058-led";
+					reg = <0x132>;
+					status = "disabled";
+				};
+
+				pm8058_led133: led@133 {
+					compatible = "qcom,pm8058-led";
+					reg = <0x133>;
+					status = "disabled";
+				};
+
 			};
 		};
 
-- 
2.35.1

