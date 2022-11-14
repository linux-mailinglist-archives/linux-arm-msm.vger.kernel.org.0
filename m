Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87629628680
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238103AbiKNRGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238101AbiKNRGk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:06:40 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5852D1EA
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:39 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id d20so14024772ljc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea5Uaq+yCu3Bhg+2skGWB1tgC1rGJXv0/NT43e/8qQ0=;
        b=gjzX28jYfag2dKv8gVZOhtav4Divmseos/wBBPN3VoteTHb6/blQR9C5ozteNi2WH6
         KbVvFDYsC9Gkby2CwIeURC4WDENucrfJo4x0P6DNQPCPzk+xeV3zrhVGDRvj2QoqNb3t
         6HyGLmlSwciCqIwKT5T7xVUk7+cMLh+ZFoO7HOq1fo9mkKsO+FFlmMfvB/siQxU9yv5g
         cCPAxj468p1SonFJZc+SvW91CdECzKbZwgtRhozNZCaweP8CzjWwOnmivn3RU23X3jpN
         PX6294xUYpeqCkA22Ov1lr6nx+L3QrIYNdjeaE/AovHJaIuTbocjA9Frf6Hh8cmOKvcz
         ddRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ea5Uaq+yCu3Bhg+2skGWB1tgC1rGJXv0/NT43e/8qQ0=;
        b=EuOEbF9nOrYzODFp8MFNmT5QGbfMjNUIXRnv6lnx5D7vS2h/FMKStZiaC5J+HTWiqT
         vGhwcAxOGdtGbBxYAWWOk/OACqXltbTR9xbcPBrwLsWpH88AV2AtFR9U71Y2GiKAhyyH
         yGM3YSTHT/KtCd1Xk68tAvEYydW1rJh8K/5PBzh1OiW4WJXyRzjd8mViIh7hrkYLypTI
         DP7lcmxIIWIfWnyZMezd77/tyWnO82j2bAtnfpSuDin3L/lStbPq6ZnvwmilnkAAttm7
         wTtq69cuftutqCtYtFBWR/rQENxaDFBdaj3KhpfwRwDrBywBO1d4TQ7RodqSA4ocZTAx
         TNXg==
X-Gm-Message-State: ANoB5pkZWt+AVCVEQFcn2VtVa6W+Rcy3gEAw7Vxoo98/Dq8d5TG9bZeZ
        jbCUtQVsokaqp2FYhpab0PBzfw==
X-Google-Smtp-Source: AA0mqf5ujGOmfS1y4Y7C9QcGvLTvnfjct6sVPJ9etlukkDP5+lSoQjsAVoqfVDJMHpPtEo7lPHDTow==
X-Received: by 2002:a2e:9e46:0:b0:26c:5cf3:cc89 with SMTP id g6-20020a2e9e46000000b0026c5cf3cc89mr4610957ljk.483.1668445597957;
        Mon, 14 Nov 2022 09:06:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 09:06:37 -0800 (PST)
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
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v1 02/10] dt-bindings: arm-smmu: fix clocks/clock-names schema
Date:   Mon, 14 Nov 2022 20:06:27 +0300
Message-Id: <20221114170635.1406534-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
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

Rework clocks/clock-names properties schema to properly describe
possible usage cases.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 129 ++++++++++++++++--
 1 file changed, 121 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index aa863811996f..99f34a40cfe2 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -161,16 +161,12 @@ properties:
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
@@ -220,6 +216,123 @@ allOf:
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

