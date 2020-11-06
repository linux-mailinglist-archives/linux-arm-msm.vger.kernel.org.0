Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8518B2A9FAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 23:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbgKFWBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 17:01:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgKFWBk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 17:01:40 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6F5C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 14:01:40 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id b12so1290432plr.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 14:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EfB7+tNTTXJ2acGOAhZ34sHjmoSelUYiX9aBEVisl1Q=;
        b=W9Wm0lFv6sy92BOnVLqGBX7jEIvk0s4FMV+A3m8FgS98Wvf7YAqCGAyORT2/LQhXb7
         AsyeQVHuoLRqqPYdeOjYhvOag655GN76cNNA2ZVWZ71MQrL2KkGtAS588L38fy8Hv19Y
         FHoZk+VjRD47e+2HuQ9sDErFhyJZx++yan2wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfB7+tNTTXJ2acGOAhZ34sHjmoSelUYiX9aBEVisl1Q=;
        b=jMUuY9g5BHr2u3/tyi7zATa+7sK9Q6/esEXteQEwSzip8PZa4/KAOcCnI6CzlS8xoi
         iRtPq7Cz7xHG8h8J1Ct2EXarMraUSdxhoOITE9OI69pttAoutPavS/nx+ZqfX7CTToR4
         wvkBQev6M/PbvL1ad7DlVEW/4uc9I/GKkW6P+9ilhdeXeeTmhGEFmBznWYZ2+2Kqe/LD
         6TBD/vWDOqN+e2L7YXh223hHJW1FQ+72i+YCc4wNjxYVNIT8+/Y9dT+nFkbL05ONTHp5
         zAWnZ1OH+nUnlGPEmVRiB2Xrn/WPUhYZQTe7J4fKXZ+0wAdUaER2pEEh+o0lMjV75IGn
         lZCw==
X-Gm-Message-State: AOAM532cSWyUtOZhqQoSTD86K2ZT+UAtr88CJg551Jwksj0gXkxy6vzo
        AqSVyineFhY3UHvE6mjwTsKd6Q==
X-Google-Smtp-Source: ABdhPJx1sThIjA2cJ14RP3Ro75VQ4Yhqrkxdal7J0Tsr4CpZu74wrpVqKa0DE8ASalZ9q0HQlxB1GQ==
X-Received: by 2002:a17:902:6545:b029:d6:9a59:800d with SMTP id d5-20020a1709026545b02900d69a59800dmr3173413pln.31.1604700099797;
        Fri, 06 Nov 2020 14:01:39 -0800 (PST)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id r6sm3221007pfh.166.2020.11.06.14.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2020 14:01:39 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the default supply for pp3300_hub
Date:   Fri,  6 Nov 2020 14:01:33 -0800
Message-Id: <20201106140125.v3.2.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201106140125.v3.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
References: <20201106140125.v3.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The trogdor design has two options for supplying the 'pp3300_hub' power
rail, it can be supplied by 'pp3300_l7c' or 'pp3300_a'. The 'pp3300_a'
path includes a load switch that can be controlled through GPIO84.
Initially trogdor boards used 'pp3300_l7c' to power the USB hub, newer
revisions (will) use 'pp3300_a' as supply for 'pp3300_hub'.

Add a DT node for the 'pp3300_a' path and a pinctrl entry for the GPIO.
Make this path the default and keep trogdor rev1, lazor rev0 and rev1
on 'pp3300_l7c'. These earlier revisions also allocated the GPIO to the
purpose of controlling the power switch, so there is no need to limit
the pinctrl config to newer revisions. Remove the platform-wide
'always/boot-on' properties from 'pp3300_l7c' and add them to the
boards that use this supply. Also delete the 'always/boot-on'
properties of 'pp3300_hub' for these boards.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v3:
- removed 'always-on' and 'boot-on' from 'pp3300_l7c'
- always pair 'always-on' and 'boot-on' properties
- removed comment for 'pp3300_hub' 'always-on' and 'boot-on' properties

Changes in v2:
- added 'always-on' and 'boot-on' properties for new 'pp3300_hub'
- removed platform-wide 'always-on' property for 'pp3300_l7c'
- added 'always-on' property to 'pp3300_l7c'  for boards that still
  use 'pp3300_l7c'
- delete 'always-on' property of 'pp3300_hub' for boards that still
  use 'pp3300_l7c'
- got rid of 'pp3300_hub_7c' label, just use 'pp3300_l7c'
- fixed position of 'en_pp3300_hub' node to respect ordering
- updated commit message

 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 15 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 15 ++++++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 15 ++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 34 +++++++++++++++++--
 4 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
index ae4c23a4fe65..b1b35f8104ca 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
@@ -14,6 +14,17 @@ / {
 	compatible = "google,lazor-rev0", "qcom,sc7180";
 };
 
+&pp3300_hub {
+	/* pp3300_l7c is used to power the USB hub */
+	/delete-property/regulator-always-on;
+	/delete-property/regulator-boot-on;
+};
+
+&pp3300_l7c {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
 &sn65dsi86_out {
 	/*
 	 * Lane 0 was incorrectly mapped on the cable, but we've now decided
@@ -22,3 +33,7 @@ &sn65dsi86_out {
 	 */
 	lane-polarities = <1 0>;
 };
+
+&usb_hub {
+	vdd-supply = <&pp3300_l7c>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index 9354d4c5ef7d..48745779720d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -13,3 +13,18 @@ / {
 	model = "Google Lazor (rev1 - 2)";
 	compatible = "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
 };
+
+&pp3300_hub {
+	/* pp3300_l7c is used to power the USB hub */
+	/delete-property/regulator-always-on;
+	/delete-property/regulator-boot-on;
+};
+
+&pp3300_l7c {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&usb_hub {
+	 vdd-supply = <&pp3300_l7c>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index 0a281c24841c..e33e38dfd35b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -58,10 +58,25 @@ ap_ts: touchscreen@10 {
 	};
 };
 
+&pp3300_hub {
+	/* pp3300_l7c is used to power the USB hub */
+	/delete-property/regulator-always-on;
+	/delete-property/regulator-boot-on;
+};
+
+&pp3300_l7c {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
 &sdhc_2 {
 	status = "okay";
 };
 
+&usb_hub {
+	 vdd-supply = <&pp3300_l7c>;
+};
+
 /* PINCTRL - board-specific pinctrl */
 
 &tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index bf875589d364..72b04a148c78 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -174,6 +174,24 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
 		vin-supply = <&pp3300_a>;
 	};
 
+	pp3300_hub: pp3300-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_hub";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp3300_hub>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&pp3300_a>;
+	};
+
 	/* BOARD-SPECIFIC TOP LEVEL NODES */
 
 	backlight: backlight {
@@ -469,13 +487,10 @@ ppvar_l6c: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		pp3300_hub:
 		pp3300_l7c: ldo7 {
 			regulator-min-microvolt = <3304000>;
 			regulator-max-microvolt = <3304000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
-			regulator-boot-on;
 		};
 
 		pp1800_brij_vccio:
@@ -1164,6 +1179,19 @@ pinconf {
 		};
 	};
 
+	en_pp3300_hub: en-pp3300-hub {
+		pinmux {
+			pins = "gpio84";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio84";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	fpmcu_boot0: fpmcu-boot0 {
 		pinmux {
 			pins = "gpio10";
-- 
2.29.1.341.ge80a0c044ae-goog

