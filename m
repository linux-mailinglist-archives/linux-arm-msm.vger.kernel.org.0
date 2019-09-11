Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D966AF6BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2019 09:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfIKHRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 03:17:25 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43347 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbfIKHRY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 03:17:24 -0400
Received: by mail-pf1-f194.google.com with SMTP id d15so13071463pfo.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=VrMMAxmAWCoF+Z0mK+KREcF/roJedPfia4jPAm5aT6w=;
        b=v+z7bmUEVGgVLbs+h47tvjcjMgAGwHIKfunE2271dciJlZKtk8SNzuvz3qUAZNzEfT
         8ZnK9qEzhlC6QfbJr8c3LeIGgbGFkX6r58OoxXhO8jMdTeD9iWwrISs2FYO23HjHe/RU
         QceXow+wIojTbrW1Yj8JTaDTEQ97sl9W2hZE5mm/BlbmEzSE9ALLN0a0nWX8eBNXsYs6
         yFHsY7zXzfB+xxHIM4iypJgU72m3OT6jqG3pmMYwBjf7GAlvKIQzSQBg/hNqtf9guBol
         FksEj6ZdqxPuVlG3JKzz6iw7ikNWiqZcwvwxFzkHUv0iFsoO/pUe7aq+OIq+whiAEpFC
         hmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=VrMMAxmAWCoF+Z0mK+KREcF/roJedPfia4jPAm5aT6w=;
        b=oizCgkU/BJluAkEwebBdqlzP3TMMiLPgwID7t1XHaueQAwMycrtY8X22AH9MHmElUg
         PV+Hu5pm8AYXqWRTe+JP3nW4HEg6faKhkkfcmSHvs7+2oFmE10EscYlOo32O0C/SFnI0
         zYCLtY8O9EzgvXKSw9eDQkyLgrpe/AHsWdsEq35l7MwFZBdwS/ZhNo520jGXFWVrxy9v
         BeeMCRiFA6XBcoUMMul2kudcX8FHE8WuE0dOSYtTZdEpBxlQ4qGLlXO9d/+4M8p8ch6q
         VctRUcovOpKFSRhBoH749Kp+mTJy+zH/NnbjInZkvM3yjWz5KBM8x00LM4r63a8J72F6
         PKHA==
X-Gm-Message-State: APjAAAViVJs3R2NjKierdyrnc8fNtPQN/KBJP7MdqP5uo9qrJxOR88rq
        KcVIB0faPvZhF1HX9KFbo1KiwnszMVD+sA==
X-Google-Smtp-Source: APXvYqw2xVyBCzBbFQzcye/zf6yXBv/n+Iq2Pf3mMZbyI2/1dmEY3X/6d1n4+N+19KDJ2xHq23+bnw==
X-Received: by 2002:a17:90a:1903:: with SMTP id 3mr3822034pjg.80.1568186243994;
        Wed, 11 Sep 2019 00:17:23 -0700 (PDT)
Received: from localhost ([49.248.201.118])
        by smtp.gmail.com with ESMTPSA id x24sm18955736pgl.84.2019.09.11.00.17.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 00:17:23 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v3 12/15] arm: dts: msm8974: thermal: Add interrupt support
Date:   Wed, 11 Sep 2019 12:46:29 +0530
Message-Id: <8d4fba37e8aa1a7511d22f5e53f78ab2e720d97a.1568185732.git.amit.kucheria@linaro.org>
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
Tested-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 36 +++++++++++++++--------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index d32f639505f1..290f7c3827d4 100644
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

