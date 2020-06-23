Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652B8206793
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389050AbgFWWsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389041AbgFWWsw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:52 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B299CC061795;
        Tue, 23 Jun 2020 15:48:51 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s10so222495wrw.12;
        Tue, 23 Jun 2020 15:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u5K9aZtVGUko6zibodpIT+fKWpfmrA07/BuhwZxYFbY=;
        b=DSUPeq762gZ7lcKB6hlIUtqEEE0V0LnpDZsgeLEMG3M1xr5B+SN/RkRMlxSxwpVhOE
         3i9/XHJSKOL1Etl5J+X7s5eRTAM3wNXPmBUBb+xV9fRjUzrDLfaCyEzrHyIR1YPCviac
         2InTvmrMXx3P/y9HDAOFnh2wRE4OkX/sEa2Iye2L9BfZDtu069Op8CxFNjAPju2FxGkO
         SRyCKrhezZPuacwV1L0bV6NkzjBqrzPGn2WsxBSvxrWc8iyY00ruWMIOpnX3Nme138+5
         NzNa1N01jkJ36un4g9hWLwuphyYfXH5vbZt+iOMsuImwEvt1F4fmwnkCqeoAV+6mkMhR
         shnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u5K9aZtVGUko6zibodpIT+fKWpfmrA07/BuhwZxYFbY=;
        b=YizAk9mAHgciIGaHWvsXhEf3IPcQqhn+GZWdBst+UG+XNSRhwpnT799Lecf1jmOwMK
         FXOpGEqmiwFXxVa3CtJgXWyufcWPJ+Ljm/3OyfrgoxCtHU1TBnuAFabn5oP51al0qiFV
         PZSEi4sgvqv9YuWIDO4zlidAbbHGyYwTybv8fqjZ8cp6XwCAfu9++ikGUODGltwb34K0
         s29EVDpSllmneYzXksD7KRO+Rf+67tOc3OzDm4N5guswQi/R2RJuSmMkzuiHPWoqZg3r
         S10uKx3Q6xM8pqLxnhkAGcvclnsVPK60EVNDQaZUL6jYU1QYFTKrND7315cLir5YJcWG
         WLSw==
X-Gm-Message-State: AOAM530oZRAXborWcz/tDsnLaTDhko6MUniSi7LuYeVCG+F7Bb3KeFQk
        hxHKSzpl4M/nOQEHIxK0qHE=
X-Google-Smtp-Source: ABdhPJxWt16PwzHIfh/mlZHOUNQr+f52/QNQmquv1HiceYJhUZsBbP+gx+A9nCI+uDz2J9x+VQaZUA==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr25888812wrn.392.1592952530373;
        Tue, 23 Jun 2020 15:48:50 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:50 -0700 (PDT)
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
Subject: [PATCH v2 12/12] arm64: dts: qcom: Add support for Sony Xperia Z5 (SoMC Sumire-RoW)
Date:   Wed, 24 Jun 2020 00:48:11 +0200
Message-Id: <20200623224813.297077-13-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree support for the Sony Xperia Z5 smartphone.
The kitakami part in DT name comes from Sony platform naming
and is there to indicate that as more Sony devices using msm8994
are added to the kernel, they will share a lot of common code.

The board currently supports
* Serial
* SDHCI
* I2C
* Regulator configuration
* pstore log dump
* GPIO keys

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../msm8994-sony-xperia-kitakami-sumire.dts   | 395 ++++++++++++++++++
 2 files changed, 396 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0f2c33d611df..01ca9ac9f905 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-sumire.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
