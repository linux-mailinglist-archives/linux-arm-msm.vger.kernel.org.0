Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF49316C31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 18:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbhBJRM1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 12:12:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232284AbhBJRMP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 12:12:15 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A9FC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 09:11:01 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id u143so1666588pfc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 09:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MynKB3zDxo9w9UYnw53HrNYGxhUpC6ssOT3SyYd0CAw=;
        b=eYr8ih6o7frG1XMugs8uK4ByheSMHVR7LYRs7DXFJXZBzgdn3ltV+2NCmCvv6lGqYZ
         1WU+vkGNp9J02UFmdpuS9qPlGswJO3STHx2Nit5AZJHSa3s1RBLoAwCSRaIY8O1JBOcd
         3D6vrgUxvEDDiCjLyU42/Bxdeqkibq3vA3oeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MynKB3zDxo9w9UYnw53HrNYGxhUpC6ssOT3SyYd0CAw=;
        b=pHXUrsVVAIKdDnGYsjzCqoYBnsXRqIuMZXc7gOEGoF72FZh/AZGMCytmELmR+Ot8i0
         EjDKB6j/YctmDmI2F/iBYtVGN607xPVc3p+gJW6GxCsUayDcJMrCn3P88pjTNFnXqrAq
         fmA4F8Vym32aSjUtjQ8Te/RvuYsyJJl1km3ydBKf1amcINHHOnX0L6+XmpNSVHofGDaC
         jNEbbxW7cVuhP+8YNDF7sT98T8RjDacwUwJtwd3jgc/UwaBZ7YAg34i+zpmjqZ/sW2CP
         7oQUvT3Vb25FHRnq7/ZxYLm3sjRQuNWYMF+daCbva64r8rcHkyLW3q4iZz2o68O8Orbv
         eOGw==
X-Gm-Message-State: AOAM530oD9G90LsgGTtFkAzfaEDcI4azUhItTRS+ikr0a3s/oCbtBTlE
        CGSh6719JYTl9kUsbyRLyr2MCQ==
X-Google-Smtp-Source: ABdhPJzPtcICQpuX4YC1LPJAdGMjTGBS6IgyHMm0O/0AKreWF2jSfD/JtE5/V6qPOX/cngvv04qsjQ==
X-Received: by 2002:aa7:80ca:0:b029:1c1:b636:ecc2 with SMTP id a10-20020aa780ca0000b02901c1b636ecc2mr4160844pfn.20.1612977060750;
        Wed, 10 Feb 2021 09:11:00 -0800 (PST)
Received: from localhost ([2620:15c:202:1:d8e6:826a:fc50:2158])
        by smtp.gmail.com with UTF8SMTPSA id f3sm2977494pgh.75.2021.02.10.09.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 09:10:58 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 4/4] arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub
Date:   Wed, 10 Feb 2021 09:10:39 -0800
Message-Id: <20210210091015.v5.4.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210210171040.684659-1-mka@chromium.org>
References: <20210210171040.684659-1-mka@chromium.org>
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

Changes in v5:
 - patch added to the series

 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts  | 15 ++++-----------
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts  | 11 ++---------
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 15 ++++-----------
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 18 +++++++++++++++---
 4 files changed, 25 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
index 30e3e769d2b4..a557c269b998 100644
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
@@ -33,3 +22,7 @@ &sn65dsi86_out {
 	 */
 	lane-polarities = <1 0>;
 };
+
+&usb_hub_2_0 {
+	 vdd-supply = <&pp3300_l7c>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index c2ef06367baf..d182b7a231f4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -14,13 +14,6 @@ / {
 	compatible = "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
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
+&usb_hub_2_0 {
+	 vdd-supply = <&pp3300_l7c>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index 2cb522d6962e..699e7815697a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -53,21 +53,14 @@ ap_ts: touchscreen@10 {
 	};
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
 
+&usb_hub_2_0 {
+	 vdd-supply = <&pp3300_l7c>;
+};
+
 /* PINCTRL - board-specific pinctrl */
 
 &tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 8ed7dd39f6e3..9add00cc32a5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -203,9 +203,6 @@ pp3300_hub: pp3300-hub {
 		pinctrl-names = "default";
 		pinctrl-0 = <&en_pp3300_hub>;
 
-		regulator-always-on;
-		regulator-boot-on;
-
 		vin-supply = <&pp3300_a>;
 	};
 
@@ -894,6 +891,21 @@ &usb_1 {
 
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
+	};
+
+	/* 3.0 hub on port 2 */
+	usb_hub_3_0: hub@2 {
+		compatible = "usbbda,411";
+		reg = <2>;
+	};
 };
 
 &usb_1_hsphy {
-- 
2.30.0.478.g8a0d178c01-goog

