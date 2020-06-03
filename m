Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB1A1ED7E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 23:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgFCVP3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 17:15:29 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:22607 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726377AbgFCVP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 17:15:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591218928; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jzafB20T6C2cr0oApSpYxxZ+yVZaB2ioyr2SdddTzko=; b=ph7P4DBVtBg5enFBtWEm9inzNxZLdWB9Mxt8z1kNvTcNt8F2W6j9QGK9/UkFv+zIXpwvGmFF
 TpEIuRmJCt3OVEBIZDX7DkDkB0NLt3EWLpAwOl2kEaBF7Rhm8dVfDFxYoImMrKCA6iQs36uM
 4g2O888rHuj49oMLCqqsMRmRJzM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ed812e52dd9e15ae3706637 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Jun 2020 21:15:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79BDCC43387; Wed,  3 Jun 2020 21:15:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4228DC433CB;
        Wed,  3 Jun 2020 21:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4228DC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/arm-smmu: Mark qcom_smmu_client_of_match as possibly unused
Date:   Wed,  3 Jun 2020 15:15:07 -0600
Message-Id: <20200603211507.27756-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When CONFIG_OF=n of_match_device() gets pre-processed out of existence
leaving qcom-smmu_client_of_match unused. Mark it as possibly unused to
keep the compiler from warning in that case.

Fixes: 0e764a01015d ("iommu/arm-smmu: Allow client devices to select direct mapping")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index cf01d0215a39..063b4388b0ff 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -12,7 +12,7 @@ struct qcom_smmu {
 	struct arm_smmu_device smmu;
 };
 
-static const struct of_device_id qcom_smmu_client_of_match[] = {
+static const struct __maybe_unused of_device_id qcom_smmu_client_of_match[] = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
-- 
2.17.1

