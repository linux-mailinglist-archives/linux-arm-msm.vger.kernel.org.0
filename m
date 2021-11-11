Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E88244D057
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 04:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbhKKDUo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 22:20:44 -0500
Received: from mx1.riseup.net ([198.252.153.129]:38564 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233488AbhKKDUk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 22:20:40 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HqRjp6K0nzF4mX;
        Wed, 10 Nov 2021 19:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636600670; bh=rJOs4g7bozgwSUa7JZjdMB+XtSwhjDCNlVWpVg72aWc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=paaB4IG4j/C7kHdtFEBYm+xHxe+BBUGWloQk876gC/0fWd9OYJolI1tQ2x2BqZC8c
         fbRFCB4d4N2yqx2Smv3Vbfnt/e5b62ZRlOoZKKWcpVGajRxO4i40KMCBLz8qF50Q3M
         H6mbnSShAX8e0r5/FiZVJQlj3gqtzbewM+JRgcTA=
X-Riseup-User-ID: 0B43D6D9C3711605E8FEDC38747C0B88BEA6669E54E02F47FA8820D4F5B9F74C
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HqRjl5TtBz5vVT;
        Wed, 10 Nov 2021 19:17:47 -0800 (PST)
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
Subject: [PATCH v3 8/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB
Date:   Thu, 11 Nov 2021 10:16:35 +0700
Message-Id: <20211111031635.3839947-9-danct12@riseup.net>
In-Reply-To: <20211111031635.3839947-1-danct12@riseup.net>
References: <20211111031635.3839947-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Alexey Min <alexey.min@gmail.com>

Enable and configure DWC3 and QUSB2 PHY to enable USB
functionality on the Redmi Note 7.

Signed-off-by: Alexey Min <alexey.min@gmail.com>
Co-developed-by: Dang Huynh <danct12@riseup.net>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 712392545c2e..bf7f334b0b5c 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -80,6 +80,15 @@ framebuffer_mem: memory@9d400000 {
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
@@ -96,6 +105,13 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
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
@@ -401,3 +417,12 @@ &sdhc_2 {
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

