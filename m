Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C83F78D902
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjH3ScF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242975AbjH3J7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 05:59:03 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FFF1BE
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:57 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so1501425a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389536; x=1693994336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk5etI1F4yDckR4ULbtA0rCr80AAHLBbcHnHGkIlS/I=;
        b=HLo2iYww8cnuabWM57TG/RMYK1LptFmoc16uQFH/31D24nKKy1/AN22yW/bhb3vu09
         I1enEhYBMqFawVNowelHR/4V+C003vy4Bypc879mO2GDz1dV1NRJvRqYpfH5PxEMFZ5z
         q98BbItot09kbdItCukSqg/PS7IH4M7ErCo3x9divrPFPA2zLkbPIUQp6/DGeAlru8Bb
         QVnijwL4w4n7LP7NDYifrrOkntemV2WFW8QsfQmq7nMqjcQLCCD0HI2X3mBZmmSdo9th
         GxSBpSzho89lK3lOhvjbMMavtAy38fjnEY9DegBdjDoX0XOPQdljnBB9Ry2B0mx+c6SP
         KUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389536; x=1693994336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tk5etI1F4yDckR4ULbtA0rCr80AAHLBbcHnHGkIlS/I=;
        b=jGbC1OEA5+CJEE+I36TtE1omrLTG+rhdOnN7nJKlGecEVIbVwt5/TzPBunISaImlaM
         GDm69uOqlBw6UbDS7e0cRgrpDULN5wp4dqrITgcSf/OoDTflfz1C23BLy3erLaB6CNhA
         L7wPDejhvzv79Pa+n9NMdcWwcTmI+QOz9MWTygnGxUYIyP/RxF9p/FNdeaqcXtTuOyKm
         uhcRmds4E7H1cOY2U4EdR8JbqOtKnqoT4dmG5VQt8bCdvyEbWePwbXoLvuI42pv2rvTX
         Z7g/O2PBBzpZ8pAQ26NSiRwNZ2Mx84qx1YPB4U+iSljihKdHEVHzP4CRDrQ2H0osdhP8
         YysA==
X-Gm-Message-State: AOJu0YygiSkNEIAGLzQgX5P8vsV9sEPLHNUTqSbvVjvfuQqy7C2zyaFi
        ve74rd9nrMtt1Ol0wif5VmJm2g==
X-Google-Smtp-Source: AGHT+IFU6UbgvXYlnv0ltKb8CAEGgj45S1kjBq1+M+88CTpb/olQxFLRrCVYWEO00cP74khDkZZ8OA==
X-Received: by 2002:a17:907:1c1f:b0:9a5:83f0:9bc5 with SMTP id nc31-20020a1709071c1f00b009a583f09bc5mr5632624ejc.18.1693389536423;
        Wed, 30 Aug 2023 02:58:56 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:56 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:36 +0200
Subject: [PATCH 11/11] arm64: dts: qcom: qcm6490: Add device-tree for
 Fairphone 5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-11-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree for the Fairphone 5 smartphone which is based on
the QCM6490 SoC.

Supported features are, as of now:
* Bluetooth
* Debug UART
* Display via simplefb
* Flash/torch LED
* Flip cover sensor
* Power & volume buttons
* RTC
* SD card
* USB
* Various plumbing like regulators, i2c, spi, etc

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 659 +++++++++++++++++++++
 2 files changed, 660 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 2cca20563a1d..73c3be0f8872 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
