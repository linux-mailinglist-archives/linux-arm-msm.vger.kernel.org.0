Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D273B616CC1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbiKBSo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbiKBSo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:44:27 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50FE2D76E
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:44:25 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p8so29607569lfu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjQd6UNyWrjAhnyztqxtFEHn1LDMyyYEmKpO/gpJ2tY=;
        b=zenGWiy2/WRie8W8g1NmvOF9TdFYAf8HEHRLJMfi+XmNrepGLOxAuvnP1khA1iikla
         azp/w7c+h2AnoUSvUSdxrUqoBuwGH1CBPi78U6CS1xoqf1sb+gmMusiqptOfVWhYSqoE
         e596zEFEsmEhhBhXLJlsVPVam8zbxHqQ6mhxjnDJfoWRj8UsjmQfuC9NXWWyHWRs8BXC
         OLFI3RlbX2AsD/Ybz9gHrpoBVrvbCisYBGR2ntAK1V2naFDwQFXFe7+BaB0U5SmyFoH1
         SX3jeg1Lv2of6z8ricOV1yHSxgDI1vriT9LcnQy6WxHPwPfy5H/iUOLKFI6TXyq8ckL7
         QiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjQd6UNyWrjAhnyztqxtFEHn1LDMyyYEmKpO/gpJ2tY=;
        b=5NoGiLVeRDBsMkromc48lGfnfd88nv4gwbBJ1kItNoGAb+zSxU7WF47BpSleUVAXYn
         EGlTU04g7wG9vZvp/pju+K2aH70ewrRXPwI8ow3I/RH0veJDkAMx4HvjDPfWmAGzRA3Z
         Klz8hKfqxavxiGdws63Jv/t9YXhXveELN26Rz6rCEIP8BSuifT1rJVE7QYt5Xelj6oCR
         q+Vdm4Dq2gUELMfqC12q2E44PkQj1g0jZbd4B04g9WdREQXcn0PiGFF/bH6zt54yLJWC
         6rJl4futIWwZbHz/ZMrp+BUVJpAhjnS23VIHkGW3FUTyZkTKNiU1TbKzzzXRYVXPS9Ky
         ayQA==
X-Gm-Message-State: ACrzQf0viQ+IdgzWLjPImeilSvxQz0KwaCyuFtEZ+tmhUl79pr43hmpu
        LtoRvuzDhgFjkYKWfQpqzoIv6A==
X-Google-Smtp-Source: AMsMyM5DrJtqmEAzjAJr5iy1tm2AWNkMmin7gc/opRXu5QHBbk7rrZC6RTdVxgLgi/5d3MSHFV7TRw==
X-Received: by 2002:a19:5f16:0:b0:4ae:8476:2d1 with SMTP id t22-20020a195f16000000b004ae847602d1mr9379390lfb.688.1667414664034;
        Wed, 02 Nov 2022 11:44:24 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:44:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 03/11] dt-bindings: arm-smmu: fix clocks/clock-names schema
Date:   Wed,  2 Nov 2022 21:44:12 +0300
Message-Id: <20221102184420.534094-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
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

Rework clocks/clock-names properties schema to property describe
possible usage cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 129 ++++++++++++++++--
 1 file changed, 121 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 34ee33a62ba5..abcb1ee4b58f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -158,16 +158,12 @@ properties:
       present in such cases.
 
   clock-names:
-    items:
-      - const: bus
-      - const: iface
+    minItems: 1
+    maxItems: 7
 
   clocks:
-    items:
-      - description: bus clock required for downstream bus access and for the
-          smmu ptw
-      - description: interface clock required to access smmu's registers
-          through the TCU's programming interface.
+    minItems: 1
+    maxItems: 7
 
   power-domains:
     maxItems: 1
@@ -217,6 +213,123 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-smmu-v2
+              - qcom,sdm630-smmu-v2
+    then:
+      anyOf:
+        - properties:
+            clock-names:
+              items:
+                - const: bus
+            clocks:
+              items:
+                - description: bus clock required for downstream bus access and for
+                    the smmu ptw
+        - properties:
+            clock-names:
+              items:
+                - const: iface
+                - const: mem
+                - const: mem_iface
+            clocks:
+              items:
+                - description: interface clock required to access smmu's registers
+                    through the TCU's programming interface.
+                - description: bus clock required for memory access
+                - description: bus clock required for GPU memory access
+        - properties:
+            clock-names:
+              items:
+                - const: iface-mm
+                - const: iface-smmu
+                - const: bus-mm
+                - const: bus-smmu
+            clocks:
+              items:
+                - description: interface clock required to access mnoc's registers
+                    through the TCU's programming interface.
+                - description: interface clock required to access smmu's registers
+                    through the TCU's programming interface.
+                - description: bus clock required for downstream bus access
+                - description: bus clock required for the smmu ptw
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-smmu-v2
+              - qcom,sc7180-smmu-v2
+              - qcom,sdm845-smmu-v2
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: bus
+            - const: iface
+
+        clocks:
+          items:
+            - description: bus clock required for downstream bus access and for
+                the smmu ptw
+            - description: interface clock required to access smmu's registers
+                through the TCU's programming interface.
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-smmu-500
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: gcc_gpu_memnoc_gfx_clk
+            - const: gcc_gpu_snoc_dvm_gfx_clk
+            - const: gpu_cc_ahb_clk
+            - const: gpu_cc_hlos1_vote_gpu_smmu_clk
+            - const: gpu_cc_cx_gmu_clk
+            - const: gpu_cc_hub_cx_int_clk
+            - const: gpu_cc_hub_aon_clk
+
+        clocks:
+          items:
+            - description: GPU memnoc_gfx clock
+            - description: GPU snoc_dvm_gfx clock
+            - description: GPU ahb clock
+            - description: GPU hlos1_vote_GPU smmu clock
+            - description: GPU cx_gmu clock
+            - description: GPU hub_cx_int clock
+            - description: GPU hub_aon clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8150-smmu-500
+              - qcom,sm8250-smmu-500
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ahb
+            - const: bus
+            - const: iface
+
+        clocks:
+          items:
+            - description: bus clock required for AHB bus access
+            - description: bus clock required for downstream bus access and for
+                the smmu ptw
+            - description: interface clock required to access smmu's registers
+                through the TCU's programming interface.
+
 examples:
   - |+
     /* SMMU with stream matching or stream indexing */
-- 
2.35.1

