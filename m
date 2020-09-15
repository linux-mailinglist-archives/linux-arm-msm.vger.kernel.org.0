Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0172269F6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgIOHNn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:43 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:31588 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgIOHNj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153986;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=4jijqIXDiWkDuomTMK4y2W7evlXq1vH3ca2xVrrVbTA=;
        b=en/gbAEWsi1EAztyXLjOAwPK7SWbYFj1XOTFY628GS00EcLYZ1pcpeY7fQQRu9Hk+i
        Y1/VltQFlqu7PB3j9cahhsJ5FtZ9TdpbXo1pQsASiNylIDDDkBSlWBzJhy0xcuDhDcmE
        L3+HwfygDmv/U3Kvjfd1QkNyDRr5y4MugHosG3MNk5dejgK+p25Tqg1hB7KO9aoS8gEo
        7Vu+5u9wGQRgk8RcJalwN12hymAOa5k0xYqm4l2ZptzQ+Uy2SwZ95kSOnNBXTDEoc2Sk
        n64ScVTntkK1B6eX1VaT09EPmvzluwg+QU13siy+bKT+EYheT2IklQ1VuS/BCIGAUh9m
        melQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7D4re1
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:13:04 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 13/14] arm64: dts: qcom: pm8916: Sort nodes
Date:   Tue, 15 Sep 2020 09:12:20 +0200
Message-Id: <20200915071221.72895-14-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sort nodes by unit address so we have a consistent order in pm8916.dtsi.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi | 60 ++++++++++++++--------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index c7b22ac81452..f931cb0de231 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
-#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
 &spmi_bus {
@@ -12,13 +12,6 @@ pm8916_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		rtc@6000 {
-			compatible = "qcom,pm8941-rtc";
-			reg = <0x6000>;
-			reg-names = "rtc", "alarm";
-			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
-		};
-
 		pon@800 {
 			compatible = "qcom,pm8916-pon";
 			reg = <0x800>;
@@ -48,28 +41,6 @@ watchdog {
 			};
 		};
 
-		pm8916_gpios: gpios@c000 {
-			compatible = "qcom,pm8916-gpio";
-			reg = <0xc000>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
-				     <0 0xc1 0 IRQ_TYPE_NONE>,
-				     <0 0xc2 0 IRQ_TYPE_NONE>,
-				     <0 0xc3 0 IRQ_TYPE_NONE>;
-		};
-
-		pm8916_mpps: mpps@a000 {
-			compatible = "qcom,pm8916-mpp";
-			reg = <0xa000>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
-				     <0 0xa1 0 IRQ_TYPE_NONE>,
-				     <0 0xa2 0 IRQ_TYPE_NONE>,
-				     <0 0xa3 0 IRQ_TYPE_NONE>;
-		};
-
 		pm8916_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
@@ -111,6 +82,35 @@ adc-chan@f {
 				reg = <VADC_VDD_VADC>;
 			};
 		};
+
+		rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pm8916_mpps: mpps@a000 {
+			compatible = "qcom,pm8916-mpp";
+			reg = <0xa000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
+				     <0 0xa1 0 IRQ_TYPE_NONE>,
+				     <0 0xa2 0 IRQ_TYPE_NONE>,
+				     <0 0xa3 0 IRQ_TYPE_NONE>;
+		};
+
+		pm8916_gpios: gpios@c000 {
+			compatible = "qcom,pm8916-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
+				     <0 0xc1 0 IRQ_TYPE_NONE>,
+				     <0 0xc2 0 IRQ_TYPE_NONE>,
+				     <0 0xc3 0 IRQ_TYPE_NONE>;
+		};
 	};
 
 	pm8916_1: pmic@1 {
-- 
2.28.0

