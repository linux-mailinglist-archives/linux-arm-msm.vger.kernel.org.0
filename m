Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAA23FF5F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 23:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347656AbhIBVxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 17:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347649AbhIBVw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 17:52:59 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26523C061764
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Sep 2021 14:52:01 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id j1so2317344pjv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Sep 2021 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9AqTKY0JGH3Jbb0gSF8IAPFfJNs3HpHt5YPKABagQcg=;
        b=TroGmfhH3lliDy7nlIOGWdb8FcrKoEI+zBXUBB6LhwgRqJT8rJC21cyTvnHW4qoRxl
         QGkBtZphdfZX0pDta6HxNcOrxaZp/XzXyu4UEegOggZ1HeO+8uf3eiMXj6S1cO519f49
         77LrIwknzOVBGaEo63dyCEibuIS8rsFgQikOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9AqTKY0JGH3Jbb0gSF8IAPFfJNs3HpHt5YPKABagQcg=;
        b=Yuam2o0SU1woZwYUjNyOvXqI829cMh8RSlXU2UrQ54Ll3B9CRm+L5TFW6ihQWDCJyk
         5eObegORSzOI3af805RIJ0+cU4oiqJD+NOWN456ByJufdpjDUoaJdzoP/Jb3TXmRqpTD
         9mQWOJAdvq4h330Kevi8md2DuQ3SC/QbXFQubGAhZ5wOLH4iEfuemy4xJFYs0XRPRqzZ
         0zeZegBPf0U0g6t7kzgofMkVXcNTF5ogqunIZBXlE1WGP4+FbNJlarEgbIilKlo7CxDh
         Jn8IhdDzTY0qYkCI4hYJTW5pCug2l+MNtibOtkiGhhwKj3/1cfGuEdG+facbC7cQ4aIb
         FHgw==
X-Gm-Message-State: AOAM533YIXiaHEpgEvlhkB3pyaiMlsQv48raucHPIqKkK4ln4E3kkn9y
        1oaM+BTxuP5Dhe3/4a83soPe5g==
X-Google-Smtp-Source: ABdhPJylvBl1JmAbtW9/3wfeRjqeJYYgIcG7Zd4dlOWFSsdtiIDQh3QV3DSI41U8Pz3Avexd4dUG8w==
X-Received: by 2002:a17:902:7607:b0:138:9422:5122 with SMTP id k7-20020a170902760700b0013894225122mr356997pll.75.1630619520601;
        Thu, 02 Sep 2021 14:52:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:1a2a:6b44:fbf0:cbcc])
        by smtp.gmail.com with ESMTPSA id l22sm3015569pjz.54.2021.09.02.14.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 14:52:00 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     mka@chromium.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sc7180: Base dynamic CPU power coefficients in reality
Date:   Thu,  2 Sep 2021 14:51:37 -0700
Message-Id: <20210902145127.v2.1.I049b30065f3c715234b6303f55d72c059c8625eb@changeid>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc7180's dynamic-power-coefficient violates the device tree bindings.
The bindings (arm/cpus.yaml) say that the units for the
dynamic-power-coefficient are supposed to be "uW/MHz/V^2". The ones for
sc7180 aren't this. Qualcomm arbitrarily picked 100 for the "little" CPUs
and then picked a number for the big CPU based on this.

At the time, there was a giant dicussion about this. Apparently Qualcomm
Engineers were instructed not to share the actual numbers here. As part
of the discussion, I pointed out [1] that these numbers shouldn't really
be secret since once a device is shipping anyone can just run a script
and produce them. This patch is the result of running the script I posted
in that discussion on sc7180-trogdor-coachz, which is currently available
for purchase by consumers.

[1] https://lore.kernel.org/r/CAD=FV=U1FP0e3_AVHpauUUZtD-5X3XCwh5aT9fH_8S_FFML2Uw@mail.gmail.com/

I ran the script four times, measuring little, big, little, big. I used
the 64-bit version of dhrystone 2.2 in my test. I got these results:

576 kHz, 596 mV, 20 mW, 88 Cx
768 kHz, 596 mV, 32 mW, 122 Cx
1017 kHz, 660 mV, 45 mW, 97 Cx
1248 kHz, 720 mV, 87 mW, 139 Cx
1324 kHz, 756 mV, 109 mW, 148 Cx
1516 kHz, 828 mV, 150 mW, 148 Cx
1612 kHz, 884 mV, 182 mW, 147 Cx
1708 kHz, 884 mV, 192 mW, 146 Cx
1804 kHz, 884 mV, 207 mW, 149 Cx
Your dynamic-power-coefficient for cpu 0: 132

