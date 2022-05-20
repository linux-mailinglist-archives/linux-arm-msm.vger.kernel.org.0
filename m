Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA25E52EC1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 14:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349299AbiETMdD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 08:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349284AbiETMdC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 08:33:02 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D428C163296
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 05:33:00 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t25so14067096lfg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6kVjKLD0WUf2G+LRJz5LfG85g04pee8OaNoMoJlHI+4=;
        b=pwXRpYli6OY79jiFu4Rq05OC6ZvclYgbSw6tlMPiOAqCgMLszEy5zcT3HAbP+Mf4/s
         Naqu88BmdrNcqkjgZiA/8yxrnzkh+7TBG1bMToBuUK4LordzS7nf3VBjRNmsvkZ+Jz+O
         8pBHAubkmzjtQ8rvmRXrANdINvSW+KYyavlmpmj0fqA9cK+cqfb74PlXvnvoAkBzG6oB
         Ux2psiWFHrly57WGFcWN3dbIsdPsoP1FxWE6lsWcyOTuO/vR8YJ5p7ls4MyloPFDSZis
         bltDi1+3n4nKg+LkBFlWjvWXAGdF/n6l6OnI92ILwL/OEWrT1Uv+vvSQn51kwQ8qinm/
         GLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6kVjKLD0WUf2G+LRJz5LfG85g04pee8OaNoMoJlHI+4=;
        b=gTiRjnz8dEn/tWHqUVsUtO0NuIhKNdUsLE1u4og5pgVBHNlhroMtEYfAqfcAq9pNiK
         AOQMC3ac1xMAszRswWN28DZlxYIOICuFBBpyCugMrbexDIzYV66mK1tfCDKl3C83ADQp
         80Uw07wnfgNhO1FrNF0oszATaUbjxK32Qz6p15grOkWSIRnHtJOKlVsxp4iVRCBc8NsS
         2OE7s8C1sadblp83G/DeSe5OiPjsae6r/Z6c1aM/5dingcWAF7b12Sy+SR2ygXiFbGWT
         NMu1uVsdfiozL5hBUxI2bcEaVhM+C+FmoVGZXcIpRYUXXgKaIQ6LafCO+dp3Fuv/qRww
         RYLg==
X-Gm-Message-State: AOAM530KAJtgpufopePCy5U1Tk219+0UTmp7LtytxOkhZuUVZ3QwBttt
        IxmF3CAegXES1I2WvoW4q3tVlA==
X-Google-Smtp-Source: ABdhPJxZrlaZa1plJUxQS2LXOpR5aXRI2PrmOgap/W51TJzmr5KT9vDFNjIoVAFUu0NGXb7QiuctcQ==
X-Received: by 2002:a05:6512:ace:b0:473:b1fb:6c2e with SMTP id n14-20020a0565120ace00b00473b1fb6c2emr7022010lfu.394.1653049979243;
        Fri, 20 May 2022 05:32:59 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a14-20020a056512374e00b0047255d211bfsm643973lfs.238.2022.05.20.05.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 05:32:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/9] dt-bindings: arm: qcom: fix MSM8916 MTP compatibles
Date:   Fri, 20 May 2022 14:32:46 +0200
Message-Id: <20220520123252.365762-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520123252.365762-1-krzysztof.kozlowski@linaro.org>
References: <20220520123252.365762-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The order of compatibles for MSM8916 MTP board is different:

  msm8916-mtp.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
    ['qcom,msm8916-mtp', 'qcom,msm8916-mtp/1', 'qcom,msm8916'] is too long

Fixes: 9d3ef77fe568 ("dt-bindings: arm: Convert QCom board/soc bindings to json-schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e15012035093..5ae6fc79fb5d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -153,8 +153,8 @@ properties:
           - const: qcom,msm8974
 
       - items:
-          - const: qcom,msm8916-mtp/1
           - const: qcom,msm8916-mtp
+          - const: qcom,msm8916-mtp/1
           - const: qcom,msm8916
 
       - items:
-- 
2.32.0

