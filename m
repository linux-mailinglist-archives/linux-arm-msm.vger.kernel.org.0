Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387631A9346
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634891AbgDOGbI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:31:08 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:57915 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2634860AbgDOGbH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:31:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586932267; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=0qyYONgS3KzCR72TXDQaI57YcGvWrSu9zzL9q8Vkm/A=; b=GtWNgwJpkjASBFQEbEQwYglAdv/ua/t432JpFHPqH6E3L09rrK98XF0KTxY4+axfFrl+exOp
 rGlK1raq99iMgUUrEMgc9qKgReRoDBbfGyYTMglC8ftJ8X84ESl0fBGimdgBEOJUa5eD/1dX
 8a0VRFihhuQqqPuSsp3abSgwqik=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e96aa26.7f500d6a9880-smtp-out-n02;
 Wed, 15 Apr 2020 06:31:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C0D2CC433BA; Wed, 15 Apr 2020 06:31:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EAE84C433CB;
        Wed, 15 Apr 2020 06:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EAE84C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dan.carpenter@oracle.com,
        gustavo@embeddedor.com, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] soc: qcom: pdr: Remove impossible error condition
Date:   Wed, 15 Apr 2020 11:59:55 +0530
Message-Id: <20200415062955.21439-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch fbe639b44a82: "soc: qcom: Introduce Protection Domain
Restart helpers" leads to the following static checker warning:

drivers/soc/qcom/pdr_interface.c:158 pdr_register_listener()
'(resp.curr_state < (-((~0 >> 1)) - 1)) => (s32min-s32max < s32min)'
These are casted to int so they can't be outside of int range.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/pdr_interface.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 17ad3b8698e16..bdcf16f88a97f 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -155,10 +155,6 @@ static int pdr_register_listener(struct pdr_handle *pdr,
 		return ret;
 	}
 
-	if ((int)resp.curr_state < INT_MIN || (int)resp.curr_state > INT_MAX)
-		pr_err("PDR: %s notification state invalid: 0x%x\n",
-		       pds->service_path, resp.curr_state);
-
 	pds->state = resp.curr_state;
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
