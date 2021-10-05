Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEFC422273
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 11:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbhJEJiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 05:38:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42349 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbhJEJiU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 05:38:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633426590; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=R+LERM0seDW8SBOw059obORoY8z/0IQsjwzbtxrxc5Q=; b=KMIM7YfzN2JMPkig9Z6MzlNmDAu2iihTk5fqzPpDhe4L+tncA4abv57q4qH0U/lN2VKay70O
 hK+4Xy6KJcr1ueCVGxzpF/HfRIxImbscujHagh2y8pGnn14FbIrRbm99DKCr0RPu8AkU2hzo
 DHoNJQX3il7X8kndKnQ0IFCWMcw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615c1c8a47d64efb6d061c0d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 09:36:10
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3C65C43616; Tue,  5 Oct 2021 09:36:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1EB4CC4360D;
        Tue,  5 Oct 2021 09:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1EB4CC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V3 2/2] soc: qcom: smem: validate fields of shared structures
Date:   Tue,  5 Oct 2021 15:02:45 +0530
Message-Id: <1633426371-4827-3-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633426371-4827-1-git-send-email-deesin@codeaurora.org>
References: <1633426371-4827-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Structures in shared memory that can be modified by remote
processors may have untrusted values, they should be validated
before use.

Adding proper validation before using fields of shared
structures.

Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/smem.c | 79 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index dfbd06b..5cd3ddb 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -366,13 +366,18 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 	struct smem_partition_header *phdr;
 	size_t alloc_size;
 	void *cached;
+	void *p_end;
 
 	phdr = (struct smem_partition_header __force *)part->virt_base;
+	p_end = (void *)phdr + part->size;
 
 	hdr = phdr_to_first_uncached_entry(phdr);
 	end = phdr_to_last_uncached_entry(phdr);
 	cached = phdr_to_last_cached_entry(phdr);
 
+	if (WARN_ON((void *)end > p_end || (void *)cached > p_end))
+		return -EINVAL;
+
 	while (hdr < end) {
 		if (hdr->canary != SMEM_PRIVATE_CANARY)
 			goto bad_canary;
@@ -382,6 +387,9 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 		hdr = uncached_entry_next(hdr);
 	}
 
+	if (WARN_ON((void *)hdr > p_end))
+		return -EINVAL;
+
 	/* Check that we don't grow into the cached region */
 	alloc_size = sizeof(*hdr) + ALIGN(size, 8);
 	if ((void *)hdr + alloc_size > cached) {
@@ -500,6 +508,8 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
 	struct smem_header *header;
 	struct smem_region *region;
 	struct smem_global_entry *entry;
+	u64 entry_offset;
+	u32 e_size;
 	u32 aux_base;
 	unsigned i;
 
@@ -514,9 +524,16 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
 		region = &smem->regions[i];
 
 		if (region->aux_base == aux_base || !aux_base) {
+			e_size = le32_to_cpu(entry->size);
+			entry_offset = le32_to_cpu(entry->offset);
+
+			if (WARN_ON(e_size + entry_offset > region->size))
+				return ERR_PTR(-EINVAL);
+
 			if (size != NULL)
-				*size = le32_to_cpu(entry->size);
-			return region->virt_base + le32_to_cpu(entry->offset);
+				*size = e_size;
+
+			return region->virt_base + entry_offset;
 		}
 	}
 
@@ -530,8 +547,12 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 {
 	struct smem_private_entry *e, *end;
 	struct smem_partition_header *phdr;
+	void *item_ptr, *p_end;
+	u32 padding_data;
+	u32 e_size;
 
 	phdr = (struct smem_partition_header __force *)part->virt_base;
+	p_end = (void *)phdr + part->size;
 
 	e = phdr_to_first_uncached_entry(phdr);
 	end = phdr_to_last_uncached_entry(phdr);
@@ -541,36 +562,65 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 			goto invalid_canary;
 
 		if (le16_to_cpu(e->item) == item) {
-			if (size != NULL)
-				*size = le32_to_cpu(e->size) -
-					le16_to_cpu(e->padding_data);
+			if (size != NULL) {
+				e_size = le32_to_cpu(e->size);
+				padding_data = le16_to_cpu(e->padding_data);
+
+				if (WARN_ON(e_size > part->size || padding_data > e_size))
+					return ERR_PTR(-EINVAL);
+
+				*size = e_size - padding_data;
+			}
+
+			item_ptr = uncached_entry_to_item(e);
+			if (WARN_ON(item_ptr > p_end))
+				return ERR_PTR(-EINVAL);
 
-			return uncached_entry_to_item(e);
+			return item_ptr;
 		}
 
 		e = uncached_entry_next(e);
 	}
 
+	if (WARN_ON((void *)e > p_end))
+		return ERR_PTR(-EINVAL);
+
 	/* Item was not found in the uncached list, search the cached list */
 
 	e = phdr_to_first_cached_entry(phdr, part->cacheline);
 	end = phdr_to_last_cached_entry(phdr);
 
+	if (WARN_ON((void *)e < (void *)phdr || (void *)end > p_end))
+		return ERR_PTR(-EINVAL);
+
 	while (e > end) {
 		if (e->canary != SMEM_PRIVATE_CANARY)
 			goto invalid_canary;
 
 		if (le16_to_cpu(e->item) == item) {
-			if (size != NULL)
-				*size = le32_to_cpu(e->size) -
-					le16_to_cpu(e->padding_data);
+			if (size != NULL) {
+				e_size = le32_to_cpu(e->size);
+				padding_data = le16_to_cpu(e->padding_data);
+
+				if (WARN_ON(e_size > part->size || padding_data > e_size))
+					return ERR_PTR(-EINVAL);
+
+				*size = e_size - padding_data;
+			}
 
-			return cached_entry_to_item(e);
+			item_ptr = cached_entry_to_item(e);
+			if (WARN_ON(item_ptr < (void *)phdr))
+				return ERR_PTR(-EINVAL);
+
+			return item_ptr;
 		}
 
 		e = cached_entry_next(e, part->cacheline);
 	}
 
+	if (WARN_ON((void *)e < (void *)phdr))
+		return ERR_PTR(-EINVAL);
+
 	return ERR_PTR(-ENOENT);
 
 invalid_canary:
@@ -647,14 +697,23 @@ int qcom_smem_get_free_space(unsigned host)
 		phdr = part->virt_base;
 		ret = le32_to_cpu(phdr->offset_free_cached) -
 		      le32_to_cpu(phdr->offset_free_uncached);
+
+		if (ret > le32_to_cpu(part->size))
+			return -EINVAL;
 	} else if (__smem->global_partition.virt_base) {
 		part = &__smem->global_partition;
 		phdr = part->virt_base;
 		ret = le32_to_cpu(phdr->offset_free_cached) -
 		      le32_to_cpu(phdr->offset_free_uncached);
+
+		if (ret > le32_to_cpu(part->size))
+			return -EINVAL;
 	} else {
 		header = __smem->regions[0].virt_base;
 		ret = le32_to_cpu(header->available);
+
+		if (ret > __smem->regions[0].size)
+			return -EINVAL;
 	}
 
 	return ret;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

