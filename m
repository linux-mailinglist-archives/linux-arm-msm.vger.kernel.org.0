Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD5C1CE211
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 19:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgEKR4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 13:56:06 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:50883 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726310AbgEKR4F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 13:56:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589219765; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=4qUl98VkUMkimx3wUPtLlVj4sP6schRM56csAATyTnI=; b=lDD23zJ51/+8mL9WpM25jvHcAGGF7V53eFbeYDbX6M4abzwaDJDiHKEeXWIz78dvE6+PqefZ
 0ZegsudugXZnPHrfu0TmVRqeZcoodEPpOI9JkuBagA/2NyIVRuf4reDVmg6QshVuIPhd6431
 liIcr632sMDuNWDPTWcmLLem/5Y=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb991a4.7f88f5d6cd88-smtp-out-n01;
 Mon, 11 May 2020 17:55:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ED705C433BA; Mon, 11 May 2020 17:55:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C439C433CB;
        Mon, 11 May 2020 17:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C439C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        swboyd@chromium.org
Cc:     bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
        evgreen@chromium.org, mka@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v6] iommu/arm-smmu-qcom: Request direct mapping for modem device
Date:   Mon, 11 May 2020 23:25:32 +0530
Message-Id: <20200511175532.25874-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The modem remote processor has two access paths to DDR. One path is
directly connected to DDR and another path goes through an SMMU. The
SMMU path is configured to be a direct mapping because it's used by
various peripherals in the modem subsystem. Typically this direct
mapping is configured statically at EL2 by QHEE (Qualcomm's Hypervisor
Execution Environment) before the kernel is entered.

In certain firmware configuration, especially when the kernel is already
in full control of the SMMU, defer programming the modem SIDs to the
kernel. Let's add compatibles here so that we can have the kernel
program the SIDs for the modem in these cases.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V6
 * Rebased on Will's for-joerg/arm-smmu/updates
 * Reword commit message and add more details [Stephen]

 drivers/iommu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index 5bedf21587a56..cf01d0215a397 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -17,7 +17,9 @@ static const struct of_device_id qcom_smmu_client_of_match[] = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
+	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sdm845-mdss" },
+	{ .compatible = "qcom,sdm845-mss-pil" },
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
