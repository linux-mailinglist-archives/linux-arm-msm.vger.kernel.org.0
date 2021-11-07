Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008E5447578
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Nov 2021 21:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbhKGUIH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Nov 2021 15:08:07 -0500
Received: from mx1.riseup.net ([198.252.153.129]:35010 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236383AbhKGUIF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Nov 2021 15:08:05 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HnQ3R21dpzDrhC;
        Sun,  7 Nov 2021 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636314963; bh=H5TSzC40aRVwGWGMaw5goomGgd7XGwJA1Z2Jw1JsVfA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gd5EkgWt6tcv/dyxrwbZC63Gjhsx1naUDAPV3wPAvSGoKijXyD79UECXVD8p6H7KW
         6/SIwAMqA0yI001oeRvtumTTraHruyA0F/Q8NPmmggo1zhOVhIzURUjoFfF3485bGr
         0ErFj+T4MmMxkDyb+oib1L3WHJDfQTo3mYz0auc0=
X-Riseup-User-ID: A90CA907D0BB05E5B3A226CB280CD9A0CDD45754D187F57A772E4E7AC55480D7
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HnQ3N1R98z5vkF;
        Sun,  7 Nov 2021 11:55:59 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org
Subject: [PATCH 7/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB
Date:   Mon,  8 Nov 2021 02:55:11 +0700
Message-Id: <20211107195511.3346734-8-danct12@riseup.net>
In-Reply-To: <20211107195511.3346734-1-danct12@riseup.net>
References: <20211107195511.3346734-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable and configure DWC3 and QUSB2 PHY to enable USB
functionality on the Redmi Note 7.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index d6599881f1ac..b54191f1f152 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -84,6 +84,15 @@ cont_splash_mem: cont-splash-region@9d400000 {
 			no-map;
 		};
 	};
+
+	/*
+	 * Until we hook up type-c detection, we
+	 * have to stick with this. But it works.
+	 */
+	extcon_usb: extcon-usb {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &blsp1_uart2 {
@@ -100,6 +109,13 @@ voldown {
 	};
 };
 
+&qusb2phy {
+	status = "okay";
+
+	vdd-supply = <&vreg_l1b_0p925>;
+	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
+};
+
 &rpm_requests {
 	pm660l-regulators {
 		compatible = "qcom,rpm-pm660l-regulators";
@@ -405,3 +421,12 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <8 4>;
 };
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "peripheral";
+	extcon = <&extcon_usb>;
+};
-- 
2.33.1

