Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2DF620975B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 02:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388204AbgFYAIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 20:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387843AbgFYAIP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 20:08:15 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315FCC061795
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 17:08:15 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k6so1896532pll.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 17:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7XSfbaWwgfeqzjI1f2OAxr2wATpLsWrvOZYJtGKWY3Q=;
        b=Wm4xoj6yQXcpR2bgz+HwhZvEzqzZNYTzwRFfAVHsJA07D4xJtMxl/vC/T8lHhgrTIG
         a+XU67mgMTShQ8V6BnlVL2UFxBcB7Fbgf6NtYY0on6BwrQMpnvaRibIwNGGhjKqITWbB
         22vzlRxTt+v8jhMnqUIIG4pxk6Z1ZaPoQ/O8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7XSfbaWwgfeqzjI1f2OAxr2wATpLsWrvOZYJtGKWY3Q=;
        b=kJiTBlkaH8XFdEg/myJ64YSvYlI77VBQFSwcNAihmODwZU1sCy3s0k92wd8Y7nQBV/
         3xEatDvgodMO77jN0WKY1pJFDjaZ0Bvxm1wjNlUnHkJxRjF45m2Z/8FwZSndJbARc4JM
         Te2PIdnPGLq8L3IV8fwPaMKlewPj+TnKPj9wotnIiupuJ4So4SKFpHTGQilFMMwQnIrD
         RUTUp7rLkrDmQ7MR37ptiwXraq+cCfhUboJX0Y/figTJJE6fLnUtAKwGFVNweIppWw1+
         SehQVfxNnlQdMMPxTLgcYFujezUXGCb2jPa3oZEzzgYJ+I+TikE7vrFGJzJBbMstaLwV
         HxEw==
X-Gm-Message-State: AOAM532n96ryvV2e7+JPypw9VHQGZFQhTJ/ZNoLqqpoAQaTlT6mYxk71
        Lh6uNRc7dK43MwrGWCXmP9V+hg==
X-Google-Smtp-Source: ABdhPJw4S1HNkycqcrd80//h2hauSwe6nxEd0vm5+3m1sIdU1/0jbri5WoTnNkdlCqb5Wd3f1yyCGg==
X-Received: by 2002:a17:90a:7645:: with SMTP id s5mr364365pjl.50.1593043694625;
        Wed, 24 Jun 2020 17:08:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id dw17sm5905866pjb.40.2020.06.24.17.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 17:08:14 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845: Switch SPI to use GPIO for CS
Date:   Wed, 24 Jun 2020 17:08:05 -0700
Message-Id: <20200624170746.2.I0cabe4244069dd6e3ba47d522c54d4a36ff413f2@changeid>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200624170746.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
References: <20200624170746.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is like the same change for sc7180 but just for sdm845.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 113 +++++++++++++++++++++++----
 1 file changed, 97 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 8eb5a31346d2..417cf1530848 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,lpass-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sdm845.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,sdm845.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
