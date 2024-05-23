Return-Path: <linux-arm-msm+bounces-20294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9898CCDA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 10:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCB82B22AF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 08:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DFD13DDCB;
	Thu, 23 May 2024 07:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vC3KHeFL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2409013D29C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 07:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716451191; cv=none; b=i9kDK6h8OT+dMftfUNPLWPKIKRIdzQ9LpZuVvi5F1ioEpGyjEHFnH2sVQx8jhKUnxKaQYxZiL1AFEXytcgipqwSmaiY/VFzBXRvnWXsvw7noxzLDJmhfdTKXqp/Mnw7EoxhZmtF0Zz/LcKrVTMbF50tMJT1JRnRkA5ziyvxrBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716451191; c=relaxed/simple;
	bh=EMPeNyzBpqMjF6F7TP+1J/G1NKheB8Yvdxf4QEA8UKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoPQ7hICY0AZSGJ1RLxLqZ3k+sr6pyxYvQJW5I5ybZdDnYKVPMHZ+CCAVcXyJ4l6SLYJe4QJ0ukrL+2Oue6Wr6JCEoIZKtCb/5DfxckvNwPWbNCuzT87Hki2LOIeKi4JAVDMake3W5JQLUOIR4a6Wfe3rRN5TnI5lQ3/22KJC0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vC3KHeFL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a5a5cce2ce6so979368966b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 00:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716451187; x=1717055987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAaEs9RkQ8GaTEt79EKKeWtnQKePqeTaokONVnHxvj4=;
        b=vC3KHeFLTX5ueqkOc4OpSasoRTULlb1xv6tKmlkOXRRH++IksyqD7ip5ecRBwfCvoa
         A2yk9ucmjh5ynRmC2aHvxXPqbABEw/iQBjCrzWpbD1tRfseLAfx9liNqd/cq0tT/Mod2
         1SSeLEJKNIM2+Af80yKzWSQZo9aBjMUhHUHJKT+gKHBKseklAJOySVQ/QqoQdgpSMDgy
         MendY3s4II0x2i9lZOObmdsrTCsSjmpMO/F7RR4zt3/tQq6qsZBZM9+rbCrRR5NLIesG
         +PYaCdk8Cdkc/X+0dpyjR5nrNxTsNSZlwhotIXTCdVqo14eD1XUSSILnzuZ88phnMeJ5
         sn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716451187; x=1717055987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAaEs9RkQ8GaTEt79EKKeWtnQKePqeTaokONVnHxvj4=;
        b=biAlBbK0dde8wY2R7gT3nSFUqhvL2XVuOTJaLmUTw2hJP3UwG0gKhphptYOPhESCUW
         2R1eThaj6H3ejbe3e+mFn15Wy4izIBbUlIVjYn14UtOwAJBKghfRFxBbLexRkD3+BDPL
         AF3n5mTFb3F73juKKQ/Tls5ZWrOjOUkd4mlc2yr4v7FNsd/Y1ByEjPUhtDTADZO81rCZ
         tSuF/Nqy023/sB1zFEKykCKMp11bZS2GO9E8/XwI9RqtDCBaPxEZEtmdvoqZV3SPvHSw
         Cue1UPPn8xsx/0ZgGq4wOBRTwdoWfeXIeYQWKJEpAC7jUyKlz2LJ8OV4DSifLg0n9vCu
         LH1A==
X-Gm-Message-State: AOJu0YwKD0b+JXPIomfXXmD4ZL3aDAIwiiziODZlkAKnkzJ5LkoBPwsQ
	jdjPjIUN87ULWJCJMfuQY1il9gCptoUE++NBTBmIsb9b1S61uoR9c6DmwSTSl1Q=
X-Google-Smtp-Source: AGHT+IFzIRW5KpKYhr1bcsYmnRmMVcvlJKlZWsXcd8k4uOMAlIusT89UAXldyn+Zj9Kv6XaA2ZHUlw==
X-Received: by 2002:a17:906:1b1a:b0:a59:9eab:1630 with SMTP id a640c23a62f3a-a6228170ac8mr251396266b.69.1716451187124;
        Thu, 23 May 2024 00:59:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:982:cbb0:825d:600a:c16:a973])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5ec2a8f320sm719100066b.170.2024.05.23.00.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:59:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 May 2024 09:59:35 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sdm450: add Lenovo Smart Tab M10 DTS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240523-topic-sdm450-upstream-tbx605f-v1-3-e52b89133226@linaro.org>
