Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C481E737D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 05:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391669AbgE2DNx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 23:13:53 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:19720 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390172AbgE2DNw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 23:13:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590722031; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MWOHZBeeiJpuUSHMnaP/5BbtwVak35PfjA2q3f6UkrY=; b=clUacrb92IMvq1EUCzfYqcuaeOQPLuwlUlM7wUV2gN+BBBvzMp7h7g7D9UreismN8lSyGVHB
 m0mmqxrxSvC+bUgnCvzCbeEJW6y8Y3gOyBfhyCUhf9EytuGQ+lLTx9HxB+DBtkDUyOwsajY9
 GkWaxS4Sb6ceU+xYK+5V033hIyw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ed07de776fccbb4c8d3a66c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 May 2020 03:13:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 32135C433C9; Fri, 29 May 2020 03:13:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D1E5C433C6;
        Fri, 29 May 2020 03:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D1E5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tientzu@chromium.org
Subject: [PATCH v4] bluetooth: hci_qca: Fix QCA6390 memdump failure
Date:   Fri, 29 May 2020 11:13:35 +0800
Message-Id: <1590722015-3495-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCA6390 memdump VSE sometimes come to bluetooth driver
with wrong sequence number as illustrated as follows:
frame # in dec: frame data in hex
1396: ff fd 01 08 74 05 00 37 8f 14
1397: ff fd 01 08 75 05 00 ff bf 38
1414: ff fd 01 08 86 05 00 fb 5e 4b
1399: ff fd 01 08 77 05 00 f3 44 0a
1400: ff fd 01 08 78 05 00 ca f7 41
it is mistook for controller missing packets, so results
in page fault after overwriting memdump buffer allocated.

Fixed by ignoring QCA6390 sequence number check and
checking buffer space before writing.

Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
Tested-by: Zijun Hu <zijuhu@codeaurora.org>
---
Changes in v4:
- add a piece of code comments
Changes in v3:
- correct coding style
Changes in v2:
- rename a local variable from @temp to @rx_size

 drivers/bluetooth/hci_qca.c | 49 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e4a6823..4acac13 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -114,6 +114,7 @@ struct qca_memdump_data {
 	char *memdump_buf_tail;
 	u32 current_seq_no;
 	u32 received_dump;
+	u32 ram_dump_size;
 };
 
 struct qca_memdump_event_hdr {
@@ -976,6 +977,8 @@ static void qca_controller_memdump(struct work_struct *work)
 	char nullBuff[QCA_DUMP_PACKET_SIZE] = { 0 };
 	u16 seq_no;
 	u32 dump_size;
+	u32 rx_size;
+	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 
 	while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
 
@@ -1029,6 +1032,7 @@ static void qca_controller_memdump(struct work_struct *work)
 
 			skb_pull(skb, sizeof(dump_size));
 			memdump_buf = vmalloc(dump_size);
+			qca_memdump->ram_dump_size = dump_size;
 			qca_memdump->memdump_buf_head = memdump_buf;
 			qca_memdump->memdump_buf_tail = memdump_buf;
 		}
@@ -1051,26 +1055,57 @@ static void qca_controller_memdump(struct work_struct *work)
 		 * the controller. In such cases let us store the dummy
 		 * packets in the buffer.
 		 */
+		/* For QCA6390, controller does not lost packets but
+		 * sequence number field of packat sometimes has error
+		 * bits, so skip this checking for missing packet.
+		 */
 		while ((seq_no > qca_memdump->current_seq_no + 1) &&
+			(soc_type != QCA_QCA6390) &&
 			seq_no != QCA_LAST_SEQUENCE_NUM) {
 			bt_dev_err(hu->hdev, "QCA controller missed packet:%d",
 				   qca_memdump->current_seq_no);
+			rx_size = qca_memdump->received_dump;
+			rx_size += QCA_DUMP_PACKET_SIZE;
+			if (rx_size > qca_memdump->ram_dump_size) {
+				bt_dev_err(hu->hdev,
+						"QCA memdump received %d, no space for missed packet",
+						qca_memdump->received_dump);
+				break;
+			}
 			memcpy(memdump_buf, nullBuff, QCA_DUMP_PACKET_SIZE);
 			memdump_buf = memdump_buf + QCA_DUMP_PACKET_SIZE;
 			qca_memdump->received_dump += QCA_DUMP_PACKET_SIZE;
 			qca_memdump->current_seq_no++;
 		}
 
-		memcpy(memdump_buf, (unsigned char *) skb->data, skb->len);
-		memdump_buf = memdump_buf + skb->len;
-		qca_memdump->memdump_buf_tail = memdump_buf;
-		qca_memdump->current_seq_no = seq_no + 1;
-		qca_memdump->received_dump += skb->len;
+		rx_size = qca_memdump->received_dump + skb->len;
+		if (rx_size <= qca_memdump->ram_dump_size) {
+			if ((seq_no != QCA_LAST_SEQUENCE_NUM) &&
+					(seq_no != qca_memdump->current_seq_no))
+				bt_dev_err(hu->hdev,
+						"QCA memdump unexpected packet %d",
+						seq_no);
+			bt_dev_dbg(hu->hdev,
+					"QCA memdump packet %d with length %d",
+					seq_no, skb->len);
+			memcpy(memdump_buf, (unsigned char *)skb->data,
+					skb->len);
+			memdump_buf = memdump_buf + skb->len;
+			qca_memdump->memdump_buf_tail = memdump_buf;
+			qca_memdump->current_seq_no = seq_no + 1;
+			qca_memdump->received_dump += skb->len;
+		} else {
+			bt_dev_err(hu->hdev,
+					"QCA memdump received %d, no space for packet %d",
+					qca_memdump->received_dump, seq_no);
+		}
 		qca->qca_memdump = qca_memdump;
 		kfree_skb(skb);
 		if (seq_no == QCA_LAST_SEQUENCE_NUM) {
-			bt_dev_info(hu->hdev, "QCA writing crash dump of size %d bytes",
-				   qca_memdump->received_dump);
+			bt_dev_info(hu->hdev,
+					"QCA memdump Done, received %d, total %d",
+					qca_memdump->received_dump,
+					qca_memdump->ram_dump_size);
 			memdump_buf = qca_memdump->memdump_buf_head;
 			dev_coredumpv(&hu->serdev->dev, memdump_buf,
 				      qca_memdump->received_dump, GFP_KERNEL);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

