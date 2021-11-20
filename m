Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9C2458097
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237436AbhKTVqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:46:22 -0500
Received: from mx1.riseup.net ([198.252.153.129]:36286 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237312AbhKTVqS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:46:18 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HxRq60d5CzDxdG;
        Sat, 20 Nov 2021 13:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1637444594; bh=/NQcDFAG6TqWRFbBGO09JVnM62VapUiR/NIgI3+epos=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ACNB4zfPcEe2FWMZXAZE0L/Ok9ZXcspJjQIeMatWKqAo+9CLzXyWmY9+ArnJKLmZ4
         Jax/bnLhr/oV6MnhJYKZ6Jendul6Olvv1I0+iP9VD9e7TVnIpYnh1DgPy8q6jaAHAy
         w5Y8mif9wHaUx6zJnoqSktwUkIF98pRetdb/2+is=
X-Riseup-User-ID: 38D232F63910FE9218708176047DAB813C19114A1B9527BC0A1893FAC2E0C1EA
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HxRq25KpVz5vkF;
        Sat, 20 Nov 2021 13:43:10 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 8/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB
Date:   Sun, 21 Nov 2021 04:42:27 +0700
Message-Id: <20211120214227.779742-9-danct12@riseup.net>
In-Reply-To: <20211120214227.779742-1-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 45e58714af71..6cdd9f7c864b 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -79,6 +79,15 @@ framebuffer_mem: memory@9d400000 {
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
@@ -95,6 +104,13 @@ &pon_resin {
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
@@ -370,3 +386,12 @@ &sdhc_2 {
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

