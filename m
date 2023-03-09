Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF8836B1FC1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 10:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbjCIJTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 04:19:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjCIJTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 04:19:08 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFE16A9FF
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 01:19:05 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so771171wmq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 01:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678353544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
        b=lRJV1vGvT2v+KwmS6EdWHltspQE51HUVFTaEa/Jlk6Er8WvwcLPr2aV0htuhi919P/
         bIj1ck1/BwNY4nkfiS4DIcfLCkJYOkf5zwQAdUsE7F/IyYKwtgtQ59pLBpcONBBYrAo4
         uQUOU3tqSfYqdp1MCQHcQbBU+GCPFcgdYq22u99DZv9p3NZdIQ9Eljdz32eh2YxLoNB1
         pRQliFzO+jwpAF2bpxjXM0xVkEQulSVESjBCVx8wQsZEd2HvDX+Vl/YeBBCQY5g3u4P9
         3/PcgaubSwTExm/8L8btXrqPQix0tla6OKY3ygTH8/GNRJYNDboFnj/UJhQ/DVc7X0oz
         tkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678353544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
        b=QXXF5B6Aumofp6hVVPzTO+zKE2COIPMi/2kHqPsy7X0f2Lh629clkrJ2CBilWgmb/8
         00ObE2lgKUNEl3Bc5QTYWanX0m26E2+AWXEPdd/O+0AVqIf9f4ask3HBAU9HQ+WI2niD
         I2/E4RUvotjpYysu70Pnq4F/uvJZtiI7oewKLiKg4mE56z0bP3AbeANCcQ1Ad1D8BjpC
         EVMgXySJDC7Wn2kwjuUWabjL1xyRv4H70JBTO9wAxlLvcAlAhkUcz0OZyeen0mQRNt09
         /HrYCdRKnBls8Jwy7zOT79kR6JOPhVxQQI9n6pIoA7NTF8XVuDfjAlMjjhIIRTBHQRuE
         5i6Q==
X-Gm-Message-State: AO0yUKWtBuB1pzADl6sGUQbn4jsG1wWBD9ypMs29dssZR/dtVJYRfsfQ
        9pjpUDezWBpuO1B94kZvaToTmw==
X-Google-Smtp-Source: AK7set9dRRR+gtTk41EMbIG56sxDpbwryXnhbCaZpdKrzlOBOqNEIw9pqbn9129F2BxRwsaMlD8IRw==
X-Received: by 2002:a05:600c:1d94:b0:3eb:9693:3857 with SMTP id p20-20020a05600c1d9400b003eb96933857mr14932657wms.5.1678353544446;
        Thu, 09 Mar 2023 01:19:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id o8-20020a05600c4fc800b003ebfc075eaasm2177066wmq.16.2023.03.09.01.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 01:19:04 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 09 Mar 2023 10:19:00 +0100
Subject: [PATCH v4 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v4-1-dca33f531e0d@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v4-0-dca33f531e0d@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v4-0-dca33f531e0d@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

