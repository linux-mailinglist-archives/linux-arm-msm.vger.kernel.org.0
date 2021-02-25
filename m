Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC61324DA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 11:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbhBYKIb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 05:08:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233805AbhBYKFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 05:05:24 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7068C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 02:04:42 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id g11so399787wmh.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 02:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gaa+HntJuQ6rmQhc7jzPfrBWIm/FecwgprQWh1KwhLg=;
        b=Ktq5TQBkxnsDBwxrRDmcizGhWh/xIHYmNZBSoG700gjSLL7K8HP+xd3JYLXCnzxlGo
         TeDoO2WvnxDyEtbKTXfud6L3AcYrog/iqmP4BDdiIh2AU/NsSmUfWtT9qjxKk6m3Si75
         HBG80pHnzlxUx4o/CznbhxR6u06q6xTJEzm4HwtDJKnSO9+cs1LPt/wnTCcmrvKzu05g
         mNK/IbqnV9H1Dvr24/2UjbBcGF1TtKA1rYnenlvoMzv2O7nlNMSfhqhGtaJ17n2pvVVt
         MaVsT5AFMGmQ55USgaR4nMTJeP84v2RkvhrIYWXtQQq2ru5HoScdKqJIlagg760hr7YZ
         aQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gaa+HntJuQ6rmQhc7jzPfrBWIm/FecwgprQWh1KwhLg=;
        b=qepdNwrMvJKtujH/Ck7oe9uzZwfW7XY7D2yQiKopB6Thabfv3Krmu1Hsljmp/DfUKW
         MqUg6bq7gBMy390K5DZaii7Ize9bEY2d+QFNOMym8wgBOYn6ClAhjt7YjGfpV02jQ+HZ
         c9fX+ggasPudf58kJ5eq56inUctWf7BuUtcCBOE8OshxmDwoCGnrzsbcXqUufUPRk5BT
         D94F1RCw5dGUg81Aapo4AmaEbJvByhIdKTqNkEImxsh4oHm/W1KMTO/JsVPogumIHIoo
         hs+jGBAGgxC7tP8RalDoPXT+QRJligVzJ4FxZqoI9PiEjmSmfkwA+H5y5r1wsp9wvBNZ
         l8vw==
X-Gm-Message-State: AOAM5311vMckWl6XwXQ5modZOFwI1jyuuKtdqnEuHa9UjT5/eAmwdO5Y
        3yovXqWGJt4AsBQsNMVfZBoKM34HuvZ05def
X-Google-Smtp-Source: ABdhPJyRlLaQORMVINndcQX4Ij1hdWM20vmSslORNNM1YQ2rEE3ppK9EKyeCPjbPsM6t03w+IAF6Jw==
X-Received: by 2002:a05:600c:3516:: with SMTP id h22mr2437851wmq.35.1614247481513;
        Thu, 25 Feb 2021 02:04:41 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:6732:e420:1382:85f4])
        by smtp.gmail.com with ESMTPSA id z82sm5163373wmg.19.2021.02.25.02.04.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Feb 2021 02:04:41 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: Fix invalid error returning in mhi_queue
Date:   Thu, 25 Feb 2021 11:13:00 +0100
Message-Id: <1614247980-1776-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mhi_queue returns an error when the doorbell is not accessible in
the current state. This can happen when the device is in non M0
state, like M3, and needs to be waken-up prior ringing the DB. this
case is manager earlier by triggering an asynchronous M3 exit via
controller resume/suspend callbacks, that in turn will cause M0
transition and DB update.

So, since it's not an error but just delaying of doorbell update do not
return an error.

That also fix a use after free error for skb case, indeed a caller
queuing skb will try to free the skb if the queueing fails, but in
that case queueing has been done.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/main.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 7fc2482..c780234 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1031,12 +1031,8 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (mhi_chan->dir == DMA_TO_DEVICE)
 		atomic_inc(&mhi_cntrl->pending_pkts);
 
-	if (unlikely(!MHI_DB_ACCESS_VALID(mhi_cntrl))) {
-		ret = -EIO;
-		goto exit_unlock;
-	}
-
-	mhi_ring_chan_db(mhi_cntrl, mhi_chan);
+	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
+		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
 exit_unlock:
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
-- 
2.7.4

