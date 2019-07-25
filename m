Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59CD575A9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 00:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfGYWTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 18:19:46 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34567 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbfGYWTp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 18:19:45 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so23954654plt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 15:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=aNjPKzyo6hMwnV5/FxL6BFlsZjKINMXfLX+sOTPPGgw=;
        b=R4IbPtu14lVzwjLml/VV6llOaDJhPxOcQxNKK86jt7NrYwJQMEAeOm+pk0fnHP8ZGk
         Vg6OSP3yGlD1/8MRMWr0UyRW22EUlpB2Ic0BuiUqGwucMK6nXrDsDptzQBbBfx1LbYzx
         JS9Dqw5nTqzk3aFcTsjt/CK7055SaTSfb1pQDtfF+Gw8wXGxcmJp+3mvj01yD4b6Xpaq
         OWMQDFfEFZWJ1CU92Y1W5wn5YHLxMFiKyB5VeC73xdYXVAlhXr7fTS+Gt0Go+9Fu0Q8+
         TkdRBkWCVODWrRiQWIPa0k2G9HflNBloEcWA1ebIQCcReoBLKBI/JyyK6Op1TKIJ6bmW
         O8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=aNjPKzyo6hMwnV5/FxL6BFlsZjKINMXfLX+sOTPPGgw=;
        b=tSM9EwflfurD8mbZjouZxxy/Be+NzxGqmzoO/N11Y54H7xL4s3xNzc4AxWUa70n0cR
         RqglpvjH8dGFlCiOYdcXPzIMdzVJ/7y8NPvpLwELQaVy0BbfFuAFQNaAhf5C9TmPrvaf
         sXHFgyMiiKkGcHv2vw8Vs0H5CRVWeR60iZG5WlUpvVtdGLR1ybZxG4R5ZPCi5W5FwHuf
         cHRm9vib3qX9/gr4NM8nGW3AGhCztHkSevp5Ljq7Sc0JgIKhAVsVmAldw9MBpP0Vd400
         KZHszo2sOWYO1ZsaQpq1i94eHL1caxN1OSeQfq3jmvKu0M2uxJMrgLz6nwN6KuTIyfaN
         HYJg==
X-Gm-Message-State: APjAAAUrJvOgQ5dH2llSEl1L/5nl0/Un9rGMVLhrxzQomMvg2JnhZ25M
        PpN1i8IjrIcb8cufeEiGQzYgpg==
X-Google-Smtp-Source: APXvYqxuB1RRysz+k/guHccaq+T0RlG93QbmWhv3mHmu7KtPSwMjgwcHIGftzmLG3/9gLbntE7AVAw==
X-Received: by 2002:a17:902:8d92:: with SMTP id v18mr94249402plo.211.1564093184755;
        Thu, 25 Jul 2019 15:19:44 -0700 (PDT)
Received: from localhost ([49.248.170.216])
        by smtp.gmail.com with ESMTPSA id t26sm39405317pgu.43.2019.07.25.15.19.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 15:19:44 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        andy.gross@linaro.org, Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 13/15] arm64: dts: msm8916: thermal: Add interrupt support
Date:   Fri, 26 Jul 2019 03:48:48 +0530
Message-Id: <380196111ac2b6faa6dfb27f26189ddaa1e6e606.1564091601.git.amit.kucheria@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e101905c..400045a100ca 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -176,8 +176,8 @@
 
 	thermal-zones {
 		cpu0_1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 5>;
 
@@ -206,8 +206,8 @@
 		};
 
 		cpu2_3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 4>;
 
@@ -236,8 +236,8 @@
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 2>;
 
@@ -256,8 +256,8 @@
 		};
 
 		camera-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 1>;
 
@@ -271,8 +271,8 @@
 		};
 
 		modem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 0>;
 
@@ -816,6 +816,8 @@
 			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
 			nvmem-cell-names = "calib", "calib_sel";
 			#qcom,sensors = <5>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tsens";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

