Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48376354780
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 22:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240774AbhDEUSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 16:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240794AbhDEUSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 16:18:37 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38CFEC0613A7
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 13:18:29 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id f29so6357198pgm.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 13:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tijFZemGnAqW4QkhHd4/sRMQC3EyE+ul3O/NdZFBP9U=;
        b=ibeXncgjW5KSrPQ8lbDWrgJOJN/ClQw59W39Rm3LwK90SmRjq5AHOgIUx5JN3eo3Sf
         52JwrrbglGX5jNDtkU1icZhXX+oWIYx7dQ7XWsMgzKgj4KBjs/SU4nUTmA/YUutzz8jw
         6qe4gzDwjhHivxR4KHS8E3as1g9a7dGIDiThU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tijFZemGnAqW4QkhHd4/sRMQC3EyE+ul3O/NdZFBP9U=;
        b=U1lKcVoCerD4f2dwg7M4di8hLvs/CabXoU3FMbfrg/5bI9b20vGeJz9DctZRP1QnjX
         S8GaWcXQpdY1yC8Xkp/5t8C8SYkKt+TFyTpGcBLzyjP8UVjGu+5Ewzmgewes3PMLMkNy
         548WlYreKQoIfH4gwaDVuzgnUtEBk+wo9c1SkZun1xccGJelnUDnMJX0du8Ue42wmr6I
         GivldFbw9PfDo7AR+uVeCa3PXm/3oXc9aHJIQOjKgJ0EXgL2Z/4B4fwJHVPfQYxGJ23C
         vKcyJMRRJ2ZPAFM1RjFjSwvQ7Dx77NU2w4fQzHvgpUTcnze7tgw4Xrt+qG6Md6PV8pPw
         /BPg==
X-Gm-Message-State: AOAM531rcBP9XCznk3bdhKejtEFlPuBLPoS7lcm7SeXOeenNsFCwhzk7
        JeQWR0XaQAxSIsUQxBf7ue22ag==
X-Google-Smtp-Source: ABdhPJyGNTsZMgZKl0yUbXLPpkMgOgC8CW0mTVsYrvElwyuqZ5LvabEEIB0mIWTX9k9xEOMkgOvlTg==
X-Received: by 2002:a65:5849:: with SMTP id s9mr24629710pgr.309.1617653908757;
        Mon, 05 Apr 2021 13:18:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:455e:b8cf:5939:67da])
        by smtp.gmail.com with UTF8SMTPSA id 205sm17160648pfc.201.2021.04.05.13.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 13:18:28 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Peter Chen <peter.chen@nxp.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 5/5] arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub
Date:   Mon,  5 Apr 2021 13:18:17 -0700
Message-Id: <20210405124900.v6.5.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210405201817.3977893-1-mka@chromium.org>
References: <20210405201817.3977893-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for the onboard USB hub on trogdor devices. Remove the
'always-on' and 'boot-on' properties from the hub regulator, since
the regulator is now managed by the onboard_usb_hub driver.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v7:
- rebased on qcom/arm64-for-5.13 (with the rest of the series)

Changes in v6:
- added 'companion-hub' entry to both USB devices
- added 'vdd-supply' also to hub@2

Changes in v5:
- patch added to the series

 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 19 +++++++----------
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 11 ++++------
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 19 +++++++----------
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 21 ++++++++++++++++---
 4 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
index 5c997cd90069..bae85f6b2bfa 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
@@ -23,17 +23,6 @@ &charger_thermal {
 	status = "disabled";
 };
 
-&pp3300_hub {
-	/* pp3300_l7c is used to power the USB hub */
-	/delete-property/regulator-always-on;
-	/delete-property/regulator-boot-on;
-};
-
-&pp3300_l7c {
-	regulator-always-on;
-	regulator-boot-on;
-};
-
 &sn65dsi86_out {
 	/*
 	 * Lane 0 was incorrectly mapped on the cable, but we've now decided
@@ -42,3 +31,11 @@ &sn65dsi86_out {
 	 */
 	lane-polarities = <1 0>;
 };
+
+&usb_hub_2_0 {
+	 vdd-supply = <&pp3300_l7c>;
+};
+
+&usb_hub_3_0 {
+	 vdd-supply = <&pp3300_l7c>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index d9fbcc7bc5bd..45f014c3539d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -23,13 +23,10 @@ &charger_thermal {
 	status = "disabled";
 };
 
-&pp3300_hub {
-	/* pp3300_l7c is used to power the USB hub */
-	/delete-property/regulator-always-on;
-	/delete-property/regulator-boot-on;
+&usb_hub_2_0 {
+	 vdd-supply = <&pp3300_l7c>;
 };
 
-&pp3300_l7c {
-	regulator-always-on;
-	regulator-boot-on;
+&usb_hub_3_0 {
+	 vdd-supply = <&pp3300_l7c>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index 2b522f9e0d8f..2f5263e3d1b9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -42,17 +42,6 @@ &panel {
 	compatible = "auo,b116xa01";
 };
 
-&pp3300_hub {
-	/* pp3300_l7c is used to power the USB hub */
-	/delete-property/regulator-always-on;
-	/delete-property/regulator-boot-on;
-};
-
-&pp3300_l7c {
-	regulator-always-on;
-	regulator-boot-on;
-};
-
 &sdhc_2 {
 	status = "okay";
 };
@@ -61,6 +50,14 @@ &trackpad {
 	interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
 };
 
+&usb_hub_2_0 {
+	 vdd-supply = <&pp3300_l7c>;
+};
+
+&usb_hub_3_0 {
+	 vdd-supply = <&pp3300_l7c>;
+};
+
 /* PINCTRL - modifications to sc7180-trogdor.dtsi */
 
 &trackpad_int_1v8_odl {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 192e2e424fde..54f9da9af376 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -206,9 +206,6 @@ pp3300_hub: pp3300-hub {
 		pinctrl-names = "default";
 		pinctrl-0 = <&en_pp3300_hub>;
 
-		regulator-always-on;
-		regulator-boot-on;
-
 		vin-supply = <&pp3300_a>;
 	};
 
@@ -848,6 +845,24 @@ &usb_1 {
 
 &usb_1_dwc3 {
 	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* 2.0 hub on port 1 */
+	usb_hub_2_0: hub@1 {
+		compatible = "usbbda,5411";
+		reg = <1>;
+		vdd-supply = <&pp3300_hub>;
+		companion-hub = <&usb_hub_3_0>;
+	};
+
+	/* 3.0 hub on port 2 */
+	usb_hub_3_0: hub@2 {
+		compatible = "usbbda,411";
+		reg = <2>;
+		vdd-supply = <&pp3300_hub>;
+		companion-hub = <&usb_hub_2_0>;
+	};
 };
 
 &usb_1_hsphy {
-- 
2.31.0.208.g409f899ff0-goog

