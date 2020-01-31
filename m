Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 904B714EDFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728770AbgAaNv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:51:27 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37724 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728853AbgAaNu7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:50:59 -0500
Received: by mail-pf1-f193.google.com with SMTP id p14so3367903pfn.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=01STCQMRb1WIGMUJXO6knc9ATqkPDAAATiUfrsEckvc=;
        b=cFCBU5QlsKNH/y497vTgNrzxoQJJFqVHxCerXvWLzizK7/TPMHpjuRGLp98yGraMoF
         VlfP7B3vf+A+FzPbX4bR+VFyr5jS+ztq+ZBytRYVG1w1JXnkN6BoPC9aGLr5fWQP0OhM
         Ae45uYKqdUaMiBOQkX6Dy1rjdOCTvG5Jl9lD2ji38z7OxPQTbaYY8kUBplgu2w8pe4bw
         GigejhGSfteCvpYgrej/n2Ev0YMgxLuW5fez0g5lh5LEZTJfyjIaBB2YglrZxaRWzwmN
         WQ/f7eTT5iXDoVwuf3xlZQ7YFwOVy77l4Dt8yVSkD8D2yrT3/iCOnA8iqLeM4gnT5uVu
         pK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=01STCQMRb1WIGMUJXO6knc9ATqkPDAAATiUfrsEckvc=;
        b=rl5XSLVICwDqGt2jFuLNyy8rrUvn+K5irq17c6057WIUpwwCdQY/jj2TtHRyOUFyeT
         rMVEbPi84Bs81Jo4TrHSppRcxWOUFlDj99zm4ODrkOUzqujC4yBsIlsYJEEcpe557itQ
         YfEbOGrV7HZawq1a3jFnvWUJnoIK8OUXrSMnkTeAKcU3HogcRCENfiC2KtpBbFFoZuu6
         zB0z8pc0XpCnzEqhno/Yw7mUQm35qgbFwwVLGhD7VN5bA1Jfp8npNrTFWdr3J2HJ6+Cc
         yDUebZby+AUf2CwpIihhhecs5t5oisxYYzH6zK+ho1wJHkB7Xoe+kxy0j5ibnwhTQrfB
         ibVQ==
X-Gm-Message-State: APjAAAVs2gOlJ2VSweyUB00iBEh0r8a3cvE27Ny/SOvfEEclYLUYER6j
        Ma/JyNmvwEWhZLk1D/K+/FqYuObEvaT8
X-Google-Smtp-Source: APXvYqzHf21F9gnhEFDqoxPtZonRjv/iNYOWiInCts9IuJR2JkWWnCmJBR/saSKf20PS8v33VzqbOQ==
X-Received: by 2002:a63:6602:: with SMTP id a2mr9864304pgc.403.1580478657714;
        Fri, 31 Jan 2020 05:50:57 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id p3sm10625632pfg.184.2020.01.31.05.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:50:57 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 11/16] bus: mhi: core: Add support for data transfer
Date:   Fri, 31 Jan 2020 19:20:04 +0530
Message-Id: <20200131135009.31477-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for transferring data between external modem and host
processor using MHI protocol.

This is based on the patch submitted by Sujeev Dias:
https://lkml.org/lkml/2018/7/9/988

Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
[mani: splitted the data transfer patch and cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c     | 162 ++++++-
 drivers/bus/mhi/core/internal.h |  33 ++
 drivers/bus/mhi/core/main.c     | 777 +++++++++++++++++++++++++++++++-
 drivers/bus/mhi/core/pm.c       |  40 ++
 include/linux/mhi.h             |  55 +++
 5 files changed, 1058 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 1b5169e20e2b..4d0e5bbb3389 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -493,6 +493,73 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 	return 0;
 }
 
+void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
+			  struct mhi_chan *mhi_chan)
+{
+	struct mhi_ring *buf_ring;
+	struct mhi_ring *tre_ring;
+	struct mhi_chan_ctxt *chan_ctxt;
+
+	buf_ring = &mhi_chan->buf_ring;
+	tre_ring = &mhi_chan->tre_ring;
+	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
+
+	mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
+			  tre_ring->pre_aligned, tre_ring->dma_handle);
+	vfree(buf_ring->base);
+
+	buf_ring->base = tre_ring->base = NULL;
+	chan_ctxt->rbase = 0;
+}
+
+int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
+		       struct mhi_chan *mhi_chan)
+{
+	struct mhi_ring *buf_ring;
+	struct mhi_ring *tre_ring;
+	struct mhi_chan_ctxt *chan_ctxt;
+	u32 tmp;
+	int ret;
+
+	buf_ring = &mhi_chan->buf_ring;
+	tre_ring = &mhi_chan->tre_ring;
+	tre_ring->el_size = sizeof(struct mhi_tre);
+	tre_ring->len = tre_ring->el_size * tre_ring->elements;
+	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
+	ret = mhi_alloc_aligned_ring(mhi_cntrl, tre_ring, tre_ring->len);
+	if (ret)
+		return -ENOMEM;
+
+	buf_ring->el_size = sizeof(struct mhi_buf_info);
+	buf_ring->len = buf_ring->el_size * buf_ring->elements;
+	buf_ring->base = vzalloc(buf_ring->len);
+
+	if (!buf_ring->base) {
+		mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
+				  tre_ring->pre_aligned, tre_ring->dma_handle);
+		return -ENOMEM;
+	}
+
+	tmp = chan_ctxt->chcfg;
+	tmp &= ~CHAN_CTX_CHSTATE_MASK;
+	tmp |= (MHI_CH_STATE_ENABLED << CHAN_CTX_CHSTATE_SHIFT);
+	chan_ctxt->chcfg = tmp;
+
+	chan_ctxt->rbase = tre_ring->iommu_base;
+	chan_ctxt->rp = chan_ctxt->wp = chan_ctxt->rbase;
+	chan_ctxt->rlen = tre_ring->len;
+	tre_ring->ctxt_wp = &chan_ctxt->wp;
+
+	tre_ring->rp = tre_ring->wp = tre_ring->base;
+	buf_ring->rp = buf_ring->wp = buf_ring->base;
+	mhi_chan->db_cfg.db_mode = 1;
+
+	/* Update to all cores */
+	smp_wmb();
+
+	return 0;
+}
+
 static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 			struct mhi_controller_config *config)
 {
@@ -648,6 +715,31 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_chan->db_cfg.pollcfg = ch_cfg->pollcfg;
 		mhi_chan->xfer_type = ch_cfg->data_type;
 
+		switch (mhi_chan->xfer_type) {
+		case MHI_BUF_RAW:
+			mhi_chan->gen_tre = mhi_gen_tre;
+			mhi_chan->queue_xfer = mhi_queue_buf;
+			break;
+		case MHI_BUF_SKB:
+			mhi_chan->queue_xfer = mhi_queue_skb;
+			break;
+		case MHI_BUF_SCLIST:
+			mhi_chan->gen_tre = mhi_gen_tre;
+			mhi_chan->queue_xfer = mhi_queue_sclist;
+			break;
+		case MHI_BUF_NOP:
+			mhi_chan->queue_xfer = mhi_queue_nop;
+			break;
+		case MHI_BUF_DMA:
+		case MHI_BUF_RSC_DMA:
+			mhi_chan->queue_xfer = mhi_queue_dma;
+			break;
+		default:
+			dev_err(mhi_cntrl->dev,
+				"Channel datatype not supported\n");
+			goto error_chan_cfg;
+		}
+
 		mhi_chan->lpm_notify = ch_cfg->lpm_notify;
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
@@ -677,6 +769,13 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 			goto error_chan_cfg;
 		}
 
