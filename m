Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1932CE504
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 02:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389482AbgLDBYO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 20:24:14 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:28858 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389476AbgLDBYN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 20:24:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607045033; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=EOc1dxtwV5oBc9oks6GKrxlxEPL0mQTSkrRaL+3YVOM=; b=F6XUl7pJsI11RfUUEQ4hUW4SlSvvmW5ygtJo6kUSEdlncyoQoOi6Mlo24sxv3G2C1wNM4Pe/
 VCo86vcJpOsjBuIliQKP6++ykJQEDLhtdE8IPF1/T4CJfAWNl8TB3LuIwihRd7oxnA2wWV2s
 qrm6NlWvHEBT+SEBrydKKNWnl1M=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fc98f8f08086a3dc722ded2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Dec 2020 01:23:27
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8FC44C43461; Fri,  4 Dec 2020 01:23:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CF21DC433ED;
        Fri,  4 Dec 2020 01:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CF21DC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 2/8] bus: mhi: core: Allow channel to be disabled from stopped state
Date:   Thu,  3 Dec 2020 17:23:11 -0800
Message-Id: <1607044997-19577-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607044997-19577-1-git-send-email-bbhatt@codeaurora.org>
References: <1607044997-19577-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If a channel was explicitly stopped but not reset, allow it to
move to a disabled state so that the channel context can be
cleaned up after a driver remove is issued. Since the channel
remained in stopped state, its context on the device is not
cleared. Allow this move if a client driver module is unloaded
or a device crash occurs.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index f0697f4..5c93a61 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1288,7 +1288,8 @@ static int mhi_driver_remove(struct device *dev)
 
 		mutex_lock(&mhi_chan->mutex);
 
-		if (ch_state[dir] == MHI_CH_STATE_ENABLED &&
+		if ((ch_state[dir] == MHI_CH_STATE_ENABLED ||
+		     ch_state[dir] == MHI_CH_STATE_STOP) &&
 		    !mhi_chan->offload_ch)
 			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

