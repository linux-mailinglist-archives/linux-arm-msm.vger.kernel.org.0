Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A951B5B9BFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 15:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiIONh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 09:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiIONh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 09:37:56 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845B979EF8
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 06:37:53 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so6413675lfb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ndo1IO6KSGAzmetveQB/9obZYM/J/Ip210KxKndrUzM=;
        b=UH47L2i+/vnd0TmZalyeB7upxDWliILvKSRwgjiDpUtgQcUpy9wEYxxk8c1ucndong
         k2/3QP3DJHHc4+R9M/eJ7NEuvTpfYlJZQw1nkzW7KcvZTNFGDf73hQGTxKsJDlv5YL4s
         Z+k+bfdPacU7O2krKBE4pnJ+Yy+4wmo8qJyDMYpPVSDRlNwIq7CvIqxNNyLixtssQoDW
         M3sNqsnIomi6O822VAlkbhzPwIo/oxpl5IoYDF9hfp/KQ6sJmGivBLIcEENYnAHJ8n6A
         I+PUUxiFLdFMHF4eyt8rTH0xoIMGc6/l0ba3W1wOJisTxNu7Of0nphFSvv+OVR0NgmNt
         8fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ndo1IO6KSGAzmetveQB/9obZYM/J/Ip210KxKndrUzM=;
        b=3zP0mAdVCt8JWLn0Ux8h6Pwbjy8pZMjrpMc9O8dQmgnxa9oJzafHAIEbJpeRm1gePd
         uC24DdM6bE2Z9GgNOrSlyHfNxaJWSe1jTe7N2xfEydLOFKsFflTMpo3rVQu4H200+JHH
         xQz5Pke/kD2vSxDU+KnvsiqKjpVVUV0bVWO50WwkHTf++3Pi6QHGtduQqqzRK4dhAoOB
         OyOwQLeARDXh+rjF+VWx8LQdeDZMOSKz3clUv051IrsaexNJID5rYVnD0mWaQK6vlrt5
         jCw2RWGl533d6rbhGJjdMkyVfUV2k6TNfk/XUEMvYpBxdiOWD7cM+xHqe1iGZ4hNZ6Sy
         MjwQ==
X-Gm-Message-State: ACgBeo0u8uKHgvKkXSvPUdS8JsuNcSduD+nPE0iS115nV2y1Sq5FalcC
        15Nq50alAvJmimWr0ehMmv5vSw==
X-Google-Smtp-Source: AA6agR6n01iyoqKGBdQc5gaZbn+pQ/KHwhkWUj1DFcwEzgq5eBZvTPrqCN1ZRNmt5KS4Rff1swIY+w==
X-Received: by 2002:a05:6512:b0a:b0:492:dacb:33da with SMTP id w10-20020a0565120b0a00b00492dacb33damr12959270lfu.668.1663249072902;
        Thu, 15 Sep 2022 06:37:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 06:37:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 11/12] dt-bindings: display/msm: add missing device nodes to mdss-* schemas
Date:   Thu, 15 Sep 2022 16:37:41 +0300
Message-Id: <20220915133742.115218-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
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

Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../display/msm/qcom,msm8998-mdss.yaml        | 12 +++++++++
 .../display/msm/qcom,qcm2290-mdss.yaml        |  6 +++++
 .../display/msm/qcom,sc7180-mdss.yaml         | 18 +++++++++++++
 .../display/msm/qcom,sc7280-mdss.yaml         | 26 +++++++++++++++++++
 .../display/msm/qcom,sdm845-mdss.yaml         | 12 +++++++++
 5 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index c2550cfb797e..f749821725b1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -43,6 +43,18 @@ patternProperties:
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index c821220eef55..10883e976380 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -49,6 +49,12 @@ patternProperties:
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index e507c091b60f..8a72631a863b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -49,6 +49,24 @@ patternProperties:
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 15c01935ac28..0173cbe3730f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -48,6 +48,32 @@ patternProperties:
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index b16622f0d41e..f19a34d7fd6c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -47,6 +47,18 @@ patternProperties:
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

