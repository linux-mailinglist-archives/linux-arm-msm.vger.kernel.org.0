Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F881B90C4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2020 16:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgDZOId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Apr 2020 10:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgDZOIc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Apr 2020 10:08:32 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06145C061A0F;
        Sun, 26 Apr 2020 07:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587910109;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=YlsGIAJA9igg5C/bJRQhzyd3Q8nFXOWeclEHLmiRMbg=;
        b=r8Sn3KzZpXFD8h4jzKbU5t1UIUCszzb6bNCtvQCk6G2ZOW5dxZ0lJaYlx7vZe1qmfY
        uQd/O3+3MtUDqp915YPVUMe5+Oy3l6DFJxsQz/N/ONHrn234P56SZLSY3fi0J/HJA/iF
        yiGWQaJuqHK+YRC/Qktn8bI0zo3vPNa36zZQlPNPvpPl8393SI/n6MGAn7c2wc5gcbs9
        Ueg7HtzdvJ3LXUaGbObJL4nkeSnJSzKJFRN76O2z0qLy1lMKa0V+TdvXzidqr2b2jSCg
        3MwfSHev0Nq4AOx+l1cAinAlJArRm0EZWEVT2ePPq23pxrX/FULgQ06t3NyoJ0OAksWt
        i+pw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6Nf3AC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw3QE8QNFL
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 26 Apr 2020 16:08:26 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/4] arm64: dts: qcom: msm8916: Add blsp_i2c5
Date:   Sun, 26 Apr 2020 16:06:40 +0200
Message-Id: <20200426140642.204395-3-stephan@gerhold.net>
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
GPIO 18 and 19.

Add blsp_i2c5 to msm8916.dtsi and disable it by default.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Most MSM8916 smartphones/tablets have a touchscreen
connected to blsp_i2c5.
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 24 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      | 15 ++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index b45fd12856ea..31886860766a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -334,6 +334,30 @@ pinconf {
 		};
 	};
 
+	i2c5_default: i2c5_default {
+		pinmux {
+			function = "blsp_i2c5";
+			pins = "gpio18", "gpio19";
+		};
+		pinconf {
+			pins = "gpio18", "gpio19";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c5_sleep: i2c5_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio18", "gpio19";
+		};
+		pinconf {
+			pins = "gpio18", "gpio19";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	i2c6_default: i2c6_default {
 		pinmux {
 			function = "blsp_i2c6";
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 6ab7cabde370..57ab5573a2d2 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -657,6 +657,21 @@ blsp_i2c4: i2c@78b8000 {
 			status = "disabled";
 		};
 
+		blsp_i2c5: i2c@78b9000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b9000 0x500>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c5_default>;
+			pinctrl-1 = <&i2c5_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp_i2c6: i2c@78ba000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x078ba000 0x500>;
-- 
2.26.2

