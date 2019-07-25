Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A11575AA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 00:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbfGYWTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 18:19:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33821 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfGYWTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 18:19:38 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so17489951pgc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 15:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=kYY2KGeTwdILF2FlXV59Zq9qsKbWJTGhUy3mp43RMqs=;
        b=MGdVaAiayGKurKmlzzCapq5eHfl991sITtHwnpq57sUvocciiP2DfUAFGrLQwQ5b3E
         Q4Pl6pdJhnsUGMO/96C17+R8qtS6XLJIY0EV3Ddf5i4vq52lxUrMHIswICArv0rEZWZi
         wVJ99efLWVwxJwHhpdcLNTj41W5Ygfhk2PAGcLa4iD1JZGPgvQDFcEly4Tm+brAYeAMU
         SyuVLdpHehJg5DH/WlqEitRMLyMPQkOYrwF2deaULOQlqG5MJTMbiej+AqMIzXQbeAfF
         QVWDkwkkbQt4RhI100prhoolWmR7+Z22BA8mOnOB5UJ+bqULJrlcm/Iv3lT/yw+fa3gN
         NhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=kYY2KGeTwdILF2FlXV59Zq9qsKbWJTGhUy3mp43RMqs=;
        b=C49h6fIKmVzzyHEvyKgnkL+Wj67pS4FYeJpFj7ehhth/eruqQq2k+5VH35CTIUGJlL
         vGQbHi005wT+0+zbxvlDB6DVe7xBugdoM8Hn+YNnft9r3MOocgfEjiRo8FpRgCmYg5WA
         JXpn8TX+dvxUKnKk+qNissuXUgva06CFmg0f1uFq0ngdHJspTbhSJKt9SeZeJlzAaP/j
         xT8XqP/NkpgHWHzfFMcCIWYtcfdRJ0zYXfiENHtRcA1kdGzxUq51hNOgi1ZYOnyEA+8f
         ehWEVJJpFVeH7R+kdS/BKJMMLNYo0laZXm6rSZp8BFf24XjP2tuqSGsfd9VjFSTxM6P8
         ijWA==
X-Gm-Message-State: APjAAAUUWeTAtF0o65L0VXLrdEL1cs2DUxrrI5BzMydFdjgnqjWI2hwy
        zfeMkt1O2VxGtruK+phl6bS8KQ==
X-Google-Smtp-Source: APXvYqy2Ew9ZKhyHpGk0sa36SAHnwcZ5CszF19xs6yPflfZBT66Pz95YNGXuwSZB9XM+QdXPe/QOJw==
X-Received: by 2002:a17:90a:fa07:: with SMTP id cm7mr92107753pjb.138.1564093177830;
        Thu, 25 Jul 2019 15:19:37 -0700 (PDT)
Received: from localhost ([49.248.170.216])
        by smtp.gmail.com with ESMTPSA id v13sm61288573pfe.105.2019.07.25.15.19.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 15:19:37 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        andy.gross@linaro.org, Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 11/15] arm64: dts: qcs404: thermal: Add interrupt support
Date:   Fri, 26 Jul 2019 03:48:46 +0530
Message-Id: <cbe0d4c260a903f2df2c9705368abe0bd812466a.1564091601.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
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
index 3d0789775009..0c715f9cc011 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -280,6 +280,8 @@
 			nvmem-cells = <&tsens_caldata>;
 			nvmem-cell-names = "calib";
 			#qcom,sensors = <10>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tsens";
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

