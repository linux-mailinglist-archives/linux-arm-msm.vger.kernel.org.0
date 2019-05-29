Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D3E2DC3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 13:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfE2Lzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 07:55:50 -0400
Received: from ns.iliad.fr ([212.27.33.1]:46732 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbfE2Lzu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 07:55:50 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id C0B5D209AE;
        Wed, 29 May 2019 13:55:48 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id A6481207DC;
        Wed, 29 May 2019 13:55:48 +0200 (CEST)
To:     Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        iommu <iommu@lists.linux-foundation.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v2] iommu/arm-smmu: Avoid constant zero in TLBI writes
Message-ID: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
Date:   Wed, 29 May 2019 13:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed May 29 13:55:48 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Robin Murphy <robin.murphy@arm.com>

Apparently, some Qualcomm arm64 platforms which appear to expose their
SMMU global register space are still, in fact, using a hypervisor to
mediate it by trapping and emulating register accesses. Sadly, some
deployed versions of said trapping code have bugs wherein they go
horribly wrong for stores using r31 (i.e. XZR/WZR) as the source
register.

While this can be mitigated for GCC today by tweaking the constraints
for the implementation of writel_relaxed(), to avoid any potential
arms race with future compilers more aggressively optimising register
allocation, the simple way is to just remove all the problematic
constant zeros. For the write-only TLB operations, the actual value is
irrelevant anyway and any old nearby variable will provide a suitable
GPR to encode. The one point at which we really do need a zero to clear
a context bank happens before any of the TLB maintenance where crashes
have been reported, so is apparently not a problem... :/

Reported-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
Changes from v1:
- Tweak commit message (remove "compilers", s/hangs/crashes)
- Add a comment before writel_relaxed
---
 drivers/iommu/arm-smmu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 5e54cc0a28b3..3f352268fa8b 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -423,7 +423,8 @@ static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
 {
 	unsigned int spin_cnt, delay;
 
-	writel_relaxed(0, sync);
+	/* Write "garbage" (rather than 0) to work around a qcom bug */
+	writel_relaxed((unsigned long)sync, sync);
 	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
 		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
 			if (!(readl_relaxed(status) & sTLBGSTATUS_GSACTIVE))
@@ -1763,8 +1764,9 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	}
 
 	/* Invalidate the TLB, just in case */
-	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLH);
-	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
+	/* Write "garbage" (rather than 0) to work around a qcom bug */
+	writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_TLBIALLH);
+	writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
 
 	reg = readl_relaxed(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
 
-- 
2.17.1
