Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08992B993D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 23:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfITVw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 17:52:59 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35291 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729406AbfITVw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 17:52:59 -0400
Received: by mail-pf1-f196.google.com with SMTP id 205so5416765pfw.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 14:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=lIlDkOFMtaJ7NzGQY3181qnj2S+zXBje3XXKns63Nkk=;
        b=iLk6M9yokg2PkAgWyqROr8nxnJojb8gm8FvZzMzGXzg28At8IShyjre9xcrGdm6M2l
         aaIr3ioIJ5KFHusyGuHAsmPKQX0ZHrPeQk2T1OsTitUuVQDqju5Ho+tCMsIvwKc+cCsw
         vCye5kDnlhHiexDE+3NGSyUkNX1MEqAXkZwZXk4czgRLnS/BHSnvtuF3fHdLW8Ao2ojV
         7cg8EQA+BT4JxRE/3/tZXPyZis4yZs75H4Sk8+K8jK1q8l0bgRA5XIYoozP4GPbDJrnr
         zjbe08kYOWg8IPyKxIr5yulX8uZUiSmcJF9/rkQfo2zLD9ZLIl0Huu0zoIdLlPkHajyh
         ZM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=lIlDkOFMtaJ7NzGQY3181qnj2S+zXBje3XXKns63Nkk=;
        b=qfLanuCduYnvwJuiW+lJf/TaRqyxHfKXcVCCGv/YDrDm6a67BwKcNXzNYxtAqw+0o/
         /iA7+G3wCtO3NMUCaaaPvOguIM13Upimd3+6EruPifYyTov3G+5qGEQ1fRUnq2WG7xrq
         bf7OC8PlRwvPgvO5BBqkvRvXXLYYueKI0ev+94uASLmKsBVQeC0ZzPigmiC4vvnNCbFr
         Oj8eEGmNhFy4pvu2+gQSFE7KpYzruAsgw7LOrC62iDZ38YKnNbx8q8C6TiXOtsLhuxyS
         5xuCXMVbRku+GIobM1heqR4Oe6BvuDfC5m0op0yQehfrJvATrvL4zziFRYqreWiHxNBX
         Ot/Q==
X-Gm-Message-State: APjAAAVGo4QbFzPo7LMa4AA/gs/yAYmCo1wyvB4Ve1PQHKK5oC/UeAci
        OJ9FQQYeJpF57UQ1+YxpwmUBcQ==
X-Google-Smtp-Source: APXvYqyFsvISRrIZFBw2zYtZakaQbL+3DUWYwbsPxUpvt3tpxj68QkpMi2P2ErIqPlWn+dOfvqo2ZA==
X-Received: by 2002:a63:fd42:: with SMTP id m2mr10075685pgj.233.1569016377723;
        Fri, 20 Sep 2019 14:52:57 -0700 (PDT)
Received: from localhost (wsip-98-175-107-49.sd.sd.cox.net. [98.175.107.49])
        by smtp.gmail.com with ESMTPSA id 2sm3413281pfa.43.2019.09.20.14.52.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 14:52:57 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v4 08/15] arm64: dts: sdm845: thermal: Add interrupt support
Date:   Fri, 20 Sep 2019 14:52:23 -0700
Message-Id: <a30f73e54fa9ce0fceb46134cafafde452bbbb39.1569015835.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 88 +++++++++++++++-------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4babff5f19b5..fdd74c39b744 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2386,6 +2386,8 @@
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 			      <0 0x0c222000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <13>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -2394,6 +2396,8 @@
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 			      <0 0x0c223000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
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

