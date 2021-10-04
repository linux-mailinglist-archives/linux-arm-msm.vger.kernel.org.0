Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E2542184A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235976AbhJDUXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:23:52 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:30324 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235425AbhJDUXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633378912;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=BNocBK4U1HyTaxyN3VYb2yfK5aJOaCFqjEMeLHlV25E=;
    b=X/95LHhnc+kTdg+7tBN1vZVklTHr1sXMlxDaVoCt3T73doSBLH42egK1bULCMjkN39
    wdmT2wckB+r7297JlCVEdJZpMFWWysiRkNM6hcJwsOlMMtOpxRNbt/zjzTrNb5LTGJWb
    KMoOm8jojKAnR2fNVZqb/U7Mr+M0n+h9dOOF8DHhWfbNjChsFMQVbFPai5teyW7AFe0P
    wBclHRrDCnPZR2rte8APn/d+4JpVB/gfECkoRrxFSUtPyRbGnAIHt0toZWZoT5mEaHhc
    PxuRwBntveNN6CgR5nB4Pe1OaTMPb17bKKrmAdyVis5EmEceLE+miNLQABJT9Gu5vml6
    HiIA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KLqKQq
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:21:52 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 06/15] arm64: dts: qcom: msm8916-samsung-serranove: Add NFC
Date:   Mon,  4 Oct 2021 22:19:12 +0200
Message-Id: <20211004201921.18526-7-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LTE version of the S4 Mini VE has a NXP PN547, which is supported
by the nxp-nci-i2c driver in mainline. It seems to detect NFC tags
using "nfctool" just fine, although more testing is difficult given
there seem to be very few useful applications making use of the
Linux NFC subsystem. :(

Note that for some reason Samsung decided to connect the I2C pins
to GPIOs where no hardware I2C bus is available, so we need to
fall back to software bit-banging with i2c-gpio.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: None.
---
 .../dts/qcom/msm8916-samsung-serranove.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 3ef00bdc043e..a78f87a5bf4f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -168,6 +168,32 @@ touchkey@20 {
 			pinctrl-0 = <&tkey_default>;
 		};
 	};
+
+	i2c-nfc {
+		compatible = "i2c-gpio";
+		sda-gpios = <&msmgpio 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&msmgpio 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&nfc_i2c_default>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nfc@2b {
+			compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
+			reg = <0x2b>;
+
+			interrupt-parent = <&msmgpio>;
+			interrupts = <21 IRQ_TYPE_EDGE_RISING>;
+
+			enable-gpios = <&msmgpio 20 GPIO_ACTIVE_HIGH>;
+			firmware-gpios = <&msmgpio 49 GPIO_ACTIVE_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&nfc_default>;
+		};
+	};
 };
 
 &blsp_i2c2 {
@@ -434,6 +460,30 @@ muic_irq_default: muic-irq-default {
 		bias-disable;
 	};
 
+	nfc_default: nfc-default {
+		pins = "gpio20", "gpio49";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+
+		irq {
+			pins = "gpio21";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
+	nfc_i2c_default: nfc-i2c-default {
+		pins = "gpio0", "gpio1";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	tkey_default: tkey-default {
 		pins = "gpio98";
 		function = "gpio";
-- 
2.33.0

