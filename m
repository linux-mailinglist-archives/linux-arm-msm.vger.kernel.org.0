Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F987D4794
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 08:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbjJXGiN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 02:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbjJXGiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 02:38:12 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4022128;
        Mon, 23 Oct 2023 23:38:08 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ad8a822508so613068766b.0;
        Mon, 23 Oct 2023 23:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698129487; x=1698734287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0jBWZkDy/clTJO6HVDO41yXu+Zh6Gm8znc7q5uQ8wQ=;
        b=azobGyOUOFzetcWCCB9HBoIb8fGdgkuHxe7XrINgj7AqKbg2mBiytA+p3AEErWODW8
         LxFGinXNMFBNDx9F51HJbuhll93y84zwF+185RjnmeljTMaoJug0tx/x7T3dRMKWz0vJ
         z/ZqsfhpiERzHNivH1tP7EJNLq60Bj9dV+Hh8/I36pwCXEbG/fIsXxxx5BGg3iOPM7Qi
         PzebQ8094kD7Hsi0ZxJOD1j6c+o+AtLWmD7eOk5vs0C7s1b5h3VhQV9ubMx2FQynze6b
         l69QPogqnX3+AMEyiC9APHvej0Bur3Xxd+CcLVvWb19PWEW+X7XdOXq0n7LmPZYD1IJR
         CP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698129487; x=1698734287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0jBWZkDy/clTJO6HVDO41yXu+Zh6Gm8znc7q5uQ8wQ=;
        b=OdTV251SmMPZmb0VlNqIi+eBOq0CEE0KZLqJAoLHcxVLT0/FqDLvIY10+cl5NFe/Re
         sv6Mgp4irkgZmbs1mvtrKjozjXu0gX0EGfIHSHM/VvLu5X7o/LNYGoAcqDcF1i2IshBL
         HIwhkortY3rLEQivaQR4M/bVOmc5WHqyFHWkAGk5r+zK1XRpixCZx9/q76opyxPxpNVy
         lmvsaa1ARaO6GOqHombWokW4wBQZsWDVm4w8yqDYzCh14t5bW3u5DYSnNi7WWEsCvtO+
         +M3ycN0UbN3b0k380wd8dOvlp0j3R0tbijxuKcNOwhmEpGT+dfqrXo4nzsPotx6E2Kzi
         1ixg==
X-Gm-Message-State: AOJu0Yw0fhhrJjBTtW+ir4sRNvARkmpWZKURp7PY9fKcwyFKOZQfjV2X
        mRAQ4zCaP3JTz8GRRotVeYA=
X-Google-Smtp-Source: AGHT+IG5RjtGvI/Ib5OP15/1EMVzLLQLYQYxNF/DGKXbNhY0HpGcYulcPl8JHAxXcN1QdUxHOTvWbA==
X-Received: by 2002:a17:907:3f17:b0:9be:e6d4:5753 with SMTP id hq23-20020a1709073f1700b009bee6d45753mr8186089ejc.28.1698129487001;
        Mon, 23 Oct 2023 23:38:07 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:1b7d:7200::eba])
        by smtp.gmail.com with ESMTPSA id xa17-20020a170907b9d100b009b913aa7cdasm7765920ejc.92.2023.10.23.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 23:38:06 -0700 (PDT)
From:   Luka Panio <lukapanio@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Cc:     Luka Panio <lukapanio@gmail.com>
Subject: [PATCH v9 2/2] arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial device tree
Date:   Tue, 24 Oct 2023 08:37:40 +0200
Message-ID: <20231024063740.4975-2-lukapanio@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024063740.4975-1-lukapanio@gmail.com>
References: <20231024063740.4975-1-lukapanio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initial support for Xiaomi Pad 6 tablet, that have sm8250 soc.

Signed-off-by: Luka Panio <lukapanio@gmail.com>
---
v2:
Update commit message. Drop reserved gpio's as this device in reality do not have gpio, and pins are not protected.

v3:
Update commit message.

v4:
Update commit message.

v5:
Update commit message.

v6:
Update commit message.

v7:
Fix typo in "chassis-type", remove useless newlines, update license

v8:
Set real name in arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts

v9:
Update license
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 623 ++++++++++++++++++
 2 files changed, 624 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 2cca20563a1d..41ab333d1f81 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -208,6 +208,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-boe.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-csot.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-pipa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-microsoft-surface-duo2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
