Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9203636BD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 22:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237438AbiKWVEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 16:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237218AbiKWVEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 16:04:08 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F6E922EB
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:04:07 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g7so29972668lfv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH5onZ6G5nHVXUuxsOV7O5x3nmGGqIdn9uYRWyyU+hw=;
        b=G97cdP0jzYZD0QaHZGjUgx/Pjbut4+V9AbOHFgvim8WJafFd+5mTAPalMxdXurYTKE
         ccx+Dc0EeOnpFoSWIkoZOl2tjuPzZ/nrtMA6lNTLHf0Jq0i7mmoAz2tgriQ9XWdcVSPQ
         Ep5xwyBsFu6jz8O3Eb0yx6LoHvL7WszP6/TOjJqVTyZLS82U1gztXxhN0Rtz4rUNIJty
         igEQttfa3ZNgDlhnKI0xcRynT6gc6LUhM6eN68ffEzV0Ikpq6emttb1TLgifVNtL+6Nw
         GzGGIrqnWt6tlPMtkbnVgg6ngNhSawpqM1DzdBxZQgLh88/iH1Qa5palo+Ny0DO+Jp+l
         ndLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vH5onZ6G5nHVXUuxsOV7O5x3nmGGqIdn9uYRWyyU+hw=;
        b=3dm2QrWD1YEQdEUspvrJlfbKAGdMME3wCwi4pEt9qk/Zllc65xsOZL4xLkIar78hye
         T9pWg8QrAd3m1bMcIJKm/xDDN688mes8AHtLQaBGSDrCjGE8QqJ8RPo0JsHvMDdaHv4g
         9/g28uMFBY1Hgr4r+kPqJTbI6Ex8CS5JICsNW2fUA/yDSgFRtPxawEtGFwhLoRjDhMCi
         OGj7+3GPFuMwu3ux0/y9trUwOMGJi0N8/MbUYMQ0btHo0u35Jr4x0sMAHx0pDZaN2kvm
         6BtkWW8bRCSxGwIa4inlAGCV5tWQXXVLes8GBAPrlwbA9FwzSLcHn13bQZ3O47Ic3Fr7
         Oy8Q==
X-Gm-Message-State: ANoB5plEKdiCkGB8ZbkrT+mgLOYVqzAqJLqhsBYgpQfxRSo1AGXX1wWq
        WfQCBLfGlWFmBfRu8cZc0pAE1A==
X-Google-Smtp-Source: AA0mqf4jbDze0o4GltP7F0O5nvp/OjiMz76yIxAJxoc8xCaBY0wKZOYrvbcDgR8Ab0+S0atZ73xWww==
X-Received: by 2002:ac2:5a09:0:b0:4ab:b2c:75ae with SMTP id q9-20020ac25a09000000b004ab0b2c75aemr5176326lfn.40.1669237445877;
        Wed, 23 Nov 2022 13:04:05 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b004b177293a8dsm3009913lfc.210.2022.11.23.13.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:04:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 02/10] dt-bindings: display/msm: *mdss.yaml: split required properties clauses
Date:   Wed, 23 Nov 2022 23:03:55 +0200
Message-Id: <20221123210403.3593366-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
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

Require only properties declared in given schema, which makes the code a
bit more readable and easy to follow.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 -
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml     | 3 +++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml     | 3 +++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml      | 3 +++
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml      | 3 +++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml      | 3 +++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml      | 3 +++
 7 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 27d7242657b2..59f17ac898aa 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -70,7 +70,6 @@ properties:
       - description: MDSS_CORE reset
 
 required:
-  - compatible
   - reg
   - reg-names
   - power-domains
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index cf52ff77a41a..fc6969c9c52e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -55,6 +55,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-10nm-8998
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index d6f043a4b08d..0c2f9755125e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -61,6 +61,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-14nm-2290
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 13e396d61a51..fb835a4d9114 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -67,6 +67,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-10nm
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index a3de1744ba11..a4e3ada2affc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -74,6 +74,9 @@ patternProperties:
           - qcom,sc7280-dsi-phy-7nm
           - qcom,sc7280-edp-phy
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 31ca6f99fc22..2a0960bf3052 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -59,6 +59,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-10nm
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 0d3be5386b3f..d752fd022ac5 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -63,6 +63,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-7nm
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

