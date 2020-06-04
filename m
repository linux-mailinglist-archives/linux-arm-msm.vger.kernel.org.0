Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16DB11EE27B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 12:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgFDKav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 06:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728235AbgFDKau (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 06:30:50 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5A1C03E96E
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 03:30:50 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f185so5047215wmf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 03:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jsVd11sIANIK7sfrmixWsGT0pUQUrSCmhUcuCBbqAfI=;
        b=WZ3MoxFCN8BpLxg7Oectl+U3aKE83iMTMqSQoY/YWx+C+Kr2+umkWLr3yny9H21i9M
         8IRjkdrpDB+xNIxO24ckU0cO5UjTsTdHIW4ntTYHpWpeV2aX7XanQgD8cwr/y2VvYA38
         X0iItq80WY5oY6oKNOo7Tam8aFwOeVkGAjGyuMZgccTPLE+YlrWdmQ31e/UuYf7ym10n
         4Rp65ve/blp1wiOEbUY59/0+6VMLi1AzIyXymp1OrI9LrS9wqkwv6UCcfPS6UzPjoVBH
         a5vTDhJno9n9Kl/NAkQskDOm18pLD1FxArve8QqH8otq7/p8jOoIwJhpgNVk5XnFlsjw
         ghvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jsVd11sIANIK7sfrmixWsGT0pUQUrSCmhUcuCBbqAfI=;
        b=tHgfawqEBsls/zfap/DhIHXVBVvk6rBTIAKRp+9IrElYWhppd1pq8B6mWEg0qPqtIn
         U5ZIOiQxowZpvg0N8TzV6ZomtRWaqBJqBBM+gmr0XmgfWae07zbodjwTW7+QYKYZPmRp
         X36iiApoRuKKIanclPxY60tJtvIvNaSv90JGgYWkxkMeGSyK8mxlGFvDd6JTGdH4yqoX
         uzsVJmoU970DkgZqB7lRXE00L4O/Y3wMr4HU9H2QOCw2jJnlnFc/5ivbs7MXrUHOeEPG
         PizVrNJ2BHVV/6ClyOrm2/cyT/AuRL94jD6ARWqhv5757rdbRAc7UwS01tsJF+HnoDNd
         cSOw==
X-Gm-Message-State: AOAM5327IBIAeaykftOW3Z7ZQas2D/SbRAJ1D6fVGKGhbwWaAnQPS+g5
        vTrbzEuGRij0axzCMosiJ75aFQ==
X-Google-Smtp-Source: ABdhPJwHRJ/ScTiU/qcEivX7zv/WD68KMVc9AXraBADlC42Qpl3pUSj0RWlWV21+1BNjnRaOgZ+cNg==
X-Received: by 2002:a1c:9d96:: with SMTP id g144mr3288178wme.126.1591266648988;
        Thu, 04 Jun 2020 03:30:48 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id n19sm6510164wmi.33.2020.06.04.03.30.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jun 2020 03:30:48 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v2 4/4] arch: arm64: dts: msm8996: Add opp and thermal
Date:   Thu,  4 Jun 2020 12:35:27 +0200
Message-Id: <1591266927-24976-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org>
References: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 338 ++++++++++++++++++++++++++++++++--
 1 file changed, 323 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 98634d5..0f73efe 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -43,6 +44,12 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
+			clocks = <&kryocc 0>;
+			operating-points-v2 = <&cluster0_opp>;
+			/* cooling options */
+			cooling-min-level = <0>;
+			cooling-max-level = <15>;
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 			      compatible = "cache";
@@ -57,6 +64,12 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
+			clocks = <&kryocc 0>;
+			operating-points-v2 = <&cluster0_opp>;
+			/* cooling options */
+			cooling-min-level = <0>;
+			cooling-max-level = <15>;
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
 		};
 
