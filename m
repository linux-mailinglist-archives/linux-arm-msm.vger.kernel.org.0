Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690E41B90CD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2020 16:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgDZOId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Apr 2020 10:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgDZOIc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Apr 2020 10:08:32 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15051C09B051;
        Sun, 26 Apr 2020 07:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587910109;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=X6s9ev0ZnHJUC2UaGsaWn1aQO321edVLr0jMEEcsidA=;
        b=p/egE2NhubchTCEOMIn6O3umhHR727pVbKRtq/tydKtNBrMr6UM8fxCyBlk/wRBsxN
        TvhmOj2Ax1iqg5t2hY8M+OlzzAtDTVV2qCIpacgo/ru4ISV9blPUvaeigqGIv5zbwr4X
        KHfdvRkYiX0PiVYC6+TWsVdRtBDfP7yfEqeV0X+CsKaQPvvnHTO3/OO9nsSRclksAH6C
        O+gFW7gmejgP4w3i5Em12u1PU6CFHN5terJnI7ggnEqOukn24V/MQmjia4nETRgiSVnU
        btfyKaVYH1x0cIQ3CjwWd4IywGtIY/kQbaLPyS1ETiQy4qmTRrJ8ElVoTdl1DaE5g5JD
        ZI6A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6Nf3AC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw3QE8PNFK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 26 Apr 2020 16:08:25 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/4] arm64: dts: qcom: msm8916: Add blsp_i2c1
Date:   Sun, 26 Apr 2020 16:06:39 +0200
Message-Id: <20200426140642.204395-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200426140642.204395-1-stephan@gerhold.net>
References: <20200426140642.204395-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 has another I2C QUP controller that can be enabled on
GPIO 2 and 3.

Add blsp_i2c1 to msm8916.dtsi and disable it by default.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
On samsung-a2015 there is an external TFA9895 speaker amplifier
connected to blsp_i2c1. There isn't a proper mainline driver
for it (yet?), but it's nice to have the I2C bus in mainline at least.
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 24 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      | 15 ++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 242aaea68804..b45fd12856ea 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -262,6 +262,30 @@ pinconf {
 		};
 	};
 
+	i2c1_default: i2c1_default {
+		pinmux {
+			function = "blsp_i2c1";
+			pins = "gpio2", "gpio3";
+		};
+		pinconf {
+			pins = "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c1_sleep: i2c1_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio2", "gpio3";
+		};
+		pinconf {
+			pins = "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	i2c2_default: i2c2_default {
 		pinmux {
 			function = "blsp_i2c2";
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8b429954ea29..6ab7cabde370 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -612,6 +612,21 @@ blsp_spi6: spi@78ba000 {
 			status = "disabled";
 		};
 
+		blsp_i2c1: i2c@78b5000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b5000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c1_default>;
+			pinctrl-1 = <&i2c1_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp_i2c2: i2c@78b6000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078b6000 0x500>;
-- 
2.26.2