@@ -837,6 +838,7 @@ spi0: spi@880000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi0_default>;
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -874,6 +876,7 @@ spi1: spi@884000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi1_default>;
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -911,6 +914,7 @@ spi2: spi@888000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi2_default>;
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -948,6 +952,7 @@ spi3: spi@88c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi3_default>;
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -985,6 +990,7 @@ spi4: spi@890000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi4_default>;
 				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1022,6 +1028,7 @@ spi5: spi@894000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi5_default>;
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 88 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1059,6 +1066,7 @@ spi6: spi@898000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi6_default>;
 				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1096,6 +1104,7 @@ spi7: spi@89c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi7_default>;
 				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1145,6 +1154,7 @@ spi8: spi@a80000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi8_default>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 68 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1182,6 +1192,7 @@ spi9: spi@a84000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi9_default>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1219,6 +1230,7 @@ spi10: spi@a88000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi10_default>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1256,6 +1268,7 @@ spi11: spi@a8c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi11_default>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1293,6 +1306,7 @@ spi12: spi@a90000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi12_default>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1330,6 +1344,7 @@ spi13: spi@a94000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi13_default>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1367,6 +1382,7 @@ spi14: spi@a98000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi14_default>;
 				interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1404,6 +1420,7 @@ spi15: spi@a9c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_spi15_default>;
 				interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -2002,129 +2019,193 @@ pinmux {
 			qup_spi0_default: qup-spi0-default {
 				pinmux {
 					pins = "gpio0", "gpio1",
-					       "gpio2", "gpio3";
+					       "gpio2";
 					function = "qup0";
 				};
+				pinmux-cs {
+					pins = "gpio3";
+					function = "gpio";
+				};
 			};
 
 			qup_spi1_default: qup-spi1-default {
 				pinmux {
 					pins = "gpio17", "gpio18",
-					       "gpio19", "gpio20";
+					       "gpio19";
 					function = "qup1";
 				};
+				pinmux-cs {
+					pins = "gpio20";
+					function = "gpio";
+				};
 			};
 
 			qup_spi2_default: qup-spi2-default {
 				pinmux {
 					pins = "gpio27", "gpio28",
-					       "gpio29", "gpio30";
+					       "gpio29";
 					function = "qup2";
 				};
+				pinmux-cs {
+					pins = "gpio30";
+					function = "gpio";
+				};
 			};
 
 			qup_spi3_default: qup-spi3-default {
 				pinmux {
 					pins = "gpio41", "gpio42",
-					       "gpio43", "gpio44";
+					       "gpio43";
 					function = "qup3";
 				};
+				pinmux-cs {
+					pins = "gpio44";
+					function = "gpio";
+				};
 			};
 
 			qup_spi4_default: qup-spi4-default {
 				pinmux {
 					pins = "gpio89", "gpio90",
-					       "gpio91", "gpio92";
+					       "gpio91";
 					function = "qup4";
 				};
+				pinmux-cs {
+					pins = "gpio92";
+					function = "gpio";
+				};
 			};
 
 			qup_spi5_default: qup-spi5-default {
 				pinmux {
 					pins = "gpio85", "gpio86",
-					       "gpio87", "gpio88";
+					       "gpio87";
 					function = "qup5";
 				};
+				pinmux-cs {
+					pins = "gpio88";
+					function = "gpio";
+				};
 			};
 
 			qup_spi6_default: qup-spi6-default {
 				pinmux {
 					pins = "gpio45", "gpio46",
-					       "gpio47", "gpio48";
+					       "gpio47";
 					function = "qup6";
 				};
+				pinmux-cs {
+					pins = "gpio48";
+					function = "gpio";
+				};
 			};
 
 			qup_spi7_default: qup-spi7-default {
 				pinmux {
 					pins = "gpio93", "gpio94",
-					       "gpio95", "gpio96";
+					       "gpio95";
 					function = "qup7";
 				};
+				pinmux-cs {
+					pins = "gpio96";
+					function = "gpio";
+				};
 			};
 
 			qup_spi8_default: qup-spi8-default {
 				pinmux {
 					pins = "gpio65", "gpio66",
-					       "gpio67", "gpio68";
+					       "gpio67";
 					function = "qup8";
 				};
+				pinmux-cs {
+					pins = "gpio68";
+					function = "gpio";
+				};
 			};
 
 			qup_spi9_default: qup-spi9-default {
 				pinmux {
 					pins = "gpio6", "gpio7",
-					       "gpio4", "gpio5";
+					       "gpio4";
 					function = "qup9";
 				};
+				pinmux-cs {
+					pins = "gpio5";
+					function = "gpio";
+				};
 			};
 
 			qup_spi10_default: qup-spi10-default {
 				pinmux {
 					pins = "gpio55", "gpio56",
-					       "gpio53", "gpio54";
+					       "gpio53";
 					function = "qup10";
 				};
+				pinmux-cs {
+					pins = "gpio54";
+					function = "gpio";
+				};
 			};
 
 			qup_spi11_default: qup-spi11-default {
 				pinmux {
 					pins = "gpio31", "gpio32",
-					       "gpio33", "gpio34";
+					       "gpio33";
 					function = "qup11";
 				};
+				pinmux-cs {
+					pins = "gpio34";
+					function = "gpio";
+				};
 			};
 
 			qup_spi12_default: qup-spi12-default {
 				pinmux {
 					pins = "gpio49", "gpio50",
-					       "gpio51", "gpio52";
+					       "gpio51";
 					function = "qup12";
 				};
+				pinmux-cs {
+					pins = "gpio52";
+					function = "gpio";
+				};
 			};
 
 			qup_spi13_default: qup-spi13-default {
 				pinmux {
 					pins = "gpio105", "gpio106",
-					       "gpio107", "gpio108";
+					       "gpio107";
 					function = "qup13";
 				};
+				pinmux-cs {
+					pins = "gpio108";
+					function = "gpio";
+				};
 			};
 
 			qup_spi14_default: qup-spi14-default {
 				pinmux {
 					pins = "gpio33", "gpio34",
-					       "gpio31", "gpio32";
+					       "gpio31";
 					function = "qup14";
 				};
+				pinmux-cs {
+					pins = "gpio32";
+					function = "gpio";
+				};
 			};
 
 			qup_spi15_default: qup-spi15-default {
 				pinmux {
 					pins = "gpio81", "gpio82",
-					       "gpio83", "gpio84";
+					       "gpio83";
 					function = "qup15";
 				};
+				pinmux-cs {
+					pins = "gpio84";
+					function = "gpio";
+				};
 			};
 
 			qup_uart0_default: qup-uart0-default {
-- 
2.27.0.212.ge8ba1cc988-goog

