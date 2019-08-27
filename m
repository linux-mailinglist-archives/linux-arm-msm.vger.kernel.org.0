Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1A839E799
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 14:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730013AbfH0MPR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 08:15:17 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42361 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729970AbfH0MPO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 08:15:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id i30so14000646pfk.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 05:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=oICHc/N2fVzNg9SEQ6NvPrxoshVnfXlZhDudW67PQGU=;
        b=Cp6897F1qL6ZQl9NYJzQI0+DCRd0dHQK3Y38hSJNb+Cacsa+FTmIu+DYI3I5U9ZbQ0
         Mgp8BpslWLL5SNJCsPTy5aW8JEnkwER/GyolJxSX30l0RF4UTxEQ4z8SjM/diMLMXDrt
         5I1TiVbi15ciQnGtof3JPw94cZghANLIBmy75WSze+XE7t1gW96FGx+FzKhZeDyy1MpC
         kJ5nEKJ4cZ13x8h7WORXg3ns7nYWu5F26lXoOb+qxt30hgc73Wnc4HUN5xzg07nHArw5
         cbNorbJVFg548rPO7BSxMl//sVXg2KAS38Gm21N5GEg+tcqyFrV4yC74bBWtfsKvjf0r
         rECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=oICHc/N2fVzNg9SEQ6NvPrxoshVnfXlZhDudW67PQGU=;
        b=P+ujfltbFnAV2sb56FGKrveffUozlJoBm3Uqwgssze5UBkJZfac7t0xjCZgIIqJp3a
         OR4y9xJz/2Vfksg04JvOZ265Eco9UAlRuMcNvxXVyn2nFTFIkf4mBNpGbvKt+iENs/Yu
         7sh+m5MEfLnZIi6XR1i0UZ5pXJ7ucBILg8uDVUT9HgOyS5amcBf8rfbm5W0daM6Uzg1M
         ugesgiZOs7zGlTuRcAyeXAaYBRH6bHvrTHMRgD03uKNOHClkVTFyS2Xc3MzbqfRHzJCC
         dsDVdpRpynCYMoNbXgAfsOjkQrypf33ED/8U+CY1rhQ2zZhDlVb3k7QCkLb96mOSDtzs
         QDyw==
X-Gm-Message-State: APjAAAVE485CAF2AQ1Xu/GYaT8ucwMzRgoq6tviBFQvVzxblPfTRaOjV
        ln0eXO7Yl+YFKBqBQKMd4BDMLA==
X-Google-Smtp-Source: APXvYqw08/ZuiQs9CO2XzU2ubVRDh6b0AfuO9ArPxJLQF1TFuaL6QVHqg2guKmzjQPEVJ0liS75zBg==
X-Received: by 2002:aa7:8488:: with SMTP id u8mr26247184pfn.229.1566908112980;
        Tue, 27 Aug 2019 05:15:12 -0700 (PDT)
Received: from localhost ([49.248.54.193])
        by smtp.gmail.com with ESMTPSA id q8sm4785656pje.2.2019.08.27.05.15.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 05:15:12 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        sboyd@kernel.org, masneyb@onstation.org, marc.w.gonzalez@free.fr,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 12/15] arm: dts: msm8974: thermal: Add interrupt support
Date:   Tue, 27 Aug 2019 17:44:08 +0530
Message-Id: <383f16c449fb5a36d07ef98c5b071d9a50a86eb7.1566907161.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupt for the tsens controller.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Tested-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 36 +++++++++++++++--------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index d32f639505f1b..290f7c3827d45 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -139,8 +139,8 @@
 
 	thermal-zones {
 		cpu-thermal0 {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 5>;
 
@@ -159,8 +159,8 @@
 		};
 
 		cpu-thermal1 {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 6>;
 
@@ -179,8 +179,8 @@
 		};
 
 		cpu-thermal2 {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 7>;
 
@@ -199,8 +199,8 @@
 		};
 
 		cpu-thermal3 {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 8>;
 
@@ -219,8 +219,8 @@
 		};
 
 		q6-dsp-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 1>;
 
@@ -234,8 +234,8 @@
 		};
 
 		modemtx-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 2>;
 
@@ -250,7 +250,7 @@
 
 		video-thermal {
 			polling-delay-passive = <0>;
-			polling-delay = <1000>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 3>;
 
@@ -279,8 +279,8 @@
 		};
 
 		gpu-thermal-top {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 9>;
 
@@ -294,8 +294,8 @@
 		};
 
 		gpu-thermal-bottom {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 10>;
 
@@ -531,6 +531,8 @@
 			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
 			nvmem-cell-names = "calib", "calib_backup";
 			#qcom,sensors = <11>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