+		/*
+		 * If MHI host pre-allocates buffers then client drivers
+		 * cannot queue
+		 */
+		if (mhi_chan->pre_alloc)
+			mhi_chan->queue_xfer = mhi_queue_nop;
+
 		if (!mhi_chan->offload_ch) {
 			mhi_chan->db_cfg.brstmode = ch_cfg->doorbell;
 			if (MHI_INVALID_BRSTMODE(mhi_chan->db_cfg.brstmode)) {
@@ -809,6 +908,14 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 		rwlock_init(&mhi_chan->lock);
 	}
 
+	if (mhi_cntrl->bounce_buf) {
+		mhi_cntrl->map_single = mhi_map_single_use_bb;
+		mhi_cntrl->unmap_single = mhi_unmap_single_use_bb;
+	} else {
+		mhi_cntrl->map_single = mhi_map_single_no_bb;
+		mhi_cntrl->unmap_single = mhi_unmap_single_no_bb;
+	}
+
 	/* Register controller with MHI bus */
 	mhi_dev = mhi_alloc_device(mhi_cntrl);
 	if (IS_ERR(mhi_dev)) {
@@ -974,6 +1081,14 @@ static int mhi_driver_probe(struct device *dev)
 	struct mhi_event *mhi_event;
 	struct mhi_chan *ul_chan = mhi_dev->ul_chan;
 	struct mhi_chan *dl_chan = mhi_dev->dl_chan;
+	int ret;
+
+	/* Bring device out of LPM */
+	ret = mhi_device_get_sync(mhi_dev);
+	if (ret)
+		return ret;
+
+	ret = -EINVAL;
 
 	if (ul_chan) {
 		/*
@@ -981,13 +1096,18 @@ static int mhi_driver_probe(struct device *dev)
 		 * be provided
 		 */
 		if (ul_chan->lpm_notify && !mhi_drv->status_cb)
-			return -EINVAL;
+			goto exit_probe;
 
 		/* For non-offload channels then xfer_cb should be provided */
 		if (!ul_chan->offload_ch && !mhi_drv->ul_xfer_cb)
-			return -EINVAL;
+			goto exit_probe;
 
 		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
+		if (ul_chan->auto_start) {
+			ret = mhi_prepare_channel(mhi_cntrl, ul_chan);
+			if (ret)
+				goto exit_probe;
+		}
 	}
 
 	if (dl_chan) {
@@ -996,11 +1116,11 @@ static int mhi_driver_probe(struct device *dev)
 		 * be provided
 		 */
 		if (dl_chan->lpm_notify && !mhi_drv->status_cb)
-			return -EINVAL;
+			goto exit_probe;
 
 		/* For non-offload channels then xfer_cb should be provided */
 		if (!dl_chan->offload_ch && !mhi_drv->dl_xfer_cb)
-			return -EINVAL;
+			goto exit_probe;
 
 		mhi_event = &mhi_cntrl->mhi_event[dl_chan->er_index];
 
@@ -1010,19 +1130,36 @@ static int mhi_driver_probe(struct device *dev)
 		 * notify pending data
 		 */
 		if (mhi_event->cl_manage && !mhi_drv->status_cb)
-			return -EINVAL;
+			goto exit_probe;
 
 		dl_chan->xfer_cb = mhi_drv->dl_xfer_cb;
 	}
 
 	/* Call the user provided probe function */
-	return mhi_drv->probe(mhi_dev, mhi_dev->id);
+	ret = mhi_drv->probe(mhi_dev, mhi_dev->id);
+	if (ret)
+		goto exit_probe;
+
+	if (dl_chan && dl_chan->auto_start)
+		mhi_prepare_channel(mhi_cntrl, dl_chan);
+
+	mhi_device_put(mhi_dev);
+
+	return ret;
+
+exit_probe:
+	mhi_unprepare_from_transfer(mhi_dev);
+
+	mhi_device_put(mhi_dev);
+
+	return ret;
 }
 
 static int mhi_driver_remove(struct device *dev)
 {
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 	struct mhi_driver *mhi_drv = to_mhi_driver(dev->driver);
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_chan *mhi_chan;
 	enum mhi_ch_state ch_state[] = {
 		MHI_CH_STATE_DISABLED,
@@ -1054,6 +1191,10 @@ static int mhi_driver_remove(struct device *dev)
 		mhi_chan->ch_state = MHI_CH_STATE_SUSPENDED;
 		write_unlock_irq(&mhi_chan->lock);
 
+		/* Reset the non-offload channel */
+		if (!mhi_chan->offload_ch)
+			mhi_reset_chan(mhi_cntrl, mhi_chan);
+
 		mutex_unlock(&mhi_chan->mutex);
 	}
 
@@ -1068,11 +1209,20 @@ static int mhi_driver_remove(struct device *dev)
 
 		mutex_lock(&mhi_chan->mutex);
 
+		if (ch_state[dir] == MHI_CH_STATE_ENABLED &&
+		    !mhi_chan->offload_ch)
+			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
+
 		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
 
 		mutex_unlock(&mhi_chan->mutex);
 	}
 
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	while (mhi_dev->dev_wake)
+		mhi_device_put(mhi_dev);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
 	return 0;
 }
 
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index aa8a3433afae..0b95a1ab6dfd 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -599,6 +599,8 @@ int mhi_pm_m0_transition(struct mhi_controller *mhi_cntrl);
 void mhi_pm_m1_transition(struct mhi_controller *mhi_cntrl);
 int mhi_pm_m3_transition(struct mhi_controller *mhi_cntrl);
 int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl);