825 kHz, 596 mV, 142 mW, 401 Cx
979 kHz, 628 mV, 183 mW, 427 Cx
1113 kHz, 656 mV, 224 mW, 433 Cx
1267 kHz, 688 mV, 282 mW, 449 Cx
1555 kHz, 812 mV, 475 mW, 450 Cx
1708 kHz, 828 mV, 566 mW, 478 Cx
1843 kHz, 884 mV, 692 mW, 476 Cx
1900 kHz, 884 mV, 722 mW, 482 Cx
1996 kHz, 916 mV, 814 mW, 482 Cx
2112 kHz, 916 mV, 862 mW, 483 Cx
2208 kHz, 916 mV, 962 mW, 521 Cx
2323 kHz, 940 mV, 1060 mW, 517 Cx
2400 kHz, 956 mV, 1133 mW, 518 Cx
Your dynamic-power-coefficient for cpu 6: 471

576 kHz, 596 mV, 26 mW, 103 Cx
768 kHz, 596 mV, 40 mW, 147 Cx
1017 kHz, 660 mV, 54 mW, 114 Cx
1248 kHz, 720 mV, 97 mW, 151 Cx
1324 kHz, 756 mV, 113 mW, 150 Cx
1516 kHz, 828 mV, 154 mW, 148 Cx
1612 kHz, 884 mV, 194 mW, 155 Cx
1708 kHz, 884 mV, 203 mW, 152 Cx
1804 kHz, 884 mV, 219 mW, 155 Cx
Your dynamic-power-coefficient for cpu 0: 142

825 kHz, 596 mV, 148 mW, 530 Cx
979 kHz, 628 mV, 189 mW, 475 Cx
1113 kHz, 656 mV, 230 mW, 461 Cx
1267 kHz, 688 mV, 287 mW, 466 Cx
1555 kHz, 812 mV, 469 mW, 445 Cx
1708 kHz, 828 mV, 567 mW, 480 Cx
1843 kHz, 884 mV, 699 mW, 482 Cx
1900 kHz, 884 mV, 719 mW, 480 Cx
1996 kHz, 916 mV, 814 mW, 484 Cx
2112 kHz, 916 mV, 861 mW, 483 Cx
2208 kHz, 916 mV, 963 mW, 522 Cx
2323 kHz, 940 mV, 1063 mW, 520 Cx
2400 kHz, 956 mV, 1135 mW, 519 Cx
Your dynamic-power-coefficient for cpu 6: 489

As you can see, the calculations aren't perfectly consistent but
roughly you could say about 480 for big and 137 for little.

The ratio between these numbers isn't quite the same as the ratio
between the two numbers that Qualcomm used. Perhaps this is because
Qualcomm measured something slightly different than the 64-bit version
of dhrystone 2.2 or perhaps it's because they fudged these numbers a
bit (and fudged the capacity-dmips-mhz). As per discussion [2], let's
use the numbers I came up with and also un-fudge
capacity-dmips-mhz. While unfudging capacity-dmips-mhz, let's scale it
so that bigs are 1024 which seems to be the common practice.

In general these numbers don't need to be perfectly exact. In fact,
they can't be since the CPU power depends a lot on what's being run on
the CPU and the big/little CPUs are each more or less efficient in
different operations. Historically running the 32-bit vs. 64-bit
versions of dhrystone produced notably different numbers, though I
didn't test this time.

We also need to scale all of the sustainable-power numbers by the same
amount. I scale ones related to the big CPUs by the adjustment I made
to the big dynamic-power-coefficient and the ones related to the
little CPUs by the adjustment I made to the little
dynamic-power-coefficient.

[2] https://lore.kernel.org/r/0a865b6e-be34-6371-f9f2-9913ee1c5608@codeaurora.org/

Fixes: 71f873169a80 ("arm64: dts: qcom: sc7180: Add dynamic CPU power coefficients")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Unfudge capacity-dmips-mhz too.
- Don't keep the ratios the same.

 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  2 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  8 +--
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 52 +++++++++----------
 3 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index a758e4d22612..81098aa9687b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -33,7 +33,7 @@ skin_temp_thermal: skin-temp-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&pm6150_adc_tm 1>;
