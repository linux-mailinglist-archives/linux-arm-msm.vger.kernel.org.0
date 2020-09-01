Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E4D259058
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 16:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgIAO0p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 10:26:45 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:53509 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728381AbgIAOZJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 10:25:09 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 01 Sep 2020 07:24:57 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Sep 2020 07:24:55 -0700
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Sep 2020 19:54:32 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id A078321B32; Tue,  1 Sep 2020 19:54:30 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1 0/2] Close UART port if NON_PERSISTENT_SETUP is set
Date:   Tue,  1 Sep 2020 19:54:25 +0530
Message-Id: <1598970267-7170-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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

Venkata Lakshmi Narayana Gubba (2):
  Bluetooth: hci_serdev: Close UART port if NON_PERSISTENT_SETUP is set
  Bluetooth: hci_qca: Remove duplicate power off in proto close

 drivers/bluetooth/hci_qca.c    |  5 ++---
 drivers/bluetooth/hci_serdev.c | 36 +++++++++++++++++++++++++++++++++---
 2 files changed, 35 insertions(+), 6 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

