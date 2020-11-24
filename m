Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164CA2C1EE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 08:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729951AbgKXHbz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 02:31:55 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:54806 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728934AbgKXHbz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 02:31:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606203113; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=r2KNcUaierxJmn5CHPmfvgAFLmybeWsl3U3JcN5rG88=; b=c2CgzyjOMeEsnxbyimfnPUFkPmo0HH5qA7Z9HyQf+hdxwsEddMkWGjiM4Z1ntj1xlqkp7IVy
 8dFC+Bh+59O9p1nOA1aP8PKx20knuHRxVpZJJFvtb2LE1aAXLQHNpzNrLREEtE7ZkuhZw0PU
 dg3iCallqVtofxZBnTwcmTaHXGs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fbcb6e4c6fdb18c636a512c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 07:31:48
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 02C9AC43460; Tue, 24 Nov 2020 07:31:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24C64C433ED;
        Tue, 24 Nov 2020 07:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24C64C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2] soc: qcom: rpmh: Remove serialization of TCS commands
Date:   Tue, 24 Nov 2020 13:01:26 +0530
Message-Id: <1606203086-31218-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Lina Iyer <ilina@codeaurora.org>

Requests sent to RPMH can be sent as fire-n-forget or response required,
with the latter ensuring the command has been completed by the hardware
accelerator. Commands in a request with tcs_cmd::wait set, would ensure
that those select commands are sent as response required, even though
the actual TCS request may be fire-n-forget.

Also, commands with .wait flag were also guaranteed to be complete
before the following command in the TCS is sent. This means that the
next command of the same request blocked until the current request is
completed. This could mean waiting for a voltage to settle or series of
NOCs be configured before the next command is sent. But drivers using
this feature have never cared about the serialization aspect. By not
enforcing the serialization we can allow the hardware to run in parallel
improving the performance.

Let's clarify the usage of this member in the tcs_cmd structure to mean
only completion and not serialization. This should also improve the
performance of bus requests where changes could happen in parallel.
Also, CPU resume from deep idle may see benefits from certain wake
requests.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
Changes in v2:
- Add SoB of self
- Fix typo in comment
- Update comment as Doug suggested
- Remove write to RSC_DRV_CMD_WAIT_FOR_CMPL in tcs_write() and tcs_invalidate()
---
 drivers/soc/qcom/rpmh-rsc.c | 25 ++++++++++---------------
 include/soc/qcom/tcs.h      |  3 ++-
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 37969dc..9a06099 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -231,10 +231,9 @@ static void tcs_invalidate(struct rsc_drv *drv, int type)
 	if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS))
 		return;
 
-	for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
+	for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++)
 		write_tcs_reg_sync(drv, RSC_DRV_CMD_ENABLE, m, 0);
-		write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, m, 0);
-	}
+
 	bitmap_zero(tcs->slots, MAX_TCS_SLOTS);
 }
 
@@ -423,8 +422,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 			cmd = &req->cmds[j];
 			sts = read_tcs_cmd(drv, RSC_DRV_CMD_STATUS, i, j);
 			if (!(sts & CMD_STATUS_ISSUED) ||
-			   ((req->wait_for_compl || cmd->wait) &&
-			   !(sts & CMD_STATUS_COMPL))) {
+			   (cmd->wait && !(sts & CMD_STATUS_COMPL))) {
 				pr_err("Incomplete request: %s: addr=%#x data=%#x",
 				       drv->name, cmd->addr, cmd->data);
 				err = -EIO;
@@ -443,7 +441,6 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 skip:
 		/* Reclaim the TCS */
 		write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i, 0);
-		write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, i, 0);
 		writel_relaxed(BIT(i), drv->tcs_base + RSC_DRV_IRQ_CLEAR);
 		spin_lock(&drv->lock);
 		clear_bit(i, drv->tcs_in_use);
@@ -476,23 +473,23 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 			       const struct tcs_request *msg)
 {
-	u32 msgid, cmd_msgid;
+	u32 msgid;
+	u32 cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
 	u32 cmd_enable = 0;
-	u32 cmd_complete;
 	struct tcs_cmd *cmd;
 	int i, j;
 
-	cmd_msgid = CMD_MSGID_LEN;
+	/* Convert all commands to RR when the request has wait_for_compl set */
 	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
-	cmd_msgid |= CMD_MSGID_WRITE;
-
-	cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id);
 
 	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
 		cmd = &msg->cmds[i];
 		cmd_enable |= BIT(j);
-		cmd_complete |= cmd->wait << j;
 		msgid = cmd_msgid;
+		/*
+		 * Additionally, if the cmd->wait is set, make the command
+		 * response reqd even if the overall request was fire-n-forget.
+		 */
 		msgid |= cmd->wait ? CMD_MSGID_RESP_REQ : 0;
 
 		write_tcs_cmd(drv, RSC_DRV_CMD_MSGID, tcs_id, j, msgid);
@@ -501,7 +498,6 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 		trace_rpmh_send_msg(drv, tcs_id, j, msgid, cmd);
 	}
 
-	write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
 	cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
 	write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
 }
@@ -652,7 +648,6 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 		 * cleaned from rpmh_flush() by invoking rpmh_rsc_invalidate()
 		 */
 		write_tcs_reg_sync(drv, RSC_DRV_CMD_ENABLE, tcs_id, 0);
-		write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
 		enable_tcs_irq(drv, tcs_id, true);
 	}
 	spin_unlock_irqrestore(&drv->lock, flags);
diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
index 7a2a055..eb5cb35 100644
--- a/include/soc/qcom/tcs.h
+++ b/include/soc/qcom/tcs.h
@@ -30,7 +30,7 @@ enum rpmh_state {
  *
  * @addr: the address of the resource slv_id:18:16 | offset:0:15
  * @data: the resource state request
- * @wait: wait for this request to be complete before sending the next
+ * @wait: ensure that this command is complete before returning
  */
 struct tcs_cmd {
 	u32 addr;
@@ -43,6 +43,7 @@ struct tcs_cmd {
  *
  * @state:          state for the request.
  * @wait_for_compl: wait until we get a response from the h/w accelerator
+ *                  (same as setting cmd->wait for all commands in the request)
  * @num_cmds:       the number of @cmds in this request
  * @cmds:           an array of tcs_cmds
  */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

