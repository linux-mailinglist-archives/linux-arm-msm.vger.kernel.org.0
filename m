Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172FC443EB8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 09:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbhKCI6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 04:58:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61396 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231338AbhKCI6D (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 04:58:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635929727; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=oz91arYKn1LybkXaT1qvMqZJN2Z5/qjO+oxjfPs9Vlw=; b=FzdgKUDbFU6SNTGFIjccSFxP7IXO8mJT9aVh1vWVadviqg8cztxrH4a8kJw/jVCi1bAovaMp
 a6sh4nK9ZPoMKHipeIymcXcmIELvJJHXuVDA2EYihP25YlImvUIa+h5lICFsLoLwdyle6VtF
 qkrfTGh+DaXC0QqdXVixJ3ZiIX4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61824e705bda9665a1813e2d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Nov 2021 08:55:12
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A5D75C43460; Wed,  3 Nov 2021 08:55:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C41BDC4338F;
        Wed,  3 Nov 2021 08:55:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Nov 2021 16:55:10 +0800
From:   tjiang@codeaurora.org
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, tjiang@codeaurora.org
Subject: [PATCH v2] Bluetooth: btusb: using big-endian definition for board_id
  in struct qca_version
Message-ID: <c92c38b60b1b55b5d72f7f1c718641e1@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we name nvm file by using big-endian for boardID, so align host with 
it.

Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
---
  drivers/bluetooth/btusb.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 46d892bbde62..08a1c6d8390f 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2883,7 +2883,7 @@ struct qca_version {
  	__le32	rom_version;
  	__le32	patch_version;
  	__le32	ram_version;
-	__le16	board_id;
+	__be16	board_id;
  	__le16	flag;
  	__u8	reserved[4];
  } __packed;
@@ -3072,7 +3072,7 @@ static void btusb_generate_qca_nvm_name(char 
*fwname, size_t max_size,
  	u16 flag = le16_to_cpu(ver->flag);

  	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
-		u16 board_id = le16_to_cpu(ver->board_id);
+		u16 board_id = be16_to_cpu(ver->board_id);
  		const char *variant;

  		switch (le32_to_cpu(ver->ram_version)) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
