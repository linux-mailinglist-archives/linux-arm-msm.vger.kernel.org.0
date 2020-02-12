Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E98415A729
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 11:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbgBLK4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 05:56:49 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:45597 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726135AbgBLK4s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 05:56:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581505007; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=TjtUiZ8AZKDj9nYoSWQ3/cgkK6mw6KArwXSKQ2bbv/4=; b=nzniWBDHF8Q1zdwA/YsOvl0pzHLqD8q2fOcw1m6D6A7p8S0IqQ+zB9oy2UJd1w/x9ZRjJ32j
 /NUmkpGWBnL6tPF9LqAu/MMKIiHVRrj4NWUuecu1pQHT6K4hTmsvXlzsZMyHRnpdXiXY/aTq
 5UVrF+omumx5qLhSesUHus9CT34=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e43d9ef.7ffa6786fab0-smtp-out-n01;
 Wed, 12 Feb 2020 10:56:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0CC3C447A3; Wed, 12 Feb 2020 10:56:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 647A0C4479F;
        Wed, 12 Feb 2020 10:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 647A0C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 2/2] soc: qcom: rpmh-rsc: Log interrupt status when TCS is busy
Date:   Wed, 12 Feb 2020 16:26:12 +0530
Message-Id: <1581504972-22632-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581504972-22632-1-git-send-email-mkshah@codeaurora.org>
References: <1581504972-22632-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Lina Iyer <ilina@codeaurora.org>

To debug issues when TCS is busy, report interrupt status as well. If
the interrupt line is pending at GIC, then Linux was too busy to process
the interrupt and if not pending then AOSS was too busy to handle the
request.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 3595e4d..1dc05c3 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -421,8 +421,14 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	do {
 		ret = tcs_write(drv, msg);
 		if (ret == -EBUSY) {
-			pr_info_ratelimited("DRV:%s TCS Busy, retrying RPMH message send: addr=%#x\n",
-					    drv->name, msg->cmds[0].addr);
+			bool irq_sts;
+
+			irq_get_irqchip_state(drv->irq, IRQCHIP_STATE_PENDING,
+					      &irq_sts);
+			pr_info_ratelimited("DRV:%s TCS Busy, retrying RPMH message send: addr=%#x interrupt status=%s\n",
+					    drv->name, msg->cmds[0].addr,
+					    irq_sts ?
+					    "PENDING" : "NOT PENDING");
 			udelay(10);
 		}
 	} while (ret == -EBUSY);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
