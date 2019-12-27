Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204DF12B261
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 08:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfL0HVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 02:21:44 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:10128 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727028AbfL0HVm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 02:21:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577431302; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=TpbkWdaDjhQ1TUyhTQjrHaVL5+FzHhxjQq2y/9mq47U=; b=QnChPuWnfu7Mh4N4TReBEUp+UVYGmVd8mTZr16QuK6wS7H3ImxYh2Z+S0/vl8ykjEuX8anne
 IT+t9gKNzP23GRBcLSp8uV69geLfXizYNLiI9J4sTs0TTXF/9469Hjdxd6vwPKqDHKnr4/uu
 ql9Nm603La45ABVEYERBaq3h+/M=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05b105.7f8a13cc01b8-smtp-out-n01;
 Fri, 27 Dec 2019 07:21:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6DF68C433A2; Fri, 27 Dec 2019 07:21:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 909D9C43383;
        Fri, 27 Dec 2019 07:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 909D9C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v3 3/4] Bluetooth: hci_qca: Enable power off/on support during hci down/up for QCA Rome
Date:   Fri, 27 Dec 2019 15:21:29 +0800
Message-Id: <20191227072130.29431-3-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191227072130.29431-1-rjliao@codeaurora.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191227072130.29431-1-rjliao@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch registers hdev->shutdown() callback and also sets
HCI_QUIRK_NON_PERSISTENT_SETUP for QCA Rome. It will power-off the BT chip
during hci down and power-on/initialize the chip again during hci up.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---

Changes in v2: None
Changes in v3: 
- Move the quirk and callback register to probe()

 drivers/bluetooth/hci_qca.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 45042aa27fa4..ca0b38f065e5 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1532,6 +1532,7 @@ static int qca_init_regulators(struct qca_power *qca,
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
+	struct hci_dev *hdev;
 	const struct qca_vreg_data *data;
 	int err;
 
@@ -1596,8 +1597,14 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return err;
 
 		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
-		if (err)
+		if (err) {
 			clk_disable_unprepare(qcadev->susclk);
+			goto out;
+		}
+
+		hdev = qcadev->serdev_hu.hdev;
+		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
+		hdev->shutdown = qca_power_off;
 	}
 
 out:	return err;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
