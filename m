Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7483E3871C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 08:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346575AbhERGWD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 02:22:03 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:6255 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346565AbhERGWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 02:22:02 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 17 May 2021 23:20:44 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 May 2021 23:20:42 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 18 May 2021 11:50:26 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 727B34B4F; Tue, 18 May 2021 11:50:25 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, satya priya <skakit@codeaurora.org>
Subject: [RESEND PATCH V4 8/8] arm64: dts: qcom: sc7280: Add ADC channel nodes for PMIC temperatures to sc7280-idp
Date:   Tue, 18 May 2021 11:50:22 +0530
Message-Id: <1621318822-29332-9-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add channel nodes for the on die temperatures of PMICS
pmk8350, pm8350, pmr735a and pmr735b.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in RESEND V4:
 - As per Matthias comments, changed the commit text.

 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index f295580..704fb9a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -7,6 +7,10 @@
 
 /dts-v1/;
 
+#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include "sc7280.dtsi"
 #include "pm7325.dtsi"
 #include "pmr735a.dtsi"
@@ -238,6 +242,32 @@
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
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

