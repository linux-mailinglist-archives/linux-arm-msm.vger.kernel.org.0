Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9E82479C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbgHQWDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729396AbgHQWC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:59 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3093AC061389;
        Mon, 17 Aug 2020 15:02:59 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s15so8761259pgc.8;
        Mon, 17 Aug 2020 15:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKA+x0uy5NlO00Iqox0wh7pVzFT+/CgBiD5qZahgaMc=;
        b=VAMqIWBU3E4H7weX9792RxhLwClzSja5Owo67Nir+n0DGErszZ85LILA8By5JjWhiq
         pcpm3+G+LpRNVPPV7cxjVU/fGJYoWIhs26Mon4PQlXpZvrGvoIdy4PDNm9NQGR3eawWg
         HCoe8VNzumSPyjn/aDXRmJIqqBPvnKaGmhs3h1Pbrq6xZAy5G7T0181+qv78O8LcN01v
         ndtCFs5Y2cHk7rw9Kcshjp/R+oBiEEbyZZS5h78/o8S1/SuZE1ru05Bwnuzt4LwKtgbY
         NUsPwV8l5p24osze87hLN0fWuICNpDdLPzSFaGqyBudeTIsD6ZTx2sSqK8QvxTpYrwnw
         4Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKA+x0uy5NlO00Iqox0wh7pVzFT+/CgBiD5qZahgaMc=;
        b=ua/BHbLgDMUJsG6+LUZ7MMMqusSYsdW+SibYSSxveAkF6wS852Hnumf8hL6YmLs1Pa
         JLPwSjp2l0SirG4rwErBAl7ZL0gh75jruomsNvO1yhl79BjGt9mzmcOp8tX3g8l+1ORZ
         h1hVIxrdxnz5rV11NNylc17TXgCl2gcPJwrGn689DHpZjJtRhCMj+GLdeWtXg1lXM+gA
         3dJBbQDf2Yhvdm9YrS9uJZB7IlweB/mUJLNayWjaGvNO6bquS/yU47VOLXBaqWYtxRHI
         THsKlLkOFB5F20EoaNayeH0ALPaWzU8qRs4jJU2s3cfAVo/s30ca+5nRBFRT4yYTjo6u
         3bXQ==
X-Gm-Message-State: AOAM530qUjKtY5cEXg3tD4nly5L2n5o9mAtykHJiLS2O5VSfBAJhQu+6
        owhct3OSgsvVvnMlBKrC/h8=
X-Google-Smtp-Source: ABdhPJwRqI1VC8tNrq9d6HBXBZWWdKGzpiYCGqPx76mvvjUpcZ4iuBnTpueYAH+n+ifu5gdkS6wnNA==
X-Received: by 2002:a63:1b12:: with SMTP id b18mr11343563pgb.21.1597701778691;
        Mon, 17 Aug 2020 15:02:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id x13sm18066264pga.30.2020.08.17.15.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:02:57 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/20] dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
Date:   Mon, 17 Aug 2020 15:01:35 -0700
Message-Id: <20200817220238.603465-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 503160a7b9a0..5ec5d0d691f6 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -40,6 +40,10 @@ properties:
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
           - const: arm,mmu-500
+      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
+        items:
+          - const: qcom,adreno-smmu
+          - const: qcom,smmu-v2
       - description: Marvell SoCs implementing "arm,mmu-500"
         items:
           - const: marvell,ap806-smmu-500
-- 
2.26.2

