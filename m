Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C11C14668A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgAWLTM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:19:12 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39217 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbgAWLTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:19:11 -0500
Received: by mail-pg1-f194.google.com with SMTP id 4so1224591pgd.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 03:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YBuKLpg1prNcrhsTMooV7hTGso7ASfJyr8ui0RkAyVo=;
        b=ELxpGqLViTeVwBpt7CVhi0xhYg7GOtTXKJlCoQX/SP8tpwgSecHo/hWmUf/WLL7Bnj
         C8uKagliGfAVE5fPJeiJkzKpLtlA+TghCipGXr7CJ4LYwSpYVJHNDI3kFa+UgjWeWE6u
         sRVJMVmZto+WrcesEEUH5g+pMIj6EG+QXwOjoX91eUyvhsk8KoOaJRBLJwumIgBIRa77
         5pOnMHbmIjb+AcQh7VBEVNJsiD4xIdS2c9iq36QFEeLDCm8TAC8uaPRn6/H9oRKj2Pu7
         KNt85rPhOTwGS5u8+yDajXgyo9W5nquhXAvbH8otHge/iXGSP3L/jUZhg9GzT4KOHe8Q
         eMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YBuKLpg1prNcrhsTMooV7hTGso7ASfJyr8ui0RkAyVo=;
        b=t1J7P86oOwmPbdmBHAQegV3XJXOi3ksmEG8/wsOnfTicdlD6WUwkSZpb/ikxAt4cwq
         8r5qF1+1XWKaNgTcJJFW4vq0mqyZpVx0gecYLAic/Roa0IsrOpXJda95JYc+gpuzLT5B
         99zG26gN4mZcUlctyQimggx87b2tR8uaISW8oXSv76SY2RuHVfi47OZW2aEw418PbGpo
         1/3VnKoO08E9wTv2JBSXCuOooJE5cYgv4UTxrsuxsWVCoIdmM9lC6F4AxLAL8jiwDWYG
         lj9pPOSyj6iynrdZfJMc7HOcXw7z/w0sEcBfurwZQ/hgGBitZcQIXyPEtgifbQcViLlo
         wHsg==
X-Gm-Message-State: APjAAAV/SbwZn/9S91Ty5dR1FgsMNvwdKC/IpUMlsaWQwDpYUi6dTI7g
        uHEibVg34p/1gq6ggHuT73JQ
X-Google-Smtp-Source: APXvYqxWhhOTPoLDL7TMs/w8FJEcNZaREFvAo/niX9V3Vw+uYUvkLfWkY93paZwYbA0nkNXF5YP0Og==
X-Received: by 2002:a63:7b44:: with SMTP id k4mr3407802pgn.140.1579778350482;
        Thu, 23 Jan 2020 03:19:10 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id y6sm2627559pgc.10.2020.01.23.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 03:19:09 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/16] bus: mhi: core: Add support for basic PM operations
Date:   Thu, 23 Jan 2020 16:48:27 +0530
Message-Id: <20200123111836.7414-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for basic MHI PM operations such as
mhi_async_power_up, mhi_sync_power_up, and mhi_power_down. These
routines places the MHI bus into respective power domain states
and calls the state_transition APIs when necessary. The MHI
controller driver is expected to call these PM routines for
MHI powerup and powerdown.

