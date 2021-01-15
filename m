Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69512F74D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 10:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbhAOJEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 04:04:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:34328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726494AbhAOJEV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 04:04:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4456207C4;
        Fri, 15 Jan 2021 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610701420;
        bh=uJhyVV4SVJoHx8fWIPl5o7ANEKCUgWUsewnTvhAof9U=;
        h=From:To:Cc:Subject:Date:From;
        b=EUSNT7TXVa3THjMLvJ+xFW45BgCuydAqAFcI7I2rr3J1kswQdXWflyzp5Da55SYNH
         p+wP2hX66nSWhvmrlb1qP9plAMQv9A04X/gHYVZNAXNebLEt20jiztjvsRQoad5cNP
         kVOSPtEFBoyyf8l8fuMp3ECQt173K+DlfGOohHFL3NrgnQf3sJp63IQdSh+74eNnWy
         uFnvuZsQulHsEq+AXiXUnykoBcABIT89GNDXSS401avmqyUSpJlkRWn6nc6lGm9wGv
         PJUtD9/jB3re2sPQijfaQX143UWmENvDwFcPoNPeTqnaHh1aNCs36sbYK6ZHVPeJgL
         Y1i0KpMs9Jk3w==
From:   Vinod Koul <vkoul@kernel.org>
To:     Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm-smmu: Add sm8350 compatible string
Date:   Fri, 15 Jan 2021 14:33:21 +0530
Message-Id: <20210115090322.2287538-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible string for sm8350 iommu to documentation.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 3b63f2ae24db..161a5d389808 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,sdm845-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
+              - qcom,sm8350-smmu-500
           - const: arm,mmu-500
       - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
         items:
-- 
2.26.2

