Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E40714540E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 12:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgAVLse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 06:48:34 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:41754 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbgAVLse (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 06:48:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579693713; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=FZ071Y+ZSAFUrH83cN0WG3lRWXwhXgDK4mXEYqKVUkE=; b=em9wha8lKvp3oIodbs6R/di5UBoO0sJjSOPwZ8Gpnhz6O3d2yYj1BolOIJTunWDPc8sib7LG
 smad6zGDroP6OHmRVhYPesp/KY4ocwm7XlfguMhRvOu98W/qlmuyiC01p1oHtuJR7KKOVzJP
 avYsHm+5Td0ImHZHEZygdooaQ6w=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e28368f.7f9dd0d4ce68-smtp-out-n01;
 Wed, 22 Jan 2020 11:48:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 86FF7C447AB; Wed, 22 Jan 2020 11:48:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B77FC4479C;
        Wed, 22 Jan 2020 11:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B77FC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 2/2] iommu/arm-smmu: Allow client devices to select direct mapping
Date:   Wed, 22 Jan 2020 17:18:02 +0530
Message-Id: <813cc5b2da10c27db982254b274bf26008a9e6da.1579692800.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Some client devices want to directly map the IOMMU themselves instead
of using the DMA domain. Allow those devices to opt in to direct
mapping by way of a list of compatible strings.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/arm-smmu-qcom.c | 39 +++++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu.c      |  3 +++
 drivers/iommu/arm-smmu.h      |  5 +++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index 64a4ab270ab7..ff746acd1c81 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2019, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/of_device.h>
 #include <linux/qcom_scm.h>
 
 #include "arm-smmu.h"
@@ -11,6 +12,43 @@ struct qcom_smmu {
 	struct arm_smmu_device smmu;
 };
 
+static const struct arm_smmu_client_match_data qcom_adreno = {
+	.direct_mapping = true,
+};
+
+static const struct arm_smmu_client_match_data qcom_mdss = {
+	.direct_mapping = true,
+};
+
+static const struct of_device_id qcom_smmu_client_of_match[] = {
+	{ .compatible = "qcom,adreno", .data = &qcom_adreno },
+	{ .compatible = "qcom,mdp4", .data = &qcom_mdss },
+	{ .compatible = "qcom,mdss", .data = &qcom_mdss },
+	{ .compatible = "qcom,sc7180-mdss", .data = &qcom_mdss },
+	{ .compatible = "qcom,sdm845-mdss", .data = &qcom_mdss },
+	{},
+};
+
+static const struct arm_smmu_client_match_data *
+qcom_smmu_client_data(struct device *dev)
+{
+	const struct of_device_id *match =
+		of_match_device(qcom_smmu_client_of_match, dev);
+
+	return match ? match->data : NULL;
+}
+
+static int qcom_smmu_request_domain(struct device *dev)
+{
+	const struct arm_smmu_client_match_data *client;
+
+	client = qcom_smmu_client_data(dev);
+	if (client)
+		iommu_request_dm_for_dev(dev);
+
+	return 0;
+}
+
 static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
@@ -41,6 +79,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
 }
 
 static const struct arm_smmu_impl qcom_smmu_impl = {
+	.req_domain = qcom_smmu_request_domain,
 	.reset = qcom_smmu500_reset,
 };
 
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 16c4b87af42b..67dd9326247a 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1448,6 +1448,9 @@ static int arm_smmu_add_device(struct device *dev)
 	device_link_add(dev, smmu->dev,
 			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
 
+	if (smmu->impl && smmu->impl->req_domain)
+		return smmu->impl->req_domain(dev);
+
 	return 0;
 
 out_cfg_free:
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 8d1cd54d82a6..059dc9c39f64 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -244,6 +244,10 @@ enum arm_smmu_arch_version {
 	ARM_SMMU_V2,
 };
 
+struct arm_smmu_client_match_data {
+	bool direct_mapping;
+};
+
 enum arm_smmu_implementation {
 	GENERIC_SMMU,
 	ARM_MMU500,
@@ -386,6 +390,7 @@ struct arm_smmu_impl {
 	int (*init_context)(struct arm_smmu_domain *smmu_domain);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
+	int (*req_domain)(struct device *dev);
 };
 
 static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
