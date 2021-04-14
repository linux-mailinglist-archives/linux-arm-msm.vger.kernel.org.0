Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A99C35F1F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 13:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345303AbhDNLNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 07:13:55 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:19167 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344040AbhDNLNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 07:13:54 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Apr 2021 04:13:31 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Apr 2021 04:13:29 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Apr 2021 16:43:13 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 77CD647ED; Wed, 14 Apr 2021 16:43:11 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, satya priya <skakit@codeaurora.org>
Subject: [RESEND PATCH V3 3/5] arm64: dts: qcom: pmr735a: Add temp-alarm support
Date:   Wed, 14 Apr 2021 16:43:01 +0530
Message-Id: <1618398783-7834-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618398783-7834-1-git-send-email-skakit@codeaurora.org>
References: <1618398783-7834-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add temp-alarm node for PMR735A pmic and also modify gpio
node to add gpio ranges and "qcom,spmi-gpio" compatible.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pmr735a.dtsi | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmr735a.dtsi b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
index 1c675af1..b4b6ba24 100644
--- a/arch/arm64/boot/dts/qcom/pmr735a.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
@@ -13,13 +13,43 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmr735a_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmr735a_gpios: gpio@8800 {
-			compatible = "qcom,pmr735a-gpio";
+			compatible = "qcom,pmr735a-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
 			gpio-controller;
+			gpio-ranges = <&pmr735a_gpios 0 0 4>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
 	};
 };
+
+&thermal_zones {
+	pmr735a_thermal: pmr735a-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&pmr735a_temp_alarm>;
+
+		trips {
+			pmr735a_trip0: trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			pmr735a_crit: pmr735a-crit {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "critical";
+			};
+		};
+	};
+};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

