Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1104B3739
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Feb 2022 19:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiBLSX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Feb 2022 13:23:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbiBLSX1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Feb 2022 13:23:27 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86145FF07
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Feb 2022 10:23:06 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id x4so7260019plb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Feb 2022 10:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Et3UmaSI3XUp/0zr/hwPTmUKeNrGOKIPlwFzxB6LurA=;
        b=yRV6USNNPuO9dPgcA7Eqbhg70sy1oivDCCGDWfwlqmRvdqMjgxfZEHX1lJ5Y83Ozcs
         nZoZuJEybjxCdeznbPzv4ZKsgYdXo4/5NRJRNVpHvktBPSyuqwXtXAFd2DHUAUBayKnE
         UpMjQD6A/6jX0hVLJm7gsy0CRnTAaiUS09pARMci3wMLrotL5RcMV9WeenWE+cqm6v1k
         NVdxpn5yNwrGHck0l3zTtuBV997zLK/n33YXLlWA8e0JFrbRlktXFly13Wk6YfEQOy3g
         +X0A3WiZ1jaDjPpfkFGQmjw8AhGTSwX2xjwFbQ0w2XNJEPR1krphHO3lFPqrNPBUY858
         YtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Et3UmaSI3XUp/0zr/hwPTmUKeNrGOKIPlwFzxB6LurA=;
        b=u3X2OTmGS/21ubLP5MpJZUBYvagJfL9p56clm12+eo7Bu/3KBkDaDrU8U4UeDHGbZp
         R97oDp/Dm9fFWU42ZPJiIused9DWDK5iY44G2L3e4gdNhBKyTyJOTR1Ql0mt9SyTu70+
         QAS9Z/OkAAy+hS5IdNXZfB3pcy8500e0Q1TN66pKKII4V03blEnQYTnGKvJwc/NeCVD7
         rpq4EeCWPsb9vKeLraD0zARBsAAMGfjXjyjUPUN6KdczZf08coXImccjdjfK0PsG1w5Z
         2XbeFZ89tIEcylYfGQb1qrX8cMKVratDKDsR8Niq3pSt0KSncDst7aOLCrL8Ygnwyyf/
         XLgw==
X-Gm-Message-State: AOAM531gTYe4LhWSdTcfCkFDBvdvFQmqVgJkdRY0+fiyr6Q6Q0Vqf+bN
        Dj8C/2ZGizB74s/x9EUgkeDh
X-Google-Smtp-Source: ABdhPJyQe1bE8FxZ3ysWp54sVedcAx8a2TfWGKEOu2E0KFFqiBOTHdvoq4m43njxHo8YG4UMFJfKVg==
X-Received: by 2002:a17:90a:741:: with SMTP id s1mr6400954pje.161.1644690186313;
        Sat, 12 Feb 2022 10:23:06 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.57])
        by smtp.gmail.com with ESMTPSA id g12sm14961987pfj.148.2022.02.12.10.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 10:23:05 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
        quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, elder@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 17/25] bus: mhi: ep: Add support for powering down the MHI endpoint stack
Date:   Sat, 12 Feb 2022 23:51:09 +0530
Message-Id: <20220212182117.49438-18-manivannan.sadhasivam@linaro.org>
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

Add support for MHI endpoint power_down that includes stopping all
available channels, destroying the channels, resetting the event and
transfer rings and freeing the host cache.

The stack will be powered down whenever the physical bus link goes down.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 81 +++++++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h    |  6 +++
 2 files changed, 87 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 016e819f640a..14cb08de4263 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -21,6 +21,8 @@
 
 static DEFINE_IDA(mhi_ep_cntrl_ida);
 
