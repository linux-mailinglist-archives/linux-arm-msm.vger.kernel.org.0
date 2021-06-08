Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68DC39F6AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 14:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbhFHMdE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 08:33:04 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38337 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232647AbhFHMc7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 08:32:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623155467; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UenV7iSFYEAFZ8DRh0vWD0hvTbYkw2dn+QBSNeAfUeI=; b=OqMXFn5dQW7MkdOz6hDc7RAPzS4UzhCRP18+Igxdj3j8jiPT/nFaIlhT2jF+AW/vDzYtlFuC
 7aW8UzPs3onl5BemOnLx4jqb1lT2W2wJiy6GyGRxtxJ6d9GLYhLMXWqikTQ7ABEL2uszok+6
 UdgcpOJFOx2tNd2tA2oQ8Y2bsXc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60bf62e82eaeb98b5ebe2520 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 12:30:32
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A642C43460; Tue,  8 Jun 2021 12:30:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D17CDC43217;
        Tue,  8 Jun 2021 12:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D17CDC43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Subject: [PATCHv4 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific impl
Date:   Tue,  8 Jun 2021 18:00:07 +0530
Message-Id: <c42181d313fdd440011541a28cde8cd10fffb9d3.1623155117.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1623155117.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1623155117.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adreno(GPU) SMMU and APSS(Application Processor SubSystem) SMMU
both implement "arm,mmu-500" in some QTI SoCs and to run through
adreno smmu specific implementation such as enabling split pagetables
support, we need to match the "qcom,adreno-smmu" compatible first
before apss smmu or else we will be running apps smmu implementation
for adreno smmu and the additional features for adreno smmu is never
set. For ex: we have "qcom,sc7280-smmu-500" compatible for both apps
and adreno smmu implementing "arm,mmu-500", so the adreno smmu
implementation is never reached because the current sequence checks
for apps smmu compatible(qcom,sc7280-smmu-500) first and runs that
specific impl and we never reach adreno smmu specific implementation.

Suggested-by: Akhil P Oommen <akhilpo@codeaurora.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index e93b5dbda7de..83c32566bf64 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -370,11 +370,17 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 			return qcom_smmu_create(smmu, &qcom_smmu_impl);
 	}
 
-	if (of_match_node(qcom_smmu_impl_of_match, np))
-		return qcom_smmu_create(smmu, &qcom_smmu_impl);
-
+	/*
+	 * Do not change this order of implementation, i.e., first adreno
+	 * smmu impl and then apss smmu since we can have both implementing
+	 * arm,mmu-500 in which case we will miss setting adreno smmu specific
+	 * features if the order is changed.
+	 */
 	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
 		return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
 
+	if (of_match_node(qcom_smmu_impl_of_match, np))
+		return qcom_smmu_create(smmu, &qcom_smmu_impl);
+
 	return smmu;
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

