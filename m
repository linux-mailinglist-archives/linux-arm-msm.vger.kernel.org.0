Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C1225EA3C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 22:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgIEUFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 16:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgIEUFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 16:05:11 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F8FC061245;
        Sat,  5 Sep 2020 13:05:10 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id s10so2690290plp.1;
        Sat, 05 Sep 2020 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RI73hAm8taFHglKyL+fRjHiZ9E+te2SePrFdWbpImkA=;
        b=vcwVx61Pt9UhOQmiYEavtCbKoTKImHwiu+5jNHRaBSnjLI1sdwRkCWJV7Ec4krDahz
         lc+nmsDR6BxsvxOcXYoa1f00LwwOFO8ueOqgYAWv9LYJ6smg5RbifVEIzOgln8l3P/l1
         kxjB3AO/QbVXPZ4QDZ/L9rWZYPKkOqi94fVEADu5b5L08A3T75RNv0g8OHkw6+OVZXQn
         FZYfZfboXk3lS0zsdJbCw4Bb/18UXsxjbCWTj5LgU6LVp65iJ8gZvtPHviCUsWPFJstF
         dLaCPjABpEIDLYyxFhuGouemYzSkTEMaicAUMUcUcFsAakPRpDHPxT1f20D+zjUnlnNP
         jLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RI73hAm8taFHglKyL+fRjHiZ9E+te2SePrFdWbpImkA=;
        b=hBMnerkfntfmpO1njZBjv0+5/qsjAl3HsGniI8vjqQEmEsfkVOu3Nax8pmSSCBPFWv
         yFo1hQEcZr5jTsBumto5ZYNu0JpwHgetn0JNKfDShJ885BvHYCMvPzx6+em0hAUKFreB
         S6QUbwr2P9UcG/CpP8mCfDZhLAS6KnxQ9NXR9gdPaHFzxaUr6KXiqv9MSiea9t2dVrAh
         Go87xJG5Z3ZY0EuXcZwQuYgMwdqsv4GZn+6Us/PREoggbKXBTwSb5cb74tzlFLyBHbKj
         F1McEpEZKhqa41Liy7RvcgxGDk/2zLIExvr1vDSSft7hW0bp2aJSikoYrmyLVSe9k71W
         H3PA==
X-Gm-Message-State: AOAM531WZKI+H5bgfuuJuoZlRuVm+ZCehCFlgmhEOxrM+fzq5nXPIwij
        U3msX0qhZcV3+ivD7emHxyk=
X-Google-Smtp-Source: ABdhPJzMiqoqztwMnULjxDUjTNS0z8BEMDOuI3DDlzgg2GpvsRIBIOXD8OIwXo/hNDfPqheUam39uw==
X-Received: by 2002:a17:902:b092:b029:d0:89f1:9e2c with SMTP id p18-20020a170902b092b02900d089f19e2cmr12189283plr.8.1599336310134;
        Sat, 05 Sep 2020 13:05:10 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id x3sm10486542pfo.95.2020.09.05.13.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:05:08 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v17 18/20] dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
Date:   Sat,  5 Sep 2020 13:04:24 -0700
Message-Id: <20200905200454.240929-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
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

