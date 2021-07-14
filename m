Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD43F3C8AD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 20:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240013AbhGNS3E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 14:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhGNS3D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 14:29:03 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E007C061762
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 11:26:12 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id d15so2530493qte.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 11:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RRS66CMCGESLC61DINPldmtKLF6vfk+wtbaEbj9J3C0=;
        b=Hc4WRKVTMZG0W78GrnGBxgWVrV+jszbu0g5bheC/Vvt3Ru0YmX/ObZCBO/bsMtZIQf
         28ZXUvgN+/4PIFt8fw251yVBTlqjwyTRIbzbDrH9d+1I4Nm4910hhM7ygQN2mEwfG/MY
         ZWw+MVQU7/pQec9QiFvAoH1abrCg6/TeZWiicDUjyqUi07P5cVFiP/pFyvS/OBuEUEMA
         3/iJjFjA3POuiSRjDckPIpcWA2BYRQXjWJjhY/klcpEtfC1EvZZkxORfTXkseoUeunpN
         IWVr93VboPlbdsdjST98U2y8LFpgygNbEFivLSdZzoBLqLa7BPhbKbGP7z0PhOmTg8Lr
         o2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RRS66CMCGESLC61DINPldmtKLF6vfk+wtbaEbj9J3C0=;
        b=DvchvBYMNez1LdvqESrHX+LeBtiJQ4JeawE3oTKFkTff1k5fJNnFIIIDd5aQk1pJM2
         xB0NA5r6N71Km02oTpIkV1APzb/sK5dvII0OplfoDLT4RqT+f7Qeu2BCZIRRo39YdGEN
         WDh/zUzTExTpjao+p4azEAmKd4lDrL8GhNbWBh9nJ7gO0P9ZhmH10TOn4pPPp2ZGvgGt
         l7rj+RYiQpC/DPbpPVh4uRFIVivv4VRxrjZMc+xmgdaUH3neIxReGPRhPZZmaeScFAAX
         rowZD9+Iq8sDzALciwQDv9mXlgbOLPez1/Y22gnMlikwC1k4KXaxIs7rv6h92vh+EdnY
         CVhQ==
X-Gm-Message-State: AOAM531KaXNtuEir5ojj1olpBGGqESzj7EJdzzcAH3NYT3dH7W/LBY1G
        FJYHDQkAZ76QcjzNHV4IAws/Pw==
X-Google-Smtp-Source: ABdhPJzPMmBuZ9AS/CEdDpWK+vizec3mT/sU26seBEVUgCdcQzeDgAg9SQzmWJDduqFDpFkbElurXQ==
X-Received: by 2002:ac8:528f:: with SMTP id s15mr10174934qtn.282.1626287171217;
        Wed, 14 Jul 2021 11:26:11 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id x22sm1092109qto.34.2021.07.14.11.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 11:26:10 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: boot: dts: qcom: sm8150: Add CPU opp tables
Date:   Wed, 14 Jul 2021 14:26:10 -0400
Message-Id: <20210714182610.92972-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add OPP tables to scale DDR and L3 with CPUs for SM8150 SoCs.
This gives a significant performance boost for cpu-ddr loads.
Below is the results for mbw benchmark with and without the opp tables.

/mbw 1500
		Without l3/ddr scaling		With l3 ddr/scaling
