Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 959F75249C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 12:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352429AbiELKAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 06:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352383AbiELKA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 06:00:26 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF9B2300C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:00:23 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id i19so9088899eja.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tkpPDqrVq/H+y/puJS4Gb9kI2/A7Lq32jtq9rYl6yb0=;
        b=IFOCvrs1XcRqoYH+gtMSaRO+jB86LwFrCJlZuTQw6K5wGLZgkWJzdyfIqnB4g/ICx7
         awvQNRBRVjo2j3c+kx05jfv9MzsjtKKw2TkcoX4TGKnRp6zKSxn93IpM5+Lijs5lMLMk
         qg4/5SozOIWU5fHhYTz/2pTWlzwDg8/9tZb7wMLguvv08VfJWzSS95AaW7/rJ71klVvm
         GdJSbN3fl4+qdW9cyliiJBmZHlyEHCWyAtu8voMpalw3WXrn1M2kFZsKDSJ07VEFgsj4
         n8A3KmJTAnLi3ZA59gbEjr2zj+Vc/Pf+0FRJwk8A5xNrssGWqDXS1KU9cmoWy2TBhGxG
         fZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tkpPDqrVq/H+y/puJS4Gb9kI2/A7Lq32jtq9rYl6yb0=;
        b=50unmEdGyGq0xXu/BumZ4fVi+N3/eiJ53hD8fp9baPrM4YI4zrZncOJ8UFkAoLYitX
         IGNegNc8Odo/nCxGJCf1p9FXHYFQpJ+u95Sk+MWt91oykBQCbj6MRnCJDr7LQCmcYtQP
         7Ic66MwuFZ92gI2E01+/0P5TEQwT7Kwo/NgZUj8h3lCwUM/g96FXNjH+tCoqqlhfcUaF
         3Wc24ttx5YnewQbsYWgS46UyTaHBynURqM71hazl0nfUzIUHBCrKGar54AOQZBg13u9J
         82+cmDste+ouabE4u29h42xXt0Bc6FWI4sCT55T2rxu2zkw8m+BMY5yeJWQGxdeXcAfh
         oBSQ==
X-Gm-Message-State: AOAM530OuFGIFYCjhLFxxhAKDE8iimNSWgImQD9ZdNwz0n24eSRHVK6b
        sJQhf8AdWtz0bbRP+a2HTEsI0w==
X-Google-Smtp-Source: ABdhPJyZ8rok39ODYQ+iX33CtABflvZmQXwLGT+B5UvhCCikKYy5X5z8qcmrUVr68U1RX4O9efLIag==
X-Received: by 2002:a17:907:3e8f:b0:6f4:4f42:a75f with SMTP id hs15-20020a1709073e8f00b006f44f42a75fmr28608981ejc.695.1652349622410;
        Thu, 12 May 2022 03:00:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1970287ejm.7.2022.05.12.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/12] dt-bindings: remoteproc: qcom,adsp: simplify SM8150 power domains
Date:   Thu, 12 May 2022 11:59:59 +0200
Message-Id: <20220512100006.99695-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
References: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
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

The SM8150 if cases for power domains can be merged with another entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 0b2db36e5d14..e3a193299c4a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -371,6 +371,8 @@ allOf:
               - qcom,msm8226-adsp-pil
               - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
+              - qcom,sm8150-adsp-pas
+              - qcom,sm8150-cdsp-pas
     then:
       properties:
         power-domains:
@@ -434,19 +436,6 @@ allOf:
             - const: cx
             - const: mx
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sm8150-adsp-pas
-              - qcom,sm8150-cdsp-pas
-    then:
-      properties:
-        power-domains:
-          items:
-            - description: CX power domain
-
   - if:
       properties:
         compatible:
-- 
2.32.0

