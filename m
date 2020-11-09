Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91AA82AC8CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 23:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731177AbgKIWol (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 17:44:41 -0500
Received: from z5.mailgun.us ([104.130.96.5]:28113 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731055AbgKIWol (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 17:44:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604961880; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jyGRsEid4HShrO9mYKeo8fFBfPQI1rGhmEE8jIK4E+k=; b=uwf3OFgGqymNLxduJqOPU82cvTq1D2bYkfwWB3sXnNUnSqxd8XVK+eSTh5vrvGCITVpnNkRk
 82bBceG7yuMXmBGb6Pn8UrIQ9LTsaoWMDQl0vsqLHfm0mM52h8pv9kuNi/X2E9E0O/P+KIDC
 QktKgDe7fDnMG42Kqu7mJgtraJY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fa9c6418c0d657314815f0f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 22:44:17
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B7229C433CB; Mon,  9 Nov 2020 22:44:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F0D78C433C6;
        Mon,  9 Nov 2020 22:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F0D78C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        linux-kernel@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 1/4] bus: mhi: core: Allow receiving a STOP channel command response
Date:   Mon,  9 Nov 2020 14:44:07 -0800
Message-Id: <1604961850-27671-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604961850-27671-1-git-send-email-bbhatt@codeaurora.org>
References: <1604961850-27671-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to receive the response to a STOP channel command to the
MHI bus. If a client would like to STOP a channel instead of issuing
a RESET to it, this would provide support for it.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 5 +++--
 drivers/bus/mhi/core/main.c | 5 +++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 8cefa35..4d34d62 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1267,8 +1267,9 @@ static int mhi_driver_remove(struct device *dev)
 
 		mutex_lock(&mhi_chan->mutex);
 
-		if (ch_state[dir] == MHI_CH_STATE_ENABLED &&
-		    !mhi_chan->offload_ch)
+		if ((ch_state[dir] == MHI_CH_STATE_ENABLED ||
+		     ch_state[dir] == MHI_CH_STATE_STOP) &&
+		     !mhi_chan->offload_ch)
 			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
 
 		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index f953e2a..ad881a1 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1194,6 +1194,11 @@ int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
 		cmd_tre->dword[0] = MHI_TRE_CMD_RESET_DWORD0;
 		cmd_tre->dword[1] = MHI_TRE_CMD_RESET_DWORD1(chan);
 		break;
+	case MHI_CMD_STOP_CHAN:
+		cmd_tre->ptr = MHI_TRE_CMD_STOP_PTR;
+		cmd_tre->dword[0] = MHI_TRE_CMD_STOP_DWORD0;
+		cmd_tre->dword[1] = MHI_TRE_CMD_STOP_DWORD1(chan);
+		break;
 	case MHI_CMD_START_CHAN:
 		cmd_tre->ptr = MHI_TRE_CMD_START_PTR;
 		cmd_tre->dword[0] = MHI_TRE_CMD_START_DWORD0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

