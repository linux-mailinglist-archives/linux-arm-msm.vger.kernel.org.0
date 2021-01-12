Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E4B2F2BD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 10:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732434AbhALJxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 04:53:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392782AbhALJxe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 04:53:34 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3ED9C061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 01:52:53 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id r3so1806578wrt.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 01:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=pABd35WyxYMbryPSfkKAlGUAMDlbfqD1F+YHyIoLTX4=;
        b=MDUeyFO5k83Stcm3D6zlB7i8jGSsYG+NDFGJ1beLffF1ZbuWR2n4IQeOAaJnMuqsGi
         2QEe5VtMVZqEaoju3v8+Q+cbJMr5vW7YIHZnTmaeVWqjA5YzKwbK2lGg8ASwgRiG05sw
         8cNWBnWrA9oAL8ZD31ZbeXuvS2UV9X3tKT8FSxnYX/MFUuMTcKTzFbGT6ta9P6j5+hcP
         N/Ay7/YqcV/KapvmkdV4B4YctG6mtK7rpvUPR6yLb8t9F4fYyuM78aBzZFbhPtqbPkjC
         r1VPrUvBGYFIUFxVOP67XWsSCmBxYwzF5CaJIqQwGeKnNYWA24MN7yegWmhCYhMov4Ow
         k4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pABd35WyxYMbryPSfkKAlGUAMDlbfqD1F+YHyIoLTX4=;
        b=tsyobzpnZMnZAVm5wVFhQsCBW/HC1Ewr6QRJoReciDxC8bRkc9LnFBLqPEdR49sy2/
         HAD79zwIHZAlUOH3MtBgV2q7wkp2XRPskwXo+boKAv7epvcQKNZFoRAW84mAT2L8MLya
         sL5gwIwXALnirWKL13QTb0KZfGqExZ0Ya2XY//BF9JpnnRcky30NwrQCpDF2p4cWw53C
         jFG7MBPlUmmofbrdAnqNWoH8i7F9X8b6Qjvb4IVKrrxm3Vblu3Az8cLS4tWgdlFE+9jK
         pl48+1o4xR7doIdsgv+1zf5ilThI3i4UWrx+27Utb+yxuNlHoiL4OA1RwetuuFw7glmy
         Ex0A==
X-Gm-Message-State: AOAM530SFIduHbYHkfQrrmV1LtMrrpzxrYFlOfInbhqAUog97OvZA+Gx
        StXzRqvdI3zyJFRcj28l6z15ww==
X-Google-Smtp-Source: ABdhPJz/Cr3aOZxGLBBvH9wY9yPr4c8tEYHvAoT2EDmA5ynDhyhj88uUNFMBBFIH44Aw5hDysvTrog==
X-Received: by 2002:adf:c6c4:: with SMTP id c4mr3473868wrh.348.1610445172486;
        Tue, 12 Jan 2021 01:52:52 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id a25sm3008286wmb.25.2021.01.12.01.52.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2021 01:52:52 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, rostedt@goodmis.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: Add tracepoints
Date:   Tue, 12 Jan 2021 11:00:28 +0100
Message-Id: <1610445628-29799-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a set of tracepoints for reporting MHI events such as
MHI transfers, events, doorbell, etc...

This can be used for debugging purpose.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/main.c |  12 +++++
 include/trace/events/mhi.h  | 121 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 include/trace/events/mhi.h

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index c1eb43d..312e4db 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -15,6 +15,9 @@
 #include <linux/slab.h>
 #include "internal.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/mhi.h>
+
 int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 			      void __iomem *base, u32 offset, u32 *out)
 {
@@ -61,6 +64,8 @@ void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
 void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_addr,
 		  dma_addr_t db_val)
 {
+	trace_mhi_ring_doorbell(db_addr, db_val, mhi_cntrl);
+
 	mhi_write_reg(mhi_cntrl, db_addr, 4, upper_32_bits(db_val));
 	mhi_write_reg(mhi_cntrl, db_addr, 0, lower_32_bits(db_val));
 }
@@ -118,6 +123,7 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
 	 */
 	dma_wmb();
 	*ring->ctxt_wp = db;
+	trace_mhi_update_ring_wp(ring, mhi_cntrl);
 
 	mhi_chan->db_cfg.process_db(mhi_cntrl, &mhi_chan->db_cfg,
 				    ring->db_addr, db);
