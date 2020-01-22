Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEE0144D95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 09:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgAVIYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 03:24:31 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:54758 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729147AbgAVIYb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 03:24:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579681470; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=nD1uDpoY7on6/qYV0kLzeZEptmi3C0Urt07mALi0s8k=; b=Wui+LGphn+mABh89XdojXbRNTJRVAcJMKVB14bsO+K9juJ3vf/OKLE61ILht2ZvO/6hyPj6U
 FjPK5dUtMCmfpw5niq29owuOU/jipkzf2T+HbhneRAMXcwJwZS6K14LaARrHxtt9dp6wqEQz
 yUBNJpFeL9j8QIAgHdjtdwjPspU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2806bb.7f195737fc00-smtp-out-n02;
 Wed, 22 Jan 2020 08:24:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7B28C433CB; Wed, 22 Jan 2020 08:24:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from aneelaka-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: aneela)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 30FB2C433A2;
        Wed, 22 Jan 2020 08:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30FB2C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] soc: qcom: aoss: Read back before triggering the IRQ
Date:   Wed, 22 Jan 2020 13:54:13 +0530
Message-Id: <1579681454-1229-1-git-send-email-aneela@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In some device memory used by msm_qmp, there can be an early ack of a
write to memory succeeding. This may cause the outgoing interrupt to be
triggered before the msgram reflects the write.

Add a readback to ensure the data is flushed to device memory before
triggering the ipc interrupt.

Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index fe79661..f43a2e0 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -225,6 +225,7 @@ static bool qmp_message_empty(struct qmp *qmp)
 static int qmp_send(struct qmp *qmp, const void *data, size_t len)
 {
 	long time_left;
+	size_t tlen;
 	int ret;
 
 	if (WARN_ON(len + sizeof(u32) > qmp->size))
@@ -239,6 +240,9 @@ static int qmp_send(struct qmp *qmp, const void *data, size_t len)
 	__iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
 			 data, len / sizeof(u32));
 	writel(len, qmp->msgram + qmp->offset);
+
+	/* Read back len to confirm data written in message RAM */
+	tlen = readl(qmp->msgram + qmp->offset);
 	qmp_kick(qmp);
 
 	time_left = wait_event_interruptible_timeout(qmp->event,
-- 
1.9.1
