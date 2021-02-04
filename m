Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DD630FE72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 21:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240157AbhBDUdO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 15:33:14 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:13303 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240141AbhBDU3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 15:29:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612470534; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=hbK6fy4IEb0Eekgpe2dfHwy2puVxFFmEFW8ZMxZZvyo=; b=r14N6LFOOaR1VSCy4La1lhLRI7qNz2K2IXk4mKf/Sx9W1hLfjlpVKnPMx2RU2Nq+FPceMGEj
 FUedkqsfyDG0L8ISq8KvzgTYX8lpZ2fJAhEFuocj6M+VVexkhK5e/GdhxyRWwyy0gPSjvBYy
 /juWGhhrls2WD5H0zVe/qs7rev0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 601c58e234db06ef79cbe54c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 20:28:18
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 57830C43466; Thu,  4 Feb 2021 20:28:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 91A67C433CA;
        Thu,  4 Feb 2021 20:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 91A67C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 8/8] bus: mhi: core: Do not clear channel context more than once
Date:   Thu,  4 Feb 2021 12:28:06 -0800
Message-Id: <1612470486-10440-9-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612470486-10440-1-git-send-email-bbhatt@codeaurora.org>
References: <1612470486-10440-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clearing a channel context can happen twice if the client driver
unprepares and reset the channels from the remove() callback from
a controller requested MHI power down sequence. If there are
multiple attempts at calling the mhi_free_coherent() API, we see
kernel warnings such as "trying to free invalid coherent area".
Example for one such client is the QRTR MHI driver. Avoid these
warnings by skipping mhi_deinit_chan_ctxt() API call and prevent
extra work from MHI as the channels are already disabled.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 30eef19..272f350 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1314,6 +1314,7 @@ static int mhi_driver_remove(struct device *dev)
 
 		if ((ch_state[dir] == MHI_CH_STATE_ENABLED ||
 		     ch_state[dir] == MHI_CH_STATE_STOP) &&
+		    mhi_chan->ch_state != MHI_CH_STATE_DISABLED &&
 		    !mhi_chan->offload_ch)
 			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

