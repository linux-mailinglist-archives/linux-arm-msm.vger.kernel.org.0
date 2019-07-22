Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E14BB6FFD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 14:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730448AbfGVMgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 08:36:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:35890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728062AbfGVMgE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 08:36:04 -0400
Received: from localhost.localdomain (unknown [223.226.98.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 005DC218EA;
        Mon, 22 Jul 2019 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563798962;
        bh=FU7zAC2QbmrlgE8+1tKNd6ttlLn1uxlG//xHVvT2zqc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wwkeygjWCkeEOEjpMptSRCINUDSWPZCRhFO5IhlJ8oMNwcE3ibBTXQobt875IYFC4
         hH3cBdDWAlf18xCgbFCFlwjUiLkvpOZiP1id5U93nBRlp2alb2WuFMqNTcR8FlU/wZ
         Z5aqHPhVSoipsktM45Dw6B0hsHDbJCjA/Cx+kpX8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: sdm845: remove unit name for thermal trip points
Date:   Mon, 22 Jul 2019 18:04:20 +0530
Message-Id: <20190722123422.4571-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722123422.4571-1-vkoul@kernel.org>
References: <20190722123422.4571-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The thermal trip points have unit name but no reg property, so we can
remove them

arch/arm64/boot/dts/qcom/sdm845.dtsi:2824.31-2828.7: Warning (unit_address_vs_reg): /thermal-zones/cpu0-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:2830.31-2834.7: Warning (unit_address_vs_reg): /thermal-zones/cpu0-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:2868.31-2872.7: Warning (unit_address_vs_reg): /thermal-zones/cpu1-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:2874.31-2878.7: Warning (unit_address_vs_reg): /thermal-zones/cpu1-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:2912.31-2916.7: Warning (unit_address_vs_reg): /thermal-zones/cpu2-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:2918.31-2922.7: Warning (unit_address_vs_reg): /thermal-zones/cpu2-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:2956.31-2960.7: Warning (unit_address_vs_reg): /thermal-zones/cpu3-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:2962.31-2966.7: Warning (unit_address_vs_reg): /thermal-zones/cpu3-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3000.31-3004.7: Warning (unit_address_vs_reg): /thermal-zones/cpu4-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3006.31-3010.7: Warning (unit_address_vs_reg): /thermal-zones/cpu4-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3044.31-3048.7: Warning (unit_address_vs_reg): /thermal-zones/cpu5-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3050.31-3054.7: Warning (unit_address_vs_reg): /thermal-zones/cpu5-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3088.31-3092.7: Warning (unit_address_vs_reg): /thermal-zones/cpu6-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3094.31-3098.7: Warning (unit_address_vs_reg): /thermal-zones/cpu6-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3132.31-3136.7: Warning (unit_address_vs_reg): /thermal-zones/cpu7-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3138.31-3142.7: Warning (unit_address_vs_reg): /thermal-zones/cpu7-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3176.32-3180.7: Warning (unit_address_vs_reg): /thermal-zones/aoss0-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3191.35-3195.7: Warning (unit_address_vs_reg): /thermal-zones/cluster0-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3211.35-3215.7: Warning (unit_address_vs_reg): /thermal-zones/cluster1-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3231.31-3235.7: Warning (unit_address_vs_reg): /thermal-zones/gpu-thermal-top/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3246.31-3250.7: Warning (unit_address_vs_reg): /thermal-zones/gpu-thermal-bottom/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3261.32-3265.7: Warning (unit_address_vs_reg): /thermal-zones/aoss1-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3276.35-3280.7: Warning (unit_address_vs_reg): /thermal-zones/q6-modem-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3291.30-3295.7: Warning (unit_address_vs_reg): /thermal-zones/mem-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3306.31-3310.7: Warning (unit_address_vs_reg): /thermal-zones/wlan-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3321.33-3325.7: Warning (unit_address_vs_reg): /thermal-zones/q6-hvx-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3336.33-3340.7: Warning (unit_address_vs_reg): /thermal-zones/camera-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3351.32-3355.7: Warning (unit_address_vs_reg): /thermal-zones/video-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/sdm845.dtsi:3366.32-3370.7: Warning (unit_address_vs_reg): /thermal-zones/modem-thermal/trips/trip-point@0: node has a unit name, but no reg property

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 58 ++++++++++++++--------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2985df032179..48bd07646eb4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2815,13 +2815,13 @@
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
-				cpu0_alert0: trip-point@0 {
+				cpu0_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu0_alert1: trip-point@1 {
+				cpu0_alert1: trip-point1 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -2859,13 +2859,13 @@
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
-				cpu1_alert0: trip-point@0 {
+				cpu1_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu1_alert1: trip-point@1 {
+				cpu1_alert1: trip-point1 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -2903,13 +2903,13 @@
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
-				cpu2_alert0: trip-point@0 {
+				cpu2_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu2_alert1: trip-point@1 {
+				cpu2_alert1: trip-point1 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -2947,13 +2947,13 @@
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
-				cpu3_alert0: trip-point@0 {
+				cpu3_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu3_alert1: trip-point@1 {
+				cpu3_alert1: trip-point1 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -2991,13 +2991,13 @@
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
-				cpu4_alert0: trip-point@0 {
+				cpu4_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu4_alert1: trip-point@1 {
+				cpu4_alert1: trip-point1 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -3035,13 +3035,13 @@
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
-				cpu5_alert0: trip-point@0 {
+				cpu5_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu5_alert1: trip-point@1 {
+				cpu5_alert1: trip-point1 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -3079,13 +3079,13 @@
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
-				cpu6_alert0: trip-point@0 {
+				cpu6_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu6_alert1: trip-point@1 {
+				cpu6_alert1: trip-point1 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -3123,13 +3123,13 @@
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
-				cpu7_alert0: trip-point@0 {
+				cpu7_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu7_alert1: trip-point@1 {
+				cpu7_alert1: trip-point1 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -3167,7 +3167,7 @@
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
-				aoss0_alert0: trip-point@0 {
+				aoss0_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3182,7 +3182,7 @@
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
-				cluster0_alert0: trip-point@0 {
+				cluster0_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3202,7 +3202,7 @@
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
-				cluster1_alert0: trip-point@0 {
+				cluster1_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3222,7 +3222,7 @@
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
-				gpu1_alert0: trip-point@0 {
+				gpu1_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3237,7 +3237,7 @@
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
-				gpu2_alert0: trip-point@0 {
+				gpu2_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3252,7 +3252,7 @@
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
-				aoss1_alert0: trip-point@0 {
+				aoss1_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3267,7 +3267,7 @@
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
-				q6_modem_alert0: trip-point@0 {
+				q6_modem_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3282,7 +3282,7 @@
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
-				mem_alert0: trip-point@0 {
+				mem_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3297,7 +3297,7 @@
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
-				wlan_alert0: trip-point@0 {
+				wlan_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3312,7 +3312,7 @@
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
-				q6_hvx_alert0: trip-point@0 {
+				q6_hvx_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3327,7 +3327,7 @@
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
-				camera_alert0: trip-point@0 {
+				camera_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3342,7 +3342,7 @@
 			thermal-sensors = <&tsens1 6>;
 
 			trips {
-				video_alert0: trip-point@0 {
+				video_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -3357,7 +3357,7 @@
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
-				modem_alert0: trip-point@0 {
+				modem_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
-- 
2.20.1

