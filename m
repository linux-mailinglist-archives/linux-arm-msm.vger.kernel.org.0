Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59A3422D9A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 18:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236227AbhJEQQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 12:16:43 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:49343 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhJEQQn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 12:16:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633450489; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=11fmJ2P4gyUURTQDhz0W4XmaWlBMfP0gXWd3T6QMvQY=; b=Ymt7+k0H856EGoscb6EaD/3UA23cfJA1zpmETAxnKqFtDag7lc8uBTsxE8HT9MVG/ZfUflVy
 HvtH74+yHOoyibM5E+2EypBl2mNwDJDA1gz8+yQscLQZ43LE3y3p4IAbYd6vVmIe5UAhKbLA
 lAN1miWnutuSvpbGCiXDgFdqjSM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 615c79b4003e680efb52ba7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 16:13:40
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4E047C4360D; Tue,  5 Oct 2021 16:13:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0095DC4338F;
        Tue,  5 Oct 2021 16:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0095DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V2 1/1] soc: qcom: smp2p: add feature negotiation and ssr ack feature support
Date:   Tue,  5 Oct 2021 21:43:23 +0530
Message-Id: <1633450403-21281-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

This patch adds feature negotiation and ssr ack feature between
local host and remote processor. Local host can negotiate on common
features supported with remote processor.

When ssr ack feature bit is set, the remote processor will tell local
host when it is reinitialized. All clients registered for falling edge
interrupts will be notified when the smp2p entries are cleared for ssr.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/smp2p.c | 121 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 96 insertions(+), 25 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 38585a7..11b9511 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -41,8 +41,11 @@
 #define SMP2P_MAX_ENTRY_NAME 16
 
 #define SMP2P_FEATURE_SSR_ACK 0x1
+#define SMP2P_FLAGS_RESTART_DONE_BIT 0
+#define SMP2P_FLAGS_RESTART_ACK_BIT 1
 
 #define SMP2P_MAGIC 0x504d5324
+#define SMP2P_ALL_FEATURES	SMP2P_FEATURE_SSR_ACK
 
 /**
  * struct smp2p_smem_item - in memory communication structure
@@ -136,6 +139,10 @@ struct qcom_smp2p {
 
 	unsigned valid_entries;
 
+	bool ssr_ack_enabled;
+	bool ssr_ack;
+	bool negotiation_done;
+
 	unsigned local_pid;
 	unsigned remote_pid;
 
@@ -163,22 +170,53 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
 	}
 }
 
-/**
- * qcom_smp2p_intr() - interrupt handler for incoming notifications
- * @irq:	unused
- * @data:	smp2p driver context
- *
- * Handle notifications from the remote side to handle newly allocated entries
- * or any changes to the state bits of existing entries.
- */
-static irqreturn_t qcom_smp2p_intr(int irq, void *data)
+static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
+{
+	struct smp2p_smem_item *in = smp2p->in;
+	bool restart;
+
+	if (!smp2p->ssr_ack_enabled)
+		return false;
+
+	restart = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
+
+	return restart != smp2p->ssr_ack;
+}
+
+static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
+{
+	struct smp2p_smem_item *out = smp2p->out;
+	u32 val;
+
+	smp2p->ssr_ack = !smp2p->ssr_ack;
+
+	val = out->flags & ~BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
+	if (smp2p->ssr_ack)
+		val |= BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
+	out->flags = val;
+
+	qcom_smp2p_kick(smp2p);
+}
+
+static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
+{
+	struct smp2p_smem_item *out = smp2p->out;
+	struct smp2p_smem_item *in = smp2p->in;
+
+	if (in->version == out->version) {
+		out->features &= in->features;
+
+		if (out->features & SMP2P_FEATURE_SSR_ACK)
+			smp2p->ssr_ack_enabled = true;
+
+		smp2p->negotiation_done = true;
+	}
+}
+
+static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 {
 	struct smp2p_smem_item *in;
 	struct smp2p_entry *entry;
-	struct qcom_smp2p *smp2p = data;
-	unsigned smem_id = smp2p->smem_items[SMP2P_INBOUND];
-	unsigned pid = smp2p->remote_pid;
-	size_t size;
 	int irq_pin;
 	u32 status;
 	char buf[SMP2P_MAX_ENTRY_NAME];
@@ -187,18 +225,6 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
 
 	in = smp2p->in;
 
-	/* Acquire smem item, if not already found */
-	if (!in) {
-		in = qcom_smem_get(pid, smem_id, &size);
-		if (IS_ERR(in)) {
-			dev_err(smp2p->dev,
-				"Unable to acquire remote smp2p item\n");
-			return IRQ_HANDLED;
-		}
-
-		smp2p->in = in;
-	}
-
 	/* Match newly created entries */
 	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
 		list_for_each_entry(entry, &smp2p->inbound, node) {
@@ -237,7 +263,51 @@ static irqreturn_t qcom_smp2p_intr(int irq, void *data)
 			}
 		}
 	}
+}
+
+/**
+ * qcom_smp2p_intr() - interrupt handler for incoming notifications
+ * @irq:	unused
+ * @data:	smp2p driver context
+ *
+ * Handle notifications from the remote side to handle newly allocated entries
+ * or any changes to the state bits of existing entries.
+ */
+static irqreturn_t qcom_smp2p_intr(int irq, void *data)
+{
+	struct smp2p_smem_item *in;
+	struct qcom_smp2p *smp2p = data;
+	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
+	unsigned int pid = smp2p->remote_pid;
+	bool ack_restart;
+	size_t size;
+
+	in = smp2p->in;
+
+	/* Acquire smem item, if not already found */
+	if (!in) {
+		in = qcom_smem_get(pid, smem_id, &size);
+		if (IS_ERR(in)) {
+			dev_err(smp2p->dev,
+				"Unable to acquire remote smp2p item\n");
+			goto out;
+		}
+
+		smp2p->in = in;
+	}
+
+	if (!smp2p->negotiation_done)
+		qcom_smp2p_negotiate(smp2p);
+
+	if (smp2p->negotiation_done) {
+		ack_restart = qcom_smp2p_check_ssr(smp2p);
+		qcom_smp2p_notify_in(smp2p);
+
+		if (ack_restart)
+			qcom_smp2p_do_ssr_ack(smp2p);
+	}
 
+out:
 	return IRQ_HANDLED;
 }
 
@@ -393,6 +463,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	out->remote_pid = smp2p->remote_pid;
 	out->total_entries = SMP2P_MAX_ENTRY;
 	out->valid_entries = 0;
+	out->features = SMP2P_ALL_FEATURES;
 
 	/*
 	 * Make sure the rest of the header is written before we validate the
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

