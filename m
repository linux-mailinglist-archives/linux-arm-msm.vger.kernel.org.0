Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90C9D62BA68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbiKPK6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbiKPK5r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:57:47 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FA35B87A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:45:54 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id y16so29217205wrt.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9g25qNCBIUHT51T+M0N+3Z83ZCPC1BfHTVXUX8mD9o=;
        b=BF75qh0qeoBQr6qPLKT0ZEqFb35VKd+2T/E9t+wObkkMzaJUDEI1qNn2vKglNu0TAH
         XQ4s30vmFvuA+zXf38VZD3W5zl0vNHA6wI2Z/E7pdLgHiRd9gxMPAthIT/VCrW2oytJw
         4ipjipo4hff9GdlzcdllzTYPYEKoVfRaWEyzg5OooC8be9Ud9WbhZGoK7M297ckWrblT
         gBNmhFn2KoRtNDCyNrfKRfOqgBkULKs7aXT6L/nG+XY56fbp587ipYzaKoWujCICnBu7
         BDA+3k0XqSefOWQGsS6UiJrhEF07id4wm8G7Csau3P511ZqUuUVgU2T/VyR7PkJP2Vv1
         wUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9g25qNCBIUHT51T+M0N+3Z83ZCPC1BfHTVXUX8mD9o=;
        b=6LA650HBIfDkCSazS8c3WpYZ0MKhgs3cmeyaEUb2LDlqcAZqCA8joeMqLlsOhJs+wo
         uliC4YkJVHg30Ja2dG9OLfY55VgryB5pWNFptXGkwfQbPGkupauEBKYoGeO8JuH2gJAt
         VMlHhUJuw5aBHCytQumwBxr3rEQtnHwbMLGkf8pUECkSrTWCVdGkvMghR4dWGcF2WDUX
         aBsebe28Yo3FHo6Gj3fsU+yLXLzyczlV6vCg16fIVs7TunHMpeLf/hhhPwjr3aZnuK0t
         HLeUxV6LFPutKmbl8dy3QsdoTL9Odt6OW23Wh57uoEnBtz+qJBrcs3h1AYW2TdwXJn+H
         PXfw==
X-Gm-Message-State: ANoB5pkDJbaamNHuCBhjaYdhXA48bOhbXomFbMRF8R3YSojnnlW5HYC1
        2RWLEd44DQzbEJ7O0b/ilAROSg==
X-Google-Smtp-Source: AA0mqf4eIAd49CIPFWcNQeWNQusRjbd4tWXECbo7pQSgTfq+2fQqAVPXZp0oMA76FqPwiXj++ZNxNA==
X-Received: by 2002:adf:aa8c:0:b0:236:9bad:3da0 with SMTP id h12-20020adfaa8c000000b002369bad3da0mr13113218wrc.234.1668595552285;
        Wed, 16 Nov 2022 02:45:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r2-20020a5d6942000000b0022e47b57735sm14960534wrw.97.2022.11.16.02.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:45:51 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:45:50 +0100
Subject: [PATCH] arm64: dts: qcom: sm8550: add I2C Master Hub nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221115-topic-sm8550-upstream-dts-gpi-qup-v1-0-86a60cf3e57d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the I2C Master Hub wrapper and I2C serial engines nodes.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Depends on:

- I2C Master Hub bindings [1]
- SM8550 base DT [2]

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

[1] https://lore.kernel.org/all/20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org/
[2] https://lore.kernel.org/all/20221116103146.2556846-1-abel.vesa@linaro.org/
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 181 +++++++++++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 07ba709ca35f..e10ec73d66ab 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -985,6 +985,187 @@ spi15: spi@89c000 {
 			};
 		};
 
+		i2c_master_hub_0: geniqup@9c0000 {
+			compatible = "qcom,geni-se-i2c-master-hub";
+			reg = <0x0 0x009c0000 0x0 0x2000>;
+			clock-names = "s-ahb";
+			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			i2c_hub_0: i2c@980000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00980000 0x0 0x4000>;
+				clock-names = "se", "core";
+				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
+				         <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hub_i2c0_data_clk>;
+				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+					        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c_hub_1: i2c@984000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00984000 0x0 0x4000>;
+				clock-names = "se", "core";
+				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
+				         <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hub_i2c1_data_clk>;
+				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+					        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c_hub_2: i2c@988000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00988000 0x0 0x4000>;
+				clock-names = "se", "core";
+				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
+				         <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hub_i2c2_data_clk>;
+				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+					        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c_hub_3: i2c@98c000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x0098c000 0x0 0x4000>;
+				clock-names = "se", "core";
+				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
+				         <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hub_i2c3_data_clk>;
+				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+					        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c_hub_4: i2c@990000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0x0 0x00990000 0x0 0x4000>;
+				clock-names = "se", "core";
+				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
+				         <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hub_i2c4_data_clk>;
+				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+					        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c_hub_5: i2c@994000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0 0x00994000 0 0x4000>;
+				clock-names = "se", "core";
+				clocks = <&gcc GCC_QUPV3_I2C_S5_CLK>,
+				         <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hub_i2c5_data_clk>;
+				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+					        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c_hub_6: i2c@998000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0 0x00998000 0 0x4000>;
+				clock-names = "se", "core";
+				clocks = <&gcc GCC_QUPV3_I2C_S6_CLK>,
+				         <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hub_i2c6_data_clk>;
+				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+					        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c_hub_7: i2c@99c000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0 0x0099c000 0 0x4000>;
+				clock-names = "se", "core";
+				clocks = <&gcc GCC_QUPV3_I2C_S7_CLK>,
+				         <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hub_i2c7_data_clk>;
+				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+					        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c_hub_8: i2c@9a0000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0 0x009a0000 0 0x4000>;
+				clock-names = "se", "core";
+				clocks = <&gcc GCC_QUPV3_I2C_S8_CLK>,
+				         <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hub_i2c8_data_clk>;
+				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+					        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c_hub_9: i2c@9a4000 {
+				compatible = "qcom,geni-i2c-master-hub";
+				reg = <0 0x009a4000 0 0x4000>;
+				clock-names = "se", "core";
+				clocks = <&gcc GCC_QUPV3_I2C_S9_CLK>,
+				         <&gcc GCC_QUPV3_I2C_CORE_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hub_i2c9_data_clk>;
+				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+					        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+		};
+
 		gpi_dma1: dma-controller@a00000 {
 			compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
 			#dma-cells = <3>;

---
base-commit: a237afe452d9079aa024e465642b4cde0a04c7ff
change-id: 20221115-topic-sm8550-upstream-dts-gpi-qup-ba5e8fdb77a5

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
