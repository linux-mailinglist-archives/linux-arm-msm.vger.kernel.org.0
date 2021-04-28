Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0418C36DF20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 20:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243836AbhD1Smk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 14:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243766AbhD1Smb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 14:42:31 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C442C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 11:41:45 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id v191so2568918pfc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 11:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E3bpmI3ij+s4Bn917zTcmrlUif0swDwuIuphF3U3VDI=;
        b=mJltSIgnOlY8jLNsmR3q0qoNz5zbGh2PeZiJJflAqGaYQkmIg7eyIm8uHAkTHiYII2
         cG5sOc/yl8pAStdkUTqBP85TcrWInHkCbr3TMf3IJ57MILFa3noyDD3DNPWO/+1oIM8X
         Yc914H56Hd8eDJyHtklkPVyKFG3FECjx/DaX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E3bpmI3ij+s4Bn917zTcmrlUif0swDwuIuphF3U3VDI=;
        b=Dy+qRc9E8OraRo/wjmQPDE1MlHZ6ztPk82tAbiSJnrgyn5apnPbkfg0IXqVasmf083
         bX33c7sgI7R46fu7xj10JmRBk/FkSn2IflQn8zTjTqGplxP54shnMAnGViL8MzM5pLkt
         2rOqOaqPxdVhVRmNPKIkAgA3T73/w1m1Q91/MYJ+bD2mZehsHlpdfZ1UtogeWa19OUCV
         /Zi7X0Iz9nMTxusLMjKw7uX8pelVbs5CVsx9izGTet6Uw2z8latAz25EYvXUt2SdPteR
         zlk64BRyyjnzDDS8hIti5/JRbb+DOKd3g8mkKqV3LvMhCAlp+rRYUezeEu+mkUSIqNeQ
         kSRw==
X-Gm-Message-State: AOAM530bYXt8VdS4jra+4eFwKM+g3RJqbH2CDgxWVityxzRHNA7hQ0Rt
        sqY+RvKSYxWh0L6oq14SHr7lcw==
X-Google-Smtp-Source: ABdhPJzO/ZL8GUEuiu6USQy5QNLHChSc/k+S58EwJyltGsWyN+qBWrDGtCfP3AbEt2xtO1CbY8WfBA==
X-Received: by 2002:a63:4550:: with SMTP id u16mr28341245pgk.440.1619635305127;
        Wed, 28 Apr 2021 11:41:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:4c1a:a0a7:2b43:81b0])
        by smtp.gmail.com with UTF8SMTPSA id t9sm373402pgg.6.2021.04.28.11.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 11:41:44 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v8 5/5] arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub
Date:   Wed, 28 Apr 2021 11:41:32 -0700
Message-Id: <20210428114109.v8.5.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428184132.2184997-1-mka@chromium.org>
References: <20210428184132.2184997-1-mka@chromium.org>
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

Changes in v8:
- none

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
2.31.1.498.g6c1eba8ee3d-goog

