Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF19273AAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 08:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgIVGTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 02:19:09 -0400
Received: from z5.mailgun.us ([104.130.96.5]:47173 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729316AbgIVGTG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 02:19:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600755546; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bWHGV1osJMnrvcpc+ajeo2CD3fIJ+trVCX/OUDCTxRU=; b=APsjCqDs7Sy50yFNJK7pFGmdB+F+JNyIRUpNDIalFq+vYPUCwAfD36NveeL6xAE9BIvlSUXg
 s2ziyw55ZggtmsvDqpaj6qYf4d0tD5s62/q4rlRRQ8Y6CNfsqgyKu0nLS5PbnKf7upTRAXQS
 pXCJL7CFnScxMtIPhN+jsa7Gvec=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f69975991755cb92b2a677d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Sep 2020 06:19:05
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7F2CC43387; Tue, 22 Sep 2020 06:19:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5D33C433FF;
        Tue, 22 Sep 2020 06:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5D33C433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv5 5/6] iommu: arm-smmu-impl: Use table to list QCOM implementations
Date:   Tue, 22 Sep 2020 11:48:18 +0530
Message-Id: <f2d079d46cee22f09f6eb7e6f874a9eaa786ec2a.1600754909.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1600754909.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1600754909.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use table and of_match_node() to match qcom implementation
instead of multiple of_device_compatible() calls for each
QCOM SMMU implementation.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index d199b4bff15d..ce78295cfa78 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -9,6 +9,13 @@
 
 #include "arm-smmu.h"
 
+static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
+	{ .compatible = "qcom,sc7180-smmu-500" },
+	{ .compatible = "qcom,sdm845-smmu-500" },
+	{ .compatible = "qcom,sm8150-smmu-500" },
+	{ .compatible = "qcom,sm8250-smmu-500" },
+	{ }
+};
 
 static int arm_smmu_gr0_ns(int offset)
 {
@@ -217,10 +224,7 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
 		return nvidia_smmu_impl_init(smmu);
 
-	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
-	    of_device_is_compatible(np, "qcom,sc7180-smmu-500") ||
-	    of_device_is_compatible(np, "qcom,sm8150-smmu-500") ||
-	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
+	if (of_match_node(qcom_smmu_impl_of_match, np))
 		return qcom_smmu_impl_init(smmu);
 
 	if (of_device_is_compatible(smmu->dev->of_node, "qcom,adreno-smmu"))
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

