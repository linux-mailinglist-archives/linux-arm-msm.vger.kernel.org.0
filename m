Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96EF52E6C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfE2UzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:55:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55310 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfE2UzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:55:09 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DDD9E607C3; Wed, 29 May 2019 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163307;
        bh=H1gJftayyhVU3QVkkOlFv2DhgJ/CrcDyVexTTU22x4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lBBCCLNWLtMP6MTlifW0/hhWULMbqAHn8agLMArTbyVmXfLZY0mTYUbtDvXrhGJRB
         +rMjk9pU/Y5kmWw2na3O35JtABPJw1UFGa73g5+eW6WGZz0ZGgzD6SIKgOIL0poPBS
         VGANA337XjlLLCTgDmOZQgtPBQchIWcqJZaSBX0U=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F21AB606DB;
        Wed, 29 May 2019 20:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163307;
        bh=H1gJftayyhVU3QVkkOlFv2DhgJ/CrcDyVexTTU22x4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lBBCCLNWLtMP6MTlifW0/hhWULMbqAHn8agLMArTbyVmXfLZY0mTYUbtDvXrhGJRB
         +rMjk9pU/Y5kmWw2na3O35JtABPJw1UFGa73g5+eW6WGZz0ZGgzD6SIKgOIL0poPBS
         VGANA337XjlLLCTgDmOZQgtPBQchIWcqJZaSBX0U=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F21AB606DB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 01/16] iommu/arm-smmu: Allow client devices to select direct mapping
Date:   Wed, 29 May 2019 14:54:37 -0600
Message-Id: <1559163292-4792-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some client devices want to directly map the IOMMU themselves instead
of using the DMA domain. Allow those devices to opt in to direct
mapping by way of a list of compatible strings.

v3: use iommu_request_dm_for_dev() to set up a default identity domain
for a group, per Robin

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 5e54cc0..7537639 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1235,6 +1235,35 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	return 0;
 }
 
+struct arm_smmu_client_match_data {
+	bool direct_mapping;
+};
+
+static const struct arm_smmu_client_match_data qcom_adreno = {
+	.direct_mapping = true,
+};
+
+static const struct arm_smmu_client_match_data qcom_mdss = {
+	.direct_mapping = true,
+};
+
+static const struct of_device_id arm_smmu_client_of_match[] = {
+	{ .compatible = "qcom,adreno", .data = &qcom_adreno },
+	{ .compatible = "qcom,mdp4", .data = &qcom_mdss },
+	{ .compatible = "qcom,mdss", .data = &qcom_mdss },
+	{ .compatible = "qcom,sdm845-mdss", .data = &qcom_mdss },
+	{},
+};
+
+static const struct arm_smmu_client_match_data *
+arm_smmu_client_data(struct device *dev)
+{
+	const struct of_device_id *match =
+		of_match_device(arm_smmu_client_of_match, dev);
+
+	return match ? match->data : NULL;
+}
+
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
 	int ret;
@@ -1450,6 +1479,7 @@ static int arm_smmu_add_device(struct device *dev)
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master_cfg *cfg;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	const struct arm_smmu_client_match_data *client;
 	int i, ret;
 
 	if (using_legacy_binding) {
@@ -1512,6 +1542,11 @@ static int arm_smmu_add_device(struct device *dev)
 	device_link_add(dev, smmu->dev,
 			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
 
+	client = arm_smmu_client_data(dev);
+
+	if (client && client->direct_mapping)
+		iommu_request_dm_for_dev(dev);
+
 	return 0;
 
 out_cfg_free:
-- 
2.7.4

