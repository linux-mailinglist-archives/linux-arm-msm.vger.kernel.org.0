Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF88259A4B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730268AbgIAQsD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgIAQri (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 12:47:38 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392B9C061244;
        Tue,  1 Sep 2020 09:47:38 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w186so971694pgb.8;
        Tue, 01 Sep 2020 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RI73hAm8taFHglKyL+fRjHiZ9E+te2SePrFdWbpImkA=;
        b=iK/gWhvX43nTVceqadIhYvSqK91IRCJCr5an4KZFK1DTvINxVcTZMuQyegyN/355Bw
         JZQ7Y2NxnEyNgHakr4ZD9u87n6KRWb0TKstSl2SZ3PzPV7YLJVSPcDu6euUaGOQkNRud
         h/4COkh5TdixQZkT8bM/oxcl04nzVQ3WdlDCo9PGw+fVjnSiUbbujl8LFIUnDWnDJ2Xd
         Kxrsomm8Prr7eCxcP7aZHzasUFTLyJ4ODxcdLAuEMq9dv/FyYghppWV3sNUAyRmMhpzB
         UUeqqU/WJ87+Ydrrx0WdNSh8807h1sbE0add+3495kD6sIYWodJy28OaQcodE2eH8PRw
         XMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RI73hAm8taFHglKyL+fRjHiZ9E+te2SePrFdWbpImkA=;
        b=ZdqfOy7U0CFeJVHGEmPeZ8uxIsatOO8x3/hbkhKUSktiEFhrumP8eOLv5BABjE1R12
         GC20lYgmVskXw6W0pCJWhmvULRFmRAa0Cp/M5dTlvk6oWe0m1P7WKjuVAplM/pRIGoYk
         domf20TWGOAZ7hB6E4gjjqoEoBsaH1K51PlK5FIz3QRu8M6whU5VyH3EU43+4/NoSXBM
         uAjoVRg56BzWfLx29XkOy8jo6ZMPWXI0BDkRJOoI1yuA77R77HP0YcFkvGY6NlVqv0eH
         NVwm/F8iNW7yX/BqzrxwrBUZcVjsGUXE1Hp02cRFKkwTzfZnwLGIexloMLEXp1xubnT3
         jgnw==
X-Gm-Message-State: AOAM532BgvmilTx5F75nxvCnT/IGxRltiU/F8eG5RArODZAGBJV9ls9i
        la4Oym5jnJUiu0RufF5j+cs=
X-Google-Smtp-Source: ABdhPJxqESFlReg5RGOlUO1KFXl0W8xH0asJAzoRAGy9j2bDD2ncGLx0thhLxLusFeJPcxyqh3MDbA==
X-Received: by 2002:a63:6d4c:: with SMTP id i73mr2312150pgc.63.1598978857690;
        Tue, 01 Sep 2020 09:47:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id i1sm2497656pfo.212.2020.09.01.09.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:47:36 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v16 18/20] dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
Date:   Tue,  1 Sep 2020 09:46:35 -0700
Message-Id: <20200901164707.2645413-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Every Qcom Adreno GPU has an embedded SMMU for its own use. These
devices depend on unique features such as split pagetables,
different stall/halt requirements and other settings. Identify them
with a compatible string so that they can be identified in the
arm-smmu implementation specific code.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 503160a7b9a0..3b63f2ae24db 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -28,8 +28,6 @@ properties:
           - enum:
               - qcom,msm8996-smmu-v2
               - qcom,msm8998-smmu-v2
-              - qcom,sc7180-smmu-v2
-              - qcom,sdm845-smmu-v2
           - const: qcom,smmu-v2
 
       - description: Qcom SoCs implementing "arm,mmu-500"
@@ -40,6 +38,13 @@ properties:
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
           - const: arm,mmu-500
+      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
+        items:
+          - enum:
+              - qcom,sc7180-smmu-v2
+              - qcom,sdm845-smmu-v2
+          - const: qcom,adreno-smmu
+          - const: qcom,smmu-v2
       - description: Marvell SoCs implementing "arm,mmu-500"
         items:
           - const: marvell,ap806-smmu-500
-- 
2.26.2

