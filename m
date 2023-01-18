Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53D867125A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 05:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjAREM6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 23:12:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjAREMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 23:12:53 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B88754134
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:52 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id tz11so15867027ejc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSpGY8OBvDU8g61I7cBvuZvlMJBnz3vM71dI47Sckdk=;
        b=umPE4AvJFzFup1YJdR8FYgH42QOyavUcFUC8NPvQKGxr3o7xpeudm/Ij+fszy0rbqb
         PnulAkgYVI0Bc2nWvA5vjgUph6b8dW62AgRAVSIf3hvr1FqH7kCE/FRtiePG/D3l5LNI
         M0AoRiy3dck2kHv64qPbwORMNqv1R7bK7VajLm/sk+vhRxbiU07RiMSJ5q7LZ1VtKMn3
         lX2KDny1CLvQH24Ta/qg31vXSFwwm1yRgByDLhi4Tz5/+VzfTvT0RM9Izi1p1na2gwbf
         L27vd/zaz3qT+zbN8mjGI4SqRyixOIs/WQuDvlDka0bfx+h+KZWhpyIcHayAiGw98YBj
         Ut3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSpGY8OBvDU8g61I7cBvuZvlMJBnz3vM71dI47Sckdk=;
        b=D/F2iRWAe3tfbUCzTuYIOeobRpv1Mpkpct0wTzfpVf4VEAf6tULQPsJU4ad1h3sQyW
         UiVXaXEBnacx22vvrdNj1EqgAkIeTZ58+sQNLJlr6e0v/Bf/uP8WR7wO2zeezNJScyzG
         J1f5Wgt5DQ+SkkAcvpoC+igyfqx6Dv3MYZBq3YQXrLrh0gQBb65SA2GBRi8UATgQqgaG
         nkIadGMH0Fs3ZqUdcUfNHV2jQHcJJ3ecRILPMpnzxbwhKPzfiU+hJVz1kcx6/CAmf/UC
         22HIMutLof8m13p5p3BsiQbTmqDhxyh+yJL1Jqy7l0X46xx0oUQWdk8rnve9TMceC4ZJ
         iR4A==
X-Gm-Message-State: AFqh2kopuZSw4PeuDazeqCc7Xqd4b9Tg3w/4tMzHBPsUFpxL3BEtEVzp
        5v2QEBfyl5uQz0ImHM4LqSpvwA==
X-Google-Smtp-Source: AMrXdXsmismhuZGGoEJBSVO9ZjZwCqvTZ81ImsssxstGyCA74xmfyOyZnQoGM+ZlY2SAYD9ODu+/CQ==
X-Received: by 2002:a17:907:c30c:b0:86c:cbfd:936 with SMTP id tl12-20020a170907c30c00b0086ccbfd0936mr6616799ejc.11.1674015171724;
        Tue, 17 Jan 2023 20:12:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:12:51 -0800 (PST)
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
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 05/11] dt-bindings: display/msm: rename mdp nodes to display-controller
Date:   Wed, 18 Jan 2023 06:12:37 +0200
Message-Id: <20230118041243.1720520-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Rob Herring <robh@kernel.org>
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
index 7dceb2c54edd..ef89ffe9b578 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -99,7 +99,7 @@ required:
   - ranges
 
 patternProperties:
-  "^mdp@[1-9a-f][0-9a-f]*$":
+  "^display-controller@[1-9a-f][0-9a-f]*$":
     type: object
     properties:
       compatible:
@@ -171,8 +171,8 @@ examples:
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

