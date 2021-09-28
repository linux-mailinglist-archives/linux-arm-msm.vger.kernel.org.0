Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD08D41B4ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242022AbhI1RXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:23:19 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:32774 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241998AbhI1RXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849687;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=A31zal12Ktk/Z33oNiiBVZbgIbmCKDXhW8R1vz9+q2A=;
    b=KGCqzoNaz57uwXgNplmg2rrNsT1K4LMSJAu+Bw+sUU8GMadjZyju0VsGpyQ2FYaQtF
    4Mv25ASXC6NkSryK/9Db1VCnDluqEJXm2yn9ouBOr9t1h3+sIsMM5PoeMmdH5Tb/8SMh
    aFTNcuZ78S3fHcI1MMWNz0RmTAQhXAt+VTQ3GZGmSKlilRZe6Ug15I3pCnl+shuaj1BK
    dM2Tyrb/AIeriofEZMOuffxkfek0sgtbGpRpYaqKDcCQEKb8lmroChVmDKa5FsnB9emu
    rki/QPx41gvPgt7yAOw0gSml6Cq7nKHWETlGidKrIhDHxaA/EoikANJJ4wS0zoe1xIyd
    43Dg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLRoBI
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:27 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 02/15] arm64: dts: qcom: msm8916-samsung-serranove: Add touch screen
Date:   Tue, 28 Sep 2021 19:12:18 +0200
Message-Id: <20210928171231.12766-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
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
 .../dts/qcom/msm8916-samsung-serranove.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 33613cbb4929..214a863eedbf 100644
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

