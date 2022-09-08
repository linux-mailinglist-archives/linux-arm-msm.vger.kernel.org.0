Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E985B1684
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 10:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbiIHILw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 04:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbiIHILa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 04:11:30 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C01DD6B89
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 01:10:56 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bt10so26455078lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 01:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PJbpYZIK/ukZdU6JLZ2ZujLhJDK9nbNxC4aQpIphNls=;
        b=c65J9xPMG4lGx34h65unL/PVv1/H6KL2VEEyH/fb9WY7Uwexs8VGZ1NM2hppdvIp54
         17SJgdyFGOFaJR51y6J8icZ5UGB+Tq/1GyhdOjK1bejHPuWLpIl5q5FjB7gDj38LrjdH
         1XvcaR5fp+GRcin2dZzRk+J8ysloz07/+3IwoTNFpGmXsbL1ekCR8cKtzM+sdx4FfeiL
         pq2rULvEADg62/CSn+LFdMYd7MHVCA40p80Urvcd+VtotI9YuR5nu+KstvKUBs8JqtJ8
         ZO++tcd5e+gpFPzpXj73c/ZGd880x8MrCh2bdL420kmtWYrV8eJRx9mFyNUjgRc17N0V
         JbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PJbpYZIK/ukZdU6JLZ2ZujLhJDK9nbNxC4aQpIphNls=;
        b=upzdR35LoIA3rhLeHrzc4WqG46dNnUc3Zk4DIWQxwceQM4rhnnNQ/c53qA4OWau4Yo
         rUO/sFN1KhCl80C527gbtHEjxWlwnlwMxe+j7shLiySU2yQf7V7Faobh64F6UNjJ3l6y
         U6ukIGMoJferZpEsN5rZErRYm5cflfWjkpDaQwzO5xmeyRQFmgxLI+NIT2lmSZjeNXoT
         LDoaDbdE53yqKXtJdELm6wT393Kz7CumEZ2vZ+L1SikvzMMlo6JSTtVyq+RJNW7QqvO/
         pH/kkCndsdUsOV8oREYTlAkhROyw/wmTFtjCEdmGyG7LFM1OspDGToYEcoo8A4qtANbe
         PdSg==
X-Gm-Message-State: ACgBeo33OHIP05Yc/Iy/PEU0hwoGAblqBZ4+WVll733Dx7vH8czg1Oj7
        QM9SNvyt/2GsDGhTDul5RyQ8juOwOPFCyA==
X-Google-Smtp-Source: AA6agR4FIvpQxDv8ii7TkRaeMqEZwUkHOOAOV2tPDKUNa4uD419kctyTKCcEaZy5cznE8rZS2QRGnA==
X-Received: by 2002:a05:6512:114f:b0:492:3aec:69f9 with SMTP id m15-20020a056512114f00b004923aec69f9mr2143635lfg.289.1662624655154;
        Thu, 08 Sep 2022 01:10:55 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u18-20020a05651c131200b00261e7e7b698sm3075777lja.123.2022.09.08.01.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 01:10:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] arm64: dts: qcom: msm8994-msft-lumia-octagon: align resin node name with bindings
Date:   Thu,  8 Sep 2022 10:10:47 +0200
Message-Id: <20220908081050.29751-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908081050.29751-1-krzysztof.kozlowski@linaro.org>
References: <20220908081050.29751-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect resin node to be named "resin":

  qcom/msm8992-msft-lumia-octagon-talkman.dtb: pmic@0: pon@800: Unevaluated properties are not allowed ('volwnkey' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index cc45873a820c..d8d732ec1b73 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -499,7 +499,7 @@ pwrkey {
 		linux,code = <KEY_POWER>;
 	};
 
-	volwnkey {
+	resin {
 		compatible = "qcom,pm8941-resin";
 		interrupts = <0 8 1 IRQ_TYPE_EDGE_BOTH>;
 		debounce = <15625>;
-- 
2.34.1

