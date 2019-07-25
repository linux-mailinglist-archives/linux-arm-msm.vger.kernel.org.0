Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD9275AAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 00:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbfGYWUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 18:20:09 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41030 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfGYWT2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 18:19:28 -0400
Received: by mail-pf1-f195.google.com with SMTP id m30so23446035pff.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 15:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=B+sNITIVQHHNvE1ebQJYrxPKhAnKZEk3KdjPCeO24Js=;
        b=OEYWnG+L8vtEXhvSjaepFzrMjQlSIKpC/tyVyA0/OeNXeVuDDpXjMWYrmKBaCQqq1w
         BIfbHV1lzc1m+Stz7OAOo+ChkH13/DbiIErj+opZtqgxMt2IUKi7pu4yAIlpAozKnCmV
         Ega9ZJQBRaw/vtIMhf9yByIcTr7Nc4chaZx41kzdgWX1M3GJ64jTUAvAS806iSXUtkoj
         v/Z8QMLnskh+bA0IpJLziNIUvs3J6a1oAA8HjXw9ULD9qjmKAJXXWvZEDVW5v29scXjl
         uB9KNzYN9xPLFVpOu90sGqVFzMatBUIz1BDwSUUwOUfynTxxnKEjFNJg6PbJflcBelf2
         srcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=B+sNITIVQHHNvE1ebQJYrxPKhAnKZEk3KdjPCeO24Js=;
        b=qyxLLxw4HSz3GiIixz/jwaLxffy8GRoGbKVJNXTW93t90DE4giT4vWbnJAvCL6FgNj
         O2LHRk4GNz8nBPhtfAvh6xL4qztSS4E9ZQ9bZwWEwKk1fxcq421tnGA2JCpQfuAAJ+pu
         ps1+zK9A+rc4d/57Hvg+b/G32kPxDkDBiOVWiEiXVjPofkizlOmZexwbJFdvGBCJd5NN
         /8fGnA8JC+MrBTwhltmeQsl+N1Hfne/GbRkSai8B0/svCorWABpg2gHyeTMiIBCMz5Dc
         oneqFN+w+vn6KG3S9NSIrtE44Id+iEsY8NqhK3yvQBvYSX7m/zTmSBzzefSACVyG75St
         tIPg==
X-Gm-Message-State: APjAAAV7mODrrUTjWXzYo9O+eIzrnvwPLJ2QutMJZ71+8UnxNMro0E41
        c+PCrKuePasZLgCp+grQiJIY/g==
X-Google-Smtp-Source: APXvYqygAe/Bpn5w/X7WRsuwBfazn1YybZXo3vECAVM4m/tP33CWP5tgUEi4itQnO1DFvagHZ05sAQ==
X-Received: by 2002:a17:90a:ab0b:: with SMTP id m11mr97773483pjq.73.1564093167338;
        Thu, 25 Jul 2019 15:19:27 -0700 (PDT)
Received: from localhost ([49.248.170.216])
        by smtp.gmail.com with ESMTPSA id v18sm46030597pgl.87.2019.07.25.15.19.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 15:19:26 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        andy.gross@linaro.org, Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 08/15] arm64: dts: sdm845: thermal: Add interrupt support
Date:   Fri, 26 Jul 2019 03:48:43 +0530
Message-Id: <7f6f6b93b277702dea1e37c29ef61641d98455ea.1564091601.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 88 +++++++++++++++-------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4babff5f19b5..43c06e54b69d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2386,6 +2386,8 @@
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 			      <0 0x0c222000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <13>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tsens0";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -2394,6 +2396,8 @@
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 			      <0 0x0c223000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tsens1";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -2712,8 +2716,8 @@
 
 	thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 1>;
 
@@ -2756,8 +2760,8 @@
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 2>;
 
@@ -2800,8 +2804,8 @@
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 3>;
 
@@ -2844,8 +2848,8 @@
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 4>;
 
@@ -2888,8 +2892,8 @@
 		};
 
 		cpu4-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 7>;
 
@@ -2932,8 +2936,8 @@
 		};
 
 		cpu5-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 8>;
 
@@ -2976,8 +2980,8 @@
 		};
 
 		cpu6-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 9>;
 
@@ -3020,8 +3024,8 @@
 		};
 
 		cpu7-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 10>;
 
@@ -3064,8 +3068,8 @@
 		};
 
 		aoss0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 0>;
 
@@ -3079,8 +3083,8 @@
 		};
 
 		cluster0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 5>;
 
@@ -3099,8 +3103,8 @@
 		};
 
 		cluster1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 6>;
 
@@ -3119,8 +3123,8 @@
 		};
 
 		gpu-thermal-top {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 11>;
 
@@ -3134,8 +3138,8 @@
 		};
 
 		gpu-thermal-bottom {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 12>;
 
@@ -3149,8 +3153,8 @@
 		};
 
 		aoss1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 0>;
 
@@ -3164,8 +3168,8 @@
 		};
 
 		q6-modem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 1>;
 
@@ -3179,8 +3183,8 @@
 		};
 
 		mem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 2>;
 
@@ -3194,8 +3198,8 @@
 		};
 
 		wlan-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 3>;
 
@@ -3209,8 +3213,8 @@
 		};
 
 		q6-hvx-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 4>;
 
@@ -3224,8 +3228,8 @@
 		};
 
 		camera-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 5>;
 
@@ -3239,8 +3243,8 @@
 		};
 
 		video-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 6>;
 
@@ -3254,8 +3258,8 @@
 		};
 
 		modem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 7>;
 
-- 
2.17.1

