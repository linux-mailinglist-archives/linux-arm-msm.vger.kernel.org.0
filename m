Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2144B3757
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Feb 2022 19:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiBLSYP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Feb 2022 13:24:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiBLSX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Feb 2022 13:23:56 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35BE6006E
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Feb 2022 10:23:42 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso14971368pjt.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Feb 2022 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ghLLgeFSuBhLBbaF2D3N7y/Ag1lbiZHSv5o6U722W+E=;
        b=tahHHV1myQ3F3+Wgz9DF+8m8aUh8rKmNw7/K9YIpt3LzMNmadOQeOgEkkDcaYAZABz
         osaiwszIy/oRiTbE9jtLj4915dThnRSBBA03IY/5G8rIdXsR776HP1p68iYZSvNGT58V
         9iZxZMB9U7S98bqctQFE1NqAk4tQO9UJLSZdQHxoEwFpcUryWaAGUN8amVZdn8vDYb7l
         /axuHuNsDFYRrB6ow7NgAkGXNyYtIXDbEHZnZEHoxFE8DUX0rB90vm978DcjrrRPKk5i
         1ra0o1jMj6eF/8SKRj0m9SRn/DBF0ULPLsPxDAj5ROxiSQDPLoE7De+xsnMWdLYBVYSY
         5dHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ghLLgeFSuBhLBbaF2D3N7y/Ag1lbiZHSv5o6U722W+E=;
        b=VSh9zD5D/gQJ4C7DqemM0hSJB+fxzbBZLA11VyaAJIXLuOTTS0kDx//J9PhUxjK7t5
         wUfY5iajZSSkvWzGFQYu4hByMbo7WjtPdrj1/Iiqp2oUvaUITk3aLTMt2mqjiGh00YK0
         Up3OZMyTXpMJ5rqDOqlTq2e19bYwZfZFM7DSNoEMJHgiKzpahPZLSYWyZLFk3PGTj3SI
         OGiNRwekl58vg4oDCZR86qARnYtoZ8zbgX8rx6wjpw5Ea/Ayzmgx7un4aIOzPbL3Px0W
         w3OTn4BXpMPusI6Y4pinVUMhhAghldK7OxnnuSSg6BSVsnfczCv6dC3lvHHAS+lu5kgV
         a7jQ==
X-Gm-Message-State: AOAM532tDgrWv6NGDhqADZEVdJLbIn5au+N/btn2Tgv0L7PY2Ob5k7B0
        9EK5BbwsViBfu7r0Vuwk8df7O0GO3Avjrls=
X-Google-Smtp-Source: ABdhPJwL8gTpbO4sB21qrNwsTxI/qy0bKJJ5PyPHhXLqGc00N+XZNqAutm1T8cig2zQj4ObL1yunmw==
X-Received: by 2002:a17:90b:4b84:: with SMTP id lr4mr6224735pjb.231.1644690217960;
        Sat, 12 Feb 2022 10:23:37 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.57])
        by smtp.gmail.com with ESMTPSA id g12sm14961987pfj.148.2022.02.12.10.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 10:23:37 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
        quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, elder@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 24/25] bus: mhi: ep: Add support for suspending and resuming channels
Date:   Sat, 12 Feb 2022 23:51:16 +0530
Message-Id: <20220212182117.49438-25-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 8654af7caf40..e23d2fd04282 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -242,6 +242,8 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl);
 void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl);
+void mhi_ep_resume_channels(struct mhi_ep_cntrl *mhi_cntrl);
+void mhi_ep_suspend_channels(struct mhi_ep_cntrl *mhi_cntrl);
 
 /* MHI EP memory management functions */
 int mhi_ep_alloc_map(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, size_t size,
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index e4186b012257..315409705b91 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1106,6 +1106,64 @@ void mhi_ep_power_down(struct mhi_ep_cntrl *mhi_cntrl)
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
+		tmp = le32_to_cpu(mhi_cntrl->ch_ctx_cache[i].chcfg);
+		if (FIELD_GET(CHAN_CTX_CHSTATE_MASK, tmp) != MHI_CH_STATE_RUNNING) {
+			mutex_unlock(&mhi_chan->lock);
+			continue;
+		}
+
+		dev_dbg(&mhi_chan->mhi_dev->dev, "Suspending channel\n");
+		/* Set channel state to SUSPENDED */
+		tmp &= ~CHAN_CTX_CHSTATE_MASK;
+		tmp |= FIELD_PREP(CHAN_CTX_CHSTATE_MASK, MHI_CH_STATE_SUSPENDED);
+		mhi_cntrl->ch_ctx_cache[i].chcfg = cpu_to_le32(tmp);
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
+		tmp = le32_to_cpu(mhi_cntrl->ch_ctx_cache[i].chcfg);
+		if (FIELD_GET(CHAN_CTX_CHSTATE_MASK, tmp) != MHI_CH_STATE_SUSPENDED) {
+			mutex_unlock(&mhi_chan->lock);
+			continue;
+		}
+
+		dev_dbg(&mhi_chan->mhi_dev->dev, "Resuming channel\n");
+		/* Set channel state to RUNNING */
+		tmp &= ~CHAN_CTX_CHSTATE_MASK;
+		tmp |= FIELD_PREP(CHAN_CTX_CHSTATE_MASK, MHI_CH_STATE_RUNNING);
+		mhi_cntrl->ch_ctx_cache[i].chcfg = cpu_to_le32(tmp);
+		mutex_unlock(&mhi_chan->lock);
+	}
+}
+
 static void mhi_ep_release_device(struct device *dev)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
diff --git a/drivers/bus/mhi/ep/sm.c b/drivers/bus/mhi/ep/sm.c
index 9a75ecfe1adf..e24ba2d85e13 100644
--- a/drivers/bus/mhi/ep/sm.c
+++ b/drivers/bus/mhi/ep/sm.c
@@ -88,8 +88,11 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl)
 	enum mhi_state old_state;
 	int ret;
 
+	/* If MHI is in M3, resume suspended channels */
 	spin_lock_bh(&mhi_cntrl->state_lock);
 	old_state = mhi_cntrl->mhi_state;
+	if (old_state == MHI_STATE_M3)
+		mhi_ep_resume_channels(mhi_cntrl);
 
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M0);
 	if (ret) {
@@ -135,6 +138,7 @@ int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl)
 	}
 
 	spin_unlock_bh(&mhi_cntrl->state_lock);
+	mhi_ep_suspend_channels(mhi_cntrl);
 
 	/* Signal host that the device moved to M3 */
 	ret = mhi_ep_send_state_change_event(mhi_cntrl, MHI_STATE_M3);
-- 
2.25.1

