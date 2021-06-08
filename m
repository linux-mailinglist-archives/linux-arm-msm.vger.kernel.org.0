Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9AF23A06DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 00:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234616AbhFHWci (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 18:32:38 -0400
Received: from mail-qt1-f169.google.com ([209.85.160.169]:41734 "EHLO
        mail-qt1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbhFHWch (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 18:32:37 -0400
Received: by mail-qt1-f169.google.com with SMTP id o20so1148760qtr.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 15:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RXQwC0BxKtU1s8TMqbyaoC7WGbiYRb3bfBqLDk1X5Xw=;
        b=KBGxJY9/qalPiFHxdXmCVPz07LcLV+DX509uMy8IwF2qVeevug5QimVy/JqrlmVQSr
         XvdxbDCF47j/iDanx5G70fxYQI3tExwFlLeE41lF3fFxbInvQWecWROjuPi1u6e3htIX
         zaZjmtdrqbpBWFtg6Bq2v+J4+k6r1S2/adq8di3OC+NthejHdA4LVv3v8hX1D56sb+Xu
         FjghF555FhdZ+WxvPPhwcUhIXOcptggPlQ30I21hNFFIRge4YyngohwTZeGdhtmZO/mp
         4y1+g6IT/cXT4zAq8w2XlmtAnJB3yZGetsHDmg0CTYPmSgtGx15bcGpF1zmqIobXTQhq
         y+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RXQwC0BxKtU1s8TMqbyaoC7WGbiYRb3bfBqLDk1X5Xw=;
        b=CkvUVgoTM6BySc+AnYGkHjHcbPmwGQmLX6Tz9YUh60iMaBcUDAF7NsnWOlB29+/sV3
         fPBP6z7azHQe3QyTnF5jVHSHGFbLAH7OpsZbovu9icnq3yc/CMuDYiYQDKFE+l7Cx99m
         8JYKSWO6qjPK1aMXtVgz+kSImDqHFOtX1O4n+fcLGHZxk93ceYN9Xy0eT/dfnwI/x4MG
         DSnErWRT8Oe/KwYjKKg46y5x0/o0i6dfOLgD6Znr/aZowH2aEHFTCOxbawE39tZrbGqY
         dEx3VW164gJ0O7JeFiz9Saw1BRagDCISGSx2UhEvIkbglfeO0mTZm1J5nBrp0FQc8KZr
         l0CA==
X-Gm-Message-State: AOAM533l9CV98LfKwSKLcFY5fuceyBu6orZjt8GbcdKlpWGoRb1cOeUr
        6RXfr9ffpzCtQ1rDYRYkq02HLg==
X-Google-Smtp-Source: ABdhPJxrcR7SBV5yEHVvDUzG5Jhd2bbA+Kyiahd3XFxGXxHZ+bSwIpJNlO48TBHSEefsiUP62U4+xA==
X-Received: by 2002:ac8:4d50:: with SMTP id x16mr23489442qtv.271.1623191372683;
        Tue, 08 Jun 2021 15:29:32 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id h19sm10450736qtq.5.2021.06.08.15.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:29:32 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        rjw@rjwysocki.net, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/5] arm64: boot: dts: qcom: sdm845: Remove passive trip points for thermal zones 0-7
Date:   Tue,  8 Jun 2021 18:29:26 -0400
Message-Id: <20210608222926.2707768-6-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608222926.2707768-1-thara.gopinath@linaro.org>
References: <20210608222926.2707768-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that Limits h/w is enabled to monitor thermal events around cpus and
throttle the cpu frequencies, remove the s/w montoring of the same which
was happening via tsens. We keep critical trip points for these zones so
that system shutdown can be initiated if the temperature exceeds critical
trip.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 225 ---------------------------
 1 file changed, 225 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index fdd8d816f728..9a494a1b7a09 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4971,18 +4971,6 @@ cpu0-thermal {
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
-				cpu0_alert0: trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu0_alert1: trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu0_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -4990,22 +4978,6 @@ cpu0_crit: cpu_crit {
 				};
 			};
 
-			cooling-maps {
-				map0 {
-					trip = <&cpu0_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-				map1 {
-					trip = <&cpu0_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
 		};
 
 		cpu1-thermal {
@@ -5015,18 +4987,6 @@ cpu1-thermal {
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
-				cpu1_alert0: trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu1_alert1: trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu1_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5034,22 +4994,6 @@ cpu1_crit: cpu_crit {
 				};
 			};
 
-			cooling-maps {
-				map0 {
-					trip = <&cpu1_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-				map1 {
-					trip = <&cpu1_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
 		};
 
 		cpu2-thermal {
@@ -5059,18 +5003,6 @@ cpu2-thermal {
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
-				cpu2_alert0: trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu2_alert1: trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu2_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5078,22 +5010,6 @@ cpu2_crit: cpu_crit {
 				};
 			};
 
-			cooling-maps {
-				map0 {
-					trip = <&cpu2_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-				map1 {
-					trip = <&cpu2_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
 		};
 
 		cpu3-thermal {
@@ -5103,41 +5019,12 @@ cpu3-thermal {
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
-				cpu3_alert0: trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu3_alert1: trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu3_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
-
-			cooling-maps {
-				map0 {
-					trip = <&cpu3_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-				map1 {
-					trip = <&cpu3_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
 		};
 
 		cpu4-thermal {
@@ -5147,18 +5034,6 @@ cpu4-thermal {
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
-				cpu4_alert0: trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu4_alert1: trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu4_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5166,22 +5041,6 @@ cpu4_crit: cpu_crit {
 				};
 			};
 
-			cooling-maps {
-				map0 {
-					trip = <&cpu4_alert0>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-				map1 {
-					trip = <&cpu4_alert1>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
 		};
 
 		cpu5-thermal {
@@ -5191,18 +5050,6 @@ cpu5-thermal {
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
-				cpu5_alert0: trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu5_alert1: trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu5_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5210,22 +5057,6 @@ cpu5_crit: cpu_crit {
 				};
 			};
 
-			cooling-maps {
-				map0 {
-					trip = <&cpu5_alert0>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-				map1 {
-					trip = <&cpu5_alert1>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
 		};
 
 		cpu6-thermal {
@@ -5235,18 +5066,6 @@ cpu6-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
-				cpu6_alert0: trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu6_alert1: trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu6_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5254,22 +5073,6 @@ cpu6_crit: cpu_crit {
 				};
 			};
 
-			cooling-maps {
-				map0 {
-					trip = <&cpu6_alert0>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-				map1 {
-					trip = <&cpu6_alert1>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
 		};
 
 		cpu7-thermal {
@@ -5279,18 +5082,6 @@ cpu7-thermal {
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
-				cpu7_alert0: trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu7_alert1: trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu7_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5298,22 +5089,6 @@ cpu7_crit: cpu_crit {
 				};
 			};
 
-			cooling-maps {
-				map0 {
-					trip = <&cpu7_alert0>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-				map1 {
-					trip = <&cpu7_alert1>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
 		};
 
 		aoss0-thermal {
-- 
2.25.1

