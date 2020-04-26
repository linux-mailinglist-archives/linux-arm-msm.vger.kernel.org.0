Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E551B90C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2020 16:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgDZOId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Apr 2020 10:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgDZOIc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Apr 2020 10:08:32 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27008C09B053;
        Sun, 26 Apr 2020 07:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587910110;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=jcdI1GCqmlTQ2XhZ9zCkAzlSz2grGdQX6g0Xsqpa9Xo=;
        b=Bm8ZEXPiUws/3XCrP5L8bI3MtWV1BPowo0REUys2AHU5B49HpBXFeHh+cfA9EDYtaf
        zGhNDUxILinqelNTX4z3BgZWiJItwdj3cRRqeC1AjQPHUgKd7l8XsA4AxITK9HsW3WNG
        3qoFX6kidbfVoIo93fgIi5+IC6yOUqO1/RQzTBb80KRS8jU2VJ6FFKRwHWhOhEFwQHks
        afGhdvUm+B0HG2ILBWc1zBUAGD905t3mA+ss1g6QZwCjFQTZ1hCZ33v8hrYFz6U10TDk
        eGXbvAWxWetveAKfOoTTIUbZaE4wWvmhm8s+S6pW8KaoH4fu/UxOCwAl6+r+iAFLCBn8
        6gZg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6Nf3AC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw3QE8QNFM
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 26 Apr 2020 16:08:26 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH 3/4] arm64: dts: qcom: msm8916-samsung-a2015: Add touchscreen regulator
Date:   Sun, 26 Apr 2020 16:06:41 +0200
Message-Id: <20200426140642.204395-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200426140642.204395-1-stephan@gerhold.net>
References: <20200426140642.204395-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A3U and A5U both use an extra touchscreen LDO regulator
that provides 3.3V for the touch screen controller.

Add it as fixed regulator to the common include.

Cc: Michael Srba <Michael.Srba@seznam.cz>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 43c5e0f882f1..67a286422a13 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -138,6 +138,19 @@ hall-sensor {
 		};
 	};
 
+	reg_vdd_tsp: regulator-vdd-tsp {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_tsp";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&msmgpio 73 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tsp_en_default>;
+	};
+
 	i2c-muic {
 		compatible = "i2c-gpio";
 		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -195,6 +208,18 @@ pinconf {
 			bias-disable;
 		};
 	};
+
+	tsp_en_default: tsp_en_default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio73";
+		};
+		pinconf {
+			pins = "gpio73";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
 
 &smd_rpm_regulators {
-- 
2.26.2

