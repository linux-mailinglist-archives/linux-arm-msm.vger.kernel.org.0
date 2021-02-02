Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4073E30C255
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 15:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234604AbhBBOre (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 09:47:34 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:50648 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbhBBOqS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 09:46:18 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 02 Feb 2021 06:45:34 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Feb 2021 06:45:33 -0800
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 02 Feb 2021 20:15:09 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id EB59521DF9; Tue,  2 Feb 2021 20:15:08 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: check for SSR triggered flag while suspend
Date:   Tue,  2 Feb 2021 20:15:07 +0530
Message-Id: <1612277107-12163-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCA_IBS_DISABLED flag will be set after memorydump started from
controller.Currently qca_suspend() is waiting for SSR to complete
based on flag QCA_IBS_DISABLED.Added to check for QCA_SSR_TRIGGERED
flag too.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 17a3859..ff2fb68 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2111,7 +2111,8 @@ static int __maybe_unused qca_suspend(struct device *dev)
 	    !test_bit(QCA_SSR_TRIGGERED, &qca->flags))
 		return 0;
 
-	if (test_bit(QCA_IBS_DISABLED, &qca->flags)) {
+	if (test_bit(QCA_IBS_DISABLED, &qca->flags) ||
+	    test_bit(QCA_SSR_TRIGGERED, &qca->flags)) {
 		wait_timeout = test_bit(QCA_SSR_TRIGGERED, &qca->flags) ?
 					IBS_DISABLE_SSR_TIMEOUT_MS :
 					FW_DOWNLOAD_TIMEOUT_MS;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

