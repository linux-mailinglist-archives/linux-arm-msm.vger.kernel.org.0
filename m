Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE12212438
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 15:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgGBNLh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 09:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729131AbgGBNLh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 09:11:37 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F60C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 06:11:36 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f7so25270910wrw.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VRkLSe68HeOyGVQsN7VhavUIDqP2y1tp7YUeQiOMdkE=;
        b=oGjNnZF8WQU+gr6TiZ/5yslWAa3sCsBoYQOB6Gx6GyABEtysgtsdWxTAfiEII98kmC
         oeeKLEyonpvvvzDiptPv2EFbaK3QK3baWTdfSAX972HFbm2/StXRPMFCv9VFKFEl5FeM
         Hte2ZJG7IeWqI0rw3Ce4Xnvxo+VqGzxUlS+zHwLZ3+UZRrFR6vqkvgpw5rr2z8Ns04TL
         B0rKlopo5U0gT7KrWumWQIaFLqJK6quH5QSr+gELVLBBCnaYF4ohKQr6NQFH1f+XAyBj
         vedP0PsZtTg5dwetkm1RPshHGTmjv/aA3wDGFQv4TNImAWFBFG4zRgeJxJgZGkh/9KKP
         3/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VRkLSe68HeOyGVQsN7VhavUIDqP2y1tp7YUeQiOMdkE=;
        b=GlgIZObHQ09UkSGt7cvSHAyBeYAQOdcT7EAU+A00lQ+pAJsZB0MmaOemOz+2kOpkuQ
         HgvVgzSYswiWYJsWG50oQTqeBIZOsiW56B7hl9bRdEjWLYkFRY9eZwx+0Xi+3ablDWfx
         m7rPBBesf/7D0h9ZgiLLthF5/j9+SQV9TTU2EpP+VoGSQV0NiHPg8eCRTWuqeI9Rqj+b
         vUoU2qUutf/RvRlHA5NN5bJyn/uJFPzAWCVMiCDqpYoTAjAWD1oop8J95mN3ZcWU5tBL
         UvVQv8PQ/YdGiP8fCbBx9aVdZSCbx3g2ltxx5fwWV5JfvmqePWHbIcFfP9ed92w4x39r
         7KoQ==
X-Gm-Message-State: AOAM531k3wTl5HMYTZKfJrDVGAKAhN9PX2ESlN0APjDTOfaY/yP4Npdn
        pNvTcBPngAQ3hHIfDQFk63l9Pg==
X-Google-Smtp-Source: ABdhPJyWB2RCDKtqVv9nEnorre6P5JegjDBPhc9GoLsv6sqoZ92+pMZ3TZq90BYF0m/tVCr2CSgLSg==
X-Received: by 2002:adf:f7cb:: with SMTP id a11mr29580942wrq.291.1593695495336;
        Thu, 02 Jul 2020 06:11:35 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id 140sm5977248wmb.15.2020.07.02.06.11.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 06:11:34 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, amit.kucheria@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v4 3/3] arch: arm64: dts: msm8996: Add opp and thermal
Date:   Thu,  2 Jul 2020 15:16:00 +0200
Message-Id: <1593695762-19823-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593695762-19823-1-git-send-email-loic.poulain@linaro.org>
References: <1593695762-19823-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 318 ++++++++++++++++++++++++++++++++--
 1 file changed, 307 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9951286..61489fb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -43,6 +44,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
+			clocks = <&kryocc 0>;
+			operating-points-v2 = <&cluster0_opp>;
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 			      compatible = "cache";
@@ -57,6 +61,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
+			clocks = <&kryocc 0>;
+			operating-points-v2 = <&cluster0_opp>;
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
 		};
 
@@ -67,6 +74,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
+			clocks = <&kryocc 1>;
+			operating-points-v2 = <&cluster1_opp>;
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_1>;
 			L2_1: l2-cache {
 			      compatible = "cache";
@@ -81,6 +91,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
+			clocks = <&kryocc 1>;
+			operating-points-v2 = <&cluster1_opp>;
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_1>;
 		};
 
@@ -424,7 +437,7 @@
 				bits = <1 4>;
 			};
 
-			gpu_speed_bin: gpu_speed_bin@133 {
+			speedbin_efuse: speedbin@133 {
 				reg = <0x133 0x1>;
 				bits = <5 3>;
 			};
@@ -642,7 +655,7 @@
 			power-domains = <&mmcc GPU_GX_GDSC>;
 			iommus = <&adreno_smmu 0>;
 
-			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cells = <&speedbin_efuse>;
 			nvmem-cell-names = "speed_bin";
 
 			qcom,gpu-quirk-two-pass-use-wfi;
@@ -1740,8 +1753,9 @@
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
@@ -2209,6 +2223,229 @@
 	sound: sound {
 	};
 
+	cluster0_opp: opp_table0 {
+		compatible = "operating-points-v2-kryo-cpu";
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
+		compatible = "operating-points-v2-kryo-cpu";
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
@@ -2222,13 +2459,28 @@
 					hysteresis = <2000>;
 					type = "passive";
 				};
-
-				cpu0_crit: cpu_crit {
+				cpu0_alert1: trip-point1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit0: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_alert0>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT 7>;
+				};
+				map1 {
+					trip = <&cpu0_alert1>;
+					cooling-device = <&CPU0 8 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu1-thermal {
@@ -2243,13 +2495,28 @@
 					hysteresis = <2000>;
 					type = "passive";
 				};
-
-				cpu1_crit: cpu_crit {
+				cpu1_alert1: trip-point1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit1: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu1_alert0>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT 7>;
+				};
+				map1 {
+					trip = <&cpu1_alert1>;
+					cooling-device = <&CPU0 8 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu2-thermal {
@@ -2264,13 +2531,27 @@
 					hysteresis = <2000>;
 					type = "passive";
 				};
-
-				cpu2_crit: cpu_crit {
+				cpu2_alert1: trip-point1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit2: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu2_alert0>;
+					cooling-device = <&CPU2 THERMAL_NO_LIMIT 7>;
+				};
+				map1 {
+					trip = <&cpu2_alert1>;
+					cooling-device = <&CPU2 8 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu3-thermal {
@@ -2285,13 +2566,28 @@
 					hysteresis = <2000>;
 					type = "passive";
 				};
-
-				cpu3_crit: cpu_crit {
+				cpu3_alert1: trip-point1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu_crit3: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu3_alert0>;
+					cooling-device = <&CPU2 THERMAL_NO_LIMIT 7>;
+				};
+				map1 {
+					trip = <&cpu3_alert1>;
+					cooling-device = <&CPU2 8 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu-thermal-top {
-- 
2.7.4

