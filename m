Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1293692373
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 17:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbjBJQi7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 11:38:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbjBJQi7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 11:38:59 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D19D75371
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 08:38:57 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id o18so5642250wrj.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 08:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLYgLKmbZNDw4ZTbUshQjWmr9kZe7rczWa1zK2HXrmw=;
        b=rbwe1An4wV8Ylfyuue6rCuH+8GSaGhqlZ2s8Y/naXgB/CguV0FqElMCGzAvWNuokDq
         7cVFaIcxWjQZwDzkVLdrdu351ANLyKx7/qKCxyg4lpsLPIgHsqGQhSfLlAlMzMLtZHuo
         pimsE0NZ+s06Gz07k7EnOTbm72Ts+N+g047MD6ia5oSW+S4yzWzH3gBVJogzzKiArz+7
         Pya3wNtbPlZ8OIsjSU3HaTlMNwKv6YIo1AKtHcQij42o0RqH9Fo50trx+FuKLYDiaxAq
         M8o6a3fhx9jOP8KgocWKQuw1pBSHH875lXdfBnI66baKZT6kVrxRxZ8cQ7FAYCUDULp4
         O2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLYgLKmbZNDw4ZTbUshQjWmr9kZe7rczWa1zK2HXrmw=;
        b=qll03fMdl/QdMhU3Lij9xY/3uy8HA80RzClq73QEu0b2kJejoox+5kSMaAXpDThLxP
         Ih6GcNy9PDOW6RJf+LX9sHpvw5AVtfrKjd/ZTD6I5eyiN1LK/BjP0eKEkuqoteWZEj9R
         3LrKsqWhdsGQpUKb0XdnPA7iKgcquFS3v+K0bKzm/X0rdbjZljQtxIpLUf4gAyJuZvlo
         u62YRGUP6RyIq/P4G29hU3bQzlM4Z5wL4fwENBaBR9Il8RhSvO0y3lAJ2ECWL41U0J+h
         HmkTqilCRj+uS6Evr9ikbqkoP6dfkxw7CA/uCc00xSbdwfuoQEEzoxIbJJLRgeljVqUi
         H8og==
X-Gm-Message-State: AO0yUKWY4MNytUP1euM725jHok9HbtEgexJbTYVBrk/8tHO3fos1LaxL
        0DaFLmG3Z5EC6kHs/9TSoV2AAQ==
X-Google-Smtp-Source: AK7set+5m3/VbYfTUW5W2vgZPXjPLi2ZHQEIqmrm3TlVrH6DGSVKfdph2Ir/Ff9BPaAGfWjqLppWiw==
X-Received: by 2002:a5d:49c3:0:b0:2c4:7cc:b345 with SMTP id t3-20020a5d49c3000000b002c407ccb345mr6023609wrs.8.1676047136131;
        Fri, 10 Feb 2023 08:38:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d6850000000b002bfbda53b98sm4045792wrw.35.2023.02.10.08.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 08:38:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: add QRD8550
Date:   Fri, 10 Feb 2023 17:38:43 +0100
Message-Id: <20230210163844.765074-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Add board compatible for QRD8550 - a mobile-like development board with
SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 8b90b8d7e858..b1c6f0ad8c36 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -903,6 +903,7 @@ properties:
       - items:
           - enum:
               - qcom,sm8550-mtp
+              - qcom,sm8550-qrd
           - const: qcom,sm8550
 
   # Board compatibles go above
-- 
2.34.1

