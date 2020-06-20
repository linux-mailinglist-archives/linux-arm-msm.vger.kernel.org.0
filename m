Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1AD202481
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgFTOtC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgFTOtA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:49:00 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DC9C0613EE;
        Sat, 20 Jun 2020 07:49:00 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o11so4645371wrv.9;
        Sat, 20 Jun 2020 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MeYEH2NT9Ksi+ZUmEtGsNon+EIn/ZBuaDVI8zEZeGNg=;
        b=YIVQuHWgM49qYpXdPQNympBBYQbbFBGZkjEsqcqyETwRj9kf9t0RjWOhgajtTRudJY
         3fE7rcSE9EkylJbhu8jq1c/HIuxBME215cESDRerNFMLO8pZoDrSOPOrO19P8haQ7wZY
         gwlTLuXXa356Ul6P833I6C+GCZTibNTrgxrPlQWFj1JWc5ivinYpyAskhI0ji81rDSDt
         6vgHp4Q6OOehHBdEPB95GqCuuQUkjJE+3FCaBOTESO+A2iYbGrFJ0EZHwa/UXy5UIG5N
         SR9IBqIg3rXL2V/IN9IfTd0iTn19YJPyulo0Ry9HUuX5S+LgkcUP6EzWeo6/F5yrEuc8
         LH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MeYEH2NT9Ksi+ZUmEtGsNon+EIn/ZBuaDVI8zEZeGNg=;
        b=o0PwuT6nCh8xo/S9ZIdu1yQA/EYhFOP1oL9a3d7Sn3HtNH8eLVYzGYfN3k8YVmJxtS
         kluii6OeWHlxWrFmZR/AUGrxT9PDUypQKRcaGmss3SKnUfX3r1xLQ39vgpGPzeVhnFeP
         5zIYa711Xjxou7IFY8Ji0SSEjNAa0gktxZ0Uhn8YSycaPbXyG4721Ip1eQ+AdZ+83HDE
         BBX1hieNpIXRa7aulZAxlmvbgsVR4Y2iB6vK4E4jA3LP4p7FKzNPuaiG92rareFiP+rj
         sHbdxURVmzIrhh1oFGC4qytJ0v6os5r6/l1417F+0eTAk6LiLmQxhkTrPzzbVNrIJTfg
         1XzQ==
X-Gm-Message-State: AOAM530G0BCsDmBZizl2I6d8Mpy7rYyETpOaILlGwu1QSLknANdBSYVo
        usqYiihbrI8bUckmPU5NWdI=
X-Google-Smtp-Source: ABdhPJxyZZKyky8VpeKa0oZKBtCvFQtDQKh0NHz7gHoYnCoXTmRSjraU8MLDG5kVZX4AVNoj2HbGMQ==
X-Received: by 2002:a05:6000:108c:: with SMTP id y12mr9206195wrw.88.1592664539229;
        Sat, 20 Jun 2020 07:48:59 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:58 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 20/21] arm64: dts: qcom: Add support for Sony Xperia Z5 (SoMC Sumire-RoW)
