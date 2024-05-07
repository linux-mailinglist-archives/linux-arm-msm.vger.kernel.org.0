Return-Path: <linux-arm-msm+bounces-19448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B58098BF2F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 02:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B23D1F21ACD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 00:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0BC13049B;
	Tue,  7 May 2024 23:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="otcJOWPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043612FF65
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715124544; cv=none; b=O1vr5uNV7RqRbtz+qfymjq3vvQYlgR3pw/VtIe1kO6awDQFdfYOYmPaCBVjHPF8wyUi/2H5i2C8sO2inQeKIQ4jIS7ZoXzQz3cyJHMJCK93grawxFipaZQYUKghMxAjn/MWrgYr/EAIZwfKhpvIfx3GFHqI+3SjexShpmaM/jJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715124544; c=relaxed/simple;
	bh=TuctyQ+GOgMUd02Xhdd6ATMys5yxhnJ40ze+oicA8p4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hvlcvr3bQgSgmXxTacGdnzSr/jlM1NF/fcN3eqhfqtLXm9n51skXD5q01iWQCjPmYuW5WIW9fKlrqpxUfW/r2Wjj8Drk45URpb7DFo+WthDV+lWGSV608oXh2A9bINgTZ1z0eMAHwYiORR5tSwpWFWSW31LY8pHgpKqvv2bLtqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=otcJOWPk; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a59a9d66a51so839433766b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 16:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715124540; x=1715729340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vT/uHhRJY0ocqTylTZiV74SydB2V2zaXyYqUUXACaCY=;
        b=otcJOWPkZOzz+DUjAX7stYavJ5oxy2aRD0Lr6fzU/bIlHUUPnWHAElIIMcgKWZdAqW
         Y4rXVxe0BLhteZDA3AYoEpJOGZuRWLK5GdtfoVZM37N4LUKe0QY9cupgveCiSShbQ7H+
         CARgh3XUB6ojRWNgW2Rcs2E9RK4c7RoQ6EkkuOdMLsM7HCZ+DMncpqLkLfxfmF4/ebbF
         cyqINRupxbDJ2u33ol4PULz/oPuK4g+3is9GyuSeBpG+SNgatAnAPBZ5L6xJ9qFiAR7Q
         IRyhQtNyTH3wZpuEn+jOuB+7vO/NSRyPKOocc8lQre3Q1jfuNmHzniyS4lUf92YDWGqY
         Sd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715124540; x=1715729340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vT/uHhRJY0ocqTylTZiV74SydB2V2zaXyYqUUXACaCY=;
        b=IO4pg9AK5sGKjVayJwrKmM4mWXN1QqkQoA05M4kfk6r7mTrRLl/po8UDuv0EpqG4Mq
         vOlAM5B1qDtGLo9koZpS3Z/QEjbD3LiOjgcwP5yWzuT+EEthmokDTYBlv54++U1oZcdv
         tmknuU4Fn63T1Tf2ZA9wzLMUbm709BVPxh2TRlGfyJcwOTFEcy7QiJ2agGzKzpz5VDxo
         w2UlTLfKU4cvA4/k/HFUzLOwLF2jlLz+0I4G2DI6ajRAgxb3WqFIhc1AO6HyrPDuC/1a
         uBN094TgF16HjlO8wkfgLkJV7RDYM512+Z8F/UN5i4naAnzOKUQKljigUTeJPd9VmFaZ
         ydNA==
X-Forwarded-Encrypted: i=1; AJvYcCUukt1Za9ZhrK0YnyXhgFXHZNO2NhuDGuuU0H+esVm7iWT3k7oKQPnOIXA9WS6CRRlHreIFMEBhetyvb1ZVoZ240BbxnuxM7eYiKIBPwQ==
X-Gm-Message-State: AOJu0YwnmG8x8+57bZWzJzOqB4d9e+EpphNWK9NwGzYTEHqCLszCP2Ji
	QBFbRrFPKozDQfEqGMec8s+qpWqZJSpUa4QdLI61Hxdk6SQj8L/2BQPCb/pFOABlM+CFUNqc8In
	emBeYyw==
