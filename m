Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E30D39BEDB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 19:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhFDRdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 13:33:37 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:12010 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhFDRdh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 13:33:37 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622827905; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Y6BFJ4MvxaUHoxYlzpeoERJQZ4gvXaw/DRXBd6dzbULtBrS9g9sNOLnL5hUfcwYX5l
    nRqecFw3Noe5mazFlITDZcWt6EBWwC3xdhr0ScFQggR37gjuzpKXzB5i7UHszr1IcbPU
    T8Tr1O0Rcvw3fAhUUkGonLOzb4hYKQBvs6aC8Xox6slj+w/2WY8R31dOWCoK8RtiujHW
    yAgKLTSYQw65ggtoFycbhZfZFikza7GvgyNx2VL8ee8joFzCtkVbgVEj8RRVrP04DiLu
    T1E4kWPzYetG+YIC4qzamxzzZEImNZ8ki1X1ss5BtqO5TtnjOOxC8jInlLH8bgVX8e0j
    XAPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622827905;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Hq+OcJNPH3Xp/X5vzez5iIg0BPMu6yTiJFYPPwTrivw=;
    b=mu+sbMu1MytdpnEjbgb548kW4XbBSqv7VP6Ky7FzMCethty/tApkXf0ZK2Hg1VXQ8m
    n2F7feXGwN6/Qa6b9yKWfU4k1RLR2nJfAekr9Z+kpwK/Hmi+Vvc9GkDkZSp931Lb0aCC
    lasZ07/ssKt25XEu0y5cEJI2KF951a/lML7xmzW3FqE/3VJfU5VAPWQBWq/4S/Bk14TW
    yNHFzIW2C0ipvQnkNOtrs9hHN+nU43WJ8jMiaWtRM8dNMy2p0THnGRPx62wTWmOOM+fe
    lmcc/+R26ZOUspzNnZd2PW7SM1qzBLVxouG3Fh15j0dKTrpOoMfcAWeJIxMJ4sdzWVJ6
    UbIA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622827905;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Hq+OcJNPH3Xp/X5vzez5iIg0BPMu6yTiJFYPPwTrivw=;
    b=JjjitCN1uG5DgGMzcWOKwCWgpVWqtFmaMBBrUM+oJcZym+pxgNcnwptmAeP31dYtLG
    zCe568HUWXrWtVijZWYCyRGbnMOr4d1Nld1fmfAEB9/lwb9v0PPvccvBA6VYdjsdaxBR
    3Yj8D6gNKr47SoxFp9sHNKagyiKcEtlp8W15FaQdLlRWKHmcJaBofDGIQiVNfgi1BVbo
    qfPXBhuivGdGJbYSU9UiXDBPAyxCjTEMk4c8dF/uK0C+SS48Mto6PiVAq7d0KbWAkXH7
    pM1jA/JJOf1hjFGQW9s1g5sY61mkwYWBx34R52XwaZPbAoXTI2zwQZxqj8716HLV/5Df
    +KSg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6Pvxo="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id y01375x54HViH5Z
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 4 Jun 2021 19:31:44 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/5] arm64: dts: qcom: msm8916-samsung-a5u: Add touch key regulator
Date:   Fri,  4 Jun 2021 19:27:40 +0200
Message-Id: <20210604172742.10593-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604172742.10593-1-stephan@gerhold.net>
References: <20210604172742.10593-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the Samsung Galaxy A5 the touch key is supplied by a single fixed
regulator (enabled via GPIO 97) that supplies both MCU and LED.
Add it to the device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index dd35c3344358..c2eff5aebf85 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -7,6 +7,19 @@
 / {
 	model = "Samsung Galaxy A5U (EUR)";
 	compatible = "samsung,a5u-eur", "qcom,msm8916";
+
+	reg_touch_key: regulator-touch-key {
+		compatible = "regulator-fixed";
+		regulator-name = "touch_key";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&msmgpio 97 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tkey_en_default>;
+	};
 };
 
 &accelerometer {
@@ -42,7 +55,20 @@ iris {
 	};
 };
 
+&touchkey {
+	vcc-supply = <&reg_touch_key>;
+	vdd-supply = <&reg_touch_key>;
+};
+
 &msmgpio {
+	tkey_en_default: tkey-en-default {
+		pins = "gpio97";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	ts_int_default: ts-int-default {
 		pins = "gpio13";
 		function = "gpio";
-- 
2.31.1

