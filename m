Return-Path: <linux-arm-msm+bounces-41526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1E69ECFFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F18C18871E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167631D31A9;
	Wed, 11 Dec 2024 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epdCgjm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0861A4F22;
	Wed, 11 Dec 2024 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931580; cv=none; b=HxVN7eIdEUe67lUeJaFNIGFCgXgNJdDgLdD1+F9qKLlcwb3eHmSuxnL3z32jBwA4Wz0Hnz033ffE0Zm0g0OluhyOzg187X5aoq+CrrKkwzM9dpOOyIT0oMVCbEtZthje2PRUCi8PqmUh0IQeqhHJsp1KXwq7xz7uvag/vpsjgYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931580; c=relaxed/simple;
	bh=kJEE1nXzafKrx8Tz55Ui5PUPJ12nhVKxPwE08BME8kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDav0hkXO1uaT2B9fMHgkqABOmxDrDNSLo36i9twb/Bp1oEIg4fHOQIjRbGCNWp43XmOM2bOW6BRJa70Sm3eltN8qTq8F1konQfhm1j602mlJ9fpvODrB8xDLZYb7IjmSdbybnHypwsUFWZz7/PeIac+L4HkS2PaY3trHYPbnpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epdCgjm+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2161eb94cceso34828445ad.2;
        Wed, 11 Dec 2024 07:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733931577; x=1734536377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txG0vPmLqvNdmPJuxrU88gdKCSKysCJXhHOLDEJZer8=;
        b=epdCgjm+PyRH63pKLwOPBx46pQguZASzpdLP3MuYUmJCZwbjjugsaJJppDWCP26jhe
         eaphmo5hrc+loWX0P5sUvNgsu9udVNRNbVYjOWQUT6p5tO/oInEr9FAxHOd76ESepbi0
         /tlbzdlS4bsIH3IeT10ksgEm11dVj9VzJ7EB9DEl1gAGAN1VjvmOTP36yJfF1ibtwfZ6
         3Sz3IBUqcjsiq7TSxMK3/jLjou42LrB9EWVLVyEUr/BIm9ROqIo5Ss5mY0/PofpX9Pll
         RnDgAGdv5aBHb4tVThKDDLtk/4rBgRmFomVUd+jorrBbfPLXr2AhF0CrhgPn2NlZIArs
         kniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931577; x=1734536377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txG0vPmLqvNdmPJuxrU88gdKCSKysCJXhHOLDEJZer8=;
        b=SXNWJnrL6rjKyBKpuiHL9M+ArxIAxv3Wg0l9uOq4w9RzyxLkC75xXQqLnYZzo2vDKY
         wQtYNWqCswNNjivKGpMxLCkSoqvWAz89U9ttqprFNo5Hg7/AKHMCi18ozedCA/90Qg8O
         R8bz1Bg2yOHYuWdjDhbeMihafx/3hPv4rg7g2mxTMC9HYFYOnOfgm0CMcwFXVkHe39x1
         LnUEiGPpcvJGOX4bznajTo+RgF0RZQW8Dev3NayLlEkpWRb/BnyKqaKCVaTBtBMkKAX9
         gXuWg5wkZzIS7JTovY6fojKzh/spzfsTwF8osc9PZ/mdibZ95ZDzqRRpPGENrQ1RUbrN
         bOMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtG2HDJjvknWIfrtWHSnQhja+IjRa4PQ+dG7Pk+84OYaM64xO4gy4WgLPqCmoaQcLwYmpb//t3Yw/coqn9Ow==@vger.kernel.org, AJvYcCWjGimPRbHXJMaJbrpjQm2wjK6xmMTmLO1CaMzp+Rz15h27hErx1bt5BcV4E8dgQR+7UAk9tGHtQkTi@vger.kernel.org, AJvYcCXZzUvZhG9B1odo7Hj8vlWFrW7d06cgm5kllKK6llA9qEHFZNmCl0fqwIY4m9iYEH1AIZxh5PAa80wV1TVM@vger.kernel.org
X-Gm-Message-State: AOJu0YzW4HCtFx/zYPGtrQaBZ/GBs2mFQN9E4EzoQWs2NWIDbcGUie4j
	zfKy2SHk+Gj9Mo6DPxuLo+57aJKYHMlbdd9Loy037WCAU6zrIG4a
