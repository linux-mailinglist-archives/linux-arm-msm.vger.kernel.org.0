Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCFCFAF6BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2019 09:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfIKHRV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 03:17:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37061 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbfIKHRV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 03:17:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id b10so9801709plr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=5TuJ7l2iIRIYYnmGHtrUFLK2P8yt4NpAavFl0VahGaY=;
        b=PyKtk7de5zMYaWrjwmA4Z4W/TOdZ8yI884Mx5qmvGu1pQKoA3pALakGP9q+sinnB5V
         QUmIPdYJBTsxLKSDGN8Rw5wYysUXYXQ3G7IJNDFdejiilV2z33OMuUvzHy9r6Js8ZzAF
         4XE9qnrvLZQLT0kVDv2phstvkgrGfnAKl30xf8eNUF3PZbJUcXQ4yQkTjE/XH/SzwsuY
         Tu+mh0IwNOEujR2a+ssZlEM0VVhvJT2puT+m80alLLrMslWj3ux63HlKObNJISSlO9e3
         4uFodycMHq45FSILRkbZt2ZYK79Wbnj4Kine9aVejdaVM5W+sZKkBGFtEIyaAhPmLJGS
         xVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=5TuJ7l2iIRIYYnmGHtrUFLK2P8yt4NpAavFl0VahGaY=;
        b=B0wVS66dIi8EP3oa4W/xE1oMQk+KPZWuYzoxwhSvQ2DNXTeyqK+DN4zlNz6pDT4p+n
         x/Mh/gsXzCQ0cVOO1cv7ZG0oAXaO8KdVEgK/NylseoMAO5kV8at1+xOQTvC1ek7M6061
         s8voEb6S3yWnGtGZ02PIAoXzRocO6VCmiut8SPOUk82lKjDE4u/ltIiryT50IEFahBkJ
         R2H4uM/loL22AlUPWkSiqex2ctuTveQ+FlF7A1ziZyS6jBhOfkQieVPTdNgzu81E29pn
         Qd0vP0HWDk2uj2bBneVh0VAGqgT3WzsTtwNIC1SPr2Po1odCzLJqe4hm4mSvX61edeRA
         aQ7Q==
X-Gm-Message-State: APjAAAVKSOVpgiLpyqsdNGRXJfk7qEYi1DgZetZl2SkVwVcWt3XC8Far
        grLnDZQBmFQ6As+WVbhxQi8xbQ==
X-Google-Smtp-Source: APXvYqwioi/AsWkjv+eVZ5Utw/3NW7HZaUF+jaBypvoHjpd3mfVPLY6N4LcyssAkJ522GfM0q+gFQA==
X-Received: by 2002:a17:902:7596:: with SMTP id j22mr22859410pll.280.1568186240549;
        Wed, 11 Sep 2019 00:17:20 -0700 (PDT)
Received: from localhost ([49.248.201.118])
        by smtp.gmail.com with ESMTPSA id h12sm20705800pgr.8.2019.09.11.00.17.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 00:17:20 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v3 11/15] arm64: dts: qcs404: thermal: Add interrupt support
Date:   Wed, 11 Sep 2019 12:46:28 +0530
Message-Id: <b787f37e3d678c48977aa2d31b62c1a1f387368d.1568185732.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupt for the tsens controller.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 42 +++++++++++++++-------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3d0789775009..065a60d50a07 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -280,6 +280,8 @@
 			nvmem-cells = <&tsens_caldata>;
 			nvmem-cell-names = "calib";
 			#qcom,sensors = <10>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -1071,8 +1073,8 @@
 
 	thermal-zones {
 		aoss-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 0>;
 
@@ -1086,8 +1088,8 @@
 		};
 
 		q6-hvx-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 1>;
 
@@ -1101,8 +1103,8 @@
 		};
 
 		lpass-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 2>;
 
@@ -1116,8 +1118,8 @@
 		};
 
 		wlan-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 3>;
 
@@ -1131,8 +1133,8 @@
 		};
 
 		cluster-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 4>;
 
@@ -1165,8 +1167,8 @@
 		};
 
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 5>;
 
@@ -1199,8 +1201,8 @@
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 6>;
 
@@ -1233,8 +1235,8 @@
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 7>;
 
@@ -1267,8 +1269,8 @@
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 8>;
 
@@ -1301,8 +1303,8 @@
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 9>;
 
-- 
2.17.1

