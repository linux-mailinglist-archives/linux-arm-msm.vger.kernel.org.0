Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A21D6AF6B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2019 09:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbfIKHRQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 03:17:16 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34022 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbfIKHRP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 03:17:15 -0400
Received: by mail-pl1-f195.google.com with SMTP id d3so9803287plr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=ZwCxmgUQhS9SSaQKkkkSIJsmLTrN1BacMY6pM2O/8bI=;
        b=fDRUh7QTThqydKCBTQPbfRYwl0z34T8dbU2Dyp/0QF7I3egtSz88/gYhodRI06NaBi
         oaTncQGl6i8akjx2JPQNmanIeMXe98CLtgGq0WzXl8n/gaWXE1pcT3DfF6//KrhY8YJ2
         FjklrSTcnEvInaoSdDHkppmXdAU5ANe6frRaX3Du4tBZx2qZXNLqSzNlqybK1dho4yAo
         36QtA7fWNLqP5KlAQojBoYuH3ALUu51s642ehm9+Q4yj1uIXCoNscofj44vEgBS/uvts
         5IDwlXBYu3u6x2qHXTi2wYdm2XejMq2iW1xWz18Hs9+J3jPWroLrrTMAuylyHN5aPwni
         qrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=ZwCxmgUQhS9SSaQKkkkSIJsmLTrN1BacMY6pM2O/8bI=;
        b=iuHp9iSgKjEXNj4WtOJdZhrsKADJAB/mYFIRXNckv8oZQC1t8RvctWCKEIWyn1EtCD
         0AK69dNGlazmEDUW+f27isrOzU7AGG17PmkO2f8+2HfH0B3DeLbbKbXr27K/U8839BAb
         RxB/sjIlNo+jkJcAwjsKj3hgsexPtUgabvRNelZbA8cq7PF4PomUF7FGMQe3ZQgNwpdU
         CZ0aG9x+oiNidzv4MlEgZ4le44ROGOawgh9wPNINjywrEOARvY0/sbjXPN90J9737lXR
         Pcjp/wdmncbaSWB0IVIZZeF4JZLf4kYX4Uvpuoh4txpaxIEI3uySaQT0Onw5qOiNAWhj
         jazA==
X-Gm-Message-State: APjAAAUyCasOCac1DG1URCunXE85pbJQMVUTPySV3iON6vd0utSJVkzN
        lmTAPkhlm4EzwuYtENZmWAJ0dg==
X-Google-Smtp-Source: APXvYqxVI4cIVNk2LRHsqIajJutwvE/JaM17WWEzcfQL4dos+CAMHwhzBjJT6UzA5FguwBHDUD9Ylg==
X-Received: by 2002:a17:902:36e:: with SMTP id 101mr33887914pld.51.1568186233640;
        Wed, 11 Sep 2019 00:17:13 -0700 (PDT)
Received: from localhost ([49.248.201.118])
        by smtp.gmail.com with ESMTPSA id x5sm21705278pfn.149.2019.09.11.00.17.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 00:17:13 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v3 09/15] arm64: dts: msm8996: thermal: Add interrupt support
Date:   Wed, 11 Sep 2019 12:46:26 +0530
Message-Id: <955d8c4a928405d7830bdf76101dc1c3c9898853.1568185732.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 60 ++++++++++++++-------------
 1 file changed, 32 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 96c0a481f454..bb763b362c16 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -175,8 +175,8 @@
 
 	thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 3>;
 
@@ -196,8 +196,8 @@
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 5>;
 
@@ -217,8 +217,8 @@
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 8>;
 
@@ -238,8 +238,8 @@
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 10>;
 
@@ -259,8 +259,8 @@
 		};
 
 		gpu-thermal-top {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 6>;
 
@@ -274,8 +274,8 @@
 		};
 
 		gpu-thermal-bottom {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 7>;
 
@@ -289,8 +289,8 @@
 		};
 
 		m4m-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 1>;
 
@@ -304,8 +304,8 @@
 		};
 
 		l3-or-venus-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 2>;
 
@@ -319,8 +319,8 @@
 		};
 
 		cluster0-l2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 7>;
 
@@ -334,8 +334,8 @@
 		};
 
 		cluster1-l2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 12>;
 
@@ -349,8 +349,8 @@
 		};
 
 		camera-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 1>;
 
@@ -364,8 +364,8 @@
 		};
 
 		q6-dsp-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 2>;
 
@@ -379,8 +379,8 @@
 		};
 
 		mem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 3>;
 
@@ -394,8 +394,8 @@
 		};
 
 		modemtx-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 4>;
 
@@ -591,6 +591,8 @@
 			reg = <0x4a9000 0x1000>, /* TM */
 			      <0x4a8000 0x1000>; /* SROT */
 			#qcom,sensors = <13>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -599,6 +601,8 @@
 			reg = <0x4ad000 0x1000>, /* TM */
 			      <0x4ac000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

