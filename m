Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65C520B3ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 16:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729364AbgFZOrU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 10:47:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10894 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729384AbgFZOrT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 10:47:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593182839; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=7uG15OZbR8iHbdbzqO2RJ2yNEv46krb5ANoHDAwOyLI=; b=p6ximLVRMYn9APNmGcR1rDBt9PnlhLlNZp6yEtyiaBKgV8wP0pHP1rf2QZr7w1469r5Xfmdr
 lSpq5hXLl8G5RKWZBCIyqJuu2pUDu5jh3OkbgVUjnrmwgBXiQOrtSRnPTCoNVl+SXPf86R8f
 6RGuIcTX/8oUWhjtf1dlu73v70w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5ef60a76567385e8e706bd29 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 14:47:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F26DFC433CB; Fri, 26 Jun 2020 14:47:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B6064C433C6;
        Fri, 26 Jun 2020 14:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B6064C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        mathieu.poirier@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V6 2/4] rpmsg: glink: Add support to handle signals command
Date:   Fri, 26 Jun 2020 20:16:57 +0530
Message-Id: <1593182819-30747-3-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593182819-30747-1-git-send-email-deesin@codeaurora.org>
References: <1593182819-30747-1-git-send-email-deesin@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arun Kumar Neelakantam <aneela@codeaurora.org>

Remote peripherals send signal notifications over glink with commandID 15.

Add support to send and receive the signal command and convert the signals
from NATIVE to TIOCM while receiving and vice versa while sending.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 125 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 0e8a28c0..1bf3235 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -17,6 +17,7 @@
 #include <linux/rpmsg.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/termios.h>
 #include <linux/workqueue.h>
 #include <linux/mailbox_client.h>
 
@@ -150,6 +151,8 @@ enum {
  * @intent_req_lock: Synchronises multiple intent requests
  * @intent_req_result: Result of intent request
  * @intent_req_comp: Completion for intent_req signalling
+ * @lsigs:	local side signals
+ * @rsigs:	remote side signals
  */
 struct glink_channel {
 	struct rpmsg_endpoint ept;
@@ -181,6 +184,10 @@ struct glink_channel {
 	struct mutex intent_req_lock;
 	bool intent_req_result;
 	struct completion intent_req_comp;
+
+	unsigned int lsigs;
+	unsigned int rsigs;
+
 };
 
 #define to_glink_channel(_ept) container_of(_ept, struct glink_channel, ept)
@@ -201,9 +208,15 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops;
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
 static void qcom_glink_rx_done_work(struct work_struct *work);
 
 static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
@@ -975,6 +988,76 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 	return 0;
 }
 
+/**
+ * qcom_glink_send_signals() - convert a signal cmd to wire format and transmit
+ * @glink:	The transport to transmit on.
+ * @channel:	The glink channel
+ * @sigs:	The signals to encode.
+ *
+ * Return: 0 on success or standard Linux error code.
+ */
+static int qcom_glink_send_signals(struct qcom_glink *glink,
+				   struct glink_channel *channel,
+				   u32 sigs)
+{
+	struct glink_msg msg;
+
+	/* convert signals from TIOCM to NATIVE */
+	sigs &= 0x0fff;
+	if (sigs & TIOCM_DTR)
+		sigs |= NATIVE_DTR_SIG;
+	if (sigs & TIOCM_RTS)
+		sigs |= NATIVE_CTS_SIG;
+	if (sigs & TIOCM_CD)
+		sigs |= NATIVE_CD_SIG;
+	if (sigs & TIOCM_RI)
+		sigs |= NATIVE_RI_SIG;
+
+	msg.cmd = cpu_to_le16(RPM_CMD_SIGNALS);
+	msg.param1 = cpu_to_le16(channel->lcid);
+	msg.param2 = cpu_to_le32(sigs);
+
+	return qcom_glink_tx(glink, &msg, sizeof(msg), NULL, 0, true);
+}
+
+static int qcom_glink_handle_signals(struct qcom_glink *glink,
+				     unsigned int rcid, unsigned int signals)
+{
+	struct glink_channel *channel;
+	unsigned long flags;
+	u32 old;
+
+	spin_lock_irqsave(&glink->idr_lock, flags);
+	channel = idr_find(&glink->rcids, rcid);
+	spin_unlock_irqrestore(&glink->idr_lock, flags);
+	if (!channel) {
+		dev_err(glink->dev, "signal for non-existing channel\n");
+		return -EINVAL;
+	}
+
+	old = channel->rsigs;
+
+	/* convert signals from NATIVE to TIOCM */
+	if (signals & NATIVE_DTR_SIG)
+		signals |= TIOCM_DSR;
+	if (signals & NATIVE_CTS_SIG)
+		signals |= TIOCM_CTS;
+	if (signals & NATIVE_CD_SIG)
+		signals |= TIOCM_CD;
+	if (signals & NATIVE_RI_SIG)
+		signals |= TIOCM_RI;
+	signals &= 0x0fff;
+
+	channel->rsigs = signals;
+
+	if (channel->ept.sig_cb) {
+		channel->ept.sig_cb(channel->ept.rpdev, channel->ept.priv,
+				    old, channel->rsigs);
+	}
+
+	return 0;
+}
+
 static irqreturn_t qcom_glink_native_intr(int irq, void *data)
 {
 	struct qcom_glink *glink = data;
@@ -1036,6 +1119,10 @@ static irqreturn_t qcom_glink_native_intr(int irq, void *data)
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
@@ -1332,6 +1419,42 @@ static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return __qcom_glink_send(channel, data, len, false);
 }
 
+static int qcom_glink_get_sigs(struct rpmsg_endpoint *ept)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+
+	return channel->rsigs;
+}
+
+static int qcom_glink_set_sigs(struct rpmsg_endpoint *ept, u32 set, u32 clear)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+	struct qcom_glink *glink = channel->glink;
+	u32 sigs = channel->lsigs;
+
+	if (set & TIOCM_DTR)
+		sigs |= TIOCM_DTR;
+	if (set & TIOCM_RTS)
+		sigs |= TIOCM_RTS;
+	if (set & TIOCM_CD)
+		sigs |= TIOCM_CD;
+	if (set & TIOCM_RI)
+		sigs |= TIOCM_RI;
+
+	if (clear & TIOCM_DTR)
+		sigs &= ~TIOCM_DTR;
+	if (clear & TIOCM_RTS)
+		sigs &= ~TIOCM_RTS;
+	if (clear & TIOCM_CD)
+		sigs &= ~TIOCM_CD;
+	if (clear & TIOCM_RI)
+		sigs &= ~TIOCM_RI;
+
+	channel->lsigs = sigs;
+
+	return qcom_glink_send_signals(glink, channel, sigs);
+}
+
 /*
  * Finds the device_node for the glink child interested in this channel.
  */
@@ -1365,6 +1488,8 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 	.destroy_ept = qcom_glink_destroy_ept,
 	.send = qcom_glink_send,
 	.trysend = qcom_glink_trysend,
+	.get_signals = qcom_glink_get_sigs,
+	.set_signals = qcom_glink_set_sigs,
 };
 
 static void qcom_glink_rpdev_release(struct device *dev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

