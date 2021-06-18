Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC9D3AC101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 04:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbhFRCxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 22:53:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:40067 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbhFRCxk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 22:53:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623984691; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zxQPpeHE4PXZNtmwVzMelrgiyD5OIghIFBC3EGIdK0Q=; b=rRBjLrm6Rkdsuy+aFGN0C1sWhBlq8w8pAsN5Fnsw9ojsf3TdImsbc5PIv3nXCTsi2u2Kxnmy
 HXzEzuMXtMEqS9JGm/5oSKTwUZajvakOy5c8RcurWqtwxmDISZwO8zHfB4cuXMOgD3kdBkBt
 VOkSqUea++Lgo5JSHjZLkQ5ioqg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60cc0a2fb6ccaab753da6e2a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 02:51:27
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AC490C4360C; Fri, 18 Jun 2021 02:51:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 283B3C4338A;
        Fri, 18 Jun 2021 02:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 283B3C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 1/3] iommu/io-pgtable: Add a quirk to use tlb_flush_all() for partial walk flush
Date:   Fri, 18 Jun 2021 08:21:03 +0530
Message-Id: <b099af10926b34249f4a30262db37f50491bebe7.1623981933.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a quirk IO_PGTABLE_QUIRK_TLB_INV_ALL to invalidate entire context
with tlb_flush_all() callback in partial walk flush to improve unmap
performance on select few platforms where the cost of over-invalidation
is less than the unmap latency.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/io-pgtable-arm.c | 3 ++-
 include/linux/io-pgtable.h     | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 87def58e79b5..5d362f2214bd 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -768,7 +768,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_NON_STRICT |
 			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
-			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
+			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
+			    IO_PGTABLE_QUIRK_TLB_INV_ALL))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 4d40dfa75b55..45441592a0e6 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -82,6 +82,10 @@ struct io_pgtable_cfg {
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the outer-cacheability
 	 *	attributes set in the TCR for a non-coherent page-table walker.
+	 *
+	 * IO_PGTABLE_QUIRK_TLB_INV_ALL: Use TLBIALL/TLBIASID to invalidate
+	 *	entire context for partial walk flush to increase unmap
+	 *	performance on select few platforms.
 	 */
 	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
@@ -89,6 +93,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
 	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
 	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA	BIT(6)
+	#define IO_PGTABLE_QUIRK_TLB_INV_ALL	BIT(7)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

