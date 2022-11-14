Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976FC627AC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236178AbiKNKmk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:42:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236081AbiKNKmj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:42:39 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D1F1D66F
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:38 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id l8so12559994ljh.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9OMoKQnRn0IQNyaI5drIYf1dFeHggeskHv0qAn+c0c=;
        b=gcH1G3kIvFv3+kJLRtZk9UbdP3D7mLKfxS2H+Hau1foq4KHzuDQRNYuSuL7700l7dD
         WeOj1zXqQHE7RVt8gBfSUIh03AvFf4HjQ1SRXDR8Pv4M+jdWZx4NDKVCK8RoYqvir3gg
         gmHTxOmn5IqaQQVNW1c4Zsi7KKF+sNiaZMxUc2Ol87Q78JZYYrHxFVqplUmjBgLYO7mC
         KrSdylXotE94kwNNcsfVun3J//utN0UfM7oRI3ymW0/K9xW0/bJL4h0d9xUxHUGSybKB
         nWQ00vfPdj7ekC7q9oJGXAU0QUjbgl6g7JVriv/RIdyH5lSeBREA0TMjoNxf/MqIZZD2
         iR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9OMoKQnRn0IQNyaI5drIYf1dFeHggeskHv0qAn+c0c=;
        b=RIAXImLPtKZjdZNVPAOcHoTfDWTpfcJ3gcr0NfIKGrmhlvZuqazPrq2LADipdrZQxk
         uf7kbq3XxEfg4LoMIGmNr1w3yCu1dQkEjoAx6fSoQQjx5dIIuOUd90vxGt7WQtA5QFul
         X/Oc+mkpHTHprhw+1Vum9C3ePcgRvnHjD/n4ZMmYU4PVZv9oiqyYVnE8suhy4CKVklI1
         qyrxeZ04nv36Uwt3x8uQWRpDWPiW+yZA3skR5vUnXoo8U+uh0IX4A3zv46NuwTSRnzTa
         o2BVvf6EXvp1f/vaQO+nKR2fjd8jI8navuIwLiHd2hZOfu87H83A6WV5zgrAugc3R/Fu
         m8qw==
X-Gm-Message-State: ANoB5pleJpRXqEVC/t5mXcyZT9OnrDyIAEPY1ViKRGi8enhLMjNiD5iv
        lNs7j2kijkjbOL75F4y8u2xpJKmuPoZcuSc3
X-Google-Smtp-Source: AA0mqf7Vkp2TzuTA1SQtFI0RblgtdA6XeyIc5OBN/51KC8kVgJuE/1zjT9Q9CxSxdoltPaDmfC3ptw==
X-Received: by 2002:a2e:888f:0:b0:277:515b:3dcd with SMTP id k15-20020a2e888f000000b00277515b3dcdmr3757314lji.501.1668422557360;
        Mon, 14 Nov 2022 02:42:37 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id bs21-20020a05651c195500b0026c4e922fb2sm1946486ljb.48.2022.11.14.02.42.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:42:36 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] arm64: dts: qcom: sm6375: Add GPI DMA nodes
Date:   Mon, 14 Nov 2022 11:42:16 +0100
Message-Id: <20221114104222.36329-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221114104222.36329-1-konrad.dybcio@linaro.org>
References: <20221114104222.36329-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for GPI DMA hosts on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
No changes since v1.

 arch/arm64/boot/dts/qcom/sm6375.dtsi | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 9b1a497e5ca7..62a64dd731a0 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -567,6 +567,46 @@ rpm_msg_ram: sram@45f0000 {
 			reg = <0 0x045f0000 0 0x7000>;
 		};
 
+		gpi_dma0: dma-controller@4a00000 {
+			compatible = "qcom,sm6375-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x04a00000 0 0x60000>;
+			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <10>;
+			dma-channel-mask = <0x1f>;
+			iommus = <&apps_smmu 0x16 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
+		gpi_dma1: dma-controller@4c00000 {
+			compatible = "qcom,sm6375-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x04c00000 0 0x60000>;
+			interrupts = <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <10>;
+			dma-channel-mask = <0x1f>;
+			iommus = <&apps_smmu 0xd6 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
 		usb_1: usb@4ef8800 {
 			compatible = "qcom,sm6375-dwc3", "qcom,dwc3";
 			reg = <0 0x04ef8800 0 0x400>;
-- 
2.38.1