+int mhi_send_cmd(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
+		 enum mhi_cmd_type cmd);
 
 /* Register access methods */
 void mhi_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db_cfg,
@@ -630,6 +632,14 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl);
 void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl);
 void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info);
+int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
+			struct mhi_chan *mhi_chan);
+int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
+		       struct mhi_chan *mhi_chan);
+void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
+			  struct mhi_chan *mhi_chan);
+void mhi_reset_chan(struct mhi_controller *mhi_cntrl,
+		    struct mhi_chan *mhi_chan);
 
 /* Memory allocation methods */
 static inline void *mhi_alloc_coherent(struct mhi_controller *mhi_cntrl,
@@ -663,4 +673,27 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev);
 irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev);
 irqreturn_t mhi_intvec_handler(int irq_number, void *dev);
 
+/* Queue transfer methods */
+int mhi_queue_dma(struct mhi_device *mhi_dev, struct mhi_chan *mhi_chan,
+		  void *buf, size_t len, enum mhi_flags mflags);
+int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
+		void *buf, void *cb, size_t buf_len, enum mhi_flags flags);
+int mhi_queue_buf(struct mhi_device *mhi_dev, struct mhi_chan *mhi_chan,
+		  void *buf, size_t len, enum mhi_flags mflags);
+int mhi_queue_skb(struct mhi_device *mhi_dev, struct mhi_chan *mhi_chan,
+		  void *buf, size_t len, enum mhi_flags mflags);
+int mhi_queue_sclist(struct mhi_device *mhi_dev, struct mhi_chan *mhi_chan,
+		  void *buf, size_t len, enum mhi_flags mflags);
+int mhi_queue_nop(struct mhi_device *mhi_dev, struct mhi_chan *mhi_chan,
+		  void *buf, size_t len, enum mhi_flags mflags);
+
+int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
+			 struct mhi_buf_info *buf_info);
+int mhi_map_single_use_bb(struct mhi_controller *mhi_cntrl,
+			  struct mhi_buf_info *buf_info);
+void mhi_unmap_single_no_bb(struct mhi_controller *mhi_cntrl,
+			    struct mhi_buf_info *buf_info);
+void mhi_unmap_single_use_bb(struct mhi_controller *mhi_cntrl,
+			     struct mhi_buf_info *buf_info);
+
 #endif /* _MHI_INT_H */
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 775d4a8fdefd..9891a5c0ce2c 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -144,11 +144,82 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
 	return ret ? MHI_STATE_MAX : state;
 }
 
+int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
+			 struct mhi_buf_info *buf_info)
+{
+	buf_info->p_addr = dma_map_single(mhi_cntrl->dev, buf_info->v_addr,
+					  buf_info->len, buf_info->dir);
+	if (dma_mapping_error(mhi_cntrl->dev, buf_info->p_addr))
+		return -ENOMEM;
+
+	return 0;
+}
+
+int mhi_map_single_use_bb(struct mhi_controller *mhi_cntrl,
+			  struct mhi_buf_info *buf_info)
+{
+	void *buf = mhi_alloc_coherent(mhi_cntrl, buf_info->len,
+				       &buf_info->p_addr, GFP_ATOMIC);
+
+	if (!buf)
+		return -ENOMEM;
+
+	if (buf_info->dir == DMA_TO_DEVICE)
+		memcpy(buf, buf_info->v_addr, buf_info->len);
+
+	buf_info->bb_addr = buf;
+
+	return 0;
+}
+
+void mhi_unmap_single_no_bb(struct mhi_controller *mhi_cntrl,
+			    struct mhi_buf_info *buf_info)
+{
+	dma_unmap_single(mhi_cntrl->dev, buf_info->p_addr, buf_info->len,
+			 buf_info->dir);
+}
+
+void mhi_unmap_single_use_bb(struct mhi_controller *mhi_cntrl,
+			     struct mhi_buf_info *buf_info)
+{
+	if (buf_info->dir == DMA_FROM_DEVICE)
+		memcpy(buf_info->v_addr, buf_info->bb_addr, buf_info->len);
+
+	mhi_free_coherent(mhi_cntrl, buf_info->len, buf_info->bb_addr,
+			  buf_info->p_addr);
+}
+
+static int get_nr_avail_ring_elements(struct mhi_controller *mhi_cntrl,
+				      struct mhi_ring *ring)
+{
+	int nr_el;
+
+	if (ring->wp < ring->rp) {
+		nr_el = ((ring->rp - ring->wp) / ring->el_size) - 1;
+	} else {
+		nr_el = (ring->rp - ring->base) / ring->el_size;
+		nr_el += ((ring->base + ring->len - ring->wp) /
+			  ring->el_size) - 1;
+	}
+
+	return nr_el;
+}
+
 static void *mhi_to_virtual(struct mhi_ring *ring, dma_addr_t addr)
 {
 	return (addr - ring->iommu_base) + ring->base;
 }
 
