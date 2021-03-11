Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5703433703C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 11:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhCKKlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 05:41:04 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43033 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhCKKkz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 05:40:55 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 11 Mar 2021 02:40:54 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Mar 2021 02:40:52 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 11 Mar 2021 16:10:32 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 1EB5648CD; Thu, 11 Mar 2021 16:10:31 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280
Date:   Thu, 11 Mar 2021 16:10:29 +0530
Message-Id: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PM7325/PM8350C/PMK8350/PMR735A peripherals such as PON,
GPIOs, RTC and other PMIC infra modules for SC7280.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
This patch depends on base DT and board files for SC7280 to merge first
https://lore.kernel.org/patchwork/project/lkml/list/?series=487403

 arch/arm64/boot/dts/qcom/pm7325.dtsi  |  60 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8350c.dtsi |  60 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmk8350.dtsi | 104 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmr735a.dtsi |  60 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi  |   8 +++
 5 files changed, 292 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi b/arch/arm64/boot/dts/qcom/pm7325.dtsi
new file mode 100644
index 0000000..393b256
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: BSD-3-Clause
+// Copyright (c) 2021, The Linux Foundation. All rights reserved.
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pm7325: pmic@1 {
+		compatible = "qcom,pm7325", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7325_tz: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7325_gpios: gpios@8800 {
+			compatible = "qcom,pm7325-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7325_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
+
+&thermal_zones {
+	pm7325_temp_alarm: pm7325_tz {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-governor = "step_wise";
+		thermal-sensors = <&pm7325_tz>;
+
+		trips {
+			pm7325_trip0: trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			pm7325_trip1: trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "critical";
+			};
+
+			pm7325_trip2: trip2 {
+				temperature = <145000>;
+				hysteresis = <0>;
+				type = "critical";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
new file mode 100644
index 0000000..dffa79d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: BSD-3-Clause
+// Copyright (c) 2021, The Linux Foundation. All rights reserved.
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pm8350: pmic@2 {
+		compatible = "qcom,pm8350c", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8350c_tz: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8350c_gpios: gpios@8800 {
+			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8350c_gpios 0 0 9>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
+
+&thermal_zones {
+	pm8350c_temp_alarm: pm8350c_tz {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-governor = "step_wise";
+		thermal-sensors = <&pm8350c_tz>;
+
+		trips {
+			pm8350c_trip0: trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			pm8350c_trip1: trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "critical";
+			};
+
+			pm8350c_trip2: trip2 {
+				temperature = <145000>;
+				hysteresis = <0>;
+				type = "critical";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
new file mode 100644
index 0000000..9749484
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: BSD-3-Clause
+// Copyright (c) 2021, The Linux Foundation. All rights reserved.
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
+
+&spmi_bus {
+	pmk8350: pmic@0 {
+		compatible = "qcom,pmk8350", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmk8350_pon: pon_hlos@1300 {
+			compatible = "qcom,pm8998-pon";
+			reg = <0x1300>;
+
+			pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+			};
+
+			resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_VOLUMEDOWN>;
+			};
+		};
+
+		pmk8350_vadc: adc@3100 {
+			compatible = "qcom,spmi-adc7";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eoc-int-en-set";
+			#io-channel-cells = <1>;
+			io-channel-ranges;
+
+			/* PMK8350 Channel nodes */
+			pmk8350_die_temp {
+				reg = <PMK8350_ADC7_DIE_TEMP>;
+				label = "pmk8350_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			/* PM8350 Channel nodes */
+			pm8350_die_temp {
+				reg = <PM8350_ADC7_DIE_TEMP>;
+				label = "pm8350_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			/* PMR735a Channel nodes */
+			pmr735a_die_temp {
+				reg = <PMR735A_ADC7_DIE_TEMP>;
+				label = "pmr735a_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			/* PMR735b Channel nodes */
+			pmr735b_die_temp {
+				reg = <PMR735B_ADC7_DIE_TEMP>;
+				label = "pmr735b_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmk8350_adc_tm: adc_tm@3400 {
+			compatible = "qcom,adc-tm7";
+			reg = <0x3400>;
+			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "threshold";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#thermal-sensor-cells = <1>;
+			status = "disabled";
+		};
+
+		pmk8350_gpios: gpios@b000 {
+			compatible = "qcom,pmk8350-gpio", "qcom,spmi-gpio";
+			reg = <0xb000>;
+			gpio-controller;
+			gpio-ranges = <&pmk8350_gpios 0 0 4>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmk8350_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmr735a.dtsi b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
new file mode 100644
index 0000000..e1d2356
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: BSD-3-Clause
+// Copyright (c) 2021, The Linux Foundation. All rights reserved.
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmr735a: pmic@4 {
+		compatible = "qcom,pmr735a", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735a_tz: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmr735a_gpios: gpios@8800 {
+			compatible = "qcom,pmr735a-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmr735a_gpios 0 0 4>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
+
+&thermal_zones {
+	pmr735a_temp_alarm: pmr735a_tz {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-governor = "step_wise";
+		thermal-sensors = <&pmr735a_tz>;
+
+		trips {
+			pmr735a_trip0: trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			pmr735a_trip1: trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "critical";
+			};
+
+			pmr735a_trip2: trip2 {
+				temperature = <145000>;
+				hysteresis = <0>;
+				type = "critical";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8af6d77..25402d4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -606,4 +606,12 @@
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	thermal_zones: thermal-zones {
+	};
 };
+
+#include "pm7325.dtsi"
+#include "pm8350c.dtsi"
+#include "pmk8350.dtsi"
+#include "pmr735a.dtsi"
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