This is based on the patch submitted by Sujeev Dias:
https://lkml.org/lkml/2018/7/9/989

Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
[mani: splitted the pm patch and cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/Makefile   |   2 +-
 drivers/bus/mhi/core/boot.c     |  89 +++++++++
 drivers/bus/mhi/core/init.c     | 313 ++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/internal.h |  37 ++++
 drivers/bus/mhi/core/main.c     |  89 +++++++++
 drivers/bus/mhi/core/pm.c       | 218 ++++++++++++++++++++++
 include/linux/mhi.h             |  51 ++++++
 7 files changed, 798 insertions(+), 1 deletion(-)
 create mode 100644 drivers/bus/mhi/core/boot.c

diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
index a0070f9cdfcd..66e2700c9032 100644
--- a/drivers/bus/mhi/core/Makefile
+++ b/drivers/bus/mhi/core/Makefile
@@ -1,3 +1,3 @@
 obj-$(CONFIG_MHI_BUS) := mhi.o
 
-mhi-y := init.o main.o pm.o
+mhi-y := init.o main.o pm.o boot.o
diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
new file mode 100644
index 000000000000..0996f18c4281
--- /dev/null
+++ b/drivers/bus/mhi/core/boot.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ *
+ */
+
+#define dev_fmt(fmt) "MHI: " fmt
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/mhi.h>
+#include <linux/module.h>
+#include <linux/random.h>
+#include <linux/slab.h>
+#include <linux/wait.h>
+#include "internal.h"
+
+void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
+			 struct image_info *image_info)
+{
+	int i;
+	struct mhi_buf *mhi_buf = image_info->mhi_buf;
+
+	for (i = 0; i < image_info->entries; i++, mhi_buf++)
+		mhi_free_coherent(mhi_cntrl, mhi_buf->len, mhi_buf->buf,
+				  mhi_buf->dma_addr);
+
+	kfree(image_info->mhi_buf);
+	kfree(image_info);
+}
+
+int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
+			 struct image_info **image_info,
+			 size_t alloc_size)
+{
+	size_t seg_size = mhi_cntrl->seg_len;
+	int segments = DIV_ROUND_UP(alloc_size, seg_size) + 1;
+	int i;
+	struct image_info *img_info;
+	struct mhi_buf *mhi_buf;
+
+	img_info = kzalloc(sizeof(*img_info), GFP_KERNEL);
+	if (!img_info)
+		return -ENOMEM;
+
+	/* Allocate memory for entries */
+	img_info->mhi_buf = kcalloc(segments, sizeof(*img_info->mhi_buf),
+				    GFP_KERNEL);
+	if (!img_info->mhi_buf)
+		goto error_alloc_mhi_buf;
+
+	/* Allocate and populate vector table */
+	mhi_buf = img_info->mhi_buf;
+	for (i = 0; i < segments; i++, mhi_buf++) {
+		size_t vec_size = seg_size;
+
+		/* Vector table is the last entry */
+		if (i == segments - 1)
+			vec_size = sizeof(struct bhi_vec_entry) * i;
+
+		mhi_buf->len = vec_size;
+		mhi_buf->buf = mhi_alloc_coherent(mhi_cntrl, vec_size,
+						  &mhi_buf->dma_addr,
+						  GFP_KERNEL);
+		if (!mhi_buf->buf)
+			goto error_alloc_segment;
+	}
+
+	img_info->bhi_vec = img_info->mhi_buf[segments - 1].buf;
+	img_info->entries = segments;
+	*image_info = img_info;
+
+	return 0;
+
+error_alloc_segment:
+	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
+		mhi_free_coherent(mhi_cntrl, mhi_buf->len, mhi_buf->buf,
+				  mhi_buf->dma_addr);
+
+error_alloc_mhi_buf:
+	kfree(img_info);
+
+	return -ENOMEM;
+}
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 83a03493c757..7fff92e9661b 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -75,6 +75,284 @@ const char *to_mhi_pm_state_str(enum mhi_pm_state state)
 	return mhi_pm_state_str[index];
 }
 