MEMCPY(MiB/s)		3574				10448
DUMB(MiB/s)		3500				11721
MCBLOCK(MiB/s)		8976				23595

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 315 +++++++++++++++++++++++++++
 1 file changed, 315 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 51235a9521c2..298984423356 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <dt-bindings/interconnect/qcom,sm8150.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -51,6 +52,9 @@ CPU0: cpu@0 {
 			dynamic-power-coefficient = <232>;
 			next-level-cache = <&L2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
@@ -72,6 +76,9 @@ CPU1: cpu@100 {
 			dynamic-power-coefficient = <232>;
 			next-level-cache = <&L2_100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&CPU_PD1>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
@@ -91,6 +98,9 @@ CPU2: cpu@200 {
 			dynamic-power-coefficient = <232>;
 			next-level-cache = <&L2_200>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&CPU_PD2>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
@@ -109,6 +119,9 @@ CPU3: cpu@300 {
 			dynamic-power-coefficient = <232>;
 			next-level-cache = <&L2_300>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&CPU_PD3>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
@@ -127,6 +140,9 @@ CPU4: cpu@400 {
 			dynamic-power-coefficient = <369>;
 			next-level-cache = <&L2_400>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&CPU_PD4>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
@@ -145,6 +161,9 @@ CPU5: cpu@500 {
 			dynamic-power-coefficient = <369>;
 			next-level-cache = <&L2_500>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&CPU_PD5>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
@@ -163,6 +182,9 @@ CPU6: cpu@600 {
 			dynamic-power-coefficient = <369>;
 			next-level-cache = <&L2_600>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&CPU_PD6>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
@@ -181,6 +203,9 @@ CPU7: cpu@700 {
 			dynamic-power-coefficient = <421>;
 			next-level-cache = <&L2_700>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
+			operating-points-v2 = <&cpu7_opp_table>;
+			interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt SLAVE_EBI_CH0>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&CPU_PD7>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
@@ -263,6 +288,296 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 		};
 	};
 
+	cpu0_opp_table: cpu0_opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu0_opp1: opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-peak-kBps = <800000 9600000>;
+		};
+
+		cpu0_opp2: opp-403200000 {
+			opp-hz = /bits/ 64 <403200000>;
+			opp-peak-kBps = <800000 9600000>;
+		};
+
+		cpu0_opp3: opp-499200000 {
+			opp-hz = /bits/ 64 <499200000>;
+			opp-peak-kBps = <800000 12902400>;
+		};
+
+		cpu0_opp4: opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-peak-kBps = <800000 12902400>;
+		};
+
+		cpu0_opp5: opp-672000000 {
+			opp-hz = /bits/ 64 <672000000>;
+			opp-peak-kBps = <800000 15974400>;
+		};
+
+		cpu0_opp6: opp-768000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-peak-kBps = <1804000 19660800>;
+		};
+
+		cpu0_opp7: opp-844800000 {
+			opp-hz = /bits/ 64 <844800000>;
+			opp-peak-kBps = <1804000 19660800>;
+		};
+
+		cpu0_opp8: opp-940800000 {
+			opp-hz = /bits/ 64 <940800000>;
+			opp-peak-kBps = <1804000 22732800>;
+		};
+
+		cpu0_opp9: opp-1036800000 {
+			opp-hz = /bits/ 64 <1036800000>;
+			opp-peak-kBps = <1804000 22732800>;
+		};
+
+		cpu0_opp10: opp-1113600000 {
+			opp-hz = /bits/ 64 <1113600000>;
+			opp-peak-kBps = <2188000 25804800>;
+		};
+
+		cpu0_opp11: opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			opp-peak-kBps = <2188000 31948800>;
+		};
+
+		cpu0_opp12: opp-1305600000 {
+			opp-hz = /bits/ 64 <1305600000>;
+			opp-peak-kBps = <3072000 31948800>;
+		};
+
+		cpu0_opp13: opp-1382400000 {
+			opp-hz = /bits/ 64 <1382400000>;
+			opp-peak-kBps = <3072000 31948800>;
+		};
+
+		cpu0_opp14: opp-1478400000 {
+			opp-hz = /bits/ 64 <1478400000>;
+			opp-peak-kBps = <3072000 31948800>;
+		};
+
+		cpu0_opp15: opp-1555200000 {
+			opp-hz = /bits/ 64 <1555200000>;
+			opp-peak-kBps = <3072000 40550400>;
+		};
+
+		cpu0_opp16: opp-1632000000 {
+			opp-hz = /bits/ 64 <1632000000>;
+			opp-peak-kBps = <3072000 40550400>;
+		};
+
+		cpu0_opp17: opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <3072000 43008000>;
+		};
+
+		cpu0_opp18: opp-1785600000 {
+			opp-hz = /bits/ 64 <1785600000>;
+			opp-peak-kBps = <3072000 43008000>;
+		};
+	};
+
+	cpu4_opp_table: cpu4_opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu4_opp1: opp-710400000 {
+			opp-hz = /bits/ 64 <710400000>;
+			opp-peak-kBps = <1804000 15974400>;
+		};
+
+		cpu4_opp2: opp-825600000 {
+			opp-hz = /bits/ 64 <825600000>;
+			opp-peak-kBps = <2188000 19660800>;
+		};
+
+		cpu4_opp3: opp-940800000 {
+			opp-hz = /bits/ 64 <940800000>;
+			opp-peak-kBps = <2188000 22732800>;
+		};
+
+		cpu4_opp4: opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-peak-kBps = <3072000 25804800>;
+		};
+
+		cpu4_opp5: opp-1171200000 {
+			opp-hz = /bits/ 64 <1171200000>;
+			opp-peak-kBps = <3072000 31948800>;
+		};
+
+		cpu4_opp6: opp-1286400000 {
+			opp-hz = /bits/ 64 <1286400000>;
+			opp-peak-kBps = <4068000 31948800>;
+		};
+
+		cpu4_opp7: opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			opp-peak-kBps = <4068000 31948800>;
+		};
+
+		cpu4_opp8: opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <4068000 40550400>;
+		};
+
+		cpu4_opp9: opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			opp-peak-kBps = <4068000 40550400>;
+		};
+
+		cpu4_opp10: opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <4068000 43008000>;
+		};
+
+		cpu4_opp11: opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <6220000 43008000>;
+		};
+
+		cpu4_opp12: opp-1920000000 {
+			opp-hz = /bits/ 64 <1920000000>;
+			opp-peak-kBps = <6220000 49152000>;
+		};
+
+		cpu4_opp13: opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-peak-kBps = <7216000 49152000>;
+		};
+
+		cpu4_opp14: opp-2131200000 {
+			opp-hz = /bits/ 64 <2131200000>;
+			opp-peak-kBps = <8368000 49152000>;
+		};
+
+		cpu4_opp15: opp-2227200000 {
+			opp-hz = /bits/ 64 <2227200000>;
+			opp-peak-kBps = <8368000 51609600>;
+		};
+
+		cpu4_opp16: opp-2323200000 {
+			opp-hz = /bits/ 64 <2323200000>;
+			opp-peak-kBps = <8368000 51609600>;
+		};
+
+		cpu4_opp17: opp-2419200000 {
+			opp-hz = /bits/ 64 <2419200000>;
+			opp-peak-kBps = <8368000 51609600>;
+		};
+	};
+
+	cpu7_opp_table: cpu7_opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu7_opp1: opp-825600000 {
+			opp-hz = /bits/ 64 <825600000>;
+			opp-peak-kBps = <2188000 19660800>;
+		};
+
+		cpu7_opp2: opp-940800000 {
+			opp-hz = /bits/ 64 <940800000>;
+			opp-peak-kBps = <2188000 22732800>;
+		};
+
+		cpu7_opp3: opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-peak-kBps = <3072000 25804800>;
+		};
+
+		cpu7_opp4: opp-1171200000 {
+			opp-hz = /bits/ 64 <1171200000>;
+			opp-peak-kBps = <3072000 31948800>;
+		};
+
+		cpu7_opp5: opp-1286400000 {
+			opp-hz = /bits/ 64 <1286400000>;
+			opp-peak-kBps = <4068000 31948800>;
+		};
+
+		cpu7_opp6: opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			opp-peak-kBps = <4068000 31948800>;
+		};
+
+		cpu7_opp7: opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <4068000 40550400>;
+		};
+
+		cpu7_opp8: opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			opp-peak-kBps = <4068000 40550400>;
+		};
+
+		cpu7_opp9: opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <4068000 43008000>;
+		};
+
+		cpu7_opp10: opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <6220000 43008000>;
+		};
+
+		cpu7_opp11: opp-1920000000 {
+			opp-hz = /bits/ 64 <1920000000>;
+			opp-peak-kBps = <6220000 49152000>;
+		};
+
+		cpu7_opp12: opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-peak-kBps = <7216000 49152000>;
+		};
+
+		cpu7_opp13: opp-2131200000 {
+			opp-hz = /bits/ 64 <2131200000>;
+			opp-peak-kBps = <8368000 49152000>;
+		};
+
+		cpu7_opp14: opp-2227200000 {
+			opp-hz = /bits/ 64 <2227200000>;
+			opp-peak-kBps = <8368000 51609600>;
+		};
+
+		cpu7_opp15: opp-2323200000 {
+			opp-hz = /bits/ 64 <2323200000>;
+			opp-peak-kBps = <8368000 51609600>;
+		};
+
+		cpu7_opp16: opp-2419200000 {
+			opp-hz = /bits/ 64 <2419200000>;
+			opp-peak-kBps = <8368000 51609600>;
+		};
+
+		cpu7_opp17: opp-2534400000 {
+			opp-hz = /bits/ 64 <2534400000>;
+			opp-peak-kBps = <8368000 51609600>;
+		};
+
+		cpu7_opp18: opp-2649600000 {
+			opp-hz = /bits/ 64 <2649600000>;
+			opp-peak-kBps = <8368000 51609600>;
+		};
+
+		cpu7_opp19: opp-2745600000 {
+			opp-hz = /bits/ 64 <2745600000>;
+			opp-peak-kBps = <8368000 51609600>;
+		};
+
+		cpu7_opp20: opp-2841600000 {
+			opp-hz = /bits/ 64 <2841600000>;
+			opp-peak-kBps = <8368000 51609600>;
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8150", "qcom,scm";
-- 
2.25.1

