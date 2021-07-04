Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABBAE3BABDC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 09:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhGDHnu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 03:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhGDHnt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 03:43:49 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CB2C061764
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 00:41:15 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id z13so992108plg.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 00:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y2JvDwp3TfASNY2nYjyfxKqjVkgvIs8uvDCzlvHG2AA=;
        b=cbrduWjiQDcg1zBJYNfFqJlwRhenjmvi02OUBwr8M4hyh8/l3aDFwt2Vy1ZRblRZ6K
         1SOfwbZhNI/1AhuNfkurXrnNtEIQp0pcEel+V7xEswXE8qJW3b2gSmIDaTxUNi7RLeca
         vfuEVL191zztFFkSQ7e2PTS+A641GNx76vDII+QCNt7DEsLVNNUpVsKel1P5tcA6s/6e
         BlLVFtK3093ZAiV7/rjobH8nig1pxRbCgsTXE9da1w3CHhbvHP6cP1yKOjXN1nRWUNEW
         F+Hi1pGWY9ajJzGRZdf4BU4PFhVynDvZm5FRQNSz08BY0JrxQ4LfyJzv5zGRDnzVsZhj
         GwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y2JvDwp3TfASNY2nYjyfxKqjVkgvIs8uvDCzlvHG2AA=;
        b=lGGkc9WCyp0bIZElREjCWIr1i4wbfEw19btUIMrEKKb+xQjYiN85nTmlerYW6guTTH
         3YeISCNr4Vpnuu9bzYrtkfS7qp2cBKbib1jRHJKvIGFj9WYB5s0QHz7TjIxWz5pOB8il
         8275kEtwd6K9qcMpen4Ga4uWRsp+/WnrZ2G1YDGoldazSxIqSHCy2nD307pkZIEmhoGm
         AqXQHEOcAwlOaT/MgpP1zPMFVO06NSM9EvkrNLzkyTvY15EhwQ39nKQ5GeNZGxhE+5X4
         P7THTUGwZsnbCkZ9u+3UvkMFGK4sTGtx3U2HHcJd+FUXWEB627Bx+N0zrNP6djZZbAb3
         8oNA==
X-Gm-Message-State: AOAM530ndM20aVMAhL7vj71HmXeQ7J212kL73jF8AovWeAHhuAL3feNj
        DPCTyDj4C1XbOEc5NEClEo4r6Q==
X-Google-Smtp-Source: ABdhPJwGmTyodmzASq3EdwqjQVy7NsyVqG3mZlScAbL5o9KQK27DmKnTNeCgdySHHZLmg2TcVtdRPw==
X-Received: by 2002:a17:90a:d506:: with SMTP id t6mr8292715pju.26.1625384474616;
        Sun, 04 Jul 2021 00:41:14 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id gz24sm7052956pjb.0.2021.07.04.00.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 00:41:14 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/3] dt-bindings: qcom,pon: Add 'qcom,mode-in-imem' support
Date:   Sun,  4 Jul 2021 15:40:44 +0800
Message-Id: <20210704074045.21643-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210704074045.21643-1-shawn.guo@linaro.org>
References: <20210704074045.21643-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's not always the case that reboot mode value gets stored in PON
register.  For example, Sony Xperia M4 Aqua phone (MSM8939) uses a
different set of mode value and stores them in IMEM.  Add property
'qcom,mode-in-imem' to distinguish this mechanism from the existing one.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../bindings/power/reset/qcom,pon.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 7764c804af1d..a6270e39b7a2 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -23,6 +23,10 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,mode-in-imem:
+    description: Reboot mode is stored in IMEM rather than PON register
+    type: boolean
+
 patternProperties:
   "^mode-.+":
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -35,6 +39,7 @@ required:
 additionalProperties: false
 
 examples:
+  # Example 1: Reboot mode is stored in PON register
   - |
     pmic {
         #address-cells = <1>;
@@ -47,3 +52,17 @@ examples:
             mode-recovery = <0x1>;
         };
     };
+  # Example 2: Reboot mode is stored in IMEM
+  - |
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pon@800 {
+            compatible = "qcom,pm8916-pon";
+            reg = <0x860065c>;
+            qcom,mode-in-imem;
+            mode-bootloader = <0x77665500>;
+            mode-recovery = <0x77665502>;
+        };
+    };
-- 
2.17.1