@@ -67,6 +80,12 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
+			clocks = <&kryocc 1>;
+			operating-points-v2 = <&cluster1_opp>;
+			/* cooling options */
+			cooling-min-level = <0>;
+			cooling-max-level = <15>;
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
 			      compatible = "cache";
@@ -81,6 +100,12 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
+			clocks = <&kryocc 1>;
+			operating-points-v2 = <&cluster1_opp>;
+			/* cooling options */
+			cooling-min-level = <0>;
+			cooling-max-level = <15>;
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_1>;
 		};
 
@@ -424,7 +449,7 @@
 				bits = <1 4>;
 			};
 
-			gpu_speed_bin: gpu_speed_bin@133 {
+			speedbin_efuse: speedbin@133 {
 				reg = <0x133 0x1>;
 				bits = <5 3>;
 			};
@@ -642,7 +667,7 @@
 			power-domains = <&mmcc GPU_GDSC>;
 			iommus = <&adreno_smmu 0>;
 
-			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cells = <&speedbin_efuse>;
 			nvmem-cell-names = "speed_bin";
 
 			qcom,gpu-quirk-two-pass-use-wfi;
@@ -1703,8 +1728,9 @@
 				};
 			};
 		};
+
 		kryocc: clock-controller@6400000 {
-			compatible = "qcom,apcc-msm8996";
+			compatible = "qcom,msm8996-apcc";
 			reg = <0x06400000 0x90000>;
 			#clock-cells = <1>;
 		};
@@ -2172,6 +2198,229 @@
 	sound: sound {
 	};
 
