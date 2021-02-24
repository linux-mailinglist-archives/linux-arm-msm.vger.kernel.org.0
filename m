Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9ED732360C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 04:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbhBXDbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 22:31:53 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:56207 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233337AbhBXDbv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 22:31:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614137491; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=j3NUwmTK/pbfK8BEVL2cNN0vDqDRZb25xA6TMv12HJk=; b=sLMBFjJAtGL5cXYzG/0rBL9SLASCwI+rbPWY0TYFAW+0KXf5ccnblM6FrORnc4MVG37XOjpz
 ukP+371MLZpxySndh8RAIKgfwe1oGbIkFQNIn0l8QbIRs0h1e3HEypRVT8lGIGekiiDpP3Hn
 o02olGsJJxlSLpsunAz5WPDJpAQ=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6035c86ce9080d5ff70e4420 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 03:30:52
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 444FFC43463; Wed, 24 Feb 2021 03:30:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75A14C43461;
        Wed, 24 Feb 2021 03:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 75A14C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 3/3] bus: mhi: core: Use poll register read API for RDDM download
Date:   Tue, 23 Feb 2021 19:30:41 -0800
Message-Id: <1614137441-18872-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614137441-18872-1-git-send-email-bbhatt@codeaurora.org>
References: <1614137441-18872-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make use of mhi_poll_reg_field() API in order to poll for RDDM
download in panic path to employ a common approach throughout the
driver.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index c2546bf..b9c44e0 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -60,7 +60,6 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 	u32 rx_status;
 	enum mhi_ee_type ee;
 	const u32 delayus = 2000;
-	u32 retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
 	const u32 rddm_timeout_us = 200000;
 	int rddm_retry = rddm_timeout_us / delayus;
 	void __iomem *base = mhi_cntrl->bhie;
@@ -125,19 +124,12 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 		"Waiting for RDDM image download via BHIe, current EE:%s\n",
 		TO_MHI_EXEC_STR(ee));
 
-	while (retry--) {
-		ret = mhi_read_reg_field(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS,
-					 BHIE_RXVECSTATUS_STATUS_BMSK,
-					 BHIE_RXVECSTATUS_STATUS_SHFT,
-					 &rx_status);
-		if (ret)
-			return -EIO;
-
-		if (rx_status == BHIE_RXVECSTATUS_STATUS_XFER_COMPL)
-			return 0;
-
-		udelay(delayus);
-	}
+	ret = mhi_poll_reg_field(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS,
+				 BHIE_RXVECSTATUS_STATUS_BMSK,
+				 BHIE_RXVECSTATUS_STATUS_SHFT,
+				 BHIE_RXVECSTATUS_STATUS_XFER_COMPL, delayus);
+	if (!ret)
+		return 0;
 
 	ee = mhi_get_exec_env(mhi_cntrl);
 	ret = mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx_status);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

