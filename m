Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF27DDF0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 17:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfJTPIF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 11:08:05 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39241 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfJTPIF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 11:08:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id r3so11036555wrj.6;
        Sun, 20 Oct 2019 08:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ePT8IFkbVDZSccudmndjpyuVET1hjQZMqGfLz5C6bJ4=;
        b=rKzv0T5OltaIpsiJxBFIrZaBUG8libFvN3LZQMS6DPbltIytRTujKbGUhYccj8VDQR
         VKtwyGIL1xfx4yN0ao1O5BYouJfrJB+sbG8KmzdhMPyuF0AoZKxWK6jr8UhAGX1Di5Um
         x2ItilS2RXq7KsFFWkSTV5HxgYbBih3WnUVkDaIgkVk0DIzRwCgdVsn5xn1tzNi7atrU
         tdSZ6j0qPJryeOssNgnb5QvboBpmdqEXIGyIoQyFXD81+ZyZmYV4TAISWBxIEt4gzg0/
         WxykzA7ck5OZ1WfI0eX9rzSshaeQonXOtvv5I2c5iY0Opkq/BKttL/NkTE+z1MDGPU/i
         MX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ePT8IFkbVDZSccudmndjpyuVET1hjQZMqGfLz5C6bJ4=;
        b=sEfvDVJuHIQFWiPzoM1lvEpvETK6BikeRwGDqK5PrbF8UTdrWx+yTmWi3uzAEkwrNg
         hbxG9v5hkgy/Z6tStBUtBv7Ncm2CViBY/xlErzA3lbxtsvqyetFl2QvmHmMJ+ihau/RA
         4CkirrBYXxlzYDBm+7HZgD+8fK08g+6dd6Y4Qok0k8I75GHFA+DJWMM1MddiThLAsUa3
         5BL0sDuhrc5A3zYZ/vxaaCLmsttW2SCG0H63PnYssz8ICN+lHkIyz5piHfTC3ciseY7T
         KLxBjIJL4zwAzgC1aok0w1wj1bDdUXFHdzOtSbl9FRMvIYeMreeWo9FczY+pe9kbRXAg
         2l/w==
X-Gm-Message-State: APjAAAU3LTG/82ezQ93uiPtTUg1aS1vI8G2933Afsi34FwjVtgM2bvGV
        XNeohRYdfSlGKG95g03plMP1szMf+45DzA==
X-Google-Smtp-Source: APXvYqzjCiwc885a+i/gCBplwB/AYx8icnSxwXCQn5udnZB7h1DN0HyprocsHnD5E+T469KadwFePw==
X-Received: by 2002:a5d:4d4c:: with SMTP id a12mr16717165wru.389.1571584081449;
        Sun, 20 Oct 2019 08:08:01 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id z9sm11921172wrv.1.2019.10.20.08.08.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 08:08:00 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH 3/5] arm64: dts: qcom: Add configuration for PM8950 and PMI8950 peripherals
