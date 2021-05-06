Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E26375957
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 19:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236245AbhEFReu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 13:34:50 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:51109 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236203AbhEFRet (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 13:34:49 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 06 May 2021 10:33:50 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 May 2021 10:33:48 -0700
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 May 2021 23:03:15 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 8983E21FF7; Thu,  6 May 2021 23:03:14 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v3 3/5] Bluetooth: btqca: Moved extracting rom version info to common place
Date:   Thu,  6 May 2021 23:03:10 +0530
Message-Id: <1620322392-27148-4-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
References: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Moved extracting rom version info to common place as this code is
common in all if else ladder in qca_uart_setup.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 drivers/bluetooth/btqca.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 320c555..658fd8e4 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -533,24 +533,21 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 
 	config.user_baud_rate = baudrate;
 
+	/* Firmware files to download are based on ROM version.
+	 * ROM version is derived from last two bytes of soc_ver.
+	 */
+	rom_ver = ((soc_ver & 0x00000f00) >> 0x04) |
+		    (soc_ver & 0x0000000f);
+
 	/* Download rampatch file */
 	config.type = TLV_TYPE_PATCH;
 	if (qca_is_wcn399x(soc_type)) {
-		/* Firmware files to download are based on ROM version.
-		 * ROM version is derived from last two bytes of soc_ver.
-		 */
-		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) |
-			    (soc_ver & 0x0000000f);
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/crbtfw%02x.tlv", rom_ver);
 	} else if (soc_type == QCA_QCA6390) {
-		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) |
-			    (soc_ver & 0x0000000f);
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/htbtfw%02x.tlv", rom_ver);
 	} else if (soc_type == QCA_WCN6750) {
-		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) |
-			    (soc_ver & 0x0000000f);
 		/* Choose mbn file by default.If mbn file is not found
 		 * then choose tlv file
 		 */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