Date:   Sat, 20 Jun 2020 16:46:36 +0200
Message-Id: <20200620144639.335093-21-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
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
 .../msm8994-sony-xperia-kitakami-sumire.dts   | 410 ++++++++++++++++++
 2 files changed, 411 insertions(+)
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
index 000000000000..3b0a880416c4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
@@ -0,0 +1,410 @@
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
+	model = "SoMC Sumire-ROW";
+	compatible = "somc,sumire-row", "qcom,msm8994";
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <0xcf 0x20001>;
+	qcom,pmic-id = <0x10009 0x1000a 0x00 0x00>;
+	qcom,board-id = <8 0>;
+
+	/* Xperia Z5's firmware doesn't support PSCI */
+	/delete-node/ psci;
+
+	soc {
+		serial@f991e000 {
+			status = "okay";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			pinctrl-1 = <&blsp1_uart2_sleep>;
+		};
+
+		serial@f995e000 {
+			status = "okay";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_uart2_default>;
+			pinctrl-1 = <&blsp2_uart2_sleep>;
+		};
+
+		/* I2C1 is disabled on this board */
+
+		i2c@f9924000 {
+			status = "okay";
+
+			/* NXP NFC */
+		};
+
+		i2c@f9926000 {
+			status = "okay";
+
+			/* Empty but active */
+		};
+
+		i2c@f9967000 {
+			status = "okay";
+
+			/* SMB1357 charger and sii8620 HDMI/MHL bridge */
+		};
+
+		i2c@f9928000 {
+			status = "okay";
+
+			/* Synaptics touchscreen */
+		};
+
+		sdhci@f9824900 {
+			status = "okay";
+
+			/* Downstream pushes 2.95V to the sdhci device,
+			but upstream driver REALLY wants to make vmmc 1.8v
+			cause of the hs400-1_8v mode. MMC works fine without
+			that regulator, so let's not use it for now.
+			vqmmc is also disabled cause driver stll complains.
+
+			vmmc-supply = <&pm8994_l20>;
+			vqmmc-supply = <&pm8994_s4>;
+			*/
+		};
+
+		spi@f9923000 {
+			status = "okay";
+
+			/* FPC fingerprint reader */
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
+&smd_rpm {
+	rpm {
+		rpm_requests {
+			pm8994-regulators {
+				s1 {
+					/* Unused */
+					status = "disabled";
+				};
+
+				s2 {
+					/* Unused */
+					status = "disabled";
+				};
+
+				s3 {
+					regulator-min-microvolt = <1300000>;
+					regulator-max-microvolt = <1300000>;
+				};
+
+				s4 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				s5 {
+					regulator-min-microvolt = <2150000>;
+					regulator-max-microvolt = <2150000>;
+				};
+
+				s7 {
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+				};
+
+				l1 {
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+				};
+
+				l2 {
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <1250000>;
+				};
+
+				l3 {
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+				};
+
+				l4 {
+					regulator-min-microvolt = <1225000>;
+					regulator-max-microvolt = <1225000>;
+				};
+
+				l5 {
+					/* Unused */
+					status = "disabled";
+				};
+
+				l6 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l7 {
+					/* Unused */
+					status = "disabled";
+				};
+
+				l8 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l9 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l10 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l11 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				l12 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l13 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <2950000>;
+				};
+
+				l14 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l15 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l16 {
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <2700000>;
+				};
+
+				l17 {
+					regulator-min-microvolt = <2200000>;
+					regulator-max-microvolt = <2200000>;
+				};
+
+				l18 {
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+					regulator-always-on;
+				};
+
+				l19 {
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+				};
+
+				l20 {
+					regulator-min-microvolt = <2950000>;
+					regulator-max-microvolt = <2950000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				l21 {
+					regulator-min-microvolt = <2950000>;
+					regulator-max-microvolt = <2950000>;
+					regulator-always-on;
+				};
+
+				l22 {
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+				};
+
+				l23 {
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+				};
+
+				l24 {
+					regulator-min-microvolt = <3075000>;
+					regulator-max-microvolt = <3150000>;
+				};
+
+				l25 {
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+				};
+
+				l26 {
+					regulator-min-microvolt = <987500>;
+					regulator-max-microvolt = <987500>;
+				};
+
+				l27 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				l28 {
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+				};
+
+				l29 {
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <2700000>;
+				};
+
+				l30 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l31 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-boot-on;
+				};
+
+				l32 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				lvs1 {
+					/* Downstream sets it to enabled but
+					doesn't specify a voltage range */
+					status = "okay";
+				};
+
+				lvs2 {
+					/* Downstream sets it to enabled but
+					doesn't specify a voltage range */
+					status = "okay";
+				};
+			};
+			pmi8994-regulators {
+				s1 {
+					regulator-min-microvolt = <1025000>;
+					regulator-max-microvolt = <1025000>;
+				};
+
+				s2 {
+					/* Unused */
+					status = "disabled";
+				};
+
+				boost-bypass {
+					regulator-min-microvolt = <3150000>;
+					regulator-max-microvolt = <3600000>;
+				};
+			};
+		};
+	};
+};
\ No newline at end of file
-- 
2.27.0

