Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6787C6BE51B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 10:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjCQJM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 05:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjCQJMz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 05:12:55 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C533730FC
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 02:12:52 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r29so3752480wra.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679044370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
        b=g6f9A8Z0wJQ7Liw9kDKgGq/YiHncZo9u6nd7/engs7YVkj+Eemzz4Xwm/b4cN92z2J
         r/p6tGJgs9BoUElT3eD04ah8tRmms2MukhdzZ/vH/lghf2jGOVkfgW5+kI4GikQGIAGq
         7jYRuIiAU7Ld6Axs4QM7OSF5cxEWwiuimJOx2+D50mP7mgnUAmEsR/J1W2YS3veWeiSw
         eYE9Bgd0KSEdHrfk7C+eDPTeTLYyIjDz0HIAW59ox8QAtq5ZF3PO1VP8VbmcPK2dOdA4
         a8bAJsQHKq5QoUyJ7y0tvSUG+6+Cyl1vpltoawUKUXt9MqUY+8bhCbbN7m8PgG+wXRF7
         FPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679044370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
        b=8CDKcLCAXxiNap7AndMCH/zKitGP4msqerVPGozFtIH7xmMMJUziFnEXFKgkZiwBus
         GA9u79Uyv8hhiArM/Cv6aFjPk3vvW53t6vwT6f9RXWuovNcKJCwnG9QBUMVxg0OkcObU
         WJDUrEIZ/g7WgLyp1ayBCT5rod1Wc41u/xLm/Qc7cfeukZ7zbqWpUb5br3bQjBNME35v
         VGaI/+N+rHj5pVf2qOe1C7KTGtuy+yqr4D0drhKrGE/9s2yyAfNpCEUHW6Pi5QSW1FmH
         jyr6Bvf21LxTLAKzCEe1XBBx4RAgFb5ND1nz4da2zc8AHv1x1vpeHOw1EgN36WpvHipK
         UxOA==
X-Gm-Message-State: AO0yUKWgvuY1CuxsArISRJzfKJlZuGf4/TyUYQJaqx/iA2mPSBwxl3S0
        4sl6TV5YGK8uzx98lxamcnVlKQ==
X-Google-Smtp-Source: AK7set8RabUFEkyRs6BzviFosY0SupuZ8xyha9wfLzcaH1MSqBx++FHTvp4s0wPS7ZThKhlXqeYCfQ==
X-Received: by 2002:a5d:56c8:0:b0:2cf:ebaa:31a0 with SMTP id m8-20020a5d56c8000000b002cfebaa31a0mr6910090wrw.54.1679044370487;
        Fri, 17 Mar 2023 02:12:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j10-20020a5d464a000000b002cea8f07813sm1467976wrs.81.2023.03.17.02.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 02:12:50 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 10:12:47 +0100
Subject: [PATCH v5 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v5-1-a27f1b26ebe8@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v5-0-a27f1b26ebe8@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v5-0-a27f1b26ebe8@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM8450 & SM350 shares the same DT TX IP version, use the
SM8350 compatible as fallback for SM8450.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 +++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0e8d8df686dc..f0c2237d5f82 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -15,16 +15,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7180-dp
-      - qcom,sc7280-dp
-      - qcom,sc7280-edp
-      - qcom,sc8180x-dp
-      - qcom,sc8180x-edp
-      - qcom,sc8280xp-dp
-      - qcom,sc8280xp-edp
-      - qcom,sdm845-dp
-      - qcom,sm8350-dp
+    oneOf:
+      - enum:
+          - qcom,sc7180-dp
+          - qcom,sc7280-dp
+          - qcom,sc7280-edp
+          - qcom,sc8180x-dp
+          - qcom,sc8180x-edp
+          - qcom,sc8280xp-dp
+          - qcom,sc8280xp-edp
+          - qcom,sdm845-dp
+          - qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8450-dp
+          - const: qcom,sm8350-dp
 
   reg:
     minItems: 4

-- 
2.34.1

