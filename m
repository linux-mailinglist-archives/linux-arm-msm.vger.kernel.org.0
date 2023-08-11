Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A28E7798D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 22:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236775AbjHKUvH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 16:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236082AbjHKUvC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 16:51:02 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C741C2D61
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:51:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe45da0a89so4066855e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691787060; x=1692391860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJZqdrCnpunqS3BylltOM5jIKNmh9VxM9LXMzEyqRjI=;
        b=Pj5G0Mdco1jcZUC+NwBukisw4Q598vhEA+/UyBzPOpn8TakZSsu4nSbKKC+3lyxTQe
         +llpMtKdyJ92Vc91Ilhcr5+oDOSb3sZFgo8qRHvhRolI9RVLXjTOzaxYKU20eGmjNiOO
         rjuFaDpBdwcUEXB/C4Z7BMp34wxlyVPylNIG73FpXnz5ai/cIXWhJKsklHyS2/ga8bov
         1+5WraQXAA2fSdxPXkOi2HVq6AH2MwVx0m+JWoH576yl2mRiIMasaiG2+zDA2m67UkTZ
         YHlfq35v4gaudloThrOSjK3MXzKa6sfsvXkxMMe5SP6IUGvcz3YWWJRu8kBlvW0ZYISY
         CbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691787060; x=1692391860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJZqdrCnpunqS3BylltOM5jIKNmh9VxM9LXMzEyqRjI=;
        b=by5aIyntmlckgIRj43cnjmbbJGdE1nS++8YE4cC0Twr8u564hAN++QNYNlDaNRd0/2
         rcObUFOWbZtGgC9pGcETSdJuFioOxHuIeJv2OyFNBvLXK2uAQk+gcyXZUz0Q+9qHOCq+
         dhdiZ0iJuUF61H7RMi6zgJqwNhDQgc6IlREOxAT6asXvfZB2e9zSEbzjWfdDS351EB4E
         ugyntva4KCV/oXhttl8HY3sPWpXnCg9p5DVpNboauDU2bkVJ8t+BG71P4jyJWIQ0bZv5
         0sIusBkh+Dhriti5/XgbHaHvBc7zLU9WCz5L7JJiWGNN/Q4r6nvfZp2NwFQF5EBRot3s
         eD8Q==
X-Gm-Message-State: AOJu0Yx2hK0KE5pYNVr+SAfP+xllrxpqPiWX4kGpipv7ZNVPbBbROQJo
        NOVCc4vPUza2P0Oi9yNfItNdhw==
X-Google-Smtp-Source: AGHT+IFHnoXR1GdX3zOmLUKVQxxNDp3rP1R6j1PP6qRnKgvWqSYFFPULcN+nZ9mTsFSyKhAywIE/Kg==
X-Received: by 2002:a05:6512:1053:b0:4fe:6ff:dfba with SMTP id c19-20020a056512105300b004fe06ffdfbamr2631302lfb.1.1691787059953;
        Fri, 11 Aug 2023 13:50:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id w26-20020a19c51a000000b004fb964d48e6sm858285lfe.95.2023.08.11.13.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 13:50:59 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 22:50:56 +0200
Subject: [PATCH 1/3] dt-bindings: crypto: qcom,prng: Add SM8450
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-8450_prng-v1-1-01becceeb1ee@linaro.org>
References: <20230811-topic-8450_prng-v1-0-01becceeb1ee@linaro.org>
In-Reply-To: <20230811-topic-8450_prng-v1-0-01becceeb1ee@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691787056; l=1394;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Xs7DWl7UXFCwBwUfTPZ/9JWG71aQ0gSpWJmN6cxyqxU=;
 b=ZOQu/nQy3JDlJGB64q61SmEmQSYfQGkHtafbccPhQyv/4IVZF95QKS76V1Mr0IVRRkdka1/Q1
 G1BAIQLcy2OABTj77ArDFy0LM4PxzaAtQiSQPjSTjgv6uY5SUKZhhsR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8450's PRNG does not require a core clock reference. Add a new
compatible with a qcom,prng-ee fallback and handle that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/crypto/qcom,prng.yaml      | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index bb42f4588b40..36b0ebd9a44b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -11,9 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,prng  # 8916 etc.
-      - qcom,prng-ee  # 8996 and later using EE
+    oneOf:
+      - enum:
+          - qcom,prng  # 8916 etc.
+          - qcom,prng-ee  # 8996 and later using EE
+      - items:
+          - const: qcom,sm8450-prng-ee
+          - const: qcom,prng-ee
 
   reg:
     maxItems: 1
@@ -28,8 +32,18 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: qcom,sm8450-prng-ee
+    then:
+      required:
+        - clocks
+        - clock-names
 
 additionalProperties: false
 

-- 
2.41.0

