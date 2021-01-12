Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184162F35E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 17:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbhALQjl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 11:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727203AbhALQjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 11:39:40 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70849C061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 08:39:00 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id i63so2450327wma.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 08:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=VJBkA4Lpj5kOCXSs2YpkC+ylwHrRaQ4IrXFjsG+5mhY=;
        b=bs7lPiHK+lzJPCXjlB/jwp3vd4en/4Jb0PJDoyT8si5sbUf1zQS4hIVXJMfe4xMr1Q
         OpyJhiRy9e4jnQhVoNsDc7FQfJ7UmU1HuaI6IIM+BSuwifP3ZHLavU7t0fl3htxlGP9i
         VVrZQolO7CtvLlVRCr5S5dJmu0AdgF5G+meVXQ/q9+sUqxXr34YQRnk/Hoc9Ivj4vkG1
         neijgF0aBqpVC5H+hp5XbVXhVRf3ZCcJTfEWE4DXG4yS60x+CY0dwlzdq7Fm9mfd+HJ2
         4GmEFDH84as4QpqGMxTULAnnvwfqguXkLohCQ5FiPCoiv+AnJNfhbdHGufi8USUAbtNd
         K+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VJBkA4Lpj5kOCXSs2YpkC+ylwHrRaQ4IrXFjsG+5mhY=;
        b=fVTa7MriQ3RzwgsxWvu/MfxabS3ZAQCklV+X29Iv6OdVEE0Wv6zDR9sQDuaERgS/4m
         SBR87vKIbvieBHaczU6jnOXdd2CIAqFZxr+qns0Y3PDUpJpM8IR+BIXZleEXl+ikNUIU
         4eCKvUC503rUbe/CG3IZwu6GnUDxi56zT2sQUYsrWvGna95aWGDhzWs2OfHtr9BZP6Oq
         pgzFWHQhoCBIb+rlFNOObQdlo3LkCJgfq8rm1/5POsu7rzsUzyYaHi0z1pPLCs9ycNfI
         bcVdGs+Cjr8BoTkYcsVe5mxvdIwcgwwo8qq1vO6qkaPLFOqTQhElCyLPyOvqlM90AgG0
         7uxw==
X-Gm-Message-State: AOAM532bxdVfp7TR04s0XjDzaobjpt1sZgGX+497QYujWM7ORSgOm4Bh
        maA8eZUITLMsE7s9rC6Ahmi9Tn294S0AZg==
X-Google-Smtp-Source: ABdhPJykIBbQtggY1foaqob2K5fxHCJ3tyIbHegDr5Uz8v9+uefM856a4B/zmumS+Hmx7Pz/+8GWrg==
X-Received: by 2002:a1c:9a4d:: with SMTP id c74mr121220wme.5.1610469539148;
        Tue, 12 Jan 2021 08:38:59 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id 125sm4686825wmc.27.2021.01.12.08.38.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2021 08:38:57 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, rostedt@goodmis.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] mhi: Add tracepoints
Date:   Tue, 12 Jan 2021 17:46:28 +0100
Message-Id: <1610469988-21678-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a set of tracepoints for reporting MHI events such as
MHI transfers, events, doorbell, etc...

This can be used for debugging purpose.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: move trace headed to drivers/bus/mhi/core
     Fix TP_STRUCT alignment

 drivers/bus/mhi/core/Makefile |   1 +
 drivers/bus/mhi/core/main.c   |  12 ++++
 drivers/bus/mhi/core/trace.h  | 126 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/bus/mhi/core/trace.h

diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
index c3feb41..e6c74e1 100644
--- a/drivers/bus/mhi/core/Makefile
+++ b/drivers/bus/mhi/core/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_MHI_BUS) += mhi.o
 
 mhi-y := init.o main.o pm.o boot.o
+CFLAGS_main.o := -I$(src)
 mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index c1eb43d..b53ea14 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -15,6 +15,9 @@
 #include <linux/slab.h>
 #include "internal.h"
 
+#define CREATE_TRACE_POINTS
+#include "trace.h"
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
 
diff --git a/drivers/bus/mhi/core/trace.h b/drivers/bus/mhi/core/trace.h
new file mode 100644
index 0000000..25bc464
--- /dev/null
+++ b/drivers/bus/mhi/core/trace.h
@@ -0,0 +1,126 @@
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
+#include "internal.h"
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
+		__field(void *,	ring)
+		__field(void *,	wp_host)
+		__field(u64,	wp_device)
+		__field(int,	cntrl_index)
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
+		__field(void *,		dbaddr)
+		__field(dma_addr_t,	dbval)
+		__field(int,		cntrl_index)
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
+		__field(u64,		treptr)
+		__field(int,		cntrl_index)
+		__field(unsigned int,	type)
+		__field(u32,		channel)
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
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE trace
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.7.4

