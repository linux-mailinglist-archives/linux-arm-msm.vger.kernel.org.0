Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A420032F55
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 14:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfFCMPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 08:15:41 -0400
Received: from ns.iliad.fr ([212.27.33.1]:51090 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbfFCMPk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 08:15:40 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 600F120A84;
        Mon,  3 Jun 2019 14:15:38 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 3DEF11FF14;
        Mon,  3 Jun 2019 14:15:38 +0200 (CEST)
Subject: [PATCH v3] iommu/arm-smmu: Avoid constant zero in TLBI writes
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        iommu <iommu@lists.linux-foundation.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
 <20190529130559.GB11023@fuggles.cambridge.arm.com>
 <84791515-e0ae-0322-78aa-02ca0b40d157@free.fr>
Message-ID: <09a290f1-27a0-5ee3-16b9-659ef2ba99dc@free.fr>
Date:   Mon, 3 Jun 2019 14:15:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <84791515-e0ae-0322-78aa-02ca0b40d157@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jun  3 14:15:38 2019 +0200 (CEST)
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
Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
Changes from v2:
- Define and use QCOM_DUMMY_VAL for the 3 problematic mmio writes
- Drop previous Reviewed-by and Tested-by tags (rationale: we are now writing a different value)

Boot log:
REMAP: PA=01680000 VA=ffffff80111b0000 SIZE=10000
arm-smmu 1680000.arm,smmu: probing hardware configuration...
arm-smmu 1680000.arm,smmu: SMMUv2 with:
arm-smmu 1680000.arm,smmu:      stage 1 translation
arm-smmu 1680000.arm,smmu:      address translation ops
arm-smmu 1680000.arm,smmu:      non-coherent table walk
arm-smmu 1680000.arm,smmu:      (IDR0.CTTW overridden by FW configuration)
arm-smmu 1680000.arm,smmu:      stream matching with 16 register groups
arm-smmu 1680000.arm,smmu:      6 context banks (0 stage-2 only)
arm-smmu 1680000.arm,smmu:      Supported page sizes: 0x63315000
arm-smmu 1680000.arm,smmu:      Stage-1: 36-bit VA -> 36-bit IPA
[        SMMU + 000048] = 00000000
[        SMMU + 000c00] = 00020000
[        SMMU + 000800] = 00000000
[        SMMU + 000c04] = 00020000
[        SMMU + 000804] = 00000000
[        SMMU + 000c08] = 00020000
[        SMMU + 000808] = 00000000
[        SMMU + 000c0c] = 00020000
[        SMMU + 00080c] = 00000000
[        SMMU + 000c10] = 00020000
[        SMMU + 000810] = 00000000
[        SMMU + 000c14] = 00020000
[        SMMU + 000814] = 00000000
[        SMMU + 000c18] = 00020000
[        SMMU + 000818] = 00000000
[        SMMU + 000c1c] = 00020000
[        SMMU + 00081c] = 00000000
[        SMMU + 000c20] = 00020000
[        SMMU + 000820] = 00000000
[        SMMU + 000c24] = 00020000
[        SMMU + 000824] = 00000000
[        SMMU + 000c28] = 00020000
[        SMMU + 000828] = 00000000
[        SMMU + 000c2c] = 00020000
[        SMMU + 00082c] = 00000000
[        SMMU + 000c30] = 00020000
[        SMMU + 000830] = 00000000
[        SMMU + 000c34] = 00020000
[        SMMU + 000834] = 00000000
[        SMMU + 000c38] = 00020000
[        SMMU + 000838] = 00000000
[        SMMU + 000c3c] = 00020000
[        SMMU + 00083c] = 00000000
[        SMMU + 008000] = 00000000
[        SMMU + 008058] = c00001fe
[        SMMU + 009000] = 00000000
[        SMMU + 009058] = c00001fe
[        SMMU + 00a000] = 00000000
[        SMMU + 00a058] = c00001fe
[        SMMU + 00b000] = 00000000
[        SMMU + 00b058] = c00001fe
[        SMMU + 00c000] = 00000000
[        SMMU + 00c058] = c00001fe
[        SMMU + 00d000] = 00000000
[        SMMU + 00d058] = c00001fe
[        SMMU + 00006c] = ffffffff
[        SMMU + 000068] = ffffffff
[        SMMU + 000070] = ffffffff
[        SMMU + 000000] = 00201e36
[        SMMU + 000800] = 00001fff
[        SMMU + 000800] = 1fff0000
[        SMMU + 001800] = 00000001
[        SMMU + 001000] = 0001f300
[        SMMU + 008010] = 00038011
[        SMMU + 008030] = 0080351c
[        SMMU + 008020] = 00000000785d5000
[        SMMU + 008028] = 0000000000000000
[        SMMU + 008038] = 0004ff44
[        SMMU + 00803c] = 00000000
[        SMMU + 008000] = 00001067
[        SMMU + 000c00] = 00000000
atl1c 0000:01:00.0: Adding to iommu group 0
[        SMMU + 000c00] = 00000000
[        SMMU + 000800] = 80001480
---
 drivers/iommu/arm-smmu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 930c07635956..9435e4a7759f 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -59,6 +59,15 @@
 
 #include "arm-smmu-regs.h"
 
+/*
+ * Apparently, some Qualcomm arm64 platforms which appear to expose their SMMU
+ * global register space are still, in fact, using a hypervisor to mediate it
+ * by trapping and emulating register accesses. Sadly, some deployed versions
+ * of said trapping code have bugs wherein they go horribly wrong for stores
+ * using r31 (i.e. XZR/WZR) as the source register.
+ */
+#define QCOM_DUMMY_VAL -1
+
 #define ARM_MMU500_ACTLR_CPRE		(1 << 1)
 
 #define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
@@ -423,7 +432,7 @@ static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
 {
 	unsigned int spin_cnt, delay;
 
-	writel_relaxed(0, sync);
+	writel_relaxed(QCOM_DUMMY_VAL, sync);
 	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
 		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
 			if (!(readl_relaxed(status) & sTLBGSTATUS_GSACTIVE))
@@ -1761,8 +1770,8 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	}
 
 	/* Invalidate the TLB, just in case */
-	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLH);
-	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
+	writel_relaxed(QCOM_DUMMY_VAL, gr0_base + ARM_SMMU_GR0_TLBIALLH);
+	writel_relaxed(QCOM_DUMMY_VAL, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
 
 	reg = readl_relaxed(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
 
-- 
2.17.1
