Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A25219459E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 18:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgCZRis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 13:38:48 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:53316 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727354AbgCZRis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 13:38:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585244327; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cspZ9sg3YmG7GHjQ8/DUrEgZsDHH40UIacbE1mTHu5w=; b=D4fvjdInjHrsFSna4cMJKztVWWyDdHjN4bjfgzofeC9SlKFt9aLda4A5nF6veiySlpzM3HyJ
 0BcdkdMfRKOsbFS7tBibzTLBPUGu2/EhIVDjOkBgcuQY26HZwMQKKYLmWcP2MbUnju4Rm9DJ
 L0BE9QeWJXK3gUXrxN3dadYbUS0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7ce89f.7fd86a4cfdf8-smtp-out-n02;
 Thu, 26 Mar 2020 17:38:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 20092C44795; Thu, 26 Mar 2020 17:38:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 79CDFC433D2;
        Thu, 26 Mar 2020 17:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79CDFC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v14 5/6] soc: qcom: rpmh-rsc: Clear active mode configuration for wake TCS
Date:   Thu, 26 Mar 2020 23:07:49 +0530
Message-Id: <1585244270-637-6-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585244270-637-1-git-send-email-mkshah@codeaurora.org>
References: <1585244270-637-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>

For RSCs that have sleep & wake TCS but no dedicated active TCS, wake
TCS can be re-purposed to send active requests. Once the active requests
are sent and response is received, the active mode configuration needs
to be cleared so that controller can use wake TCS for sending wake
requests.

Introduce enable_tcs_irq() to enable completion IRQ for repurposed TCSes.

Fixes: 2de4b8d33eab (drivers: qcom: rpmh-rsc: allow active requests from wake TCS)
Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
[mkshah: call enable_tcs_irq() within drv->lock, update commit message]
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 77 +++++++++++++++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index ee052cc..8fa70b4 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -207,6 +207,42 @@ static const struct tcs_request *get_req_from_tcs(struct rsc_drv *drv,
 	return NULL;
 }
 
+static void __tcs_trigger(struct rsc_drv *drv, int tcs_id, bool trigger)
+{
+	u32 enable;
+
+	/*
+	 * HW req: Clear the DRV_CONTROL and enable TCS again
+	 * While clearing ensure that the AMC mode trigger is cleared
+	 * and then the mode enable is cleared.
+	 */
+	enable = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id, 0);
+	enable &= ~TCS_AMC_MODE_TRIGGER;
+	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
+	enable &= ~TCS_AMC_MODE_ENABLE;
+	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
+
+	if (trigger) {
+		/* Enable the AMC mode on the TCS and then trigger the TCS */
+		enable = TCS_AMC_MODE_ENABLE;
+		write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
+		enable |= TCS_AMC_MODE_TRIGGER;
+		write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
+	}
+}
+
+static void enable_tcs_irq(struct rsc_drv *drv, int tcs_id, bool enable)
+{
+	u32 data;
+
+	data = read_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0, 0);
+	if (enable)
+		data |= BIT(tcs_id);
+	else
+		data &= ~BIT(tcs_id);
+	write_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0, data);
+}
+
 /**
  * tcs_tx_done: TX Done interrupt handler
  */
@@ -243,6 +279,14 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 		}
 
 		trace_rpmh_tx_done(drv, i, req, err);
+
+		/*
+		 * If wake tcs was re-purposed for sending active
+		 * votes, clear AMC trigger & enable modes and
+		 * disable interrupt for this TCS
+		 */
+		if (!drv->tcs[ACTIVE_TCS].num_tcs)
+			__tcs_trigger(drv, i, false);
 skip:
 		/* Reclaim the TCS */
 		write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i, 0);
@@ -250,6 +294,13 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 		write_tcs_reg(drv, RSC_DRV_IRQ_CLEAR, 0, BIT(i));
 		spin_lock(&drv->lock);
 		clear_bit(i, drv->tcs_in_use);
+		/*
+		 * Disable interrupt for WAKE TCS to avoid being
+		 * spammed with interrupts coming when the solver
+		 * sends its wake votes.
+		 */
+		if (!drv->tcs[ACTIVE_TCS].num_tcs)
+			enable_tcs_irq(drv, i, false);
 		spin_unlock(&drv->lock);
 		if (req)
 			rpmh_tx_done(req, err);
@@ -291,28 +342,6 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 	write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
 }
 
-static void __tcs_trigger(struct rsc_drv *drv, int tcs_id)
-{
-	u32 enable;
-
-	/*
-	 * HW req: Clear the DRV_CONTROL and enable TCS again
-	 * While clearing ensure that the AMC mode trigger is cleared
-	 * and then the mode enable is cleared.
-	 */
-	enable = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id, 0);
-	enable &= ~TCS_AMC_MODE_TRIGGER;
-	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
-	enable &= ~TCS_AMC_MODE_ENABLE;
-	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
-
-	/* Enable the AMC mode on the TCS and then trigger the TCS */
-	enable = TCS_AMC_MODE_ENABLE;
-	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
-	enable |= TCS_AMC_MODE_TRIGGER;
-	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
-}
-
 static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
 				  const struct tcs_request *msg)
 {
@@ -383,10 +412,12 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 
 	tcs->req[tcs_id - tcs->offset] = msg;
 	set_bit(tcs_id, drv->tcs_in_use);
+	if (msg->state == RPMH_ACTIVE_ONLY_STATE && tcs->type != ACTIVE_TCS)
+		enable_tcs_irq(drv, tcs_id, true);
 	spin_unlock(&drv->lock);
 
 	__tcs_buffer_write(drv, tcs_id, 0, msg);
-	__tcs_trigger(drv, tcs_id);
+	__tcs_trigger(drv, tcs_id, true);
 
 done_write:
 	spin_unlock_irqrestore(&tcs->lock, flags);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
