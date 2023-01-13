Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6627E66912E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240492AbjAMIhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:37:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240048AbjAMIhc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:37:32 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C3A65AF6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:31 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id g13so32119505lfv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vjftwjhD4kJUBhEbIXBGxN3hN3yT4gTPCKO2c+I+EQ=;
        b=Ov+CMBjcq9K8JUg//pZnc7mlcW9/B3/2qXzmx0NvvRnoe780UdUZZArlzWXkcVKbxC
         FPUtDs3b92b+pu+dxiGUHAUgH5druo5bMSihb/O0MUQGZzGluMVX8ngTmVNU3JGcqq9n
         MGn777cXnxfkVNL05NzJwxWwIFEA0frBHmOrN19A+uKf1NTxnJc2drpCDu7NJLfbi33f
         0Kq9/SdjV+Nrat74Mjz+wn/A8rdxHgoVGntR1IL7gqM3VN1BFZCTJBC3ydT+sn01QJ6j
         FRBg+F1MeIKMaMTYSr0e46TL4e5sGDZpeq11E/VnqMuNXrFpiDl3Pcmg5ZEi/8hGObx1
         FRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vjftwjhD4kJUBhEbIXBGxN3hN3yT4gTPCKO2c+I+EQ=;
        b=Mrpd3Pw33IgeE96xndsUlxS1159Tycl+NALoypWCwAjlE5nKN4vPFJMSZgpjTeQbJI
         Rnq7VGNQ/FsX/7K0w9IlhDqscln2oZ+NZ2Vppc4YELTuZ5yNyFT5S+ktXDuYTmTDD24U
         y/Gbwep9CdWGIlVLh/HcpwhXAU8Xz7qTbgxrYAO8lAP+SksGh5+GyOtB0V4W1rzhqR33
         Sjj2YfjVASQFNTbrtSfaZX3V2144hA7o5rHnaQBWdHr+etnCIxfngrk4UT9dVDYyLCpH
         y1uIGea9N323cRuGCp0c9R2JS/4q0VM+CINT/psgbEU11HGIk7JpInMkWFUFFt5Ut2tL
         HHMw==
X-Gm-Message-State: AFqh2kqA+bVEALcWnLwZFkkwUv44qBHGkeHCVi+RhnrvF0aZubeF+VDb
        CO41CvOoJA0RBEZEbljDTMTosA==
X-Google-Smtp-Source: AMrXdXsv7gBk2XhBFShtLjM0EV3+ZNyVziizBg7ippowT1dR/iKA3FyF6YutZ2UW3P7gVBerA6SVoQ==
X-Received: by 2002:a05:6512:6d6:b0:4b4:9068:2c0b with SMTP id u22-20020a05651206d600b004b490682c0bmr32935732lff.2.1673599050084;
        Fri, 13 Jan 2023 00:37:30 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:37:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 05/11] dt-bindings: display/msm: rename mdp nodes to display-controller
Date:   Fri, 13 Jan 2023 10:37:14 +0200
Message-Id: <20230113083720.39224-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
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

Follow the 'generic names' rule and rename mdp nodes to
display-controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-common.yaml       | 8 ++++++++
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml        | 3 +++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 6 +++---
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 870158bb2aa0..3f953aa5e694 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -13,7 +13,15 @@ maintainers:
 description: |
   Common properties for QCom DPU display controller.
 
+# Do not select this by default, otherwise it is also selected for all
+# display-controller@ nodes
+select:
+  false
+
 properties:
+  $nodename:
+    pattern: '^display-controller@[0-9a-f]+$'
+
   interrupts:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index cb7bf48c3a58..ef461ad6ce4a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -33,6 +33,9 @@ properties:
               - qcom,sdm660-mdp5
           - const: qcom,mdp5
 
+  $nodename:
+    pattern: '^display-controller@[0-9a-f]+$'
+
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 6fda819f0189..7685d3406dc7 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -105,7 +105,7 @@ required:
   - ranges
 
 patternProperties:
-  "^mdp@[1-9a-f][0-9a-f]*$":
+  "^display-controller@[1-9a-f][0-9a-f]*$":
     type: object
     properties:
       compatible:
@@ -186,8 +186,8 @@ examples:
         #size-cells = <1>;
         ranges;
 
-        mdp@1a01000 {
-            compatible = "qcom,mdp5";
+        display-controller@1a01000 {
+            compatible = "qcom,msm8916-mdp5", "qcom,mdp5";
             reg = <0x01a01000 0x89000>;
             reg-names = "mdp_phys";
 
-- 
2.39.0

