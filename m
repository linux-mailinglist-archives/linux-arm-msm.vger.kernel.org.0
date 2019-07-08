Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 819D162808
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 20:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391359AbfGHSKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 14:10:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54236 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391076AbfGHSKc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 14:10:32 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DD2F2611D1; Mon,  8 Jul 2019 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562609430;
        bh=xc3K/NrdBEaL95vnh28d+67UATTmmmFkY/nNFHRLfGo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WtnxYmmJfDFFC3ZXL2Jt7pK6XeoHlYEkvYbO/ZegOQMTXUdIz88Q/QhG2UA02bk6O
         e7BUbq446SPLKxHXsUjNy8rSVjL4nbcKgyzT7aZcPkzgzoa7ME16pMjNHtMyqv/XKu
         CbNyOsRsGeoUh45EO3aUg1QO9TN1d3Q7EpmTdjLQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E7D546118F;
        Mon,  8 Jul 2019 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562609428;
        bh=xc3K/NrdBEaL95vnh28d+67UATTmmmFkY/nNFHRLfGo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X3CKBpHmq8kNLiWfhNh0vkxDilmJZ/IdNkQuSuV824oCpjlWbnUXvMI4V/68WPG3k
         O49xsnWLyPK/TIeADf5UiLifp/hxMLuAIkNdTFBnj6XZwnkUIMWbLihOHQqU8EeNrK
         u+PYnNg/4nckxVTPXIz49sLijvNZrLalnaJuuU4U=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E7D546118F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        dianders@chromimum.org, hoegsberg@google.com,
        baolu.lu@linux.intel.com, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] iommu/arm-smmu: Add support for DOMAIN_ATTR_SPLIT_TABLES
Date:   Mon,  8 Jul 2019 12:10:18 -0600
Message-Id: <1562609418-25446-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562609418-25446-1-git-send-email-jcrouse@codeaurora.org>
References: <1562609418-25446-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When DOMAIN_ATTR_SPLIT_TABLES is specified for pass ARM_64_LPAE_SPLIT_S1
to io_pgtable_ops to allocate and initialize TTBR0 and TTBR1 pagetables.

v3: Moved all the pagetable specific work into io-pgtable-arm in a previous
patch.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 653b6b3..7a6b4bb 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -257,6 +257,7 @@ struct arm_smmu_domain {
 	bool				non_strict;
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
+	u32 attributes;
 	struct iommu_domain		domain;
 };
 
@@ -832,7 +833,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		ias = smmu->va_size;
 		oas = smmu->ipa_size;
 		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
-			fmt = ARM_64_LPAE_S1;
+			if (smmu_domain->attributes &
+				(1 << DOMAIN_ATTR_SPLIT_TABLES))
+				fmt = ARM_64_LPAE_SPLIT_S1;
+			else
+				fmt = ARM_64_LPAE_S1;
 		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
 			fmt = ARM_32_LPAE_S1;
 			ias = min(ias, 32UL);
@@ -1582,6 +1587,10 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 		case DOMAIN_ATTR_NESTING:
 			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
 			return 0;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			*(int *)data = !!(smmu_domain->attributes &
+				(1 << DOMAIN_ATTR_SPLIT_TABLES));
+			return 0;
 		default:
 			return -ENODEV;
 		}
@@ -1622,6 +1631,11 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
 			else
 				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
 			break;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			if (*((int *)data))
+				smmu_domain->attributes |=
+					(1 << DOMAIN_ATTR_SPLIT_TABLES);
+			break;
 		default:
 			ret = -ENODEV;
 		}
-- 
2.7.4

