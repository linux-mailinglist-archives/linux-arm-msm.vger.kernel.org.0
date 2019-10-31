Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21B6AEAE95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 12:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbfJaLQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 07:16:55 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34814 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbfJaLQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 07:16:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id v3so6342578wmh.1;
        Thu, 31 Oct 2019 04:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vam0n8asCuuvQnSClgGsADTtyYgIYmo3zJIbkcCG/lk=;
        b=r6fHgMFkiv63506FlnGclTLRUXqWBQQm/h9fLqN8NiyYp+yN28OYF+v7ZQRtgQDJjA
         y9su9dRi8MfwYlUig/Ld9tMvcaFaTcqNs0g/4Bv/I6MrAMRc1ZiixVRXgIoPo63NsoEo
         5tn1mDcwAWJCHA0fjqiXhY0vE143Nn83rwPE4JmlAmvVRA002/SWTkFQxiDH7Y9Wnzli
         O7K0vQnxT0nuQcEOt+Tijd2hurLDYBKShn7U2WtxvY48nWU7jY4GNpNPZfhcVDDUuMQ8
         QEvYVO6+hwFss3vpF1s/OZlHUJ5kdmJWdFdpcTc6kPIUWE77LW+USIcMjL0/cyIWX/KG
         Jalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vam0n8asCuuvQnSClgGsADTtyYgIYmo3zJIbkcCG/lk=;
        b=kfV7jRfwKXXULFpxU0IHhWhvzZ+IJFpk4qVm5S5me7PD6AtqRUoIlNe38UuHTUPZLy
         3ijfTrJlNP6vPoAC05078j+KH2/U6+MJk11DkCIzeQDOHBCr7XmJouyIPHt8/rOdoQN/
         ztpYZSoVJm0rWE/tTIAFWDjdSCRh8IdTnwiQ0Yd4ZXzy1r0Wx5OLwG1m3JWWW1nM+8rS
         Y+cQZa0+b093JvwVlvSM2Q4VBE5TT7rauxPnLSz7Up2iyEreDFJBhDcKXbAXwCQ+gEb0
         V8X9r43b/cUDKhDBmJHZz1sfTZ7NDfYYQ1yylUgT07q6CR7nM9lf0k2rGUV8FxJpaaT2
         AWUw==
X-Gm-Message-State: APjAAAWFxB/zy+he13LhvnvADI//VioD/IHUz1wHUBQMNrVNFQNtHz8X
        /ltX8kKaYVqT70+fxBo83cR3Mqppux8=
X-Google-Smtp-Source: APXvYqwfyz5F/7XHRIwVGgo1fvfJyyaJZpxv5TIDEW7KRHDr1lEocI6P1uMYwgLp9mq1TXH8mEEDog==
X-Received: by 2002:a05:600c:22cd:: with SMTP id 13mr4923329wmg.52.1572520612110;
        Thu, 31 Oct 2019 04:16:52 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id s17sm3009306wmh.3.2019.10.31.04.16.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 04:16:51 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH v2 3/5] arm64: dts: qcom: Add configuration for PM8950 and PMI8950 peripherals
Date:   Thu, 31 Oct 2019 12:16:43 +0100
Message-Id: <20191031111645.34777-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031111645.34777-1-kholk11@gmail.com>
References: <20191031111645.34777-1-kholk11@gmail.com>
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

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm8950.dtsi  | 187 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmi8950.dtsi |  98 ++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8950.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8950.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8950.dtsi b/arch/arm64/boot/dts/qcom/pm8950.dtsi
new file mode 100644
index 000000000000..a349a8dd867e
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
+	pm8950_lsid1: pm8950@1 {
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
index 000000000000..73afdfca27c1
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

