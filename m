Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33250207675
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403814AbgFXPC7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404134AbgFXPBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:01:44 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A64CC061573;
        Wed, 24 Jun 2020 08:01:43 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o2so2844667wmh.2;
        Wed, 24 Jun 2020 08:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HvrdsGGU5QETPsz0XtM3uyFsGcnabcIkzEzJv5BB6T8=;
        b=qvFdjUllSWIAtzl9XjaPQmJxr/HCa7XKhUniXWyPxQzz+Q/YoxMx9coKZ+mmzlKrji
         GVeyo/ECKf3mXsTQPYBwqB3oAl4lL3Fu2GTqV4e2oXfiB8amtqobJ9GFAK2EGHe72goa
         wPuYkk8wwY1fdVZfSN1JgTetL9UHF65Nytn08rgGIO7MxW44nbC0y1aS7plAhyX90fIr
         Mhst/8SYc4/ALgxDD2e9w90m1I3cBGWeVL+httKLv3MMtEZgF1fU+BcIUYYGF09IZnOi
         Rv6OLgm2/UXsqZbQb8A9u0I6hiGogKU4uAFo09ZUDuQQ04bSsHbMFaOUiGZ7MEbTue+f
         Ojhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HvrdsGGU5QETPsz0XtM3uyFsGcnabcIkzEzJv5BB6T8=;
        b=NayJFIuMXMwn/V/H6HQ893Tk816BFSuk0yBmGmS+ugng5Dcq8ruQ5iFDe05dTC/qLf
         UCmCSWHzMOd9fzmNEIcInJWHck8g/seblX/1QflZOGHERirKnFXzZTApvoXSJwE8Myjt
         hmi1I/bJGZYHLKppAt15C+h7GMG9HPOj8G++WsAhUtuoYQH//U2mCiLEk3jDDbgrX+oD
         4+kMQPT9rLypRbGxarzTURLDQCuNoixFbmwrq2fIcXo5tWP+cKSnou9YmXtoo3KwlwCR
         3VYikfhMPv+mnADqPrElJxS/SXcCoZJISZFojmlneUrWazUvonPvG6SRy9+PAjkfwIiy
         9qow==
X-Gm-Message-State: AOAM532WMDCPTp/1i+uI8A+KMKB/JLPYetuP9Ut9psc4CYTTvjGj/b8t
        geO0ob4LhinXoZq7La6OiW4=
X-Google-Smtp-Source: ABdhPJwllyvVtZ5u9hdjwkrQ32Hcu1VAr/TsH1w1PYy8uU23l23JByNC/Kj7uZ9hACCuJm7kWgQrSQ==
X-Received: by 2002:a7b:cc17:: with SMTP id f23mr29203691wmh.41.1593010902203;
        Wed, 24 Jun 2020 08:01:42 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id s8sm21339390wru.38.2020.06.24.08.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:01:41 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] arm64: dts: qcom: Add support for Sony Xperia Z5 (SoMC Sumire-RoW)
Date:   Wed, 24 Jun 2020 17:01:06 +0200
Message-Id: <20200624150107.76234-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624150107.76234-1-konradybcio@gmail.com>
References: <20200624150107.76234-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree support for the Sony Xperia Z5 smartphone.
It's based on Sony Kitakami platform (msm8994) and hence
a Kitakami-common DTSI has been created so as to reduce
clutter when remaining devices are added.

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
 .../msm8994-sony-xperia-kitakami-sumire.dts   |  13 +
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    | 235 ++++++++++++++++++
 3 files changed, 249 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi

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
index 000000000000..e4ae6600be9d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "msm8994-sony-xperia-kitakami.dtsi"
+
+/ {
+	model = "Sony Xperia Z5";
+	compatible = "somc,sumire-row", "qcom,msm8994";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
new file mode 100644
index 000000000000..4032b7478f04
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+#include "msm8994.dtsi"
+#include "pm8994.dtsi"
+#include "pmi8994.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+/ {
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <0xcf 0x20001>;
+	qcom,pmic-id = <0x10009 0x1000a 0x00 0x00>;
+	qcom,board-id = <8 0>;
+
+	/* Kitakami firmware doesn't support PSCI */
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
+&rpm_requests {
+	pm8994_regulators: pm8994-regulators {
+		compatible = "qcom,rpm-pm8994-regulators";
+		vdd_l1-supply = <&pm8994_s1>;
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
+		pm8994_s1: s1 {};
+		pm8994_s2: s2 {};
+		pm8994_s3: s3 {};
+		pm8994_s4: s4 {};
+		pm8994_s5: s5 {};
+		pm8994_s6: s6 {};
+		pm8994_s7: s7 {};
+
+		pm8994_l1: l1 {};
+		pm8994_l2: l2 {};
+		pm8994_l3: l3 {};
+		pm8994_l4: l4 {};
+		pm8994_l6: l6 {};
+		pm8994_l8: l8 {};
+		pm8994_l9: l9 {};
+		pm8994_l10: l10 {};
+		pm8994_l11: l11 {};
+		pm8994_l12: l12 {};
+		pm8994_l13: l13 {};
+		pm8994_l14: l14 {};
+		pm8994_l15: l15 {};
+		pm8994_l16: l16 {};
+		pm8994_l17: l17 {};
+		pm8994_l18: l18 {};
+		pm8994_l19: l19 {};
+		pm8994_l20: l20 {};
+		pm8994_l21: l21 {};
+		pm8994_l22: l22 {};
+		pm8994_l23: l23 {};
+		pm8994_l24: l24 {};
+		pm8994_l25: l25 {};
+		pm8994_l26: l26 {};
+		pm8994_l27: l27 {};
+		pm8994_l28: l28 {};
+		pm8994_l29: l29 {};
+		pm8994_l30: l30 {};
+		pm8994_l31: l31 {};
+		pm8994_l32: l32 {};
+
+		pm8994_lvs1: lvs1 {};
+		pm8994_lvs2: lvs2 {};
+	};
+
+	pmi8994_regulators: pmi8994-regulators {
+		compatible = "qcom,rpm-pmi8994-regulators";
+
+		pmi8994_s1: s1 {};
+		pmi8994_s2: s2 {};
+		pmi8994_s3: s3 {};
+		pmi8994_bby: boost-bypass {};
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

