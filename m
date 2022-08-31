Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250D55A8641
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 20:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbiHaS7s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 14:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbiHaS7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 14:59:38 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98180C276A
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:42 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m7so12327705lfq.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=h3TGV/hZLKOeRKAV7vSOc7hHbC695F1vdnC1adEGcHg=;
        b=HS+SUKEQBzWfTEo+ANu7HuCQqAOka5hzJgOls1w/81WYctq0n8sRekZSb9lZi0WlFa
         k9krrFsYllX67jmiqSyf0a63GpnqtxxX/OKkGUJwXkh5cNxrocYcvR/hwWZXgR35R74J
         QLeZaM2smF7gshYvRIxxgtW9ufT6/PUxwtVfZLVmb31CLy3PvF160+hpgIIdR2/vHwh2
         gnrMTjND3JtkPEzu003yWJimMcTBK985OY0TC0/306GbvG8xQGeFBd6Hv7RZyA+41vbb
         s02TNV+G8nuOr0ru1mrA+dyMnTsEK0bFuNCHw6PLyifQbOHdCrR9oHZVtg0RUKjeFswK
         vgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=h3TGV/hZLKOeRKAV7vSOc7hHbC695F1vdnC1adEGcHg=;
        b=qW9qKKnrjQtmftBOJfxTlWvm8/KEnhm+h6q9VPCyFKiKy9Wix38+wuMqs2v0zxyv8T
         ynhRryuMFXpEugJWUCHaWQdrfe7p8Nn6G/g3qfMhkdztKdYBQrRshhFBtilKQ7IMQ1/y
         EWuQ8vJ/7ylBIPcSdokgdOn5r8TYNSGLLyTTFlhrhF65LLDEgsJtBkHtW3IWEbXBTyoM
         +3Uy1ll5FaEX2yJ4CSuaJmp/1KtrZoLWs98bz4jJKB1zA4+YNQRyrdjYJGfprZVAabaG
         C64L+FoWFRvJtf/DuRXlF8XaFli8ZYCiox3A+9zf7pHqzqn7R6S5bCMSrUpsQVldNNvM
         1RoQ==
X-Gm-Message-State: ACgBeo3xLrBvaOvd7qfjLYHUI/uUcGT2De4wu9TRgnt/f4uJPQYMUsaA
        5KRp81DooV0MkdEfGpLLRDewRA==
X-Google-Smtp-Source: AA6agR5FdPaswbMF+HhOgBSLDOvy+HdTqKJLArmg2CP4k0h5bU4RrFy5gXbD3o9b/+iDV5hb8k8uVQ==
X-Received: by 2002:a05:6512:1529:b0:492:dae4:2d0a with SMTP id bq41-20020a056512152900b00492dae42d0amr9182633lfb.604.1661972320938;
        Wed, 31 Aug 2022 11:58:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b004948f583e6bsm322422lfv.138.2022.08.31.11.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 11:58:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 11/12] dt-bindings: display/msm: add missing device nodes to mdss-* schemas
Date:   Wed, 31 Aug 2022 21:58:29 +0300
Message-Id: <20220831185830.1798676-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
References: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
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

Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
schemas.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/mdss-msm8998.yaml    | 12 +++++++++
 .../bindings/display/msm/mdss-qcm2290.yaml    |  6 +++++
 .../bindings/display/msm/mdss-sc7180.yaml     | 18 +++++++++++++
 .../bindings/display/msm/mdss-sc7280.yaml     | 26 +++++++++++++++++++
 .../bindings/display/msm/mdss-sdm845.yaml     | 12 +++++++++
 5 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
index 3482468fb2d4..f00a48a24521 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
@@ -44,6 +44,18 @@ patternProperties:
       compatible:
         const: qcom,msm8998-dpu
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm-8998
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
index 7a6c3178f02c..1160c5435236 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
@@ -50,6 +50,12 @@ patternProperties:
       compatible:
         const: qcom,qcm2290-dpu
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-ctrl-6g-qcm2290
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
index 27d944f0e471..38e474ae90a3 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
@@ -50,6 +50,24 @@ patternProperties:
       compatible:
         const: qcom,sc7180-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7180-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^dsi-phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
index db843412abf9..fcacbc5c5e2c 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
@@ -49,6 +49,32 @@ patternProperties:
       compatible:
         const: qcom,sc7280-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7280-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^edp@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7280-edp
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7280-dsi-phy-7nm
+          - qcom,sc7280-edp-phy
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
index 0bc148f7fbd9..09a8aa9837ea 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
@@ -48,6 +48,18 @@ patternProperties:
       compatible:
         const: qcom,sdm845-dpu
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^dsi-phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

