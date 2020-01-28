Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6CF514C2FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 23:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgA1WeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 17:34:23 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:18111 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726257AbgA1WeW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 17:34:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580250861; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KPGUQcF0y0b6zGbjLTPz7+ZC/IF0jWlRKWGLcU9qULU=; b=GAxMA2UXnNQlP5lRnFqDsROmj628lTCmEYQyAhLi9zZT9+99J0gSXjfGaRWei95uWGqsrX35
 z81CaO0ZLDUsmKqHP9DpJLJ3/lb82AMC7dM+FGGreAXjtA6e6iTPnpFF5n+MVqaxYx8KbUfB
 zAwr+ddjWh8l+NkTuz61My9E3Vc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e30b6e0.7f304b6e1ea0-smtp-out-n02;
 Tue, 28 Jan 2020 22:34:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 59979C433A2; Tue, 28 Jan 2020 22:34:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9F38C43383;
        Tue, 28 Jan 2020 22:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D9F38C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     iommu@lists.linux-foundation.org, Rob Clark <robdclark@gmail.com>
Cc:     robin.murphy@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>
Subject: [RFC PATCH v1] iommu/arm-smmu: Allow domains to choose a context bank
Date:   Tue, 28 Jan 2020 15:33:43 -0700
Message-Id: <1580250823-30739-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Domains which are being set up for split pagetables usually want to be
on a specific context bank for hardware reasons. Force the context
bank for domains with the split-pagetable quirk to context bank 0.
If context bank 0 is taken, move that context bank to another unused
bank and rewrite the stream matching registers accordingly.

This is be used by [1] and [2] to leave context bank 0 open so that
the Adreno GPU can program it.

[1] https://lists.linuxfoundation.org/pipermail/iommu/2020-January/041438.html
[2] https://lists.linuxfoundation.org/pipermail/iommu/2020-January/041444.html

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 63 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 85a6773..799a254 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -254,6 +254,43 @@ static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
 	return idx;
 }
 
+static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx);
+
+static int __arm_smmu_alloc_cb(struct arm_smmu_device *smmu, int start,
+		int target)
+{
+	int new, i;
+
+       /* Allocate a new context bank id */
+	new = __arm_smmu_alloc_bitmap(smmu->context_map, start,
+		smmu->num_context_banks);
+
+	if (new < 0)
+		return new;
+
+	/* If no target is set or we actually got the bank index we wanted */
+	if (target == -1 || new == target)
+		return new;
+
+	/* Copy the context configuration to the new index */
+	memcpy(&smmu->cbs[new], &smmu->cbs[target], sizeof(*smmu->cbs));
+	smmu->cbs[new].cfg->cbndx = new;
+
+	/* FIXME: Do we need locking here? */
+	for (i = 0; i < smmu->num_mapping_groups; i++) {
+		if (smmu->s2crs[i].cbndx == target) {
+			smmu->s2crs[i].cbndx = new;
+			arm_smmu_write_s2cr(smmu, i);
+		}
+	}
+
+	/*
+	 * FIXME: Does getting here imply that 'target' is already set in the
+	 * context_map?
+	 */
+	return target;
+}
+
 static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
 {
 	clear_bit(idx, map);
@@ -770,6 +807,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	unsigned long quirks = 0;
+	int forcecb = -1;
 
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -844,8 +882,25 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 			 * SEP_UPSTREAM so we don't need to reduce the size of
 			 * the ias to account for the sign extension bit
 			 */
-			if (smmu_domain->split_pagetables)
-				quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
+			if (smmu_domain->split_pagetables) {
+				/*
+				 * If split pagetables are enabled, assume that
+				 * the user's intent is to use per-instance
+				 * pagetables which, at least on a QCOM target,
+				 * means that this domain should be on context
+				 * bank 0.
+				 */
+
+				/*
+				 * If we can't force to context bank 0 then
+				 * don't bother enabling split pagetables which
+				 * then would not allow aux domains
+				 */
+				if (start == 0) {
+					forcecb = 0;
+					quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
+				}
+			}
 		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
 			fmt = ARM_32_LPAE_S1;
 			ias = min(ias, 32UL);
@@ -883,8 +938,8 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		ret = -EINVAL;
 		goto out_unlock;
 	}
-	ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
-				      smmu->num_context_banks);
+
+	ret = __arm_smmu_alloc_cb(smmu, start, forcecb);
 	if (ret < 0)
 		goto out_unlock;
 
-- 
2.7.4
