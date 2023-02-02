Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67F1688411
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 17:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjBBQT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 11:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbjBBQTl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 11:19:41 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA2B60CBE
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 08:19:39 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id bg26so1853680wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 08:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2wX+q+afWofp2hztFL4hCPCg5BnR0pZqpdU6WpFTEg=;
        b=HdMhJ1kjN3EKYbFBudHxLNaG8C7OND1d3B9t7FdtxyGdeLhG2RLu9ydJ8DQyyOcP/C
         7pGUzZLEG+s8hPrDoZ+/rneFW44uXeJssAiBMiQFgo2CYi3RfKClMoWJEJIkGO+3b1vs
         rRgE1dXqXHpI6hRjnHRaIJeDuVqkJxxyIOtsTRXt4t46CZF72QUOHGJkvBhQFGYiTkpD
         f2NwyQI+QSsK69plc6lX1v+xB/FE4OKIY8nDmmv1rPoSu9DKIJEtsc6mslHYuAB5MYVl
         BbFOZYjAmLNepj9y0+sKWEFk5Q3Y4OtTCHmz5nbKUXrZq5trTearJhhsxuOw911qJVcw
         PyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2wX+q+afWofp2hztFL4hCPCg5BnR0pZqpdU6WpFTEg=;
        b=LkvTSEVuzaM7WrkYBk3Cciko7PoPJE3VeQgTX3B4Hk/yogN759oiXMGS+vo6gkxs0v
         RAslInkfaNxDZXEGPuJ2ilFRLLaNH0W6WgFM1QepXDUrY4mTRT9LCvjY9DIl14E7SHRc
         arrtcKlKW/fxCbX6KFrEsuURNGKyAdD4Sc9e0jK1vYrjLwqbNBpH5Tnx+ItHpoDZ790O
         VZlUkHrEgJPKmj+pZ/8sK/GUeLmpZ03pDwsdz7KnYve65ooV7RY/JdzScRKI4GgM8Dvm
         TnGUy8cv1Cfymep+aa10wicJv1qAhYlIPY230/WDxBTeQdZnZKYFh6Yi5npmHvNCb0mW
         D6Jg==
X-Gm-Message-State: AO0yUKWbMjuIe4RU++0Gw0/JzpqSfCk4MyfoAFFc/VhPB3R35DhyFqNv
        J/4wo1jg9XLrnqB8tldx9f6Alw==
X-Google-Smtp-Source: AK7set/5z2h1bmANvwPsAs1Sq0Zli0vsPFeC0uokxH4aItnb8qU6ZrdaQiZIkBxpSdyjpSQp1NxNcQ==
X-Received: by 2002:a7b:c388:0:b0:3db:2e6e:7826 with SMTP id s8-20020a7bc388000000b003db2e6e7826mr7176231wmj.5.1675354778532;
        Thu, 02 Feb 2023 08:19:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003dc521f336esm212416wmq.14.2023.02.02.08.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:19:38 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/13] dt-bindings: mailbox: qcom,apcs-kpss-global: document missing sdx55
Date:   Thu,  2 Feb 2023 17:18:45 +0100
Message-Id: <20230202161856.385825-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
References: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
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

Add missing compatible (in top-level) for qcom,sdx55-apcs-gcc which is
already used in the Linux driver and DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index c38bbdd9d7db..4ae97b7c784d 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -56,6 +56,7 @@ properties:
           - enum:
               - qcom,msm8916-apcs-kpss-global
               - qcom,msm8953-apcs-kpss-global
+              - qcom,sdx55-apcs-gcc
           - const: syscon
   reg:
     maxItems: 1
-- 
2.34.1

