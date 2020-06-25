Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB27020A487
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406022AbgFYSNl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436484AbgFYSNj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:39 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF8EC08C5C1;
        Thu, 25 Jun 2020 11:13:39 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id d15so4922155edm.10;
        Thu, 25 Jun 2020 11:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dvDLOKRG4O2InrW0PN0HnWa5B+zIHa5l8tfp3eSwRmw=;
        b=fh8PWGb9v330D2YylTgIJ6FJw9nwjL8aiQe33JZSzfbmfv98KjwGaXsEr9gGV9acJl
         cJNraRIg+9e/B4VbPDP8zpyOBgReNozLoL9Mhpz30GhkR4A4//2toeLCORCmzypZ4X0h
         LWO31ZIGi2kkJnTc4lUJOiffqI659H2YOWi3Ir9GwJssA1nK0J3z9I7R0ntySaaLRHay
         00beKySftDwUGn3Bai3cKohZnApgn7+igagb/sX6/9Jn5wL/VOMOmP+MX6E7ccmLIlZy
         XKK2V396PYC0cyl8E920YYWj7ZMrPoXA62Im7uQHj38ikY9stEIp7HU6UyJNqDPNuYfQ
         hpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dvDLOKRG4O2InrW0PN0HnWa5B+zIHa5l8tfp3eSwRmw=;
        b=SdZDnYAQOnHOMjtUGMMm/5Q8Nqh7A5pPW6SlcdV68dbYITaIdcbaGYoL5fJR5dErwG
         O9daI76MndAoZBlMDItCj9ICbpUJmlU37MmbUh92e+Feg7SJpI8kjM7p9z7vxKqnARGh
         cDE0Q1dZMcJzqXXFFI4gm5Aqwo+O2hFKcWVji5eezGuhbCV+yevkV1x6BlvHTCbn5niv
         KOo8A1oJBb7idvMUW6ZVvw90OKG8QQIvL2nRA2WDw6mm/suKfhukhPhlQD4iA4OVR6P5
         OhvBorVBCJCCl1deZuyOsJByL1nZxYCHwEnuyEJw4VxJIU7ccFFYZw2P2d82xDB5uikr
         cpBw==
X-Gm-Message-State: AOAM531QWfeIuyyUOToSksA7an5kcKsxD1KKcqpAcIRdzL7+NPSRqx7C
        YzgrTVZ0V6fs7hQMt5mTkAI=
X-Google-Smtp-Source: ABdhPJxWvnzxrYa16Q2InoqDtaS09YVezymW6CfVM9zraIjGDxUmgzAqGaHUDjaVlVvUYOgrkGSDEA==
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr4084072edr.148.1593108818104;
        Thu, 25 Jun 2020 11:13:38 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:37 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] arm64: dts: qcom: Add Xiaomi Libra (Mi 4C) device tree
Date:   Thu, 25 Jun 2020 20:13:00 +0200
Message-Id: <20200625181303.129874-13-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625181303.129874-1-konradybcio@gmail.com>
References: <20200625181303.129874-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for the Xiaomi Libra (Mi 4C)
smartphone. It's based on the Qualcomm msm8992 SoC.

It currently supports:
* Screen console from bootloader
* SDHCI
* Regulator configuration
* Serial console
* I2C

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8992-xiaomi-libra.dts    | 364 ++++++++++++++++++
 2 files changed, 365 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0f2c33d611df..344cdeb68b16 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -9,6 +9,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