Date:   Sun, 20 Oct 2019 17:07:44 +0200
Message-Id: <20191020150746.64114-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191020150746.64114-1-kholk11@gmail.com>
References: <20191020150746.64114-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The PM(I)8950 feature integrated peripherals like ADC, GPIO
controller, MPPs, PON keys and others.
Add them to DT files that will be imported on boards having
this PMIC combo (or one of them, anyways).

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm8950.dtsi  | 187 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmi8950.dtsi |  98 ++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8950.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8950.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8950.dtsi b/arch/arm64/boot/dts/qcom/pm8950.dtsi
new file mode 100644
index 000000000000..c5041349bfe1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8950.dtsi
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019, AngeloGioacchino Del Regno <kholk11@gmail.com>
+
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pm8950_lsid0: pm8950@0 {
+		compatible = "qcom,pm8950", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8950_gpios: gpio@c000 {
+			compatible = "qcom,pm8950-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
+				<0 0xc1 0 IRQ_TYPE_NONE>,
+				<0 0xc3 0 IRQ_TYPE_NONE>,
+				<0 0xc4 0 IRQ_TYPE_NONE>,
+				<0 0xc5 0 IRQ_TYPE_NONE>,
+				<0 0xc6 0 IRQ_TYPE_NONE>,
+				<0 0xc7 0 IRQ_TYPE_NONE>;
+		};
+
+		pm8950_mpps: mpps@a000 {
+			compatible = "qcom,pm8950-mpp", "qcom,spmi-mpp";
+			reg = <0xa000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
+				     <0 0xa1 0 IRQ_TYPE_NONE>,
+				     <0 0xa2 0 IRQ_TYPE_NONE>,
+				     <0 0xa3 0 IRQ_TYPE_NONE>;
+
+			/* MPP_2: PA_THERM1 */
+			pa_therm {
+				pm8950_mpp2_def: pa_therm1_default {
+					pins = "mpp2";
+					function = "analog";
+					input-enable;
+					qcom,amux-route =
+						<PMIC_MPP_AMUX_ROUTE_CH6>;
+				};
+			};
+
+			/* MPP_4: QUIET_THERM */
+			case_therm {
+				pm8950_mpp4_def: case_therm_default {
+					pins = "mpp4";
+					function = "analog";
+					input-enable;
+					qcom,amux-route =
+						<PMIC_MPP_AMUX_ROUTE_CH8>;
+				};
+			};
+		};
+
+		pon@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x0800>;
+			mode-bootloader = <0x2>;
+			mode-recovery = <0x1>;
+
+			pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_POWER>;
+			};
+		};
+
+		pm8950_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0 0x24 0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pm8950_adc VADC_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8950_adc: adc@3100 {
+			compatible = "qcom,spmi-vadc";
+			reg = <0x3100>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			vcoin {
+				label = "vcoin";
+				reg = <VADC_VCOIN>;
+				qcom,pre-scaling = <1 1>;
+			};
+			vph_pwr {
+				label = "vph_pwr";
+				reg = <VADC_VSYS>;
+				qcom,pre-scaling = <1 1>;
+			};
+			die_temp {
+				label = "die_temp";
+				reg = <VADC_DIE_TEMP>;
+				qcom,pre-scaling = <1 1>;
+			};
+			ref_625mv {
+				label = "ref_625mv";
+				reg = <VADC_REF_625MV>;
+				qcom,pre-scaling = <1 1>;
+			};
+			ref_1250v {
+				label = "ref_1250v";
+				reg = <VADC_REF_1250MV>;
+				qcom,pre-scaling = <1 1>;
+			};
+			ref_buf_625mv {
+				label = "ref_buf_625mv";
+				reg = <VADC_SPARE1>;
+				qcom,pre-scaling = <1 1>;
+			};
+			ref_gnd {
+				reg = <VADC_GND_REF>;
+			};
+			ref_vdd {
+				reg = <VADC_VDD_VADC>;
+			};
+			pa_therm0 {
+				label = "pa_therm0";
+				reg = <VADC_LR_MUX7_HW_ID>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+			};
+			pa_therm1 {
+				label = "pa_therm1";
+				reg = <VADC_P_MUX2_1_1>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+			};
+			xo_therm {
+				label = "xo_therm";
+				reg = <VADC_LR_MUX3_XO_THERM>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+			};
+			xo_therm_buf {
+				label = "xo_therm_buf";
+				reg = <VADC_LR_MUX3_BUF_XO_THERM>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+			};
+			case_therm {
+				label = "case_therm";
+				reg = <VADC_P_MUX4_1_1>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+			};
+		};
+
+		rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
+		};
+	};
+
+	pm8950_1: pm8950@1 {
+		compatible = "qcom,pm8950", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8950_spmi_regulators: regulators {
+			compatible = "qcom,pm8950-regulators";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
new file mode 100644
index 000000000000..15c3e47bab0c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019, AngeloGioacchino Del Regno <kholk11@gmail.com>
+
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmi8950_lsid0: pmic@2 {
+		compatible = "qcom,pmi8950", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmi8950_adc: adc@3100 {
+			compatible = "qcom,spmi-vadc";
+			reg = <0x3100>;
+			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			usbin {
+				label = "usbin";
+				reg = <VADC_USBIN>;
+				qcom,pre-scaling = <1 4>;
+			};
+			dcin {
+				label = "dcin";
+				reg = <VADC_DCIN>;
+				qcom,pre-scaling = <1 4>;
+			};
+			vchg_sns {
+				label = "vchg_sns";
+				reg = <VADC_VCHG_SNS>;
+				qcom,pre-scaling = <1 1>;
+			};
+			ref_625mv {
+				label = "ref_625mv";
+				reg = <VADC_REF_625MV>;
+				qcom,pre-scaling = <1 1>;
+			};
+			ref_1250v {
+				label = "ref_1250v";
+				reg = <VADC_REF_1250MV>;
+				qcom,pre-scaling = <1 1>;
+			};
+			ref_gnd {
+				reg = <VADC_GND_REF>;
+			};
+			ref_vdd {
+				reg = <VADC_VDD_VADC>;
+			};
+			chg_temp {
+				label = "chg_temp";
+				reg = <VADC_SPARE2>;
+				qcom,pre-scaling = <1 1>;
+			};
+			usb_dp {
+				label = "usb_dp";
+				reg = <VADC_USB_DP>;
+				qcom,pre-scaling = <1 1>;
+			};
+			usb_dm {
+				label = "usb_dm";
+				reg = <VADC_USB_DM>;
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmi8950_gpio: gpios@c000 {
+			compatible = "qcom,pmi8950-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
+				<0 0xc1 0 IRQ_TYPE_NONE>;
+		};
+
+		pmi8950_mpp: mpps@a000 {
+			compatible = "qcom,pmi8950-mpp", "qcom,spmi-mpp";
+			reg = <0xa000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0x2 0xa0 0 IRQ_TYPE_NONE>,
+				<0x2 0xa1 0 IRQ_TYPE_NONE>,
+				<0x2 0xa2 0 IRQ_TYPE_NONE>,
+				<0x2 0xa3 0 IRQ_TYPE_NONE>;
+		};
+	};
+
+	pmi8950_lsid1: pmic@3 {
+		compatible = "qcom,pmi8950", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.21.0

