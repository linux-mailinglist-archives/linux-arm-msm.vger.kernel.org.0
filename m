Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7373D7D8D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2019 11:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731297AbfHAJwd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Aug 2019 05:52:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:45842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728654AbfHAJwb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Aug 2019 05:52:31 -0400
Received: from localhost.localdomain (unknown [122.178.237.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B1D29216C8;
        Thu,  1 Aug 2019 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564653150;
        bh=vS3r7EDFHKKuCiOyahJwnQM8/yabrh5EDGpjuhjGZn4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y6k1nJoMQzA04cpRA087bmkFWYVjdQ5yyNTx1JDY8kbSYhuNq52vbkUdpJ3MF5G9l
         n/FDjWu8Nk0oFTxRdJoK2Oe+wNe3Ej8lrieg9asHWNplasU05TZlSR6qrlB/KXQNVa
         J10FBjm/0dzGqerS6udX5zsZXrBbUMl3OG/kWk74=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs404: remove unit name for thermal trip points
Date:   Thu,  1 Aug 2019 15:20:49 +0530
Message-Id: <20190801095049.13855-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801095049.13855-1-vkoul@kernel.org>
References: <20190801095049.13855-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The thermal trip points have unit name but no reg property, so we can
remove them

arch/arm64/boot/dts/qcom/qcs404.dtsi:1080.31-1084.7: Warning (unit_address_vs_reg): /thermal-zones/aoss-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1095.33-1099.7: Warning (unit_address_vs_reg): /thermal-zones/q6-hvx-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1110.32-1114.7: Warning (unit_address_vs_reg): /thermal-zones/lpass-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1125.31-1129.7: Warning (unit_address_vs_reg): /thermal-zones/wlan-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1140.34-1144.7: Warning (unit_address_vs_reg): /thermal-zones/cluster-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1145.34-1149.7: Warning (unit_address_vs_reg): /thermal-zones/cluster-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1174.31-1178.7: Warning (unit_address_vs_reg): /thermal-zones/cpu0-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1179.31-1183.7: Warning (unit_address_vs_reg): /thermal-zones/cpu0-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1208.31-1212.7: Warning (unit_address_vs_reg): /thermal-zones/cpu1-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1213.31-1217.7: Warning (unit_address_vs_reg): /thermal-zones/cpu1-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1242.31-1246.7: Warning (unit_address_vs_reg): /thermal-zones/cpu2-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1247.31-1251.7: Warning (unit_address_vs_reg): /thermal-zones/cpu2-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1276.31-1280.7: Warning (unit_address_vs_reg): /thermal-zones/cpu3-thermal/trips/trip-point@0: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1281.31-1285.7: Warning (unit_address_vs_reg): /thermal-zones/cpu3-thermal/trips/trip-point@1: node has a unit name, but no reg property
arch/arm64/boot/dts/qcom/qcs404.dtsi:1310.30-1314.7: Warning (unit_address_vs_reg): /thermal-zones/gpu-thermal/trips/trip-point@0: node has a unit name, but no reg property

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3d0789775009..6d91dae5aee0 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1077,7 +1077,7 @@
 			thermal-sensors = <&tsens 0>;
 
 			trips {
-				aoss_alert0: trip-point@0 {
+				aoss_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -1092,7 +1092,7 @@
 			thermal-sensors = <&tsens 1>;
 
 			trips {
-				q6_hvx_alert0: trip-point@0 {
+				q6_hvx_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -1107,7 +1107,7 @@
 			thermal-sensors = <&tsens 2>;
 
 			trips {
-				lpass_alert0: trip-point@0 {
+				lpass_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -1122,7 +1122,7 @@
 			thermal-sensors = <&tsens 3>;
 
 			trips {
-				wlan_alert0: trip-point@0 {
+				wlan_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -1137,12 +1137,12 @@
 			thermal-sensors = <&tsens 4>;
 
 			trips {
-				cluster_alert0: trip-point@0 {
+				cluster_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cluster_alert1: trip-point@1 {
+				cluster_alert1: trip-point1 {
 					temperature = <105000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -1171,12 +1171,12 @@
 			thermal-sensors = <&tsens 5>;
 
 			trips {
-				cpu0_alert0: trip-point@0 {
+				cpu0_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cpu0_alert1: trip-point@1 {
+				cpu0_alert1: trip-point1 {
 					temperature = <105000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -1205,12 +1205,12 @@
 			thermal-sensors = <&tsens 6>;
 
 			trips {
-				cpu1_alert0: trip-point@0 {
+				cpu1_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cpu1_alert1: trip-point@1 {
+				cpu1_alert1: trip-point1 {
 					temperature = <105000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -1239,12 +1239,12 @@
 			thermal-sensors = <&tsens 7>;
 
 			trips {
-				cpu2_alert0: trip-point@0 {
+				cpu2_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cpu2_alert1: trip-point@1 {
+				cpu2_alert1: trip-point1 {
 					temperature = <105000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -1273,12 +1273,12 @@
 			thermal-sensors = <&tsens 8>;
 
 			trips {
-				cpu3_alert0: trip-point@0 {
+				cpu3_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "hot";
 				};
-				cpu3_alert1: trip-point@1 {
+				cpu3_alert1: trip-point1 {
 					temperature = <105000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -1307,7 +1307,7 @@
 			thermal-sensors = <&tsens 9>;
 
 			trips {
-				gpu_alert0: trip-point@0 {
+				gpu_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "hot";
-- 
2.20.1

