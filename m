Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350FE22616E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 15:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgGTN5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 09:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgGTN47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 09:56:59 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF9DC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:56:59 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f18so18003038wrs.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sNTihca2iJLs2+0HORPy2PDaDwsDFARw25NPQ7hmlqM=;
        b=DWQ7iWkLTMUpQO7OxNv8YrcAJwy67YuKvQdnet6MIY9u6u8Azhxkcd5Wbyp8txINJM
         Zrh4kQ2RGTWMbapv5lGzz2W7ScNjZyo2XqZ2TYQq68xmdvP+F1uakEYo/yZ3XvcttbIQ
         D0vw/qmsewx9Y8naRR+FzbvZfwL5Sw5gLY9ByZEfZuruDIcvmGgVkEMCHony3pDB/CXT
         MgPuwQcAZocxvODKlpJ3QF8h4p3TixWFHLNc44rwAO3diN8ZJJuSewaLFbDuJliZXPKb
         OgjUjKU5OiXP6chdYPFXXQ5LnoCC2+tIV5tAo5vg7hokm3BC35oYucwF74M7WqPAAg5u
         NpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sNTihca2iJLs2+0HORPy2PDaDwsDFARw25NPQ7hmlqM=;
        b=IDyIME+qUM2fUnTx5ifXkZsbD0aHnxC0wjuldK4nSBCPJaKtix6ujBgIhDKazK/zpg
         MR3fTu7N1AZSFTFyDcyNdWFDukgzeIBiXPv470bRWE6oHZIWX0XdK7Lbq7IMit6GE/p2
         JXgqmn3vwQPotQ4cfj6Lwmiu9J77PyYPvYWXXduwmZA+Rv4Tt0XKiiIglU1UaB8F1WWP
         iQ0a9rBmiFM2YCZOBds6Z3M2P/erdGX37zfZWN92JsoOLhIRIHS1E07LMJKZwXD0xfMb
         4GJwSnii8gMF3TZP0LLQ0hYEfRLQfHfU9rDrBVo2GGIlMmE2S+yUvaZGGDh7Mw9b2b0F
         m22A==
X-Gm-Message-State: AOAM532hpXhSd9k0acaQrYREzbYf351/kY+NS1whPSs6kTWMjG3FmgJ2
        qLCIq3UY8R7+1wD9nlXYk7JW/w==
X-Google-Smtp-Source: ABdhPJxyNcrQUQSvGbN6EcbqxjNWucCEclgKHkSKwhS6/STdvRVqFtBO44hDKN00ZZ953tQB7yopOQ==
X-Received: by 2002:adf:db42:: with SMTP id f2mr22164043wrj.298.1595253418062;
        Mon, 20 Jul 2020 06:56:58 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id d10sm32776743wrx.66.2020.07.20.06.56.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 06:56:57 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, bjorn.andersson@linaro.org,
        robh@kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 5/5] arch: arm64: dts: msm8996: Add CPU opps and thermal
Date:   Mon, 20 Jul 2020 16:02:20 +0200
Message-Id: <1595253740-29466-6-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
References: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the operating points capabilities of the kryo CPUs, that can be
used for frequency scaling. There are two differents operating point
tables, one for the big cluster and one for the LITTLE cluster.

This frequency scaling support can then be used as a passive cooling
device (cpufreq cooling device).

Only add nominal fmax for now, since there is no dynamic control of
VDD APC (s11..) which is statically set at its nominal value.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 306 +++++++++++++++++++++++++++++++++-
 1 file changed, 301 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2811b8c1..94738ea 100644
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
+				cpu0_alert1: trip-point1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu0_crit: cpu_crit {
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
+				cpu1_alert1: trip-point1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu1_crit: cpu_crit {
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
+				cpu2_alert1: trip-point1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu2_crit: cpu_crit {
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
+				cpu3_alert1: trip-point1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				cpu3_crit: cpu_crit {
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

