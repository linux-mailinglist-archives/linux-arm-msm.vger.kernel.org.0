Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3745F75A9BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 10:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjGTI5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 04:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbjGTIfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 04:35:09 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2205C268C
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:35:06 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b8392076c9so7039551fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689842104; x=1692434104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T3n6tUCMHPsrIoxippvznzODCkM1vMvU1KRQj8ysbNg=;
        b=GKJHHrT5+R257JzbKIpQUcwZSM3nnhOwg/kXx7H7csINJWCZsNc16aU6QZDZjtXKCk
         ZnKUHs2CGk2mJChvzktGaVDcDG9MpIh7f/hVoPuERcetNO7giDywEtegCHhsDhWiihFl
         2ho1IaB99jAa32y6DTUoFjTL/QeGDX1GFddwEehVT0j5KbI1+MlDOxuVzUSgSc5JGZM3
         /gew1ITfHyczYJnyCSSqpKUhxmf/B9JYIHgnfxPR9N+EA81pZC7tojJ8v8TGz6j8K2a3
         Qnzi0Bq72iNSnOTFICfHfF2BhFJ8eq3jmfpcoh52T0tRwPS9i/x+LiIZT1vtrwn7hSq7
         C2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689842104; x=1692434104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3n6tUCMHPsrIoxippvznzODCkM1vMvU1KRQj8ysbNg=;
        b=YqPxhUBaJcCk92X93gA+PDNuOIGT4sYcRSpg+mvYNFKepdzVPYc3RaVd6uEvi1tV8X
         UKSCvrSkcxnEgkXY0Hfiab2uJzQ4lkBb2LbdAwZgSp8sGLpmpHbNRaX0w25UWzBFzsTD
         FMeysuv2bOy0DUiPalRqhNRjpWFoahQQlnFRSUi1uInpGfscIgrsT1xZlIKw6eB2Q9rN
         86Hm0871KjHf7WBKSad9AuoV7CTyRMHTCKKPgBa+ebmAOAgYz4UGdXTqWUXrCwviPqhU
         nNmvZIk8tcsWeuPMDDnEl0mshTz/qQYiijF9Mq8jS2e+VhOExpxyLvtZu9lynnn0kYX0
         sSyg==
X-Gm-Message-State: ABy/qLYCrtyvzbhdNEm2GIeuZ3OYYqLjzaAYQkAaLdk5Y9+0jOpsUIvR
        IsZib+nzS8FUguKdQ3qvdPzQPA==
X-Google-Smtp-Source: APBJJlH4ETSf/WdCbzMV/QgVh1git1HFd/W9lxWIIA4/y7UgWctNqsB6v3hsRfi9c0m8s5BFpxHMMQ==
X-Received: by 2002:a2e:9901:0:b0:2b6:df6b:84c0 with SMTP id v1-20020a2e9901000000b002b6df6b84c0mr1278557lji.25.1689842104412;
        Thu, 20 Jul 2023 01:35:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h3-20020a5d4fc3000000b00314329f7d8asm627060wrw.29.2023.07.20.01.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 01:35:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: dts: qcom: sc8180x-pmics: add missing qcom,spmi-gpio fallbacks
Date:   Thu, 20 Jul 2023 10:34:57 +0200
Message-Id: <20230720083500.73554-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPIO children of PMICs should use qcom,spmi-gpio fallback:

  sc8180x-primus.dtb: pmic@0: gpio@c000:compatible: ['qcom,pmc8180-gpio'] is too short

Fixes: d3302290f59e ("arm64: dts: qcom: sc8180x: Add pmics")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
index 4556af6cd103..ef2f8b732833 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
@@ -142,7 +142,7 @@ rtc@6000 {
 		};
 
 		pmc8180_gpios: gpio@c000 {
-			compatible = "qcom,pmc8180-gpio";
+			compatible = "qcom,pmc8180-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -300,7 +300,7 @@ pmc8180c_adc_tm: adc-tm@3500 {
 		};
 
 		pmc8180c_gpios: gpio@c000 {
-			compatible = "qcom,pmc8180c-gpio";
+			compatible = "qcom,pmc8180c-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.34.1

