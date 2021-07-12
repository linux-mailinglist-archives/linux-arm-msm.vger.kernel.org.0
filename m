Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7A23C5D6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 15:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhGLNmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 09:42:20 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:35891 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhGLNmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 09:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626097167;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=nlntuqBtCJRt6lh0WvuK9sblmHgsWtM+lm/yRezUMEI=;
    b=YUvkBEhYFCdhQ/mqBebvEcK7OKFRrmOwfP+tifoBka4JL3uFSun73WHLkzbSvtPKYg
    xhvVV5SS9t98WO+xTiecnORXW1hbBuGpVfa05JZs6o7lMpENwnYTrUuKO4O/6xA173wK
    1BBiwdkA+d0z6ZgVn2+56qCjgAJls5viEvYiFmZPZbEHE1vKG8FCR6roKexmNEahwzfV
    UKRfQBRqHX2eEmkvWRTRC6tlKH82+XBevRzlUnZTlB8PddP7nJT25G24lY05DFusbkMG
    +dm/2zn7xyRxP9rOQZgnZ4ZSMdkqLian3siqU6LASVyRyWPp2+HM/AA9NrloCZBWa2Or
    HRAg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB426L3OY="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id Y070ccx6CDdQ9tX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 12 Jul 2021 15:39:26 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/4] arm64: dts: qcom: msm8916-wingtech-wt88047: Add touchscreen
Date:   Mon, 12 Jul 2021 15:37:33 +0200
Message-Id: <20210712133735.318250-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712133735.318250-1-stephan@gerhold.net>
References: <20210712133735.318250-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Xiaomi Redmi 2 has a FocalTech touchscreen. The exact model is
not mentioned anywhere, but it works just fine with the mainline
edt-ft5x06 driver when using the "edt,edt-ft5506" compatible.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../dts/qcom/msm8916-wingtech-wt88047.dts     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
index 5ee35a9b7dc6..a4d8d6ff2289 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
@@ -42,6 +42,30 @@ usb_id: usb-id {
 	};
 };
 
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@38 {
+		/* Likely some other model but works just fine with this one */
+		compatible = "edt,edt-ft5506";
+		reg = <0x38>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&msmgpio 12 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&pm8916_l17>;
+		iovcc-supply = <&pm8916_l6>;
+
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_default>;
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
@@ -198,6 +222,22 @@ gpio_keys_default: gpio-keys-default {
 		bias-pull-up;
 	};
 
+	touchscreen_default: touchscreen-default {
+		pins = "gpio13";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+
+		reset {
+			pins = "gpio12";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	usb_id_default: usb-id-default {
 		pins = "gpio110";
 		function = "gpio";
-- 
2.32.0

