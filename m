Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5317A79E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 06:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbfIDEed (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 00:34:33 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55088 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfIDEed (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 00:34:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 59917602EF; Wed,  4 Sep 2019 04:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567571672;
        bh=yD7jddCeDQh/QLkdALenruhc6/Bis0ve+odm+lJNIpc=;
        h=From:To:Cc:Subject:Date:From;
        b=I6pw9B5rr26zjf9F8xAcaV9hOA1N438qnSW6RXBSDF2vqmEqZw6tmqy0QALhuYHLj
         O4sKsaEvGajDPBfDMWc81zdA/1YxO6y9C5kEysZ/G0IzEUwEeKL1n6jdPgeBmX0Aa0
         32/OFYNYF8FAzDR2ENGUW9Z5zNiiPZEYXTs4f4o4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from c-hbandi-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: c-hbandi@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2DFCE607EB;
        Wed,  4 Sep 2019 04:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567571671;
        bh=yD7jddCeDQh/QLkdALenruhc6/Bis0ve+odm+lJNIpc=;
        h=From:To:Cc:Subject:Date:From;
        b=I2aSP4zUWyN5R+xWOmkIdddBX4q7VtpEp8StdzSVkyn8Yfe5BwBwf5HJVdRvViP94
         +CnP44E9ZXvhH27gigVLcaGDTUaymlzH7W18sgqlXUtYuBc7hgKOTvFPpKAQtHRYR0
         AA1zPgMsHJGmJ8rT14/Cy9JLfidd+zH6RuXDb2wA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2DFCE607EB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=c-hbandi@codeaurora.org
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        anubhavg@codeaurora.org, Harish Bandi <c-hbandi@codeaurora.org>
Subject: [PATCH v1] bluetooth: hci_qca: disable irqs when spinlock is acquired
Date:   Wed,  4 Sep 2019 10:04:16 +0530
Message-Id: <1567571656-32403-1-git-send-email-c-hbandi@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Looks like Deadlock is observed in hci_qca while performing
stress and stability tests. Since same lock is getting
acquired from qca_wq_awake_rx and hci_ibs_tx_idle_timeout
seeing spinlock recursion, irqs should be disable while
acquiring the spinlock always.

Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index d33828f..e3164c2 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -309,13 +309,14 @@ static void qca_wq_awake_device(struct work_struct *work)
 					    ws_awake_device);
 	struct hci_uart *hu = qca->hu;
 	unsigned long retrans_delay;
+	unsigned long flags;
 
 	BT_DBG("hu %p wq awake device", hu);
 
 	/* Vote for serial clock */
 	serial_clock_vote(HCI_IBS_TX_VOTE_CLOCK_ON, hu);
 
-	spin_lock(&qca->hci_ibs_lock);
+	spin_lock_irqsave(&qca->hci_ibs_lock, flags);
 
 	/* Send wake indication to device */
 	if (send_hci_ibs_cmd(HCI_IBS_WAKE_IND, hu) < 0)
@@ -327,7 +328,7 @@ static void qca_wq_awake_device(struct work_struct *work)
 	retrans_delay = msecs_to_jiffies(qca->wake_retrans);
 	mod_timer(&qca->wake_retrans_timer, jiffies + retrans_delay);
 
-	spin_unlock(&qca->hci_ibs_lock);
+	spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);
 
 	/* Actually send the packets */
 	hci_uart_tx_wakeup(hu);
@@ -338,12 +339,13 @@ static void qca_wq_awake_rx(struct work_struct *work)
 	struct qca_data *qca = container_of(work, struct qca_data,
 					    ws_awake_rx);
 	struct hci_uart *hu = qca->hu;
+	unsigned long flags;
 
 	BT_DBG("hu %p wq awake rx", hu);
 
 	serial_clock_vote(HCI_IBS_RX_VOTE_CLOCK_ON, hu);
 
-	spin_lock(&qca->hci_ibs_lock);
+	spin_lock_irqsave(&qca->hci_ibs_lock, flags);
 	qca->rx_ibs_state = HCI_IBS_RX_AWAKE;
 
 	/* Always acknowledge device wake up,
@@ -354,7 +356,7 @@ static void qca_wq_awake_rx(struct work_struct *work)
 
 	qca->ibs_sent_wacks++;
 
-	spin_unlock(&qca->hci_ibs_lock);
+	spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);
 
 	/* Actually send the packets */
 	hci_uart_tx_wakeup(hu);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

