Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800E241ADE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 13:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240366AbhI1Lfj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 07:35:39 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:14484 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240362AbhI1Lfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 07:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632828656;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7Z8MXWATCj/szKuUfPihFzKr7i2SIYu+UOVqTyNAk24=;
    b=lPXA93sdw81DcHCbEmP+N9elCplnPE+bkr+mPJsOGUkWNkc1lIq48yXftSWZsjNoqY
    hMqKVAa00NfTBHCSaNNzmatJway4Y6tHEMh8gI+9DZJR+aEAyCQhbRDZEP5QmRARljqp
    UXz2VHeKRx99JXsZDd6Ku29k1/qrjItZl8YMhdz1JgQ+uQj4oCnA35K7IJ3oAQx8pnZK
    Q/HdTns1L+si7DRDbxLHTMwYa+dlS2P/tt9WjTUd2b4G21MxYJx996gQg9r+nMcjnJGk
    ifPMMNV8rxpCpcqvTqMmufkSA3goTzXkk1sqKd1/A3pYn5V6GCQCysQtAba3sCJWOun4
    +sMw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SBUukIt
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 13:30:56 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916-longcheer-l8150: Use &pm8916_usbin extcon
Date:   Tue, 28 Sep 2021 13:29:45 +0200
Message-Id: <20210928112945.25310-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928112945.25310-1-stephan@gerhold.net>
References: <20210928112945.25310-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At the moment, longcheer-l8150 is using a dummy extcon-usb-gpio device
that permanently enables USB gadget mode. This workaround allows USB
to work but is actually wrong and confusing. The "vbus-gpio" used there
refers to an unused (floating) GPIO that is pulled up to make
extcon-usb-gpio report USB gadget mode permanently.

Replace this with the new &pm8916_usbin extcon device that actually
reports if an USB cable is attached or not. This allows the USB PHY
to be turned off when there is no USB cable attached and is much
cleaner overall.

Fixes: 16e8e8072108 ("arm64: dts: qcom: Add device tree for Longcheer L8150")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 23 +++++--------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 30716eb8fb2d..285102f0e04f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -30,14 +30,6 @@ wcnss_mem: wcnss@8b600000 {
 		};
 	};
 
-	// FIXME: Use extcon device provided by charger driver when available
-	usb_vbus: usb-vbus {
-		compatible = "linux,extcon-usb-gpio";
-		vbus-gpio = <&msmgpio 62 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&usb_vbus_default>;
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -215,6 +207,10 @@ &pm8916_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
+&pm8916_usbin {
+	status = "okay";
+};
+
 &pm8916_vib {
 	status = "okay";
 };
@@ -244,11 +240,11 @@ &sdhc_2 {
 &usb {
 	status = "okay";
 	dr_mode = "peripheral";
-	extcon = <&usb_vbus>;
+	extcon = <&pm8916_usbin>;
 };
 
 &usb_hs_phy {
-	extcon = <&usb_vbus>;
+	extcon = <&pm8916_usbin>;
 };
 
 &smd_rpm_regulators {
@@ -410,11 +406,4 @@ tp_int_default: tp-int-default {
 		drive-strength = <2>;
 		bias-disable;
 	};
-
-	usb_vbus_default: usb-vbus-default {
-		pins = "gpio62";
-		function = "gpio";
-
-		bias-pull-up;
-	};
 };
-- 
2.33.0

