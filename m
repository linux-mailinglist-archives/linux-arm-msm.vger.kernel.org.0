Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534FC466292
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 12:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357519AbhLBLmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 06:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357493AbhLBLlz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 06:41:55 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230D5C0613DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 03:38:33 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id b13so20044767plg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 03:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xf7vNFLWq8MuNmvFYkwL5H5mINaB3lxvdk/G5WOR8Gg=;
        b=D1z/V+8MMQDxyoN2M35VASNVJP9x3lMl5IRFA4u+hg+RB/miQQxxDGB08l2A+MzlnR
         1H9kesEvlkZ5tz2oR2e1PSIH+aPHoAcM4r974E+SG+OrTvf0NZEM/A9QZcVdjS+kJPM8
         zXpfA4gvOohyA8xJU8aJqqku22RmWgL4vJiDh52eSrKcLBoST2DZXqP4IPLfDGVfeAm9
         UK8HhSOyEfKNA5nvpGHxWocdz3sep3cBhCwawMsIackHktEc5xcn00CvqZZHZIqBGl3F
         FZTZBdKCpVZz19/HA2TFmTgZfeWmeA2d+N1RCezTwVUhmfJkyLKxROzDCJrwJxr/IwNU
         tefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xf7vNFLWq8MuNmvFYkwL5H5mINaB3lxvdk/G5WOR8Gg=;
        b=QKdsJOOjFPfj01SODzupB8GNBWlx+Z93Sjea3W5CPGCz8ygx2Ebh8YhqlWzw0k2m2C
         V3WvnoCuS0286Q9STlkhCTjQP5v5s4H6HmQ9zXig6SRzi04h7LoIBx6LSTvEu9YSkTlm
         OfgXTa4T3cDbzsWL2HpfP4QVspejD1y30xDpPmc++JU4xPTgY4wO2wnDuWedopoSmO90
         bbM/qZhkI553pQPTDSpuWFkQ/fuBeswQ56xaMZbJs3X7C+xJ621bKS373a7vLpV9AIoZ
         j6vGKpRCbrNqEisQjuGaJ96bROrMRz+1F6Pn2ZFVr9N7pqcA2EK//F5UhopjyNWwyl0K
         G2Rw==
X-Gm-Message-State: AOAM5305vh66SxSTHEY2Uy1tbxDa/TD2CK6pJ7frkXsTuMM5NVmI5dbk
        0y3KMBR39aULHz6j7bV5Pnyh
X-Google-Smtp-Source: ABdhPJwpdux3KkMAAG5uf/v+7/HBi88ktJA9WdlbO3bZ5Kpm5g4dqOD2VIMsIRF1d3YVz21WZBUc9A==
X-Received: by 2002:a17:90a:1a55:: with SMTP id 21mr5390733pjl.240.1638445112581;
        Thu, 02 Dec 2021 03:38:32 -0800 (PST)
Received: from localhost.localdomain ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id h5sm3602552pfi.46.2021.12.02.03.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:38:32 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 19/20] bus: mhi: ep: Add support for suspending and resuming channels
Date:   Thu,  2 Dec 2021 17:05:51 +0530
Message-Id: <20211202113553.238011-20-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for suspending and resuming the channels in MHI endpoint stack.
The channels will be moved to the suspended state during M3 state
transition and will be resumed during M0 transition.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/internal.h |  2 ++
 drivers/bus/mhi/ep/main.c     | 58 +++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/ep/sm.c       |  4 +++
 3 files changed, 64 insertions(+)

diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
index 70626ef3799d..e0c36346c5b8 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -231,5 +231,7 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl);
 void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl);
+void mhi_ep_resume_channels(struct mhi_ep_cntrl *mhi_cntrl);
+void mhi_ep_suspend_channels(struct mhi_ep_cntrl *mhi_cntrl);
 
 #endif
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index cc3da846ed36..930b5c2005d0 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1176,6 +1176,64 @@ void mhi_ep_power_down(struct mhi_ep_cntrl *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_ep_power_down);
 
