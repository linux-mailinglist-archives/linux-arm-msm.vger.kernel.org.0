Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8A03665BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Apr 2021 08:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235106AbhDUG5E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Apr 2021 02:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhDUG5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Apr 2021 02:57:04 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60385C06174A;
        Tue, 20 Apr 2021 23:56:31 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id 2so20649264vsh.4;
        Tue, 20 Apr 2021 23:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RZ8OXikTKVlH7T8DQOt+y/7x4Zf4x2hsUuy/B/b14Io=;
        b=oCPYmIbjutCHYviOt3jEMFwVnL5KhMF2d3lor2ct9X7/5OzSoQnoqIFUk5N52VV4Mp
         YMY7WKFBBJzZuFs5mXTmrdmFUkXF4/3OvqzFACu8DC4gxZlp2X42fKUy+73m6C5VxNwy
         wT+bGY/wUwLW5+z7oqzv1smkXVi3JZfd9mSaDSVl5JnPr84MuQdLQTlmgrlH8UUCbmgu
         cwZGtQpHUkA9KGu3Okfy8NjILzOPkU0g+Xsh1VuYX2S4WsMJci7vg/hRCtv57zfiDnvl
         vOJFSrsVOLoGDbVLQx89B3kNOlTeahyT5t/wKM3RgkiJIkSq1Iii2hIOY1vZxmeVoYCc
         s9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RZ8OXikTKVlH7T8DQOt+y/7x4Zf4x2hsUuy/B/b14Io=;
        b=W9mDMUlQv8t1kAapwcb6QSzVq3oYzlvPtelNpfRDwwjT3+3CAnOv4R3y0w4GvxuBI9
         9H6vutk7nm5RPrEWD1tlLBlAUrRVxHEk6uoWMYhMxYC8htGlNIPwIRyAlLkqhzMCxFBm
         MnVhs/cJTbTWIRuoOg05nfNL8MOnAJMD5mPgsvU6oUotuKw215AMxKb4a+MyNd7gPtjc
         KwYS9Omey2cIBVB5FXjCDF7oH2OE140v6juCGeQkKcFYMvzkZz54QQhq/1HMyjoKMrsa
         +UA6jO192PV0ErDlA8ZFvC5MiRwIvgsh7pPVu65xHwmlsgYBMpYFJAGTdkHBPO1FitRZ
         WEGw==
X-Gm-Message-State: AOAM533nrtOsXQ12WQOPZgynmRnaLmrzIP+Zdj983vJJF7E8e4FyCTUP
        l5r1JPJ/7IoT1yQqjIe0To8=
X-Google-Smtp-Source: ABdhPJx60kNBeC7ZiSHF0yhePo24lh1pqJbnxdBeQIzPxX1ATrIuiQAIoFE0dZnn0297q/Dqon5REQ==
X-Received: by 2002:a05:6102:941:: with SMTP id a1mr12117241vsi.32.1618988190619;
        Tue, 20 Apr 2021 23:56:30 -0700 (PDT)
Received: from localhost.localdomain ([87.101.93.188])
        by smtp.gmail.com with ESMTPSA id j23sm170173uak.19.2021.04.20.23.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 23:56:30 -0700 (PDT)
From:   Jarvis Jiang <jarvis.w.jiang@gmail.com>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        cchen50@lenovo.com, mpearson@lenovo.com,
        Jarvis Jiang <jarvis.w.jiang@gmail.com>
Subject: [PATCH v1] bus: mhi: pci_generic: T99W175: update channel name from AT to DUN
Date:   Tue, 20 Apr 2021 23:55:01 -0700
Message-Id: <20210421065501.3134-1-jarvis.w.jiang@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to MHI v1.1 specification, change the channel name of T99W175
from "AT" to "DUN" (Dial-up networking) for both channel 32 and 33,
so that the channels can be bound to the Qcom WWAN control driver, and
device node such as /dev/wwan0p3AT will be generated, which is very useful
for debugging modem

Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>
---
 drivers/bus/mhi/pci_generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 7c810f02a2ef..8c7f6576e421 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -311,8 +311,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
 	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
-	MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
-	MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
-- 
2.25.1