+/* MHI protocol requires the transfer ring to be aligned with ring length */
+static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
+				  struct mhi_ring *ring,
+				  u64 len)
+{
+	ring->alloc_size = len + (len - 1);
+	ring->pre_aligned = mhi_alloc_coherent(mhi_cntrl, ring->alloc_size,
+					       &ring->dma_handle, GFP_KERNEL);
+	if (!ring->pre_aligned)
+		return -ENOMEM;
+
+	ring->iommu_base = (ring->dma_handle + (len - 1)) & ~(len - 1);
+	ring->base = ring->pre_aligned + (ring->iommu_base - ring->dma_handle);
+
+	return 0;
+}
+
+void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
+{
+	int i;
+	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
+
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		if (mhi_event->offload_ev)
+			continue;
+
+		free_irq(mhi_cntrl->irq[mhi_event->irq], mhi_event);
+	}
+
+	free_irq(mhi_cntrl->irq[0], mhi_cntrl);
+}
+
+int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
+{
+	int i;
+	int ret;
+	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
+
+	/* Setup BHI_INTVEC IRQ */
+	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
+				   mhi_intvec_threaded_handler,
+				   IRQF_SHARED | IRQF_NO_SUSPEND,
+				   "bhi", mhi_cntrl);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		if (mhi_event->offload_ev)
+			continue;
+
+		ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
+				  mhi_irq_handler,
+				  IRQF_SHARED | IRQF_NO_SUSPEND,
+				  "mhi", mhi_event);
+		if (ret) {
+			dev_err(mhi_cntrl->dev,
+				"Error requesting irq:%d for ev:%d\n",
+				mhi_cntrl->irq[mhi_event->irq], i);
+			goto error_request;
+		}
+	}
+
+	return 0;
+
+error_request:
+	for (--i, --mhi_event; i >= 0; i--, mhi_event--) {
+		if (mhi_event->offload_ev)
+			continue;
+
+		free_irq(mhi_cntrl->irq[mhi_event->irq], mhi_event);
+	}
+	free_irq(mhi_cntrl->irq[0], mhi_cntrl);
+
+	return ret;
+}
+
+void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
+{
+	int i;
+	struct mhi_ctxt *mhi_ctxt = mhi_cntrl->mhi_ctxt;
+	struct mhi_cmd *mhi_cmd;
+	struct mhi_event *mhi_event;
+	struct mhi_ring *ring;
+
+	mhi_cmd = mhi_cntrl->mhi_cmd;
+	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
+		ring = &mhi_cmd->ring;
+		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
+				  ring->pre_aligned, ring->dma_handle);
+		ring->base = NULL;
+		ring->iommu_base = 0;
+	}
+
+	mhi_free_coherent(mhi_cntrl,
+			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
+			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
+
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		if (mhi_event->offload_ev)
+			continue;
+
+		ring = &mhi_event->ring;
+		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
+				  ring->pre_aligned, ring->dma_handle);
+		ring->base = NULL;
+		ring->iommu_base = 0;
+	}
+
+	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->er_ctxt) *
+			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
+			  mhi_ctxt->er_ctxt_addr);
+
+	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->chan_ctxt) *
+			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
+			  mhi_ctxt->chan_ctxt_addr);
+
+	kfree(mhi_ctxt);
+	mhi_cntrl->mhi_ctxt = NULL;
+}
+
+int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_ctxt *mhi_ctxt;
+	struct mhi_chan_ctxt *chan_ctxt;
+	struct mhi_event_ctxt *er_ctxt;
+	struct mhi_cmd_ctxt *cmd_ctxt;
+	struct mhi_chan *mhi_chan;
+	struct mhi_event *mhi_event;
+	struct mhi_cmd *mhi_cmd;
+	int ret = -ENOMEM, i;
+
+	atomic_set(&mhi_cntrl->dev_wake, 0);
+	atomic_set(&mhi_cntrl->alloc_size, 0);
+	atomic_set(&mhi_cntrl->pending_pkts, 0);
+
+	mhi_ctxt = kzalloc(sizeof(*mhi_ctxt), GFP_KERNEL);
+	if (!mhi_ctxt)
+		return -ENOMEM;
+
+	/* Setup channel ctxt */
+	mhi_ctxt->chan_ctxt = mhi_alloc_coherent(mhi_cntrl,
+						 sizeof(*mhi_ctxt->chan_ctxt) *
+						 mhi_cntrl->max_chan,
+						 &mhi_ctxt->chan_ctxt_addr,
+						 GFP_KERNEL);
+	if (!mhi_ctxt->chan_ctxt)
+		goto error_alloc_chan_ctxt;
+
+	mhi_chan = mhi_cntrl->mhi_chan;
+	chan_ctxt = mhi_ctxt->chan_ctxt;
+	for (i = 0; i < mhi_cntrl->max_chan; i++, chan_ctxt++, mhi_chan++) {
+		/* Skip if it is an offload channel */
+		if (mhi_chan->offload_ch)
+			continue;
+
+		chan_ctxt->chstate = MHI_CH_STATE_DISABLED;
+		chan_ctxt->brstmode = mhi_chan->db_cfg.brstmode;
+		chan_ctxt->pollcfg = mhi_chan->db_cfg.pollcfg;
+		chan_ctxt->chtype = mhi_chan->type;
+		chan_ctxt->erindex = mhi_chan->er_index;
+
+		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
+		mhi_chan->tre_ring.db_addr = (void __iomem *)&chan_ctxt->wp;
+	}
+
+	/* Setup event context */
+	mhi_ctxt->er_ctxt = mhi_alloc_coherent(mhi_cntrl,
+					       sizeof(*mhi_ctxt->er_ctxt) *
+					       mhi_cntrl->total_ev_rings,
+					       &mhi_ctxt->er_ctxt_addr,
+					       GFP_KERNEL);
+	if (!mhi_ctxt->er_ctxt)
+		goto error_alloc_er_ctxt;
+
+	er_ctxt = mhi_ctxt->er_ctxt;
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, er_ctxt++,
+		     mhi_event++) {
+		struct mhi_ring *ring = &mhi_event->ring;
+
+		/* Skip if it is an offload event */
+		if (mhi_event->offload_ev)
+			continue;
+
+		er_ctxt->intmodc = 0;
+		er_ctxt->intmodt = mhi_event->intmod;
+		er_ctxt->ertype = MHI_ER_TYPE_VALID;
+		er_ctxt->msivec = mhi_event->irq;
+		mhi_event->db_cfg.db_mode = true;
+
+		ring->el_size = sizeof(struct mhi_tre);
+		ring->len = ring->el_size * ring->elements;
+		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
+		if (ret)
+			goto error_alloc_er;
+
+		/*
+		 * If the read pointer equals to the write pointer, then the
+		 * ring is empty
+		 */
+		ring->rp = ring->wp = ring->base;
+		er_ctxt->rbase = ring->iommu_base;
+		er_ctxt->rp = er_ctxt->wp = er_ctxt->rbase;
+		er_ctxt->rlen = ring->len;
+		ring->ctxt_wp = &er_ctxt->wp;
+	}
+
+	/* Setup cmd context */
+	mhi_ctxt->cmd_ctxt = mhi_alloc_coherent(mhi_cntrl,
+						sizeof(*mhi_ctxt->cmd_ctxt) *
+						NR_OF_CMD_RINGS,
+						&mhi_ctxt->cmd_ctxt_addr,
+						GFP_KERNEL);
+	if (!mhi_ctxt->cmd_ctxt)
+		goto error_alloc_er;
+
+	mhi_cmd = mhi_cntrl->mhi_cmd;
+	cmd_ctxt = mhi_ctxt->cmd_ctxt;
+	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
+		struct mhi_ring *ring = &mhi_cmd->ring;
+
+		ring->el_size = sizeof(struct mhi_tre);
+		ring->elements = CMD_EL_PER_RING;
+		ring->len = ring->el_size * ring->elements;
+		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
+		if (ret)
+			goto error_alloc_cmd;
+
+		ring->rp = ring->wp = ring->base;
+		cmd_ctxt->rbase = ring->iommu_base;
+		cmd_ctxt->rp = cmd_ctxt->wp = cmd_ctxt->rbase;
+		cmd_ctxt->rlen = ring->len;
+		ring->ctxt_wp = &cmd_ctxt->wp;
+	}
+
+	mhi_cntrl->mhi_ctxt = mhi_ctxt;
+
+	return 0;
+
+error_alloc_cmd:
+	for (--i, --mhi_cmd; i >= 0; i--, mhi_cmd--) {
+		struct mhi_ring *ring = &mhi_cmd->ring;
+
+		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
+				  ring->pre_aligned, ring->dma_handle);
+	}
+	mhi_free_coherent(mhi_cntrl,
+			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
+			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
+	i = mhi_cntrl->total_ev_rings;
+	mhi_event = mhi_cntrl->mhi_event + i;
+
+error_alloc_er:
+	for (--i, --mhi_event; i >= 0; i--, mhi_event--) {
+		struct mhi_ring *ring = &mhi_event->ring;
+
+		if (mhi_event->offload_ev)
+			continue;
+
+		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
+				  ring->pre_aligned, ring->dma_handle);
+	}
+	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->er_ctxt) *
+			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
+			  mhi_ctxt->er_ctxt_addr);
+
+error_alloc_er_ctxt:
+	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->chan_ctxt) *
+			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
+			  mhi_ctxt->chan_ctxt_addr);
+
+error_alloc_chan_ctxt:
+	kfree(mhi_ctxt);
+
+	return ret;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;
@@ -548,6 +826,41 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 
+int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
+{
+	int ret;
+
+	mutex_lock(&mhi_cntrl->pm_mutex);
+
+	ret = mhi_init_dev_ctxt(mhi_cntrl);
+	if (ret)
+		goto error_dev_ctxt;
+
+	mhi_cntrl->pre_init = true;
+
+	mutex_unlock(&mhi_cntrl->pm_mutex);
+
+	return 0;
+
+error_dev_ctxt:
+	mutex_unlock(&mhi_cntrl->pm_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_prepare_for_power_up);
+
+void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
+{
+	if (mhi_cntrl->fbc_image) {
+		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
+		mhi_cntrl->fbc_image = NULL;
+	}
+
+	mhi_deinit_dev_ctxt(mhi_cntrl);
+	mhi_cntrl->pre_init = false;
+}
+EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
+
 static void mhi_release_device(struct device *dev)
 {
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 2dba4923482a..d920264ded21 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -575,6 +575,11 @@ static inline void mhi_dealloc_device(struct mhi_controller *mhi_cntrl,
 int mhi_destroy_device(struct device *dev, void *data);
 void mhi_create_devices(struct mhi_controller *mhi_cntrl);
 
+int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
+			 struct image_info **image_info, size_t alloc_size);
+void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
+			 struct image_info *image_info);
+
 /* Power management APIs */
 enum mhi_pm_state __must_check mhi_tryset_pm_state(
 					struct mhi_controller *mhi_cntrl,
@@ -616,5 +621,37 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
 
 /* Initialization methods */
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl);
+int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl);
+void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl);
+int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl);
+void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl);
+
+/* Memory allocation methods */
+static inline void *mhi_alloc_coherent(struct mhi_controller *mhi_cntrl,
+				       size_t size,
+				       dma_addr_t *dma_handle,
+				       gfp_t gfp)
+{
+	void *buf = dma_alloc_coherent(mhi_cntrl->dev, size, dma_handle, gfp);
+
+	if (buf)
+		atomic_add(size, &mhi_cntrl->alloc_size);
+
+	return buf;
+}
+
+static inline void mhi_free_coherent(struct mhi_controller *mhi_cntrl,
+				     size_t size,
+				     void *vaddr,
+				     dma_addr_t dma_handle)
+{
+	atomic_sub(size, &mhi_cntrl->alloc_size);
+	dma_free_coherent(mhi_cntrl->dev, size, vaddr, dma_handle);
+}
+
+/* ISR handlers */
+irqreturn_t mhi_irq_handler(int irq_number, void *dev);
+irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev);
+irqreturn_t mhi_intvec_handler(int irq_number, void *dev);
 
 #endif /* _MHI_INT_H */
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index df980fb3b6db..453feba8f02a 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -144,6 +144,11 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
 	return ret ? MHI_STATE_MAX : state;
 }
 
