Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0D250FB8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 12:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbiDZK6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 06:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348828AbiDZK6W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 06:58:22 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E9814083
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 03:55:13 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id g6so12413010ejw.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 03:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0m5ZZfG1YF2A40apHuhZaDOYLmk1gRk32TzITEEDGDI=;
        b=Sj4lS5VAzOQWv+TQxwwUvECq3rxmplzfBmjrZe5aKAF7b8hDpfF+lRipnxkDq0Y5A6
         jFgby37Ulk4+z/NsxQQRcHrbB3bmt4abfSjOPgu6zkse+wPSVdmS0xe9MPXLwPsC/S3c
         BJ7cJEOy+vzS/vz7Ubfef1c/ehj4FTlDBwQxmdKjxG4DyT2yw2x0UOHDy4k63XsI8yt9
         aXKjkFopVKwUTwocjytCYjsx9EaPfnl/ul9Czu9jz8OpW8qeeqIWHc/WiRl9qRKuBuB0
         zZdcuezjbsT3Z8gGc28kWBc0BItP4FUxlnol2dRTTIbVyXEAu5tEo09QlG93jcLbKOyA
         TnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0m5ZZfG1YF2A40apHuhZaDOYLmk1gRk32TzITEEDGDI=;
        b=UzQUpJ9jPFQRpr52NMPTeB23vgwozb0/Eg+7rj1Q/DBbHgLyDn82UCtcgESzukjRD4
         FkKemvk4+fAM+kssjHo9TU5cod0v8z+rD7HKgFZTy1X7pBLfPfWHz8cg33HlS6wEFjWy
         CskvuJgJ7rdgbT9I+MjO1eQ1IyMDMjYU9JVQTJoZrXpKjaIID3thZlYsUC26xI21HEVj
         moq0hAWnx2MriI6UO0t6XzVUnclhn1wLL5rDB2nGbj4UmKp0jOpZMUpwNbiS7qHiSRLp
         5NBMKCvGqhbjWPGaACuX399Xr9nSDVO0uJjG1vvYYFxCXuO6uZ10lEdeishcRDP1Nw2R
         S76g==
X-Gm-Message-State: AOAM533CAZ/scQfzCA8Ym2vfcv5A+Z51MOI9MHRiU+kNvz5WnkLIkbh7
        x9C9mmEirgclqx1H5lNG19izjA==
X-Google-Smtp-Source: ABdhPJwzco/w60SSupURIzYxoiPHR7O0hkeySk1FSa+XINU2RjSsH+0aJ4xgXXn/8T/1vSpoNH44Og==
X-Received: by 2002:a17:907:e8d:b0:6f3:9721:dbf6 with SMTP id ho13-20020a1709070e8d00b006f39721dbf6mr9134713ejc.448.1650970512188;
        Tue, 26 Apr 2022 03:55:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s5-20020a508dc5000000b004241a4abbdfsm6062843edh.45.2022.04.26.03.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 03:55:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/3] regulator: dt-bindings: qcom,rpmh: document vdd-l7-bob-supply on PMR735A
Date:   Tue, 26 Apr 2022 12:55:01 +0200
Message-Id: <20220426105501.73200-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220426105501.73200-1-krzysztof.kozlowski@linaro.org>
References: <20220426105501.73200-1-krzysztof.kozlowski@linaro.org>
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

The PMR735A comes with vdd-l7-bob-supply supply which was previously not
documented.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 6b99897fa404..9a36bee750af 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -313,6 +313,7 @@ allOf:
         vdd-l3-supply: true
         vdd-l4-supply: true
         vdd-l5-l6-supply: true
+        vdd-l7-bob-supply: true
       patternProperties:
         "^vdd-s[1-3]-supply$": true
 
-- 
2.32.0

