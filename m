Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1B541D096
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 02:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347044AbhI3Ags (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 20:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbhI3Agq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 20:36:46 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93811C06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 17:35:04 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id h3so4472550pgb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 17:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IjzHh64lVsb/lZGdokH420d5kapcdEZWn0niE1pG8Io=;
        b=k1XDa5kzkzk6WIXCCYBemIAgg6QjM1qe2Ui1PfxwfpS1hL01KcmHWNUmA9Y3frCCmR
         NAP/jd/im30Mx1iOJLlSOxbMtvGzQ+PETFqONxiUBNtsLqcBn+rTSzRPA+OannOxTvVa
         C4psKIMyqurDUZqwaX/P9QtnpNfHMZW7aeJ34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IjzHh64lVsb/lZGdokH420d5kapcdEZWn0niE1pG8Io=;
        b=O4gNl2dml7rmK3yNI7RWPoxyCuMu9hSqp+GfO/s73QRJnABANKI2wv/SnDAk2xRr4v
         Rs03/HUo0REaLlCj9VrDcqN3t/UgDsuY1D2JjqYWhlGa0B50Vnw+ec/ds66vazu3xoCI
         iPtN5giULRKW4eWATxCUWwpiuPise0Obh3aSF37Oxu7ITPwgKtNfGuYd2/OAd0BJxNXr
         HWzWai9+er+e4GV92YrQcHUwMA1JDW3jmdQjIG5qshu3mgeyY1iJikyMcI/z2nZdQ/CX
         kOHRN79Prw2Ja+JlHby9ZK8zsP1ILn6G9GfpVy+lQL210Rs14Wi0sClp/48LEgwrD8df
         tU6Q==
X-Gm-Message-State: AOAM53103+aFjxk6kT9hF/Ucp56ppCkyxK/vqWwnGgk98GewUJYiH/3M
        VYFqeTC+jV+WIvIzung/TkGkPg==
X-Google-Smtp-Source: ABdhPJw3ZSIgIDMmJg6t+5AaTTtXbKrEjjhWgpdZoKFVE6hNtQuYfLk7v5kBS8v05bBsyTofrz+gGg==
X-Received: by 2002:aa7:82d0:0:b0:413:5e93:2f7a with SMTP id f16-20020aa782d0000000b004135e932f7amr1328435pfn.16.1632962104083;
        Wed, 29 Sep 2021 17:35:04 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:b6b6:ed63:b801:ded7])
        by smtp.gmail.com with ESMTPSA id 23sm711648pgk.89.2021.09.29.17.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 17:35:03 -0700 (PDT)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, swboyd@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
Date:   Wed, 29 Sep 2021 17:34:56 -0700
Message-Id: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Factor out ti-sn65dsi86 edp bridge as a separate dts fragment.
This helps us introduce the second source edp bridge later.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Philip Chen <philipchen@chromium.org>
---

Changes in v2:
- Move edp_brij_i2c completely out of sc7180-trogdor.dtsi to the
  bridge dts fragment, so that we can cleanly assign different
  edp bridge in every board rev.

 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  1 +
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  1 +
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  1 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  1 +
 .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi | 90 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 86 ------------------
 6 files changed, 94 insertions(+), 86 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index a758e4d22612..1d13fba3bd2f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -11,6 +11,7 @@
 ap_h1_spi: &spi0 {};
 
 #include "sc7180-trogdor.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
 /* Deleted nodes from trogdor.dtsi */
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 00535aaa43c9..27b26a782af9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -11,6 +11,7 @@
 ap_h1_spi: &spi0 {};
 
 #include "sc7180-trogdor.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
 &ap_sar_sensor {
 	semtech,cs0-ground;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index a246dbd74cc1..e7c7cad14989 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -11,6 +11,7 @@
 ap_h1_spi: &spi0 {};
 
 #include "sc7180-trogdor.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
 / {
 	thermal-zones {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index 2b522f9e0d8f..457c25499863 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -13,6 +13,7 @@
 ap_h1_spi: &spi0 {};
 
 #include "sc7180-trogdor.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
 / {
 	model = "Google Trogdor (rev1+)";
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
new file mode 100644
index 000000000000..97d5e45abd1d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Trogdor dts fragment for the boards with TI sn65dsi86 edp bridge
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+&dsi0_out {
+	remote-endpoint = <&sn65dsi86_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+edp_brij_i2c: &i2c2 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	sn65dsi86_bridge: bridge@2d {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_brij_en>, <&edp_brij_irq>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+
+		vpll-supply = <&pp1800_edp_vpll>;
+		vccio-supply = <&pp1800_brij_vccio>;
+		vcca-supply = <&pp1200_brij>;
+		vcc-supply = <&pp1200_brij>;
+
+		clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
+		clock-names = "refclk";
+
+		no-hpd;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out: endpoint {
+					data-lanes = <0 1>;
+					remote-endpoint = <&panel_in_edp>;
+				};
+			};
+		};
+
+		aux-bus {
+			panel: panel {
+				/* Compatible will be filled in per-board */
+				power-supply = <&pp3300_dx_edp>;
+				backlight = <&backlight>;
+				hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
+				port {
+					panel_in_edp: endpoint {
+						remote-endpoint = <&sn65dsi86_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&tlmm {
+	edp_brij_irq: edp-brij-irq {
+		pinmux {
+			pins = "gpio11";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio11";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 0f2b3c00e434..702139e89a80 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -602,15 +602,6 @@ &camcc {
 &dsi0 {
 	status = "okay";
 	vdda-supply = <&vdda_mipi_dsi0_1p2>;
-
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&sn65dsi86_in>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
 };
 
 &dsi_phy {
@@ -618,70 +609,6 @@ &dsi_phy {
 	vdds-supply = <&vdda_mipi_dsi0_pll>;
 };
 
-edp_brij_i2c: &i2c2 {
-	status = "okay";
-	clock-frequency = <400000>;
-
-	sn65dsi86_bridge: bridge@2d {
-		compatible = "ti,sn65dsi86";
-		reg = <0x2d>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&edp_brij_en>, <&edp_brij_irq>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-parent = <&tlmm>;
-		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
-
-		enable-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
-
-		vpll-supply = <&pp1800_edp_vpll>;
-		vccio-supply = <&pp1800_brij_vccio>;
-		vcca-supply = <&pp1200_brij>;
-		vcc-supply = <&pp1200_brij>;
-
-		clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
-		clock-names = "refclk";
-
-		no-hpd;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				sn65dsi86_in: endpoint {
-					remote-endpoint = <&dsi0_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				sn65dsi86_out: endpoint {
-					data-lanes = <0 1>;
-					remote-endpoint = <&panel_in_edp>;
-				};
-			};
-		};
-
-		aux-bus {
-			panel: panel {
-				/* Compatible will be filled in per-board */
-				power-supply = <&pp3300_dx_edp>;
-				backlight = <&backlight>;
-				hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
-
-				port {
-					panel_in_edp: endpoint {
-						remote-endpoint = <&sn65dsi86_out>;
-					};
-				};
-			};
-		};
-	};
-};
-
 ap_sar_sensor_i2c: &i2c5 {
 	clock-frequency = <400000>;
 
@@ -1245,19 +1172,6 @@ pinconf {
 		};
 	};
 
-	edp_brij_irq: edp-brij-irq {
-		pinmux {
-			pins = "gpio11";
-			function = "gpio";
-		};
-
-		pinconf {
-			pins = "gpio11";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-	};
-
 	en_pp3300_codec: en-pp3300-codec {
 		pinmux {
 			pins = "gpio83";
-- 
2.33.0.685.g46640cef36-goog

