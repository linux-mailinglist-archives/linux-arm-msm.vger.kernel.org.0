Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF142245DCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 09:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgHQHTa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 03:19:30 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:54273 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725765AbgHQHTZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 03:19:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597648764; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=T6J1BLrMRe5XgTTOrvOmU4kPBJ/Amc6FHePTJxi9s0Q=; b=AUmRBe2u0Xv7cBTckpGU6HR2PkrWKNHNGu+CLLjnMXEW1Uc3ecOEa2RGf+W3KyW9RP84fdlj
 mjT9l8wVDFKW+jKdH2HbKt98Ktawejh8upeVhMavwW0YQPvWO3qSbhGm5T3/3Ed8GMxYpmnT
 CU3OHHWJovT79xO46HRgwTvKH5g=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f3a2f6661f1d41834cd3b35 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 07:19:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 72738C43387; Mon, 17 Aug 2020 07:19:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76657C433CB;
        Mon, 17 Aug 2020 07:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76657C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sivaprak@codeaurora.org,
        devicetree@vger.kernel.org
Cc:     kathirav@codeaurora.org
Subject: [PATCH V2 2/2] arm64: dts: ipq6018: enable DVFS support
Date:   Mon, 17 Aug 2020 12:48:40 +0530
Message-Id: <1597648720-13649-3-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597648720-13649-1-git-send-email-kathirav@codeaurora.org>
References: <1597648720-13649-1-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add A53 PLL, APCS clock, RPM Glink, RPM message RAM, cpu-opp-table,
SMPA2 regulator to enable the cpu frequency on IPQ6018.

Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 96 +++++++++++++++++++++++++++++++++--
 1 file changed, 93 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 1aa8d8579463..a94dac76bf3f 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
 #include <dt-bindings/reset/qcom,gcc-ipq6018.h>
+#include <dt-bindings/clock/qcom,apss-ipq.h>
 
 / {
 	#address-cells = <2>;
@@ -38,6 +39,10 @@
 			reg = <0x0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&ipq6018_s2>;
 		};
 
 		CPU1: cpu@1 {
@@ -46,6 +51,10 @@
 			enable-method = "psci";
 			reg = <0x1>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&ipq6018_s2>;
 		};
 
 		CPU2: cpu@2 {
@@ -54,6 +63,10 @@
 			enable-method = "psci";
 			reg = <0x2>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&ipq6018_s2>;
 		};
 
 		CPU3: cpu@3 {
@@ -62,6 +75,10 @@
 			enable-method = "psci";
 			reg = <0x3>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&ipq6018_s2>;
 		};
 
 		L2_0: l2-cache {
@@ -70,6 +87,42 @@
 		};
 	};
 
+	cpu_opp_table: cpu_opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-864000000 {
+			opp-hz = /bits/ 64 <864000000>;
+			opp-microvolt = <725000>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-microvolt = <787500>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1320000000 {
+			opp-hz = /bits/ 64 <1320000000>;
+			opp-microvolt = <862500>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1440000000 {
+			opp-hz = /bits/ 64 <1440000000>;
+			opp-microvolt = <925000>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <987500>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1062500>;
+			clock-latency-ns = <200000>;
+		};
+	};
+
 	firmware {
 		scm {
 			compatible = "qcom,scm";
@@ -98,6 +151,11 @@
 		#size-cells = <2>;
 		ranges;
 
+		rpm_msg_ram: memory@0x60000 {
+			reg = <0x0 0x60000 0x0 0x6000>;
+			no-map;
+		};
+
 		tz: tz@48500000 {
 			reg = <0x0 0x48500000 0x0 0x00200000>;
 			no-map;
@@ -294,12 +352,22 @@
 		};
 
 		apcs_glb: mailbox@b111000 {
-			compatible = "qcom,ipq8074-apcs-apps-global";
-			reg = <0x0b111000 0xc>;
-
+			compatible = "qcom,ipq6018-apcs-apps-global";
+			reg = <0x0b111000 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&a53pll>, <&xo>;
+			clock-names = "pll", "xo";
 			#mbox-cells = <1>;
 		};
 
+		a53pll: clock@b116000 {
+			compatible = "qcom,ipq6018-a53pll";
+			reg = <0x0b116000 0x40>;
+			#clock-cells = <0>;
+			clocks = <&xo>;
+			clock-names = "xo";
+		};
+
 		timer {
 			compatible = "arm,armv8-timer";
 			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
@@ -440,4 +508,26 @@
 			#interrupt-cells = <2>;
 		};
 	};
+
+	rpm-glink {
+		compatible = "qcom,glink-rpm";
+		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+		mboxes = <&apcs_glb 0>;
+
+		rpm_requests: glink-channel {
+			compatible = "qcom,rpm-ipq6018";
+			qcom,glink-channels = "rpm_requests";
+
+			regulators {
+				compatible = "qcom,rpm-mp5496-regulators";
+
+				ipq6018_s2: s2 {
+					regulator-min-microvolt = <725000>;
+					regulator-max-microvolt = <1062500>;
+					regulator-always-on;
+				};
+			};
+		};
+	};
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

