Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E9745A78E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 17:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhKWQ1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 11:27:21 -0500
Received: from mx1.riseup.net ([198.252.153.129]:33322 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229490AbhKWQ1V (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 11:27:21 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4Hz8bc6CP6zF4hK;
        Tue, 23 Nov 2021 08:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1637684652; bh=stNte7d26WnhnXC3ecSubp5EUl7aNu2uiNp1RYROnSI=;
        h=From:To:Cc:Subject:Date:From;
        b=ghaphtF57LSQFyViP4QhuVeq7ys2Usy+p9Bxo9TvJMfKgKLlxn0TDrGedLgXQbSWi
         9++cKtQYhmCLeKvdNh5HrIl0y8q9KT5W56TMZLmFXEjd89zLVSmuJhlsfq2CBnSWzB
         p3W8ZgtngLZGGJopxhhK9LdBR31baqIi1q+QVLfI=
X-Riseup-User-ID: E0A67B4CE233D505C4916D06E1BFF3FB8359B951C0216D6436397217B9D33A9C
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4Hz8bZ4Ywjz5vLq;
        Tue, 23 Nov 2021 08:24:10 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: Drop input-name property
Date:   Tue, 23 Nov 2021 23:19:22 +0700
Message-Id: <20211123161919.1506755-1-danct12@riseup.net>
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

 arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts      | 1 -
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts         | 1 -
 arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts | 1 -
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts          | 1 -
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts     | 1 -
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts    | 1 -
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts    | 1 -
 7 files changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
index f8c97efc61fc..0cee62c7b8b0 100644
--- a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
@@ -19,7 +19,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index ea15b645b229..6d77e0f8ca4d 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 30ee913faae6..069136170198 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -450,7 +450,6 @@ bcrmf@1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 003f0fa9c857..96e1c978b878 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -349,7 +349,6 @@ bluetooth {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
index 398a3eaf306b..79e2cfbbb1ba 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
index b4dd85bd4faf..e66937e3f7dd 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
index 9743beebd84d..a62e5c25b23c 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
-- 
2.34.0