X-Gm-Gg: ASbGncsm5TCuCsjhX7fuqaWDw22/xhW/s3TcWFiZj0zQfYH7kSPweN9bMkiJ/6tWaTw
	XlNOHphacFo8ZK5jWizXcpCN/z8HP+d1fAu9AOTsbwhH7UvPYETLADWyzW5rkM/JB45fsOGAz8m
	0MB2XbhBFqoJfhJ6G8vX9FtaV3QQE9so3KX/Db4enrhskIWIe6uNCQtlCmskHd2UAXpjRvqWQJ/
	VSDMN/TZhxx0gFAJdDuUsxxo9lUoJ1aYEfled9XgQg0ViMkQkzr
X-Google-Smtp-Source: AGHT+IEPhdJv4GnnIC1LdALbREiTIOw05U78hdY5/IECSTI8kCn22ko7tlYo86aRQFbQ87N6k1+NUg==
X-Received: by 2002:a17:903:1212:b0:215:4a4e:9262 with SMTP id d9443c01a7336-2177838c33cmr52531095ad.8.1733931576668;
        Wed, 11 Dec 2024 07:39:36 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2163d978286sm62357965ad.277.2024.12.11.07.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:39:35 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gty0622@gmail.com,
	chenxuecong2009@outlook.com,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Wed, 11 Dec 2024 23:37:54 +0800
Message-ID: <20241211153754.356476-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211153754.356476-1-mitltlatltl@gmail.com>
References: <20241211153754.356476-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an initial devicetree for the Huawei Matebook E Go, which is based on
sc8280xp.

There are 3 variants, Huawei released first 2 at the same time.
Huawei Matebook E Go LTE(sc8180x), codename should be gaokun2.
Huawei Matebook E Go(sc8280xp@3.0GHz), codename is gaokun3.
Huawei Matebook E Go 2023(sc8280xp@2.69GHz).

We add support for the latter two variants.

This work started by Tianyu Gao and Xuecong Chen, they made the
devicetree based on existing work(i.e. the Lenovo X13s and the
Qualcomm CRD), it can boot with framebuffer.

Original work: https://github.com/matalama80td3l/matebook-e-go-boot-works/blob/main/dts/sc8280xp-huawei-matebook-e-go.dts

Later, I got my device, I continue their work.

Supported features:
- adsp
- bluetooth (connect issue)
- charge (with a lower power)
- framebuffer
- gpu
- keyboard (via internal USB)
- pcie devices (wifi and nvme, no modem)
- speakers and microphones
- tablet mode switch
- touchscreen
- usb
- volume key and power key

Some key features not supported yet:
- battery and charger information report (EC driver required)
- built-in display (cannot enable backlight yet)
- charging thresholds control (EC driver required)
- camera
- LID switch detection (EC driver required)
- USB Type-C altmode (EC driver required)
- USB Type-C PD (EC driver required)

I have finished the EC driver, once this series are upstreamed,
I will submit a series of patches to enable EC support.

Signed-off-by: Tianyu Gao <gty0622@gmail.com>
Signed-off-by: Xuecong Chen <chenxuecong2009@outlook.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 1332 +++++++++++++++++
 2 files changed, 1333 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6ca8db4b8..00d02cf5f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -195,6 +195,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-lenovo-flex-5g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-primus.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-huawei-gaokun3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-lenovo-thinkpad-x13s.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-arcata.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
