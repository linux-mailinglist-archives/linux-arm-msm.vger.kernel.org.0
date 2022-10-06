Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88C105F6905
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbiJFOIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbiJFOHY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:07:24 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6337AAE844
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:07:04 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id r14so2901700lfm.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tliBDU0fHhyGnakGMvfEdEtsKIiydxOxQywmOm5FLaU=;
        b=AKLVq7gLwIOC1GDHw4+K1dmf8/wrlqrKrerYCnuFLJ2P+wPEIv4qShkRUBO5lpMukK
         rrNq5JowFWxyhtEvF6bW/8k+Nj7i+0Ri1iKcg6jVtHCG0TCGHGYmDri8EvT+2s/5SoD1
         ZV95BzCpTVZ9Z6jNYVPMJWviGHdwFQE13p46CO4sQ5wm41gbQFsEt2KJd3W3fQ6su4Pv
         3Y5iFKFAuGvsvFcBxlfRC/ddoz0lGjwbm4BR/4Qcg5ZQgWnXjV0iSvebqbDv3368LWA+
         GgRs51XLwjqQfYP/ewKVNPsUMM4AnTvEVJzFFBPW2ue79RjI6q4R2HaVnhPVZ32NPsN5
         LHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tliBDU0fHhyGnakGMvfEdEtsKIiydxOxQywmOm5FLaU=;
        b=Px9MAohgvBSK0egARxa+X5ywPwBrrsS10VX4fPuHnUONTkOhelRGfwaycmFS1DDohn
         ULk3WX4b6R5GP967k6Y1J84DIU12ph5rYu/QSyqlj6KF6uBxCJBptY1MdzNJJ1SaoGv/
         N422x0xdBsC/IfLMtH3kl+Ep90Z6NJMACvuZot6/IM6PoJHysDwjEV2Cvzy8ZFlRAn8t
         D2yod6Hl+KzZ8/Z7Ii5q1jqpnWi+cxHLD+zMOrsH0nocT4l8GtDGlpVwg0B4crCiQo8l
         VfpQ6tl2GhrNAwKq6mSe5z3YzSGmbJlr+B2GPDCBGQhoLjaKP/ribt9LgPrXMP8UX2sr
         iTEw==
X-Gm-Message-State: ACrzQf2w9+6CNSAiW9i9TwLExSGqjlbv38Pf94K6E3enUYKdUID4zZvL
        C/aYT7HHwD1laJMl38Qxonb2tA==
X-Google-Smtp-Source: AMsMyM781+oeEAquoclKKgAQpsfrOf5fkqmk60q8PenhmGdVnDcItUtEdplxYU/1lb+nv4R+x+QsaA==
X-Received: by 2002:a05:6512:a93:b0:4a2:6bd4:e9d9 with SMTP id m19-20020a0565120a9300b004a26bd4e9d9mr59097lfu.100.1665065223686;
        Thu, 06 Oct 2022 07:07:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 16/34] dt-bindings: pinctrl: qcom,sm8450: drop checks used in common TLMM
Date:   Thu,  6 Oct 2022 16:06:19 +0200
Message-Id: <20221006140637.246665-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8450-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
index 9cd97a467648..7ab9a0eec017 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
@@ -60,6 +60,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -112,16 +113,6 @@ $defs:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1

