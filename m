Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7AD13DEEB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 15:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236085AbhHCNFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 09:05:12 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:27233 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235635AbhHCNFM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 09:05:12 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 03 Aug 2021 06:05:01 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Aug 2021 06:04:59 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 03 Aug 2021 18:34:32 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 3BBB15382; Tue,  3 Aug 2021 18:34:31 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     rnayak@codeaurora.org, kgunda@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7280: Remove pm8350 and pmr735b for sc7280-idp
Date:   Tue,  3 Aug 2021 18:34:12 +0530
Message-Id: <1627995852-24505-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove pm8350 and pmr735b die temp nodes as these pmics are
not present on this board.

Correct the tabbing for pmk8350_vadc node.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 34 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 73225e3..ee76d96 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -9,8 +9,6 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
-#include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
-#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include "sc7280.dtsi"
 #include "pm7325.dtsi"
@@ -244,29 +242,17 @@
 };
 
 &pmk8350_vadc {
-		pm8350_die_temp {
-			reg = <PM8350_ADC7_DIE_TEMP>;
-			label = "pm8350_die_temp";
-			qcom,pre-scaling = <1 1>;
-		};
-
-		pmk8350_die_temp {
-			reg = <PMK8350_ADC7_DIE_TEMP>;
-			label = "pmk8350_die_temp";
-			qcom,pre-scaling = <1 1>;
-		};
-
-		pmr735a_die_temp {
-			reg = <PMR735A_ADC7_DIE_TEMP>;
-			label = "pmr735a_die_temp";
-			qcom,pre-scaling = <1 1>;
-		};
+	pmk8350_die_temp {
+		reg = <PMK8350_ADC7_DIE_TEMP>;
+		label = "pmk8350_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
 
-		pmr735b_die_temp {
-			reg = <PMR735B_ADC7_DIE_TEMP>;
-			label = "pmr735b_die_temp";
-			qcom,pre-scaling = <1 1>;
-		};
+	pmr735a_die_temp {
+		reg = <PMR735A_ADC7_DIE_TEMP>;
+		label = "pmr735a_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
 };
 
 &qupv3_id_0 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

