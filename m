Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6D72B38E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Nov 2020 20:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgKOTyA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Nov 2020 14:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbgKOTyA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Nov 2020 14:54:00 -0500
Received: from mxa2.seznam.cz (mxa2.seznam.cz [IPv6:2a02:598:2::90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CEA6C0613CF;
        Sun, 15 Nov 2020 11:53:59 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc15a.ng.seznam.cz (email-smtpc15a.ng.seznam.cz [10.23.11.195])
        id 504eed650b40b90c51e7213b;
        Sun, 15 Nov 2020 20:53:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1605470033; bh=6FtFWzCTxDQfiFTGZR1zbJVpeY2BZ/9nh61CqXiRXg0=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=lLYNRGWKWhxlWbZ/Yzl46FMzrwkobSMt3rBNGhbCyE2nctHHf9QwMO/SilEmu+mi8
         /o9Z1j1wgkd5/aTVV2yxI/dKR8UZFc+8fB8WftV9Sh7IZy2U014mWYRZ4vYV3+xi4F
         Av8Wi2i0WG12Kd+4SnenwIZXpE3MC/DSH4B/6Ei0=
Received: from localhost.localdomain (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay16.ng.seznam.cz (Seznam SMTPD 1.3.121) with ESMTP;
        Sun, 15 Nov 2020 20:53:51 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-a3u: add nodes for touchscreen
Date:   Sun, 15 Nov 2020 20:50:58 +0100
Message-Id: <20201115195058.27097-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch wires up touchscreen support on Samsung Galaxy A3 2015.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---

Tested on Samsung Galaxy A3 (sm-a3ulte).

---
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 086f07ead5cb..661f41ad978b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -28,6 +28,27 @@ &accelerometer {
 		       "0", "0", "1";
 };
 
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@20 {
+		compatible = "zinitix,bt541";
+
+		reg = <0x20>;
+		interrupt-parent = <&msmgpio>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+
+		touchscreen-size-x = <540>;
+		touchscreen-size-y = <960>;
+
+		vdd-supply = <&reg_vdd_tsp>;
+		vddo-supply = <&pm8916_l6>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_default>;
+	};
+};
+
 &dsi0 {
 	panel@0 {
 		reg = <0>;
@@ -59,4 +80,12 @@ panel_vdd3_default: panel-vdd3-default {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	ts_int_default: ts-int-default {
+		pins = "gpio13";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
-- 
2.28.0

