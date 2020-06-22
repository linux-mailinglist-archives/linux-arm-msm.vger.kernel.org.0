Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0B9203A8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 17:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgFVPSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 11:18:43 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:32356 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729460AbgFVPSl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 11:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592839116;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=02CvZjRE98epBK/EDiy35y49lXVrv+PD15JvvHTDs8M=;
        b=fNei1RLrKpz0egZxf7wirJvtqfOqCRvKwF6t7BDIFNPvTU3hpP15NbU0km6eSjJzH6
        Zp8qFNprN/OoFN96GP+J/3AcWGUzhk8+NBuYEsDsk0jiYdb26LMZh4vrc+w6DX/dtmZV
        tYZ8j1pH4O4TBo5bTy6RCWl8x99GYWcx/rg13Bb4bK/7MS1RxzqTgi/UGdMLIEO4135M
        92j/Q9iHpSmfj+5p3dKyTbA0h0jJc0SYPEZymJPEjtrsds1JZ3v1FOo+SWuPLjWskb77
        c4DsZfgjYOYIV6S5b1bgzTG1F5Rfb3dekF2rT3XP5ik9DReur6k14y0n3uURJVgl438c
        7HsA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6OIUPH"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id 6005e9w5MFIY5Xw
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 22 Jun 2020 17:18:34 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/4] arm64: dts: qcom: msm8916: Use higher I2C drive-strength only on DB410c
Date:   Mon, 22 Jun 2020 17:17:50 +0200
Message-Id: <20200622151751.408995-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622151751.408995-1-stephan@gerhold.net>
References: <20200622151751.408995-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit c240f29e75e6 ("arm64: dts: set the default i2c pin drive strength to 16mA")
changed the default drive-strength for I2C pins in msm8916-pins.dtsi
to the maximum possible (16 mA).

While this makes sense for apq8016-sbc (DB410c) where you can connect
an arbitrary amount of I2C devices with level shifters etc, there is
no need to use a higher drive strength for other MSM8916 devices.
The minimum drive strength (2 mA) seems to be totally sufficient
to have everything work there.

With the short pinctrl nodes introduced earlier we can easily override
the drive-strength only for apq8016-sbc now. Use that and change
the default back to 2 mA.

i2c1_default/i2c5_default are already using 2 mA because they were
added separately later and are not used in apq8016-sbc.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi  | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi |  6 +++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 6fff96a158e9..194343510dcb 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -779,6 +779,22 @@ l18 {
 	};
 };
 
+/*
+ * 2mA drive strength is not enough when connecting multiple
+ * I2C devices with different pull up resistors.
+ */
+&i2c2_default {
+	drive-strength = <16>;
+};
+
+&i2c4_default {
+	drive-strength = <16>;
+};
+
+&i2c6_default {
+	drive-strength = <16>;
+};
+
 &msmgpio {
 	msmgpio_leds: msmgpio-leds {
 		pins = "gpio21", "gpio120";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index e1d4f8df7e79..4dc437f13fa5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -208,7 +208,7 @@ i2c2_default: i2c2-default {
 		pins = "gpio6", "gpio7";
 		function = "blsp_i2c2";
 
-		drive-strength = <16>;
+		drive-strength = <2>;
 		bias-disable;
 	};
 
@@ -224,7 +224,7 @@ i2c4_default: i2c4-default {
 		pins = "gpio14", "gpio15";
 		function = "blsp_i2c4";
 
-		drive-strength = <16>;
+		drive-strength = <2>;
 		bias-disable;
 	};
 
@@ -256,7 +256,7 @@ i2c6_default: i2c6-default {
 		pins = "gpio22", "gpio23";
 		function = "blsp_i2c6";
 
-		drive-strength = <16>;
+		drive-strength = <2>;
 		bias-disable;
 	};
 
-- 
2.27.0

