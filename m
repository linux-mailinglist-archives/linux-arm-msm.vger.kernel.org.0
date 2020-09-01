Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70BA1259050
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 16:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgIAOZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 10:25:52 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:49591 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbgIAOZJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 10:25:09 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 01 Sep 2020 07:24:59 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Sep 2020 07:24:57 -0700
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Sep 2020 19:54:32 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id E3F8E217CB; Tue,  1 Sep 2020 19:54:30 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1 1/2] Bluetooth: hci_serdev: Close UART port if NON_PERSISTENT_SETUP is set
Date:   Tue,  1 Sep 2020 19:54:26 +0530
Message-Id: <1598970267-7170-2-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598970267-7170-1-git-send-email-gubbaven@codeaurora.org>
References: <1598970267-7170-1-git-send-email-gubbaven@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When HCI_QUIRK_NON_PERSISTENT_SETUP is set by drivers,
it indicates that BT SoC will be completely powered OFF
during BT OFF. On next BT ON firmware must be downloaded
again. Holding UART port open during BT OFF is draining
the battery. Now during BT OFF, UART port is closed if
qurik HCI_QUIRK_NON_PERSISTENT_SETUP is set by clearing
HCI_UART_PROTO_READY proto flag. On next BT ON, UART
port is opened if HCI_UART_PROTO_READY proto flag is cleared.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/hci_serdev.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index 3977bba..ef96ad0 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -113,8 +113,22 @@ static int hci_uart_flush(struct hci_dev *hdev)
 /* Initialize device */
 static int hci_uart_open(struct hci_dev *hdev)
 {
+	struct hci_uart *hu = hci_get_drvdata(hdev);
+	int err;
+
 	BT_DBG("%s %p", hdev->name, hdev);
 
+	/* When Quirk HCI_QUIRK_NON_PERSISTENT_SETUP is set by
+	 * driver, BT SoC is completely turned OFF during
+	 * BT OFF. Upon next BT ON UART port should be opened.
+	 */
+	if (!test_bit(HCI_UART_PROTO_READY, &hu->flags)) {
+		err = serdev_device_open(hu->serdev);
+		if (err)
+			return err;
+		set_bit(HCI_UART_PROTO_READY, &hu->flags);
+	}
+
 	/* Undo clearing this from hci_uart_close() */
 	hdev->flush = hci_uart_flush;
 
@@ -124,11 +138,25 @@ static int hci_uart_open(struct hci_dev *hdev)
 /* Close device */
 static int hci_uart_close(struct hci_dev *hdev)
 {
+	struct hci_uart *hu = hci_get_drvdata(hdev);
+
 	BT_DBG("hdev %p", hdev);
 
+	if (!test_bit(HCI_UART_PROTO_READY, &hu->flags))
+		return 0;
+
 	hci_uart_flush(hdev);
 	hdev->flush = NULL;
 
+	/* When QUIRK HCI_QUIRK_NON_PERSISTENT_SETUP is set by driver,
+	 * BT SOC is completely powered OFF during BT OFF, holding port
+	 * open may drain the battery.
+	 */
+	if (test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
+		clear_bit(HCI_UART_PROTO_READY, &hu->flags);
+		serdev_device_close(hu->serdev);
+	}
+
 	return 0;
 }
 
@@ -354,8 +382,6 @@ void hci_uart_unregister_device(struct hci_uart *hu)
 {
 	struct hci_dev *hdev = hu->hdev;
 
-	clear_bit(HCI_UART_PROTO_READY, &hu->flags);
-
 	cancel_work_sync(&hu->init_ready);
 	if (test_bit(HCI_UART_REGISTERED, &hu->flags))
 		hci_unregister_dev(hdev);
@@ -364,6 +390,10 @@ void hci_uart_unregister_device(struct hci_uart *hu)
 	cancel_work_sync(&hu->write_work);
 
 	hu->proto->close(hu);
-	serdev_device_close(hu->serdev);
+
+	if (test_bit(HCI_UART_PROTO_READY, &hu->flags)) {
+		clear_bit(HCI_UART_PROTO_READY, &hu->flags);
+		serdev_device_close(hu->serdev);
+	}
 }
 EXPORT_SYMBOL_GPL(hci_uart_unregister_device);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

