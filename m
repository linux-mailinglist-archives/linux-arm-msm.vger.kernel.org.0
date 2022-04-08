Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2E64F9E89
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 23:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239576AbiDHVCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 17:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234288AbiDHVCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 17:02:40 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34D0F61C1
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 14:00:35 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-de3ca1efbaso10996939fac.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 14:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f8JKuamLlG+jVMNtvAkq4wZJiZp3w7kpyzKbDeN8Fnw=;
        b=NLO9SLAPT58rbnIklDh7wm66wgY8PpYlyEhH8yN94D6RQ4oNojHPhLWkid7T60WtR8
         vmLvgJwMQMNgOTTcBFt2lNsma5aRvRim2DUeaxMORvS6fC1Lisw65k290IW7lWGmtnRo
         mxUs3O4nGCkIP7NS7IFGbrgK+cDPc11Ig2N2C8d5HggIFMcQV6BiFaOuR9l8KyubQlFO
         X/vI/47rplgg3y0SZTHhGhFf54/uhB9DKbyOPuTImDOXmqPJ7nK3W28bs1LgHM6EwHI0
         MEVssq1u8Sj79Ai+yE++qTCNUhbWG/V2Yz8hrOvHjvKXHGWXWdtU1opjzEHLsC3JOEPj
         GH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f8JKuamLlG+jVMNtvAkq4wZJiZp3w7kpyzKbDeN8Fnw=;
        b=ey2c2lbTSxudmZJU90l8DPVp55EBZyYBOrfBLepIZu2d9TUMKM0ilJ7Hvl7qwS3Mmr
         9nJWQK/YmLxGGT4ZWDeT4uBbPpxB+lK7QTTzDFvG3BMzVxvzO0vP9OrbUGZpOgHWHwTM
         X4ERBE4ccBZd3LNJZPaSg2je5B9eiXkDoBfHpgvoKa/1TbT9uj0Jd+DCaVyTJ+OJ//qV
         Ct3NsyNrQ3ZjfHm8jpZJtkoO8bjjdNfOwukI/z0ndaPKgjoaAK0jdLIls+171Dpwz9vP
         8wyR/0R+u1M0Ceu2Bni9qv6IYVygzF0BJfO75IVsJLHyX9F6J6VqGisRms+z3+wwbe8P
         txXg==
X-Gm-Message-State: AOAM5319JVjkEInT2BnOtsQRbQg9HG137un71vCOg3NIhO2KFPeYX4fC
        Me6d5g/in9iCSCaiTiNdXGOHezNSIOPx5Cxi
X-Google-Smtp-Source: ABdhPJyI+VIO0rEHSz94ZWi70PoGLTvBLc0XQ2Fxj6aiFvF8KexUrGX3Jl09zX+KRsIqz8mRmFwviA==
X-Received: by 2002:a05:6870:9611:b0:df:200f:a6dd with SMTP id d17-20020a056870961100b000df200fa6ddmr9166367oaq.299.1649451634423;
        Fri, 08 Apr 2022 14:00:34 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id j126-20020acab984000000b002da77222b7dsm9160490oif.22.2022.04.08.14.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 14:00:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: msm: Add optional resets
Date:   Fri,  8 Apr 2022 14:02:52 -0700
Message-Id: <20220408210253.581337-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an optional reference to the MDSS_CORE reset, which when specified
can be used by the implementation to reset the hardware blocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 6fb7e321f011..734d14de966d 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -66,6 +66,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 12a86b1ec1bc..b41991eaa454 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -65,6 +65,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index fbeb931a026e..6e417d06fc79 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -64,6 +64,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 0dca4b3d66e4..1a42491efdbc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,10 @@ properties:
 
   ranges: true
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
-- 
2.35.1

