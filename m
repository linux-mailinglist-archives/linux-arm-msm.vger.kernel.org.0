Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAAA607D01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 18:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiJUQ4d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 12:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbiJUQ4L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 12:56:11 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6094750060
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:55:49 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id j14so4473828ljh.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMEQSClTRMQsJD+9t3DdUS4Nt9IsdcSTttNc0HG6j6A=;
        b=hzxB0eJP28Iu8l61VnMXnzjgEYOcymrj2maH7pE0gMP+UfyFToDoOWqpSa1aZHcoCd
         Qh0MYZ9qNGXwQS/UOuaEh5fFU0AQwfSbunDmPS5lJcNPN/4tXvqysZxQGqpbQKWMy0wf
         Hc1QszhEz7CNu7AC+gHOcU6R0poMUeUyBAUr50qCLfHnxqMqFv37JKYFIizAHlYyWJly
         B9/rwEJniab2HXPeZVRfUFZwyDzyeMceDx9h4yWVKHHYUkuoxsAHBHdMMPGf62jUlLyE
         SQzfR5TNWZK32IATo92wvu32BqbJeEFSiX9cd7KlqGmGPmAmQoXrvlPyAGbrn84UWMqQ
         fb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMEQSClTRMQsJD+9t3DdUS4Nt9IsdcSTttNc0HG6j6A=;
        b=nL8kCqkzBS7TA+Nn+1uCMW58Ss62WY38im5tR7owk7DwOJDlNRLZnoxDha87kVbGxC
         BuC5FjL87tRHjHRs7O2LIMK1bn0d0zV967/HzIo0+TdNt9cfNNMWbJJ4TH7GqwzRfwde
         JJAdC5U0tPwjU+QE2b9I3/a/EnijB9cd4+K3kYU9Lrt/rv4JQPyAvi+SwdWfYP6fYlO5
         vCt7jr3cvb6BNZ+PQKtOEtCQPvILYTmCBmdM/Hthbo+5sVdlwT0MyBRQsjHx57eaYlsa
         xyYryGu9a7hN/k8bTf9AHrKTfOo0pCKCm8WKtls7l9AqmNIIWqx/v4ZRGrBuDSq1Br2k
         olfA==
X-Gm-Message-State: ACrzQf033gq8g6Roa+pMjpNewmVx14ZIH1FSdifs9hd9srRdXOsZwaOb
        JxQGo/qqKKw6jz/lD4xWrWCDXQ==
X-Google-Smtp-Source: AMsMyM445/+JMKypTBG8ttI3XH+cJ8iJV4lWsSKuySjmPLbykrki037KJsfLDkwsQljw/8mOaq82iw==
X-Received: by 2002:a2e:9859:0:b0:26f:cdad:e00d with SMTP id e25-20020a2e9859000000b0026fcdade00dmr6819009ljj.419.1666371337583;
        Fri, 21 Oct 2022 09:55:37 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:55:37 -0700 (PDT)
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
Subject: [RFC PATCH 3/9] dt-bindings: arm-smmu: Add generic qcom,smmu-500 bindings
Date:   Fri, 21 Oct 2022 19:55:28 +0300
Message-Id: <20221021165534.2334329-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index bae9fb3ffadb..796dc7d4dbdd 100644
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

