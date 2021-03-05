Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78DD32F06A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 17:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhCEQyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 11:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhCEQx7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 11:53:59 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35B4C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 08:53:56 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id u187so2034123wmg.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 08:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5J70pTkQkyyAAz/WqKWCkdjxdt7PeU6TvREyi5dArPk=;
        b=wcNkpe9lAi9L5cN2gVk2JDVZ+2XnDz+zQr4SFzDiWx+UoOjlvCPuwM0UDEL2sww61h
         qZC5xFxbUVgwxNDCEraUFwHt7A4FT1LAe4A8Nb1QsazBZPnGeiBjLWw6uEu8NI1P0x1c
         /rwP48bxUecfkn46AsP/FcGy7DJJkj0lTUvkiFCgcVmtFhEGvuvmIQf1naBy0POnPeFB
         CN4GITFggS3upUTriWUKQ+zOmzvzG8B2UhGbBR2b2IHBtCtYtkUrRWwK5SkwfnAPNjqy
         yOMxA6dmgER1WuCY7C6FSlWNCVfnjUvIr6n6YnuKZ87zCn2tnvSl0asLp73xWU1WEb8c
         5dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5J70pTkQkyyAAz/WqKWCkdjxdt7PeU6TvREyi5dArPk=;
        b=WeA3MXIHM3xCa1zjsQNRoYgjl+/TunGJ/MeE6YwQud8i3UeJ6AnvJ0rNI6iXYoZGsU
         ansNJoE79XgmBq5ntUUMSrcOrfC7EnkCkTSMGcxLPpxMXj1GA8kFcd6jkRUd6Xd/+5ox
         AT/izdzUBFWL0r5kvn4KgmAqZRLILg+9ZMSTQNqjnT89/rajNyCs3Ox7TAYagXCOt+Hd
         PdPSd2+a/Tu129ZHIxdF604IWlJmfL2nkuctOF58lLcph3CoF8Pbnz57I5Ri4YTyrHZQ
         Pc5h1phjDO0moogEQzdLfrzBxhkbdU3mV/aHWVD75l/tN+x5DV5SMrq7/+krnce/EwT8
         k/2A==
X-Gm-Message-State: AOAM533KDgGJvabKCC9oT+QkQtceP0J6srMi7Xm4WaLle8LF+Os2UrxI
        S0Lsyc4v+/JQYkGWSOcekFNqMw==
X-Google-Smtp-Source: ABdhPJwI67dN2y56EQRdW6U+ATry+Txa/LBPR6Bg1+vlc7VM9Qc9x2ZkNKX3P6QHsOA1UCoqqIaWJw==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr4824125wmf.136.1614963235022;
        Fri, 05 Mar 2021 08:53:55 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id c35sm4850414wmp.3.2021.03.05.08.53.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 08:53:54 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/2] bus: mhi: core: Fix MHI runtime_pm behavior
Date:   Fri,  5 Mar 2021 18:02:23 +0100
Message-Id: <1614963744-25962-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change ensures that PM reference is always get during packet
queueing and released either after queuing completion (RX) or once
the buffer has been consumed (TX). This guarantees proper update for
underlying MHI controller runtime status (e.g. last_busy timestamp)
and prevents suspend to be triggered while TX packets are flying,
or before we completed update of the RX ring.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/main.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index c780234..16b9640 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -584,8 +584,11 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			/* notify client */
 			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
 
-			if (mhi_chan->dir == DMA_TO_DEVICE)
+			if (mhi_chan->dir == DMA_TO_DEVICE) {
 				atomic_dec(&mhi_cntrl->pending_pkts);
+				/* Release the reference got from mhi_queue() */
+				mhi_cntrl->runtime_put(mhi_cntrl);
+			}
 
 			/*
 			 * Recycle the buffer if buffer is pre-allocated,
@@ -1021,9 +1024,11 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (unlikely(ret))
 		goto exit_unlock;
 
-	/* trigger M3 exit if necessary */
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
-		mhi_trigger_resume(mhi_cntrl);
+	/* Packet is queued, take a usage ref to exit M3 if necessary
+	 * for host->device buffer, balanced put is done on buffer completion
+	 * for device->host buffer, balanced put is after ringing the DB
+	 */
+	mhi_cntrl->runtime_get(mhi_cntrl);
 
 	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
@@ -1034,6 +1039,9 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
 		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
+	if (dir == DMA_FROM_DEVICE)
+		mhi_cntrl->runtime_put(mhi_cntrl);
+
 exit_unlock:
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
 
@@ -1431,6 +1439,10 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
 			result.buf_addr = buf_info->cb_buf;
 			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
 		}
+
+		/* Release the reference got from mhi_queue() */
+		if (mhi_chan->dir == DMA_TO_DEVICE)
+			mhi_cntrl->runtime_put(mhi_cntrl);
 	}
 }
 
-- 
2.7.4