+static void *mhi_to_virtual(struct mhi_ring *ring, dma_addr_t addr)
+{
+	return (addr - ring->iommu_base) + ring->base;
+}
+
 int mhi_destroy_device(struct device *dev, void *data)
 {
 	struct mhi_device *mhi_dev;
@@ -248,3 +253,87 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
 			mhi_dealloc_device(mhi_cntrl, mhi_dev);
 	}
 }
+
+irqreturn_t mhi_irq_handler(int irq_number, void *dev)
+{
+	struct mhi_event *mhi_event = dev;
+	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
+	struct mhi_event_ctxt *er_ctxt =
+		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
+	struct mhi_ring *ev_ring = &mhi_event->ring;
+	void *dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
+
+	/* Only proceed if event ring has pending events */
+	if (ev_ring->rp == dev_rp)
+		return IRQ_HANDLED;
+
+	/* For client managed event ring, notify pending data */
+	if (mhi_event->cl_manage) {
+		struct mhi_chan *mhi_chan = mhi_event->mhi_chan;
+		struct mhi_device *mhi_dev = mhi_chan->mhi_dev;
+
+		if (mhi_dev)
+			mhi_notify(mhi_dev, MHI_CB_PENDING_DATA);
+	} else {
+		tasklet_schedule(&mhi_event->task);
+	}
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev)
+{
+	struct mhi_controller *mhi_cntrl = dev;
+	enum mhi_state state = MHI_STATE_MAX;
+	enum mhi_pm_state pm_state = 0;
+	enum mhi_ee_type ee = 0;
+
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
+		state = mhi_get_mhi_state(mhi_cntrl);
+		ee = mhi_cntrl->ee;
+		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+	}
+
+	if (state == MHI_STATE_SYS_ERR) {
+		dev_dbg(mhi_cntrl->dev, "System error detected\n");
+		pm_state = mhi_tryset_pm_state(mhi_cntrl,
+					       MHI_PM_SYS_ERR_DETECT);
+	}
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+
+	/* If device in RDDM don't bother processing SYS error */
+	if (mhi_cntrl->ee == MHI_EE_RDDM) {
+		if (mhi_cntrl->ee != ee) {
+			mhi_cntrl->status_cb(mhi_cntrl, mhi_cntrl->priv_data,
+					     MHI_CB_EE_RDDM);
+			wake_up_all(&mhi_cntrl->state_event);
+		}
+		goto exit_intvec;
+	}
+
+	if (pm_state == MHI_PM_SYS_ERR_DETECT) {
+		wake_up_all(&mhi_cntrl->state_event);
+
+		/* For fatal errors, we let controller decide next step */
+		if (MHI_IN_PBL(ee))
+			mhi_cntrl->status_cb(mhi_cntrl, mhi_cntrl->priv_data,
+					     MHI_CB_FATAL_ERROR);
+		else
+			schedule_work(&mhi_cntrl->syserr_worker);
+	}
+
+exit_intvec:
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t mhi_intvec_handler(int irq_number, void *dev)
+{
+	struct mhi_controller *mhi_cntrl = dev;
+
+	/* Wake up events waiting for state change */
+	wake_up_all(&mhi_cntrl->state_event);
+
+	return IRQ_WAKE_THREAD;
+}
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 75d43b1039ea..b67ae2455fc5 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -140,6 +140,17 @@ void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl, enum mhi_state state)
 	}
 }
 
