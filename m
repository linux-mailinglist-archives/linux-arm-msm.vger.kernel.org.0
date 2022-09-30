Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446255F11EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbiI3Swx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbiI3Swt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:49 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36906166F19
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:48 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j16so8215800lfg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ghtPiKNdpbeN+uE2Jr0al/CVda2ZhhQu7LAAvSpvKX8=;
        b=PdLMNnYwWA3NjR81e6usaGsbSPqGmF6hwN8LPg9Gb5pRJPlL1GNPHKc51rQ3VCSci3
         FkK8Sb2SFRUDqQiLgpWtsNkMNAtkfxbmCucD+7EtIwswFMzLMR3OPG0Au9Kdl5cZaREA
         9ulsRADAllkchygfTjX248ygPGW+dwfl4NR+Gj2MHQ//VBE/OPOuXbC6FCgQkzNDtmIK
         oFGWw2EEt5wwPfzv0W2dVIjjydQOAh+TGGB10Q8/Rj3UZp1NsgTsjO4v2u4DtWbzc9Td
         Ox/ENb95PqMRUFAzPSvJ90wSXw+GAp1QL32D6bVBL32Qhw9A7JlUScgHMZHM8xOTeoKu
         ZrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ghtPiKNdpbeN+uE2Jr0al/CVda2ZhhQu7LAAvSpvKX8=;
        b=RUSfjPigQcE40TOPpFF1ENfjCtqx1q6cn1g8t0VNc1YYakzmKlkFSxH9iwksA+WsA8
         3Z4z/0XLvEriE7M4EThx/lKQXf26ZLtluvIP7hs8WL0mSCQfl3M/wIqBSbsRYw9ysRcE
         x0dUYki4II1QoHtkmW93qqWbeBFYpDMGF22AgB7euSscSA2GNIc1fTLokSR65iJ9bCLZ
         UVw4TPdBNg5wN386Wx4G6j4E5CDm52urXL+YRxLET2rMGy4MKz/MO3J7v0QQK1eyb+Gw
         VrAna0pFY4ldaz47kSssKScS+KQYh+5lvmSWdoWZlAHgkNKkLEyccGFeiZ1Yd+ftnydX
         BGPA==
X-Gm-Message-State: ACrzQf3XkuSYxO7c1BVI6O1AhO531BJsk39W48BZmwRWmE7dwIT2UIKF
        rUJUXmYc6+hHUh1tjtln+9TkVYGfASr8Gw==
X-Google-Smtp-Source: AMsMyM7W4FwqAkFOPXFzmksqr0n1FQRqKAWKhYRdX7UHzAQrhA6faVsKMrPcdAfVe0WtVk7EpFNzfA==
X-Received: by 2002:a05:6512:2254:b0:498:f454:ec9a with SMTP id i20-20020a056512225400b00498f454ec9amr3835807lfu.58.1664563966480;
        Fri, 30 Sep 2022 11:52:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 12/23] ARM: dts: qcom: apq8064: drop amba device node
Date:   Fri, 30 Sep 2022 21:52:25 +0300
Message-Id: <20220930185236.867655-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The separate amba device node doesn't add anything significant to the
DT. The OF parsing code already creates ambda_device or platform_device
depending on the compatibility lists. Drop the amba node and reorder
sdcc and sdcc bam nodes according to node addresses.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 131 +++++++++++++---------------
 1 file changed, 62 insertions(+), 69 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index b6f1ef50fb1e..34d3fce17351 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1085,15 +1085,22 @@ sata0: sata@29000000 {
 			ports-implemented = <0x1>;
 		};
 
