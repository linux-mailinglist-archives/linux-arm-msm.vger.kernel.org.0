Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF25714EDF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgAaNuz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:50:55 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43853 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729023AbgAaNuz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:50:55 -0500
Received: by mail-pl1-f195.google.com with SMTP id p11so2754578plq.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fJ/1XZmGJp8i4rR9MYbpf4gCQ1U4J+3jumeVsKiXy0o=;
        b=WY+KJ3j+h41YHLpAE+jLVL7ARVvvdJsvLHCRh4zrAfVlPHtncRfvZSnYPDqnGDC9HY
         bAQHxdjlsYDEGiLecuZHPhnFYhVp7oYcFVj2ZDyVtBhh+VNzOPmRxs/C2b6GnTy9XpgX
         fRgP2nIDRmxwkACJV+BMBnZiH+SdDa3UqJk3+Wy5NuU1z5YhGyzdC6hLAs/8mBt510JY
         3auV1UvddPn7/kjGjwoWtdZR8s9LuDSV9GqxHxvvQUGTJjyjJH1eUFKWOnrAya4gU/iX
         bX1z+mR1dLfkquR4l2KAmR5XtSY64A4+33/4mvWsmsEa4vaWNazWZN+BwLK+ZlZ7E7wg
         bNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fJ/1XZmGJp8i4rR9MYbpf4gCQ1U4J+3jumeVsKiXy0o=;
        b=m85tu64CM4cAc5uXiFYHbbQqEZXScVGJJFWuZ6pybIEqnC20NgFVHA9dLw8K8p/9AE
         QxrGIslKadJTR5PXJ0EdOaEJr/pnb81G/4tQkWBCnK5vNVuRYmZ3hlAdzagn0Nt9822R
         OC7gxEaIZKGmMeG292e+CEDXBEieDal7sqnZMpQXv0Lu4387rHS96nUHmkj1VApIKXr+
         Vt9y1lOZ3OSyVITiqqN5MdwEC26f9FD6eq1DjGb8x31jF4f/970WSspBhpU7vaWGMvG6
         YHVPbhbfVvUL7567cNomh0fqp1UdEY4Fb0pUAoyrC3iRCbm3J8dy1SxXtAzFgF8gTW6L
         aZUw==
X-Gm-Message-State: APjAAAU/qroyISPpMToJtEDlmuA0TkEOpryXCwUQFN/Z2XYcsjH+u8Fl
        d7wZ5XlruLpBTeXtcyE1XVbmmLY8kdfN
X-Google-Smtp-Source: APXvYqwlp69jVVbP7htddAQh0MV0FEksvpGAL0sXK1qctqT7YLLNl24fhWaq81WtqlYvcyTG3mMMcw==
X-Received: by 2002:a17:90a:ec02:: with SMTP id l2mr12835338pjy.12.1580478654053;
        Fri, 31 Jan 2020 05:50:54 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id p3sm10625632pfg.184.2020.01.31.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:50:53 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 10/16] bus: mhi: core: Add support for processing events from client device
Date:   Fri, 31 Jan 2020 19:20:03 +0530
Message-Id: <20200131135009.31477-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for processing the MHI data and control
events from the client device. The client device can report various
events such as EE events, state change events by interrupting the
host through IRQ and adding events to the event rings allocated by
the host during initialization.