X-Google-Smtp-Source: AGHT+IGdPnZ4kBo3OgreC7qx8y1sGiYv4b9js3r52tNu59bP6V6P5NI8Uog80NGuJTbeIPcNzY+StQ==
X-Received: by 2002:a50:d595:0:b0:56e:2b1c:d013 with SMTP id 4fb4d7f45d1cf-5731d9f0cebmr816610a12.21.1715124539804;
        Tue, 07 May 2024 16:28:59 -0700 (PDT)
Received: from [192.168.0.113] ([2a02:8109:aa0d:be00::8bb3])
        by smtp.gmail.com with ESMTPSA id f20-20020a056402195400b005725c56b35bsm6851841edz.71.2024.05.07.16.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 16:28:59 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Wed, 08 May 2024 01:28:48 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: add QCM6490 SHIFTphone 8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-otter-bringup-v1-2-c807d3d931f6@linaro.org>
References: <20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org>
In-Reply-To: <20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Martinz <amartinz@shiftphones.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=22982;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=TuctyQ+GOgMUd02Xhdd6ATMys5yxhnJ40ze+oicA8p4=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmOrk3T28vZEKsb7tP+8uf/JeYH2bzLcjjVyRYd
 kTlkDT9SACJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZjq5NwAKCRAFgzErGV9k
 tqwCEACi0dJGEqVv3A/h2lyP6msvH+w4ReQHaBgtYcQqrV+6qZB9hNSTHgrzB+ihxYDSMqvbmzW
 N6YXZpS3p510Qs5Zon0EIiFgJgpjMoRaou03Fs5Hzt7oqLypagcpCCRudy8C25l5d7qT1DXxbra
 1S5J5gqwlqo3vZTjXygK7YJ89qZAnT/qXo5nSyWe1fp2nzlP+sBJaDKDVbTpWEv5mjeAsG138st
 ExJXLVO56usQ1xjdc8e6c/CAV09gCvw2rXZQPcQTimIHqEKqhjI4Ohlmh0iUSg54RH8FRHFSFM2
 cPUa7RzbGvi5lgouX+lvDPzzEooe1PyTAYs6fO5DNz80I98hmb6Weh8QKMxn0JjsVtWOb0hI1TZ
 Y2zaadSp7ebzfnijotoMdnZoVmwDc7l5Qewsk/mj2a3+a7VHSrf+SNzrXv7ehnshEZVqQaP1Kn/
 XH1nMhq748nZwGTK2RNd3nmDW5Rkbrd3zncp0cND8nDvogT4LCJkaweVxiMvds8LTQGYtZXPRz5
 V0gtkTAXrgYKQRtxNgfTox3MHdF1XGZX9FV5UebpF1OP1PQbbeuyM+qMfoTu4LDyQWr7OyqjF9c
 cjm9i++5zT1ijBU9RuCFTuhCedHZNH2l+G6t8aYXiUm/Fw/+21jJy7ATn7fC09rfnA4k2CmFHGX
 5RLdn2B0eg+RmJw==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

The SHIFTphone 8 is an upcoming QCM6490 smartphone, it has the following
features:

* 12GB of RAM, 512GB UFS storage
* 1080p display.
* Hardware kill switches for cameras and microphones
* UART access via type-c SBU pins (enabled by an internal switch)

Initial support includes:

* Framebuffer display
* UFS and sdcard storage
* Battery monitoring and USB role switching via pmic glink
* Bluetooth
* Thermals

Wifi is not yet functional due to a crash in the remoteproc
firmware.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile                |   1 +
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 938 +++++++++++++++++++++++
 2 files changed, 939 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 7d40ec5e7d21..678e800ac797 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -92,8 +92,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
