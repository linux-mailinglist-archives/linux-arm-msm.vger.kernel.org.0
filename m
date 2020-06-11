Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86EAA1F702A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 00:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgFKW3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 18:29:46 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59681 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbgFKW3n (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 18:29:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591914583; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=mDaZVoI24wgkU1CeRFdGycWx4I/u7pC8V5NQ57RvdXc=; b=TQiALTa6rycDCmmd0D3cZnMB835MZ5PdhDIge4Og03155nQVvGq1Djc7ZMYPJvio0nckYgaq
 rdTifFeWo/GMUag/4Ttq6eN6WERMGFGIbdtge3eWvfdnmWfL0fTvpqcZ/BUMPTMetnm3TW09
 q2rSYgUDgaQLdTlDyfgbUG3BMT4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5ee2b04ba3d8a447431ba374 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 22:29:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C8CFC43391; Thu, 11 Jun 2020 22:29:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E5C87C433B1;
        Thu, 11 Jun 2020 22:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5C87C433B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] iommu/arm-smmu: Add a domain attribute to pass the pagetable config
Date:   Thu, 11 Jun 2020 16:29:18 -0600
Message-Id: <20200611222921.464-4-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611222921.464-1-jcrouse@codeaurora.org>
References: <20200611222921.464-1-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Adreno GPU has the capacity to manage its own pagetables and switch
them dynamically from the hardware. Add a domain attribute for arm-smmu-v2
to get the default pagetable configuration so that the GPU driver can match
the format for its own pagetables.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 12 ++++++++++++
 include/linux/iommu.h    |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 46a96c578592..a06cbcaec247 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1710,6 +1710,18 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 		case DOMAIN_ATTR_NESTING:
 			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
 			return 0;
+		case DOMAIN_ATTR_PGTABLE_CFG: {
+			struct io_pgtable *pgtable;
+			struct io_pgtable_cfg *dest = data;
+
+			if (!smmu_domain->pgtbl_ops)
+				return -ENODEV;
+
+			pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
+
+			memcpy(dest, &pgtable->cfg, sizeof(*dest));
+			return 0;
+		}
 		default:
 			return -ENODEV;
 		}
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 5f0b7859d2eb..2388117641f1 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -124,6 +124,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
+	DOMAIN_ATTR_PGTABLE_CFG,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.17.1

