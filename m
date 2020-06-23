Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7CB2067A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbgFWWtV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388728AbgFWWsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:37 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D04FC061795;
        Tue, 23 Jun 2020 15:48:37 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id a6so3193574wmm.0;
        Tue, 23 Jun 2020 15:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lKyd8F2W1xHCpDv119KWmbZLzq20FtmSKAwayKh93KY=;
        b=dEJ8wcKTV7PR2hoKmCsjF3tiiWrxgfN/Hw6k65qYJhN94eqwF6RBCaLwCi93ya5E18
         h9OrHv7Rw0CwUKVMtH/wGJZlhPftuJ36zbmLrIx/4bvJqAhMQsrWGPlKZm4/u/XtDbSK
         4mI92CMoygq7fbv3xvohHoI8kpG+TQG7q/0dRP+BuyoYPSiXRIShEIgM63r0lN+T9/ms
         YUJxsjUKPC/weQ/JIkeB0/hy2Y8Nr9tx0utDjSc7zwv+Vt73GbY/HT7n/Y65OlAKlGSc
         rdjrz/qxZ496oOuk7KwPvccs4KleNTXceADDsOxa62QkE9yK619h6tGc0w76KNbn+65Y
         UjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKyd8F2W1xHCpDv119KWmbZLzq20FtmSKAwayKh93KY=;
        b=aRYcpwW1MGTJooYhmat0RKMuntD4Ao6Qehw3h680Ag/+Fn5TZ0S9tZ3dsqxgUITwOO
         9JXiKZLELmi5cTaxYnT5/bg0JqJacS9wtr3WblP/j9SLv79of4XFYDbhAjL6LwZCvZPT
         Nk8j4cXpoXNkJLce6YUo/kJkm/UMaCk+/NJ7KBjnTESQyMh5WPx9iak5/RDmttsNiB0w
         B9XdNUzRACDNpANv2MVTosZc5QDGg7M7+VktZSbU+Uenzj1T6SBJ5IiFD4ydmqTXrUmo
         NhyC1tMcpBQXoFU30LbHThHSRcJS4/YpxX82AAH+5g85Z4A1JrX/ZholvRSH1aMVHC1j
         s2Nw==
X-Gm-Message-State: AOAM530sA1prDlpvXMfz1/0fmT2sjS1j3yZEEwcCvjzzcclHg97rp5Pp
        zV4E3Iq4KdxyghHwH8hc8O4=
X-Google-Smtp-Source: ABdhPJylQIjj0BFQpfiwlHFSt1/GP4WYZz2ybVppg6vBUxqE/Cma0TnsGDEm3czbUogs+e9s0qxBNg==
X-Received: by 2002:a05:600c:2152:: with SMTP id v18mr4851121wml.5.1592952516220;
        Tue, 23 Jun 2020 15:48:36 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:35 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/12] arm64: dts: qcom: msm8994: Add I2C, SPI and BLSP DMA nodes
Date:   Wed, 24 Jun 2020 00:48:06 +0200
Message-Id: <20200623224813.297077-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for I2C and SPI buses to enable peripherals
such as touchscreens or sensors. Also add DMA nodes,
configuration and BLSP2 UART2 interface.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 156 +++++++++++++++++++++++++-
 1 file changed, 155 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 838ffc0d9c16..8af01ebe73f7 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -365,14 +365,168 @@ sdhc1: sdhci@f9824900 {
 			status = "disabled";
 		};
 
+		blsp1_dma: dma@f9904000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0xf9904000 0x19000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <18>;
+			qcom,num-ees = <4>;
+		};
+
 		blsp1_uart2: serial@f991e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf991e000 0x1000>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
 			clock-names = "core", "iface";
 			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			pinctrl-1 = <&blsp1_uart2_sleep>;
+			status = "disabled";
+		};
+
+		blsp_i2c1: i2c@f9923000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9923000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+						<&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c1_default>;
+			pinctrl-1 = <&i2c1_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_spi0: spi@f9923000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0xf9923000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			spi-max-frequency = <19200000>;
+			dmas = <&blsp1_dma 12>, <&blsp1_dma 13>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_spi0_default>;
+			pinctrl-1 = <&blsp1_spi0_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c2: i2c@f9924000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9924000 0x500>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+						<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <355000>;
+			dmas = <&blsp1_dma 14>, <&blsp1_dma 15>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c2_default>;
+			pinctrl-1 = <&i2c2_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* I2C3 doesn't exist */
+
+		blsp_i2c4: i2c@f9926000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9926000 0x500>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+						<&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <355000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c4_default>;
+			pinctrl-1 = <&i2c4_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp2_dma: dma@f9944000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0xf9944000 0x19000>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <18>;
+			qcom,num-ees = <4>;
+		};
+
+		/* According to downstream kernels, i2c6
+		 * comes before i2c5 address-wise...
+		 */
+
+		blsp_i2c6: i2c@f9928000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9928000 0x500>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+						<&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <355000>;
+			dmas = <&blsp1_dma 22>, <&blsp1_dma 23>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c6_default>;
+			pinctrl-1 = <&i2c6_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp2_uart2: serial@f995e000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xf995e000 0x1000>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_EDGE_FALLING>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
+					<&gcc GCC_BLSP2_AHB_CLK>;
+			dmas = <&blsp2_dma 2>, <&blsp2_dma 3>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_uart2_default>;
+			pinctrl-1 = <&blsp2_uart2_sleep>;
+			status = "disabled";
+		};
+
+		blsp_i2c5: i2c@f9967000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9967000 0x500>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+						<&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <355000>;
+			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c5_default>;
+			pinctrl-1 = <&i2c5_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		gcc: clock-controller@fc400000 {
-- 
2.27.0

