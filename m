Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72BF55FFA70
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 16:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiJOOF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 10:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiJOOFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 10:05:25 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A1B2D1F8
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 07:05:23 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id b25so4207668qkk.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4zWvzs68p5BPYM5JKflvb3VPjPI+2iS6MVDVGF9yhQ=;
        b=nkF0utl/VFDBh+6j5eD2vwQCw4MIV8HaFqd6zYNTfxdSXTHMmcnb9tJsxzXkjcBU/W
         ErhrrvdCEsOWEsQRD+IaVtmukjI+NZ68rDhzS9bzFc3grls6h2qXqCZoXzptSJvEA5IH
         zCG5fL3Yd8+QVdNUuOCzuV3/JDpq1VldwXVEYq8VK5Jh52UnuvvVIV9Ut3rQBZzj5SEo
         UDkF8Yqs12+5RIT1znLmbuXVbiNlqUORIgbk5pgFTmKC7iFgYRbDfAKj0+huveMP6tdQ
         xE5D50zh1M3z83CLZWtpVOzl84H6vL/Lv6BPFsBWDbEoesGkspuEniNZwsgfK/qimowl
         G/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4zWvzs68p5BPYM5JKflvb3VPjPI+2iS6MVDVGF9yhQ=;
        b=Uo7UAOt3X4mbtstPwAtrJtLXIal+oD3iMRtjkfeNz686iU/warNBTsfXJjv7c4fiIs
         6SYLfASSMqgREjxIuDKnZ7egZC4CNG2NK1SFsVzGWo8KNnoD3R9+a6YZNSQo1hyRAi8/
         a0iMlov/pRGtvlIQW+ZeP9Wqp9/WY6dG8PViOZVvTyLdhC8Fdfvde0gW4OpyzMAZDmeD
         9LxSDJjKV3/7myxAXZAweiBBp0PKWQoLtAlKMRR97xsV88BXpUDYySbMHlve0LNWAfwU
         ZATZa1X+F9gf1QbW88HQjc9eeI/ISZcVYMBAnhFXvza86qerI/jB0DQxfiQnHgfgnSkF
         UbzQ==
X-Gm-Message-State: ACrzQf2L+y85gWxizUwBq45ma+y2LRcvN4yqZ+lLjJHMrX8fo8rBIfrt
        ZLk1Ky5KxZKPODINxDRdQLn4Cw==
X-Google-Smtp-Source: AMsMyM7PlW2yjEIyCuzgAyQpwxlt5f5/c2FPVPw3Sh+fSG/GwfaWtDrZjGW7arddbYODSvc/BmRzyw==
X-Received: by 2002:a05:620a:f15:b0:6cf:2130:88e3 with SMTP id v21-20020a05620a0f1500b006cf213088e3mr1861019qkl.519.1665842723580;
        Sat, 15 Oct 2022 07:05:23 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id s21-20020a05620a29d500b006bb78d095c5sm4958022qkp.79.2022.10.15.07.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Oct 2022 07:05:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/5] arm64: dts: qcom: sc7280: Add GPI DMA compatible fallback
Date:   Sat, 15 Oct 2022 10:04:45 -0400
Message-Id: <20221015140447.55221-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015140447.55221-1-krzysztof.kozlowski@linaro.org>
References: <20221015140447.55221-1-krzysztof.kozlowski@linaro.org>
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

Use SM6350 as fallback for GPI DMA, to indicate devices are compatible
and that drivers can bind with only one compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 212580316d3e..2a167412fa6a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -920,7 +920,7 @@ opp-384000000 {
 
 		gpi_dma0: dma-controller@900000 {
 			#dma-cells = <3>;
-			compatible = "qcom,sc7280-gpi-dma";
+			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0 0x00900000 0 0x60000>;
 			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
@@ -1419,7 +1419,7 @@ uart7: serial@99c000 {
 
 		gpi_dma1: dma-controller@a00000 {
 			#dma-cells = <3>;
-			compatible = "qcom,sc7280-gpi-dma";
+			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0 0x00a00000 0 0x60000>;
 			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.34.1

