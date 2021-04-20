Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981F336520E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 08:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhDTGGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 02:06:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27358 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhDTGGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 02:06:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618898733; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TX5ZhpXY1Z4ybv7ySUZwbowC+tCeYwO568zmEFD04CY=; b=aYBm7f2Xwag5kuKVwHBp/IdOS1nbw/x4967nZfiRUhZSmYaBzqMfcW1d4ukCncNlDwGqkpCg
 ai9EydaTKSgxLtYmrFF2oTrlma/EWfOku9IDrQiBm9t90kL6+duCsV9lmcSE4FcOc6L8BBN/
 0QzsiJZriTT+UimuBcFqm5aUIho=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 607e6f2ca817abd39ad74aaf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 06:05:32
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C3658C43217; Tue, 20 Apr 2021 06:05:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E2BDC433D3;
        Tue, 20 Apr 2021 06:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E2BDC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv3 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific impl earlier
Date:   Tue, 20 Apr 2021 11:34:57 +0530
Message-Id: <ecd47256b13adb6c5c32c7597581f436c90f135a.1618898456.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
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
index bea3ee0dabc2..03f048aebb80 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -345,11 +345,17 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
 
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

