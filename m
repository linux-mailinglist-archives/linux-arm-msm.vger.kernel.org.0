Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00718628D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 21:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388713AbfGHTBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 15:01:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43610 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732447AbfGHTBA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 15:01:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E223660E3F; Mon,  8 Jul 2019 19:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562612459;
        bh=8vvsLWPcHr0znTAIRbRfTb5WuDfVnCumJ8bN1RXKkaU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WCBItDyqdXQ80M9E9W6GK6F8HiOenmBMy9khHqj+UHTf1bVEVKH2STolV1x8ZzkRp
         ubmbSGE7TN9Y6LO+rWtkn1xf7oAMVPY/7icta+tV0M+6uK/16Vcn5phSInNFl3O9wj
         yZT6sC8ILmXaZzoc8ADGFpNJm2Qoj1aLxvnalEoQ=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F59660E40;
        Mon,  8 Jul 2019 19:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562612456;
        bh=8vvsLWPcHr0znTAIRbRfTb5WuDfVnCumJ8bN1RXKkaU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Upbw5W/djHsjIjuGf3gIhOy7HFDE4loB2ekFEU8qBMXVqNg4kaM4fLsyTssaxk5D1
         jHSu0mL/YhTYrNDb71e9+JvNqt7t87D7uj2fjYpvwVSQ3zTjPtmx0/wb2H8ffeXsmY
         92papmWE9htJ+GplCCwMzha46zOrNt6UtgY+Rvf0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F59660E40
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        baolu.lu@linux.intel.com, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v2 3/3] iommu/arm-smmu: Add support for DOMAIN_ATTR_SPLIT_TABLES
Date:   Mon,  8 Jul 2019 13:00:47 -0600
Message-Id: <1562612447-19856-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
References: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When DOMAIN_ATTR_SPLIT_TABLES is specified for pass ARM_64_LPAE_SPLIT_S1
to io_pgtable_ops to allocate and initialize TTBR0 and TTBR1 pagetables.

v3: Moved all the pagetable specific work into io-pgtable-arm
in a previous patch.

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

