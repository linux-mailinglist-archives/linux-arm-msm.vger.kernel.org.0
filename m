Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90BD45A7A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 17:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbhKWQ2S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 11:28:18 -0500
Received: from mx1.riseup.net ([198.252.153.129]:51210 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231216AbhKWQ2S (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 11:28:18 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4Hz8ck1mDDzF4hK;
        Tue, 23 Nov 2021 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1637684710; bh=XXHHfy3PIsnPkeTFzRP46/bHk0xpdkwwxYrG490tGrU=;
        h=From:To:Cc:Subject:Date:From;
        b=mxWmBnkQ1fSJqmqqCDelaG+Fh6pQ8CBzCkDNM7kFmXymE6NWyYjp2hhCcegqSic9X
         ki+cP+4Rx+eAgvRPGJ+2RoW3/8ATVZeNOVDIt7i3QhLc2qy3ZLhXF35QMGTOPBYACV
         pB25cg7HQEN3xdtPABwgforA7vXlTiKXCyvo6FU0=
X-Riseup-User-ID: F7D6CDABEBB6CDF0966A8AD74D892355AD8F4081111D8A41F833EF70850E1741
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4Hz8ch0WZHz5vLq;
        Tue, 23 Nov 2021 08:25:07 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: Drop input-name property
Date:   Tue, 23 Nov 2021 23:24:37 +0700
Message-Id: <20211123162436.1507341-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This property doesn't seem to exist in the documentation nor
in source code, but for some reason it is defined in a bunch
of device trees.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
This patch is a split of this treewide patch [1] to ease the 
maintainers. 

[1]: https://patchwork.kernel.org/patch/12633497/

 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts            | 1 -
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi     | 1 -
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts              | 3 ---
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi    | 2 --
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi        | 1 -
 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts | 1 -
 7 files changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 69fcb6b0398d..84558ab5fe86 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -42,7 +42,6 @@ framebuffer0: framebuffer@3404000 {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		autorepeat;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 3a3790a52a2c..cc038f9b641f 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -62,7 +62,6 @@ divclk4: divclk4 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		autorepeat;
 
 		volupkey {
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 7cc564d8ca7c..dde7ed159c4d 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -29,7 +29,6 @@ / {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		autorepeat;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index 3d495ce3f46a..dc5b9b274df3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -29,7 +29,6 @@ extcon_usb: extcon-usb {
 
 	gpio-hall-sensors {
 		compatible = "gpio-keys";
-		input-name = "hall-sensors";
 		label = "Hall sensors";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hall_sensor1_default>;
@@ -46,7 +45,6 @@ hall-sensor1 {
 
 	gpio-kb-extra-keys {
 		compatible = "gpio-keys";
-		input-name = "extra-kb-keys";
 		label = "Keyboard extra keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_kb_pins_extra>;
@@ -102,7 +100,6 @@ alt {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "side-buttons";
 		label = "Side buttons";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 91e391282181..47488a1aecae 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -93,7 +93,6 @@ vph_pwr: vph-pwr-regulator {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		label = "Side buttons";
 		pinctrl-names = "default";
 		pinctrl-0 = <&vol_down_pin_a>, <&cam_focus_pin_a>,
@@ -126,7 +125,6 @@ camera-focus {
 
 	gpio-hall-sensor {
 		compatible = "gpio-keys";
-		input-name = "hall-sensors";
 		label = "Hall sensors";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hall_sensor0_default>;
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index e90c9ec84675..42af1fade461 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -90,7 +90,6 @@ cam_vana_rear_vreg: cam_vana_rear_vreg {
 	gpio_keys {
 		status = "okay";
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 45eab0235d66..871ccbba445b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -42,7 +42,6 @@ extcon_usb: extcon-usb {
 	gpio-keys {
 		status = "okay";
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		autorepeat;
-- 
2.34.0