new file mode 100644
index 000000000000..c158e7392e9b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
@@ -0,0 +1,623 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Copyright (c) 2023 Luka Panio <lukapanio@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm8250.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+#include "pm8009.dtsi"
+
+/*
+ * Delete following upstream (sm8250.dtsi) reserved
+ * memory mappings which are different on this device.
+ */
+/delete-node/ &adsp_mem;
+/delete-node/ &cdsp_secure_heap;
+/delete-node/ &slpi_mem;
+/delete-node/ &spss_mem;
+/delete-node/ &xbl_aop_mem;
+
+/ {
+
+	model = "Xiaomi Pad 6";
+	compatible = "xiaomi,pipa", "qcom,sm8250";
+
+	chassis-type = "tablet";
+
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <QCOM_ID_SM8250 0x20001>; /* SM8250 v2.1 */
+	qcom,board-id = <0x34 0>;
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer@9c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x9c000000 0x0 0x2300000>;
+			width = <1800>;
+			height = <2880>;
+			stride = <(1800 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	battery_l: battery-l {
+		compatible = "simple-battery";
+		voltage-min-design-microvolt = <3870000>;
+		energy-full-design-microwatt-hours = <16700000>;
+		charge-full-design-microamp-hours = <4420000>;
+	};
+
+	battery_r: battery-r {
+		compatible = "simple-battery";
+		voltage-min-design-microvolt = <3870000>;
+		energy-full-design-microwatt-hours = <16700000>;
+		charge-full-design-microamp-hours = <4420000>;
+	};
+
+	bl_vddpos_5p5: bl-vddpos-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "bl_vddpos_5p5";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		regulator-enable-ramp-delay = <233>;
+		gpio = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	bl_vddneg_5p5: bl-vddneg-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "bl_vddneg_5p5";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		regulator-enable-ramp-delay = <233>;
+		gpio = <&tlmm 131 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_n>;
+
+		key-vol-up {
+			label = "Volume Up";
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	/* S6c is really ebi.lvl but it's there for supply map completeness sake. */
+	vreg_s6c_0p88: smpc6-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s6c_0p88";
+		regulator-min-microvolt = <880000>;
+		regulator-max-microvolt = <880000>;
+		regulator-always-on;
+		vin-supply = <&vph_pwr>;
+	};
+
+	reserved-memory {
+		xbl_aop_mem: xbl-aop@80700000 {
+			reg = <0x0 0x80600000 0x0 0x260000>;
+			no-map;
+		};
+
+		slpi_mem: slpi@88c00000 {
+			reg = <0x0 0x88c00000 0x0 0x2f00000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@8bb00000 {
+			reg = <0x0 0x8bb00000 0x0 0x2500000>;
+			no-map;
+		};
+
+		spss_mem: spss@8e000000 {
+			reg = <0x0 0x8e000000 0x0 0x100000>;
+			no-map;
+		};
+
+		cdsp_secure_heap: cdsp-secure-heap@8e100000 {
+			reg = <0x0 0x8e100000 0x0 0x4600000>;
+			no-map;
+		};
+
+		cont_splash_mem: cont-splash@9c000000 {
+			reg = <0x0 0x9c000000 0x0 0x2300000>;
+			no-map;
+		};
+
+		ramoops@b0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xb0000000 0x0 0x400000>;
+			record-size = <0x1000>;
+			console-size = <0x200000>;
+			ecc-size = <16>;
+			no-map;
+		};
+	};
+};
+
+&adsp {
+	firmware-name = "qcom/sm8250/xiaomi/pipa/adsp.mbn";
+	status = "okay";
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-l1-l8-l11-supply = <&vreg_s6c_0p88>;
+		vdd-l2-l10-supply = <&vreg_bob>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p95>;
+		vdd-l6-l9-supply = <&vreg_s8c_1p35>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_1p9>;
+		vdd-l13-l16-l17-supply = <&vreg_bob>;
+
+		/* (S1+S2+S3) - cx.lvl (ARC) */
+
+		vreg_s4a_1p8: smps4 {
+			regulator-name = "vreg_s4a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a_1p9: smps5 {
+			regulator-name = "vreg_s5a_1p9";
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6a_0p95: smps6 {
+			regulator-name = "vreg_s6a_0p95";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <1128000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a_3p1: ldo2 {
+			regulator-name = "vreg_l2a_3p1";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_0p9: ldo3 {
+			regulator-name = "vreg_l3a_0p9";
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <932000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* L4 - lmx.lvl (ARC) */
+
+		vreg_l5a_0p88: ldo5 {
+			regulator-name = "vreg_l5a_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-name = "vreg_l6a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* L7 is unused. */
+
+		vreg_l9a_1p2: ldo9 {
+			regulator-name = "vreg_l9a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* L10 is unused, L11 - lcx.lvl (ARC) */
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-name = "vreg_l12a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* L13 is unused. */
+
+		vreg_l14a_1p88: ldo14 {
+			regulator-name = "vreg_l14a_1p88";
+			regulator-min-microvolt = <1880000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* L15 & L16 are unused. */
+
+		vreg_l17a_3p0: ldo17 {
+			regulator-name = "vreg_l17a_3p0";
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_0p9: ldo18 {
+			regulator-name = "vreg_l18a_0p9";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-l1-l8-supply = <&vreg_s4a_1p8>;
+		vdd-l2-l3-supply = <&vreg_s8c_1p35>;
+		vdd-l4-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-l11-supply = <&vreg_bob>;
+		vdd-l9-l10-supply = <&vreg_bob>;
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3350000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		/*
+		 * S1-S6 are ARCs:
+		 * (S1+S2) - gfx.lvl,
+		 * S3 - mx.lvl,
+		 * (S4+S5) - mmcx.lvl,
+		 * S6 - ebi.lvl
+		 */
+
+		vreg_s7c_0p35: smps7 {
+			regulator-name = "vreg_s7c_0p35";
+			regulator-min-microvolt = <348000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8c_1p35: smps8 {
+			regulator-name = "vreg_s8c_1p35";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* L2-4 are unused. */
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-name = "vreg_l5c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c_2p9: ldo6 {
+			regulator-name = "vreg_l6c_2p9";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_2p85: ldo7 {
+			regulator-name = "vreg_l7c_2p85";
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-name = "vreg_l8c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p9: ldo9 {
+			regulator-name = "vreg_l9c_2p9";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-name = "vreg_l10c_3p3";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p0: ldo11 {
+			regulator-name = "vreg_l11c_3p0";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8009-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vreg_bob>;
+		vdd-l2-supply = <&vreg_s8c_1p35>;
+		vdd-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_s4a_1p8>;
+
+		vreg_s1f_1p2: smps1 {
+			regulator-name = "vreg_s1f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2f_0p5: smps2 {
+			regulator-name = "vreg_s2f_0p5";
+			regulator-min-microvolt = <512000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* L1 is unused. */
+
+		vreg_l2f_1p3: ldo2 {
+			regulator-name = "vreg_l2f_1p3";
+			regulator-min-microvolt = <1056000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* L3 & L4 are unused. */
+
+		vreg_l5f_2p8: ldo5 {
+			regulator-name = "vreg_l5f_2p85";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6f_2p8: ldo6 {
+			regulator-name = "vreg_l6f_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7f_1p8: ldo7 {
+			regulator-name = "vreg_l7f_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&cdsp {
+	firmware-name = "qcom/sm8250/xiaomi/pipa/cdsp.mbn";
+	status = "okay";
+};
+
+&gmu {
+	status = "okay";
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
+&gpi_dma2 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sm8250/xiaomi/pipa/a650_zap.mbn";
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	fuel-gauge@55 {
+		compatible = "ti,bq27z561";
+		reg = <0x55>;
+		monitored-battery = <&battery_r>;
+	};
+};
+
+&i2c11 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	backlight: backlight@11 {
+		compatible = "kinetic,ktz8866";
+		reg = <0x11>;
+		vddpos-supply = <&bl_vddpos_5p5>;
+		vddneg-supply = <&bl_vddneg_5p5>;
+		enable-gpios = <&tlmm 139 GPIO_ACTIVE_HIGH>;
+		current-num-sinks = <5>;
+		kinetic,current-ramp-delay-ms = <128>;
+		kinetic,led-enable-ramp-delay-ms = <1>;
+		kinetic,enable-lcd-bias;
+	};
+};
+
+&i2c13 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	fuel-gauge@55 {
+		compatible = "ti,bq27z561";
+		reg = <0x55>;
+		monitored-battery = <&battery_l>;
+	};
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+};
+
+&pm8150_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+		bias-pull-up;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
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
+&qupv3_id_2 {
+	status = "okay";
+};
+
+&slpi {
+	firmware-name = "qcom/sm8250/xiaomi/pipa/slpi.mbn";
+	status = "okay";
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
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l9a_1p2>;
+	vdda-pll-supply = <&vreg_l18a_0p9>;
+};
+
+&ufs_mem_hc {
+	vcc-supply = <&vreg_l17a_3p0>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l6a_1p2>;
+	vccq-max-microamp = <800000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <800000>;
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+};
+
+&venus {
+	firmware-name = "qcom/sm8250/xiaomi/pipa/venus.mbn";
+	status = "okay";
+};
-- 
2.42.0

