Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D67607D06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 18:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbiJUQ4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 12:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiJUQ4T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 12:56:19 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE64A43325
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:55:48 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id j23so4513926lji.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1V79C6sUOMuHke6im7U/KGPAAIEinbvZsKwAJ+skWg=;
        b=SXHRzkKXofttZe/G3LEBQU+cp7BGyaEorRJK3v0SfgIv+2LYZSaavBcnVMmShBLCT+
         mR+qCsr6fAL24q4iwbXkRFBF/O09JVEBGe+ZOSk4Z6DURjJT5NKcBElAADFn7C6iLIxp
         yWtJjh4oEKGBor8y1iRp6v8x9LyKkqcJQ/lX8AclvpnYrmIojbVrcwV7+Itk/6fumpD3
         /p86ms1t81bFbpsWkuyiUiviQuqb6EXNzlabSYJ+u8z6tj+0WUd+4pBCB+iz5uv0r2l/
         RsG9adQ8vkmm8G9truhcbgCtwcsGWr0CUOZ/Nv4oxKncwKTyDLZX0mj6hxJi1+MlscpZ
         tR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1V79C6sUOMuHke6im7U/KGPAAIEinbvZsKwAJ+skWg=;
        b=KD92CLYIyfwOcPdrT0gR8Jj3dmvO3rzcLyN4eloill7ehJM0qNmxM6kYzVyN9D+aHa
         w66+CqMuxNWth0s7XpqhYTXPSWx3Ydq90SywsXj8RjJyGRdaR7TuO37kUG9rflbhxQ4N
         e+61bP51DZgcfb1zAez/5FeqlXngImjBTYcqJ3ZxgBtsxrnC8mCaEGFoPvGoBfrG8jeS
         FzYpsjwjWd+e+afZ488XPwbQQMOfYD9JFWnFjVxIjfYdKUnCpzMdqi6WaqhQQMmxRxSp
         bNuqOxPH183TpCXn+zBpCPc/93shRf0/sJRjePO1TXUNTt1tfNxoKHt61jhtZobiWOON
         RTsw==
X-Gm-Message-State: ACrzQf1wbxngSDuMI4a5TvV5AOZO1OpDWqrL06H0h3xEDuq+PDP9BtTd
        JxANkHyA7w4Uutp1kw0gmUe7EA==
X-Google-Smtp-Source: AMsMyM4ZwzA/9qYXr0Ylgwy+8+4oJWjtym9xDnym9eNdTzpXpeSZrCYheWZaDSw2pFE6iCh7YY7u+Q==
X-Received: by 2002:a2e:a789:0:b0:26f:c3e0:4e4d with SMTP id c9-20020a2ea789000000b0026fc3e04e4dmr7085266ljf.499.1666371336036;
        Fri, 21 Oct 2022 09:55:36 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:55:35 -0700 (PDT)
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
Subject: [RFC PATCH 1/9] dt-bindings: arm-smmu: Add missing Qualcomm SMMU compatibles
Date:   Fri, 21 Oct 2022 19:55:26 +0300
Message-Id: <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
platforms and for the Qualcomm v2 SMMU used on SDM630 platform.

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

