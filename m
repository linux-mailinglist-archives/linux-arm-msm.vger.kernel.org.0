Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFE445853A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 18:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236367AbhKURIL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Nov 2021 12:08:11 -0500
Received: from mx1.riseup.net ([198.252.153.129]:52992 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230330AbhKURIK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Nov 2021 12:08:10 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4Hxxbj2pjGzF4fK;
        Sun, 21 Nov 2021 09:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1637514305; bh=frwbpAYFFyKxiux4VNiRv0JHmchfOJHIwVueKmJ/N54=;
        h=From:To:Cc:Subject:Date:From;
        b=DnHJEzAVmCFcssJOve8Nh0CbFmDU0roR2UzNfT3yraEmQK+TyHnwRqSsXGFLo9gdJ
         7NECBJRzia4vHfpGaBbIr/wXcO5i69uswe3uPlPfzWJq/UhZsCP7Bdfpir/8ClyQGy
         iu6Y//EsHDek+CWkN27lknZe7to8LImA3zMlInF0=
X-Riseup-User-ID: 54A1B4C10A7C74CEF85107746A15AE74BD9BA5C629997227E12ADA846B3E1C0F
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4Hxxbf6rfkz5vV4;
        Sun, 21 Nov 2021 09:05:02 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH] arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
Date:   Mon, 22 Nov 2021 00:04:49 +0700
Message-Id: <20211121170449.1124048-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the volume up key.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
This patch is a continuation of this series [1]. The other patches in
the series have been applied and remains this. 

Changes in v5:
- Remove deprecated input-name property.

[1]: https://patchwork.kernel.org/cover/12630601/

 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 9a6684922804..6586b8e47483 100644
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
@@ -33,6 +35,17 @@ vph_pwr: vph-pwr-regulator {
 		regulator-boot-on;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
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
2.34.0

