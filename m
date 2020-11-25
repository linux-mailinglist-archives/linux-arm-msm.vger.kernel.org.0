Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2F12C3971
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 08:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgKYHBJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 02:01:09 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:42897 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726032AbgKYHBJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 02:01:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606287668; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=SuWGjInWRQ7Jtz7hUHTGJz8+gLtbxW0IcU/nO1ir5EU=; b=dK2cYeq2GG2FtPTJUlYfUxYLfLiu3ZVkQF9Mepgm4EMYpXJuXBHz/jmu6Uct3tdE5OvVE8oh
 fSZcpaVGpaa9rYYpWctD15cWw+4TgP1Gv8sLoUsoHzVxcOXRA95mglLdceTVlcxkWCeFFdNE
 XbJXTAj3aZ6BTOTCHuP0jHEWfGY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fbe011be9b7088622e1fde7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 07:00:43
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 71700C43466; Wed, 25 Nov 2020 07:00:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A486CC433C6;
        Wed, 25 Nov 2020 07:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A486CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        Kristian H Kristensen <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv10 2/9] iommu/io-pgtable-arm: Add support to use system cache
Date:   Wed, 25 Nov 2020 12:30:11 +0530
Message-Id: <f818676b4a2a9ad1edb92721947d47db41ed6a7c.1606287059.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a quirk IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to override
the outer-cacheability attributes set in the TCR for a
non-coherent page table walker when using system cache.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/io-pgtable-arm.c | 10 ++++++++--
 include/linux/io-pgtable.h     |  4 ++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index a7a9bc08dcd1..7c9ea9d7874a 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -761,7 +761,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_NON_STRICT |
-			    IO_PGTABLE_QUIRK_ARM_TTBR1))
+			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
+			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -773,10 +774,15 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 		tcr->sh = ARM_LPAE_TCR_SH_IS;
 		tcr->irgn = ARM_LPAE_TCR_RGN_WBWA;
 		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
+		if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
+			goto out_free_data;
 	} else {
 		tcr->sh = ARM_LPAE_TCR_SH_OS;
 		tcr->irgn = ARM_LPAE_TCR_RGN_NC;
-		tcr->orgn = ARM_LPAE_TCR_RGN_NC;
+		if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
+			tcr->orgn = ARM_LPAE_TCR_RGN_NC;
+		else
+			tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
 	}
 
 	tg1 = cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 215fd9d69540..fb4d5a763e0c 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -86,6 +86,9 @@ struct io_pgtable_cfg {
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
 	 *	for use in the upper half of a split address space.
+	 *
+	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the outer-cacheability
+	 *	attributes set in the TCR for a non-coherent page-table walker.
 	 */
 	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
@@ -93,6 +96,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
 	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
 	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
+	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA	BIT(6)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

