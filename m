Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E16A6D25F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 18:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjCaQpV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 12:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjCaQpE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 12:45:04 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039E5AF1B
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:43:45 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id kc4so21747172plb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680281023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wgd39WnlXQz4tbC4i1NLP3F+sroosdBDzPGDIcLrLlo=;
        b=T6LwrBpZBlSDlLaXwtNMnDKJwfBivOvvmenmVRj1msSrG4nrSMx0xry1DhpgJIaS3y
         bz42OmdWMnzIILNT4SYz166gpg8+wZW/PKiTeBTKY9ZqFlkK4OE4D1T084ANV13SwkrG
         jTQajOdzNiP6odJmO0L4yPFLO9e2RvlYFTJSKOiWaeJ/8HqgkLX82FwwEWC1rChl6aLC
         k21/XEgQ4OcibpohIb7yLyuYK2Vi5aoKmJXpmqLYlMxN2d/6/unHhp0OnQxt6s4mHPTl
         Ba6ybeyaXNutFfhVn6kogJTKxopD1xrBnII79KSWBFr7W6WASwXB+fWGN06d9+Ig+wrF
         drHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680281023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wgd39WnlXQz4tbC4i1NLP3F+sroosdBDzPGDIcLrLlo=;
        b=hJbSPMGzG7grWre8nMwZSwDzRV02MVWLWRTdE8E/2qWpHm2ROEMmBIRJ53m4+kn/rs
         ooERZtfAhk3q/y1F8Z8IOIEZisFVH295CTsgkEGHnXrV591T9BI+1BX7R++YUOVzrOVL
         mceAfx3sNCFnE5U7V+CrKv9LWy90Te4GdFghP/T4M/P97cAD8f1MQ/10O+7dzQgHafRH
         uHxffUHEyOEXM0btjdA4g5Sn45m+oNUs/YruKSP7wlmhj9Q8rWCdIpR6eU+vHyFoLLGY
         Rk8YA4v2x2NoSyXqXaYKphaFMGLsx5vlUMGv9cENjECOQKoNSctaghnILB9GKJwnXtr0
         yZLA==
X-Gm-Message-State: AAQBX9eUTxfjum05GzaWa6cUjIXYFkwFiyaBEjsAQBwS9/Oo+lKRqs6c
        /9b/KBfEP3wYjNFuKorHWI/mUuis759wD8FACmw=
X-Google-Smtp-Source: AKy350bIjZHRfW1uqNsImLTp6bWMpGVbFLVr+SEmEmYzN7xWZMsVSQUhAU3AeWmpD4zbf9rqRxdOrg==
X-Received: by 2002:a17:902:e1d3:b0:1a2:9183:a49c with SMTP id t19-20020a170902e1d300b001a29183a49cmr4782053pla.32.1680281023592;
        Fri, 31 Mar 2023 09:43:43 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:53ce:1f39:30a5:d20f:f205])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902b40d00b0019b089bc8d7sm1798767plr.78.2023.03.31.09.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:43:43 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v4 02/11] dt-bindings: dma: Increase iommu maxItems for BAM DMA
Date:   Fri, 31 Mar 2023 22:13:14 +0530
Message-Id: <20230331164323.729093-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
References: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since SM8450 BAM DMA engine supports five iommu entries,
increase the maxItems in the iommu property section, without
which 'dtbs_check' reports the following error:

  arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb:
    dma-controller@1dc4000: iommus: is too long

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index c663b6102f50..5636d38f712a 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -44,7 +44,7 @@ properties:
 
   iommus:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   num-channels:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.38.1