+	cluster0_opp: opp_table0 {
+		compatible = "operating-points-v2-qcom-cpu";
+		nvmem-cells = <&speedbin_efuse>;
+		opp-shared;
+
+		/* Nominal fmax for now */
+
+		opp-307200000 {
+			opp-hz = /bits/ 64 <  307200000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-422400000 {
+			opp-hz = /bits/ 64 <  422400000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-480000000 {
+			opp-hz = /bits/ 64 <  480000000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-556800000 {
+			opp-hz = /bits/ 64 <  556800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-652800000 {
+			opp-hz = /bits/ 64 <  652800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-729600000 {
+			opp-hz = /bits/ 64 <  729600000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-844800000 {
+			opp-hz = /bits/ 64 <  844800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-960000000 {
+			opp-hz = /bits/ 64 <  960000000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1036800000 {
+			opp-hz = /bits/ 64 < 1036800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1113600000 {
+			opp-hz = /bits/ 64 < 1113600000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1190400000 {
+			opp-hz = /bits/ 64 < 1190400000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1228800000 {
+			opp-hz = /bits/ 64 < 1228800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1324800000 {
+			opp-hz = /bits/ 64 < 1324800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1401600000 {
+			opp-hz = /bits/ 64 < 1401600000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1478400000 {
+			opp-hz = /bits/ 64 < 1478400000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1593600000 {
+			opp-hz = /bits/ 64 < 1593600000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+	};
+
+	cluster1_opp: opp_table1 {
+		compatible = "operating-points-v2-qcom-cpu";
+		nvmem-cells = <&speedbin_efuse>;
+		opp-shared;
+
+		/* Nominal fmax for now */
+
+		opp-307200000 {
+			opp-hz = /bits/ 64 <  307200000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-403200000 {
+			opp-hz = /bits/ 64 <  403200000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-480000000 {
+			opp-hz = /bits/ 64 <  480000000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-556800000 {
+			opp-hz = /bits/ 64 <  556800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-652800000 {
+			opp-hz = /bits/ 64 <  652800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-729600000 {
+			opp-hz = /bits/ 64 <  729600000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-806400000 {
+			opp-hz = /bits/ 64 <  806400000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-883200000 {
+			opp-hz = /bits/ 64 <  883200000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-940800000 {
+			opp-hz = /bits/ 64 <  940800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1036800000 {
+			opp-hz = /bits/ 64 < 1036800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1113600000 {
+			opp-hz = /bits/ 64 < 1113600000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1190400000 {
+			opp-hz = /bits/ 64 < 1190400000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1248000000 {
+			opp-hz = /bits/ 64 < 1248000000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1324800000 {
+			opp-hz = /bits/ 64 < 1324800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1401600000 {
+			opp-hz = /bits/ 64 < 1401600000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1478400000 {
+			opp-hz = /bits/ 64 < 1478400000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1555200000 {
+			opp-hz = /bits/ 64 < 1555200000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1632000000 {
+			opp-hz = /bits/ 64 < 1632000000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1708800000 {
+			opp-hz = /bits/ 64 < 1708800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1785600000 {
+			opp-hz = /bits/ 64 < 1785600000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1824000000 {
+			opp-hz = /bits/ 64 < 1824000000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1920000000 {
+			opp-hz = /bits/ 64 < 1920000000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1996800000 {
+			opp-hz = /bits/ 64 < 1996800000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-2073600000 {
+			opp-hz = /bits/ 64 < 2073600000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+		opp-2150400000 {
+			opp-hz = /bits/ 64 < 2150400000 >;
+			opp-supported-hw = <0x77>;
+			clock-latency-ns = <200000>;
+		};
+	};
+
 	thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
@@ -2180,18 +2429,33 @@
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
-				cpu0_alert0: trip-point@0 {
+				cpu_alert0: cpu_alert0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
+					type = "active";
+				};
+				cpu_warn0: cpu_warn0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
 					type = "passive";
 				};
-
-				cpu0_crit: cpu_crit {
+				cpu_crit0: cpu_crit0 {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT 7>;
+				};
+				map1 {
+					trip = <&cpu_warn0>;
+					cooling-device = <&CPU0 8 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu1-thermal {
@@ -2201,18 +2465,33 @@
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
-				cpu1_alert0: trip-point@0 {
+				cpu_alert1: cpu_alert1 {
 					temperature = <75000>;
 					hysteresis = <2000>;
+					type = "active";
+				};
+				cpu_warn1: cpu_warn1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
 					type = "passive";
 				};
-
-				cpu1_crit: cpu_crit {
+				cpu_crit1: cpu_crit1 {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert1>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT 7>;
+				};
+				map1 {
+					trip = <&cpu_warn1>;
+					cooling-device = <&CPU0 8 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu2-thermal {
@@ -2222,18 +2501,32 @@
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
-				cpu2_alert0: trip-point@0 {
+				cpu_alert2: cpu_alert2 {
 					temperature = <75000>;
 					hysteresis = <2000>;
+					type = "active";
+				};
+				cpu_warn2: cpu_warn2 {
+					temperature = <90000>;
+					hysteresis = <2000>;
 					type = "passive";
 				};
-
-				cpu2_crit: cpu_crit {
+				cpu_crit2: cpu_crit2 {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert2>;
+					cooling-device = <&CPU2 THERMAL_NO_LIMIT 7>;
+				};
+				map1 {
+					trip = <&cpu_warn2>;
+					cooling-device = <&CPU2 8 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu3-thermal {
@@ -2243,18 +2536,33 @@
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
-				cpu3_alert0: trip-point@0 {
+				cpu_alert3: cpu_alert3 {
 					temperature = <75000>;
 					hysteresis = <2000>;
+					type = "active";
+				};
+				cpu_warn3: cpu_warn3 {
+					temperature = <90000>;
+					hysteresis = <2000>;
 					type = "passive";
 				};
-
-				cpu3_crit: cpu_crit {
+				cpu_crit3: trip1 {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert3>;
+					cooling-device = <&CPU2 THERMAL_NO_LIMIT 7>;
+				};
+				map1 {
+					trip = <&cpu_warn3>;
+					cooling-device = <&CPU2 8 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu-thermal-top {
-- 
2.7.4

