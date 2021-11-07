Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B565F447582
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Nov 2021 21:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236437AbhKGUIN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Nov 2021 15:08:13 -0500
Received: from mx1.riseup.net ([198.252.153.129]:37434 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236385AbhKGUIH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Nov 2021 15:08:07 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnQ3F0FJTzF43v;
        Sun,  7 Nov 2021 11:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636314953; bh=Mz2Y9Z3jJa5YdOET9mVHR82Zll7PFd5M8ER/5BHLkvw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cjGCALBnXt2Qp8jW89Voz2esWOJr+MI0SJ/m5lV1C+nOxE27Vu+UWlDo6OIUEkhvF
         XSxJ+dyhfcii0h2uPbNv6qwehVjUj4wKlEq5K2WRR4J7Y3Mk9KgS0/Yfw8we2/Q87T
         nOptwAuK2UxDBfEt8To0LtjEHCNXpP72205mw1Ss=
X-Riseup-User-ID: CB7883D8C8B195857680B619F9C46094F400FF10FDACC8B442C9FB889B5A937E
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnQ396ZmHz5vj2;
        Sun,  7 Nov 2021 11:55:49 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org
Subject: [PATCH 4/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
Date:   Mon,  8 Nov 2021 02:55:08 +0700
Message-Id: <20211107195511.3346734-5-danct12@riseup.net>
In-Reply-To: <20211107195511.3346734-1-danct12@riseup.net>
References: <20211107195511.3346734-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the volume up key.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 28408240735b..5e4682f54fbe 100644
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
@@ -31,6 +34,23 @@ vph_pwr: vph-pwr-regulator {
 		regulator-boot-on;
 	};
 
+	gpio_keys {
+		status = "okay";
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vol_up {
+			label = "Volume Up";
+			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			gpio-key,wakeup;
+			debounce-interval = <15>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.33.1

