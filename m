Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A91458090
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236814AbhKTVqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:46:09 -0500
Received: from mx1.riseup.net ([198.252.153.129]:33408 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236781AbhKTVqH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:46:07 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HxRpv1lfzzF3Ks;
        Sat, 20 Nov 2021 13:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1637444583; bh=x/ea+/oxu/oKF7WVlF+RpqT7RNryIx5u1m6NAWeE1Ko=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZKwxxUwbEAHqb2WvhsVRHp1TIZKnzmeKeKBskMlyUTO9JGjwmTKzRtqfcimEID++f
         7IMReFe+WiEAe4zssToTPuh1l6lFPZqwJezw6BcD58Hk0Zi3WLLPErgGuvQ/sfXGUD
         I6zkHOwCbS8gBT75PFDJIAqohvHZ/ELOjCYIgirQ=
X-Riseup-User-ID: DCC6C7003F831291F09D12CCE2E7B376B5EDB4259107D324F490128294E4F222
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HxRpr0q3wz5vkF;
        Sat, 20 Nov 2021 13:42:59 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: [PATCH v4 5/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
Date:   Sun, 21 Nov 2021 04:42:24 +0700
Message-Id: <20211120214227.779742-6-danct12@riseup.net>
In-Reply-To: <20211120214227.779742-1-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the volume up key.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 9a6684922804..c7bdf4c28be4 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -9,6 +9,8 @@
 #include "sdm660.dtsi"
 #include "pm660.dtsi"
 #include "pm660l.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/gpio-keys.h>
 
 / {
 	model = "Xiaomi Redmi Note 7";
@@ -33,6 +35,18 @@ vph_pwr: vph-pwr-regulator {
 		regulator-boot-on;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+
+		volup {
+			label = "Volume Up";
+			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.33.1

