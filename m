Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1ED2B677D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 15:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbgKQObu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 09:31:50 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:60892 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729677AbgKQObt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 09:31:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605623508; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=LrRpVHj99FoSmpaRiCpK2ER9nsObSvimyjTvEXFzFMs=; b=A5zjPR1a09+7xbErMTL0jBjQh3SE49Rp6M2GTSjwXX1BrkvRjl1oBo/bFXLdaBuZmVBtSeXw
 B5SATKy+/LLYn94/jZcWWSmCoC+pdWPCOSHi9Eca6EKFXB+QQ7OGVIoI+UpQAhHv2K+Op8Ok
 mUyWJqaC9wcG5f7W/fhMFD5mlzI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fb3deb4f34fcfd5e5779b9f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Nov 2020 14:31:16
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26082C43466; Tue, 17 Nov 2020 14:31:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24048C433C6;
        Tue, 17 Nov 2020 14:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24048C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv8 1/8] iommu/io-pgtable-arm: Add support to use system cache
Date:   Tue, 17 Nov 2020 20:00:40 +0530
Message-Id: <699f30cd6b3d69cebbefd0e73850694b9852c5da.1605621785.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a quirk IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to override
the attributes set in TCR for the page table walker when
using system cache.

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
index 4cde111e425b..a9a2c59fab37 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -86,6 +86,9 @@ struct io_pgtable_cfg {
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
 	 *	for use in the upper half of a split address space.
+	 *
+	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the attributes set in TCR for
+	 *	the page table walker when using system cache.
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

