Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFDC4172ACE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 23:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729982AbgB0WGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 17:06:48 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:25259 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730149AbgB0WGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 17:06:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582841208; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=WZi02PQIcWxOofn2zJpdxNdKBMBRPTUWVVvGceBRIeg=; b=OOJNyURNEekUKU1XbYTPQq5T8vZszzBQL7Ho2U9w0/LhJXYsVYD4EG/hmDy6oGfNiNmcKvFy
 6wat0SorQlx8MMvKxduQJKjiG08ssH1BRkmhyCACf7KNSzRq8F7b8S+R9mgHBMRmmffSM8MC
 vOhFfLQgo4aTo90sAtnQzkLVNxA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e583d6f.7fde0a4ba538-smtp-out-n02;
 Thu, 27 Feb 2020 22:06:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ADCEFC4479D; Thu, 27 Feb 2020 22:06:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 067BBC433A2;
        Thu, 27 Feb 2020 22:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 067BBC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=nguyenb@codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        linux-scsi@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org, asutoshd@codeaurora.org,
        cang@codeaurora.org, Subhash Jadavani <subhashj@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Murali Palnati <palnatim@codeaurora.org>,
        "Bao D. Nguyen" <nguyenb@codeaurora.org>
Subject: [<PATCH v1> 2/4] mmc: core: Attribute the IO wait time properly in mmc_wait_for_req_done()
Date:   Thu, 27 Feb 2020 14:05:40 -0800
Message-Id: <00979679b191fd9704664d06b0642c9eb3b4b00c.1582839544.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1582839544.git.nguyenb@codeaurora.org>
References: <cover.1582839544.git.nguyenb@codeaurora.org>
In-Reply-To: <cover.1582839544.git.nguyenb@codeaurora.org>
References: <cover.1582839544.git.nguyenb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Subhash Jadavani <subhashj@codeaurora.org>

In mmc_wait_for_req_done() function, change the call wait_for_completion()
to wait_for_compltion_io(). This change makes the kernel account for
wait time as I/O wait and through another configuration, this io wait
is treated as busy which makes the acpu clock to scale up.

Signed-off-by: Murali Palnati <palnatim@codeaurora.org>
Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/mmc/core/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 94441a0..97a384a 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -399,7 +399,7 @@ void mmc_wait_for_req_done(struct mmc_host *host, struct mmc_request *mrq)
 	struct mmc_command *cmd;
 
 	while (1) {
-		wait_for_completion(&mrq->completion);
+		wait_for_completion_io(&mrq->completion);
 
 		cmd = mrq->cmd;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
