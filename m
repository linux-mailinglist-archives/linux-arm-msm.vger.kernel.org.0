Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74BC2B995C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 23:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbfITVxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 17:53:42 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36384 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730142AbfITVxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 17:53:05 -0400
Received: by mail-pl1-f193.google.com with SMTP id f19so3805517plr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=5TuJ7l2iIRIYYnmGHtrUFLK2P8yt4NpAavFl0VahGaY=;
        b=fAaB+7YsL6BcsECIVYGKEu2hXGaZn2F6d73Yhr5w2mVMEq3/pz0bpZ5pKgu/tHQGwK
         rXXKjinCLmBTqtMJUpgrwpUYc0Vv2vXv/yNKZQK3tcCkkYxn0hTXxomCxFQKERnZMUqF
         SfyMsvtWGaAcnNl8EqXnBWuGxkvNB1WCLM0yG6c4F8AXJHiibGfp72Quug2sCgxnXN72
         t/068ou0RKY3kXrz83DC1G1l1W2+fvfUmJwOgLWXqyaePKu5gAN4rDCXt7ZalYbTaFk1
         32QxhoKPKA5exiuWaV/o/5GrTkeCYYPXXEqAAEljBMRk2zNY7mOnMmYcXb/Gw/p8hbPx
         eqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=5TuJ7l2iIRIYYnmGHtrUFLK2P8yt4NpAavFl0VahGaY=;
        b=rm11cCoGvjYemeSvgR29b5QbO7SLIVJWP6vl5SuIMOVBodDe8YrP6UYSfe3AhT9wfU
         IUpo1cz8yNOIbiJc4WEwjMC6J4huYp6nK2OxqS0Z8NZyNgfVV46aVdH+S7226RPcAiFa
         GPnFBRDDguOho9HAwsh9cq9Kfzh27ucnBxYxCbF3HGwag09Q39OUKWL2NvhTAmx9A4LV
         9ziShEiash+T49Yzp5HhameG9+LRggv9/XEpRASUP3zofuggSIdaaIJ3CRWwnQyD/0Rg
         8+i1Xo2CT8riDfvjt0LNl39v0Jhwf67kPO2/Y1gKTC4N1ON0vyp8lK+/vpW4Fgju0USR
         wccw==
X-Gm-Message-State: APjAAAVEr9m/HnIzXXLUGURgQHkrAxQ9MSrPWwedVfiYlIJNQyDnXl5a
        cyjtUTQcgmMwttMHj4CSQONv1A==
X-Google-Smtp-Source: APXvYqzQKxSfpJDaVKSImqUUnWtAwEmKwFKE1+J8XRS53qjL/8kISC1oG223wWyPs7U5Hyf70f+zow==
X-Received: by 2002:a17:902:8601:: with SMTP id f1mr18699001plo.180.1569016384597;
        Fri, 20 Sep 2019 14:53:04 -0700 (PDT)
Received: from localhost (wsip-98-175-107-49.sd.sd.cox.net. [98.175.107.49])
        by smtp.gmail.com with ESMTPSA id g202sm3986754pfb.155.2019.09.20.14.53.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 14:53:04 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v4 11/15] arm64: dts: qcs404: thermal: Add interrupt support
Date:   Fri, 20 Sep 2019 14:52:26 -0700
Message-Id: <4590cec3348ff0644175f8de27398c0e935a7a2c.1569015835.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
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

