Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215793807AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 12:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbhENKsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 06:48:15 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:10184 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbhENKsO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 06:48:14 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620989044; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=IsMmOO+CnuSck2fLgyQqlRaJlpzJzaBiGrMdeZRvF30GBKd0Kyf9pFAcuzq3rDK2aP
    Gku6esbktEyd7J0ocdaTSeOZ5jtXd+tWRBPgNT1Rt4a0TdSSos9tAKmyg1FPdfcVzwc9
    hNCQ2y6yKPc5ajb0cOvZ+1mHkMpjaFaAJBG2SZ9Nz5kwAx0vupZMloG8tzCZQbLQ/ut8
    VfItwxe7kVQOroUhu7l2Bz+NUzjjrLC8jXEOYpx8b9pc+rYpi8/tE+qVlFjuUtm+DYVC
    rPTzUWWyguUoN9VpvWQVPO5DheFjID3VMS1aBQdP14tZ1SfVJl4LJ4wbbRHfoF+fgcim
    8QkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620989044;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pOMxRVCSZeL7WA4kcc0Aa8Hx9q+zfPbiWCDXBlUaSss=;
    b=cZMSGnRuzOh8FJ4Buze3SH6EoHEniFzJ5ODHXWI2x4X7q2kbNPYrjgXTsK8gq0/bDN
    2Rn0NrL/lesBIzjRe8ar6jrSmcs5305o3vKa/FNSNOuOyqw25nvVvybdz/ZtbQE1sf0h
    41lnOAsbd5vAXBqR49A2h1B4FvrBgAacAQqaDHb40I+nmdPiMhn6fy6ku/3omc3YGxWl
    7KP/KZCIYI2h9O7x92a5q+J32mzKa6GjFUgYYn//dROpzDbMFzplF0vrDsdvFKUvrqlC
    +VsicNLfBVGePTi66f+ttQi03cF+BsjfK5VNYzsdauLJ8YdTeM0wDbVrpg4J8WmooVap
    6TyA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620989044;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pOMxRVCSZeL7WA4kcc0Aa8Hx9q+zfPbiWCDXBlUaSss=;
    b=RucXJ4kmsKnI5AsSM3FweyelRnctk/xBRP43rWdx7vnZvz+dTjxJ5tudz2lfLcB5Kh
    +sGXw+vPFf/+M+P6jJ4ZEiSPm/DxcTBQRKOc2ou8IJlKUA1QWrFtzhy8aUDDWhqoUvGK
    FGb63bcvopwl1ktAEH3sWYW+hDND6NQ1F9KU6jkE/rBKO1Z4L4Yq2Jn4qcGib3dh1LHy
    FlsIn7iKX91c8xLEkEE3CteDf+LLBBiMjEyJAf/58Gs6iij/ykd9aNnXXf2a4yaMjqac
    puUCjwVSdAKDuAIRjQiuvSjoykEDm6b/lCuS5ZD7CgE8eau5euSnwRYL4qlwUR34yWaM
    RNGw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6OWA=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.25.7 SBL|AUTH)
    with ESMTPSA id j06c13x4EAi3Fyl
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 14 May 2021 12:44:03 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/5] arm64: dts: qcom: msm8916-huawei-g7: Add touchscreen
Date:   Fri, 14 May 2021 12:43:25 +0200
Message-Id: <20210514104328.18756-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514104328.18756-1-stephan@gerhold.net>
References: <20210514104328.18756-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Huawei Ascend G7 has a Synaptics "C199HW-006" touchscreen,
supplied by pm8916_l17 and pm8916_l16. Add it to the device tree
and reduce the maximum allowed voltage for pm8916_l16 to 1.8V since
we really should not use more for an I/O supply.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index d67aa7dd4a21..f928179f9ded 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -6,6 +6,7 @@
 #include "msm8916-pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
 
 /*
@@ -84,6 +85,38 @@ usb_id: usb-id {
 	};
 };
 
+&blsp_i2c5 {
+	status = "okay";
+
+	rmi4@70 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+
+		vdd-supply = <&pm8916_l17>;
+		vio-supply = <&pm8916_l16>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_irq_default>;
+
+		syna,startup-delay-ms = <100>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>; /* Allow sleeping */
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>; /* Touchscreen */
+		};
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
@@ -230,7 +263,7 @@ l15 {
 
 	l16 {
 		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
+		regulator-max-microvolt = <1800000>;
 	};
 
 	l17 {
@@ -269,6 +302,14 @@ sdhc2_cd_default: sdhc2-cd-default {
 		bias-disable;
 	};
 
+	ts_irq_default: ts-irq-default {
+		pins = "gpio13";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	usb_id_default: usb-id-default {
 		pins = "gpio117";
 		function = "gpio";
-- 
2.31.1

