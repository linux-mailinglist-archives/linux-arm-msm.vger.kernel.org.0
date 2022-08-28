Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3755A3CB7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 10:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiH1Inw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 04:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbiH1Int (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 04:43:49 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8F62E6B0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 01:43:47 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bt10so7389931lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 01:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=BwrZ2c2UMynez79/uX/IH+O3M1xg1bp1S2/B0MtZ26c=;
        b=RE3Ti2Yrm1xNE7p2UwyKIMjxDR5UaZSOIHrmOFw9bi8f3MijshAf87/X+BsjnbQA/b
         WNLWPVWhvfnOra2c/zcQYIm/YJf6Q3tv0GiktIR68pULIScwPl506dQ7iiaW9h5dvp5z
         yfapULT0RUCOmQpVLEYE2Td7MjNQEzzeya0uJXIULXc4FJhC/beKeSJ7fJEMgHfGgcFE
         Y6/2kPabPx/6MhaCRAWCiqdNaR/NU/9KOnC86Q3LRVP1Lk412qQ+Dwjz0yb5fAwwfuvR
         SKxefZS+fODLs3rmtYlHpw/p410NaUppWXOA1EdXM2ysMOi1QVo42tXwHpNYmlhC7RdW
         LeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=BwrZ2c2UMynez79/uX/IH+O3M1xg1bp1S2/B0MtZ26c=;
        b=63uA7PL9Qcmac6qnwHmQaZEpKpUNWGTkh+w5pLg91XxuC0WW3A28fbXMLBqgv77ImJ
         LCClHIgp8MCh6oelr487/Pqg3ENx/mQhc8KpqP6lWwzRR1FWHoMSq4Kw6zPxq01JvVdc
         GM/cfMbIuITmTb1/tjV2GPHRb3iBvPCaWujJqmgP0tV30rZo/nYMaOi2ZkREAnGf/GHe
         B7+7HZR/P4//wxLWZWiomnh0hRan66tEexo/7yZACkouTZaNoqBjO5TS8EawyTtjQd8p
         VKpjI/SGFTqU0Wl3Yd1NTCIy6lXlYXSGQsYlrw238R1FiLUn7wu9b+TBo2ff6nf/zsZB
         45Lw==
X-Gm-Message-State: ACgBeo37BqAdSGeAoMLLMopLdryIFW98ATszY/VgvZ/68ub7/7nZMOzT
        iAqr1I6zpFI/H7J0pNlbzrvbaA==
X-Google-Smtp-Source: AA6agR5noPH2UZSc4lvUOl0ln3iSENJepwlr6kWdvTlYCbBJm3yTy4eRCeDaFX9XntT7UV/zw1AqmQ==
X-Received: by 2002:a05:6512:2507:b0:494:6ada:3beb with SMTP id be7-20020a056512250700b004946ada3bebmr295785lfb.21.1661676226179;
        Sun, 28 Aug 2022 01:43:46 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id c6-20020ac25f66000000b0048afe02c925sm890114lfc.219.2022.08.28.01.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 01:43:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/14] ARM: dts: qcom: align SPMI PMIC ADC node name with dtschema
Date:   Sun, 28 Aug 2022 11:43:28 +0300
Message-Id: <20220828084341.112146-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220828084341.112146-1-krzysztof.kozlowski@linaro.org>
References: <20220828084341.112146-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect VADC node name to be "adc":

  pmic@0: 'vadc@3100' does not match any of the regexes

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi  | 2 +-
 arch/arm/boot/dts/qcom-pma8084.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index 59d0cde63251..3e5c85fbed7b 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -93,7 +93,7 @@ pm8941_temp: temp-alarm@2400 {
 			#thermal-sensor-cells = <0>;
 		};
 
-		pm8941_vadc: vadc@3100 {
+		pm8941_vadc: adc@3100 {
 			compatible = "qcom,spmi-vadc";
 			reg = <0x3100>;
 			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm/boot/dts/qcom-pma8084.dtsi b/arch/arm/boot/dts/qcom-pma8084.dtsi
index 7b8a8d9695da..e77602e9f95c 100644
--- a/arch/arm/boot/dts/qcom-pma8084.dtsi
+++ b/arch/arm/boot/dts/qcom-pma8084.dtsi
@@ -56,7 +56,7 @@ pma8084_temp: temp-alarm@2400 {
 			io-channel-names = "thermal";
 		};
 
-		pma8084_vadc: vadc@3100 {
+		pma8084_vadc: adc@3100 {
 			compatible = "qcom,spmi-vadc";
 			reg = <0x3100>;
 			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1

