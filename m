Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F307669128
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbjAMIhc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:37:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240371AbjAMIhb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:37:31 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436261C921
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:30 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b3so32113211lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuJMrsipL0mKmACZqifash1MyLzKAd9cIeUIIshG2lY=;
        b=Tp65qKwABUL0Bh/AYaL4q/+FeNz4kL7AnAQqbZ2Sb2wru2o2rQKaqrEBYXwGT77+2c
         LZvuVS/dxy3OBHZuJqFSU5xY4pwUIdsNQr4KoxuxVr9pysw4gprSt7hVI1k30lTqY6+E
         9GPwyjveWCwMTFFdxIIhtKGKXnvf7lFrPQCj6XJKu4u55B7iYyoNHwRcRNclyLtDNTzT
         Y7zMfpXWkCaxotdCfZO9mcaPihI7xa02n2SW6sG4qReNRUvtWB0raq3bjM2mZIPG33t2
         032aduBxehfJx91QrHM7ZC0lZu7sKVh0CZkBeMceyPD54CGESCxjal1OqXIRFG6/1Aas
         5nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuJMrsipL0mKmACZqifash1MyLzKAd9cIeUIIshG2lY=;
        b=ol49FQVakqQ/2Vy8riYAy+n5pCN5kLOy266k9RoMsk0vE+SYj98v5F4pe6ryDr/30P
         EtH8xQtPfZFhSTd93gIgVtOR5hRvybwnfioMEDjplyq1wlRu5GJrPwcg4rPIh+iz/QDg
         Jk1qjkdpEIQlrcEIaAUWjN/t7sUTY9NmrLQzz9laD8aIMz+dgM7T8p6UAK9eCb0rIUw0
         w8qRyHX2mr4IffatReOP8S2C8wJDZBDLNKdOhXvN1RVvbnBDFDd1V5jI5buYBSeu9pNU
         FnMKK6rscK9qyTOSVa6AGelOpimseFM8Herz8FPIk3E6FJSXj4rJ9ieiYue6temjuWmY
         05mQ==
X-Gm-Message-State: AFqh2kpwxMLA9mcWrYza0lWJImU1XyxTsMJA1S/6s027MU0iyv4QukPI
        Cx+WFognbTxAeuxNDlfX9xegBg==
X-Google-Smtp-Source: AMrXdXvb3ZphCNsLO2P8Nf+Zc2ormFq80P/cEXjLZKWfjACOcqidT2kZjBZPP0kKTEFDKzPmoFl9+g==
X-Received: by 2002:a05:6512:e89:b0:4b5:b7be:136b with SMTP id bi9-20020a0565120e8900b004b5b7be136bmr23947543lfb.69.1673599048640;
        Fri, 13 Jan 2023 00:37:28 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:37:28 -0800 (PST)
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
Subject: [PATCH v6 04/11] dt-bindings: display/msm: rename mdss nodes to display-subsystem
Date:   Fri, 13 Jan 2023 10:37:13 +0200
Message-Id: <20230113083720.39224-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the 'generic names' rule and rename mdss nodes to
display-subsystem.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 59f17ac898aa..ccd7d6417523 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -15,7 +15,15 @@ description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller, DSI and DP interfaces etc.
 
+# Do not select this by default, otherwise it is also selected for qcom,mdss
+# devices.
+select:
+  false
+
 properties:
+  $nodename:
+    pattern: "^display-subsystem@[0-9a-f]+$"
+
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 6948ae3ac7bc..6fda819f0189 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -15,6 +15,9 @@ description:
   encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
 
 properties:
+  $nodename:
+    pattern: "^display-subsystem@[0-9a-f]+$"
+
   compatible:
     enum:
       - qcom,mdss
@@ -159,7 +162,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-msm8916.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    mdss@1a00000 {
+    display-subsystem@1a00000 {
         compatible = "qcom,mdss";
         reg = <0x1a00000 0x1000>,
               <0x1ac8000 0x3000>;
-- 
2.39.0

