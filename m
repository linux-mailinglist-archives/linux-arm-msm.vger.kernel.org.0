Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F76A45DADB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 14:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355165AbhKYNWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 08:22:45 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:23253 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344193AbhKYNUo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 08:20:44 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 25 Nov 2021 05:17:33 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2021 05:17:31 -0800
X-QCInternal: smtphost
Received: from hyd-lablnx229.qualcomm.com ([10.204.179.152])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 Nov 2021 18:47:14 +0530
Received: by hyd-lablnx229.qualcomm.com (Postfix, from userid 2390365)
        id 81B9D2126C; Thu, 25 Nov 2021 18:47:12 +0530 (IST)
From:   pharish <pharish@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org, mcchou@chromium.org,
        saluvala@codeaurora.org, pharish <pharish@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Stop IBS timer during BT OFF
Date:   Thu, 25 Nov 2021 18:47:10 +0530
Message-Id: <1637846230-4798-2-git-send-email-pharish@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637846230-4798-1-git-send-email-pharish@codeaurora.org>
References: <1637846230-4798-1-git-send-email-pharish@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change stops IBS timers during BT OFF.

Signed-off-by: pharish <pharish@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index dd768a8..6f44b26 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1928,6 +1928,9 @@ static int qca_power_off(struct hci_dev *hdev)
 	hu->hdev->hw_error = NULL;
 	hu->hdev->cmd_timeout = NULL;
 
+	mod_timer(&qca->tx_idle_timer, 0);
+	mod_timer(&qca->wake_retrans_timer, 0);
+
 	/* Stop sending shutdown command if soc crashes. */
 	if (soc_type != QCA_ROME
 		&& qca->memdump_state == QCA_MEMDUMP_IDLE) {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