+/* NOP for backward compatibility, host allowed to ring DB in M2 state */
+static void mhi_toggle_dev_wake_nop(struct mhi_controller *mhi_cntrl)
+{
+}
+
+static void mhi_toggle_dev_wake(struct mhi_controller *mhi_cntrl)
+{
+	mhi_cntrl->wake_get(mhi_cntrl, false);
+	mhi_cntrl->wake_put(mhi_cntrl, true);
+}
+
 /* Handle device ready state transition */
 int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl)
 {
@@ -683,3 +694,210 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
 
 	return 0;
 }
+
+/* Assert device wake db */
+static void mhi_assert_dev_wake(struct mhi_controller *mhi_cntrl, bool force)
+{
+	unsigned long flags;
+
+	/*
+	 * If force flag is set, then increment the wake count value and
+	 * ring wake db
+	 */
+	if (unlikely(force)) {
+		spin_lock_irqsave(&mhi_cntrl->wlock, flags);
+		atomic_inc(&mhi_cntrl->dev_wake);
+		if (MHI_WAKE_DB_FORCE_SET_VALID(mhi_cntrl->pm_state) &&
+		    !mhi_cntrl->wake_set) {
+			mhi_write_db(mhi_cntrl, mhi_cntrl->wake_db, 1);
+			mhi_cntrl->wake_set = true;
+		}
+		spin_unlock_irqrestore(&mhi_cntrl->wlock, flags);
+	} else {
+		/*
+		 * If resources are already requested, then just increment
+		 * the wake count value and return
+		 */
+		if (likely(atomic_add_unless(&mhi_cntrl->dev_wake, 1, 0)))
+			return;
+
+		spin_lock_irqsave(&mhi_cntrl->wlock, flags);
+		if ((atomic_inc_return(&mhi_cntrl->dev_wake) == 1) &&
+		    MHI_WAKE_DB_SET_VALID(mhi_cntrl->pm_state) &&
+		    !mhi_cntrl->wake_set) {
+			mhi_write_db(mhi_cntrl, mhi_cntrl->wake_db, 1);
+			mhi_cntrl->wake_set = true;
+		}
+		spin_unlock_irqrestore(&mhi_cntrl->wlock, flags);
+	}
+}
+
+/* De-assert device wake db */
+static void mhi_deassert_dev_wake(struct mhi_controller *mhi_cntrl,
+				  bool override)
+{
+	unsigned long flags;
+
+	/*
+	 * Only continue if there is a single resource, else just decrement
+	 * and return
+	 */
+	if (likely(atomic_add_unless(&mhi_cntrl->dev_wake, -1, 1)))
+		return;
+
+	spin_lock_irqsave(&mhi_cntrl->wlock, flags);
+	if ((atomic_dec_return(&mhi_cntrl->dev_wake) == 0) &&
+	    MHI_WAKE_DB_CLEAR_VALID(mhi_cntrl->pm_state) && !override &&
+	    mhi_cntrl->wake_set) {
+		mhi_write_db(mhi_cntrl, mhi_cntrl->wake_db, 0);
+		mhi_cntrl->wake_set = false;
+	}
+	spin_unlock_irqrestore(&mhi_cntrl->wlock, flags);
+}
+
+int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
+{
+	int ret;
+	u32 val;
+	enum mhi_ee_type current_ee;
+	enum dev_st_transition next_state;
+
+	dev_info(mhi_cntrl->dev, "Requested to power ON\n");
+
+	if (mhi_cntrl->nr_irqs < mhi_cntrl->total_ev_rings)
+		return -EINVAL;
+
+	/* Supply default wake routines if not provided by controller driver */
+	if (!mhi_cntrl->wake_get || !mhi_cntrl->wake_put ||
+	    !mhi_cntrl->wake_toggle) {
+		mhi_cntrl->wake_get = mhi_assert_dev_wake;
+		mhi_cntrl->wake_put = mhi_deassert_dev_wake;
+		mhi_cntrl->wake_toggle = (mhi_cntrl->db_access & MHI_PM_M2) ?
+			mhi_toggle_dev_wake_nop : mhi_toggle_dev_wake;
+	}
+
+	mutex_lock(&mhi_cntrl->pm_mutex);
+	mhi_cntrl->pm_state = MHI_PM_DISABLE;
+
+	if (!mhi_cntrl->pre_init) {
+		/* Setup device context */
+		ret = mhi_init_dev_ctxt(mhi_cntrl);
+		if (ret)
+			goto error_dev_ctxt;
+	}
+
+	ret = mhi_init_irq_setup(mhi_cntrl);
+	if (ret)
+		goto error_setup_irq;
+
+	/* Setup BHI offset & INTVEC */
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &val);
+	if (ret) {
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		goto error_bhi_offset;
+	}
+
+	mhi_cntrl->bhi = mhi_cntrl->regs + val;
+
+	/* Setup BHIE offset */
+	if (mhi_cntrl->fbc_download) {
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF, &val);
+		if (ret) {
+			write_unlock_irq(&mhi_cntrl->pm_lock);
+			dev_err(mhi_cntrl->dev, "Error reading BHIE offset\n");
+			goto error_bhi_offset;
+		}
+
+		mhi_cntrl->bhie = mhi_cntrl->regs + val;
+	}
+
+	mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
+	mhi_cntrl->pm_state = MHI_PM_POR;
+	mhi_cntrl->ee = MHI_EE_MAX;
+	current_ee = mhi_get_exec_env(mhi_cntrl);
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+
+	/* Confirm that the device is in valid exec env */
+	if (!MHI_IN_PBL(current_ee) && current_ee != MHI_EE_AMSS) {
+		dev_err(mhi_cntrl->dev, "Not a valid EE for power on\n");
+		ret = -EIO;
+		goto error_bhi_offset;
+	}
+
+	/* Transition to next state */
+	next_state = MHI_IN_PBL(current_ee) ?
+		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
+
+	if (next_state == DEV_ST_TRANSITION_PBL)
+		schedule_work(&mhi_cntrl->fw_worker);
+
+	mhi_queue_state_transition(mhi_cntrl, next_state);
+
+	mutex_unlock(&mhi_cntrl->pm_mutex);
+
+	dev_info(mhi_cntrl->dev, "Power on setup success\n");
+
+	return 0;
+
+error_bhi_offset:
+	mhi_deinit_free_irq(mhi_cntrl);
+
+error_setup_irq:
+	if (!mhi_cntrl->pre_init)
+		mhi_deinit_dev_ctxt(mhi_cntrl);
+
+error_dev_ctxt:
+	mutex_unlock(&mhi_cntrl->pm_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_async_power_up);
+
+void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
+{
+	enum mhi_pm_state cur_state;
+
+	/* If it's not a graceful shutdown, force MHI to linkdown state */
+	if (!graceful) {
+		mutex_lock(&mhi_cntrl->pm_mutex);
+		write_lock_irq(&mhi_cntrl->pm_lock);
+		cur_state = mhi_tryset_pm_state(mhi_cntrl,
+						MHI_PM_LD_ERR_FATAL_DETECT);
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		mutex_unlock(&mhi_cntrl->pm_mutex);
+		if (cur_state != MHI_PM_LD_ERR_FATAL_DETECT)
+			dev_dbg(mhi_cntrl->dev,
+			"Failed to move to state: %s from: %s\n",
+			to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
+			to_mhi_pm_state_str(mhi_cntrl->pm_state));
+	}
+	mhi_pm_disable_transition(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
+	mhi_deinit_free_irq(mhi_cntrl);
+
+	if (!mhi_cntrl->pre_init) {
+		/* Free all allocated resources */
+		if (mhi_cntrl->fbc_image) {
+			mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
+			mhi_cntrl->fbc_image = NULL;
+		}
+		mhi_deinit_dev_ctxt(mhi_cntrl);
+	}
+}
+EXPORT_SYMBOL_GPL(mhi_power_down);
+
+int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
+{
+	int ret = mhi_async_power_up(mhi_cntrl);
+
+	if (ret)
+		return ret;
+
+	wait_event_timeout(mhi_cntrl->state_event,
+			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
+			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
+			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
+
+	return (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -EIO;
+}
+EXPORT_SYMBOL(mhi_sync_power_up);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 80633099b90d..04c500323214 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -83,6 +83,17 @@ enum mhi_ch_type {
 	MHI_CH_TYPE_INBOUND_COALESCED = 3,
 };
 
+/**
+ * struct image_info - Firmware and RDDM table table
+ * @mhi_buf - Buffer for firmware and RDDM table
+ * @entries - # of entries in table
+ */
+struct image_info {
+	struct mhi_buf *mhi_buf;
+	struct bhi_vec_entry *bhi_vec;
+	u32 entries;
+};
+
 /**
  * enum mhi_ee_type - Execution environment types
  * @MHI_EE_PBL: Primary Bootloader
@@ -272,6 +283,7 @@ struct mhi_controller_config {
  * @bus_id: Physical bus instance used by the controller
  * @regs: Base address of MHI MMIO register space
  * @bhi: Points to base of MHI BHI register space
+ * @bhie: Points to base of MHI BHIe register space
  * @wake_db: MHI WAKE doorbell register address
  * @iova_start: IOMMU starting address for data
  * @iova_stop: IOMMU stop address for data
@@ -280,6 +292,7 @@ struct mhi_controller_config {
  * @fbc_download: MHI host needs to do complete image transfer
  * @sbl_size: SBL image size
  * @seg_len: BHIe vector size
+ * @fbc_image: Points to firmware image buffer
  * @max_chan: Maximum number of channels the controller supports
  * @mhi_chan: Points to the channel configuration table
  * @lpm_chans: List of channels that require LPM notifications
@@ -335,6 +348,7 @@ struct mhi_controller {
 	u32 bus_id;
 	void __iomem *regs;
 	void __iomem *bhi;
+	void __iomem *bhie;
 	void __iomem *wake_db;
 
 	dma_addr_t iova_start;
@@ -344,6 +358,7 @@ struct mhi_controller {
 	bool fbc_download;
 	size_t sbl_size;
 	size_t seg_len;
+	struct image_info *fbc_image;
 	u32 max_chan;
 	struct mhi_chan *mhi_chan;
 	struct list_head lpm_chans;
@@ -532,4 +547,40 @@ void mhi_driver_unregister(struct mhi_driver *mhi_drv);
 void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl,
 		       enum mhi_state state);
 
+/**
+ * mhi_prepare_for_power_up - Do pre-initialization before power up.
+ *                            This is optional, call this before power up if
+ *                            the controller does not want bus framework to
+ *                            automatically free any allocated memory during
+ *                            shutdown process.
+ * @mhi_cntrl: MHI controller
+ */
+int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl);
+
+/**
+ * mhi_async_power_up - Start MHI power up sequence
+ * @mhi_cntrl: MHI controller
+ */
+int mhi_async_power_up(struct mhi_controller *mhi_cntrl);
+
+/**
+ * mhi_sync_power_up - Start MHI power up sequence and wait till the device
+ *                     device enters valid EE state
+ * @mhi_cntrl: MHI controller
+ */
+int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
+
+/**
+ * mhi_power_down - Start MHI power down sequence
+ * @mhi_cntrl: MHI controller
+ * @graceful: Link is still accessible, so do a graceful shutdown process
+ */
+void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
+
+/**
+ * mhi_unprepare_after_power_down - Free any allocated memory after power down
+ * @mhi_cntrl: MHI controller
+ */
+void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl);
+
 #endif /* _MHI_H_ */
-- 
2.17.1

