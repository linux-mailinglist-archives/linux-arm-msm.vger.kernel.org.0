Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330EF35119B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 11:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233553AbhDAJOU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 05:14:20 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25685 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232585AbhDAJN6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 05:13:58 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 01 Apr 2021 02:13:58 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Apr 2021 02:13:55 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Apr 2021 14:43:36 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id BF9554A43; Thu,  1 Apr 2021 14:43:34 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 3/5] arm64: dts: qcom: pmk8350: Add PMIC peripherals for pmk8350
Date:   Thu,  1 Apr 2021 14:43:14 +0530
Message-Id: <1617268396-1837-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617268396-1837-1-git-send-email-skakit@codeaurora.org>
References: <1617268396-1837-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PON, GPIO, RTC and other PMIC infra modules support for pmk8350.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi | 100 ++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
new file mode 100644
index 0000000..13631f2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -0,0 +1,100 @@
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
+		pmk8350_pon: pon@1300 {
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
+			pmk8350_die_temp {
+				reg = <PMK8350_ADC7_DIE_TEMP>;
+				label = "pmk8350_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			pm8350_die_temp {
+				reg = <PM8350_ADC7_DIE_TEMP>;
+				label = "pm8350_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			pmr735a_die_temp {
+				reg = <PMR735A_ADC7_DIE_TEMP>;
+				label = "pmr735a_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			pmr735b_die_temp {
+				reg = <PMR735B_ADC7_DIE_TEMP>;
+				label = "pmr735b_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmk8350_adc_tm: adc-tm@3400 {
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
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

