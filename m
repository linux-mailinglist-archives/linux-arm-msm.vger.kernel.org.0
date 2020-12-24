Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334282E24D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Dec 2020 07:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgLXGlZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Dec 2020 01:41:25 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:57774 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgLXGlZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Dec 2020 01:41:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608792064; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=CYxxh1le0AOhytdlur4fCuIDp8E9AeG0ihlFCtja0d0=; b=owsX/lZ/0sQtrw6QK6KHZiRI7ke90f3O70RjRUlymlP6Yj+jHpk8Qy8jCZtVw2XH0r6J317b
 G1wCcZjEzsAgzjHLrfGO1ZK3JtKk9YtoPiJnDafGmk2nzW6VYSM5igR6lJ8vy8WoJpBqJJV8
 Nq7hy+Ufz2h7iBZtRclZQ+Vk5/o=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fe437d7cfd94dd328f5697d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Dec 2020 06:40:23
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF02AC43465; Thu, 24 Dec 2020 06:40:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 74261C433CA;
        Thu, 24 Dec 2020 06:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 74261C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] iommu/io-pgtable-arm: Allow non-coherent masters to use system cache
Date:   Thu, 24 Dec 2020 12:10:07 +0530
Message-Id: <20201224064007.2339-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
the memory type setting required for the non-coherent masters to use
system cache. Now that system cache support for GPU is added, we will
need to mark the memory as normal sys-cached for GPU to use system cache.
Without this, the system cache lines are not allocated for GPU. We use
the IO_PGTABLE_QUIRK_ARM_OUTER_WBWA quirk instead of a page protection
flag as the flag cannot be exposed via DMA api because of no in-tree
users.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/io-pgtable-arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7c9ea9d7874a..3fb7de8304a2 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -415,6 +415,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 		else if (prot & IOMMU_CACHE)
 			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
 				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
+		else if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
+			pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
+				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
 	}
 
 	if (prot & IOMMU_CACHE)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

