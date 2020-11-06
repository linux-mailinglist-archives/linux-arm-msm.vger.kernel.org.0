Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF372A9B1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 18:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgKFRpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 12:45:02 -0500
Received: from z5.mailgun.us ([104.130.96.5]:22283 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727786AbgKFRpB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 12:45:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604684701; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0q6j83BVHFAC0r8eo+utGIaU8ORfkvyWcXmIFRGGKtQ=; b=gXtwQOSy6JJyvI/4vjZ0d1SYJ4DqD+88Alv42F9b8sR7eSTMDfQDbVOlqlyq/oh0bNd6NzJc
 voV6AbZi9dUsQjGileWWSbZ+Sz1vtOHlR1CorLI3xhLUm5o+KQ9lNBTNnvElpRlmetjB6man
 WiLCUbskL8HGYxGf2Q1FSZfZb28=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fa58b9b9d6b206d94bddc5f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 17:44:59
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4167C43382; Fri,  6 Nov 2020 17:44:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7AEC1C433FF;
        Fri,  6 Nov 2020 17:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7AEC1C433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 1/6] bus: mhi: core: Remove unnecessary counter from mhi_firmware_copy()
Date:   Fri,  6 Nov 2020 09:44:45 -0800
Message-Id: <1604684690-31065-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604684690-31065-1-git-send-email-bbhatt@codeaurora.org>
References: <1604684690-31065-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is an extra 'i' counter in the mhi_firmware_copy() function
which is unused. Remove it to clean-up code and reduce stack
space as well as improve efficiency of the function.

Fixes: cd457afb1667 ("bus: mhi: core: Add support for downloading firmware over BHIe")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 24422f5..6b6fd96 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -365,7 +365,6 @@ static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
 	size_t remainder = firmware->size;
 	size_t to_cpy;
 	const u8 *buf = firmware->data;
-	int i = 0;
 	struct mhi_buf *mhi_buf = img_info->mhi_buf;
 	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
 
@@ -377,7 +376,6 @@ static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
 
 		buf += to_cpy;
 		remainder -= to_cpy;
-		i++;
 		bhi_vec++;
 		mhi_buf++;
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