+static void mhi_add_ring_element(struct mhi_controller *mhi_cntrl,
+				 struct mhi_ring *ring)
+{
+	ring->wp += ring->el_size;
+	if (ring->wp >= (ring->base + ring->len))
+		ring->wp = ring->base;
+	/* smp update */
+	smp_wmb();
+}
+
 static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
 				 struct mhi_ring *ring)
 {
@@ -415,23 +486,25 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 		/* Get the TRB this event points to */
 		ev_tre = mhi_to_virtual(tre_ring, ptr);
 
-		/* device rp after servicing the TREs */
 		dev_rp = ev_tre + 1;
 		if (dev_rp >= (tre_ring->base + tre_ring->len))
 			dev_rp = tre_ring->base;
 
 		result.dir = mhi_chan->dir;
 
-		/* local rp */
 		local_rp = tre_ring->rp;
 		while (local_rp != dev_rp) {
 			buf_info = buf_ring->rp;
-			/* if it's last tre get len from the event */
+			/* If it's the last TRE, get length from the event */
 			if (local_rp == ev_tre)
 				xfer_len = MHI_TRE_GET_EV_LEN(event);
 			else
 				xfer_len = buf_info->len;
 
+			/* Unmap if it's not pre-mapped by client */
+			if (likely(!buf_info->pre_mapped))
+				mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
+
 			result.buf_addr = buf_info->cb_buf;
 			result.bytes_xferd = xfer_len;
 			mhi_del_ring_element(mhi_cntrl, buf_ring);
@@ -443,6 +516,22 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 
 			if (mhi_chan->dir == DMA_TO_DEVICE)
 				atomic_dec(&mhi_cntrl->pending_pkts);
+
+			/*
+			 * Recycle the buffer if buffer is pre-allocated,
+			 * if there is an error, not much we can do apart
+			 * from dropping the packet
+			 */
+			if (mhi_chan->pre_alloc) {
+				if (mhi_queue_buf(mhi_chan->mhi_dev, mhi_chan,
+						  buf_info->cb_buf,
+						  buf_info->len, MHI_EOT)) {
+					dev_err(mhi_cntrl->dev,
+						"Error recycling buffer for chan:%d\n",
+						mhi_chan->chan);
+					kfree(buf_info->cb_buf);
+				}
+			}
 		}
 		break;
 	} /* CC_EOT */
@@ -803,3 +892,685 @@ void mhi_ctrl_ev_task(unsigned long data)
 			schedule_work(&mhi_cntrl->syserr_worker);
 	}
 }
