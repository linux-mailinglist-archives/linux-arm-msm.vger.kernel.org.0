Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7932885B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 11:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732962AbgJIJBI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 05:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732712AbgJIJBH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 05:01:07 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325FEC0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 02:01:07 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e17so9408988wru.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KefA9eQVo3x8din0ZKTkjJSx7ogD6q7GazZdwrZYdKA=;
        b=jVODD7VBje7BoH7ZqA4LrleCsnL0si4tgrv/RjUNfHiT263psLoL6H8I48CnnVZ3K3
         NvZNSMCMf9hxD/L9N1/6plnpgDQY3Kp46ypXBOqBrcomdUMuTDuFrIYkTbChSNk9f2bl
         sXlA0O+1asXDDnf5O4RmjwjMSMyNfVYynpSciaJPvWhZbojlV8Tn9haE9yTXrjeO8R76
         pdweYdYujBKVgVuJJOj81l6Qs9cZUQVivtimZQSUaVP/ZSnYNH1J1tV2QpEWlZozwOM1
         vew9l0CwzAEVTa9cLhiSq9QDPN27v7ioaaBIboblZ2bRzjl+qXhn5Mm95zbPHUYRsc1e
         SNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KefA9eQVo3x8din0ZKTkjJSx7ogD6q7GazZdwrZYdKA=;
        b=IRqhT3bHvTPfM0Re9U/836NBHboJKmO/xt7juO+bcFfUV0NtgJEZCcFxP3o8D+pOH/
         +tk7O2ZRuE22ZFfWZOAdAvucpoFne10f5kCRek0LCVpcypepXlaNwzG1+E8Pzeg8zB3O
         WR4lkj/h1e5LBg7p0chXTG59sN7Jx4g631n15cM9gnQnAkGd8bRrQ4ATToA6XY+xtb0m
         lmyBN1uHhLg3ZagirBghQ6bRugcaf/nc4v/+FtOby+jDlPGVy6nSaPfnsc0AeK4Os2zV
         orob4diKlpn61mzyxmbii0/+EDmZ0CEd977R64HmPzKNBcHheg95U2xvAg0sMXTd9U5h
         wjBQ==
X-Gm-Message-State: AOAM531JA2XWCKBbe3VWPkwJ7LZyeVTMQB/ehDNCxqvG7yYZE52U9wtC
        4Xu6ZqTTLej6qnVkMDD77PURS7AjCZljtQ==
X-Google-Smtp-Source: ABdhPJwxh2R0owY8hh9VH/0K/t7J1X4uPnHaM2KghhXOfKRt6HWK6udYStQ6c+qoxgJd9mMdJUXChA==
X-Received: by 2002:adf:8562:: with SMTP id 89mr13508373wrh.214.1602234065797;
        Fri, 09 Oct 2020 02:01:05 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id r68sm5464205wmr.37.2020.10.09.02.01.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2020 02:01:05 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: Fix channel close issue on driver remove
Date:   Fri,  9 Oct 2020 11:07:14 +0200
Message-Id: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some MHI device drivers need to stop the channels in their driver
remove callback (e.g. module unloading), but the unprepare function
is aborted because MHI core moved the channels to suspended state
prior calling driver remove callback. This prevents the driver to
send a proper MHI RESET CHAN command to the device. Device is then
unaware of the stopped state of these channels.

This causes issue when driver tries to start the channels again (e.g.
module is reloaded), since device considers channels as already
started (inconsistent state).

Fix this by allowing channel reset when channel is suspended.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index d20967a..a588eac 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1232,7 +1232,8 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 	/* no more processing events for this channel */
 	mutex_lock(&mhi_chan->mutex);
 	write_lock_irq(&mhi_chan->lock);
-	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
+	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
+	    mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
 		write_unlock_irq(&mhi_chan->lock);
 		mutex_unlock(&mhi_chan->mutex);
 		return;
-- 
2.7.4

