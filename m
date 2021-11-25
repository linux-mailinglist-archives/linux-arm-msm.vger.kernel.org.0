Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B74645DAD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 14:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355138AbhKYNWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 08:22:43 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8383 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244519AbhKYNUn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 08:20:43 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 25 Nov 2021 05:17:31 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2021 05:17:30 -0800
X-QCInternal: smtphost
Received: from hyd-lablnx229.qualcomm.com ([10.204.179.152])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 Nov 2021 18:47:14 +0530
Received: by hyd-lablnx229.qualcomm.com (Postfix, from userid 2390365)
        id 6173F21534; Thu, 25 Nov 2021 18:47:12 +0530 (IST)
From:   pharish <pharish@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org, mcchou@chromium.org,
        saluvala@codeaurora.org, pharish <pharish@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Optimizations in init sequence for WCN6750.
Date:   Thu, 25 Nov 2021 18:47:09 +0530
Message-Id: <1637846230-4798-1-git-send-email-pharish@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change adds optimazation in init sequence for WCN6750.

Signed-off-by: pharish <pharish@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 6f44b26..4dedaaa 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1603,15 +1603,19 @@ static int qca_regulator_init(struct hci_uart *hu)
 	 */
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 	if (!qcadev->bt_power->vregs_on) {
-		serdev_device_close(hu->serdev);
+		if (qca_is_wcn399x(soc_type))
+			serdev_device_close(hu->serdev);
+
 		ret = qca_regulator_enable(qcadev);
 		if (ret)
 			return ret;
 
-		ret = serdev_device_open(hu->serdev);
-		if (ret) {
-			bt_dev_err(hu->hdev, "failed to open port");
-			return ret;
+		if (qca_is_wcn399x(soc_type)) {
+			ret = serdev_device_open(hu->serdev);
+			if (ret) {
+				bt_dev_err(hu->hdev, "failed to open port");
+				return ret;
+			}
 		}
 	}
 
@@ -1635,9 +1639,8 @@ static int qca_regulator_init(struct hci_uart *hu)
 		}
 	}
 
-	qca_set_speed(hu, QCA_INIT_SPEED);
-
 	if (qca_is_wcn399x(soc_type)) {
+		qca_set_speed(hu, QCA_INIT_SPEED);
 		ret = qca_send_power_pulse(hu, true);
 		if (ret)
 			return ret;
@@ -1648,6 +1651,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 	 * Without this, we will have RTS and CTS synchronization
 	 * issues.
 	 */
+
 	serdev_device_close(hu->serdev);
 	ret = serdev_device_open(hu->serdev);
 	if (ret) {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

