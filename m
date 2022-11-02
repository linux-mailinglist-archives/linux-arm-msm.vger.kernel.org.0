Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6F5616CBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbiKBSo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbiKBSoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:44:25 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A072D768
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:44:24 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id b9so11206052ljr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNK2wPK1fBXzQbq904VPM/ONG2+wLYMEqkAMyzLrb8A=;
        b=KE32gHX+t1m490OwcBj+IkhZR8UOU08WEyAZi+sKyor5it0XstYkmXHnVDrhAoT5Uy
         TkvdwmH4D+up3wFvlx5XjEqdg7lGPpKiIendw0DP5CESgouWvczajXJYDbbqVBEhzY4K
         Qv9e3bwD03OY7ICzdnIzaEF8MKPXMWkYdnVA5prwA2v78Yz2Kwl2jO28JYDk9EAQtyA0
         rSf2CcTyxnhtpfuGuVudDASovJbqojnscV4p08OdZZelTbpYFLCZzThr/vdwsZBDtdGR
         NpXwGc0QDLD/4PpVPfLuwCZJPHfYAIQSTWgp9nR5mTZoeRTe+p0xPMHP+rlDDkyvMjC8
         spvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNK2wPK1fBXzQbq904VPM/ONG2+wLYMEqkAMyzLrb8A=;
        b=aW3+C0neEVaWrrCsiylNvPajE9b8yFbvAECIdqkhtLWGlIWw+UM05HLRWghHTTJzDt
         hQd4/vmDDqJI/kozKVHbiADPwjLaiKM8BqMVl2qMtWUBA++O321xO422jY6ROW10xP1J
         PtLgJ42Czjp4cHN3jIoWAowe21lw2aic+1lkCtpr2qw0v3WfJsIzrmOhrvYCCTP5CQZx
         SHkUpR0fMkgLS6m48+APm1wHXLBCl62YMsxKYdvicGiV99MiYxuPRBuOps7gP0YV0xhs
         Tg9L+Hyc9A4bru8+HjNgE5MG8v6aUCGY17b6bivIT6N1ajWgNZrZpNWeJA8sRnyKokOV
         pzdA==
X-Gm-Message-State: ACrzQf2BqAxTm50GwTWeBe3MNpAJoq9Vl+T89DdrZzDNV48QnUDSV5uJ
        ZQM8BoWoXpe1eOKhlmGHf3jEJw==
X-Google-Smtp-Source: AMsMyM7KfCrG5aH4B0J1QoogQr2JYMpYNPRytIihbQ+rgBpmAm8Qs6bm6jnsdHrAN3rJpYFmyKYhQg==
X-Received: by 2002:a2e:a887:0:b0:25e:3174:fb67 with SMTP id m7-20020a2ea887000000b0025e3174fb67mr9624008ljq.337.1667414663267;
        Wed, 02 Nov 2022 11:44:23 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:44:22 -0700 (PDT)
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
Subject: [RFC PATCH v2 02/11] dt-bindings: arm-smmu: Add missing Qualcomm SMMU compatibles
Date:   Wed,  2 Nov 2022 21:44:11 +0300
Message-Id: <20221102184420.534094-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
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

Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
platforms and for the Qualcomm v2 SMMU used on SDM630 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 9066e6df1ba1..34ee33a62ba5 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - qcom,msm8996-smmu-v2
               - qcom,msm8998-smmu-v2
+              - qcom,sdm630-smmu-v2
           - const: qcom,smmu-v2
 
       - description: Qcom SoCs implementing "arm,mmu-500"
@@ -48,10 +49,20 @@ properties:
               - qcom,sm8350-smmu-500
               - qcom,sm8450-smmu-500
           - const: arm,mmu-500
+
+      - description: Qcom Adreno GPUs implementing "arm,smmu-500"
+        items:
+          - enum:
+              - qcom,sc7280-smmu-500
+              - qcom,sm8250-smmu-500
+          - const: qcom,adreno-smmu
+          - const: arm,mmu-500
       - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
         items:
           - enum:
+              - qcom,msm8996-smmu-v2
               - qcom,sc7180-smmu-v2
+              - qcom,sdm630-smmu-v2
               - qcom,sdm845-smmu-v2
           - const: qcom,adreno-smmu
           - const: qcom,smmu-v2
-- 
2.35.1

