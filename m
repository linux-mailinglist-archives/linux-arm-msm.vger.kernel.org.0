Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5651841DD9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 17:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344533AbhI3Pek (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 11:34:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31591 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344492AbhI3Peg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 11:34:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633015974; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=oY2YkIvulqlP2G9eehV1a7R6q6Jt6Tmh41GTeb3ArqM=; b=bZUVnqE9G3Aq/hvTK5/oM/qMoKu/73jOYK/RVrrvvMKhVF0Nl+pW+vwIXf5p2ATVFKZRNBI+
 LRfOTL0o0rtdWNGvwOeGAI+vgJUuU8qCoWDUsuRvxO4oy81pyWDTgHqK6fFK/tEURy9gx9ra
 8eCmUBVgFKD6Dhnn5l8NfSv1f4g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6155d895fc6e34f8cd8dea4f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Sep 2021 15:32:37
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 761D4C43617; Thu, 30 Sep 2021 15:32:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B382C4360D;
        Thu, 30 Sep 2021 15:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9B382C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, mathieu.poirier@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: [PATCH V1 2/3] rpmsg: glink: Add support to handle signals command
Date:   Thu, 30 Sep 2021 21:02:03 +0530
Message-Id: <1633015924-881-4-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remote peripherals send signal notifications over glink with commandID 15.

Add support to send and receive the signal command and convert the signals
from NATIVE to TIOCM while receiving and vice versa while sending.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 75 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 05533c7..384fcd2 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -17,6 +17,7 @@
 #include <linux/rpmsg.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/termios.h>
 #include <linux/workqueue.h>
 #include <linux/mailbox_client.h>
 
@@ -201,9 +202,16 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops;
 #define RPM_CMD_TX_DATA_CONT		12
 #define RPM_CMD_READ_NOTIF		13
 #define RPM_CMD_RX_DONE_W_REUSE		14
+#define RPM_CMD_SIGNALS			15
 
 #define GLINK_FEATURE_INTENTLESS	BIT(1)
 
+#define NATIVE_DTR_SIG			BIT(31)
+#define NATIVE_CTS_SIG			BIT(30)
+#define NATIVE_CD_SIG			BIT(29)
+#define NATIVE_RI_SIG			BIT(28)
+
+
 static void qcom_glink_rx_done_work(struct work_struct *work);
 
 static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
@@ -976,6 +984,68 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 	return 0;
 }
 
+/**
+ * qcom_glink_set_flow_control() - convert a signal cmd to wire format and
+ * 				   transmit
+ * @ept:	Rpmsg endpoint for channel.
+ * @enable:	True/False - enable or disable flow control
+ *
+ * Return: 0 on success or standard Linux error code.
+ */
+static int qcom_glink_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+	struct qcom_glink *glink = channel->glink;
+	struct glink_msg msg;
+	u32 sigs = 0;
+
+	/**
+	 * convert signals from TIOCM to NATIVE
+	 * sigs = TIOCM_DTR|TIOCM_RTS
+	 */
+	if (enable)
+		sigs |= (NATIVE_DTR_SIG | NATIVE_CTS_SIG);
+	else
+		sigs |= (~(NATIVE_DTR_SIG | NATIVE_CTS_SIG));
+
+	msg.cmd = cpu_to_le16(RPM_CMD_SIGNALS);
+	msg.param1 = cpu_to_le16(channel->lcid);
+	msg.param2 = cpu_to_le32(sigs);
+
+	return qcom_glink_tx(glink, &msg, sizeof(msg), NULL, 0, true);
+}
+
+static int qcom_glink_handle_signals(struct qcom_glink *glink,
+				     unsigned int rcid, unsigned int sigs)
+{
+	struct glink_channel *channel;
+	unsigned long flags;
+
+	spin_lock_irqsave(&glink->idr_lock, flags);
+	channel = idr_find(&glink->rcids, rcid);
+	spin_unlock_irqrestore(&glink->idr_lock, flags);
+	if (!channel) {
+		dev_err(glink->dev, "signal for non-existing channel\n");
+		return -EINVAL;
+	}
+
+	/* convert signals from NATIVE to TIOCM */
+	if (sigs & NATIVE_DTR_SIG)
+		sigs |= TIOCM_DSR;
+	if (sigs & NATIVE_CTS_SIG)
+		sigs |= TIOCM_CTS;
+	if (sigs & NATIVE_CD_SIG)
+		sigs |= TIOCM_CD;
+	if (sigs & NATIVE_RI_SIG)
+		sigs |= TIOCM_RI;
+	sigs &= 0x0fff;
+
+	if (channel->ept.sig_cb)
+		channel->ept.sig_cb(channel->ept.rpdev, channel->ept.priv, sigs);
+
+	return 0;
+}
+
 static irqreturn_t qcom_glink_native_intr(int irq, void *data)
 {
 	struct qcom_glink *glink = data;
@@ -1037,6 +1107,10 @@ static irqreturn_t qcom_glink_native_intr(int irq, void *data)
 			qcom_glink_handle_intent_req_ack(glink, param1, param2);
 			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
 			break;
+		case RPM_CMD_SIGNALS:
+			qcom_glink_handle_signals(glink, param1, param2);
+			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
+			break;
 		default:
 			dev_err(glink->dev, "unhandled rx cmd: %d\n", cmd);
 			ret = -EINVAL;
@@ -1382,6 +1456,7 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 	.sendto = qcom_glink_sendto,
 	.trysend = qcom_glink_trysend,
 	.trysendto = qcom_glink_trysendto,
+	.set_flow_control = qcom_glink_set_flow_control,
 };
 
 static void qcom_glink_rpdev_release(struct device *dev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

