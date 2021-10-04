Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C354421850
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235984AbhJDUXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:23:53 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:9000 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235457AbhJDUXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633378912;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ea+Sy+mMXz74lRddtGM5fpGU44ERmjDH2rPdXRR4quU=;
    b=W8qn4Q0EyDg8OJa1LBVIsCFsMtKm+SPS70fiRed9tXensM0iF1gO/Jo0GzUAruEqfY
    xzu8GVgN37TO1IfnlJNaXfvuwPgGn1WCvjXmxvQGfhLMoM6RekEMn8AElxSxgY/6WRMM
    gWoot1ZRBtK0FhILSyDP9N+jGZkK4vzw+1CD6Ne+BE6knbDCjNYrTGaplrsaYh+GJhZb
    yUOU6LlWyIt/aLzw6fcmYfAzesQL39U7hGlh1xGNz5VVjDgmXLavyUpkVBNUc+4jxVOl
    Y+XkPNsUuvrVC0cGcZnj708YDdf0QY+/NfRgTbunJ2MDhiyAHwVEtHEAcxz50vFxxbHT
    RsLg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KLpKQp
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:21:51 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 05/15] arm64: dts: qcom: msm8916-samsung-serranove: Add rt5033 battery
Date:   Mon,  4 Oct 2021 22:19:11 +0200
Message-Id: <20211004201921.18526-6-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Like the Samsung Galaxy A3/A5, the S4 Mini VE uses a Richtek RT5033 PMIC
as battery fuel gauge, charger, flash LED and for some regulators.
For now, only add the fuel gauge/battery device to the device tree,
so we can check the remaining battery percentage.

The other RT5033 drivers need some more work first before
they can be used properly.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: None.
---
 .../dts/qcom/msm8916-samsung-serranove.dts    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 2280b2e4b09f..3ef00bdc043e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -185,6 +185,21 @@ imu@6b {
 	};
 };
 
+&blsp_i2c4 {
+	status = "okay";
+
+	battery@35 {
+		compatible = "richtek,rt5033-battery";
+		reg = <0x35>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <121 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&fg_alert_default>;
+	};
+};
+
 &blsp_i2c5 {
 	status = "okay";
 
@@ -371,6 +386,14 @@ l18 {
 };
 
 &msmgpio {
+	fg_alert_default: fg-alert-default {
+		pins = "gpio121";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	gpio_keys_default: gpio-keys-default {
 		pins = "gpio107", "gpio109";
 		function = "gpio";
-- 
2.33.0

