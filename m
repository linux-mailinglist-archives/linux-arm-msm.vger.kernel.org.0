Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70D32C35BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 01:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgKYAsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 19:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbgKYAsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 19:48:20 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C07DC061A4D
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 16:48:18 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id 131so694621pfb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 16:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zIJ5sPJ4vLlu5jw+88lTkiZ9z4ChIp0VSe8hT9RWXJQ=;
        b=dhl0netW67zWzO+8NhZw+ZdDd7uW21uy9Ym3D2YUpHqscxgFjuxhGU9cUz4AS5GjDs
         KTewJv+haivcWzks9l8jdjT30vWnbw7vhbok7Uem82rNq8f8XxIrQYF+zztW1GPGPBog
         hDqPuuXkb9dhG6xNvuiMQ/DmvmNIlAg5FgLK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zIJ5sPJ4vLlu5jw+88lTkiZ9z4ChIp0VSe8hT9RWXJQ=;
        b=TIdZ5LBOXzL1Y3q2uvFSy4VWud3b3IQBpsZVyOax6QpLbPzwj3W3vhLLwLHZHSD7l0
         M/weHBKHclaVzQiVf3tzDesQfwsa/p7YGYUSalVWTHkOVW5Y7OtEiL+V1Jd0CqHgkZgZ
         JJI4ovgpeEyw2YuAQC8m9D+Z0+5talr9mzjVLfugZaTEbj1zANglt9Pns8dr4hBGB1we
         qmy6xHzJfoQW48QtQSDtn0tXimqUR9speYBQjPxRCmYY63HbWeKcmO2srfMv1g6xjstq
         qaqUC9k0iSYqyKeUObqWGfKjIWtD3ApfZAI4e2BT9OtDwueXobJIcCX1YNoObJK8Srdr
         NlKw==
X-Gm-Message-State: AOAM533laOCCkiBvdR9DFjElztlTZOxibYeLT483pvEbhfIPnHY9tkBV
        Cc1yNRsh6nUrZdY0MyhYMRIEMg==
X-Google-Smtp-Source: ABdhPJzGts/jVMfPOVVQ2h+jli/wC/GeZyWR5FG6ltFqvuQZUbXeZk4ws5HG6x+Nn29S10lgrv89sA==
X-Received: by 2002:a17:90a:fd02:: with SMTP id cv2mr1013215pjb.176.1606265297868;
        Tue, 24 Nov 2020 16:48:17 -0800 (PST)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id b21sm388190pji.24.2020.11.24.16.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 16:48:17 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the default supply for pp3300_hub
Date:   Tue, 24 Nov 2020 16:48:13 -0800
Message-Id: <20201124164714.v4.1.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- removed references to the 'usb_hub' node, which currently doesn't
  exist upstream

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

 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 11 ++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 11 ++++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 11 ++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 34 +++++++++++++++++--
 4 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
index ae4c23a4fe65..30e3e769d2b4 100644
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
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index 9354d4c5ef7d..c2ef06367baf 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -13,3 +13,14 @@ / {
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
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index 59d67fb0efe8..2cb522d6962e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -53,6 +53,17 @@ ap_ts: touchscreen@10 {
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
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 3eb1ff2483be..28b0ad1ed157 100644
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
@@ -478,13 +496,10 @@ ppvar_l6c: ldo6 {
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
@@ -1185,6 +1200,19 @@ pinconf {
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
2.29.2.454.gaff20da3a2-goog

