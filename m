Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 805D4855B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 00:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388908AbfHGWV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 18:21:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38272 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389150AbfHGWV4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 18:21:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D35126090F; Wed,  7 Aug 2019 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565216515;
        bh=V2MOW7b4CUVhygGGVaa1wzt2YduOq9ESSFH7yL59gh0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gAH10Z9jO0qPNwfNSX3DNnSbcXr0urrU/G7r1IHR8VjyqrWgwCSfjWab2v2kSObgx
         K7l5vrXtJopOEgUK6nmshK4YE3AwG1Z7JIAQTBGjvmKXtGgdV4SMpE3vEs5nel/4Ew
         aMgPaVjHgICDgeo6vO+te6DoYKr6261Dyiad3GT4=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D67C46090F;
        Wed,  7 Aug 2019 22:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565216508;
        bh=V2MOW7b4CUVhygGGVaa1wzt2YduOq9ESSFH7yL59gh0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YCBPHDtUPurdyKZZfpBRRfq/JJw9kwWNNS2y/AGWUNciNkNOSznkrzR2oOGovZ5N0
         ReynarRaHNZmERQJcmNSSypbBOAIv5Gt3CjPg1cjyNkCP2f1goXjghA4j+VyOHrCdX
         djOwH/NDrReRX7RKsXlGL58MJyDoTAApdxp57ado=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D67C46090F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        robin.murphy@arm.com, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] iommu/arm-smmu: Add support for Adreno GPU pagetable formats
Date:   Wed,  7 Aug 2019 16:21:40 -0600
Message-Id: <1565216500-28506-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
References: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for an Adreno GPU variant of the arm-smmu device to enable
a special pagetable format that enables TTBR1 and leaves TTBR0 free
to be switched by the GPU hardware.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index aa06498..129ac83 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -124,6 +124,7 @@ enum arm_smmu_implementation {
 	ARM_MMU500,
 	CAVIUM_SMMUV2,
 	QCOM_SMMUV2,
+	ADRENO_SMMUV2,
 };
 
 struct arm_smmu_s2cr {
@@ -832,7 +833,10 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		ias = smmu->va_size;
 		oas = smmu->ipa_size;
 		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
-			fmt = ARM_64_LPAE_S1;
+			if (smmu->model == ADRENO_SMMUV2)
+				fmt = ARM_ADRENO_GPU_LPAE;
+			else
+				fmt = ARM_64_LPAE_S1;
 		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
 			fmt = ARM_32_LPAE_S1;
 			ias = min(ias, 32UL);
@@ -2030,6 +2034,7 @@ ARM_SMMU_MATCH_DATA(arm_mmu401, ARM_SMMU_V1_64K, GENERIC_SMMU);
 ARM_SMMU_MATCH_DATA(arm_mmu500, ARM_SMMU_V2, ARM_MMU500);
 ARM_SMMU_MATCH_DATA(cavium_smmuv2, ARM_SMMU_V2, CAVIUM_SMMUV2);
 ARM_SMMU_MATCH_DATA(qcom_smmuv2, ARM_SMMU_V2, QCOM_SMMUV2);
+ARM_SMMU_MATCH_DATA(adreno_smmuv2, ARM_SMMU_V2, ADRENO_SMMUV2);
 
 static const struct of_device_id arm_smmu_of_match[] = {
 	{ .compatible = "arm,smmu-v1", .data = &smmu_generic_v1 },
@@ -2039,6 +2044,7 @@ static const struct of_device_id arm_smmu_of_match[] = {
 	{ .compatible = "arm,mmu-500", .data = &arm_mmu500 },
 	{ .compatible = "cavium,smmu-v2", .data = &cavium_smmuv2 },
 	{ .compatible = "qcom,smmu-v2", .data = &qcom_smmuv2 },
+	{ .compatible = "qcom,adreno-smmu-v2", .data = &adreno_smmuv2 },
 	{ },
 };
 
-- 
2.7.4