+void mhi_ep_suspend_channels(struct mhi_ep_cntrl *mhi_cntrl)
+{
+	struct mhi_ep_chan *mhi_chan;
+	u32 tmp;
+	int i;
+
+	for (i = 0; i < mhi_cntrl->max_chan; i++) {
+		mhi_chan = &mhi_cntrl->mhi_chan[i];
+
+		if (!mhi_chan->mhi_dev)
+			continue;
+
+		mutex_lock(&mhi_chan->lock);
+		/* Skip if the channel is not currently running */
+		tmp = mhi_cntrl->ch_ctx_cache[i].chcfg;
+		if (FIELD_GET(CHAN_CTX_CHSTATE_MASK, tmp) != MHI_CH_STATE_RUNNING) {
+			mutex_unlock(&mhi_chan->lock);
+			continue;
+		}
+
+		dev_dbg(&mhi_chan->mhi_dev->dev, "Suspending channel\n");
+		/* Set channel state to SUSPENDED */
+		tmp &= ~CHAN_CTX_CHSTATE_MASK;
+		tmp |= (MHI_CH_STATE_SUSPENDED << CHAN_CTX_CHSTATE_SHIFT);
+		mhi_cntrl->ch_ctx_cache[i].chcfg = tmp;
+		mutex_unlock(&mhi_chan->lock);
+	}
+}
+
+void mhi_ep_resume_channels(struct mhi_ep_cntrl *mhi_cntrl)
+{
+	struct mhi_ep_chan *mhi_chan;
+	u32 tmp;
+	int i;
+
+	for (i = 0; i < mhi_cntrl->max_chan; i++) {
+		mhi_chan = &mhi_cntrl->mhi_chan[i];
+
+		if (!mhi_chan->mhi_dev)
+			continue;
+
+		mutex_lock(&mhi_chan->lock);
+		/* Skip if the channel is not currently suspended */
+		tmp = mhi_cntrl->ch_ctx_cache[i].chcfg;
+		if (FIELD_GET(CHAN_CTX_CHSTATE_MASK, tmp) != MHI_CH_STATE_SUSPENDED) {
+			mutex_unlock(&mhi_chan->lock);
+			continue;
+		}
+
+		dev_dbg(&mhi_chan->mhi_dev->dev, "Resuming channel\n");
+		/* Set channel state to RUNNING */
+		tmp &= ~CHAN_CTX_CHSTATE_MASK;
+		tmp |= (MHI_CH_STATE_RUNNING << CHAN_CTX_CHSTATE_SHIFT);
+		mhi_cntrl->ch_ctx_cache[i].chcfg = tmp;
+		mutex_unlock(&mhi_chan->lock);
+	}
+}
+
 static void mhi_ep_release_device(struct device *dev)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
diff --git a/drivers/bus/mhi/ep/sm.c b/drivers/bus/mhi/ep/sm.c
index 50378b9f7300..0bef5d808195 100644
--- a/drivers/bus/mhi/ep/sm.c
+++ b/drivers/bus/mhi/ep/sm.c
@@ -93,8 +93,11 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl)
 	enum mhi_state old_state;
 	int ret;
 
+	/* If MHI is in M3, resume suspended channels */
 	spin_lock_bh(&mhi_cntrl->state_lock);
 	old_state = mhi_cntrl->mhi_state;
+	if (old_state == MHI_STATE_M3)
+		mhi_ep_resume_channels(mhi_cntrl);
 
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M0);
 	if (ret) {
@@ -140,6 +143,7 @@ int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl)
 	}
 
 	spin_unlock_bh(&mhi_cntrl->state_lock);
+	mhi_ep_suspend_channels(mhi_cntrl);
 
 	/* Signal host that the device moved to M3 */
 	ret = mhi_ep_send_state_change_event(mhi_cntrl, MHI_STATE_M3);
-- 
2.25.1

