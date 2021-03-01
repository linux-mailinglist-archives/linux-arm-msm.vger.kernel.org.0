Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7023293E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 22:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238560AbhCAVmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 16:42:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237548AbhCAVkA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 16:40:00 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A9DC06121F
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 13:34:52 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 201so12418048pfw.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 13:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V0ebxcgXbfQv5hp4rfD6Yg7e3MPCcpWELcwXvbVKAmU=;
        b=eikxe/oZZvFtL4ioJ8o67Jzm07Sp/7RDF5NaQpn6TnvW4pudGJta+MHvB9Eh/nxPR3
         eWf7xfACZYmDN01pf/H1n6pmSeHDkKcLRHKeXR0eVnl3xyTgQrkDG0vcc2lQCW7oHrhW
         /Qf/VzyhGIDMyxUMBCZT2FWqT4UVlYi5tLXHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V0ebxcgXbfQv5hp4rfD6Yg7e3MPCcpWELcwXvbVKAmU=;
        b=UJAx/Ov84fImzDbdcNRbaLinzhc1UObUkQPAcZZ64RYpKqVbCgdP6UvokWj8SvoOpZ
         lT69NFglg3mesuYnfyWzd10HXirQwUlkiZWRNWZADsWDgiLrmXiISPWcHn6xLIfYKHvz
         e4GOVVrrtDyME5P3wt4mEQcsPjRiuCalOS01gFk4E8qMcrHNG6AgtSFXj1aahzO9QVFH
         L/uedCvVXcf59/0JZeycMm8gQQo9BaM59eac27NoxKU+aAb0M5Vrt+uqQSDSJLg93dcb
         iDIl9w259Kww6EeEMqGQR92PqgfrA7x3vKoq7KYbXgE0+tukFBdpt1grNaEhOneBw8SA
         lunw==
X-Gm-Message-State: AOAM532dALVkEUz3CNdDb8GK4vh/uaIAYqPkmLUhR0px1PTrqZebR8mR
        EL5r0epKh+kvkSd7tp2bqliolg==
X-Google-Smtp-Source: ABdhPJxQAzkSFImr3H3hNeEOmB5bpk0C9a434SRfXl1AukyX37Q0h4TWQKBMN8iH9cefhl7wxfgJFQ==
X-Received: by 2002:aa7:82cf:0:b029:1cc:5393:ad8e with SMTP id f15-20020aa782cf0000b02901cc5393ad8emr16984349pfn.3.1614634491803;
        Mon, 01 Mar 2021 13:34:51 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:c086:5f6:85dd:98c8])
        by smtp.gmail.com with ESMTPSA id f13sm790366pjj.1.2021.03.01.13.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 13:34:51 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] arm64: dts: qcom: Unify the sc7180-trogdor panel nodes
Date:   Mon,  1 Mar 2021 13:34:28 -0800
Message-Id: <20210301133318.v2.4.I1483fac4c5ae4b2d7660290ff85d69945292618f@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210301213437.4165775-1-dianders@chromium.org>
References: <20210301213437.4165775-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's avoid a bit of duplication by pushing this up to the trogdor.dtsi
file.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

(no changes since v1)

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
index b471503e415e..7341fe6e2c0b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -257,6 +257,21 @@ max98357a: audio-codec-0 {
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

