Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F1A3CB00F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 02:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbhGPAb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 20:31:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17646 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231724AbhGPAbV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 20:31:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626395307; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=I6iEUuC50EPXZOKteNojFUYvKDGkjt2YcZKBPZdfk0o=; b=IBcdVFCQ5SUY1Dz20HE+ILH4RKrc2ACFP3+7LP5tRPbn11uayRjDcuBlPBTZcT4nuFWhHFVS
 3h15aIchYP2vKB8E7sOw9mtgvYfsxKi7FJRy6SD+N/3+tLPvnY7HNRTnOodlD1b8v6Tq/mxc
 Q8rF+atHf2YkgViNN0/5DcXl2cg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60f0d29a38fa9bfe9c7479f3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Jul 2021 00:28:10
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF5C5C4338A; Fri, 16 Jul 2021 00:28:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 05243C4323A;
        Fri, 16 Jul 2021 00:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05243C4323A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        quic_jhugo@quicinc.com, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 2/2] bus: mhi: core: Depict serial number in hexadecimals
Date:   Thu, 15 Jul 2021 17:27:56 -0700
Message-Id: <1626395276-24171-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626395276-24171-1-git-send-email-bbhatt@codeaurora.org>
References: <1626395276-24171-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to maintain consistency with the way OEM PK hash is
displayed and improve the current way, depict serial number in
upper case hexadecimals.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 8b4336e..d825a06 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
 
-	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
+	return snprintf(buf, PAGE_SIZE, "Serial Number: 0x%X\n",
 			mhi_cntrl->serial_number);
 }
 static DEVICE_ATTR_RO(serial_number);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