This is based on the patch submitted by Sujeev Dias:
https://lkml.org/lkml/2018/7/9/988

Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
[mani: splitted the data transfer patch and cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c     |  19 ++
 drivers/bus/mhi/core/internal.h |  10 +
 drivers/bus/mhi/core/main.c     | 468 ++++++++++++++++++++++++++++++++
 include/linux/mhi.h             |  14 +
 4 files changed, 511 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index d0886de1c8bb..1b5169e20e2b 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -544,6 +544,19 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 
 		mhi_event->data_type = event_cfg->data_type;
 
+		switch (mhi_event->data_type) {
+		case MHI_ER_DATA:
+			mhi_event->process_event = mhi_process_data_event_ring;
+			break;
+		case MHI_ER_CTRL:
+			mhi_event->process_event = mhi_process_ctrl_ev_ring;
+			break;
+		default:
+			dev_err(mhi_cntrl->dev,
+				"Event Ring type not supported\n");
+			goto error_ev_cfg;
+		}
+
 		mhi_event->hw_ring = event_cfg->hardware_event;
 		if (mhi_event->hw_ring)
 			mhi_cntrl->hw_ev_rings++;
@@ -781,6 +794,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 		mhi_event->mhi_cntrl = mhi_cntrl;
 		spin_lock_init(&mhi_event->lock);
+		if (mhi_event->data_type == MHI_ER_CTRL)
+			tasklet_init(&mhi_event->task, mhi_ctrl_ev_task,
+				     (ulong)mhi_event);
+		else
+			tasklet_init(&mhi_event->task, mhi_ev_task,
+				     (ulong)mhi_event);
 	}
 
 	mhi_chan = mhi_cntrl->mhi_chan;
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 8ce1f11b8074..aa8a3433afae 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -500,6 +500,8 @@ struct mhi_buf_info {
 	dma_addr_t p_addr;
 	size_t len;
 	enum dma_data_direction dir;
+	bool used; /* Indicates whether the buffer is used or not */
+	bool pre_mapped; /* Already pre-mapped by client */
 };
 
 struct mhi_event {
@@ -648,6 +650,14 @@ static inline void mhi_free_coherent(struct mhi_controller *mhi_cntrl,
 	dma_free_coherent(mhi_cntrl->dev, size, vaddr, dma_handle);
 }
 
+/* Event processing methods */
+void mhi_ctrl_ev_task(unsigned long data);
+void mhi_ev_task(unsigned long data);
+int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
+				struct mhi_event *mhi_event, u32 event_quota);
+int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
+			     struct mhi_event *mhi_event, u32 event_quota);
+
 /* ISR handlers */
 irqreturn_t mhi_irq_handler(int irq_number, void *dev);
 irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev);
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 4d767dd97956..775d4a8fdefd 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -149,6 +149,16 @@ static void *mhi_to_virtual(struct mhi_ring *ring, dma_addr_t addr)
 	return (addr - ring->iommu_base) + ring->base;
 }
 
+static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
+				 struct mhi_ring *ring)
+{
+	ring->rp += ring->el_size;
+	if (ring->rp >= (ring->base + ring->len))
+		ring->rp = ring->base;
+	/* smp update */
+	smp_wmb();
+}
+
 int mhi_destroy_device(struct device *dev, void *data)
 {
 	struct mhi_device *mhi_dev;
@@ -335,3 +345,461 @@ irqreturn_t mhi_intvec_handler(int irq_number, void *dev)
 
 	return IRQ_WAKE_THREAD;
 }
