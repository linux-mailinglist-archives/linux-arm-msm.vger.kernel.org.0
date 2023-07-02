Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43E15744DEC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjGBNno (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjGBNnn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:43 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B09BE6C
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:38 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b6c5ede714so42944441fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305416; x=1690897416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPTMLMDP3qi8FUIpipjx2Ww6NVhPh5E2iKLf2ZieppU=;
        b=xiYdkjwdbtUalNEW6fE/6BBLQCgXlhY2zFDp92MC4G+Gb2eb/grJs/HAGVNNGzR0zC
         bNaCgLn08Bf82oGbHSXCEtzAmL/JhW/mFSDt+KHSawdzyLKUGGf/vYFclNjKD/3A2j84
         qyNeXWytfDWD9dkccNng3ieUUgkDcIW0UEMO46UmWJGaHS8608KiJoRs7RnCItAyVgL5
         uOYNO+aQHC87mcpRFg7/gcBkqPfgAm0nWlrKqPUaeS99LtOAfTHD8/CcxPODsG7AixZi
         8jJbc/nb8DOWqlTvo1jnXqMwmw7gpQQW1N25Hvs+0XMbyY0MGYvYl4Qx26/kzXucFKXD
         NdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305416; x=1690897416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPTMLMDP3qi8FUIpipjx2Ww6NVhPh5E2iKLf2ZieppU=;
        b=EJFw08jXFEIhtqXbWQRs9fGNLutd/k9rgwNSD/5n+6zIuYQsR9FA7UEJCQUG2BaIwJ
         sjPzLmAQFO+IXw0FfCZEx8Pg6yzmDs5RpMlZ/A4JZYFC6+T7D6vbCfJUiqOzOZuKMVmq
         zuB32/elAnTiYp5XGMxACTRIGL8hGDlb71T7HnAWzVpIPxU2CG9IFQvgxwCX2k+EmUbT
         YxxotypsEdNfx/p+TvEyKZvunoENmUBna53qdSgUADjCjUJiaj7LUwg8idlt2p0CEiPm
         hkR002fjPiVLRnA4bDB/YDg0gb7nEbVrt3kXgkYPcJyFEKXGxbG95Ou5AyCdYTNoEQUN
         r6ng==
X-Gm-Message-State: ABy/qLaeW7XgzNc7kARnK50c4/aXuVoC63y+HF9vvUiyizZTGAbPSZZg
        UJ5RCrspKCz1j9UrrqSk8+KX8/t6kaRmPLAGhBQ=
X-Google-Smtp-Source: APBJJlEuKSB96ern6+3w5/KIhElI83YEtXwsfqNDzRMYBY8I1BfsD6f1oETAiwfUUfKEIpbtyeEHLA==
X-Received: by 2002:a05:651c:231:b0:2b4:50b8:5d3b with SMTP id z17-20020a05651c023100b002b450b85d3bmr2637540ljn.0.1688305416665;
        Sun, 02 Jul 2023 06:43:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 20/27] ARM: dts: qcom: pm8921: switch to interrupts-extended
Date:   Sun,  2 Jul 2023 16:43:13 +0300
Message-Id: <20230702134320.98831-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
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

Merge interrups and interrupt-parent properties into a single
interrupts-extended property.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index fa00b57e28b9..360a179670c5 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -11,9 +11,8 @@ pm8921: pmic {
 		pwrkey@1c {
 			compatible = "qcom,pm8921-pwrkey";
 			reg = <0x1c>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 50 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8921 51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -32,17 +31,15 @@ pm8921_mpps: mpps@50 {
 		rtc@11d {
 			compatible = "qcom,pm8921-rtc";
 			reg = <0x11d>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 
 		pm8921_keypad: keypad@148 {
 			compatible = "qcom,pm8921-keypad";
 			reg = <0x148>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
-				     <75 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 74 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8921 75 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
-- 
2.39.2

