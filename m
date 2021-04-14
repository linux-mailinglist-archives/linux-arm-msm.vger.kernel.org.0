Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B47335EFBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 10:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350085AbhDNIfV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 04:35:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:63303 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350077AbhDNIfU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 04:35:20 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 14 Apr 2021 01:34:59 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Apr 2021 01:34:56 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Apr 2021 14:04:30 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 9D6C14EF8; Wed, 14 Apr 2021 14:04:28 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 5/5] arm64: dts: qcom: sc7280: Include PMIC DT files for sc7280
Date:   Wed, 14 Apr 2021 14:04:26 +0530
Message-Id: <1618389266-5990-6-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618389266-5990-1-git-send-email-skakit@codeaurora.org>
References: <1618389266-5990-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include pm7325, pm8350c, pmk8350 and pmr735a DT files. Add
channel nodes for pmk8350_vadc. Also, add the thermal_zones
node in dtsi.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi   |  6 ++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 30 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    |  3 +++
 3 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
index dee5384..bbd9fa7 100644
--- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -3,6 +3,12 @@
  * Copyright (c) 2021, Linaro Limited
  */
 
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 950ecb2..9293502 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -8,6 +8,10 @@
 /dts-v1/;
 
 #include "sc7280.dtsi"
+#include "pm7325.dtsi"
+#include "pm8350c.dtsi"
+#include "pmk8350.dtsi"
+#include "pmr735a.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. sc7280 IDP platform";
@@ -22,6 +26,32 @@
 	};
 };
 
+&pmk8350_vadc {
+		pm8350_die_temp {
+			reg = <PM8350_ADC7_DIE_TEMP>;
+			label = "pm8350_die_temp";
+			qcom,pre-scaling = <1 1>;
+		};
+
+		pmk8350_die_temp {
+			reg = <PMK8350_ADC7_DIE_TEMP>;
+			label = "pmk8350_die_temp";
+			qcom,pre-scaling = <1 1>;
+		};
+
+		pmr735a_die_temp {
+			reg = <PMR735A_ADC7_DIE_TEMP>;
+			label = "pmr735a_die_temp";
+			qcom,pre-scaling = <1 1>;
+		};
+
+		pmr735b_die_temp {
+			reg = <PMR735B_ADC7_DIE_TEMP>;
+			label = "pmr735b_die_temp";
+			qcom,pre-scaling = <1 1>;
+		};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 39cf0be..0f4fd33 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -605,4 +605,7 @@
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	thermal_zones: thermal-zones {
+	};
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

