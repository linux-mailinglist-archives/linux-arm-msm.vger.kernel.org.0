Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22FA073428E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 19:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346431AbjFQRQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 13:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbjFQRQO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 13:16:14 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE31C2134
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:16:06 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5186a157b85so2758753a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687022164; x=1689614164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUJBexFXTPwWKH7yZsvSF3vGxHfqWARsgLpggkseDL4=;
        b=QcWCFiiyyJvX3VA/uYU3fiwUDTw9sCAhiJaU2SdbKwb6+EMTaFUii4EB3NEGb+NTd8
         aiGS0omQFe0kdN5JkAxSFTtMI4+dU5q2ftDk/FRSjLj3jU8KTCIUj4qKK3AjBQsyoHoF
         eb8P6BFYoEYxr7PbAg992LaZso5UxZU6/bB6uNy4JTypwzlFvRwXpp3lbX4Tln9Mqvji
         TUDGYbN9ejdF7yiGxlLvz/WTmtAjxCB/u9pRF6Ok8silb0tZrc4xvQVtbGv7htuy2p1X
         JvtJ/I0LY7ChYC7oRLzmlkQZYEOg3gSb8x7Yyt2XH3/zKAvvQ+NZD4zfWbXrMH3FZcW9
         /t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022165; x=1689614165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUJBexFXTPwWKH7yZsvSF3vGxHfqWARsgLpggkseDL4=;
        b=kqkYafV7hQ6LUQh9OX3dU4P/XWm4H50/RB9OyD+AWgjf02gKTPIlw8RX5kfbOPHJn6
         gqhY5uH+3cgjMxu9ANoMbIjxcCcZ6CDwo8rvuCdayzNSPX8AdV7jeTi5DP8Xc5c21c0m
         CU0/4yp5f2jK16zW8+RL4E/j/4wzDq6Jdww+Iv6mlDN4+Y5ZCybii05acfPgCn2mG5cQ
         yr4LY508rcyw9FonTyYVYrbLjmxaK14gOu6oibvae5OuEnSCRUwi3OYHAoQa9Er3CrQ8
         UGnw6uASEJDAAWOBKl6EbDOs+tZBrOcxe/2/j9CqBhO0DdxUqVe5W63iglxUty4nd/8K
         3xYA==
X-Gm-Message-State: AC+VfDzj3TI0VrO35oH1eE51SAm3GlzNYobr7AS0ZgpygCW2OVtYAR0Q
        65c1SMhz9pCq34MVcUyfIQBolQ==
X-Google-Smtp-Source: ACHHUZ7zyUSR9ML6otAiMIYQtn6i8nUnZfLY2CAn3lhtlMreWSlgdKq94ZuipNIlUBwV9n2iiIxC3w==
X-Received: by 2002:a17:907:d0f:b0:94e:4489:f24d with SMTP id gn15-20020a1709070d0f00b0094e4489f24dmr5609501ejc.61.1687022164853;
        Sat, 17 Jun 2023 10:16:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009829dc0f2a0sm3841897ejb.111.2023.06.17.10.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:16:04 -0700 (PDT)
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
Subject: [PATCH 15/15] arm64: dts: qcom: sm6115-pro1x: fix incorrect gpio-key,wakeup
Date:   Sat, 17 Jun 2023 19:15:41 +0200
Message-Id: <20230617171541.286957-15-krzysztof.kozlowski@linaro.org>
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

Use 'wakeup-source' instead of 'gpio-key,wakeup' to indicate key can
wake-up the device:

  sm6115-fxtec-pro1x.dtb: gpio-keys: key-volume-up: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 3ce9875e932c..9b70a87906dc 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -44,7 +44,7 @@ key-volume-up {
 			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 			linux,can-disable;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 	};
 };
-- 
2.34.1

