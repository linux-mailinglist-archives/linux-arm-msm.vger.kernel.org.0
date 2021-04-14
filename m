Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8462F35EFBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 10:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350095AbhDNIfX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 04:35:23 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61285 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350087AbhDNIfV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 04:35:21 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Apr 2021 01:35:01 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Apr 2021 01:34:58 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Apr 2021 14:04:29 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 8B2734EFD; Wed, 14 Apr 2021 14:04:28 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 4/5] arm64: dts: qcom: pmk8350: Add PMIC peripherals for pmk8350
Date:   Wed, 14 Apr 2021 14:04:25 +0530
Message-Id: <1618389266-5990-5-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618389266-5990-1-git-send-email-skakit@codeaurora.org>
References: <1618389266-5990-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PON, RTC and other PMIC infra modules support for PMK8350.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi | 49 ++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
index 1530b8f..dee5384 100644
--- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -13,10 +13,57 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
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
+		pmk8350_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		pmk8350_gpios: gpio@b000 {
-			compatible = "qcom,pmk8350-gpio";
+			compatible = "qcom,pmk8350-gpio", "qcom,spmi-gpio";
 			reg = <0xb000>;
 			gpio-controller;
+			gpio-ranges = <&pmk8350_gpios 0 0 4>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