new file mode 100644
index 000000000000..ceef8b9b2414
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -0,0 +1,938 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Based largely on Fairphone 5 DT.
+ *
+ * Copyright (c) 2023, Luca Weiss <luca.weiss@fairphone.com>
+ * Copyright (c) 2024, Caleb Connolly <caleb.connolly@linaro.org>
+ */
+
+/dts-v1/;
+
+#define PM7250B_SID 8
+#define PM7250B_SID1 9
+
+#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sc7280.dtsi"
+#include "pmk8350.dtsi" /* PMK7325 */
+#include "pm7325.dtsi"
+#include "pm8350c.dtsi"
+#include "pm7250b.dtsi"
+
+/* There is also a pmr735a */
+
+/delete-node/ &rmtfs_mem;
+
+/ {
+	model = "SHIFT SHIFTphone 8";
+	compatible = "shift,otter", "qcom,qcm6490";
+	chassis-type = "handset";
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
+		stdout-path = "serial0:115200n8";
+
+		framebuffer0: framebuffer@a000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xe1000000 0x0 (2400 * 1080 * 4)>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_down_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume up";
+			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,qcm6490-pmic-glink", "qcom,pmic-glink";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&fsa4480_sbu_mux>;
+					};
+				};
+			};
+		};
+	};
+
+	reserved-memory {
+		cont_splash_mem: cont-splash@e1000000 {
+			reg = <0x0 0xe1000000 0x0 0x2300000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@88f00000 {
+			reg = <0x0 0x88f00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@f8500000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0xf8500000 0x0 0x600000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>, <QCOM_SCM_VMID_NAV>;
+		};
+	};
+
+	thermal-zones {
+		camera-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		chg-skin-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm7250b_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		conn-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm7250b_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		quiet-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		rear-cam-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 4>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sdm-skin-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 3>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		xo-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
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
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
+		};
+
+		vreg_l1b: ldo1 {
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <925000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <910000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			/* Constrained for UFS VCC, at least until UFS driver scales voltage */
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-min-microvolt = <751000>;
+			regulator-max-microvolt = <824000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-min-microvolt = <530000>;
+			regulator-max-microvolt = <824000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-min-microvolt = <765000>;
+			regulator-max-microvolt = <1020000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
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
+&gcc {
+	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
+			<GCC_EDP_CLKREF_EN>,
+			<GCC_MSS_CFG_AHB_CLK>,
+			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
+			<GCC_MSS_OFFLINE_AXI_CLK>,
+			<GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			<GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+			<GCC_MSS_SNOC_AXI_CLK>,
+			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			<GCC_QSPI_CORE_CLK>,
+			<GCC_QSPI_CORE_CLK_SRC>,
+			<GCC_SEC_CTRL_CLK_SRC>,
+			<GCC_WPSS_AHB_BDG_MST_CLK>,
+			<GCC_WPSS_AHB_CLK>,
+			<GCC_WPSS_RSCP_CLK>;
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
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcm6490/SHIFT/otter/a660_zap.mbn";
+};
+
+&i2c1 {
+	status = "okay";
+
+	/* PM8008 PMIC @ 8 and 9 */
+	/* rtc6226 FM receiver @ 64 */
+
+	typec-mux@42 {
+		compatible = "fcs,fsa4480";
+		reg = <0x42>;
+
+		vcc-supply = <&vreg_bob>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	/* tas2563 audio codec @ 4d */
+};
+
+&i2c9 {
+	status = "okay";
+
+	/* TMS(?) NFC @ 28 */
+	/* Ti drv2624 haptics @ 5a */
+};
+
+&i2c13 {
+	status = "okay";
+
+	/* focaltech FT3658U @ 38 */
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/qcm6490/SHIFT/otter/ipa_fws.mbn";
+	status = "okay";
+};
+
+&pm7250b_adc {
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "charger_skin_therm";
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "conn_therm";
+	};
+};
+
+&pm7250b_adc_tm {
+	status = "okay";
+
+	charger-skin-therm@0 {
+		reg = <0>;
+		io-channels = <&pm7250b_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	conn-therm@1 {
+		reg = <1>;
+		io-channels = <&pm7250b_adc ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
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
+&pmk8350_adc_tm {
+	status = "okay";
+
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	cam-flash-therm@2 {
+		reg = <2>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sdm-skin-therm@3 {
+		reg = <3>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	wide-rfc-therm@4 {
+		reg = <4>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&pmk8350_vadc {
+	status = "okay";
+
+	channel@44 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pmk8350_xo_therm";
+	};
+
+	channel@144 {
+		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_quiet_therm";
+	};
+
+	channel@145 {
+		reg = <PM7325_ADC7_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_cam_flash_therm";
+	};
+
+	channel@146 {
+		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_sdm_skin_therm";
+	};
+
+	channel@147 {
+		reg = <PM7325_ADC7_AMUX_THM4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_wide_rfc_therm";
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
+&remoteproc_adsp {
+	firmware-name = "qcom/qcm6490/SHIFT/otter/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcm6490/SHIFT/otter/cdsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/qcm6490/SHIFT/otter/modem.mbn";
+	status = "okay";
+};
+
+&remoteproc_wpss {
+	firmware-name = "qcom/qcm6490/SHIFT/otter/wpss.mbn";
+	/*
+	 * FIXME: wpss remoteproc crashes during boot with:
+	 * qcom_q6v5_pas 8a00000.remoteproc: fatal error received:
+	 *   cmnos_thread.c:4645:Asserted in
+	 *   cmnos_allocram.c:cmnos_allocram_base_with_alignment_recurse:497
+	 *   with Args:0x3,0x3,0x0
+	 */
+	 status = "disabled";
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
+&tlmm {
+	/*
+	* 48-52: protected by XPU, not sure why.
+	*/
+	gpio-reserved-ranges = <48 4>;
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
+		pins = "gpio28";
+		function = "gpio";
+		/*
+		* Configure a bias-bus-hold on CTS to lower power
+		* usage when Bluetooth is turned off. Bus hold will
+		* maintain a low power state regardless of whether
+		* the Bluetooth module drives the pin in either
+		* direction or leaves the pin fully unpowered.
+		*/
+		bias-bus-hold;
+	};
+
+	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
+		pins = "gpio29";
+		function = "gpio";
+		/*
+		* Configure pull-down on RTS. As RTS is active low
+		* signal, pull it low to indicate the BT SoC that it
+		* can wakeup the system anytime from suspend state by
+		* pulling RX low (by sending wakeup bytes).
+		*/
+		bias-pull-down;
+	};
+
+	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
+		pins = "gpio30";
+		function = "gpio";
+		/*
+		* Configure pull-up on TX when it isn't actively driven
+		* to prevent BT SoC from receiving garbage during sleep.
+		*/
+		bias-pull-up;
+	};
+
+	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
+		pins = "gpio31";
+		function = "gpio";
+		/*
+		* Configure a pull-up on RX. This is needed to avoid
+		* garbage data when the TX pin of the Bluetooth module
+		* is floating which may cause spurious wakeups.
+		*/
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
+			<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6750-bt";
+
+		pinctrl-0 = <&bluetooth_enable_default>, <&sw_ctrl_default>;
+		pinctrl-names = "default";
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
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l7b>;
+	vcc-max-microamp = <800000>;
+	/*
+	* Technically l9b enables an eLDO (supplied by s1b) which then powers
+	* VCCQ2 of the UFS.
+	*/
+	vccq-supply = <&vreg_l9b>;
+	vccq-max-microamp = <900000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c>;
+	vdda-pll-supply = <&vreg_l6b>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
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
+	orientation-switch;
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
+
+&wifi {
+	qcom,ath11k-calibration-variant = "SHIFTphone_8";
+
+	/* FIXME: wpss remoteproc crashes during init */
+	status = "disabled";
+};

-- 
2.45.0