@@ -724,6 +730,8 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 	while (dev_rp != local_rp) {
 		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
 
+		trace_mhi_event(local_rp, mhi_cntrl);
+
 		switch (type) {
 		case MHI_PKT_TYPE_BW_REQ_EVENT:
 		{
@@ -872,6 +880,8 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
 
 		WARN_ON(chan >= mhi_cntrl->max_chan);
 
+		trace_mhi_event(local_rp, mhi_cntrl);
+
 		/*
 		 * Only process the event ring elements whose channel
 		 * ID is within the maximum supported range.
@@ -1098,6 +1108,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 	mhi_add_ring_element(mhi_cntrl, tre_ring);
 	mhi_add_ring_element(mhi_cntrl, buf_ring);
 
+	trace_mhi_transfer(mhi_tre, mhi_cntrl, mhi_chan->chan);
+
 	return 0;
 }
 
diff --git a/include/trace/events/mhi.h b/include/trace/events/mhi.h
new file mode 100644
index 0000000..903fdd4
--- /dev/null
+++ b/include/trace/events/mhi.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM mhi
+
+#if !defined(_TRACE_MHI_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_MHI_H
+
+#include <linux/mhi.h>
+#include <linux/tracepoint.h>
+
+#include "../../drivers/bus/mhi/core/internal.h"
+
+TRACE_EVENT(mhi_transfer,
+
+	TP_PROTO(struct mhi_tre *tre, struct mhi_controller *cntrl, u32 chan),
+
+	TP_ARGS(tre, cntrl, chan),
+
+	TP_STRUCT__entry(
+		__field(int,	cntrl_index)
+		__field(u32,	channel)
+		__field(void *,	treaddr)
+		__field(u64,	treptr)
+		__field(u32,	tredword0)
+		__field(u32,	tredword1)
+	),
+
+	TP_fast_assign(
+		__entry->cntrl_index = cntrl->index;
+		__entry->channel = chan;
+		__entry->treaddr = tre;
+		__entry->treptr = tre->ptr;
+		__entry->tredword0 = tre->dword[0];
+		__entry->tredword1 = tre->dword[1];
+	),
+
+	TP_printk("mhi%d.%u treaddr=%p treptr=%llx tredword0=%08x tredword1=%08x",
+		  __entry->cntrl_index, __entry->channel, __entry->treaddr,
+		  __entry->treptr, __entry->tredword0, __entry->tredword1)
+);
+
+TRACE_EVENT(mhi_update_ring_wp,
+
+	TP_PROTO(struct mhi_ring *ring, struct mhi_controller *cntrl),
+
+	TP_ARGS(ring, cntrl),
+
+	TP_STRUCT__entry(
+		__field(int,	cntrl_index)
+		__field(void *,	ring)
+		__field(void *,	wp_host)
+		__field(u64,	wp_device)
+	),
+
+	TP_fast_assign(
+		__entry->cntrl_index = cntrl->index;
+		__entry->ring = ring;
+		__entry->wp_host = ring->wp;
+		__entry->wp_device = *ring->ctxt_wp;
+	),
+
+	TP_printk("mhi%d ringaddr=%p wp_host=%p wp_device=%llx",
+		  __entry->cntrl_index, __entry->ring, __entry->wp_host,
+		  __entry->wp_device)
+);
+
+TRACE_EVENT(mhi_ring_doorbell,
+
+	TP_PROTO(void __iomem *db_addr, dma_addr_t db_val, struct mhi_controller *cntrl),
+
+	TP_ARGS(db_addr, db_val, cntrl),
+
+	TP_STRUCT__entry(
+		__field(int,		cntrl_index)
+		__field(void *,		dbaddr)
+		__field(dma_addr_t,	dbval)
+	),
+
+	TP_fast_assign(
+		__entry->cntrl_index = cntrl->index;
+		__entry->dbaddr = db_addr;
+		__entry->dbval = db_val;
+	),
+
+	TP_printk("mhi%d dbaddr=%p dbval=%llx", __entry->cntrl_index,
+		  __entry->dbaddr, __entry->dbval)
+);
+
+TRACE_EVENT(mhi_event,
+
+	TP_PROTO(struct mhi_tre *tre, struct mhi_controller *cntrl),
+
+	TP_ARGS(tre, cntrl),
+
+	TP_STRUCT__entry(
+		__field(int,		cntrl_index)
+		__field(u32,		channel)
+		__field(unsigned int,	type)
+		__field(u64,		treptr)
+		__field(u32,		tredword0)
+		__field(u32,		tredword1)
+	),
+
+	TP_fast_assign(
+		__entry->cntrl_index = cntrl->index;
+		__entry->channel = MHI_TRE_GET_EV_CHID(tre);
+		__entry->type = MHI_TRE_GET_EV_TYPE(tre);
+		__entry->treptr = tre->ptr;
+		__entry->tredword0 = tre->dword[0];
+		__entry->tredword1 = tre->dword[1];
+	),
+
+	TP_printk("mhi%d.%u type=%u treptr=%llx tredword0=%08x tredword1=%08x",
+		  __entry->cntrl_index, __entry->channel, __entry->type,
+		  __entry->treptr, __entry->tredword0, __entry->tredword1)
+);
+
+#endif /* _TRACE_MHI_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.7.4

