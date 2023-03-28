Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDDDE6CBAF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 11:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbjC1J3D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 05:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbjC1J2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 05:28:49 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C686599
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 02:28:35 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id z18so6780786pgj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 02:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679995714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45NVBVpYiF52cvaoHl0w4JJTLlfK1ZDLXhzA7w3zmPk=;
        b=TLDzLsHpth8IUGtp3w8bjw8rLsSWIxS8ABFxLrfGTYx0r+LNV2lWq3Fc5RoKn9h+9K
         M2xGXjBXY74DTbX9FAQC+vVrV23FZd8lUp9rJnS/6Bw4y0H4h08J9TkxH464A2r2yjD7
         M8Io1MUbk/JQRJiR3osXoJTbREMOXA7Nlgtp4cEkO99jT1l/psUYQL5rSm0sM4azhUhg
         C/Hr/ya9ZTamCOqwKgHcEmP4zX3sKvnZEkw/0TGL54k6JcnreNLQ8Q6NqDMaggzrtHsm
         49jMmjt5yb+uCMSWPQsscFssXWWa9AqhNbgCSVrAjva0uNJjoCUhUeZUZzjAaatiWb/J
         HiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679995714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45NVBVpYiF52cvaoHl0w4JJTLlfK1ZDLXhzA7w3zmPk=;
        b=EEVYvlTgUVXEDUxD4bYdYzhgTZ+PrWyCMtDBP/xdOhhimV2OkJ/eolbh/r8Qb+945u
         SPMRt6RRjHyFGmVwqZyACKf+tGHeiCRJuNyReGfIHCCog2CyQ7Bh5G7Z3VlClxPvB4lJ
         imIhIEpNZHJEAGeztlMKnQiVTlOeRJak+8LNLAkvRyzYUQMvUZaiOfsBlTQL1T+yD7o2
         LNLgKJ1Vnd65qYfGkzp0h9dPsh+bFc9eFZnqU7RVNe4IgDxzFhjdoBQQPOUaP2ugYPKX
         yQCme5ce9hgWPT9phU6qk65FeZHDg/LEHXBNSY67OmbIUXgi9JraRfxxj6IuoeDG2EPh
         8syA==
X-Gm-Message-State: AAQBX9dbJ/GKxV9ashsS+2PQyrjMcv8HlEfI3h/ND/05K8V7KhE9BiwY
        cvGVQFAamyKL8SH3HYZhaemX7IaaFTE/9691WTs=
X-Google-Smtp-Source: AK7set/vKYNxYmVH9ZWrURDkGe8cq6scklByutM7pu/CGFllb/CT0afm/3FyjaEEREiVQtHevi8R/A==
X-Received: by 2002:a62:7b95:0:b0:625:ce06:e58 with SMTP id w143-20020a627b95000000b00625ce060e58mr14520157pfc.17.1679995714543;
        Tue, 28 Mar 2023 02:28:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:449a:10df:e7c1:9bdd:74f0])
        by smtp.gmail.com with ESMTPSA id a24-20020aa78658000000b005a8bc11d259sm21261518pfo.141.2023.03.28.02.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:28:34 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v3 2/9] dt-bindings: dma: Increase iommu maxItems for BAM DMA
Date:   Tue, 28 Mar 2023 14:58:08 +0530
Message-Id: <20230328092815.292665-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328092815.292665-1-bhupesh.sharma@linaro.org>
References: <20230328092815.292665-1-bhupesh.sharma@linaro.org>
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

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 624208d20a34..5469c9c2a1df 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -46,7 +46,7 @@ properties:
 
   iommus:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   num-channels:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.38.1

