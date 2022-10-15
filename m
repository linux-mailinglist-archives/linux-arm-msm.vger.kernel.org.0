Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96C6A5FFA7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 16:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiJOOFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 10:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiJOOFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 10:05:34 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57ED433349
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 07:05:28 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id h10so4960434qvq.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRQiXvhJZIJmjGHaRfJj0NmdABZ2+jRov1EykwXk/aY=;
        b=bgACONZ9H602AmqtfdwdaoOLeTQDeDloXCevf6CzGeghcBsSvzSV0FS1AuDHN8PlPu
         yKMRvfc6SrG8hfjXCNzcGnv2OV6F89hskxh8qDSkILB4EodwCdoEmsCZkoqyk1Rb+aJD
         e6LOLtjEClATYkyQmRoVHlFJJFJfCUNU5R71J9y6J4jZ7PLE0JT6b1bwdz8JYAnByg+r
         /tmPZwn0dSSIMN/e8TqXbkThgvboCn+zs2qR8lijRFjLB/WhOJJloM2+jnAC8vIHJRM0
         IPRqXQwYLUBGg2OGQKE8QIRoDhdBnT9ggzbbtAshIr4JWwHc2byUuqgmDRQA+hzZNOAK
         4pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRQiXvhJZIJmjGHaRfJj0NmdABZ2+jRov1EykwXk/aY=;
        b=WE6OkhjEJnIVv7sHdRX8M64sRs+MegqXswXJ2dgZtXwIdc5DhyeemxSiGsNDbNgbZt
         m2JOd+qJ5ThV3jQ7SQn6hS+r1kSgRXiKa4SrG9uA9vLIPHw7xgfGWRbFGGQTENMVEWKs
         S3p2XPDo2lMa3T+XFF40AzSnlWxYs4lq1mkE/NE7l7P2YbH5O7y5u4Ty+J8hlP4lz1CI
         SozsqjpkJ73S51bllJiyKmnNZlcjeJAHI6HR3a4lCkun+LINuv7Qny9+ABWoUzJSk29G
         Ss8WeX4f01SQEfqdA3kb7/et6MkmTDz9YX/aPjwc9usVYAIj4sCFVAbVT3PUnbF3XtNX
         gc3A==
X-Gm-Message-State: ACrzQf1R/FFJjDGo5/cAuQ5fARk6y9Fg32u3UdeUAUj4alTfbjQbM7J+
        6YxRJLMtfR8LxKPbh7R1gKV8iw==
X-Google-Smtp-Source: AMsMyM4FiRDfw8auZQ76tRz9ZxY3JsftlXOzfAhvZV/TOc8ID7uPCiF7OqGEMnqDTzKPi6ZA6GpJbA==
X-Received: by 2002:a05:6214:21cc:b0:4b3:ee7d:e9ab with SMTP id d12-20020a05621421cc00b004b3ee7de9abmr1852222qvh.60.1665842726776;
        Sat, 15 Oct 2022 07:05:26 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id s21-20020a05620a29d500b006bb78d095c5sm4958022qkp.79.2022.10.15.07.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Oct 2022 07:05:26 -0700 (PDT)
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
Subject: [PATCH 5/5] arm64: dts: qcom: sm8450: Add GPI DMA compatible fallback
Date:   Sat, 15 Oct 2022 10:04:47 -0400
Message-Id: <20221015140447.55221-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015140447.55221-1-krzysztof.kozlowski@linaro.org>
References: <20221015140447.55221-1-krzysztof.kozlowski@linaro.org>
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

Use SM6350 as fallback for GPI DMA, to indicate devices are compatible
and that drivers can bind with only one compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d32f08df743d..e01a019d8b23 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -730,7 +730,7 @@ gcc: clock-controller@100000 {
 		};
 
 		gpi_dma2: dma-controller@800000 {
-			compatible = "qcom,sm8450-gpi-dma";
+			compatible = "qcom,sm8450-gpi-dma", "qcom,sm6350-gpi-dma";
 			#dma-cells = <3>;
 			reg = <0 0x800000 0 0x60000>;
 			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
@@ -1058,7 +1058,7 @@ spi21: spi@898000 {
 		};
 
 		gpi_dma0: dma-controller@900000 {
-			compatible = "qcom,sm8450-gpi-dma";
+			compatible = "qcom,sm8450-gpi-dma", "qcom,sm6350-gpi-dma";
 			#dma-cells = <3>;
 			reg = <0 0x900000 0 0x60000>;
 			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
@@ -1394,7 +1394,7 @@ uart7: serial@99c000 {
 		};
 
 		gpi_dma1: dma-controller@a00000 {
-			compatible = "qcom,sm8450-gpi-dma";
+			compatible = "qcom,sm8450-gpi-dma", "qcom,sm6350-gpi-dma";
 			#dma-cells = <3>;
 			reg = <0 0xa00000 0 0x60000>;
 			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.34.1

