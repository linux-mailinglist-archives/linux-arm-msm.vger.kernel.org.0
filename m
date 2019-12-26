Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6267F12AA95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2019 07:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfLZGqO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 01:46:14 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:56267 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726442AbfLZGqO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 01:46:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577342773; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=YvpLMcJ7nf0xT09j0b6TKkJ+vGWvNe7jksE7UBy+iic=; b=KsZ1PRTo1WFVrhCHHuAtVp0lMpIpqFurSgZ7ZYgLPOrhbPFKaaJNDq+Ay4lpBsk/ZD90Tpvz
 uXwwPWjJC9TgsBaJbjLi92Lzj1cR/C8yEC3D+OR01n8FpqJ00Fk/alIAX5JoBBd6ADfmV8uE
 8V6qPLzhrHPkZxu248LfFNynUVk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e045730.7fee563aab20-smtp-out-n01;
 Thu, 26 Dec 2019 06:46:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 62077C4479C; Thu, 26 Dec 2019 06:46:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28699C433A2;
        Thu, 26 Dec 2019 06:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28699C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v2 3/4] Bluetooth: hci_qca: Enable power off/on support during hci down/up for QCA Rome
Date:   Thu, 26 Dec 2019 14:45:53 +0800
Message-Id: <20191226064554.16803-3-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191226064554.16803-1-rjliao@codeaurora.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191226064554.16803-1-rjliao@codeaurora.org>
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
