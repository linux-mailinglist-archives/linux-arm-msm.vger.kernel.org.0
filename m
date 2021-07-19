Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 757343CF02B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 01:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355079AbhGSW65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 18:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359530AbhGSVqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 17:46:05 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DDAC061225
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 15:21:47 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id j4so4052489pgk.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 15:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tTFCKMO8k2TaTynqoJkm6Y6DCBZwYLxkxo1sNfSJ2mQ=;
        b=oHZshIOojkRdSCbUCBqLcZ+97ZQFaWNL+TkRwnTgYtGHYeW+YRqvIfSGhyxxj3Ysfr
         jlrriZRrdER0HQj9nlOqcb9URdiSdNDOv/DUamqGn3Kg6nZw+w8i+Sr7wCkJz7/sseCd
         4a1MfMOq9pZSLn7Bd7zVV0NgmvsbfcEQBkllg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tTFCKMO8k2TaTynqoJkm6Y6DCBZwYLxkxo1sNfSJ2mQ=;
        b=dZYo4Avjc2gC8ZjKlRh+G98rjAudXV6ige9W+XB/n05zOoj1WaGqhtQvTvqp5urwWw
         cvLnKuXqzfuiPf9LM16lR7hzNyYzICK9dpcIBBlbne93aCCDeq3q6sH97LuXnNToEXf2
         +yr0fhT+DFm9uhf4ylCHjaudplON6DZIMRWniIwTnL7n07iWAU9e3Ui4zBNlWxeX3wYz
         aOkL184LdMb86e8gnoxwMb+48KWWCmujEsXFuNgs8ezYkEXH0DHoL9e17gKNjO2+iSde
         bKEImSLwAXdEkzuRsVABVJR85ydroHscqlVxA6VvRyH2lX1O5wgS0GS3xnHHqEFNwlsJ
         Hwlg==
X-Gm-Message-State: AOAM532xwgMAjgv051AzjBQKYktrZIDIgvf3RkUpB4DO9t5x/VwjJqmv
        tqrWWkMZ9Lfonz7M3l9sc1bY4Q==
X-Google-Smtp-Source: ABdhPJzloLO+kz+86O/rt1Was+NfXs8iZWsLdWepHuMbo/wf47V62hPU+OiXKJXoDD3oJUou8k/i1A==
X-Received: by 2002:a65:56ca:: with SMTP id w10mr27137753pgs.107.1626733307101;
        Mon, 19 Jul 2021 15:21:47 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:4d0:bf5f:b8cd:2d67])
        by smtp.gmail.com with UTF8SMTPSA id d5sm1477777pjo.25.2021.07.19.15.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 15:21:46 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>, linux-usb@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v14 6/6] arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub
Date:   Mon, 19 Jul 2021 15:21:28 -0700
Message-Id: <20210719152055.v14.6.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
In-Reply-To: <20210719222128.4122837-1-mka@chromium.org>
References: <20210719222128.4122837-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for the onboard USB hub on trogdor devices. Remove the
'always-on' property from the hub regulator, since the regulator
is now managed by the onboard_usb_hub driver.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v14:
- none

Changes in v13:
- none

Changes in v12:
- none

Changes in v11:
- rebased on qcom/arm64-for-5.14 (with the rest of the series)

Changes in v10:
- keep 'regulator-boot-on' property
- updated commit message

Changes in v9:
- none

Changes in v8:
- none

Changes in v7:
- rebased on qcom/arm64-for-5.13 (with the rest of the series)

Changes in v6:
- added 'companion-hub' entry to both USB devices
- added 'vdd-supply' also to hub@2

Changes in v5:
- patch added to the series

 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 19 ++++++++-----------
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 12 +++++-------
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 19 ++++++++-----------
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 19 ++++++++++++++++++-
 4 files changed, 39 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
index 30e3e769d2b4..5fb8e12af1a0 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
@@ -14,17 +14,6 @@ / {
 	compatible = "google,lazor-rev0", "qcom,sc7180";
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
@@ -33,3 +22,11 @@ &sn65dsi86_out {
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
index c2ef06367baf..1dae714250f5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -14,13 +14,11 @@ / {
 	compatible = "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
 };
 
-&pp3300_hub {
-	/* pp3300_l7c is used to power the USB hub */
-	/delete-property/regulator-always-on;
-	/delete-property/regulator-boot-on;
+
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
index 77ae7561d436..f89c6a7045e5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -202,7 +202,6 @@ pp3300_hub: pp3300-hub {
 		pinctrl-names = "default";
 		pinctrl-0 = <&en_pp3300_hub>;
 
-		regulator-always-on;
 		regulator-boot-on;
 
 		vin-supply = <&pp3300_a>;
@@ -898,6 +897,24 @@ &usb_1 {
 
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
2.32.0.402.g57bb445576-goog

