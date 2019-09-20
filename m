Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 382EBB9944
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 23:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbfITVxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 17:53:08 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37493 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730269AbfITVxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 17:53:08 -0400
Received: by mail-pl1-f193.google.com with SMTP id b10so3801115plr.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=VrMMAxmAWCoF+Z0mK+KREcF/roJedPfia4jPAm5aT6w=;
        b=hdTk7WbnOHXiUYbTZwim1OGeWK5A2LQE3v5T+TYfGXALHEHxrDwjzCh1hqE/ERTYgR
         FdTBcF6j5GvfHYhtuzgU4xG6Sdi0Sy9bTUp4XIvgqNqDSofcArTPULOTd4YlATbCQ2dy
         glTCi0fnP9Ou0ClR+6FkWVe76hx1AN/MdCwVLDtnfVN7qr1ag7U+i0PyqK9sIh/n/lIU
         KLYoRRjem3y9H0naE59MoURT6YLYgPoceEOSLTOCKfgWci2CSLlP0r1E5up2nMV9orSw
         QXuZsnzyROWpe/r8KrrBKnCTPZ1RjJJVWcbm1hV7Dg2es97kjX9AzZjxSm/XZi1kPnFX
         3Luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=VrMMAxmAWCoF+Z0mK+KREcF/roJedPfia4jPAm5aT6w=;
        b=e6yUVtJCB7SYE7Tui4M07Se8rd7pvkw8GZLu3SXS7judMwYRt5DqTonHE3oUC9H8ab
         1S5g8vaxUXucxkpdlgb4lNr69On9GppPbZJ8xq55fv8BvdcZ2h8mPWTS0KJ6XOQpQZI+
         /qWNARd9AJETOiSolLttPwsLeBS9bHgxjdfq9UmfgCgj9Pfte/SLB+bsPu+g2DdexAcp
         vg1L4iTy6ZFTMk2fThAgtabjzH9qheiCuylXaCzMoUWFItT0b6F1dY2jvMGG1UCzYEvv
         e88gzxFfetzlBwbzHdJ4y5dDUHjAuRP/jggWO3azPfQuQgOCz9ldvSW8YQLnKAncb8/S
         gqUg==
X-Gm-Message-State: APjAAAWX33lmN2fCh87JcvTyP7ixAmkO/Sdw6aVcxUh674o8eoC1e3ZY
        KpLpG1Y0xVFP2gMoGHnUPv+0Mg==
X-Google-Smtp-Source: APXvYqxxt3Vokdo3rTZjJNHgc7wDhDM2N4L65qSbpGr0UPuV1inanDjg6Nu3bSQHqgtQHpxsxvDRsQ==
X-Received: by 2002:a17:902:14b:: with SMTP id 69mr18922218plb.286.1569016386832;
        Fri, 20 Sep 2019 14:53:06 -0700 (PDT)
Received: from localhost (wsip-98-175-107-49.sd.sd.cox.net. [98.175.107.49])
        by smtp.gmail.com with ESMTPSA id f6sm2910513pga.50.2019.09.20.14.53.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 14:53:06 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v4 12/15] arm: dts: msm8974: thermal: Add interrupt support
Date:   Fri, 20 Sep 2019 14:52:27 -0700
Message-Id: <12ce7db8f17cdaf8fef89ed7f1fce10f08acab57.1569015835.git.amit.kucheria@linaro.org>
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

