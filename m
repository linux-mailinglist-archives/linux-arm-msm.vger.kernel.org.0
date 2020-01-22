Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0490D144D90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 09:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgAVIX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 03:23:58 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:21826 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726049AbgAVIX5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 03:23:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579681437; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=BaK9wRIScTnYdLhZWXlD4XXkYiXa7pMzORrY3Jdz4lE=; b=uZqMWyCTSz1aAvMUXMn5JwEc0tSvKUDCGnFsLqH59K5cNHKIdLX1Z1ly0/qvKJbr2cKkpaSO
 tRtywP/fawOJ2wLbmpWMTv2yWKV5bkiNA5hQox26tfENNi50ekIwpIhkir79hqruJVW87a2h
 pMpFlq1mWqU1v+BwH7TYLuQYIAQ=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e280699.7f6ed848c500-smtp-out-n03;
 Wed, 22 Jan 2020 08:23:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3EFE8C4479C; Wed, 22 Jan 2020 08:23:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from aneelaka-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: aneela)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B5FFC43383;
        Wed, 22 Jan 2020 08:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B5FFC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] soc: qcom: aoss: Use wake_up_all() instead of wake_up_interruptible_all()
Date:   Wed, 22 Jan 2020 13:53:37 +0530
Message-Id: <1579681417-1155-1-git-send-email-aneela@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During the probe the task is waiting in TASK_UNINTERRUPTIBLE state which
cannot be woken-up by wake_up_interruptible_all() function.

Use wake_up_all() to wake-up both TASK_UNINTERRUPTIBLE and
TASK_INTERRUPTIBLE state tasks.

Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 006ac40..fe79661 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -200,7 +200,7 @@ static irqreturn_t qmp_intr(int irq, void *data)
 {
 	struct qmp *qmp = data;
 
-	wake_up_interruptible_all(&qmp->event);
+	wake_up_all(&qmp->event);
 
 	return IRQ_HANDLED;
 }
-- 
1.9.1
