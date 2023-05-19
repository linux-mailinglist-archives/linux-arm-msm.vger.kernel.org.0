Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93A0370A1F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 23:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbjESVst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 17:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbjESVsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 17:48:46 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D9F1BC
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 14:48:44 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d2ca9ef0cso1269499b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 14:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684532924; x=1687124924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeTyHFbJy5rhBfWD0hnvFzbXupDmLYxqq1Exk7EAP/w=;
        b=ColBuOzXXjCFMQOjtPodYD3uMQb4rjLPliuKPNMFxkYd6hOM8gmj/IeuhPJ1qz1CM/
         boorjeMp1fdHD/EXR+4jz9S+6sRQ8ESfS6CGwHBPCcB9ii5A0R/Zwtt5xSD/q4i8jCWg
         lJjOeJ+g6hPitj9KHtfagBPsDMHeXyFpYS1FXJV5soy4RPYU5lt/POhvdnfCd5jUtkR2
         7wxJlyy1itOV0JwbmvGHfeuIAN8teTep2iY5r7AkVh24Z3KwpM3xQo+edQHohnUMIdhC
         EiMYxCSewqZos4sUX75xKzYydGBytRqLbmwN8gw5sUuepkb+RIVLDPIMzaGzRdPzAbpa
         SJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684532924; x=1687124924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeTyHFbJy5rhBfWD0hnvFzbXupDmLYxqq1Exk7EAP/w=;
        b=VqjjT+AfwmQypqi/q13+bn7ReaKQlX2GAJUcrih5XPoSiTDh9C5mW0VIa1j7bCNMmm
         7dcMhdPJQlYd/Yi63AED9dCBHUd/t6VgLsxyVJoY11N2o2hax29RfTBBHFg/O971NUis
         QTCrCHJ9oQ1vBPoQDZWXBBGF2gDOORPvkKfu63FdDZ/KuVYhkcRG+fqxbKjeDpBfkJQY
         CR49mVPzJ2moV2kgBhQlZc4R+4piucC0/Nxp7rExiI7FTGoAr6Ns1m1Shem/KqsjPs2s
         jeCPrmEEbgJRxkC3NGyL+RYnjfjfANMQTdxUuMYUjyed/BmrbeiVw+3javbeVDDBho3K
         FLQg==
X-Gm-Message-State: AC+VfDwBx1hEvuYrKN4J+T4QKB8sO5wr0krcnzlPSH8yhIu128sWZCBD
        O+w67UP8cVGkwjDKmTygTFQxXo7sRjIafY+MSTg=
X-Google-Smtp-Source: ACHHUZ4d+RiqifJAN9YQvB4N1d4cj3vhVizoU37NH5TZBiMe7gQBz7emVyepjc7c2ZZZXOG2gtOxeA==
X-Received: by 2002:a05:6a00:1389:b0:64c:9b56:6215 with SMTP id t9-20020a056a00138900b0064c9b566215mr5339887pfg.25.1684532923753;
        Fri, 19 May 2023 14:48:43 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d309:883d:817e:8e91:be39])
        by smtp.gmail.com with ESMTPSA id n14-20020aa7904e000000b006470a6ef529sm144891pfo.88.2023.05.19.14.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 14:48:43 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org,
        stephan@gerhold.net, Anders Roxell <anders.roxell@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v7 02/11] dt-bindings: dma: Increase iommu maxItems for BAM DMA
Date:   Sat, 20 May 2023 03:18:04 +0530
Message-Id: <20230519214813.2593271-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230519214813.2593271-1-bhupesh.sharma@linaro.org>
References: <20230519214813.2593271-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
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
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
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