new file mode 100644
index 000000000000..572b254d3af2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -0,0 +1,659 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+/dts-v1/;
+
+/* PM7250B is configured to use SID8/9 instead of SID2/3 */
+#define PM7250B_SID 8
+#define PM7250B_SID1 9
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sc7280.dtsi"
+#include "pm7250b.dtsi"
+#include "pm7325.dtsi"
+#include "pm8350c.dtsi" /* PM7350C */
+#include "pmk8350.dtsi" /* PMK7325 */
+
+/ {
+	model = "Fairphone 5";
+	compatible = "fairphone,fp5", "qcom,qcm6490";
+	chassis-type = "handset";
+
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <QCOM_ID_QCM6490 0x10000>;
+	qcom,board-id = <34 0>;
+
+	aliases {
+		serial0 = &uart5;
+		serial1 = &uart7;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@a000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xe1000000 0 (2700 * 1224 * 4)>;
+			width = <1224>;
+			height = <2700>;
+			stride = <(1224 * 4)>;
+			format = "a8r8g8b8";
+			panel = <&panel>;
+			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_down_default>, <&hall_sensor_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume up";
+			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		/* Hall sensor uses vreg_l8c as VDD, it's being enabled using
+		 * always-on on the regulator
+		 */
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	panel: panel {
+		compatible = "boe,rm692e5";
+
+		width-mm = <68>;
+		height-mm = <150>;
+	};
+
+	reserved-memory {
+		cont_splash_mem: cont-splash@e1000000 {
+			reg = <0 0xe1000000 0 0x2300000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@86700000 {
+			reg = <0x0 0x86700000 0x0 0x2800000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@88f00000 {
+			reg = <0x0 0x88f00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		mpss_mem: mpss@8b800000 {
+			reg = <0x0 0x8b800000 0x0 0xf600000>;
+			no-map;
+		};
+
+		wpss_mem: wpss@9ae00000 {
+			reg = <0x0 0x9ae00000 0x0 0x1900000>;
+			no-map;
+		};
+	};
+
+	ois_avdd0_1p8: regulator-ois-avdd0-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "OIS_AVDD0_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&tlmm 157 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
+	ois_dvdd_1p1: regulator-ois-dvdd-1p1 {
+		compatible = "regulator-fixed";
+		regulator-name = "OIS_DVDD_1P1";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		gpio = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_s8b>;
+	};
+
+	afvdd_2p8: regulator-afvdd-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "AFVDD_2P8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7325-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vreg_s1b: smps1 {
+			regulator-min-microvolt = <1840000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s7b: smps7 {
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+		};
+
+		vreg_s8b: smps8 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1500000>;
+		};
+
+		vreg_l1b: ldo1 {
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <925000>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <910000>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-min-microvolt = <751000>;
+			regulator-max-microvolt = <824000>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-min-microvolt = <530000>;
+			regulator-max-microvolt = <824000>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-min-microvolt = <765000>;
+			regulator-max-microvolt = <1020000>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8350c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s1c: smps1 {
+			regulator-min-microvolt = <2190000>;
+			regulator-max-microvolt = <2210000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9c: smps9 {
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c: ldo1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c: ldo3 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c: ldo5 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c: ldo6 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			/* Hall sensor VDD */
+			regulator-always-on;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c: ldo10 {
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c: ldo11 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12c: ldo12 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13c: ldo13 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+};
+
+&dispcc {
+	/* Disable for now so simple-framebuffer continues working */
+	status = "disabled";
+};
+
+&gcc {
+	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
+			   <GCC_EDP_CLKREF_EN>,
+			   <GCC_MSS_CFG_AHB_CLK>,
+			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
+			   <GCC_MSS_OFFLINE_AXI_CLK>,
+			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+			   <GCC_MSS_SNOC_AXI_CLK>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_SEC_CTRL_CLK_SRC>,
+			   <GCC_WPSS_AHB_BDG_MST_CLK>,
+			   <GCC_WPSS_AHB_CLK>,
+			   <GCC_WPSS_RSCP_CLK>;
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	/* PM8008 PMIC @ 8 and 9 */
+	/* Pixelworks @ 26 */
+	/* FSA4480 USB audio switch @ 42 */
+	/* AW86927FCR haptics @ 5a */
+};
+
+&i2c2 {
+	status = "okay";
+
+	/* AW88261FCR amplifier @ 34 */
+	/* AW88261FCR amplifier @ 35 */
+};
+
+&i2c4 {
+	status = "okay";
+
+	/* PTN36502 USB redriver @ 1a */
+};
+
+&i2c9 {
+	status = "okay";
+
+	/* ST21NFC NFC @ 28 */
+	/* VL53L3 ToF @ 29 */
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/qcm6490/fairphone5/ipa_fws.mdt";
+	status = "okay";
+};
+
+&pm7325_gpios {
+	volume_down_default: volume-down-default-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		power-source = <1>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
+&pm8350c_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
+&qup_spi13_cs {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&qup_spi13_data_clk {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&qup_uart5_rx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart5_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&rmtfs_mem {
+	qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>, <QCOM_SCM_VMID_NAV>;
+	reg = <0x0 0xf8500000 0x0 0x600000>;
+};
+
+&sdc2_clk {
+	drive-strength = <16>;
+	bias-disable;
+};
+
+&sdc2_cmd {
+	drive-strength = <10>;
+	bias-pull-up;
+};
+
+&sdc2_data {
+	drive-strength = <10>;
+	bias-pull-up;
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9c>;
+	vqmmc-supply = <&vreg_l6c>;
+
+	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
+	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
+
+	status = "okay";
+};
+
+&spi13 {
+	status = "okay";
+
+	/* Goodix touchscreen @ 0 */
+};
+
+&tlmm {
+	/*
+	 * 32-33: SMB1394 (SPMI)
+	 * 56-59: fingerprint reader (SPI)
+	 */
+	gpio-reserved-ranges = <32 2>, <56 4>;
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio155";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
+		pins = "gpio28";
+		function = "gpio";
+		/*
+		 * Configure a bias-bus-hold on CTS to lower power
+		 * usage when Bluetooth is turned off. Bus hold will
+		 * maintain a low power state regardless of whether
+		 * the Bluetooth module drives the pin in either
+		 * direction or leaves the pin fully unpowered.
+		 */
+		bias-bus-hold;
+	};
+
+	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
+		pins = "gpio29";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
+		pins = "gpio30";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
+		pins = "gpio31";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
+&uart5 {
+	compatible = "qcom,geni-debug-uart";
+	status = "okay";
+};
+
+&uart7 {
+	/delete-property/interrupts;
+	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
+
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6750-bt";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bluetooth_enable_default>, <&sw_ctrl_default>;
+
+		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_l19b>;
+		vddaon-supply = <&vreg_s7b>;
+		vddbtcxmx-supply = <&vreg_s7b>;
+		vddrfacmn-supply = <&vreg_s7b>;
+		vddrfa0p8-supply = <&vreg_s7b>;
+		vddrfa1p7-supply = <&vreg_s1b>;
+		vddrfa1p2-supply = <&vreg_s8b>;
+		vddrfa2p2-supply = <&vreg_s1c>;
+		vddasd-supply = <&vreg_l11c>;
+
+		max-speed = <3200000>;
+	};
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l10c>;
+	vdda18-supply = <&vreg_l1c>;
+	vdda33-supply = <&vreg_l2b>;
+
+	qcom,hs-crossover-voltage-microvolt = <28000>;
+	qcom,hs-output-impedance-micro-ohms = <2600000>;
+	qcom,hs-rise-fall-time-bp = <5430>;
+	qcom,hs-disconnect-bp = <1743>;
+	qcom,hs-amplitude-bp = <2430>;
+
+	qcom,pre-emphasis-amplitude-bp = <20000>;
+	qcom,pre-emphasis-duration-bp = <20000>;
+
+	qcom,squelch-detector-bp = <(-2090)>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l6b>;
+	vdda-pll-supply = <&vreg_l1b>;
+
+	status = "okay";
+};

-- 
2.42.0

