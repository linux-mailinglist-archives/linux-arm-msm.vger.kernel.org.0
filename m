Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B710133DDE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 10:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbgAHJIW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 04:08:22 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:28994 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727518AbgAHJIV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 04:08:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578474501; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=6CDsFIM/kWKxfBbG2h1PLawytrueo+E0DdiEb5Ryxt8=; b=J8qOVkb73i/8UhkhT0Ro/6S//suHTWOcV7nLBdBYrDFQiaN7RpCRHu4ItW6y1teTxAkobAbJ
 mNyAaSRrm/acsNsZOpVKlDRQWHoiSbUJPyTVaeI3VF2N7nQGUcYvj/buw2GDklVY8F05LvZP
 XnLkWvczkC322ixVdbetOZm2pos=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e159c02.7f9ba3b37d18-smtp-out-n03;
 Wed, 08 Jan 2020 09:08:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A65EDC4479C; Wed,  8 Jan 2020 09:08:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CBC54C4479F;
        Wed,  8 Jan 2020 09:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CBC54C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v2 3/3] Bluetooth: hci_qca: Use unified API qca_power_on() to power up wcn399x
Date:   Wed,  8 Jan 2020 17:08:04 +0800
Message-Id: <20200108090804.22889-3-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108090804.22889-1-rjliao@codeaurora.org>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
 <20200108090804.22889-1-rjliao@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch replaces wcn399x power on with unified API qca_power_on(),
which supports both wcn399x and Rome.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---

Changes in v2: Added this patch

 drivers/bluetooth/hci_qca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 8fc8c9bce9ee..7cc82d048558 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1579,7 +1579,7 @@ static int qca_setup(struct hci_uart *hu)
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
 		hu->hdev->shutdown = qca_power_off;
-		ret = qca_wcn3990_init(hu);
+		ret = qca_power_on(hdev);
 		if (ret)
 			return ret;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
