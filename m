Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73E9325968
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbhBYWP4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:15:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbhBYWPB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:15:01 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E01BC0617AB
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:43 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id s16so3971560plr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I+OMtc3EHQkwIh9DKEWd2RBYBgfx+51DyxK3fF4WBeM=;
        b=kiw7n7Dnnn83YAr1BmCPiOcuuQnQP+A9ZtnQR0udKtLu/gW47ZtLvwdvtBRm84HXPp
         RxALb1P1GQYwYHgqjvKppQxRpTZS0iM3AFVcfYP8oR4yxbRKTA4x78/9mmfvQ6RQOQjo
         Rtj3ZQeoMvT1pupbphgw5XS7FY5PMeO59xQZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+OMtc3EHQkwIh9DKEWd2RBYBgfx+51DyxK3fF4WBeM=;
        b=Kl/1wHAmXzxgCXTQwl2YzzxiveDyGuVlqTRaFVsonijWfSfg0xRumZ5yWasW+bYAxO
         gpKZcqXFjQ3AL0jFdvDR3/grafIvjHSS+pI6m8tqHzg3HQUirrRhUEAqtGFxKLBXLRHt
         YK9ooov8z1H1gi4vDg70+Ib11Y0dM86bb/7HkXIjlFvUeiBgVY2QY7JuramY2DCsEDF1
         R9cIxBxboyTgVJEBxnFaba5VMkakqH0Jv+PQ8RexCbPvehkl8ty4R3/eqfKPc6tsENMU
         FnDxvhT2R7b/G3Fpl/36OY0qs4DM79tWkD1HC1f+wbX+j2X7fXX9K772eaJJudripDwK
         baGQ==
X-Gm-Message-State: AOAM531HKw5bF3oUJcXqAMF8UAFX+Drv19VPA592VaDqgMZ5sCzD86Jj
        +For+vJDa+G5fC4BjbZLnsIkDQ==
X-Google-Smtp-Source: ABdhPJyfBR/Ngo+oYUnU9QMvuceErgy8+K0e73IP/Mz4GhYbulstVOd6dDZFwEZD6/AtiZq8VKaJ3A==
X-Received: by 2002:a17:90a:5b0c:: with SMTP id o12mr66243pji.68.1614291222942;
        Thu, 25 Feb 2021 14:13:42 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:8414:45a5:94c4:d35d])
        by smtp.gmail.com with ESMTPSA id jt21sm6713301pjb.51.2021.02.25.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 14:13:42 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] arm64: dts: qcom: Unify the sc7180-trogdor panel nodes
Date:   Thu, 25 Feb 2021 14:13:01 -0800
Message-Id: <20210225141022.4.I1483fac4c5ae4b2d7660290ff85d69945292618f@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210225221310.1939599-1-dianders@chromium.org>
References: <20210225221310.1939599-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's avoid a bit of duplication by pushing this up to the trogdor.dtsi
file.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   | 21 ++++---------------
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 19 ++++-------------
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 15 +++++++++++++
 3 files changed, 23 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 11269522da50..5efa04d0d256 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -12,23 +12,6 @@
 
 #include "sc7180-trogdor.dtsi"
 
-/ {
-	panel: panel {
-		compatible = "boe,nv133fhm-n62";
-		power-supply = <&pp3300_dx_edp>;
-		backlight = <&backlight>;
-		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
-
-		ports {
-			port {
-				panel_in_edp: endpoint {
-					remote-endpoint = <&sn65dsi86_out>;
-				};
-			};
-		};
-	};
-};
-
 &ap_sar_sensor {
 	semtech,cs0-ground;
 	semtech,combined-sensors = <3>;
@@ -58,6 +41,10 @@ ap_ts: touchscreen@10 {
 	};
 };
 
+&panel {
+	compatible = "boe,nv133fhm-n62";
+};
+
 &trackpad {
 	interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index bd2c783e0f2f..2b522f9e0d8f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -17,21 +17,6 @@
 / {
 	model = "Google Trogdor (rev1+)";
 	compatible = "google,trogdor", "qcom,sc7180";
-
-	panel: panel {
-		compatible = "auo,b116xa01";
-		power-supply = <&pp3300_dx_edp>;
-		backlight = <&backlight>;
-		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
-
-		ports {
-			port {
-				panel_in_edp: endpoint {
-					remote-endpoint = <&sn65dsi86_out>;
-				};
-			};
-		};
-	};
 };
 
 ap_ts_pen_1v8: &i2c4 {
@@ -53,6 +38,10 @@ ap_ts: touchscreen@10 {
 	};
 };
 
+&panel {
+	compatible = "auo,b116xa01";
+};
+
 &pp3300_hub {
 	/* pp3300_l7c is used to power the USB hub */
 	/delete-property/regulator-always-on;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 4ad27b5c34d1..9fcb19a0501f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -255,6 +255,21 @@ max98357a: audio-codec-0 {
 		#sound-dai-cells = <0>;
 	};
 
+	panel: panel {
+		/* Compatible will be filled in per-board */
+		power-supply = <&pp3300_dx_edp>;
+		backlight = <&backlight>;
+		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			port {
+				panel_in_edp: endpoint {
+					remote-endpoint = <&sn65dsi86_out>;
+				};
+			};
+		};
+	};
+
 	pwmleds {
 		compatible = "pwm-leds";
 		keyboard_backlight: keyboard-backlight {
-- 
2.30.1.766.gb4fecdf3b7-goog

