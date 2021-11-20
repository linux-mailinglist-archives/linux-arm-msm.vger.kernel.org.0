Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179C2458086
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236660AbhKTVp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:45:58 -0500
Received: from mx1.riseup.net ([198.252.153.129]:51956 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236317AbhKTVp4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:45:56 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HxRph4Rb4zF3Q7;
        Sat, 20 Nov 2021 13:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1637444572; bh=qEi8whvyibBvrjsfAeCymyE5J6SczEwhMEi9FSO9TXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gh9NwXUU2PhVWj0PL1kz9nkLP0GptWCTlI3k0ebpeS7T65iUccmsI4YYkrdXx9zS6
         VUruvyQKMxc3T6XO7O0rtv2iLilJ5yTbAWvhaQwpdXrzK0oHD1C665uHb0fOgqCY+0
         hWVQpj4iR4tjNiGF1j/oF1wDCSNLfXHW/WCFGiD4=
X-Riseup-User-ID: F5DD54F88169A2B44A54C2AE36F433857F9A5828D974BA2418A0793B890C034C
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HxRpd1yZfz5vkF;
        Sat, 20 Nov 2021 13:42:49 -0800 (PST)
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
Subject: [PATCH v4 2/8] arm64: dts: qcom: sdm630-pm660: Move RESIN to pm660 dtsi
Date:   Sun, 21 Nov 2021 04:42:21 +0700
Message-Id: <20211120214227.779742-3-danct12@riseup.net>
In-Reply-To: <20211120214227.779742-1-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's not worth duplicating the same node over and over again,
so let's keep the common bits in the pm660 DTSI, making only
changing the status and keycode necessary.

Also, disable RESIN/PWR by default just in case if there are
devices that doesn't use them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/pm660.dtsi              | 12 +++++++++++-
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi   | 16 ++++++++--------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
index d0ef8a1675e2..c482663aad56 100644
--- a/arch/arm64/boot/dts/qcom/pm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -54,14 +54,24 @@ pon: pon@800 {
 			mode-bootloader = <0x2>;
 			mode-recovery = <0x1>;
 
-			pwrkey {
+			pon_pwrkey: pwrkey {
 				compatible = "qcom,pm8941-pwrkey";
 				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
 				debounce = <15625>;
 				bias-pull-up;
 				linux,code = <KEY_POWER>;
+
+				status = "disabled";
 			};
 
+			pon_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+
+				status = "disabled";
+			};
 		};
 
 		pm660_temp: temp-alarm@2400 {
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 11d0a8c1cf35..e90c9ec84675 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -215,14 +215,14 @@ &blsp2_uart1 {
 	/* HCI Bluetooth */
 };
 
-&pon {
-	volup {
-		compatible = "qcom,pm8941-resin";
-		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-		debounce = <15625>;
-		bias-pull-up;
-		linux,code = <KEY_VOLUMEUP>;
-	};
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+
+	linux,code = <KEY_VOLUMEUP>;
 };
 
 &qusb2phy {
-- 
2.33.1

