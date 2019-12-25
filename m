Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D29412A648
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2019 07:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfLYGDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Dec 2019 01:03:31 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:36923 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726416AbfLYGDb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Dec 2019 01:03:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577253811; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=J6AeN4DRpT+vdWvwbQxV34qHFa3WVW9yAt/YKjEVz9g=; b=vDN3OP0gPAonYpmDMPFZBMEcOiFwIg4o8k9xOHCFwichmafMztJ6kmQeSN3V9LyGZGQFUHAI
 gs8VJZ0/kyXpCqCIUeqTa5PGMit4MDWgqHMJ94scoQfsgGdOKgKgp6GxM/KI9OJnZlbkh/qc
 TWMdJ58jSjo81AdhTRv9iwEq9qE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e02fbb1.7f9253a3c5a8-smtp-out-n02;
 Wed, 25 Dec 2019 06:03:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D633DC433A2; Wed, 25 Dec 2019 06:03:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 08DDCC43383;
        Wed, 25 Dec 2019 06:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 08DDCC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v1 3/4] Bluetooth: hci_qca: Enable power off/on support during hci down/up for QCA Rome
Date:   Wed, 25 Dec 2019 14:03:16 +0800
Message-Id: <20191225060317.5258-3-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191225060317.5258-1-rjliao@codeaurora.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch registers hdev->shutdown() callback and also sets
HCI_QUIRK_NON_PERSISTENT_SETUP for QCA Rome. It will power-off the BT chip
during hci down and power-on/initialize the chip again during hci up.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 45042aa27fa4..7e202041ed77 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1300,6 +1300,11 @@ static int qca_setup(struct hci_uart *hu)
 	} else {
 		bt_dev_info(hdev, "ROME setup");
 		if (hu->serdev) {
+			/* Enable NON_PERSISTENT_SETUP QUIRK to ensure to
+			 * execute setup for every hci up.
+			 */
+			set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
+			hu->hdev->shutdown = qca_power_off;
 			qcadev = serdev_device_get_drvdata(hu->serdev);
 			gpiod_set_value_cansleep(qcadev->bt_en, 1);
 			/* Controller needs time to bootup. */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