-			sustainable-power = <814>;
+			sustainable-power = <965>;
 
 			trips {
 				skin_temp_alert0: trip-point0 {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index a246dbd74cc1..b7b5264888b7 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -44,7 +44,7 @@ &cpu6_alert1 {
 };
 
 &cpu6_thermal {
-	sustainable-power = <948>;
+	sustainable-power = <1124>;
 };
 
 &cpu7_alert0 {
@@ -56,7 +56,7 @@ &cpu7_alert1 {
 };
 
 &cpu7_thermal {
-	sustainable-power = <948>;
+	sustainable-power = <1124>;
 };
 
 &cpu8_alert0 {
@@ -68,7 +68,7 @@ &cpu8_alert1 {
 };
 
 &cpu8_thermal {
-	sustainable-power = <948>;
+	sustainable-power = <1124>;
 };
 
 &cpu9_alert0 {
@@ -80,7 +80,7 @@ &cpu9_alert1 {
 };
 
 &cpu9_thermal {
-	sustainable-power = <948>;
+	sustainable-power = <1124>;
 };
 
 &gpio_keys {
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 47b20ba69057..2808a87b6861 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -137,8 +137,8 @@ CPU0: cpu@0 {
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <1024>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <415>;
+			dynamic-power-coefficient = <137>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
@@ -162,8 +162,8 @@ CPU1: cpu@100 {
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <1024>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <415>;
+			dynamic-power-coefficient = <137>;
 			next-level-cache = <&L2_100>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
@@ -184,8 +184,8 @@ CPU2: cpu@200 {
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <1024>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <415>;
+			dynamic-power-coefficient = <137>;
 			next-level-cache = <&L2_200>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
@@ -206,8 +206,8 @@ CPU3: cpu@300 {
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <1024>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <415>;
+			dynamic-power-coefficient = <137>;
 			next-level-cache = <&L2_300>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
@@ -228,8 +228,8 @@ CPU4: cpu@400 {
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <1024>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <415>;
+			dynamic-power-coefficient = <137>;
 			next-level-cache = <&L2_400>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
@@ -250,8 +250,8 @@ CPU5: cpu@500 {
 			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
 					   &LITTLE_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <1024>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <415>;
+			dynamic-power-coefficient = <137>;
 			next-level-cache = <&L2_500>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
@@ -272,8 +272,8 @@ CPU6: cpu@600 {
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <1740>;
-			dynamic-power-coefficient = <405>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <480>;
 			next-level-cache = <&L2_600>;
 			operating-points-v2 = <&cpu6_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
@@ -294,8 +294,8 @@ CPU7: cpu@700 {
 			cpu-idle-states = <&BIG_CPU_SLEEP_0
 					   &BIG_CPU_SLEEP_1
 					   &CLUSTER_SLEEP_0>;
-			capacity-dmips-mhz = <1740>;
-			dynamic-power-coefficient = <405>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <480>;
 			next-level-cache = <&L2_700>;
 			operating-points-v2 = <&cpu6_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
@@ -3592,7 +3592,7 @@ cpu0_thermal: cpu0-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 1>;
-			sustainable-power = <768>;
+			sustainable-power = <1052>;
 
 			trips {
 				cpu0_alert0: trip-point0 {
@@ -3641,7 +3641,7 @@ cpu1_thermal: cpu1-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 2>;
-			sustainable-power = <768>;
+			sustainable-power = <1052>;
 
 			trips {
 				cpu1_alert0: trip-point0 {
@@ -3690,7 +3690,7 @@ cpu2_thermal: cpu2-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 3>;
-			sustainable-power = <768>;
+			sustainable-power = <1052>;
 
 			trips {
 				cpu2_alert0: trip-point0 {
@@ -3739,7 +3739,7 @@ cpu3_thermal: cpu3-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 4>;
-			sustainable-power = <768>;
+			sustainable-power = <1052>;
 
 			trips {
 				cpu3_alert0: trip-point0 {
@@ -3788,7 +3788,7 @@ cpu4_thermal: cpu4-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 5>;
-			sustainable-power = <768>;
+			sustainable-power = <1052>;
 
 			trips {
 				cpu4_alert0: trip-point0 {
@@ -3837,7 +3837,7 @@ cpu5_thermal: cpu5-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 6>;
-			sustainable-power = <768>;
+			sustainable-power = <1052>;
 
 			trips {
 				cpu5_alert0: trip-point0 {
@@ -3886,7 +3886,7 @@ cpu6_thermal: cpu6-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 9>;
-			sustainable-power = <1202>;
+			sustainable-power = <1425>;
 
 			trips {
 				cpu6_alert0: trip-point0 {
@@ -3927,7 +3927,7 @@ cpu7_thermal: cpu7-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 10>;
-			sustainable-power = <1202>;
+			sustainable-power = <1425>;
 
 			trips {
 				cpu7_alert0: trip-point0 {
@@ -3968,7 +3968,7 @@ cpu8_thermal: cpu8-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 11>;
-			sustainable-power = <1202>;
+			sustainable-power = <1425>;
 
 			trips {
 				cpu8_alert0: trip-point0 {
@@ -4009,7 +4009,7 @@ cpu9_thermal: cpu9-thermal {
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 12>;
-			sustainable-power = <1202>;
+			sustainable-power = <1425>;
 
 			trips {
 				cpu9_alert0: trip-point0 {
-- 
2.33.0.153.gba50c8fa24-goog

