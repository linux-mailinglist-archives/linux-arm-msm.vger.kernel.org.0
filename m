Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D3430FE5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 21:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240178AbhBDUaM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 15:30:12 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:21122 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240039AbhBDU3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 15:29:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612470529; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kc2wf2fYZX7q5sFzZrNuRLOYpzrTPx0AAG0a0ydG+ws=; b=adVT7f+J6zEKLG4/eymlIUt5+SRMRjKuJDzzPKjraie3En3U5IguhMJzcihyAuAVk4n4P/ja
 IEZylDV2ocz5h3RPVixEsM7nePFJ6iRk0Wimf6IiAqBtQl4FYkoHvqQrQbfCPeL/RLtDAYrR
 MC5sWc3FpUVlIeu7reUl2Y543c0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 601c58de4bd23a05aec3361e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 20:28:14
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0B42C43465; Thu,  4 Feb 2021 20:28:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31C6BC43462;
        Thu,  4 Feb 2021 20:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 31C6BC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 1/8] bus: mhi: core: Allow sending the STOP channel command
Date:   Thu,  4 Feb 2021 12:27:59 -0800
Message-Id: <1612470486-10440-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612470486-10440-1-git-send-email-bbhatt@codeaurora.org>
References: <1612470486-10440-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to allow sending the STOP channel command. If a
client driver would like to STOP a channel and have the device
retain the channel context instead of issuing a RESET to it and
clearing the context, this would provide support for it after
the ability to send this command is exposed to clients.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 4e0131b..d068188 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1162,6 +1162,11 @@ int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
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

