Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1729C3ECDF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 07:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbhHPFW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 01:22:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:47818 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhHPFW2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 01:22:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629091317; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=B4Kwshb6u/Zp9MjX8i6MMjsGcCKj7AX0jXcmoUSpJSk=; b=D1sDpFrjeHgCP4aD4iLXAGM+pI79LL9bPJ+eIL8s4ztgnOKi3RxQwsR8C2acUHxaK5cJJDA9
 BrwPnnwCMQf1FfQI7plsLr0og5j/Aa9q6Fsh2BEpj2H6l8vFN4MEkIWjPae7NLEjKZpIEQPm
 C+SQxPuRvxtlm0My8lDbts7/ou0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6119f5f4b14e7e2ecbb5a6e1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Aug 2021 05:21:56
 GMT
Sender: bgodavar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74651C4360C; Mon, 16 Aug 2021 05:21:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from bgodavar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3EC5AC4338F;
        Mon, 16 Aug 2021 05:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3EC5AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, pharish@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org, mcchou@chromium.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Subject: [PATCH] Bluetooth: hci_qca: Set SSR triggered flags when SSR command is sent out
Date:   Mon, 16 Aug 2021 10:51:42 +0530
Message-Id: <1629091302-7893-1-git-send-email-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change sets SSR triggered flags when QCA SSR command is sent to
SoC. After the SSR command sent, driver discards the incoming data from
the upper layers. This way will ensure to read full dumps from the
BT SoC without any flow control issues due to excess of data receiving
from the HOST in audio usecases.

Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 53deea2..5cbed6a 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -69,6 +69,8 @@
 #define QCA_LAST_SEQUENCE_NUM		0xFFFF
 #define QCA_CRASHBYTE_PACKET_LEN	1096
 #define QCA_MEMDUMP_BYTE		0xFB
+#define QCA_SSR_OPCODE			0xFC0C
+#define QCA_SSR_PKT_LEN		5
 
 enum qca_flags {
 	QCA_IBS_DISABLED,
@@ -871,6 +873,14 @@ static int qca_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 	/* Prepend skb with frame type */
 	memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
 
+	if (hci_skb_pkt_type(skb) == HCI_COMMAND_PKT &&
+	    skb->len == QCA_SSR_PKT_LEN &&
+	    hci_skb_opcode(skb) == QCA_SSR_OPCODE) {
+		bt_dev_info(hu->hdev, "Triggering ssr");
+		set_bit(QCA_SSR_TRIGGERED, &qca->flags);
+		set_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+	}
+
 	spin_lock_irqsave(&qca->hci_ibs_lock, flags);
 
 	/* Don't go to sleep in middle of patch download or
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

