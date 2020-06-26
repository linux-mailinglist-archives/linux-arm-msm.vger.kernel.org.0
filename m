Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A19220B912
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 21:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgFZTJH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 15:09:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26598 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbgFZTJH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 15:09:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593198546; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=3xDY8SO+d1kYfnn7ZdhCVx7CAMTxeHp8kN80+7K9VMs=; b=XEksS+7SmBqYWzlLAt7moyFU9D8OpPh6cM0WSi5vjYMD0yNpbMAMWTDeQri8oY3j4vZjyngU
 l7/5H6Kwq3u1UEPyTwA83lebeKtUkimi/813c4Un4vIUTEKMDlsg0B3Xyec7yR90+V51u9J5
 3kjuuGgPwLkMQrCjO3NVIguS4bw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5ef647c4c76a4e7a2a803bdc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 19:08:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C8405C433A0; Fri, 26 Jun 2020 19:08:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D276C433C8;
        Fri, 26 Jun 2020 19:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D276C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, saravanak@google.com,
        dianders@chromium.org, mka@chromium.org
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vincent.guittot@linaro.org,
        amit.kucheria@linaro.org, robdclark@chromium.org,
        evgreen@chromium.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7180: Add cpu OPP tables
Date:   Sat, 27 Jun 2020 00:38:08 +0530
Message-Id: <20200626190808.8716-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add OPP tables required to scale DDR/L3 per freq-domain on SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v2:
 * drop interconnect-tag property

v1: https://patchwork.kernel.org/patch/11527597/

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 160 +++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ad57df278a799..2be81a2a1512a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sc7180.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc7180.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
@@ -130,6 +131,9 @@ &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC &mc_virt SLAVE_EBI1>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			next-level-cache = <&L2_0>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
@@ -153,6 +157,9 @@ &LITTLE_CPU_SLEEP_1
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&L2_100>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC &mc_virt SLAVE_EBI1>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_100: l2-cache {
@@ -172,6 +179,9 @@ &LITTLE_CPU_SLEEP_1
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&L2_200>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC &mc_virt SLAVE_EBI1>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_200: l2-cache {
@@ -191,6 +201,9 @@ &LITTLE_CPU_SLEEP_1
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&L2_300>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC &mc_virt SLAVE_EBI1>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_300: l2-cache {
@@ -210,6 +223,9 @@ &LITTLE_CPU_SLEEP_1
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&L2_400>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC &mc_virt SLAVE_EBI1>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_400: l2-cache {
@@ -229,6 +245,9 @@ &LITTLE_CPU_SLEEP_1
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&L2_500>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC &mc_virt SLAVE_EBI1>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_500: l2-cache {
@@ -248,6 +267,9 @@ &BIG_CPU_SLEEP_1
 			capacity-dmips-mhz = <1740>;
 			dynamic-power-coefficient = <405>;
 			next-level-cache = <&L2_600>;
+			operating-points-v2 = <&cpu6_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC &mc_virt SLAVE_EBI1>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_600: l2-cache {
@@ -267,6 +289,9 @@ &BIG_CPU_SLEEP_1
 			capacity-dmips-mhz = <1740>;
 			dynamic-power-coefficient = <405>;
 			next-level-cache = <&L2_700>;
+			operating-points-v2 = <&cpu6_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC &mc_virt SLAVE_EBI1>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_700: l2-cache {
@@ -366,6 +391,141 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 		};
 	};
 
+	cpu0_opp_table: cpu0_opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu0_opp1: opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-peak-kBps = <1200000 4800000>;
+		};
+
+		cpu0_opp2: opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-peak-kBps = <1200000 4800000>;
+		};
+
+		cpu0_opp3: opp-768000000 {
+			opp-hz = /bits/ 64 <768000000>;
+			opp-peak-kBps = <1200000 4800000>;
+		};
+
+		cpu0_opp4: opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <1804000 8908800>;
+		};
+
+		cpu0_opp5: opp-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-peak-kBps = <2188000 12902400>;
+		};
+
+		cpu0_opp6: opp-1324800000 {
+			opp-hz = /bits/ 64 <1324800000>;
+			opp-peak-kBps = <2188000 12902400>;
+		};
+
+		cpu0_opp7: opp-1516800000 {
+			opp-hz = /bits/ 64 <1516800000>;
+			opp-peak-kBps = <3072000 15052800>;
+		};
+
+		cpu0_opp8: opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			opp-peak-kBps = <3072000 15052800>;
+		};
+
+		cpu0_opp9: opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <3072000 15052800>;
+		};
+
+		cpu0_opp10: opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <4068000 22425600>;
+		};
+	};
+
+	cpu6_opp_table: cpu6_opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu6_opp1: opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-peak-kBps = <2188000 8908800>;
+		};
+
+		cpu6_opp2: opp-652800000 {
+			opp-hz = /bits/ 64 <652800000>;
+			opp-peak-kBps = <2188000 8908800>;
+		};
+
+		cpu6_opp3: opp-825600000 {
+			opp-hz = /bits/ 64 <825600000>;
+			opp-peak-kBps = <2188000 8908800>;
+		};
+
+		cpu6_opp4: opp-979200000 {
+			opp-hz = /bits/ 64 <979200000>;
+			opp-peak-kBps = <2188000 8908800>;
+		};
+
+		cpu6_opp5: opp-1113600000 {
+			opp-hz = /bits/ 64 <1113600000>;
+			opp-peak-kBps = <2188000 8908800>;
+		};
+
+		cpu6_opp6: opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <4068000 12902400>;
+		};
+
+		cpu6_opp7: opp-1555200000 {
+			opp-hz = /bits/ 64 <1555200000>;
+			opp-peak-kBps = <4068000 15052800>;
+		};
+
+		cpu6_opp8: opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <6220000 19353600>;
+		};
+
+		cpu6_opp9: opp-1843200000 {
+			opp-hz = /bits/ 64 <1843200000>;
+			opp-peak-kBps = <6220000 19353600>;
+		};
+
+		cpu6_opp10: opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			opp-peak-kBps = <6220000 22425600>;
+		};
+
+		cpu6_opp11: opp-1996800000 {
+			opp-hz = /bits/ 64 <1996800000>;
+			opp-peak-kBps = <6220000 22425600>;
+		};
+
+		cpu6_opp12: opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+			opp-peak-kBps = <6220000 22425600>;
+		};
+
+		cpu6_opp13: opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-peak-kBps = <7216000 22425600>;
+		};
+
+		cpu6_opp14: opp-2323200000 {
+			opp-hz = /bits/ 64 <2323200000>;
+			opp-peak-kBps = <7216000 22425600>;
+		};
+
+		cpu6_opp15: opp-2400000000 {
+			opp-hz = /bits/ 64 <2400000000>;
+			opp-peak-kBps = <8532000 23347200>;
+		};
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