+
+static void mhi_recycle_ev_ring_element(struct mhi_controller *mhi_cntrl,
+					struct mhi_ring *ring)
+{
+	dma_addr_t ctxt_wp;
+
+	/* Update the WP */
+	ring->wp += ring->el_size;
+	ctxt_wp = *ring->ctxt_wp + ring->el_size;
+
+	if (ring->wp >= (ring->base + ring->len)) {
+		ring->wp = ring->base;
+		ctxt_wp = ring->iommu_base;
+	}
+
+	*ring->ctxt_wp = ctxt_wp;
+
+	/* Update the RP */
+	ring->rp += ring->el_size;
+	if (ring->rp >= (ring->base + ring->len))
+		ring->rp = ring->base;
+
+	/* Update to all cores */
+	smp_wmb();
+}
+
+static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
+			    struct mhi_tre *event,
+			    struct mhi_chan *mhi_chan)
+{
+	struct mhi_ring *buf_ring, *tre_ring;
+	u32 ev_code;
+	struct mhi_result result;
+	unsigned long flags = 0;
+
+	ev_code = MHI_TRE_GET_EV_CODE(event);
+	buf_ring = &mhi_chan->buf_ring;
+	tre_ring = &mhi_chan->tre_ring;
+
+	result.transaction_status = (ev_code == MHI_EV_CC_OVERFLOW) ?
+		-EOVERFLOW : 0;
+
+	/*
+	 * If it's a DB Event then we need to grab the lock
+	 * with preemption disabled and as a write because we
+	 * have to update db register and there are chances that
+	 * another thread could be doing the same.
+	 */
+	if (ev_code >= MHI_EV_CC_OOB)
+		write_lock_irqsave(&mhi_chan->lock, flags);
+	else
+		read_lock_bh(&mhi_chan->lock);
+
+	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
+		goto end_process_tx_event;
+
+	switch (ev_code) {
+	case MHI_EV_CC_OVERFLOW:
+	case MHI_EV_CC_EOB:
+	case MHI_EV_CC_EOT:
+	{
+		dma_addr_t ptr = MHI_TRE_GET_EV_PTR(event);
+		struct mhi_tre *local_rp, *ev_tre;
+		void *dev_rp;
+		struct mhi_buf_info *buf_info;
+		u16 xfer_len;
+
+		/* Get the TRB this event points to */
+		ev_tre = mhi_to_virtual(tre_ring, ptr);
+
+		/* device rp after servicing the TREs */
+		dev_rp = ev_tre + 1;
+		if (dev_rp >= (tre_ring->base + tre_ring->len))
+			dev_rp = tre_ring->base;
+
+		result.dir = mhi_chan->dir;
+
+		/* local rp */
+		local_rp = tre_ring->rp;
+		while (local_rp != dev_rp) {
+			buf_info = buf_ring->rp;
+			/* if it's last tre get len from the event */
+			if (local_rp == ev_tre)
+				xfer_len = MHI_TRE_GET_EV_LEN(event);
+			else
+				xfer_len = buf_info->len;
+
+			result.buf_addr = buf_info->cb_buf;
+			result.bytes_xferd = xfer_len;
+			mhi_del_ring_element(mhi_cntrl, buf_ring);
+			mhi_del_ring_element(mhi_cntrl, tre_ring);
+			local_rp = tre_ring->rp;
+
+			/* notify client */
+			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+
+			if (mhi_chan->dir == DMA_TO_DEVICE)
+				atomic_dec(&mhi_cntrl->pending_pkts);
+		}
+		break;
+	} /* CC_EOT */
+	case MHI_EV_CC_OOB:
+	case MHI_EV_CC_DB_MODE:
+	{
+		unsigned long flags;
+
+		mhi_chan->db_cfg.db_mode = 1;
+		read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
+		if (tre_ring->wp != tre_ring->rp &&
+		    MHI_DB_ACCESS_VALID(mhi_cntrl)) {
+			mhi_ring_chan_db(mhi_cntrl, mhi_chan);
+		}
+		read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
+		break;
+	}
+	case MHI_EV_CC_BAD_TRE:
+	default:
+		dev_err(mhi_cntrl->dev, "Unknown event 0x%x\n", ev_code);
+		break;
+	} /* switch(MHI_EV_READ_CODE(EV_TRB_CODE,event)) */
+
+end_process_tx_event:
+	if (ev_code >= MHI_EV_CC_OOB)
+		write_unlock_irqrestore(&mhi_chan->lock, flags);
+	else
+		read_unlock_bh(&mhi_chan->lock);
+
+	return 0;
+}
+
+static int parse_rsc_event(struct mhi_controller *mhi_cntrl,
+			   struct mhi_tre *event,
+			   struct mhi_chan *mhi_chan)
+{
+	struct mhi_ring *buf_ring, *tre_ring;
+	struct mhi_buf_info *buf_info;
+	struct mhi_result result;
+	int ev_code;
+	u32 cookie; /* offset to local descriptor */
+	u16 xfer_len;
+
+	buf_ring = &mhi_chan->buf_ring;
+	tre_ring = &mhi_chan->tre_ring;
+
+	ev_code = MHI_TRE_GET_EV_CODE(event);
+	cookie = MHI_TRE_GET_EV_COOKIE(event);
+	xfer_len = MHI_TRE_GET_EV_LEN(event);
+
+	/* Received out of bound cookie */
+	WARN_ON(cookie >= buf_ring->len);
+
+	buf_info = buf_ring->base + cookie;
+
+	result.transaction_status = (ev_code == MHI_EV_CC_OVERFLOW) ?
+		-EOVERFLOW : 0;
+	result.bytes_xferd = xfer_len;
+	result.buf_addr = buf_info->cb_buf;
+	result.dir = mhi_chan->dir;
+
+	read_lock_bh(&mhi_chan->lock);
+
+	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
+		goto end_process_rsc_event;
+
+	WARN_ON(!buf_info->used);
+
+	/* notify the client */
+	mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+
+	/*
+	 * Note: We're arbitrarily incrementing RP even though, completion
+	 * packet we processed might not be the same one, reason we can do this
+	 * is because device guaranteed to cache descriptors in order it
+	 * receive, so even though completion event is different we can re-use
+	 * all descriptors in between.
+	 * Example:
+	 * Transfer Ring has descriptors: A, B, C, D
+	 * Last descriptor host queue is D (WP) and first descriptor
+	 * host queue is A (RP).
+	 * The completion event we just serviced is descriptor C.
+	 * Then we can safely queue descriptors to replace A, B, and C
+	 * even though host did not receive any completions.
+	 */
+	mhi_del_ring_element(mhi_cntrl, tre_ring);
+	buf_info->used = false;
+
+end_process_rsc_event:
+	read_unlock_bh(&mhi_chan->lock);
+
+	return 0;
+}
+
+static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
+				       struct mhi_tre *tre)
+{
+	dma_addr_t ptr = MHI_TRE_GET_EV_PTR(tre);
+	struct mhi_cmd *cmd_ring = &mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
+	struct mhi_ring *mhi_ring = &cmd_ring->ring;
+	struct mhi_tre *cmd_pkt;
+	struct mhi_chan *mhi_chan;
+	u32 chan;
+
+	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
+
+	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
+	mhi_chan = &mhi_cntrl->mhi_chan[chan];
+	write_lock_bh(&mhi_chan->lock);
+	mhi_chan->ccs = MHI_TRE_GET_EV_CODE(tre);
+	complete(&mhi_chan->completion);
+	write_unlock_bh(&mhi_chan->lock);
+
+	mhi_del_ring_element(mhi_cntrl, mhi_ring);
+}
+
+int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
+			     struct mhi_event *mhi_event,
+			     u32 event_quota)
+{
+	struct mhi_tre *dev_rp, *local_rp;
+	struct mhi_ring *ev_ring = &mhi_event->ring;
+	struct mhi_event_ctxt *er_ctxt =
+		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
+	int count = 0;
+	u32 chan;
+	struct mhi_chan *mhi_chan;
+
+	/*
+	 * This is a quick check to avoid unnecessary event processing
+	 * in case MHI is already in error state, but it's still possible
+	 * to transition to error state while processing events
+	 */
+	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
+		return -EIO;
+
+	dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
+	local_rp = ev_ring->rp;
+
+	while (dev_rp != local_rp) {
+		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
+
+		switch (type) {
+		case MHI_PKT_TYPE_BW_REQ_EVENT:
+		{
+			struct mhi_link_info *link_info;
+
+			link_info = &mhi_cntrl->mhi_link_info;
+			write_lock_irq(&mhi_cntrl->pm_lock);
+			link_info->target_link_speed =
+				MHI_TRE_GET_EV_LINKSPEED(local_rp);
+			link_info->target_link_width =
+				MHI_TRE_GET_EV_LINKWIDTH(local_rp);
+			write_unlock_irq(&mhi_cntrl->pm_lock);
+			dev_dbg(mhi_cntrl->dev, "Received BW_REQ event\n");
+			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_BW_REQ);
+			break;
+		}
+		case MHI_PKT_TYPE_STATE_CHANGE_EVENT:
+		{
+			enum mhi_state new_state;
+
+			new_state = MHI_TRE_GET_EV_STATE(local_rp);
+
+			dev_dbg(mhi_cntrl->dev,
+				 "State change event to state: %s\n",
+				 TO_MHI_STATE_STR(new_state));
+
+			switch (new_state) {
+			case MHI_STATE_M0:
+				mhi_pm_m0_transition(mhi_cntrl);
+				break;
+			case MHI_STATE_M1:
+				mhi_pm_m1_transition(mhi_cntrl);
+				break;
+			case MHI_STATE_M3:
+				mhi_pm_m3_transition(mhi_cntrl);
+				break;
+			case MHI_STATE_SYS_ERR:
+			{
+				enum mhi_pm_state new_state;
+
+				dev_dbg(mhi_cntrl->dev,
+					 "System error detected\n");
+				write_lock_irq(&mhi_cntrl->pm_lock);
+				new_state = mhi_tryset_pm_state(mhi_cntrl,
+							MHI_PM_SYS_ERR_DETECT);
+				write_unlock_irq(&mhi_cntrl->pm_lock);
+				if (new_state == MHI_PM_SYS_ERR_DETECT)
+					schedule_work(&mhi_cntrl->syserr_worker);
+				break;
+			}
+			default:
+				dev_err(mhi_cntrl->dev, "Invalid state: %s\n",
+					TO_MHI_STATE_STR(new_state));
+			}
+
+			break;
+		}
+		case MHI_PKT_TYPE_CMD_COMPLETION_EVENT:
+			mhi_process_cmd_completion(mhi_cntrl, local_rp);
+			break;
+		case MHI_PKT_TYPE_EE_EVENT:
+		{
+			enum dev_st_transition st = DEV_ST_TRANSITION_MAX;
+			enum mhi_ee_type event = MHI_TRE_GET_EV_EXECENV(local_rp);
+
+			dev_dbg(mhi_cntrl->dev, "Received EE event: %s\n",
+				 TO_MHI_EXEC_STR(event));
+			switch (event) {
+			case MHI_EE_SBL:
+				st = DEV_ST_TRANSITION_SBL;
+				break;
+			case MHI_EE_WFW:
+			case MHI_EE_AMSS:
+				st = DEV_ST_TRANSITION_MISSION_MODE;
+				break;
+			case MHI_EE_RDDM:
+				mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
+				write_lock_irq(&mhi_cntrl->pm_lock);
+				mhi_cntrl->ee = event;
+				write_unlock_irq(&mhi_cntrl->pm_lock);
+				wake_up_all(&mhi_cntrl->state_event);
+				break;
+			default:
+				dev_err(mhi_cntrl->dev,
+					"Unhandled EE event: 0x%x\n", type);
+			}
+			if (st != DEV_ST_TRANSITION_MAX)
+				mhi_queue_state_transition(mhi_cntrl, st);
+
+			break;
+		}
+		case MHI_PKT_TYPE_TX_EVENT:
+			chan = MHI_TRE_GET_EV_CHID(local_rp);
+			mhi_chan = &mhi_cntrl->mhi_chan[chan];
+			parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
+			event_quota--;
+			break;
+		default:
+			dev_err(mhi_cntrl->dev, "Unhandled event type: %d\n",
+				type);
+			break;
+		}
+
+		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
+		local_rp = ev_ring->rp;
+		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
+		count++;
+	}
+
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
+		mhi_ring_er_db(mhi_event);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	return count;
+}
+
+int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
+				struct mhi_event *mhi_event,
+				u32 event_quota)
+{
+	struct mhi_tre *dev_rp, *local_rp;
+	struct mhi_ring *ev_ring = &mhi_event->ring;
+	struct mhi_event_ctxt *er_ctxt =
+		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
+	int count = 0;
+	u32 chan;
+	struct mhi_chan *mhi_chan;
+
+	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
+		return -EIO;
+
+	dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
+	local_rp = ev_ring->rp;
+
+	while (dev_rp != local_rp && event_quota > 0) {
+		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
+
+		chan = MHI_TRE_GET_EV_CHID(local_rp);
+		mhi_chan = &mhi_cntrl->mhi_chan[chan];
+
+		if (likely(type == MHI_PKT_TYPE_TX_EVENT)) {
+			parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
+			event_quota--;
+		} else if (type == MHI_PKT_TYPE_RSC_TX_EVENT) {
+			parse_rsc_event(mhi_cntrl, local_rp, mhi_chan);
+			event_quota--;
+		}
+
+		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
+		local_rp = ev_ring->rp;
+		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
+		count++;
+	}
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
+		mhi_ring_er_db(mhi_event);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	return count;
+}
+
+void mhi_ev_task(unsigned long data)
+{
+	struct mhi_event *mhi_event = (struct mhi_event *)data;
+	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
+
+	/* process all pending events */
+	spin_lock_bh(&mhi_event->lock);
+	mhi_event->process_event(mhi_cntrl, mhi_event, U32_MAX);
+	spin_unlock_bh(&mhi_event->lock);
+}
+
+void mhi_ctrl_ev_task(unsigned long data)
+{
+	struct mhi_event *mhi_event = (struct mhi_event *)data;
+	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
+	enum mhi_state state;
+	enum mhi_pm_state pm_state = 0;
+	int ret;
+
+	/*
+	 * We can check PM state w/o a lock here because there is no way
+	 * PM state can change from reg access valid to no access while this
+	 * thread being executed.
+	 */
+	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
+		/*
+		 * We may have a pending event but not allowed to
+		 * process it since we are probably in a suspended state,
+		 * so trigger a resume.
+		 */
+		mhi_cntrl->runtime_get(mhi_cntrl);
+		mhi_cntrl->runtime_put(mhi_cntrl);
+
+		return;
+	}
+
+	/* Process ctrl events events */
+	ret = mhi_event->process_event(mhi_cntrl, mhi_event, U32_MAX);
+
+	/*
+	 * We received an IRQ but no events to process, maybe device went to
+	 * SYS_ERR state? Check the state to confirm.
+	 */
+	if (!ret) {
+		write_lock_irq(&mhi_cntrl->pm_lock);
+		state = mhi_get_mhi_state(mhi_cntrl);
+		if (state == MHI_STATE_SYS_ERR) {
+			dev_dbg(mhi_cntrl->dev, "System error detected\n");
+			pm_state = mhi_tryset_pm_state(mhi_cntrl,
+						       MHI_PM_SYS_ERR_DETECT);
+		}
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		if (pm_state == MHI_PM_SYS_ERR_DETECT)
+			schedule_work(&mhi_cntrl->syserr_worker);
+	}
+}
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 5ce99939a624..2ea2deb922a1 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -31,6 +31,7 @@ struct mhi_buf_info;
  * @MHI_CB_EE_MISSION_MODE: MHI device entered Mission Mode exec env
  * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
  * @MHI_CB_FATAL_ERROR: MHI device entered fatal error state
