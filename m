Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAD744D04C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 04:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbhKKDUb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 22:20:31 -0500
Received: from mx1.riseup.net ([198.252.153.129]:59000 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232799AbhKKDU3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 22:20:29 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HqRjc3kWrzF4mW;
        Wed, 10 Nov 2021 19:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636600660; bh=MpgI30sbqsmhgOb2wAZVGaCamJzY5tWBYSozOdcFyHU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q1dnxi+IF+h8zmwikRMnXLbOjEBm332iU1P5UMuiquVf4cEgWtsw0hwiZ9vCjXrWN
         XnVcsGXVZVoQbmT05N3BGCZc0qr/49wfr3kQprgw+uUfeYU/A16oz3YJrWsucGk5fe
         +/Zfv0f/GNb+7DrnetEbi3r8G7hSsx9OLlP9LvUk=
X-Riseup-User-ID: 6DC39C03D19EEADB7351C8E3E54ED413D0D0D00C907110C227F46FB53441DC24
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HqRjY2x7Zz5vVT;
        Wed, 10 Nov 2021 19:17:37 -0800 (PST)
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
Subject: [PATCH v3 5/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
Date:   Thu, 11 Nov 2021 10:16:32 +0700
Message-Id: <20211111031635.3839947-6-danct12@riseup.net>
In-Reply-To: <20211111031635.3839947-1-danct12@riseup.net>
References: <20211111031635.3839947-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the volume up key.

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
Reviewed-by: Martin Botka <martin.botka@somainline.org>
Reviewed-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 729b71407c36..456562cb6028 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -9,6 +9,9 @@
 #include "sdm660.dtsi"
 #include "pm660.dtsi"
 #include "pm660l.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/gpio-keys.h>
 
 / {
 	model = "Xiaomi Redmi Note 7";
@@ -33,6 +36,18 @@ vph_pwr: vph-pwr-regulator {
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