new file mode 100644
index 000000000000..ac9b2f325fc1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "msm8992.dtsi"
+#include "pm8994.dtsi"
+#include "pmi8994.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+/ {
+	model = "Xiaomi Mi 4C";
+	compatible = "xiaomi,libra", "qcom,msm8992";
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <251 0 252 0>;
+    qcom,pmic-id = <65545 65546 0 0>;
+	qcom,board-id = <12 0>;
+
+	/* This enables graphical output via bootloader-enabled display */
+	chosen {
+		bootargs = "earlycon=tty0 console=tty0";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@3404000 {
+			status= "okay";
+			compatible = "simple-framebuffer";
+			reg = <0 0x3404000 0 (1080 * 1920 * 3)>;
+			width = <1080>;
+			height = <1920>;
+			stride = <(1080 * 3)>;
+			format = "r8g8b8";
+		};
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+
+		button@0 {
+			label = "Volume Up";
+			gpios = <&pm8994_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* This is for getting crash logs using Android downstream kernels */
+		ramoops@dfc00000 {
+			compatible = "ramoops";
+			reg = <0x0 0xdfc00000 0x0 0x40000>;
+			console-size = <0x10000>;
+			record-size = <0x10000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x20000>;
+		};
+
+		continuous_splash: framebuffer@3401000{
+			reg = <0x0 0x3401000 0x0 0x2200000>;
+			no-map;
+		};
+
+		dfps_data_mem: dfps_data_mem@3400000 {
+			reg = <0x0 0x3400000 0x0 0x1000>;
+			no-map;
+		};
+
+		peripheral_region: peripheral_region@7400000 {
+			reg = <0x0 0x7400000 0x0 0x1c00000>;
+			no-map;
+		};
+
+		modem_region: modem_region@9000000 {
+			reg = <0x0 0x9000000 0x0 0x5a00000>;
+			no-map;
+		};
+
+		tzapp: modem_region@ea00000 {
+			reg = <0x0 0xea00000 0x0 0x1900000>;
+			no-map;
+		};
+	};
+};
+
+&blsp_i2c2 {
+	status = "okay";
+
+	/* Atmel or Synaptics touchscreen */
+};
+
+&blsp_i2c5 {
+	status = "okay";
+
+	/* Silabs si4705 FM transmitter */
+};
+
+&blsp_i2c6 {
+	status = "okay";
+
+	/* NCI NFC,
+	 * TI USB320 Type-C controller,
+	 * Pericom 30216a USB (de)mux switch
+	 */
+};
+
+&blsp_i2c7 {
+	status = "okay";
+
+	/* cm36686 proximity and ambient light sensor */
+};
+
+&blsp_i2c13 {
+	status = "okay";
+
+	/* ST lsm6db0 gyro/accelerometer */
+};
+
+&blsp2_uart2 {
+	status = "okay";
+};
+
+&rpm_requests {
+	pm8994-regulators {
+		compatible = "qcom,rpm-pm8994-regulators";
+
+		vdd_l1-supply = <&pm8994_s7>;
+		vdd_l2_26_28-supply = <&pm8994_s3>;
+		vdd_l3_11-supply = <&pm8994_s3>;
+		vdd_l4_27_31-supply = <&pm8994_s3>;
+		vdd_l5_7-supply = <&pm8994_s3>;
+		vdd_l6_12_32-supply = <&pm8994_s5>;
+		vdd_l8_16_30-supply = <&vreg_vph_pwr>;
+		vdd_l9_10_18_22-supply = <&vreg_vph_pwr>;
+		vdd_l13_19_23_24-supply = <&vreg_vph_pwr>;
+		vdd_l14_15-supply = <&pm8994_s5>;
+		vdd_l17_29-supply = <&vreg_vph_pwr>;
+		vdd_l20_21-supply = <&vreg_vph_pwr>;
+		vdd_l25-supply = <&pm8994_s5>;
+		vdd_lvs1_2 = <&pm8994_s4>;
+
+		pm8994_s1: s1 {
+			/* unused */
+			status = "disabled";
+		};
+
+		pm8994_s2: s2 {
+			/* unused */
+			status = "disabled";
+		};
+
+		pm8994_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8994_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+			regulator-always-on;
+			regulator-system-load = <325000>;
+		};
+
+		pm8994_s5: s5 {
+			regulator-min-microvolt = <2150000>;
+			regulator-max-microvolt = <2150000>;
+		};
+
+		pm8994_s7: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l1: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l2: l2 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+		};
+
+		pm8994_l3: l3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8994_l4: l4 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8994_l5: l5 {
+			/* unused */
+			status = "disabled";
+		};
+
+		pm8994_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l7: l7 {
+			/* unused */
+			status = "disabled";
+		};
+
+		pm8994_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l9: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l11: l11 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8994_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8994_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l16: l16 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8994_l17: l17 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8994_l18: l18 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			regulator-always-on;
+		};
+
+		pm8994_l19: l19 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8994_l20: l20 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-system-load = <570000>;
+		};
+
+		pm8994_l21: l21 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+		};
+
+		pm8994_l22: l22 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		pm8994_l23: l23 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8994_l24: l24 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3150000>;
+		};
+
+		pm8994_l25: l25 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l26: l26 {
+			regulator-min-microvolt = <987500>;
+			regulator-max-microvolt = <987500>;
+
+		};
+
+		pm8994_l27: l27 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm8994_l28: l28 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l29: l29 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8994_l30: l30 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l31: l31 {
+			regulator-min-microvolt = <1262500>;
+			regulator-max-microvolt = <1262500>;
+		};
+
+		pm8994_l32: l32 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	status = "okay";
+
+	mmc-hs400-1_8v;
+	vmmc-supply = <&pm8994_l20>;
+	vqmmc-supply = <&pm8994_s4>;
+};
-- 
2.27.0

