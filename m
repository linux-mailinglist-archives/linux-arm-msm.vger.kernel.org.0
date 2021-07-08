Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1FA13C1793
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 18:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhGHRB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 13:01:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29861 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229845AbhGHRB2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 13:01:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625763526; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=O4wkWN2rnP4eo3wD22+kpFg3/5NLciNL6N09wy5efvE=; b=N2w+VO0vEy5tp4h45V1GLWHi0LX5BsHl3TSpGoSsnU6PxHeSp2jzRo099GwtHQXfuSksBHkv
 FQWvJE0ca8++Yb+BFpW9YLTQgBvM+Lq/uj6TAios3TiUCMnrlbgOPArs2sF0iTidZTQ1CGgm
 XdLLj/jQyJxBp6MQRZu4WIiXfys=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60e72ec51938941955b32754 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Jul 2021 16:58:45
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22C72C4338A; Thu,  8 Jul 2021 16:58:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 599B5C433F1;
        Thu,  8 Jul 2021 16:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 599B5C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V2 2/2] soc: qcom: smem: validate fields of shared structures
Date:   Thu,  8 Jul 2021 22:28:22 +0530
Message-Id: <1625763502-22806-3-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625763502-22806-1-git-send-email-deesin@codeaurora.org>
References: <1625763502-22806-1-git-send-email-deesin@codeaurora.org>
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
 drivers/soc/qcom/smem.c | 82 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 72 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 9404eec..e4f62d9 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -366,13 +366,18 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 	struct smem_partition_header *phdr;
 	size_t alloc_size;
 	void *cached;
+	void *p_end;
 
 	phdr = part->virt_base;
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
 
@@ -530,47 +547,83 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 {
 	struct smem_private_entry *e, *end;
 	struct smem_partition_header *phdr;
+	void *item_ptr, *p_end;
+	u32 padding_data;
+	u32 e_size;
 
 	phdr = part->virt_base;
+	p_end = (void *)phdr + part->size;
 
 	e = phdr_to_first_uncached_entry(phdr);
 	end = phdr_to_last_uncached_entry(phdr);
 
+	if (WARN_ON((void *)end > p_end))
+		return ERR_PTR(-EINVAL);
+
 	while (e < end) {
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
 
-			return uncached_entry_to_item(e);
+			item_ptr = uncached_entry_to_item(e);
+			if (WARN_ON(item_ptr > p_end))
+				return ERR_PTR(-EINVAL);
+
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
 
-			return cached_entry_to_item(e);
+				*size = e_size - padding_data;
+			}
+
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
@@ -647,14 +700,23 @@ int qcom_smem_get_free_space(unsigned host)
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

