Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9784C734289
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 19:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346290AbjFQRQb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 13:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346301AbjFQRQN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 13:16:13 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C856B1BC9
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:16:04 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51a2c8e5a2cso2648045a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687022163; x=1689614163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NKCLAsoWzo4o8SiOtd/MHIrYE5KoieevxsspTn10cA=;
        b=a52hFiJ4hp64V7SsoOkw4lp7vXwbRffYGaGbe9FEdGoVQ3+zWvJuwJUBVVL6M9xPl3
         5UD4kTLUVKYpSwrJgu82LLv1c1KdcXui4QJfOepHvfUImvtZ0pYuxe2naaBfpI5/LH+X
         RI0rpPTftI5ThLNiK3jn4tK6D5MZhl0HxvhoaQMJIBi7hPjJ2M2ARvyXxHtV6D2kDFMx
         clE1o5soANkpsKKwjEURoyIc8i20VM3GuGCWfRApSnzfINua4xuyQf80Vmmkw9Z7gGeJ
         cw5zHg9yt7UXmcNfmDCJdo1zOJn6na+vGHTfrml9x5M6i8lZ0YENYRf2ea+u9bn5kGvq
         liHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022163; x=1689614163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NKCLAsoWzo4o8SiOtd/MHIrYE5KoieevxsspTn10cA=;
        b=dhdKg/QLegVikImoo8Vw40GyAZ4bN0oWOHO9BEN9j0tGe7PBV0Ly6yE0bVWioCE41G
         mcj1zIlJCoFovaoqlGzTwnDU/9NJUTAw7r/KH8Jx6Pt5nLMLWlOaN8IeEg0j50OPDqJ1
         dDvElFn69swuknfo4MZ9+8IbA8U0v6W4aR0xJQjd8CNm8KzRwKYM2zgGr7LlIQkjscgN
         1U0tX+/OijMHxpzc8olH50cZCApQ/KG0ifDekoK3igmJJWxGJXS0cjRTlCHEK+YLRRwF
         saPZLasGmFtuVJIrZQsXfu9FqvonjYPA9Vj4oqs0nesZKEmzZSQx5Mp2XNbIKRpSeUIc
         XQnw==
X-Gm-Message-State: AC+VfDxWS7D31t5DM85czKK7tAPzU0J5Rvb9aJ+XTufSvNd+zrn4sVQd
        JJQb2DmmyCTDO01SV7lDIRgUtQ==
X-Google-Smtp-Source: ACHHUZ6OWIhQdLzx2BO28slt+KfPy2OeYbMzU3rM5066S3kQw66b01AKtw9i0VNb2wdClWIBChOIUA==
X-Received: by 2002:a17:906:b16:b0:978:6634:d05c with SMTP id u22-20020a1709060b1600b009786634d05cmr4620921ejg.21.1687022163304;
        Sat, 17 Jun 2023 10:16:03 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009829dc0f2a0sm3841897ejb.111.2023.06.17.10.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:16:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 14/15] arm64: dts: qcom: sc8180x-flex-5g: align gpio-keys node name with bindings
Date:   Sat, 17 Jun 2023 19:15:40 +0200
Message-Id: <20230617171541.286957-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
References: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bindings except certain pattern for gpio-keys children:

  sc8180x-lenovo-flex-5g.dtb: gpio-keys: 'lid' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 39c6ef0802aa..fca08db89769 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -36,7 +36,7 @@ gpio-keys {
 		pinctrl-0 = <&hall_int_active_state>;
 		pinctrl-names = "default";
 
-		lid {
+		lid-switch {
 			gpios = <&tlmm 121 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_LID>;
-- 
2.34.1

