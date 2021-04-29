Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325EB36E309
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 03:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235346AbhD2BpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 21:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbhD2Bo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 21:44:59 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D2BC06138B;
        Wed, 28 Apr 2021 18:44:12 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id v23so13710999qkj.13;
        Wed, 28 Apr 2021 18:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z0Pzw0H4TbpPJpFAIVdigVkx2yK/j7uQ93wdHgfsXaM=;
        b=ZTNXhZaJsAmmBaPOxgvaQDra9s098pS5en15cdnfGs8VQyOmkt9LWV7w7S//0x+fCS
         ylzcAdIJT3xMecDB/mQxE4GTTqYZ9qO1aQyazjS0FJ+RH1Z1NNAB+nZ7RiSguvsC8ZuL
         159NJUHQq9uU51iCDgFvTglv+Um1PkY9JcZaoVRNkP+iGWpmsUoH4oDrSCpYVtD193QH
         SUdE9smxmRrYNnL1U1N32U9qqyvGksgoI4x8FnjuuDWsREk1QnTYhzDj4uF+sBbWgDbQ
         iHlG6BKTMgCd5093vAuuW8iymevFQFh39GDfAgk6bqHC4+aHkLFwBy4JaoUGoZaF1Q4r
         xPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z0Pzw0H4TbpPJpFAIVdigVkx2yK/j7uQ93wdHgfsXaM=;
        b=fOpUNwOTXxx166jZJsUTRRJImrqrSDFJLLTZ0zKpEd7u0RrWBHpF61fCD5VR7IBiFA
         wVZ6eUDXG+QI2y1SPmM9F9AuksEtbKTDQTVzN3SYOiSxHzgus8RLpERbwnhsbd4LeiXx
         Z3kLvsxDSw3pPkoJrlkrOFAot/c474xzfBjpkimZLmhWjns2IfG+4/mqKLtiBplOz9wk
         Px5opMuCUxvdsMUQdILTnqWs0xCxQXWwFvnenVXyPGWYekCtV8la15SWNRd9QGXeZ1na
         7H65dfwkWgb8r5/ORLOSgXtu/DjFpbpy4Wn2SB45sJqmdMy1NI79rjF/tvZXYWj4AhST
         CtQw==
X-Gm-Message-State: AOAM530z8OHqo0OWCkaHzKu/b+9IBkC8NaDeoYP5ek9rnKwGrx9wQY3T
        FAijXeCKGE1J96mSLxskiIA=
X-Google-Smtp-Source: ABdhPJyUGFOE60HEaZhJbrYOvZrU5sVRxxQYhf//lZXuUNcmCxzmyuKnJGgb+3eE+XmLyQTlb3iMTA==
X-Received: by 2002:a37:9bd5:: with SMTP id d204mr17230602qke.442.1619660651513;
        Wed, 28 Apr 2021 18:44:11 -0700 (PDT)
Received: from localhost.localdomain ([87.101.93.188])
        by smtp.gmail.com with ESMTPSA id 185sm1200194qko.99.2021.04.28.18.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 18:44:11 -0700 (PDT)
From:   Jarvis Jiang <jarvis.w.jiang@gmail.com>
To:     mani@kernel.org, hemantk@codeaurora.org, loic.poulain@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        cchen50@lenovo.com, mpearson@lenovo.com,
        Jarvis Jiang <jarvis.w.jiang@gmail.com>
Subject: [PATCH v2] bus: mhi: pci_generic: T99W175: update channel name from AT to DUN
Date:   Wed, 28 Apr 2021 18:42:26 -0700
Message-Id: <20210429014226.21017-1-jarvis.w.jiang@gmail.com>
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

Fixes: aac426562f56 ("bus: mhi: pci_generic: Introduce Foxconn T99W175 support")
Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>
---

v2: Add: Fixes: aac426562f56

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

