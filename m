Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22AF8628684
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238128AbiKNRGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238108AbiKNRGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:06:42 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9222CE23
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:40 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id d6so20290897lfs.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDEaZjmzqx8exActshsUHKTWCuLF7PJxcmbrYAR4hkM=;
        b=GH81Klr7lucWed8YnqhzsuvYKD+nSeyRRDQqJfIDZ854Z5id2bJONr3TbdF24cHjRf
         67kpmW7G/bqvMIUNcDs8V6rcVwp52z69v6byVIRVdncoRiUG5bNsFiO2QGG2CLsNwZJx
         Otc1X5Vthc1vK/ITzJBYmxB90xTWNQRP7soWB/I/feiDfK8hdsLC7IUKyN9LSygvblKn
         Sc3vxid+CdduQa9aznWhuUMiAsjuGPdDYghPYW9gPK2kFel4/0ud/gywPU2lrJiv5xf7
         58FYc6EFXMg3to4H0m+cP/r1yF/w7e8NrYp1yCfw0wIYydxSZnbVG/moBtGrn6EZDCoW
         CjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDEaZjmzqx8exActshsUHKTWCuLF7PJxcmbrYAR4hkM=;
        b=ywxB/vLH2RIq+H1V8rd3xFFmrKyc1xcebIxjzeB7Od14q1Yjbxz+CuHFv7EEhFRrNq
         hrWGmRwFISFSjxfh6jIdnoy7P1XGZAs20CjbEDumm/aCpyLmZE9Gc8T9uiRPfyGzZZbW
         f/HBLmG9tPu9onAKufAkTOYlLrQ5cYEF+MaIN01/qv7pz109J1hjxwZQxZx2gfteccYg
         pv1hZ/E6RsWHVfZqK8oEIzcBpdQJ4CYbiTuv7Rm4zPngsJV0WgDJLgq3EBeMUvRSO4xJ
         N/8zCG6k2yVcrA+8riQoaXtMWE72qFlJV+95PU2HfyjvQHCIAa+4PF9EudZCGJG7Bj9y
         EpXQ==
X-Gm-Message-State: ANoB5pnNq01IzWf/rHyM1u6qSI0nNRnjyWFIW0JdZTJt83fcYer/xkDt
        OqhejkYJx7U7nu2bb67C+DGEYEPARoEYlA==
X-Google-Smtp-Source: AA0mqf66spNpdKTJ2WcweQAyVh4VeLjS4VD02sJmjSOfgFJGSGA1WPaGV6Prl57/geFIG0rBSWnxpw==
X-Received: by 2002:ac2:4c55:0:b0:4b0:38df:e825 with SMTP id o21-20020ac24c55000000b004b038dfe825mr5037462lfk.471.1668445599972;
        Mon, 14 Nov 2022 09:06:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 09:06:39 -0800 (PST)
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
Subject: [PATCH v1 04/10] dt-bindings: arm-smmu: Add generic qcom,smmu-500 bindings
Date:   Mon, 14 Nov 2022 20:06:29 +0300
Message-Id: <20221114170635.1406534-5-dmitry.baryshkov@linaro.org>
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
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 29a8b3ff8fa0..28f5720824cd 100644
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
@@ -42,8 +42,35 @@ properties:
               - qcom,sc8280xp-smmu-500
               - qcom,sdm670-smmu-500
               - qcom,sdm845-smmu-500
+              - qcom,sm6115-smmu-500
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
               - qcom,sm6115-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
-- 
2.35.1