new file mode 100644
index 000000000..98732754e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -0,0 +1,1332 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Linaro Limited
+ *
+ * Copyright (c) 2024, Tianyu Gao <gty0622@gmail.com>
+ * Copyright (c) 2024, Xuecong Chen <chenxuecong2009@outlook.com>
+ *
+ * Copyright (c) 2024, Pengyu Luo <mitltlatltl@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/phy/phy.h>
+
+#include "sc8280xp.dtsi"
+#include "sc8280xp-pmics.dtsi"
+
+/ {
+	chassis-type = "tablet";
+	model = "Matebook E Go";
+	compatible = "huawei,gaokun3", "qcom,sc8280xp";
+	
+	aliases {
+		i2c4 = &i2c4;
+		serial1 = &uart2;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@c6200000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xC6200000 0x0 0x02400000>;
+			width = <1600>;
+			height = <2560>;
+			stride = <(1600 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	wcd938x: audio-codec {
+		compatible = "qcom,wcd9380-codec";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcd_default>;
+
+		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_s10b>;
+		vdd-rxtx-supply = <&vreg_s10b>;
+		vdd-io-supply = <&vreg_s10b>;
+		vdd-mic-bias-supply = <&vreg_bob>;
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		#sound-dai-cells = <1>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&mode_pin_active>, <&vol_up_n>;
+
+		switch-mode {
+			gpios = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_TABLET_MODE>;
+			debounce-interval = <10>;
+			wakeup-source;
+		};
+
+		key-vol-up {
+			label = "Volume Up";
+			gpios = <&pmc8280_1_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+	};
+
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VCC3B";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8280_1_gpios 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&misc_3p3_reg_en>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VCC3_SSD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 135 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&nvme_reg_en>;
+
+		regulator-boot-on;
+	};
+
+	vreg_vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VPH_VCC3R9";
+		regulator-min-microvolt = <3900000>;
+		regulator-max-microvolt = <3900000>;
+
+		regulator-always-on;
+	};
+
+	vreg_wlan: regulator-wlan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VCC_WLAN_3R9";
+		regulator-min-microvolt = <3900000>;
+		regulator-max-microvolt = <3900000>;
+
+		gpio = <&pmr735a_gpios 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hastings_reg_en>;
+
+		regulator-boot-on;
+	};
+
+	reserved-memory {
+		gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	thermal-zones {
+		skin-temp-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&pmk8280_adc_tm 5>;
+
+			trips {
+				skin_temp_alert0: trip-point0 {
+					temperature = <55000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin_temp_alert1: trip-point1 {
+					temperature = <58000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin-temp-crit {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&skin_temp_alert0>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&skin_temp_alert1>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&bt_default>, <&wlan_en>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 132 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_s10b>;
+		vddaon-supply = <&vreg_s12b>;
+		vddpmu-supply = <&vreg_s12b>;
+		vddpmumx-supply = <&vreg_s12b>;
+		vddpmucx-supply = <&vreg_s12b>;
+		vddrfa0p95-supply = <&vreg_s12b>;
+		vddrfa1p3-supply = <&vreg_s11b>;
+		vddrfa1p9-supply = <&vreg_s1c>;
+		vddpcie1p3-supply = <&vreg_s11b>;
+		vddpcie1p9-supply = <&vreg_s1c>;
+
+		regulators {
+			vreg_pmu_rfa_cmn_0p8: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			};
+
+			vreg_pmu_aon_0p8: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p8";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p8: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p8";
+			};
+
+			vreg_pmu_btcmx_0p8: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p8";
+			};
+
+			vreg_pmu_pcie_1p8: ldo5 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo6 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_rfa_0p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo8 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo9 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8350-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-l1-l4-supply = <&vreg_s12b>;
+		vdd-l2-l7-supply = <&vreg_bob>;
+		vdd-l3-l5-supply = <&vreg_s11b>;
+		vdd-l6-l9-l10-supply = <&vreg_s12b>;
+		vdd-l8-supply = <&vreg_s12b>;
+
+		vreg_s10b: smps10 {
+			regulator-name = "vreg_s10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_s11b: smps11 {
+			regulator-name = "vreg_s11b";
+			regulator-min-microvolt = <1272000>;
+			regulator-max-microvolt = <1272000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s12b: smps12 {
+			regulator-name = "vreg_s12b";
+			regulator-min-microvolt = <984000>;
+			regulator-max-microvolt = <984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b: ldo1 {
+			regulator-name = "vreg_l1b";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b: ldo5 {
+			regulator-name = "vreg_l5b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8350c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-bob-supply = <&vreg_vph_pwr>;
+		vdd-l1-l12-supply = <&vreg_s1c>;
+		vdd-l2-l8-supply = <&vreg_s1c>;
+		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob>;
+		vdd-l6-l9-l11-supply = <&vreg_bob>;
+		vdd-l10-supply = <&vreg_s11b>;
+
+		vreg_s1c: smps1 {
+			regulator-name = "vreg_s1c";
+			regulator-min-microvolt = <1880000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		/* s2c, s3c */
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12c: ldo12 {
+			regulator-name = "vreg_l12c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13c: ldo13 {
+			regulator-name = "vreg_l13c";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-always-on;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8350-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vdd-l1-l4-supply = <&vreg_s11b>;
+		vdd-l2-l7-supply = <&vreg_bob>;
+		vdd-l3-l5-supply = <&vreg_s11b>;
+		vdd-l6-l9-l10-supply = <&vreg_s12b>;
+		vdd-l8-supply = <&vreg_s12b>;
+
+		/* s10d, s11d, s12d */
+
+		vreg_l2d: ldo2 {
+			regulator-name = "vreg_l2d";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3d: ldo3 {
+			regulator-name = "vreg_l3d";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4d: ldo4 {
+			regulator-name = "vreg_l4d";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6d: ldo6 {
+			regulator-name = "vreg_l6d";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7d: ldo7 {
+			regulator-name = "vreg_l7d";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8d: ldo8 {
+			regulator-name = "vreg_l8d";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9d: ldo9 {
+			regulator-name = "vreg_l9d";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10d: ldo10 {
+			regulator-name = "vreg_l10d";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&dispcc0 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sc8280xp/HUAWEI/gaokun3/qcdxkmsuc8280.mbn";
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_default>;
+
+	status = "okay";
+
+	touchscreen@4f {
+		compatible = "hid-over-i2c";
+		reg = <0x4f>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_s10b>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts0_default>;
+
+	};
+
+};
+
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_0_qmpphy_dp_in>;
+};
+
+&mdss0_dp1 {
+	status = "okay";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
+&pcie2a {
+	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2a_default>;
+
+	status = "okay";
+};
+
+&pcie2a_phy {
+	vdda-phy-supply = <&vreg_l6d>;
+	vdda-pll-supply = <&vreg_l4d>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	max-link-speed = <2>;
+
+	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_wlan>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_default>;
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+
+		/* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
+		 * there is no calibrate data for huawei,
+		 * but they have the same subsystem-device id
+		 */
+		qcom,ath11k-calibration-variant = "LE_X13S";
+	};
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l6d>;
+	vdda-pll-supply = <&vreg_l4d>;
+
+	status = "okay";
+};
+
+&pmk8280_adc_tm {
+	status = "okay";
+
+	sys-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@1 {
+		reg = <1>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@2 {
+		reg = <2>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@3 {
+		reg = <3>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@4 {
+		reg = <4>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@5 {
+		reg = <5>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@6 {
+		reg = <6>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@7 {
+		reg = <7>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+};
+
+&pmk8280_pon_pwrkey {
+	status = "okay";
+};
+
+&pmk8280_pon_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
+&pmk8280_rtc {
+	nvmem-cells = <&rtc_offset>;
+	nvmem-cell-names = "offset";
+
+	status = "okay";
+};
+
+&pmk8280_sdam_6 {
+	status = "okay";
+
+	rtc_offset: rtc-offset@bc {
+		reg = <0xbc 0x4>;
+	};
+};
+
+&pmk8280_vadc {
+	channel@144 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm1";
+	};
+
+	channel@145 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm2";
+	};
+
+	channel@146 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm3";
+	};
+
+	channel@147 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm4";
+	};
+
+	channel@344 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm5";
+	};
+
+	channel@345 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm6";
+	};
+
+	channel@346 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm7";
+	};
+
+	channel@347 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm8";
+	};
+};
+
+&qup0 {
+	status = "okay";
+};
+
+&qup1 {
+	status = "okay";
+};
+
+&qup2 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sc8280xp/HUAWEI/gaokun3/qcadsp8280.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_nsp0 {
+	firmware-name = "qcom/sc8280xp/HUAWEI/gaokun3/qccdsp8280.mbn";
+
+	status = "okay";
+};
+
+&rxmacro {
+	status = "okay";
+};
+
+&sound {
+	compatible = "qcom,sc8280xp-sndcard";
+	model = "SC8280XP-HUAWEI-MATEBOOKEGO";
+	audio-routing =
+		"SpkrLeft IN", "WSA_SPK1 OUT",
+		"SpkrRight IN", "WSA_SPK2 OUT",
+		"IN1_HPHL", "HPHL_OUT",
+		"IN2_HPHR", "HPHR_OUT",
+		"AMIC2", "MIC BIAS2",
+		"VA DMIC0", "MIC BIAS1",
+		"VA DMIC1", "MIC BIAS1",
+		"VA DMIC2", "MIC BIAS3",
+		"VA DMIC0", "VA MIC BIAS1",
+		"VA DMIC1", "VA MIC BIAS1",
+		"VA DMIC2", "VA MIC BIAS3",
+		"TX SWR_ADC1", "ADC2_OUTPUT";
+
+	wcd-playback-dai-link {
+		link-name = "WCD Playback";
+		cpu {
+			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+		};
+
+		codec {
+			sound-dai = <&wcd938x 0>, <&swr1 0>, <&rxmacro 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wcd-capture-dai-link {
+		link-name = "WCD Capture";
+		cpu {
+			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+		};
+
+		codec {
+			sound-dai = <&wcd938x 1>, <&swr2 0>, <&txmacro 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wsa-dai-link {
+		link-name = "WSA Playback";
+		cpu {
+			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+		};
+
+		codec {
+			sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&wsamacro 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	va-dai-link {
+		link-name = "VA Capture";
+		cpu {
+			sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+
+		codec {
+			sound-dai = <&vamacro 0>;
+		};
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	left_spkr: wsa8830-left@0,1 {
+		compatible = "sdw10217020200";
+		reg = <0 1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&spkr_1_sd_n_default>;
+		powerdown-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
+		#thermal-sensor-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#sound-dai-cells = <0>;
+		vdd-supply = <&vreg_s10b>;
+	};
+
+	right_spkr: wsa8830-right@0,2 {
+		compatible = "sdw10217020200";
+		reg = <0 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&spkr_2_sd_n_default>;
+		powerdown-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
+		#thermal-sensor-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#sound-dai-cells = <0>;
+		vdd-supply = <&vreg_s10b>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	wcd_rx: wcd9380-rx@0,4 {
+		compatible = "sdw20217010d00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	wcd_tx: wcd9380-tx@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
+&txmacro {
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+
+		max-speed = <3200000>;
+	};
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_0_hsphy {
+	vdda-pll-supply = <&vreg_l9d>;
+	vdda18-supply = <&vreg_l1c>;
+	vdda33-supply = <&vreg_l7d>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l9d>;
+	vdda-pll-supply = <&vreg_l4d>;
+
+	orientation-switch;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_dp_in {
+	remote-endpoint = <&mdss0_dp0_out>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l4b>;
+	vdda18-supply = <&vreg_l1c>;
+	vdda33-supply = <&vreg_l13c>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l4b>;
+	vdda-pll-supply = <&vreg_l3b>;
+
+	orientation-switch;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss0_dp1_out>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_hsphy0 {
+	vdda-pll-supply = <&vreg_l1b>;
+	vdda18-supply = <&vreg_l1c>;
+	vdda33-supply = <&vreg_l7d>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy1 {
+	vdda-pll-supply = <&vreg_l8d>;
+	vdda18-supply = <&vreg_l1c>;
+	vdda33-supply = <&vreg_l7d>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy2 {
+	vdda-pll-supply = <&vreg_l10d>;
+	vdda18-supply = <&vreg_l8c>;
+	vdda33-supply = <&vreg_l2d>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy3 {
+	vdda-pll-supply = <&vreg_l10d>;
+	vdda18-supply = <&vreg_l8c>;
+	vdda33-supply = <&vreg_l2d>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy0 {
+	vdda-phy-supply = <&vreg_l1b>;
+	vdda-pll-supply = <&vreg_l4d>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy1 {
+	vdda-phy-supply = <&vreg_l8d>;
+	vdda-pll-supply = <&vreg_l4d>;
+
+	status = "okay";
+};
+
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_s10b>;
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
+&venus {
+	firmware-name = "qcom/sc8280xp/HUAWEI/gaokun3/qcvss8280.mbn";
+	status = "okay";
+};
+
+&wsamacro {
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
+
+/* PINCTRL */
+
+&lpass_tlmm {
+	status = "okay";
+};
+
+&pmc8280_1_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio1";
+		function = "normal";
+	};
+
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+		bias-pull-up;
+	};
+};
+
+&pmr735a_gpios {
+	hastings_reg_en: hastings-reg-en-state {
+		pins = "gpio1";
+		function = "normal";
+	};
+};
+
+&tlmm {
+
+	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 4>;
+
+	bt_default: bt-default-state {
+		hstp-bt-en-pins {
+			pins = "gpio133";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		hstp-sw-ctrl-pins {
+			pins = "gpio132";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
+	i2c4_default: i2c4-default-state {
+		pins = "gpio171", "gpio172";
+		function = "qup4";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	mode_pin_active: mode-pin-state {
+		pins = "gpio26";
+		function = "gpio";
+		bias-disable;
+	};
+
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio135";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie2a_default: pcie2a-default-state {
+		clkreq-n-pins {
+			pins = "gpio142";
+			function = "pcie2a_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio143";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+		       pins = "gpio145";
+		       function = "gpio";
+		       drive-strength = <2>;
+		       bias-pull-up;
+	       };
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio140";
+			function = "pcie4_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio141";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio139";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	spkr_1_sd_n_default: spkr-1-sd-n-default-state {
+		perst-n-pins {
+			pins = "gpio178";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+			output-high;
+		};
+	};
+
+	spkr_2_sd_n_default: spkr-2-sd-n-default-state {
+		perst-n-pins {
+			pins = "gpio179";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+			output-high;
+		};
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio175";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio99";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+			output-high;
+		};
+	};
+
+	uart2_default: uart2-default-state {
+		cts-pins {
+			pins = "gpio121";
+			function = "qup2";
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio122";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio124";
+			function = "qup2";
+			bias-pull-up;
+		};
+
+		tx-pins {
+			pins = "gpio123";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	wcd_default: wcd-default-state {
+		reset-pins {
+			pins = "gpio106";
+			function = "gpio";
+			bias-disable;
+		};
+	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio134";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+};
-- 
2.47.1


