Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9E9172AD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 23:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbgB0WGy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 17:06:54 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:25259 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730187AbgB0WGx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 17:06:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582841213; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=KA5SegCo5AW0cExJCz9BWH9qh1K5CDu6sI3vMXYPwJc=; b=S3jj8Bn127oG/+b1JpXKOds8/FS8ZwYdRIasUENwuZL5nbgWk1sIn1W8+PVo44bOAXnhYemr
 ZEp3uaGkh1Jht5KZU5HbnL0Z4jJ8aSJSgfNVdOawrzOHnLMIpKHm0MdPHfx7bL1KBg1Fq6f8
 NlU38gBoBQF+LvuAHpP8HuXCy2c=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e583d71.7fb467084030-smtp-out-n03;
 Thu, 27 Feb 2020 22:06:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 16488C447A0; Thu, 27 Feb 2020 22:06:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2ED8FC43383;
        Thu, 27 Feb 2020 22:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2ED8FC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=nguyenb@codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        linux-scsi@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org, asutoshd@codeaurora.org,
        cang@codeaurora.org, Sahitya Tummala <stummala@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        "Bao D. Nguyen" <nguyenb@codeaurora.org>
Subject: [<PATCH v1> 4/4] mmc: core: update host->card after getting RCA for SD card
Date:   Thu, 27 Feb 2020 14:05:42 -0800
Message-Id: <630eb41f01456cd862495166b9cef2b36ae2861e.1582839544.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1582839544.git.nguyenb@codeaurora.org>
References: <cover.1582839544.git.nguyenb@codeaurora.org>
In-Reply-To: <cover.1582839544.git.nguyenb@codeaurora.org>
References: <cover.1582839544.git.nguyenb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sahitya Tummala <stummala@codeaurora.org>

Make the host->card available before tuning is invoked for SD card.
In the sdhci_msm_execute_tuning(), we will send CMD13 only if
host->card is present because it needs the card->rca as its
argument to be sent. For emmc, host->card is already updated
immediately after the mmc_alloc_card(). In the similar way,
this change is for SD card. Without this change, tuning functionality
will not be able to send CMD13 to make sure the card is ready
for next data command. If the last tuning command failed
and we did not send CMD13 to ensure card is in transfer state,
the next read/write command will fail.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/mmc/core/sd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
index 76c7add..f0872e3 100644
--- a/drivers/mmc/core/sd.c
+++ b/drivers/mmc/core/sd.c
@@ -989,6 +989,7 @@ static int mmc_sd_init_card(struct mmc_host *host, u32 ocr,
 		err = mmc_send_relative_addr(host, &card->rca);
 		if (err)
 			goto free_card;
+		host->card = card;
 	}
 
 	if (!oldcard) {
@@ -1100,12 +1101,13 @@ static int mmc_sd_init_card(struct mmc_host *host, u32 ocr,
 		goto free_card;
 	}
 done:
-	host->card = card;
 	return 0;
 
 free_card:
-	if (!oldcard)
+	if (!oldcard) {
+		host->card = NULL;
 		mmc_remove_card(card);
+	}
 
 	return err;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
