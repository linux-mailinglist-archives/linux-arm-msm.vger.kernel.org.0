Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A576616CC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbiKBSo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbiKBSo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:44:28 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6166C2D1F7
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:44:27 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g12so29709057lfh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9r2jAN2ifM7pblPIEyP95isDltMBDbHzODH4f5j+ec=;
        b=GkLtVQFrTmCoWJAdWKLUzRF0bkN0rJSMIkzNY/RbLd3/jsknE1BT12p03gt5WipbTl
         P7pXWDwyiNYT9sb9mm5k430Z0UrLLTASEhhOfUmwr5c+CPB+wYCgBd1z/icDwKN386yK
         reLfjyCBHptPoAP7vSkvAPlp9qE2Ngqzma1KeEHxRuwmL/zX6yfcU8q9GbEI/AqUfyug
         1SCfY+ykv999+29pA64kLXlAVLGjMCqEitnJ75oppXpOhmV61r+c8eEb5A5DJPd4Bkyj
         RYmMOmIf5Ssqto3A4akbaYyLmLjv8ATJJpjmUEAPBafJO55IB1PEIaqUIDOewTqNSvJx
         hWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9r2jAN2ifM7pblPIEyP95isDltMBDbHzODH4f5j+ec=;
        b=yDlkalk2H0dSL0EErGWROtJbeNL6XJJ7Rqjx6cKGBSIpj8YOAVUV9+44Ty64mzW+Hi
         WM5TEG2h8gynYm2jl8nMA+S8aM2TNUXZP7AkVbv1IcgrXyHgkjHbfQgwoEvaZzKDw1l7
         975xhyY4ysbleh/QnlGMQ9B883YkZXhm4FWUgvkisMBk98vTlzGldBzTftgSNgkTTymB
         PUBh5+x5EQ36x+RHFq3wf37MHycwgN24EG272CDJ7QNjVd5jDe9JEf6t8dXFEfsd+91N
         /PplGP4B55/SyR3yZkeICv9M0BIkPQK88a/Ei//F7FXfI7wc9q055PPfWHUbiItcHOxp
         /CLA==
X-Gm-Message-State: ACrzQf2/0a4QUoll97M0dv5Sz5cQiKkbY7myqZZo/X2rILdm5NEFsEbY
        ie9sLzKIH5xOhP8hmyaxXriBvw==
X-Google-Smtp-Source: AMsMyM7cRAF+kWHvjLNKh5hA16h9oGLKiTSz4U9zXLRvrHTsSM081VyNEeJEIBJv5/JjmxmjG7nT3g==
X-Received: by 2002:a05:6512:308d:b0:4a2:5958:3443 with SMTP id z13-20020a056512308d00b004a259583443mr9865150lfd.208.1667414665475;
        Wed, 02 Nov 2022 11:44:25 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:44:25 -0700 (PDT)
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
Subject: [RFC PATCH v2 05/11] dt-bindings: arm-smmu: Add generic qcom,smmu-500 bindings
Date:   Wed,  2 Nov 2022 21:44:14 +0300
Message-Id: <20221102184420.534094-6-dmitry.baryshkov@linaro.org>
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

Add generic bindings for the Qualcomm variant of the ARM MMU-500. It is
expected that all future platforms will use the generic qcom,smmu-500
compat string in addition to SoC-specific and the generic arm,mmu-500
ones. Older bindings are now described as deprecated.

Note: I have split the sdx55 and sdx65 from the legacy bindings. They
are not supported by the qcom SMMU implementation. I can suppose that
they are using the generic implementation rather than the
Qualcomm-speicific one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index f44572cbb071..3d4cc8996195 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -31,7 +31,7 @@ properties:
               - qcom,sdm630-smmu-v2
           - const: qcom,smmu-v2
 
-      - description: Qcom SoCs implementing "arm,mmu-500"
+      - description: Qcom SoCs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
               - qcom,qcm2290-smmu-500
@@ -40,8 +40,34 @@ properties:
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
               - qcom,sdm845-smmu-500
+              - qcom,sm6350-smmu-500
+              - qcom,sm6375-smmu-500
+              - qcom,sm8150-smmu-500
+              - qcom,sm8250-smmu-500
+              - qcom,sm8350-smmu-500
+              - qcom,sm8450-smmu-500
+          - const: qcom,smmu-500
+          - const: arm,mmu-500
+
+      - description: Qcom SoCs implementing "arm,mmu-500" (non-qcom implementation)
+        deprecated: true
+        items:
+          - enum:
               - qcom,sdx55-smmu-500
               - qcom,sdx65-smmu-500
+          - const: arm,mmu-500
+
+      - description: Qcom SoCs implementing "arm,mmu-500" (legacy binding)
+        deprecated: true
+        items:
+          # Do not add additional SoC to this list. Instead use two previous lists.
+          - enum:
+              - qcom,qcm2290-smmu-500
+              - qcom,sc7180-smmu-500
+              - qcom,sc7280-smmu-500
+              - qcom,sc8180x-smmu-500
+              - qcom,sc8280xp-smmu-500
+              - qcom,sdm845-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
               - qcom,sm8150-smmu-500
-- 
2.35.1

