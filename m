Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3BD3D7213
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 11:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235979AbhG0Je0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 05:34:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23543 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235970AbhG0JeZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 05:34:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627378466; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=kagWZe+ixHB1PpOFUHGC8RpKnQRK2ITDmPTtxKqpozo=; b=DfI0LPD6Ioxg5nPx88LqOBEe4rbMyLMLSW9VJPX0/Dy/LU8Ah3enjoCIBsDJrCtFJexZg811
 zl4QKEM551fvGWlM2MdJgDoj6U2jZFm1z7ChS2VOkeGI/283g8thdViNHzV4R6AFqh5K0VpQ
 MKh8eNvvicOBoCOS4HZR8DoK+io=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60ffd3101dd16c8788229f3d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Jul 2021 09:34:08
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A7ADC4323A; Tue, 27 Jul 2021 09:34:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25EE7C433D3;
        Tue, 27 Jul 2021 09:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25EE7C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        srimuc <srimuc@codeaurora.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to system pm callbacks
Date:   Tue, 27 Jul 2021 15:03:22 +0530
Message-Id: <20210727093322.13202-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some clocks for SMMU can have parent as XO such as gpu_cc_hub_cx_int_clk
of GPU SMMU in QTI SC7280 SoC and in order to enter deep sleep states in
such cases, we would need to drop the XO clock vote in unprepare call and
this unprepare callback for XO is in RPMh (Resource Power Manager-Hardened)
clock driver which controls RPMh managed clock resources for new QTI SoCs
and is a blocking call.

Given we cannot have a sleeping calls such as clk_bulk_prepare() and
clk_bulk_unprepare() in arm-smmu runtime pm callbacks since the iommu
operations like map and unmap can be in atomic context and are in fast
path, add this prepare and unprepare call to drop the XO vote only for
system pm callbacks since it is not a fast path and we expect the system
to enter deep sleep states with system pm as opposed to runtime pm.

This is a similar sequence of clock requests (prepare,enable and
disable,unprepare) in arm-smmu probe and remove.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Co-developed-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index d3c6f54110a5..9561ba4c5d39 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2277,6 +2277,13 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 
 static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
 {
+	int ret;
+	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
+
+	ret = clk_bulk_prepare(smmu->num_clks, smmu->clks);
+	if (ret)
+		return ret;
+
 	if (pm_runtime_suspended(dev))
 		return 0;
 
@@ -2285,10 +2292,19 @@ static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
 
 static int __maybe_unused arm_smmu_pm_suspend(struct device *dev)
 {
+	int ret = 0;
+	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
+
 	if (pm_runtime_suspended(dev))
-		return 0;
+		goto clk_unprepare;
 
-	return arm_smmu_runtime_suspend(dev);
+	ret = arm_smmu_runtime_suspend(dev);
+	if (ret)
+		return ret;
+
+clk_unprepare:
+	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
+	return ret;
 }
 
 static const struct dev_pm_ops arm_smmu_pm_ops = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

