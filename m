Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D834600221
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiJPRWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbiJPRWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:22:36 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312A6303EE
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:22:34 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id mg6so6257441qvb.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFj0tarFqSx3s6Y+E4chkx9Vjwt5TrnQF9RepFZJY9I=;
        b=eOKtAx1eo49sNhycPR9zNN7BHHDIRhh6VhpnchbtriXkU7IgTi9YpCtWZZ9WYiWYit
         ymgbAzv86AlInl83Eq1IraAOpW/B8vOGtp2zQDGNREsf8MBjc6JwAeoyzMuGz11Zl+bP
         rBEcGGaqsPc644qhAMh1u85oSTKGksxAORJRAdOKNRkiuO1J+ObyhokD4P7AX7gCX8fD
         dL5LYmdFktI4taMm4xBWCsiOKEHPchTPsRMRsffPkrgRi05VRiNGkrvmarRl6Ig9oj85
         uqvz7Wtt9xluVA2ldHmQpYMNMuzt5fY6B72aHZ5FIqr9t8GqpeD4j+wr01lbV9fe+lT8
         umAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFj0tarFqSx3s6Y+E4chkx9Vjwt5TrnQF9RepFZJY9I=;
        b=GfCneU2koFLDyiYqVZI3kwlI75us9Skgl8ti4KcY/1BDEF5CJ0lt+PiJtqeYN1cQqi
         lLt2qHFuXCWBNDH9TsnPMxCXpqmzEnG3rwxEvAoy044coEYPp6u3ZPEvSOzR3ydlDzvG
         DNeHiWJjAeAGjqMJdPtudSzD9638Do5V8A6IQPWkepLev8MeKqCStFxnmFj+N6FSM/lO
         3InXSp1KmxUHqyUITsmmb2KXdG7qbq8yeOwWjBJTkCKA3fUvgAEmJX/Hpqq7qzGhVK1p
         NqyhIwD0PqGRlklWR7f6gLjA4LdDBWJf2YE9C1YG0VNWPWzMEL725oQPYO/f8+YolNsg
         yTDQ==
X-Gm-Message-State: ACrzQf3HVzQGAEG5KZQgSop82OdbIVkk/1td3koVnP7uM/doydkUHZxJ
        TIVh02LlKrwg9jO9B46zIsXXgA==
X-Google-Smtp-Source: AMsMyM55RgRGTHcoNYpgKLNB89jmGDKjXr98HpgYPRV3CsekYPfRXlb2yhq5phun7kgWhy6TZcoGUg==
X-Received: by 2002:a0c:ab18:0:b0:4ac:d471:7b83 with SMTP id h24-20020a0cab18000000b004acd4717b83mr5800315qvb.102.1665940953373;
        Sun, 16 Oct 2022 10:22:33 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r5-20020ac87945000000b003431446588fsm6051008qtt.5.2022.10.16.10.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:22:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 02/17] arm64: dts: qcom: sm8250-sony-xperia-edo: fix touchscreen bias-disable
Date:   Sun, 16 Oct 2022 13:21:57 -0400
Message-Id: <20221016172212.49105-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
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

The property to disable bias is "bias-disable".

Fixes: e76c7e1f15fe ("arm64: dts: qcom: sm8250-edo: Add Samsung touchscreen")
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 72162852fae7..601a21c381f8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -613,7 +613,7 @@ ts_int_default: ts-int-default-state {
 		pins = "gpio39";
 		function = "gpio";
 		drive-strength = <2>;
-		bias-disabled;
+		bias-disable;
 		input-enable;
 	};
 
-- 
2.34.1