+ * @MHI_CB_BW_REQ: Received a bandwidth switch request from device
  */
 enum mhi_callback {
 	MHI_CB_IDLE,
@@ -41,6 +42,7 @@ enum mhi_callback {
 	MHI_CB_EE_MISSION_MODE,
 	MHI_CB_SYS_ERROR,
 	MHI_CB_FATAL_ERROR,
+	MHI_CB_BW_REQ,
 };
 
 /**
@@ -94,6 +96,16 @@ struct image_info {
 	u32 entries;
 };
 
+/**
+ * struct mhi_link_info - BW requirement
+ * target_link_speed - Link speed as defined by TLS bits in LinkControl reg
+ * target_link_width - Link width as defined by NLW bits in LinkStatus reg
+ */
+struct mhi_link_info {
+	unsigned int target_link_speed;
+	unsigned int target_link_width;
+};
+
 /**
  * enum mhi_ee_type - Execution environment types
  * @MHI_EE_PBL: Primary Bootloader
@@ -335,6 +347,7 @@ struct mhi_controller_config {
  * @transition_list: List of MHI state transitions
  * @transition_lock: Lock for protecting MHI state transition list
  * @wlock: Lock for protecting device wakeup
+ * @mhi_link_info: Device bandwidth info
  * @st_worker: State transition worker
  * @fw_worker: Firmware download worker
  * @syserr_worker: System error worker
@@ -395,6 +408,7 @@ struct mhi_controller {
 	struct list_head transition_list;
 	spinlock_t transition_lock;
 	spinlock_t wlock;
+	struct mhi_link_info mhi_link_info;
 	struct work_struct st_worker;
 	struct work_struct fw_worker;
 	struct work_struct syserr_worker;
-- 
2.17.1