new file mode 100644
index 000000000000..e70d54ed7325
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "msm8994.dtsi"
+#include "pm8994.dtsi"
+#include "pmi8994.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+/ {
+	model = "Sony Xperia Z5";
+	compatible = "somc,sumire-row", "qcom,msm8994";
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <0xcf 0x20001>;
+	qcom,pmic-id = <0x10009 0x1000a 0x00 0x00>;
+	qcom,board-id = <8 0>;
+
+	/* Xperia Z5's firmware doesn't support PSCI */
+	/delete-node/ psci;
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+
+		button@0 {
+			label = "Volume Down";
+			gpios = <&pm8994_gpios 2 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		button@1 {
+			label = "Volume Up";
+			gpios = <&pm8994_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		button@2 {
+			label = "Camera Snapshot";
+			gpios = <&pm8994_gpios 4 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_CAMERA>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		button@3 {
+			label = "Camera Focus";
+			gpios = <&pm8994_gpios 5 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* This is for getting crash logs using Android downstream kernels */
+		ramoops@1fe00000 {
+			compatible = "ramoops";
+			reg = <0x0 0x1fe00000 0x0 0x200000>;
+			console-size = <0x100000>;
+			record-size = <0x10000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x80000>;
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
+
+		fb_region: fb_region@40000000 {
+			reg = <0x00 0x40000000 0x00 0x1000000>;
+			no-map;
+		};
+	};
+};
+
+&blsp_spi0 {
+	status = "okay";
+
+	/* FPC fingerprint reader */
+};
+
+/* I2C1 is disabled on this board */
+
+&blsp_i2c2 {
+	status = "okay";
+
+	/* NXP NFC */
+};
+
+&blsp_i2c4 {
+	status = "okay";
+
+	/* Empty but active */
+};
+
+&blsp_i2c5 {
+	status = "okay";
+
+	/* SMB1357 charger and sii8620 HDMI/MHL bridge */
+};
+
+&blsp_i2c6 {
+	status = "okay";
+
+	/* Synaptics touchscreen */
+};
+
+&blsp1_uart2 {
+	status = "okay";
+};
+
+&blsp2_uart2 {
+	status = "okay";
+};
+
+&pm8994_regulators {
+	s1 {
+		/* Unused */
+		status = "disabled";
+	};
+
+	s2 {
+		/* Unused */
+		status = "disabled";
+	};
+
+	s3 {
+		regulator-min-microvolt = <1300000>;
+		regulator-max-microvolt = <1300000>;
+	};
+
+	s4 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	s5 {
+		regulator-min-microvolt = <2150000>;
+		regulator-max-microvolt = <2150000>;
+	};
+
+	s7 {
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+	};
+
+	l1 {
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+	};
+
+	l2 {
+		regulator-min-microvolt = <1250000>;
+		regulator-max-microvolt = <1250000>;
+	};
+
+	l3 {
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+	};
+
+	l4 {
+		regulator-min-microvolt = <1225000>;
+		regulator-max-microvolt = <1225000>;
+	};
+
+	l5 {
+		/* Unused */
+		status = "disabled";
+	};
+
+	l6 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l7 {
+		/* Unused */
+		status = "disabled";
+	};
+
+	l8 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l9 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l10 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l11 {
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
+	l12 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l13 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+	};
+
+	l14 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l15 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l16 {
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2700000>;
+	};
+
+	l17 {
+		regulator-min-microvolt = <2200000>;
+		regulator-max-microvolt = <2200000>;
+	};
+
+	l18 {
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+		regulator-always-on;
+	};
+
+	l19 {
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+	};
+
+	l20 {
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	l21 {
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+		regulator-always-on;
+	};
+
+	l22 {
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+	};
+
+	l23 {
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
+	l24 {
+		regulator-min-microvolt = <3075000>;
+		regulator-max-microvolt = <3150000>;
+	};
+
+	l25 {
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+	};
+
+	l26 {
+		regulator-min-microvolt = <987500>;
+		regulator-max-microvolt = <987500>;
+	};
+
+	l27 {
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
+	l28 {
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+	};
+
+	l29 {
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2700000>;
+	};
+
+	l30 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l31 {
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-boot-on;
+	};
+
+	l32 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	lvs1 {
+		/* Downstream sets it to enabled but
+		doesn't specify a voltage range */
+		status = "okay";
+	};
+
+	lvs2 {
+		/* Downstream sets it to enabled but
+		doesn't specify a voltage range */
+		status = "okay";
+	};
+};
+
+&pmi8994_regulators {
+	s1 {
+		regulator-min-microvolt = <1025000>;
+		regulator-max-microvolt = <1025000>;
+	};
+
+	s2 {
+		/* Unused */
+		status = "disabled";
+	};
+
+	boost-bypass {
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3600000>;
+	};
+};
+
+&sdhc1 {
+	status = "okay";
+
+	/* Downstream pushes 2.95V to the sdhci device,
+	 * but upstream driver REALLY wants to make vmmc 1.8v
+	 * cause of the hs400-1_8v mode. MMC works fine without
+	 * that regulator, so let's not use it for now.
+	 * vqmmc is also disabled cause driver stll complains.
+	 *
+	 * vmmc-supply = <&pm8994_l20>;
+	 * vqmmc-supply = <&pm8994_s4>;
+	 */
+};
-- 
2.27.0

