Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9023119F063
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 08:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgDFGdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 02:33:46 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:17475 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726475AbgDFGdq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 02:33:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586154825; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=GHPkfZdKpWokGkMHpjNdxNE7lxqzRlwomEdxFWcpnmE=; b=tBPqvChmS5DrvnhSb6CSFVAwcQVk9IgNWcKDnrnHHC2Ma/roqArxfmG/IUHOpzqL5lrelUbx
 nRvWrLF+WclNhasUJ+iYmQ+oGrPQEAXzZFCWh2NRBTTyU1+emxhTyzCg+RrWnnQW4JewDDyD
 5qRm2XMXUedTfpgmW1PCB99jyng=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8acd32.7fc47178e030-smtp-out-n01;
 Mon, 06 Apr 2020 06:33:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EDA88C433BA; Mon,  6 Apr 2020 06:33:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EA6EEC433F2;
        Mon,  6 Apr 2020 06:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EA6EEC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v16 6/6] soc: qcom: rpmh-rsc: Allow using free WAKE TCS for active request
Date:   Mon,  6 Apr 2020 12:02:21 +0530
Message-Id: <1586154741-8293-7-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org>
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When there are more than one WAKE TCS available and there is no dedicated
ACTIVE TCS available, invalidating all WAKE TCSes and waiting for current
transfer to complete in first WAKE TCS blocks using another free WAKE TCS
to complete current request.

Remove rpmh_rsc_invalidate() to happen from tcs_write() when WAKE TCSes
is re-purposed to be used for Active mode. Clear only currently used
WAKE TCS's register configuration.

Fixes: 2de4b8d33eab (drivers: qcom: rpmh-rsc: allow active requests from wake TCS)
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 5128e13..34b0e14 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -154,7 +154,7 @@ int rpmh_rsc_invalidate(struct rsc_drv *drv)
 static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
 					 const struct tcs_request *msg)
 {
-	int type, ret;
+	int type;
 	struct tcs_group *tcs;
 
 	switch (msg->state) {
@@ -175,19 +175,10 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
 	 * If we are making an active request on a RSC that does not have a
 	 * dedicated TCS for active state use, then re-purpose a wake TCS to
 	 * send active votes.
-	 * NOTE: The driver must be aware that this RSC does not have a
-	 * dedicated AMC, and therefore would invalidate the sleep and wake
-	 * TCSes before making an active state request.
 	 */
 	tcs = get_tcs_of_type(drv, type);
-	if (msg->state == RPMH_ACTIVE_ONLY_STATE && !tcs->num_tcs) {
+	if (msg->state == RPMH_ACTIVE_ONLY_STATE && !tcs->num_tcs)
 		tcs = get_tcs_of_type(drv, WAKE_TCS);
-		if (tcs->num_tcs) {
-			ret = rpmh_rsc_invalidate(drv);
-			if (ret)
-				return ERR_PTR(ret);
-		}
-	}
 
 	return tcs;
 }
@@ -412,8 +403,16 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 
 	tcs->req[tcs_id - tcs->offset] = msg;
 	set_bit(tcs_id, drv->tcs_in_use);
-	if (msg->state == RPMH_ACTIVE_ONLY_STATE && tcs->type != ACTIVE_TCS)
+	if (msg->state == RPMH_ACTIVE_ONLY_STATE && tcs->type != ACTIVE_TCS) {
+		/*
+		 * Clear previously programmed WAKE commands in selected
+		 * repurposed TCS to avoid triggering them. tcs->slots will be
+		 * cleaned from rpmh_flush() by invoking rpmh_rsc_invalidate()
+		 */
+		write_tcs_reg_sync(drv, RSC_DRV_CMD_ENABLE, tcs_id, 0);
+		write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
 		enable_tcs_irq(drv, tcs_id, true);
+	}
 	spin_unlock(&drv->lock);
 
 	__tcs_buffer_write(drv, tcs_id, 0, msg);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
