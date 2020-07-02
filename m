Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3DB212005
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 11:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgGBJe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 05:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbgGBJeZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 05:34:25 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 380A5C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 02:34:25 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l17so25990676wmj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IRsd9dMY0lYRH/GlTWgZTWOtNoO1EUVCQMgPAYbXab8=;
        b=LSULLNeKphjws63Ls7Xy8qxZCZGt+C2OgElKShkPveQ46w+eZu5J5Dn734D1LVKWCG
         O1oNSVHm+n2BvqkykeCPWspzWsNTqqqgJGJCiKK4Wlh6RQf7qcXeBVuI09vT9agCs1yo
         sy/GLZ5kvMz/YNf4nhs/NzYvR0RSrqXN6bTJtGZqrHD+z95cs2V1On0nbDtrfi/osyU7
         EvxrfLlAvojmryt+88/Ka2f8IfnqAZb3RAuXermrOVFzsCl40iFwQ5ekMr0+165T3Vwl
         2kbncQhUpTEjoUNikhPQbiBJ5NicJj+OWAqdzPf+7+tLgm9fu2LfSD5bGBZLpHot6vNl
         Kl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IRsd9dMY0lYRH/GlTWgZTWOtNoO1EUVCQMgPAYbXab8=;
        b=cFaZWgXKsaNOvEmHoCO5FKLbgB4UT109YNg7FIdIOKeRw6LfSE6V7wAktMNTsRQNYt
         QkNjSUbG38lPojrLD+AxgLR+wGjbd+jqj9tv5fPQDiOuzMXoE08x2bL2J6bGH1q99249
         0FjHXFylJESbobYrB1t9ysZHdfdnHUu1p7seR2Brw92JidbdhzZEFS2ANdWsVgN+Y2ii
         a5pokiM612w+NqA0+uEXSz5KZBFINIkj0EWL08/ldnKBLtiUHYmEncsC0KCBUmWIq3No
         6M8+CisbkzXV3koIoo/OYHUpdddCr+BQIrL1PPCZybwh7v8zSKswpvpEPUe1gb7b81eA
         J96g==
X-Gm-Message-State: AOAM5304nwRm2CK7Sbs0OvBwrV8gcAVYVlKeboYy1Ieeo3+zh6hymHxf
        b732q68do6cOpqZ4JBZMmmrDzw==
X-Google-Smtp-Source: ABdhPJwu+hOJMXTw76PmcfJLFzLSUr0KLHSGBmpvQVaXKfSNCL+CITIX8b0DjCSRNmAG/RjRVwukxg==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr31884563wmb.165.1593682463771;
        Thu, 02 Jul 2020 02:34:23 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id b184sm10326345wmc.20.2020.07.02.02.34.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 02:34:23 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 4/4] arch: arm64: dts: msm8996: Add opp and thermal
Date:   Thu,  2 Jul 2020 11:39:23 +0200
Message-Id: <1593682763-31368-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593682763-31368-1-git-send-email-loic.poulain@linaro.org>
References: <1593682763-31368-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

