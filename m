Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE44D62867E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238089AbiKNRGk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238094AbiKNRGj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:06:39 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D136D2AFD
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:38 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bp15so20263489lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM4WornFiW01h+ev1IYYNxP6M56aNDzG1elE0bGknSE=;
        b=R2I/GCNsc2V2QEHtzal1Vp90xDpVkZt8NWKcqYZoTid6E4u1u+kTkRMftrL6ttqebF
         d/+Lbqs2xyFhGfz7IWQ5f0kg41q2bHlKbOdW2J+/1eKPbCGwXq9lyNTVQ074YWSDeDc/
         9MyquEiEUbyctMIbk4sy2GkMW9igw4O/0Qbl690o83VYDAySX9UhvLsEDH+ZFCGqSDo8
         0CQkuQaUZ3I5hyEMMzLUh/fdXEr2h7IvahInxgRZoVdE290Q4xcW/NV4B+/PfsfbfjoO
         7bpIDD2mKn1BKZZDh6HY7Jw37Poaeyvx+1qEgK+td3RalSsJ+5IejQHx3D1087h2uA6L
         bTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JM4WornFiW01h+ev1IYYNxP6M56aNDzG1elE0bGknSE=;
        b=AiwRvA3Ou8YpJldrlz77JDqq7A2teaPsDWu/jX7DxB6munyzqK2w/pxDV6ugpsRdEV
         Ap/8okoV0fzlsf/HR8+sgbm5fVQNH7pgUqh5Ppg82YfU/7ZSn2N/j4sbsRccth5sXOPT
         rN3mxFSO8FaF3hZXmcNY1FzzkPIuwKleSrACS8NGhnOpNKGXepmssmzsv6bvbP3x1Y40
         YLqa3Pk1leoV6gUYHdY+ce6NMnSXOrDETO+c2K0x8Uz9/+K/j3gyEEUHZszyvcsxh+O5
         AFjo68htAguoKpjtHln57F0AU+mC4orRQGIAdKqg+f+qOmIZXNxc03fTj41z0MathUCc
         x1rQ==
X-Gm-Message-State: ANoB5pnNfHjDE6T3Y1MCLGua+neTm/NmwYtebQg0sQfy7it54J15l+cW
        MFoG4qCIMXO0PB2ojqq4bktobA==
X-Google-Smtp-Source: AA0mqf6cFV84uzJTbEzIvJ0qgqEPH88ulOsRSQtdVR/y0a4388kfPltmL6scgFiIjbUz32mKcUEg2g==
X-Received: by 2002:a05:6512:3590:b0:4ae:611c:6549 with SMTP id m16-20020a056512359000b004ae611c6549mr5098036lfr.231.1668445597211;
        Mon, 14 Nov 2022 09:06:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 09:06:36 -0800 (PST)
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
Subject: [PATCH v1 01/10] dt-bindings: arm-smmu: Add missing Qualcomm SMMU compatibles
Date:   Mon, 14 Nov 2022 20:06:26 +0300
Message-Id: <20221114170635.1406534-2-dmitry.baryshkov@linaro.org>
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

Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
platforms and for the Qualcomm v2 SMMU used on SDM630 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 3ade2dbca70e..aa863811996f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - qcom,msm8996-smmu-v2
               - qcom,msm8998-smmu-v2
+              - qcom,sdm630-smmu-v2
           - const: qcom,smmu-v2
 
       - description: Qcom SoCs implementing "arm,mmu-500"
@@ -51,10 +52,20 @@ properties:
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

