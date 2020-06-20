Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1F0202475
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbgFTOst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728453AbgFTOsr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:47 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49EAC06174E;
        Sat, 20 Jun 2020 07:48:46 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h5so12378104wrc.7;
        Sat, 20 Jun 2020 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lk7n6WWJEaKpqahLfl1t5fyczJ/mlA5iUEng93nFK38=;
        b=Er4IWP/2B+clhB0mmK2gYlOh+0PX2ia7ULK24cTIHB6o73+wVQ3wwDtQ0pCaZJkrLK
         92traMIydeEFLoL7gbxNGwyjqjwnaWb+tJJP38Yjv51LTm+SfV23x21mpJQ0yYA4UhF6
         gn4Pjc20z3Tq3qzngFhO/N/kAfWlP5NkxUWBYq8dP/01Tbm1j+wrI3YCrz099w5QjcBF
         OGwufvMC0ZPEN3hBcfPIfiE7ORI0sfE5zL7uGDW/YM2pd95C6k8TVPSUQn6bjYdL8Wtj
         y0Oj5W8qB04r4hXy0+sJU07oAyrWT82OpsKWaufl7Ty9qlTi8pORFR5dYgoaR+tbtUBe
         VuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lk7n6WWJEaKpqahLfl1t5fyczJ/mlA5iUEng93nFK38=;
        b=TfYLS0Ab7KcLH9H93I0DHg3swCutrMzLSO/TvLPJrGoyrMr08Ruhd4pQZxTn458IRr
         8PreXjFVMaGP0z0U2CSimMKqtvZRjqBiMhKaZdPcVQni7NmE3MOZQpaW2wgp5vAUJrBW
         qK4WZR1Y//acGKzawVGRvUebIEH3AKx77SfCqTyqOL/ikeHN9HYvUj4m9zkAEwTTnpBR
         EtIeIlWaXb8E2LQWit2g3kBGHb7Fe4c/tgYfyKsX66qihGL8uNc0/tC98QHwohPsVcbX
         Yq3xWyDWCshXaTPOS7L9XEWznRzF7174Hi38a+UtElckXrJIVoZih7o64xjRhizcuZhZ
         kV6Q==
X-Gm-Message-State: AOAM532y+P83RR3kuRG0s+IK4ZQNMhIboL1HEocoQQy+y9dWsMgXbvbW
        polEQFZZp2Jp/64AaMeYNQU=
X-Google-Smtp-Source: ABdhPJxs3oBcbCnLACnH5GiCl6gep4+tKj2q1GBRMvInldVTcEt09HSCIexg8R0D/EJnCha5icr80A==
X-Received: by 2002:adf:8444:: with SMTP id 62mr9146171wrf.278.1592664525509;
        Sat, 20 Jun 2020 07:48:45 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:45 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/21] arm64: dts: qcom: msm8994: Add I2C, SPI and BLSP DMA nodes
Date:   Sat, 20 Jun 2020 16:46:32 +0200
Message-Id: <20200620144639.335093-17-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for I2C and SPI buses to enable peripherals
such as touchscreens or sensors. Also add DMA nodes and
configuration

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 137 +++++++++++++++++++++++++-
 1 file changed, 136 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 20e859eb1318..7a7b22e2d5cc 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -233,14 +233,40 @@ msmgpio: pinctrl@fd510000 {
 			#interrupt-cells = <2>;
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
 		blsp1_uart2: serial@f991e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf991e000 0x1000>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
 			clock-names = "core", "iface";
 			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
+			status = "disabled";
 		};
 
 		blsp2_uart2: serial@f995e000 {
@@ -250,6 +276,115 @@ blsp2_uart2: serial@f995e000 {
 			clock-names = "core", "iface";
 			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
 					<&gcc GCC_BLSP2_AHB_CLK>;
+			dmas = <&blsp1_dma 2>, <&blsp1_dma 3>;
+			dma-names = "tx", "rx";
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
+		};
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
 		};
 
 		spmi_bus: qcom,spmi@fc4c0000 {
-- 
2.27.0

