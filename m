Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CE820A4BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390740AbgFYSVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403908AbgFYSVp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:45 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71B1C08C5DB;
        Thu, 25 Jun 2020 11:21:44 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id i14so6873732ejr.9;
        Thu, 25 Jun 2020 11:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nINX/kfwXFeE0ZC5NuendZlvDPr7E/82LokYi5uJ2C8=;
        b=phgQEmZBAGHvF6Yor9+Ner7UPhLMBjeDoTBnlcP5hKjw+/FXyBRbqeQO7UuM4I/fwC
         m4bUArLisV1M8EBGkYqXiB+rVR+ytGS+Pph9ROOmYIxq3ho0Ui27MvYSwhW0ezhQG2zx
         Dse2e/Ns0HQnS7ZRh9a4Ucej7p2hA5fMqM18JM7nKoxLYaaQgjypvGO8SNnX9aD1+BB5
         o2HFiZ+5Ap1Tsuk624bOpisg+utjMrjJcW274L30jZkjGARpu+AWcSLiEj6vYkv9xyTL
         5tuH/4CaBrsU+V8fjYnRgLvOW2uq8rtbe+Mv7uVv4j8dnOwni05caefJdE1tm8XyfM7m
         qFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nINX/kfwXFeE0ZC5NuendZlvDPr7E/82LokYi5uJ2C8=;
        b=dQ8/XfiM3ohPPcKY06nkftYBwCe/cmWjMEAdHj7E8ikLK67PiONTt61yuWRIUQPkp5
         SuG4nUCClDBKSjhtRCVU+cjyGN+3/fG/4P30ro8TgazhhpFORRFVH4FSio2Zssqze6s2
         anPzCFiotYWYacssI8KcanWwBWu3eYbmvnnNr2nEXqpg5M4fqbatiCrImbDw9qwC8xcI
         OEXXfO3MeS/J+KTgwr+cQghCdPQ6e5PGLpxR3bgvuE77QZGo+TJokNc7haWqDlfHCrKf
         DKIDhUGShekLwLc66+SCnaV6PAE6vwyZUJTYcYwfkw4wjhVvAzkjfzeK6XEH0q1xBG6Y
         er1Q==
X-Gm-Message-State: AOAM532c/a5Hcd+P8jtw6EybYtBxr/qfgLAEeEEDE6jfr89dZOe4omNt
        npcp8+2IqoF6MvlEBWvf7ls=
X-Google-Smtp-Source: ABdhPJySgXDEOreTE6V/aBq8JMuILzmOefyxBwgH84GXUxUtaHRcMT4JFvzsjFHIg2QsVtNzQZUeqw==
X-Received: by 2002:a17:907:6fc:: with SMTP id yh28mr20251363ejb.267.1593109303497;
        Thu, 25 Jun 2020 11:21:43 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:43 -0700 (PDT)
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
Subject: [PATCH v3 08/13] arm64: dts: qcom: msm8992: Add BLSP2_UART2 and I2C nodes
Date:   Thu, 25 Jun 2020 20:21:12 +0200
Message-Id: <20200625182118.131476-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
References: <20200625182118.131476-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for I2C to enable support for peripherals
such as touchscreens or sensors. Also add BLSP_UART2 interface.

Please note that the naming scheme follows downstream and as
abominable as it is, that's what we get.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 153 ++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index acce7be22e50..e8b801813f14 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -272,6 +272,101 @@ blsp1_uart2: serial@f991e000 {
 			status = "disabled";
 		};
 
+		blsp_i2c2: i2c@f9924000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9924000 0x500>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c2_default>;
+			pinctrl-1 = <&i2c2_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* Somebody was very creative with their numbering scheme downstream... */
+
+		blsp_i2c13: i2c@f9927000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9927000 0x500>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				<&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c13_default>;
+			pinctrl-1 = <&i2c13_sleep>;
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
+				<&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
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
+			interrupt = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
+				<&gcc GCC_BLSP2_AHB_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_uart2_default>;
+			pinctrl-1 = <&blsp2_uart2_sleep>;
+			status = "disabled";
+		};
+
+		blsp_i2c7: i2c@f9963000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9963000 0x500>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				<&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c7_default>;
+			pinctrl-1 = <&i2c7_sleep>;
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
+				<&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <100000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c5_default>;
+			pinctrl-1 = <&i2c5_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gcc: clock-controller@fc400000 {
 			compatible = "qcom,gcc-msm8994";
 			#clock-cells = <1>;
@@ -337,6 +432,20 @@ blsp1_uart2_sleep: blsp1-uart2-sleep {
 				bias-pull-down;
 			};
 
+			blsp2_uart2_default: blsp2-uart2-default {
+				function = "blsp_uart8";
+				pins = "gpio45", "gpio46", "gpio47", "gpio48";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			blsp2_uart2_sleep: blsp2-uart2-sleep {
+				function = "gpio";
+				pins = "gpio45", "gpio46", "gpio47", "gpio48";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_clk_on: clk-on {
 				pins = "sdc1_clk";
 				bias-disable;
@@ -397,6 +506,21 @@ i2c2_sleep: i2c2-sleep {
 				bias-disable;
 			};
 
+			i2c5_default: i2c5-default {
+				/* Don't be fooled! Nobody knows the reason why though... */
+				function = "blsp_i2c11";
+				pins = "gpio83", "gpio84";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c5_sleep: i2c5-sleep {
+				function = "gpio";
+				pins = "gpio83", "gpio84";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			i2c6_default: i2c6-default {
 				function = "blsp_i2c6";
 				pins = "gpio28", "gpio27";
@@ -410,6 +534,35 @@ i2c6_sleep: i2c6-sleep {
 				drive-strength = <2>;
 				bias-disable;
 			};
+
+			i2c7_default: i2c7-default {
+				function = "blsp_i2c7";
+				pins = "gpio43", "gpio44";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c7_sleep: i2c7-sleep {
+				function = "gpio";
+				pins = "gpio43", "gpio44";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c13_default: i2c13-default {
+				/* Not a typo either. */
+				function = "blsp_i2c5";
+				pins = "gpio23", "gpio24";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c13_sleep: i2c13-sleep {
+				function = "gpio";
+				pins = "gpio23", "gpio24";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 	};
 
-- 
2.27.0