+static int mhi_ep_destroy_device(struct device *dev, void *data);
+
 static int mhi_ep_send_event(struct mhi_ep_cntrl *mhi_cntrl, u32 ring_idx,
 			     struct mhi_ep_ring_element *el)
 {
@@ -492,6 +494,71 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void mhi_ep_abort_transfer(struct mhi_ep_cntrl *mhi_cntrl)
+{
+	struct mhi_ep_ring *ch_ring, *ev_ring;
+	struct mhi_result result = {};
+	struct mhi_ep_chan *mhi_chan;
+	int i;
+
+	/* Stop all the channels */
+	for (i = 0; i < mhi_cntrl->max_chan; i++) {
+		ch_ring = &mhi_cntrl->mhi_chan[i].ring;
+		if (!ch_ring->started)
+			continue;
+
+		mhi_chan = &mhi_cntrl->mhi_chan[i];
+		mutex_lock(&mhi_chan->lock);
+		/* Send channel disconnect status to client drivers */
+		if (mhi_chan->xfer_cb) {
+			result.transaction_status = -ENOTCONN;
+			result.bytes_xferd = 0;
+			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+		}
+
+		/* Set channel state to DISABLED */
+		mhi_chan->state = MHI_CH_STATE_DISABLED;
+		mutex_unlock(&mhi_chan->lock);
+	}
+
+	flush_workqueue(mhi_cntrl->ring_wq);
+	flush_workqueue(mhi_cntrl->state_wq);
+
+	/* Destroy devices associated with all channels */
+	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_ep_destroy_device);
+
+	/* Stop and reset the transfer rings */
+	for (i = 0; i < mhi_cntrl->max_chan; i++) {
+		ch_ring = &mhi_cntrl->mhi_chan[i].ring;
+		if (!ch_ring->started)
+			continue;
+
+		mhi_chan = &mhi_cntrl->mhi_chan[i];
+		mutex_lock(&mhi_chan->lock);
+		mhi_ep_ring_reset(mhi_cntrl, ch_ring);
+		mutex_unlock(&mhi_chan->lock);
+	}
+
+	/* Stop and reset the event rings */
+	for (i = 0; i < mhi_cntrl->event_rings; i++) {
+		ev_ring = &mhi_cntrl->mhi_event[i].ring;
+		if (!ev_ring->started)
+			continue;
+
+		mutex_lock(&mhi_cntrl->event_lock);
+		mhi_ep_ring_reset(mhi_cntrl, ev_ring);
+		mutex_unlock(&mhi_cntrl->event_lock);
+	}
+
+	/* Stop and reset the command ring */
+	mhi_ep_ring_reset(mhi_cntrl, &mhi_cntrl->mhi_cmd->ring);
+
+	mhi_ep_free_host_cfg(mhi_cntrl);
+	mhi_ep_mmio_mask_interrupts(mhi_cntrl);
+
+	mhi_cntrl->is_enabled = false;
+}
+
 int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -548,6 +615,16 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_ep_power_up);
 
+void mhi_ep_power_down(struct mhi_ep_cntrl *mhi_cntrl)
+{
+	if (mhi_cntrl->is_enabled)
+		mhi_ep_abort_transfer(mhi_cntrl);
+
+	kfree(mhi_cntrl->mhi_event);
+	disable_irq(mhi_cntrl->irq);
+}
+EXPORT_SYMBOL_GPL(mhi_ep_power_down);
+
 static void mhi_ep_release_device(struct device *dev)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
@@ -828,6 +905,10 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 }
 EXPORT_SYMBOL_GPL(mhi_ep_register_controller);
 
+/*
+ * It is expected that the controller drivers will power down the MHI EP stack
+ * using "mhi_ep_power_down()" before calling this function to unregister themselves.
+ */
 void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	struct mhi_ep_device *mhi_dev = mhi_cntrl->mhi_dev;
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 53895f1c68e1..4f86e7986c93 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -260,4 +260,10 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl);
  */
 int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl);
 
+/**
+ * mhi_ep_power_down - Power down the MHI endpoint stack
+ * @mhi_cntrl: MHI controller
+ */
+void mhi_ep_power_down(struct mhi_ep_cntrl *mhi_cntrl);
+
 #endif
-- 
2.25.1

