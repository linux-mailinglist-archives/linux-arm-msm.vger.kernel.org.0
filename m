Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220725A9459
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 12:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbiIAKXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 06:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbiIAKX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 06:23:28 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D081360A8
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 03:23:26 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id k18so10987561lji.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=h3TGV/hZLKOeRKAV7vSOc7hHbC695F1vdnC1adEGcHg=;
        b=kXkcAHCKeVbArfeueplPddDNJ6GGQ33c16EWLmeN+VykMBSabEJuCPbPFTczn1hMtQ
         kKnA29lmLHn/fxL2z9cQPVPM2PjyUzaLNOHEOLR7bF6/26mDgi7OOyFlNs763rSGbXLP
         L5J5ACqVcoITHp9lapY8B6yVjzCkTjaAQ+aEF/lzXpGCtx+ElOefZVCruXe3yZ1p9qBL
         AXYKb7W3cQM1KjwBd0z1ydtA1Rlao07eSvGRwJjp8DS7FXbgpHCGq0jby3a8yUKTNK0M
         UJIpwozUSNqnCq9K+Wb6pl3D4Ejk1KRT88xvtXjcSFej3ZREhHuHtqvkhoaPTAEvKY5w
         TSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=h3TGV/hZLKOeRKAV7vSOc7hHbC695F1vdnC1adEGcHg=;
        b=uEXNXFRFs63Niz0lztkcnByWVtJ3WrFWk/XIcwAEFYYhbf3QLsGwYoTmT+yAG78Zms
         eADKqwcZceWm3RdKqLFLv+UI9YJJ5Gg5aAbMyA8EmBv8NcftWx1Bj3v8RUi3FpFtcLph
         oWbF2/fG1ZhuR4a0T4yEjS54HvBpeYvw39BK++pJY2nz5Y/Av1nDi3bioYIk560T4Qp+
         pH34skbB/nXZ95E6ZDj/hc93/gcWMOI6B0EJKxMSJjGP9DAyqqo5hbTBuxkmF1gg1sb+
         knkXR1sSHcyAedisPUfbhDyp4Vsckyul55wh3DFoZgKF2dKwp9QQFWGLBVnXap32oBFU
         XyWg==
X-Gm-Message-State: ACgBeo1DC4mvzx29bEBNEIe25kTJHBYu11zMa/fDnb95o1Jn562Zwyp2
        W2ODpxsjhQ7w0VK1+8s1ox4jFQ==
X-Google-Smtp-Source: AA6agR648tmCUlzFuOWdj2ovCrgM3LOaJhn94D1LipEaS+mOZAZyZddv9ZH7JgjawGcjowk4eZiGTA==
X-Received: by 2002:a2e:140d:0:b0:268:cb78:40de with SMTP id u13-20020a2e140d000000b00268cb7840demr302489ljd.232.1662027805313;
        Thu, 01 Sep 2022 03:23:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 03:23:24 -0700 (PDT)
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
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 11/12] dt-bindings: display/msm: add missing device nodes to mdss-* schemas
Date:   Thu,  1 Sep 2022 13:23:11 +0300
Message-Id: <20220901102312.2005553-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
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

