Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3406BEC71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 16:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjCQPIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 11:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjCQPIM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 11:08:12 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E2931BF8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 08:07:40 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id i9so4734454wrp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679065595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
        b=b+PT4rbtQaTLoitwvMzSctyfB/PTX2FRLt6w5MfEfjyUObdoeiMt0IvwQn4sXfB4PP
         QaaHwO87rM3LcVGXqMsqAKAPu2biM/oSj1F9FkgEZzK2CJKnuymYOqivN7CmoVMdCwA6
         r0pcek6V8uA2inoYnhCvLu9xU50PgNWuy9xlpmUKlrcJ80BT7m1g/bq9/0YNoxFUy3lY
         YhR8gWbPsx7Ntv2Rv6LefrhNlXuU3t2LtnfME7En4Shl9Ra/O+iXgMl0dsdHURJL5s4E
         ZNHjNnc2VsxQcXLyUqZagM13LQKAH1WxPTUUCtaKdRv0pA8yNWEHIpO3Euz20QqqNmDa
         P0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679065595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
        b=SB28waYJrTEX1tXEuzC9ERv8Igg7Wh7Knts85d5fKcRN3L/ynl/x7ZYKmEfffrAWGR
         NI7OwWcTUhWixc5ieEpy4czo8dHfUyJVzocP8ToOzKelksYkY4gxa7XvISUrWYY0fs1O
         GTmb5vd+ERy48j7wY3HLgOaRmdRrh7IEwOAXQWaqPnEONtxhDs5DeL0t1mHU2fTJcjYN
         Jfq6JS8RJ8Upgh0RnLgobrTllMPYoATli33Z54dHcXBLCtwmBtxE7v39MYvOGJ81kZPH
         53hjt3R2WdR8f9hFyBrR40MdYXefQvJU5AVtjqZD6PtTNEuYM/LIRXNh6yaemHZb4eVm
         CbNg==
X-Gm-Message-State: AO0yUKX5Mj9BGdpPuGdYPNvDQIvc0lzuCxQYy6g+RkrpfOSfCpPmyMOW
        OxO/hikCpcK+6CaxjFUm3hDz5A==
X-Google-Smtp-Source: AK7set9Mf1yAu2eJOHf8lqanYjVkR/0dk89uLJzzPMVSb0YblJ5QbKXVabOolSXl4Fh0ldJMKeS/MQ==
X-Received: by 2002:adf:f0d0:0:b0:2cf:ea5d:f60a with SMTP id x16-20020adff0d0000000b002cfea5df60amr8317040wro.3.1679065595310;
        Fri, 17 Mar 2023 08:06:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d58ed000000b002c5493a17efsm2187902wrd.25.2023.03.17.08.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 08:06:35 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 16:06:32 +0100
Subject: [PATCH v6 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v6-1-d78313cbc41d@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
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