References: <20240523-topic-sdm450-upstream-tbx605f-v1-0-e52b89133226@linaro.org>
In-Reply-To: <20240523-topic-sdm450-upstream-tbx605f-v1-0-e52b89133226@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7632;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EMPeNyzBpqMjF6F7TP+1J/G1NKheB8Yvdxf4QEA8UKg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmTvdssFfIE2msY0iYo5LB2llo4qkeVujTPB5kY
 2zhBBjDUCiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZk73bAAKCRB33NvayMhJ
 0Qe5D/9TDRmZl5J334RwgT+Dvm0oC8psBIp6gnDjAWUxn8nSItA9dXih21QkImb2UaA1EtIML+B
 PaKqAZq8Rx+1YAxdz7btW7F0/cjCD9m/tUUQKkwghsveCZ9sRlIhYP2ObqCVzx7Lhxy1bIoZAw2
 JfCcOnO9w3Bl7qO2mUqGHzrlhYVnTDs/y2xYI2Uvisz+DnYXD5V2Lv7gaFkFsPFyVjQ6eNBBxhC
 RFnHXrls+4fB7oQtT0lARnnJrGYzUKAorolOI94klTkb2n8qFRZI6iSS7YZZ0JuQ2FW7c193HfR
 fZC3W8TYdxVRFVyncYR+h5EvFlXcultJGw1tI80TbIblke2GesbDBH4um4Z7x40BvLfYzjOQndv
 3UDwxYYiYBTulPVNnDMMb1R5SRiDdv5pBS96Rsd7qKIYMy9Bzml+0Pc8J07bYmmqrlIvZTbGEe1
 8Q9EchtSz7QALsj/egSdEiwA5icrn3lDPW3HrSR4oUfuQ7Ocf9mrznCu00y/zaoV/gPULqP1Z8F
 qxZr1KLbX5mTQsH68qE0ZoJmbiZbf+uM17Fwr7fXU2RnKfIhrIFJJI5uoPiPkBJr+eA4IcTK+Sf
 l0UqcCG10jlJOf3sL0yM6KZ2P5omf1jlkvFpP51lUAZicrmlB2QLVUJde6Gjn9TWjd1l+lOtX93
 psiDbMhkRmxUjrg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This add initial support for the Lenovo Smart Tab M10 (WiFi)
(model tbx605f) which is a 10.1" tablet by Lenovo based on the
SDM450 SoC.

It has a 10.1" LCP touch panel, SDCard slot, Volume+Power buttons,
USB-C port amd front-facing camera (not supported).

The proper LCP Panel support will be added later, for now using the
simeple-framebuffer with the bootloader-initialized video memory.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts | 276 +++++++++++++++++++++
 2 files changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 7d40ec5e7d21..f163eedd2af2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -175,6 +175,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-primus.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-lenovo-thinkpad-x13s.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-lenovo-tbx605f.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-motorola-ali.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts b/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
new file mode 100644
index 000000000000..175befc02b22
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Neil Armstrong <neil.armstrong@linaro.org>
+ */
+/dts-v1/;
+
+#include "sdm450.dtsi"
+#include "pm8953.dtsi"
+#include "pmi8950.dtsi"
+
+/ {
+	model = "Lenovo Smart Tab M10";
+	compatible = "lenovo,tbx605f", "qcom,sdm450";
+	chassis-type = "tablet";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer@90001000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x90001000 0 (1200 * 1920 * 3)>;
+
+			width = <1200>;
+			height = <1920>;
+			stride = <(1200 * 3)>;
+			format = "r8g8b8";
+
+			power-domains = <&gcc MDSS_GDSC>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>,
+				 <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_BYTE0_CLK>,
+				 <&gcc GCC_MDSS_PCLK0_CLK>,
+				 <&gcc GCC_MDSS_ESC0_CLK>;
+		};
+	};
+
+	reserved-memory {
+		other_ext_region@0 {
+			no-map;
+			reg = <0x00 0x84500000 0x00 0x2300000>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		key-volume-up {
+			label = "volume_up";
+			gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&hsusb_phy {
+	vdd-supply = <&pm8953_l3>;
+	vdda-pll-supply = <&pm8953_l7>;
+	vdda-phy-dpdm-supply = <&pm8953_l13>;
+
+	status = "okay";
+};
+
+&i2c_3 {
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5506";
+		reg = <0x38>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <65 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&pm8953_l10>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_active &ts_reset_active>;
+
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1200>;
+		touchscreen-size-y = <1920>;
+	};
+};
+
+&pm8953_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8953-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_s7-supply = <&vph_pwr>;
+		vdd_l1-supply = <&pm8953_s3>;
+		vdd_l2_l3-supply = <&pm8953_s3>;
+		vdd_l4_l5_l6_l7_l16_l19-supply = <&pm8953_s4>;
+		vdd_l8_l11_l12_l13_l14_l15-supply = <&vph_pwr>;
+		vdd_l9_l10_l17_l18_l22-supply = <&vph_pwr>;
+
+		pm8953_s1: s1 {
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <1156000>;
+		};
+
+		pm8953_s3: s3 {
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1224000>;
+		};
+
+		pm8953_s4: s4 {
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8953_l1: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		pm8953_l2: l2 {
+			regulator-min-microvolt = <975000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8953_l3: l3 {
+			regulator-min-microvolt = <925000>;
+			regulator-max-microvolt = <925000>;
+		};
+
+		pm8953_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8953_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8953_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8953_l8: l8 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8953_l9: l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8953_l10: l10 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8953_l11: l11 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8953_l12: l12 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8953_l13: l13 {
+			regulator-min-microvolt = <3125000>;
+			regulator-max-microvolt = <3125000>;
+		};
+
+		pm8953_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8953_l17: l17 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8953_l19: l19 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8953_l22: l22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8953_l23: l23 {
+			regulator-min-microvolt = <975000>;
+			regulator-max-microvolt = <1225000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8953_l8>;
+	vqmmc-supply = <&pm8953_l5>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	vmmc-supply = <&pm8953_l11>;
+	vqmmc-supply = <&pm8953_l12>;
+
+	cd-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_off>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <135 4>;
+
+	ts_int_active: ts-int-active-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_reset_active: ts-reset-active-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <0x08>;
+		bias-pull-up;
+	};
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&wcnss {
+	vddpx-supply = <&pm8953_l5>;
+
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3660b";
+
+	vddxo-supply = <&pm8953_l7>;
+	vddrfa-supply = <&pm8953_l19>;
+	vddpa-supply = <&pm8953_l9>;
+	vdddig-supply = <&pm8953_l5>;
+};

-- 
2.34.1


