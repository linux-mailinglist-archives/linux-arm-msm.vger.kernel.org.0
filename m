Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49F0332E7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 19:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhCISrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 13:47:25 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:54801 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229948AbhCISrL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 13:47:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615315631; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=kd1Ffw1WhovB5jD2lsj6ZMBLtQBBMzh9IO33J9y/sJA=; b=Gdqwiaz+adkWkvSvm4qb8UpioQ6KWz+ypKeI6bshqa5JSV+zjyEsaJu4mXz+Po+ZAnFrmUtf
 RcMAEEbFlgKmIXtmXkC5Bn8xnaHSt3fwJaerBckfsTvb/EEWA+JgsHYxOY4oxpXaJTi4NDKF
 ZIvfY/AsjrG7T1hwCVrk3grbsWw=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6047c2a5bb6300df75fba423 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 18:47:01
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5835CC43461; Tue,  9 Mar 2021 18:47:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 30923C433CA;
        Tue,  9 Mar 2021 18:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30923C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH] bus: mhi: Make firmware image optional for controller
Date:   Tue,  9 Mar 2021 10:46:35 -0800
Message-Id: <1615315595-37750-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some controllers can opt to not have MHI download a firmware
image to have the device bootup and can find the device in a
pass through execution environment, ready to go. Thus, MHI
controllers for those devices do not need fw_image defined.
Make it optional to accommodate different bootup modes.

Suggested-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 include/linux/mhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 56c4c52..838a3c4 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -296,7 +296,7 @@ struct mhi_controller_config {
  * @wake_db: MHI WAKE doorbell register address
  * @iova_start: IOMMU starting address for data (required)
  * @iova_stop: IOMMU stop address for data (required)
- * @fw_image: Firmware image name for normal booting (required)
+ * @fw_image: Firmware image name for normal booting (optional)
  * @edl_image: Firmware image name for emergency download mode (optional)
  * @rddm_size: RAM dump size that host should allocate for debugging purpose
  * @sbl_size: SBL image size downloaded through BHIe (optional)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

