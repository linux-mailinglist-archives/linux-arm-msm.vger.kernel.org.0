Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575414270DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 20:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhJHSli (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 14:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbhJHSlh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 14:41:37 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA0FC061755
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 11:39:41 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id s75so3926516pgs.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 11:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJNdGTBwXZ+LN9B42onlGcN2EicOF3EOkHxsaCd3Cio=;
        b=V1PoL5JMm4PcdNfglaxWqss9b7QKO5Xik58VHC/0q3tR0VExlv3aIffL5zYXdoiUCM
         Ha84+9tETtWxKPtP5QEVslRPZdg47YguxWkMc2QfHe6uN7x2wB5xfhfh4O7WMPzeSWiM
         2mia6jagXwM0DiKxdDOTsKy8savQSoopodX7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJNdGTBwXZ+LN9B42onlGcN2EicOF3EOkHxsaCd3Cio=;
        b=0le8Z7QgLp4mhKaBkDiJrpJtFpoJTzdDUI+SxX6A9f6Nj7rOLPYIs06emqFPqCvicK
         4KeMuUyACJNfK37o9KudpUtfVdinZXc008Mg0GmRFJ6r1GR2xK1Bre1Vc5wYiGAI5lsk
         moBbi1CDDcMzgKqjKWj9zrcY5YEqM+kXBz3obPX99izHVp2f0oai3usf4rcstDnlH/Lm
         Ic24jeAOlRqbieFXyWqYbkxiFvEr7o1E8NlBMwsKvPsQO/Gz6EctBWUatyt5ADuOSKLZ
         b2X8EFl0y8Z72q2gAdLOfARlOM+fmgv7WozLTOwJrJ8I2sIqjJykR/jULwKduPE8eBOR
         g4Ig==
X-Gm-Message-State: AOAM530ZEhb7xhiMwRCEId8dJD+oa7KqCXWhQBt/4UuWoIhkuSdKUAuy
        E1MsL533xGeFIl3i6MKNashryw==
X-Google-Smtp-Source: ABdhPJw/czrPl9znR9FAYUlUBe9muxJvz3tOwizzB3dXlgzVfrdru3pp02N2hXpIctMA/NrzEyN2XA==
X-Received: by 2002:a62:d11e:0:b0:446:d705:7175 with SMTP id z30-20020a62d11e000000b00446d7057175mr11846768pfg.74.1633718381184;
        Fri, 08 Oct 2021 11:39:41 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:d589:5290:5a04:2c2b])
        by smtp.gmail.com with ESMTPSA id i123sm71695pfg.157.2021.10.08.11.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 11:39:40 -0700 (PDT)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     swboyd@chromium.org, dianders@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
Date:   Fri,  8 Oct 2021 11:39:34 -0700
Message-Id: <20211008113839.v3.1.Ibada67e75d2982157e64164f1d11715d46cdc42c@changeid>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Factor out ti-sn65dsi86 edp bridge as a separate dts fragment.
This helps us introduce the second source edp bridge later.

Signed-off-by: Philip Chen <philipchen@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---

Changes in v3:
- Include the bridge dts fragment for homestar

 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  1 +
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  1 +
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  1 +
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  1 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  1 +
 .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi | 90 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 86 ------------------
 7 files changed, 95 insertions(+), 86 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 81098aa9687b..14ed09f30a73 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -11,6 +11,7 @@
 ap_h1_spi: &spi0 {};
 
 #include "sc7180-trogdor.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
 /* Deleted nodes from trogdor.dtsi */
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index 382f8c6f1576..4ab890b2a1d4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -11,6 +11,7 @@
 ap_h1_spi: &spi0 {};
 
 #include "sc7180-trogdor.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
 / {
 	/* BOARD-SPECIFIC TOP LEVEL NODES */
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 86c9e750995f..8b79fbb75756 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -11,6 +11,7 @@
 ap_h1_spi: &spi0 {};
 
 #include "sc7180-trogdor.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
 &ap_sar_sensor {
 	semtech,cs0-ground;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index b7b5264888b7..e90f99ef5323 100644
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
index 4d1561959f37..d4f4441179fc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -601,15 +601,6 @@ &camcc {
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
@@ -617,70 +608,6 @@ &dsi_phy {
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
 
@@ -1233,19 +1160,6 @@ pinconf {
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
2.33.0.882.g93a45727a2-goog

