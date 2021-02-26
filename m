Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984B0326185
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 11:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhBZKp1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 05:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhBZKpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 05:45:25 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E438C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 02:44:45 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d11so8102378wrj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=7HALyY2ifHn/k7fFULMjlEOjm1DZlnSUzh1SWVAsV20=;
        b=DI1q+fVgO2eOlwKPZhxbMIbCNPQflbbJSu+ROuCr5jQEt/LMZu6ARS8TPXQobmeGIH
         wEGFxeEbtQGo5L1LQxOX45WQJNNYXjvizyC7YjvvecMcb/2ITcON08VWa1yqjvTUixuf
         CN2PakjBw2BoCqGQ3GVJS8W/2jFq7azeg3ydOyVKSmGpU9z56OibbLmZLxf1mXDsplEr
         sm1kUFEcPq+4nYK59PxXp6ZTUGfstFZJA6CT/NxTT2bGJuWs5MP5abU/H+4jQqyJPqQK
         2osa7q4Sku0yB1O2iXKkQeKK8aRHo2O/FuPPmlELXgJLL2bjvzMA3/LhpHNc35Ogytba
         cqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7HALyY2ifHn/k7fFULMjlEOjm1DZlnSUzh1SWVAsV20=;
        b=czlY8tPtTWap5r1srdoo5g45/DF76toWaWx0ce17lsLIu2I/Oa9IHKVNLy3v76YDhh
         M61KxBSt/mc97JlUNg501TN4+6zs7nbVAjO5maVk3d5kEivOEna5ibKvVFxHbj5G2KMt
         zISR09R3ZXhFudcDjpDCLLDLn9ukjLeA9L1/XFEpnp/bBedILn9PVoDWHaxDDNllNlqv
         SGpc8dlcUaLYwUmH4fy2hgAVcsTpMjiH9GVJfBsvvcNZ0YYN5jrj6UEZz21VDDQgWum1
         EwhT5/Z5s9TPev9a0rluThb4oLZqjvEWUa4kyyRU6eNAgRKagr7UXdTSXKyzF0UOYYrE
         emlQ==
X-Gm-Message-State: AOAM530jZnfIJfY9rMvsZtixCpVIU7RVvdx/l59pgB+l8hAyqEZTRKrD
        YsoTjuI9DgFuHL7vhgOQhpDpnI7gpHNhnxFT
X-Google-Smtp-Source: ABdhPJya0MVA8zU0lXFBzSBHbi0ES7sFQc1+2g+zwrYWuPyDZ/b9NYfgTkkj+2avPy7HUJxw4RYFPg==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr2583942wrt.334.1614336284248;
        Fri, 26 Feb 2021 02:44:44 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:75f7:3502:b280:80de])
        by smtp.gmail.com with ESMTPSA id o129sm11652205wme.21.2021.02.26.02.44.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2021 02:44:43 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     jhugo@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] mhi: Fix invalid error returning in mhi_queue
Date:   Fri, 26 Feb 2021 11:53:02 +0100
Message-Id: <1614336782-5809-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mhi_queue returns an error when the doorbell is not accessible in
the current state. This can happen when the device is in non M0
state, like M3, and needs to be waken-up prior ringing the DB. This
case is managed earlier by triggering an asynchronous M3 exit via
controller resume/suspend callbacks, that in turn will cause M0
transition and DB update.

So, since it's not an error but just delaying of doorbell update, there
is no reason to return an error.

This also fixes a use after free error for skb case, indeed a caller
queuing skb will try to free the skb if the queueing fails, but in
that case queueing has been done.

Fixes: a8f75cb348fd ("mhi: core: Factorize mhi queuing")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 v2: - Fix/reword commit message
     - Add Fixes tag

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

