Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C2140D4B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 10:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhIPIm3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 04:42:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14280 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235117AbhIPIm3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 04:42:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631781669; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=vH/3PJSvt6dKKjRhpN7SN/NYDcrVA+09ITtulvlItFs=; b=xISPuWT8sn1fhPJWzG+4wy3WMpeK7gyiVE2lRTT2mCGA12KWIx5MDzdLFFq6H9go5Oja9zef
 IWi0krajAJwpec5hGc+MUK7MNNm9HdwpQqkyQHjBjpqzas4TqX5u/1xitG1nnZHiuukVwlIJ
 8ORpdixeNoV8hiK2PGte1UJzGCo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61430324d914b05182d9ba12 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 08:41:08
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D59ADC4360D; Thu, 16 Sep 2021 08:41:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2264CC4338F;
        Thu, 16 Sep 2021 08:41:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Sep 2021 16:41:06 +0800
From:   tjiang@codeaurora.org
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tjiang@codeaurora.org
Subject: [PATCH v1] Bluetooth: btusb: Add gpio reset way for qca btsoc in 
 cmd_timeout
Message-ID: <f1548c4ca5186597a21a8a9ee6655b58@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

if platform provide gpio connect to BT_EN reset pin of qca btsoc chip,
we can do hardware reset instead of usb port reset.

Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
---
  drivers/bluetooth/btusb.c | 22 ++++++++++++++++++++++
  1 file changed, 22 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 8ef4e0f6e0bb..da85cc14f931 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -657,11 +657,33 @@ static void btusb_rtl_cmd_timeout(struct hci_dev 
*hdev)
  static void btusb_qca_cmd_timeout(struct hci_dev *hdev)
  {
  	struct btusb_data *data = hci_get_drvdata(hdev);
+	struct gpio_desc *reset_gpio = data->reset_gpio;
  	int err;

  	if (++data->cmd_timeout_cnt < 5)
  		return;

+	if (reset_gpio) {
+		bt_dev_err(hdev, "Reset qca device via bt_en gpio");
+
+		/* Toggle the hard reset line. The qca bt device is going to
+		 * yank itself off the USB and then replug. The cleanup is handled
+		 * correctly on the way out (standard USB disconnect), and the new
+		 * device is detected cleanly and bound to the driver again like
+		 * it should be.
+		 */
+		if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
+			bt_dev_err(hdev, "last reset failed? Not resetting again");
+			return;
+		}
+
+		gpiod_set_value_cansleep(reset_gpio, 0);
+		msleep(200);
+		gpiod_set_value_cansleep(reset_gpio, 1);
+
+		return;
+	}
+
  	bt_dev_err(hdev, "Multiple cmd timeouts seen. Resetting usb device.");
  	/* This is not an unbalanced PM reference since the device will reset 
*/
  	err = usb_autopm_get_interface(data->intf);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
