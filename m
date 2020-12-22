Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122F82E0387
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 01:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgLVApr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 19:45:47 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:13009 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgLVApq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 19:45:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608597927; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bYabydo/dXbRQkL5qXIuDQBWRKY+jGONTXRs3liUi6M=; b=UC+UFZFPVdVfuidL+tApd0uIR6GQ0B5mwXtIUp9UYwFQiE0O0Poxxsy1Lj7+XBBl3otqW8He
 VasQUbxJ7uvZo1MDy0YxgwX2HUDnP4xQTWRhHA0yrSgaU3FgHF2CsMbMEk+WHViZXrIhNrw+
 KEcOQbWWMnRAExDyuReAK2ax0zM=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fe14183b00c0d7ad406b461 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 00:44:51
 GMT
Sender: isaacm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7535C43466; Tue, 22 Dec 2020 00:44:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: isaacm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F294C43464;
        Tue, 22 Dec 2020 00:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F294C43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=isaacm@codeaurora.org
From:   "Isaac J. Manjarres" <isaacm@codeaurora.org>
To:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     "Isaac J. Manjarres" <isaacm@codeaurora.org>, will@kernel.org,
        joro@8bytes.org, pdaly@codeaurora.org, pratikp@codeaurora.org,
        kernel-team@android.com, robin.murphy@arm.com
Subject: [PATCH v2 2/7] iommu/io-pgtable: Add refcounting for io-pgtable format modules
Date:   Mon, 21 Dec 2020 16:44:31 -0800
Message-Id: <1608597876-32367-3-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for modularizing io-pgtable formats, add support
for reference counting the io-pgtable format modules to ensure
that the modules are not unloaded while they are in use.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/io-pgtable-arm-v7s.c |  1 +
 drivers/iommu/io-pgtable-arm.c     |  5 +++++
 drivers/iommu/io-pgtable.c         | 12 ++++++++++--
 include/linux/io-pgtable.h         |  2 ++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 89aad2f..a5cb755a 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -840,6 +840,7 @@ static struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns = {
 	.fmt	= ARM_V7S,
 	.alloc	= arm_v7s_alloc_pgtable,
 	.free	= arm_v7s_free_pgtable,
+	.owner	= THIS_MODULE,
 };
 
 #ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index ff0ea2f..e8b1e34 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1049,26 +1049,31 @@ static struct io_pgtable_init_fns io_pgtable_arm_lpae_init_fns[] = {
 		.fmt	= ARM_32_LPAE_S1,
 		.alloc	= arm_32_lpae_alloc_pgtable_s1,
 		.free	= arm_lpae_free_pgtable,
+		.owner	= THIS_MODULE,
 	},
 	{
 		.fmt	= ARM_32_LPAE_S2,
 		.alloc	= arm_32_lpae_alloc_pgtable_s2,
 		.free	= arm_lpae_free_pgtable,
+		.owner	= THIS_MODULE,
 	},
 	{
 		.fmt	= ARM_64_LPAE_S1,
 		.alloc	= arm_64_lpae_alloc_pgtable_s1,
 		.free	= arm_lpae_free_pgtable,
+		.owner	= THIS_MODULE,
 	},
 	{
 		.fmt	= ARM_64_LPAE_S2,
 		.alloc	= arm_64_lpae_alloc_pgtable_s2,
 		.free	= arm_lpae_free_pgtable,
+		.owner	= THIS_MODULE,
 	},
 	{
 		.fmt	= ARM_MALI_LPAE,
 		.alloc	= arm_mali_lpae_alloc_pgtable,
 		.free	= arm_lpae_free_pgtable,
+		.owner	= THIS_MODULE,
 	},
 };
 
diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
index 2c6eb2e..cc83542 100644
--- a/drivers/iommu/io-pgtable.c
+++ b/drivers/iommu/io-pgtable.c
@@ -10,6 +10,7 @@
 #include <linux/bug.h>
 #include <linux/io-pgtable.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/rwlock.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -52,9 +53,14 @@ struct io_pgtable_ops *alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
 	if (!fns)
 		return NULL;
 
+	if (!try_module_get(fns->owner))
+		return NULL;
+
 	iop = fns->alloc(cfg, cookie);
-	if (!iop)
+	if (!iop) {
+		module_put(fns->owner);
 		return NULL;
+	}
 
 	iop->fmt	= fmt;
 	iop->cookie	= cookie;
@@ -79,8 +85,10 @@ void free_io_pgtable_ops(struct io_pgtable_ops *ops)
 	iop = io_pgtable_ops_to_pgtable(ops);
 	io_pgtable_tlb_flush_all(iop);
 	fns = io_pgtable_get_init_fns(iop->fmt);
-	if (fns)
+	if (fns) {
 		fns->free(iop);
+		module_put(fns->owner);
+	}
 }
 EXPORT_SYMBOL_GPL(free_io_pgtable_ops);
 
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 45b367ce..a03b262 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -169,11 +169,13 @@ struct io_pgtable_ops {
  * @fmt:   The page table format.
  * @alloc: Allocate a set of page tables described by cfg.
  * @free:  Free the page tables associated with iop.
+ * @owner: Driver module providing these ops.
  */
 struct io_pgtable_init_fns {
 	enum io_pgtable_fmt fmt;
 	struct io_pgtable *(*alloc)(struct io_pgtable_cfg *cfg, void *cookie);
 	void (*free)(struct io_pgtable *iop);
+	struct module *owner;
 };
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

