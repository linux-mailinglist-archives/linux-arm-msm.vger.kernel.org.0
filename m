Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130A142184F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235457AbhJDUXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:23:53 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:32147 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235912AbhJDUXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633378910;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=WQV09xQCK1UOz8+9tdtIDws8tuH6z91IIAgUbsJrzcg=;
    b=U36Tf8rq6yB/Ovp7rgI9akxRjOXsb8Qm9f96F7uFuNk7p4rrD68tYj3w4nbhViWk1d
    ri7pb5Ol1IhydzgQRSrudKUM49T//m7qLi7BYibtbQ6ccR0VruEQE5ilkL+2ir7dRIUA
    saonoVTq7RYCv6f9Syp5E7JF/QgcLhTt0f6L7HUY5BNI2sUCv0VO8/BVR/tCOVkcrZIO
    4GTJ2Iw2MdhHtP1ABOVRumg8uvkkEuUxqeuquRHfJ3QyXcD64MNiSM26dgGGFLtkOA72
    T1rDQ+BGo4+ApUzyNxI4b2UB/fR3SIdUeeBjplo+zlo3lqv+GmIisM2LLfTBj0Cv7Si0
    MmeQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KLoKQm
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:21:50 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 02/15] arm64: dts: qcom: msm8916-samsung-serranove: Add touch screen
Date:   Mon,  4 Oct 2021 22:19:08 +0200
Message-Id: <20211004201921.18526-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Like msm8916-samsung-a3u-eur, the S4 Mini VE uses a Zinitix BT541
touch screen. Add it together with the necessary fixed-regulator
to the device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: None.
---
 .../dts/qcom/msm8916-samsung-serranove.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 013f843aff9c..aa1326e5d4cb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -78,6 +78,19 @@ hall-sensor {
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
@@ -102,6 +115,27 @@ muic: extcon@14 {
 	};
 };
 
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@20 {
+		compatible = "zinitix,bt541";
+		reg = <0x20>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+
+		touchscreen-size-x = <540>;
+		touchscreen-size-y = <960>;
+
+		vdd-supply = <&reg_vdd_tsp>;
+		vddo-supply = <&pm8916_l6>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tsp_irq_default>;
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
@@ -298,4 +332,20 @@ muic_irq_default: muic-irq-default {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	tsp_en_default: tsp-en-default {
+		pins = "gpio73";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tsp_irq_default: tsp-irq-default {
+		pins = "gpio13";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
-- 
2.33.0

