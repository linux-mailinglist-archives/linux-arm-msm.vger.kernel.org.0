Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2A921B39A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 12:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbfEMKET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 06:04:19 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50502 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727690AbfEMKET (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 06:04:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D582D6030D; Mon, 13 May 2019 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557741857;
        bh=3XkmslwS7hhd6EdWnGyXu2LiPfgBfYAn/ge7FUSOMio=;
        h=From:To:Cc:Subject:Date:From;
        b=i7IElMERGgACywoAZa6u3aWYQd1W5SfUBTXCuSczHQJRbzJfCajsyRsX34fF3own8
         idNPyJUkg2tXfMWUl4+s3I27EmLz7yw/E1ZIja1BjaViPd/0oXJmqA+sTkbfMay88P
         WsAHaFrcGS1gd65ifVYanbWp7+vAJX7FgkiIi7Xo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-41.ap.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B9EF6032C;
        Mon, 13 May 2019 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557741857;
        bh=3XkmslwS7hhd6EdWnGyXu2LiPfgBfYAn/ge7FUSOMio=;
        h=From:To:Cc:Subject:Date:From;
        b=i7IElMERGgACywoAZa6u3aWYQd1W5SfUBTXCuSczHQJRbzJfCajsyRsX34fF3own8
         idNPyJUkg2tXfMWUl4+s3I27EmLz7yw/E1ZIja1BjaViPd/0oXJmqA+sTkbfMay88P
         WsAHaFrcGS1gd65ifVYanbWp7+vAJX7FgkiIi7Xo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4B9EF6032C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     will.deacon@arm.com, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux-foundation.org
Cc:     pdaly@codeaurora.org, linux-arm-msm@vger.kernel.org,
        pratikp@codeaurora.org, linux-kernel@vger.kernel.org,
        jcrouse@codeaurora.org, Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v4 1/1] iommu/io-pgtable-arm: Add support to use system cache
Date:   Mon, 13 May 2019 15:34:03 +0530
Message-Id: <20190513100403.18981-1-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Few Qualcomm platforms such as, sdm845 have an additional outer
cache called as System cache, aka. Last level cache (LLC) that
allows non-coherent devices to upgrade to using caching.
This cache sits right before the DDR, and is tightly coupled
with the memory controller. The clients using this cache request
their slices from this system cache, make it active, and can then
start using it.

There is a fundamental assumption that non-coherent devices can't
access caches. This change adds an exception where they *can* use
some level of cache despite still being non-coherent overall.
The coherent devices that use cacheable memory, and CPU make use of
this system cache by default.

Looking at memory types, we have following -
a) Normal uncached :- MAIR 0x44, inner non-cacheable,
                      outer non-cacheable;
b) Normal cached :-   MAIR 0xff, inner read write-back non-transient,
                      outer read write-back non-transient;
                      attribute setting for coherenet I/O devices.
and, for non-coherent i/o devices that can allocate in system cache
another type gets added -
c) Normal sys-cached :- MAIR 0xf4, inner non-cacheable,
                        outer read write-back non-transient

Coherent I/O devices use system cache by marking the memory as
normal cached.
Non-coherent I/O devices should mark the memory as normal
sys-cached in page tables to use system cache.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---

V3 version of this patch and related series can be found at [1].

This change is a realisation of following changes from downstream msm-4.9:
iommu: io-pgtable-arm: Implement IOMMU_USE_UPSTREAM_HINT[2]

Changes since v3:
 - Dropping support to cache i/o page tables to system cache. Getting support
   for data buffers is the first step.
   Removed io-pgtable quirk and related change to add domain attribute.

Glmark2 numbers on SDM845 based cheza board:

S.No.|	with LLC support   |	without LLC support
     |	for data buffers   |
---------------------------------------------------		
1    |	4480; 72.3fps      |	4042; 65.2fps
2    |	4500; 72.6fps      |	4039; 65.1fps
3    |	4523; 72.9fps	   |	4106; 66.2fps
4    |	4489; 72.4fps	   |	4104; 66.2fps
5    |	4518; 72.9fps	   |	4072; 65.7fps

[1] https://patchwork.kernel.org/cover/10772629/
[2] https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/?h=msm-4.9&id=d4c72c413ea27c43f60825193d4de9cb8ffd9602

 drivers/iommu/io-pgtable-arm.c | 9 ++++++++-
 include/linux/iommu.h          | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index d3700ec15cbd..2dbafe697531 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -167,10 +167,12 @@
 #define ARM_LPAE_MAIR_ATTR_MASK		0xff
 #define ARM_LPAE_MAIR_ATTR_DEVICE	0x04
 #define ARM_LPAE_MAIR_ATTR_NC		0x44
+#define ARM_LPAE_MAIR_ATTR_QCOM_SYS_CACHE	0xf4
 #define ARM_LPAE_MAIR_ATTR_WBRWA	0xff
 #define ARM_LPAE_MAIR_ATTR_IDX_NC	0
 #define ARM_LPAE_MAIR_ATTR_IDX_CACHE	1
 #define ARM_LPAE_MAIR_ATTR_IDX_DEV	2
+#define ARM_LPAE_MAIR_ATTR_IDX_QCOM_SYS_CACHE	3
 
 /* IOPTE accessors */
 #define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
@@ -442,6 +444,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 		else if (prot & IOMMU_CACHE)
 			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
 				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
+		else if (prot & IOMMU_QCOM_SYS_CACHE)
+			pte |= (ARM_LPAE_MAIR_ATTR_IDX_QCOM_SYS_CACHE
+				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
 	} else {
 		pte = ARM_LPAE_PTE_HAP_FAULT;
 		if (prot & IOMMU_READ)
@@ -841,7 +846,9 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	      (ARM_LPAE_MAIR_ATTR_WBRWA
 	       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
 	      (ARM_LPAE_MAIR_ATTR_DEVICE
-	       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV));
+	       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV)) |
+	      (ARM_LPAE_MAIR_ATTR_QCOM_SYS_CACHE
+	       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_QCOM_SYS_CACHE));
 
 	cfg->arm_lpae_s1_cfg.mair[0] = reg;
 	cfg->arm_lpae_s1_cfg.mair[1] = 0;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index a815cf6f6f47..29dd2c624348 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -31,6 +31,7 @@
 #define IOMMU_CACHE	(1 << 2) /* DMA cache coherency */
 #define IOMMU_NOEXEC	(1 << 3)
 #define IOMMU_MMIO	(1 << 4) /* e.g. things like MSI doorbells */
+#define IOMMU_QCOM_SYS_CACHE	(1 << 6)
 /*
  * Where the bus hardware includes a privilege level as part of its access type
  * markings, and certain devices are capable of issuing transactions marked as
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

