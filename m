Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75FE660365E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 01:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiJRXEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 19:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiJRXEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 19:04:06 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E915EBD059
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 16:03:59 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id i12so10323688qvs.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 16:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFEHWgfFOmc7/ns5d+9E6vTdQjojEKv8ERpBj6Irj/M=;
        b=Ntti7AEVeOd6Gj5CsDEXJCp29pglpn/ynCUnRIzWH0M/HTAXRRQPRECiGMAvc9DrhE
         dFQwf+uHp7Oag9Tl95YGTgDtMeGkdh+w6BTKRnZ/R6APILD8tItIUzx9BYYX7nD+n71Y
         h+YuYx3W9Wef82S5Q5QvJqYyztDyhfcHvM0Kx6KqDPVxynaOk7xVv/EqFHh6Gxp82thZ
         LIh523CmmhP3uJONSe/ywIlC5Jv+SBMxE6vYtMqRVE/g8DHQkxOO35ZT3oQukTYicnyW
         +D3s/KcoJeqcFFPKBPtocZ/QOywYl2IvWX2eEu1kph9dQ9Mzag5YccABAgnUdG7w6jSh
         2feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFEHWgfFOmc7/ns5d+9E6vTdQjojEKv8ERpBj6Irj/M=;
        b=G1p8gmM+M5etpm+f1Mcz6oSWQSTsDcvQ91AE+XkbayjLFjkgDdfhHY+qjuhRu89YOz
         bqtMQicx01VcuAsbzKcfWJDYlJQ1c6CU3nI7D41WyS48dvTTotNOcYDjg6ndeYcYGw3u
         htv4m0BIj4T0r47zOoQkTQLkRywHCPhnTJOvpDWadEnO9zGs8dbJ87GE7+qNRmduQ+7U
         777FnFPtxsYNgDb+wu43GzRQyEam//Pz3c1QeOLPx3RW98pLeckMY8VPPZW/CZmOq3vw
         Tu0JdYjVBA2uFmeVqnpwl8jbV6P8bkwcIx6v/sCnoO8KgptvdDTrr6ZOiBVy1dBl0tbU
         pDbw==
X-Gm-Message-State: ACrzQf0vxISRpMKIlUnfe5WSFry01yvazhWpLQjqFc1CHkCv2cRxwOT5
        OTeIH6nUNmzIllwGf4kxQ7nebA==
X-Google-Smtp-Source: AMsMyM5/wcE8Th5OB5VrjcV5Jn2aj1jwbC5BvMKgQXxKVorSnE0bjoPFN48K2svxOrlbol755mXJOA==
X-Received: by 2002:a05:6214:401c:b0:4b2:d527:74a7 with SMTP id kd28-20020a056214401c00b004b2d52774a7mr4241968qvb.10.1666134239096;
        Tue, 18 Oct 2022 16:03:59 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id 134-20020a370a8c000000b006cbcdc6efedsm3279010qkk.41.2022.10.18.16.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 16:03:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 3/5] arm64: dts: qcom: sc7280: Add GPI DMA compatible fallback
Date:   Tue, 18 Oct 2022 19:03:50 -0400
Message-Id: <20221018230352.1238479-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018230352.1238479-1-krzysztof.kozlowski@linaro.org>
References: <20221018230352.1238479-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