-		/* Temporary fixed regulator */
-		sdcc1bam: dma-controller@12402000{
-			compatible = "qcom,bam-v1.3.0";
-			reg = <0x12402000 0x8000>;
-			interrupts = <0 98 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc SDC1_H_CLK>;
-			clock-names = "bam_clk";
-			#dma-cells = <1>;
-			qcom,ee = <0>;
+		sdcc3: mmc@12180000 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00051180>;
+			status = "disabled";
+			reg = <0x12180000 0x2000>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
+			clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
+			clock-names = "mclk", "apb_pclk";
+			bus-width = <4>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <192000000>;
+			no-1-8-v;
+			dmas = <&sdcc3bam 2>, <&sdcc3bam 1>;
+			dma-names = "tx", "rx";
 		};
 
 		sdcc3bam: dma-controller@12182000{
@@ -1106,6 +1113,25 @@ sdcc3bam: dma-controller@12182000{
 			qcom,ee = <0>;
 		};
 
+		sdcc4: mmc@121c0000 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00051180>;
+			status = "disabled";
+			reg = <0x121c0000 0x2000>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
+			clocks = <&gcc SDC4_CLK>, <&gcc SDC4_H_CLK>;
+			clock-names = "mclk", "apb_pclk";
+			bus-width = <4>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <48000000>;
+			dmas = <&sdcc4bam 2>, <&sdcc4bam 1>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sdc4_gpios>;
+		};
+
 		sdcc4bam: dma-controller@121c2000{
 			compatible = "qcom,bam-v1.3.0";
 			reg = <0x121c2000 0x8000>;
@@ -1116,67 +1142,34 @@ sdcc4bam: dma-controller@121c2000{
 			qcom,ee = <0>;
 		};
 
-		amba {
-			compatible = "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			sdcc1: mmc@12400000 {
-				status = "disabled";
-				compatible = "arm,pl18x", "arm,primecell";
-				pinctrl-names = "default";
-				pinctrl-0 = <&sdcc1_pins>;
-				arm,primecell-periphid = <0x00051180>;
-				reg = <0x12400000 0x2000>;
-				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
-				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
-				clock-names = "mclk", "apb_pclk";
-				bus-width = <8>;
-				max-frequency = <96000000>;
-				non-removable;
-				cap-sd-highspeed;
-				cap-mmc-highspeed;
-				dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
-				dma-names = "tx", "rx";
-			};
-
-			sdcc3: mmc@12180000 {
-				compatible = "arm,pl18x", "arm,primecell";
-				arm,primecell-periphid = <0x00051180>;
-				status = "disabled";
-				reg = <0x12180000 0x2000>;
-				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
-				clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
-				clock-names = "mclk", "apb_pclk";
-				bus-width = <4>;
-				cap-sd-highspeed;
-				cap-mmc-highspeed;
-				max-frequency = <192000000>;
-				no-1-8-v;
-				dmas = <&sdcc3bam 2>, <&sdcc3bam 1>;
-				dma-names = "tx", "rx";
-			};
+		sdcc1: mmc@12400000 {
+			status = "disabled";
+			compatible = "arm,pl18x", "arm,primecell";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sdcc1_pins>;
+			arm,primecell-periphid = <0x00051180>;
+			reg = <0x12400000 0x2000>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
+			clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
+			clock-names = "mclk", "apb_pclk";
+			bus-width = <8>;
+			max-frequency = <96000000>;
+			non-removable;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
+			dma-names = "tx", "rx";
+		};
 
-			sdcc4: mmc@121c0000 {
-				compatible = "arm,pl18x", "arm,primecell";
-				arm,primecell-periphid = <0x00051180>;
-				status = "disabled";
-				reg = <0x121c0000 0x2000>;
-				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
-				clocks = <&gcc SDC4_CLK>, <&gcc SDC4_H_CLK>;
-				clock-names = "mclk", "apb_pclk";
-				bus-width = <4>;
-				cap-sd-highspeed;
-				cap-mmc-highspeed;
-				max-frequency = <48000000>;
-				dmas = <&sdcc4bam 2>, <&sdcc4bam 1>;
-				dma-names = "tx", "rx";
-				pinctrl-names = "default";
-				pinctrl-0 = <&sdc4_gpios>;
-			};
+		sdcc1bam: dma-controller@12402000{
+			compatible = "qcom,bam-v1.3.0";
+			reg = <0x12402000 0x8000>;
+			interrupts = <0 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC1_H_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
 		};
 
 		tcsr: syscon@1a400000 {
-- 
2.35.1