+
+static bool mhi_is_ring_full(struct mhi_controller *mhi_cntrl,
+			     struct mhi_ring *ring)
+{
+	void *tmp = ring->wp + ring->el_size;
+
+	if (tmp >= (ring->base + ring->len))
+		tmp = ring->base;
+
+	return (tmp == ring->rp);
+}
+
+/* TODO: Scatter-Gather transfer not implemented */
+int mhi_queue_sclist(struct mhi_device *mhi_dev, struct mhi_chan *mhi_chan,
+		     void *buf, size_t len, enum mhi_flags mflags)
+{
+	return -EINVAL;
+}
+
+/*
+ * MHI client drivers are not allowed to queue buffer for pre allocated
+ * channels. Hence, this function just returns -EINVAL.
+ */
+int mhi_queue_nop(struct mhi_device *mhi_dev, struct mhi_chan *mhi_chan,
+		  void *buf, size_t len, enum mhi_flags mflags)
+{
+	return -EINVAL;
+}
+
+int mhi_queue_skb(struct mhi_device *mhi_dev, struct mhi_chan *mhi_chan,
+		  void *buf, size_t len, enum mhi_flags mflags)
+{
+	struct sk_buff *skb = buf;
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
+	struct mhi_ring *buf_ring = &mhi_chan->buf_ring;
+	struct mhi_buf_info *buf_info;
+	struct mhi_tre *mhi_tre;
+	int ret;
+
+	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
+		return -ENOMEM;
+
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
+		read_unlock_bh(&mhi_cntrl->pm_lock);
+		return -EIO;
+	}
+
+	/* we're in M3 or transitioning to M3 */
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
+		mhi_cntrl->runtime_get(mhi_cntrl);
+		mhi_cntrl->runtime_put(mhi_cntrl);
+	}
+
+	/* Toggle wake to exit out of M2 */
+	mhi_cntrl->wake_toggle(mhi_cntrl);
+
+	/* Generate the TRE */
+	buf_info = buf_ring->wp;
+
+	buf_info->v_addr = skb->data;
+	buf_info->cb_buf = skb;
+	buf_info->wp = tre_ring->wp;
+	buf_info->dir = mhi_chan->dir;
+	buf_info->len = len;
+	ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
+	if (ret)
+		goto map_error;
+
+	mhi_tre = tre_ring->wp;
+
+	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
+	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(buf_info->len);
+	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(1, 1, 0, 0);
+
+	/* increment WP */
+	mhi_add_ring_element(mhi_cntrl, tre_ring);
+	mhi_add_ring_element(mhi_cntrl, buf_ring);
+
+	if (mhi_chan->dir == DMA_TO_DEVICE)
+		atomic_inc(&mhi_cntrl->pending_pkts);
+
+	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
+		read_lock_bh(&mhi_chan->lock);
+		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
+		read_unlock_bh(&mhi_chan->lock);
+	}
+
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	return 0;
+
+map_error:
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	return ret;
+}
+
+int mhi_queue_dma(struct mhi_device *mhi_dev,
+		  struct mhi_chan *mhi_chan,
+		  void *buf,
+		  size_t len,
+		  enum mhi_flags mflags)
+{
+	struct mhi_buf *mhi_buf = buf;
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
+	struct mhi_ring *buf_ring = &mhi_chan->buf_ring;
+	struct mhi_buf_info *buf_info;
+	struct mhi_tre *mhi_tre;
+
+	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
+		return -ENOMEM;
+
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
+		dev_err(mhi_cntrl->dev,
+			"MHI is not in activate state, PM state: %s\n",
+			to_mhi_pm_state_str(mhi_cntrl->pm_state));
+		read_unlock_bh(&mhi_cntrl->pm_lock);
+
+		return -EIO;
+	}
+
+	/* we're in M3 or transitioning to M3 */
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
+		mhi_cntrl->runtime_get(mhi_cntrl);
+		mhi_cntrl->runtime_put(mhi_cntrl);
+	}
+
+	/* Toggle wake to exit out of M2 */
+	mhi_cntrl->wake_toggle(mhi_cntrl);
+
+	/* Generate the TRE */
+	buf_info = buf_ring->wp;
+	WARN_ON(buf_info->used);
+	buf_info->p_addr = mhi_buf->dma_addr;
+	buf_info->pre_mapped = true;
+	buf_info->cb_buf = mhi_buf;
+	buf_info->wp = tre_ring->wp;
+	buf_info->dir = mhi_chan->dir;
+	buf_info->len = len;
+
+	mhi_tre = tre_ring->wp;
+
+	if (mhi_chan->xfer_type == MHI_BUF_RSC_DMA) {
+		buf_info->used = true;
+		mhi_tre->ptr =
+			MHI_RSCTRE_DATA_PTR(buf_info->p_addr, buf_info->len);
+		mhi_tre->dword[0] =
+			MHI_RSCTRE_DATA_DWORD0(buf_ring->wp - buf_ring->base);
+		mhi_tre->dword[1] = MHI_RSCTRE_DATA_DWORD1;
+	} else {
+		mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
+		mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(buf_info->len);
+		mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(1, 1, 0, 0);
+	}
+
+	/* increment WP */
+	mhi_add_ring_element(mhi_cntrl, tre_ring);
+	mhi_add_ring_element(mhi_cntrl, buf_ring);
+
+	if (mhi_chan->dir == DMA_TO_DEVICE)
+		atomic_inc(&mhi_cntrl->pending_pkts);
+
+	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
+		read_lock_bh(&mhi_chan->lock);
+		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
+		read_unlock_bh(&mhi_chan->lock);
+	}
+
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	return 0;
+}
+
+int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
+		void *buf, void *cb, size_t buf_len, enum mhi_flags flags)
+{
+	struct mhi_ring *buf_ring, *tre_ring;
+	struct mhi_tre *mhi_tre;
+	struct mhi_buf_info *buf_info;
+	int eot, eob, chain, bei;
+	int ret;
+
+	buf_ring = &mhi_chan->buf_ring;
+	tre_ring = &mhi_chan->tre_ring;
+
+	buf_info = buf_ring->wp;
+	buf_info->v_addr = buf;
+	buf_info->cb_buf = cb;
+	buf_info->wp = tre_ring->wp;
+	buf_info->dir = mhi_chan->dir;
+	buf_info->len = buf_len;
+
+	ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
+	if (ret)
+		return ret;
+
+	eob = !!(flags & MHI_EOB);
+	eot = !!(flags & MHI_EOT);
+	chain = !!(flags & MHI_CHAIN);
+	bei = !!(mhi_chan->intmod);
+
+	mhi_tre = tre_ring->wp;
+	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
+	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(buf_len);
+	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
+
+	/* increment WP */
+	mhi_add_ring_element(mhi_cntrl, tre_ring);
+	mhi_add_ring_element(mhi_cntrl, buf_ring);
+
+	return 0;
+}
+
+int mhi_queue_transfer(struct mhi_device *mhi_dev,
+		       enum dma_data_direction dir, void *buf, size_t len,
+		       enum mhi_flags mflags)
+{
+	if (dir == DMA_TO_DEVICE)
+		return mhi_dev->ul_chan->queue_xfer(mhi_dev, mhi_dev->ul_chan,
+						    buf, len, mflags);
+	else
+		return mhi_dev->dl_chan->queue_xfer(mhi_dev, mhi_dev->dl_chan,
+						    buf, len, mflags);
+}
+EXPORT_SYMBOL_GPL(mhi_queue_transfer);
+
+int mhi_queue_buf(struct mhi_device *mhi_dev, struct mhi_chan *mhi_chan,
+		  void *buf, size_t len, enum mhi_flags mflags)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_ring *tre_ring;
+	unsigned long flags;
+	int ret;
+
+	/*
+	 * this check here only as a guard, it's always
+	 * possible mhi can enter error while executing rest of function,
+	 * which is not fatal so we do not need to hold pm_lock
+	 */
+	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
+		return -EIO;
+
+	tre_ring = &mhi_chan->tre_ring;
+	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
+		return -ENOMEM;
+
+	ret = mhi_chan->gen_tre(mhi_cntrl, mhi_chan, buf, buf, len, mflags);
+	if (unlikely(ret))
+		return ret;
+
+	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
+
+	/* we're in M3 or transitioning to M3 */
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
+		mhi_cntrl->runtime_get(mhi_cntrl);
+		mhi_cntrl->runtime_put(mhi_cntrl);
+	}
+
+	/* Toggle wake to exit out of M2 */
+	mhi_cntrl->wake_toggle(mhi_cntrl);
+
+	if (mhi_chan->dir == DMA_TO_DEVICE)
+		atomic_inc(&mhi_cntrl->pending_pkts);
+
+	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
+		unsigned long flags;
+
+		read_lock_irqsave(&mhi_chan->lock, flags);
+		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
+		read_unlock_irqrestore(&mhi_chan->lock, flags);
+	}
+
+	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
+
+	return 0;
+}
+
+int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
+		 struct mhi_chan *mhi_chan,
+		 enum mhi_cmd_type cmd)
+{
+	struct mhi_tre *cmd_tre = NULL;
+	struct mhi_cmd *mhi_cmd = &mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
+	struct mhi_ring *ring = &mhi_cmd->ring;
+	int chan = 0;
+
+	if (mhi_chan)
+		chan = mhi_chan->chan;
+
+	spin_lock_bh(&mhi_cmd->lock);
+	if (!get_nr_avail_ring_elements(mhi_cntrl, ring)) {
+		spin_unlock_bh(&mhi_cmd->lock);
+		return -ENOMEM;
+	}
+
+	/* prepare the cmd tre */
+	cmd_tre = ring->wp;
+	switch (cmd) {
+	case MHI_CMD_RESET_CHAN:
+		cmd_tre->ptr = MHI_TRE_CMD_RESET_PTR;
+		cmd_tre->dword[0] = MHI_TRE_CMD_RESET_DWORD0;
+		cmd_tre->dword[1] = MHI_TRE_CMD_RESET_DWORD1(chan);
+		break;
+	case MHI_CMD_START_CHAN:
+		cmd_tre->ptr = MHI_TRE_CMD_START_PTR;
+		cmd_tre->dword[0] = MHI_TRE_CMD_START_DWORD0;
+		cmd_tre->dword[1] = MHI_TRE_CMD_START_DWORD1(chan);
+		break;
+	default:
+		dev_err(mhi_cntrl->dev, "Command not supported\n");
+		break;
+	}
+
+	/* queue to hardware */
+	mhi_add_ring_element(mhi_cntrl, ring);
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
+		mhi_ring_cmd_db(mhi_cntrl, mhi_cmd);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+	spin_unlock_bh(&mhi_cmd->lock);
+
+	return 0;
+}
+
+static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
+				    struct mhi_chan *mhi_chan)
+{
+	int ret;
+
+	dev_dbg(mhi_cntrl->dev, "Entered: unprepare channel:%d\n",
+		 mhi_chan->chan);
+
+	/* no more processing events for this channel */
+	mutex_lock(&mhi_chan->mutex);
+	write_lock_irq(&mhi_chan->lock);
+	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
+		write_unlock_irq(&mhi_chan->lock);
+		mutex_unlock(&mhi_chan->mutex);
+		return;
+	}
+
+	mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
+	write_unlock_irq(&mhi_chan->lock);
+
+	reinit_completion(&mhi_chan->completion);
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
+		read_unlock_bh(&mhi_cntrl->pm_lock);
+		goto error_invalid_state;
+	}
+
+	mhi_cntrl->wake_toggle(mhi_cntrl);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	mhi_cntrl->runtime_get(mhi_cntrl);
+	mhi_cntrl->runtime_put(mhi_cntrl);
+	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, MHI_CMD_RESET_CHAN);
+	if (ret)
+		goto error_invalid_state;
+
+	/* even if it fails we will still reset */
+	ret = wait_for_completion_timeout(&mhi_chan->completion,
+				msecs_to_jiffies(mhi_cntrl->timeout_ms));
+	if (!ret || mhi_chan->ccs != MHI_EV_CC_SUCCESS)
+		dev_err(mhi_cntrl->dev,
+			"Failed to receive cmd completion, still resetting\n");
+
+error_invalid_state:
+	if (!mhi_chan->offload_ch) {
+		mhi_reset_chan(mhi_cntrl, mhi_chan);
+		mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
+	}
+	dev_dbg(mhi_cntrl->dev, "chan:%d successfully resetted\n",
+		 mhi_chan->chan);
+	mutex_unlock(&mhi_chan->mutex);
+}
+
+int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
+			struct mhi_chan *mhi_chan)
+{
+	int ret = 0;
+
+	dev_dbg(mhi_cntrl->dev, "Preparing channel: %d\n",
+		 mhi_chan->chan);
+
+	if (!(BIT(mhi_cntrl->ee) & mhi_chan->ee_mask)) {
+		dev_err(mhi_cntrl->dev,
+			"Current EE: %s Required EE Mask: 0x%x for chan: %s\n",
+			TO_MHI_EXEC_STR(mhi_cntrl->ee), mhi_chan->ee_mask,
+			mhi_chan->name);
+		return -ENOTCONN;
+	}
+
+	mutex_lock(&mhi_chan->mutex);
+
+	/* If channel is not in disable state, do not allow it to start */
+	if (mhi_chan->ch_state != MHI_CH_STATE_DISABLED) {
+		ret = -EIO;
+		dev_dbg(mhi_cntrl->dev,
+			 "channel: %d is not in disabled state\n",
+			 mhi_chan->chan);
+		goto error_init_chan;
+	}
+
+	/* Check of client manages channel context for offload channels */
+	if (!mhi_chan->offload_ch) {
+		ret = mhi_init_chan_ctxt(mhi_cntrl, mhi_chan);
+		if (ret)
+			goto error_init_chan;
+	}
+
+	reinit_completion(&mhi_chan->completion);
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
+		read_unlock_bh(&mhi_cntrl->pm_lock);
+		ret = -EIO;
+		goto error_pm_state;
+	}
+
+	mhi_cntrl->wake_toggle(mhi_cntrl);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+	mhi_cntrl->runtime_get(mhi_cntrl);
+	mhi_cntrl->runtime_put(mhi_cntrl);
+
+	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, MHI_CMD_START_CHAN);
+	if (ret)
+		goto error_pm_state;
+
+	ret = wait_for_completion_timeout(&mhi_chan->completion,
+				msecs_to_jiffies(mhi_cntrl->timeout_ms));
+	if (!ret || mhi_chan->ccs != MHI_EV_CC_SUCCESS) {
+		ret = -EIO;
+		goto error_pm_state;
+	}
+
+	write_lock_irq(&mhi_chan->lock);
+	mhi_chan->ch_state = MHI_CH_STATE_ENABLED;
+	write_unlock_irq(&mhi_chan->lock);
+
+	/* Pre-allocate buffer for xfer ring */
+	if (mhi_chan->pre_alloc) {
+		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
+						       &mhi_chan->tre_ring);
+		size_t len = mhi_cntrl->buffer_len;
+
+		while (nr_el--) {
+			void *buf;
+
+			buf = kmalloc(len, GFP_KERNEL);
+			if (!buf) {
+				ret = -ENOMEM;
+				goto error_pre_alloc;
+			}
+
+			/* Prepare transfer descriptors */
+			ret = mhi_chan->gen_tre(mhi_cntrl, mhi_chan, buf, buf,
+						len, MHI_EOT);
+			if (ret) {
+				kfree(buf);
+				goto error_pre_alloc;
+			}
+		}
+
+		read_lock_bh(&mhi_cntrl->pm_lock);
+		if (MHI_DB_ACCESS_VALID(mhi_cntrl)) {
+			read_lock_irq(&mhi_chan->lock);
+			mhi_ring_chan_db(mhi_cntrl, mhi_chan);
+			read_unlock_irq(&mhi_chan->lock);
+		}
+		read_unlock_bh(&mhi_cntrl->pm_lock);
+	}
+
+	mutex_unlock(&mhi_chan->mutex);
+
+	dev_dbg(mhi_cntrl->dev, "Chan: %d successfully moved to start state\n",
+		 mhi_chan->chan);
+
+	return 0;
+
+error_pm_state:
+	if (!mhi_chan->offload_ch)
+		mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
+
+error_init_chan:
+	mutex_unlock(&mhi_chan->mutex);
+
+	return ret;
+
+error_pre_alloc:
+	mutex_unlock(&mhi_chan->mutex);
+	__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
+
+	return ret;
+}
+
+static void mhi_mark_stale_events(struct mhi_controller *mhi_cntrl,
+				  struct mhi_event *mhi_event,
+				  struct mhi_event_ctxt *er_ctxt,
+				  int chan)
+
+{
+	struct mhi_tre *dev_rp, *local_rp;
+	struct mhi_ring *ev_ring;
+	unsigned long flags;
+
+	dev_dbg(mhi_cntrl->dev,
+		 "Marking all events for chan: %d as stale\n", chan);
+
+	ev_ring = &mhi_event->ring;
+
+	/* mark all stale events related to channel as STALE event */
+	spin_lock_irqsave(&mhi_event->lock, flags);
+	dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
+
+	local_rp = ev_ring->rp;
+	while (dev_rp != local_rp) {
+		if (MHI_TRE_GET_EV_TYPE(local_rp) ==
+		    MHI_PKT_TYPE_TX_EVENT &&
+		    chan == MHI_TRE_GET_EV_CHID(local_rp))
+			local_rp->dword[1] = MHI_TRE_EV_DWORD1(chan,
+					MHI_PKT_TYPE_STALE_EVENT);
+		local_rp++;
+		if (local_rp == (ev_ring->base + ev_ring->len))
+			local_rp = ev_ring->base;
+	}
+
+
+	dev_dbg(mhi_cntrl->dev,
+		 "Finished marking events as stale events\n");
+	spin_unlock_irqrestore(&mhi_event->lock, flags);
+}
+
+static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
+				struct mhi_chan *mhi_chan)
+{
+	struct mhi_ring *buf_ring, *tre_ring;
+	struct mhi_result result;
+
+	/* Reset any pending buffers */
+	buf_ring = &mhi_chan->buf_ring;
+	tre_ring = &mhi_chan->tre_ring;
+	result.transaction_status = -ENOTCONN;
+	result.bytes_xferd = 0;
+	while (tre_ring->rp != tre_ring->wp) {
+		struct mhi_buf_info *buf_info = buf_ring->rp;
+
+		if (mhi_chan->dir == DMA_TO_DEVICE)
+			atomic_dec(&mhi_cntrl->pending_pkts);
+
+		if (!buf_info->pre_mapped)
+			mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
+
+		mhi_del_ring_element(mhi_cntrl, buf_ring);
+		mhi_del_ring_element(mhi_cntrl, tre_ring);
+
+		if (mhi_chan->pre_alloc) {
+			kfree(buf_info->cb_buf);
+		} else {
+			result.buf_addr = buf_info->cb_buf;
+			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+		}
+	}
+}
+
+static void mhi_reset_rsc_chan(struct mhi_controller *mhi_cntrl,
+			       struct mhi_chan *mhi_chan)
+{
+	struct mhi_ring *buf_ring, *tre_ring;
+	struct mhi_result result;
+	struct mhi_buf_info *buf_info;
+
+	/* Reset any pending buffers */
+	buf_ring = &mhi_chan->buf_ring;
+	tre_ring = &mhi_chan->tre_ring;
+	result.transaction_status = -ENOTCONN;
+	result.bytes_xferd = 0;
+
+	buf_info = buf_ring->base;
+	for (; (void *)buf_info < buf_ring->base + buf_ring->len; buf_info++) {
+		if (!buf_info->used)
+			continue;
+
+		result.buf_addr = buf_info->cb_buf;
+		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+		buf_info->used = false;
+	}
+}
+
+void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
+{
+
+	struct mhi_event *mhi_event;
+	struct mhi_event_ctxt *er_ctxt;
+	int chan = mhi_chan->chan;
+
+	/* Nothing to reset, client doesn't queue buffers */
+	if (mhi_chan->offload_ch)
+		return;
+
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
+	er_ctxt = &mhi_cntrl->mhi_ctxt->er_ctxt[mhi_chan->er_index];
+
+	mhi_mark_stale_events(mhi_cntrl, mhi_event, er_ctxt, chan);
+
+	if (mhi_chan->xfer_type == MHI_BUF_RSC_DMA)
+		mhi_reset_rsc_chan(mhi_cntrl, mhi_chan);
+	else
+		mhi_reset_data_chan(mhi_cntrl, mhi_chan);
+
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+}
+
+/* Move channel to start state */
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
+{
+	int ret, dir;
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan;
+
+	for (dir = 0; dir < 2; dir++) {
+		mhi_chan = dir ? mhi_dev->dl_chan : mhi_dev->ul_chan;
+
+		if (!mhi_chan)
+			continue;
+
+		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
+		if (ret)
+			goto error_open_chan;
+	}
+
+	return 0;
+
+error_open_chan:
+	for (--dir; dir >= 0; dir--) {
+		mhi_chan = dir ? mhi_dev->dl_chan : mhi_dev->ul_chan;
+
+		if (!mhi_chan)
+			continue;
+
+		__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer);
+
+void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan;
+	int dir;
+
+	for (dir = 0; dir < 2; dir++) {
+		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
+
+		if (!mhi_chan)
+			continue;
+
+		__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
+	}
+}
+EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
+
+int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan = mhi_dev->dl_chan;
+	struct mhi_event *mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
+	int ret;
+
+	spin_lock_bh(&mhi_event->lock);
+	ret = mhi_event->process_event(mhi_cntrl, mhi_event, budget);
+	spin_unlock_bh(&mhi_event->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_poll);
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 19987068b475..e37678037cde 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -925,3 +925,43 @@ int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mhi_force_rddm_mode);
+
+void mhi_device_get(struct mhi_device *mhi_dev)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+
+	mhi_dev->dev_wake++;
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	mhi_cntrl->wake_get(mhi_cntrl, true);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+}
+EXPORT_SYMBOL_GPL(mhi_device_get);
+
+int mhi_device_get_sync(struct mhi_device *mhi_dev)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	int ret;
+
+	ret = __mhi_device_get_sync(mhi_cntrl);
+	if (!ret)
+		mhi_dev->dev_wake++;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_device_get_sync);
+
+void mhi_device_put(struct mhi_device *mhi_dev)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+
+	mhi_dev->dev_wake--;
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
+		mhi_cntrl->runtime_get(mhi_cntrl);
+		mhi_cntrl->runtime_put(mhi_cntrl);
+	}
+
+	mhi_cntrl->wake_put(mhi_cntrl, false);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+}
+EXPORT_SYMBOL_GPL(mhi_device_put);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 2ea2deb922a1..a32548ac3425 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -359,6 +359,8 @@ struct mhi_controller_config {
  * @wake_toggle: CB function to assert and de-assert device wake (optional)
  * @runtime_get: CB function to controller runtime resume (required)
  * @runtimet_put: CB function to decrement pm usage (required)
+ * @map_single: CB function to create TRE buffer
+ * @unmap_single: CB function to destroy TRE buffer
  * @buffer_len: Bounce buffer length
  * @bounce_buf: Use of bounce buffer
  * @fbc_download: MHI host needs to do complete image transfer (optional)
@@ -421,6 +423,10 @@ struct mhi_controller {
 	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
 	int (*runtime_get)(struct mhi_controller *mhi_cntrl);
 	void (*runtime_put)(struct mhi_controller *mhi_cntrl);
+	int (*map_single)(struct mhi_controller *mhi_cntrl,
+			  struct mhi_buf_info *buf);
+	void (*unmap_single)(struct mhi_controller *mhi_cntrl,
+			     struct mhi_buf_info *buf);
 
 	size_t buffer_len;
 	bool bounce_buf;
@@ -603,4 +609,53 @@ int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl);
  */
 enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
 
+/**
+ * mhi_device_get - Disable device low power mode
+ * @mhi_dev: Device associated with the channel
+ */
+void mhi_device_get(struct mhi_device *mhi_dev);
+
+/**
+ * mhi_device_get_sync - Disable device low power mode. Synchronously
+ *                       take the controller out of suspended state
+ * @mhi_dev: Device associated with the channel
+ */
+int mhi_device_get_sync(struct mhi_device *mhi_dev);
+
+/**
+ * mhi_device_put - Re-enable device low power mode
+ * @mhi_dev: Device associated with the channel
+ */
+void mhi_device_put(struct mhi_device *mhi_dev);
+
+/**
+ * mhi_prepare_for_transfer - Setup channel for data transfer
+ * @mhi_dev: Device associated with the channels
+ */
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
+
+/**
+ * mhi_unprepare_from_transfer - Unprepare the channels
+ * @mhi_dev: Device associated with the channels
+ */
+void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
+
+/**
+ * mhi_poll - Poll for any available data in DL direction
+ * @mhi_dev: Device associated with the channels
+ * @budget: # of events to process
+ */
+int mhi_poll(struct mhi_device *mhi_dev, u32 budget);
+
+/**
+ * mhi_queue_transfer - Send or receive data from client device over MHI channel
+ * @mhi_dev: Device associated with the channels
+ * @dir: DMA direction for the channel
+ * @buf: Buffer for holding the data
+ * @len: Buffer length
+ * @mflags: MHI transfer flags used for the transfer
+ */
+int mhi_queue_transfer(struct mhi_device *mhi_dev, enum dma_data_direction dir,
+		       void *buf, size_t len, enum mhi_flags mflags);
+
 #endif /* _MHI_H_ */
-- 
2.17.1

