Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBA02AF96D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 21:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgKKUDs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 15:03:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgKKUDr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 15:03:47 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4856C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 12:03:47 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id g7so2328679pfc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 12:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DXaYZfXLx6Cp2pU+xUA5JlOzbe7aCi/UqFCMY0tSnls=;
        b=D0MowZnMt52H/BXOEHQRLrGWTU9enHwLPcI+V3J22NwWe4hJWezqbZ+7tKbx82FlXO
         Ohp7t18z81hFc6IFCmX0dla5d5WNkpR01qIFz7NO5y2KWE/qorN/kQkGPM2aalQNMemP
         1b+F3EcVjGif5nYwBt2vwDnw33Lx7r+WHuyo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DXaYZfXLx6Cp2pU+xUA5JlOzbe7aCi/UqFCMY0tSnls=;
        b=PpivSwbklLCox15zooLnGoKRHnsNFK/oEw02qQeNbN7lumj93vzYDoPKlzUnXiQTVl
         0QnUplo+SPt/9+g7ANW30PkiAUX9276rR83VCTC63ImEZfl/oHr08N5Ktwva394QuylQ
         +9EK0Ciz8ujHGLhsr2N/AWCD65YZoa7uUuAnZPZhFbECnm2MIJZ8SunfcY0atAhKJ/Hy
         3VX/R5GwuAs3Vjj2JzHBoNruHdvHxkGjeDUISHukTfpaHW0Z9wqLdNTz+i4uajT45t9+
         44NoVXcQklMJjj7I1feegG8+fzDjCQgIXqj/fB2XgABDgXbRcbgdFn384MpAkjNgRdxe
         4bYQ==
X-Gm-Message-State: AOAM532z3r03WUDKXJusmJjhfaHueHG3Qf6+n8vw1yA0eacU708EyLqA
        kHyEJIbxccH2bRK3KaG5Js/gPg==
X-Google-Smtp-Source: ABdhPJwdj6nsqjDpGwFbeVucPrC12E8DS0/xfoDbSNVHt1LqQedq70b0ikdS6MVyUf5e9Ie9kOE+YQ==
X-Received: by 2002:a63:c43:: with SMTP id 3mr24166118pgm.222.1605125027215;
        Wed, 11 Nov 2020 12:03:47 -0800 (PST)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id k7sm3464316pfa.184.2020.11.11.12.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 12:03:46 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Rajeshwari <rkambl@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Set 'polling-delay-passive' for thermal zones back to 250 ms
Date:   Wed, 11 Nov 2020 12:03:43 -0800
Message-Id: <20201111120334.1.Ifc04ea235c3c370e3b21ec3b4d5dead83cc403b4@changeid>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode
in Thermal-zones node") sets both 'polling-delay' and
'polling-delay-passive' to zero with the rationale that TSENS interrupts
are enabled. A TSENS interrupt fires when the temperature of a thermal
zone reaches a trip point, which makes regular polling below the passive
trip point temperature unnecessary. However the situation is different
when passive cooling is active, regular polling is still needed to
trigger a periodic evaluation of the thermal zone by the thermal governor.

Change 'polling-delay-passive' back to the original value of 250 ms.
Commit 2315ae70af95 ("arm64: dts: qcom: sc7180: Add gpu cooling
support") recently changed the value for the GPU thermal zones from
zero to 100 ms, also set it to 250 ms for uniformity. If some zones
really need different values these can be changed in dedicated patches.

Fixes: 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in Thermal-zones node")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 50 ++++++++++++++--------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 4e7e58c63285..2f454686a883 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3520,7 +3520,7 @@ lpass_hm: clock-controller@63000000 {
 
 	thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 1>;
@@ -3569,7 +3569,7 @@ map1 {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 2>;
@@ -3618,7 +3618,7 @@ map1 {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 3>;
@@ -3667,7 +3667,7 @@ map1 {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 4>;
@@ -3716,7 +3716,7 @@ map1 {
 		};
 
 		cpu4-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 5>;
@@ -3765,7 +3765,7 @@ map1 {
 		};
 
 		cpu5-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 6>;
@@ -3814,7 +3814,7 @@ map1 {
 		};
 
 		cpu6-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 9>;
@@ -3855,7 +3855,7 @@ map1 {
 		};
 
 		cpu7-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 10>;
@@ -3896,7 +3896,7 @@ map1 {
 		};
 
 		cpu8-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 11>;
@@ -3937,7 +3937,7 @@ map1 {
 		};
 
 		cpu9-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 12>;
@@ -3978,7 +3978,7 @@ map1 {
 		};
 
 		aoss0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 0>;
@@ -3999,7 +3999,7 @@ aoss0_crit: aoss0_crit {
 		};
 
 		cpuss0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 7>;
@@ -4019,7 +4019,7 @@ cpuss0_crit: cluster0_crit {
 		};
 
 		cpuss1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 8>;
@@ -4039,7 +4039,7 @@ cpuss1_crit: cluster0_crit {
 		};
 
 		gpuss0-thermal {
-			polling-delay-passive = <100>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 13>;
@@ -4067,7 +4067,7 @@ map0 {
 		};
 
 		gpuss1-thermal {
-			polling-delay-passive = <100>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 14>;
@@ -4095,7 +4095,7 @@ map0 {
 		};
 
 		aoss1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 0>;
@@ -4116,7 +4116,7 @@ aoss1_crit: aoss1_crit {
 		};
 
 		cwlan-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 1>;
@@ -4137,7 +4137,7 @@ cwlan_crit: cwlan_crit {
 		};
 
 		audio-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 2>;
@@ -4158,7 +4158,7 @@ audio_crit: audio_crit {
 		};
 
 		ddr-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 3>;
@@ -4179,7 +4179,7 @@ ddr_crit: ddr_crit {
 		};
 
 		q6-hvx-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 4>;
@@ -4200,7 +4200,7 @@ q6_hvx_crit: q6_hvx_crit {
 		};
 
 		camera-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 5>;
@@ -4221,7 +4221,7 @@ camera_crit: camera_crit {
 		};
 
 		mdm-core-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 6>;
@@ -4242,7 +4242,7 @@ mdm_crit: mdm_crit {
 		};
 
 		mdm-dsp-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 7>;
@@ -4263,7 +4263,7 @@ mdm_dsp_crit: mdm_dsp_crit {
 		};
 
 		npu-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 8>;
@@ -4284,7 +4284,7 @@ npu_crit: npu_crit {
 		};
 
 		video-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <250>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 9>;
-- 
2.29.2.222.g5d2a92d10f8-goog

