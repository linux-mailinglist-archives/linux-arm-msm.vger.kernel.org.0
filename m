Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E812F32C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 15:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbhALOPe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 09:15:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:51028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728970AbhALOPd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 09:15:33 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B9682311A;
        Tue, 12 Jan 2021 14:14:51 +0000 (UTC)
Date:   Tue, 12 Jan 2021 09:14:49 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mhi: Add tracepoints
Message-ID: <20210112091449.60f223e0@gandalf.local.home>
In-Reply-To: <1610445628-29799-1-git-send-email-loic.poulain@linaro.org>
References: <1610445628-29799-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Jan 2021 11:00:28 +0100
Loic Poulain <loic.poulain@linaro.org> wrote:

> Add a set of tracepoints for reporting MHI events such as
> MHI transfers, events, doorbell, etc...
> 
> This can be used for debugging purpose.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/main.c |  12 +++++
>  include/trace/events/mhi.h  | 121 ++++++++++++++++++++++++++++++++++++++++++++

I would make the events/mhi.h file as drivers/bus/mhi/core/trace.h instead.
See below.

>  2 files changed, 133 insertions(+)
>  create mode 100644 include/trace/events/mhi.h
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index c1eb43d..312e4db 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -15,6 +15,9 @@
>  #include <linux/slab.h>
>  #include "internal.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/mhi.h>
> +
>  int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
>  			      void __iomem *base, u32 offset, u32 *out)
>  {
> @@ -61,6 +64,8 @@ void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
>  void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_addr,
>  		  dma_addr_t db_val)
>  {
> +	trace_mhi_ring_doorbell(db_addr, db_val, mhi_cntrl);
> +
>  	mhi_write_reg(mhi_cntrl, db_addr, 4, upper_32_bits(db_val));
>  	mhi_write_reg(mhi_cntrl, db_addr, 0, lower_32_bits(db_val));
>  }
> @@ -118,6 +123,7 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
>  	 */
>  	dma_wmb();
>  	*ring->ctxt_wp = db;
> +	trace_mhi_update_ring_wp(ring, mhi_cntrl);
>  
>  	mhi_chan->db_cfg.process_db(mhi_cntrl, &mhi_chan->db_cfg,
>  				    ring->db_addr, db);
> @@ -724,6 +730,8 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  	while (dev_rp != local_rp) {
>  		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
>  
> +		trace_mhi_event(local_rp, mhi_cntrl);
> +
>  		switch (type) {
>  		case MHI_PKT_TYPE_BW_REQ_EVENT:
>  		{
> @@ -872,6 +880,8 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  
>  		WARN_ON(chan >= mhi_cntrl->max_chan);
>  
> +		trace_mhi_event(local_rp, mhi_cntrl);
> +
>  		/*
>  		 * Only process the event ring elements whose channel
>  		 * ID is within the maximum supported range.
> @@ -1098,6 +1108,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  	mhi_add_ring_element(mhi_cntrl, tre_ring);
>  	mhi_add_ring_element(mhi_cntrl, buf_ring);
>  
> +	trace_mhi_transfer(mhi_tre, mhi_cntrl, mhi_chan->chan);
> +
>  	return 0;
>  }
>  
> diff --git a/include/trace/events/mhi.h b/include/trace/events/mhi.h
> new file mode 100644
> index 0000000..903fdd4
> --- /dev/null
> +++ b/include/trace/events/mhi.h
> @@ -0,0 +1,121 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM mhi
> +
> +#if !defined(_TRACE_MHI_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_MHI_H
> +
> +#include <linux/mhi.h>
> +#include <linux/tracepoint.h>
> +
> +#include "../../drivers/bus/mhi/core/internal.h"


Instead of adding the mhi.h file into the top level events directory, and
doing the above path search, simply place this file in the
drivers/bus/mhi/core directory as "trace.h". It would require adding:

CFLAGS_main.o := -I$(src)

in drivers/bus/mhi/core/Makefile and some updates at the end of this file
(see below).


> +
> +TRACE_EVENT(mhi_transfer,
> +
> +	TP_PROTO(struct mhi_tre *tre, struct mhi_controller *cntrl, u32 chan),
> +
> +	TP_ARGS(tre, cntrl, chan),
> +
> +	TP_STRUCT__entry(
> +		__field(int,	cntrl_index)
> +		__field(u32,	channel)
> +		__field(void *,	treaddr)
> +		__field(u64,	treptr)
> +		__field(u32,	tredword0)
> +		__field(u32,	tredword1)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->cntrl_index = cntrl->index;
> +		__entry->channel = chan;
> +		__entry->treaddr = tre;
> +		__entry->treptr = tre->ptr;
> +		__entry->tredword0 = tre->dword[0];
> +		__entry->tredword1 = tre->dword[1];
> +	),
> +
> +	TP_printk("mhi%d.%u treaddr=%p treptr=%llx tredword0=%08x tredword1=%08x",
> +		  __entry->cntrl_index, __entry->channel, __entry->treaddr,
> +		  __entry->treptr, __entry->tredword0, __entry->tredword1)
> +);
> +
> +TRACE_EVENT(mhi_update_ring_wp,
> +
> +	TP_PROTO(struct mhi_ring *ring, struct mhi_controller *cntrl),
> +
> +	TP_ARGS(ring, cntrl),
> +
> +	TP_STRUCT__entry(
> +		__field(int,	cntrl_index)
> +		__field(void *,	ring)
> +		__field(void *,	wp_host)
> +		__field(u64,	wp_device)

BTW, when possible, always place extra 32 bit types at the end if there's
64 bit types or long/pointer values. That is, if you can't pair two 32 bit
types together, have the last one at the end of the TP_STRUCT. It will save
4 bytes in the ring buffer for archs that only need 4 byte alignment on 64
bit words.

> +	),
> +
> +	TP_fast_assign(
> +		__entry->cntrl_index = cntrl->index;
> +		__entry->ring = ring;
> +		__entry->wp_host = ring->wp;
> +		__entry->wp_device = *ring->ctxt_wp;
> +	),
> +
> +	TP_printk("mhi%d ringaddr=%p wp_host=%p wp_device=%llx",
> +		  __entry->cntrl_index, __entry->ring, __entry->wp_host,
> +		  __entry->wp_device)
> +);
> +
> +TRACE_EVENT(mhi_ring_doorbell,
> +
> +	TP_PROTO(void __iomem *db_addr, dma_addr_t db_val, struct mhi_controller *cntrl),
> +
> +	TP_ARGS(db_addr, db_val, cntrl),
> +
> +	TP_STRUCT__entry(
> +		__field(int,		cntrl_index)
> +		__field(void *,		dbaddr)
> +		__field(dma_addr_t,	dbval)

I don't know how big dma_addr_t is, but still I would place the int at the
end.

> +	),
> +
> +	TP_fast_assign(
> +		__entry->cntrl_index = cntrl->index;
> +		__entry->dbaddr = db_addr;
> +		__entry->dbval = db_val;
> +	),
> +
> +	TP_printk("mhi%d dbaddr=%p dbval=%llx", __entry->cntrl_index,
> +		  __entry->dbaddr, __entry->dbval)
> +);
> +
> +TRACE_EVENT(mhi_event,
> +
> +	TP_PROTO(struct mhi_tre *tre, struct mhi_controller *cntrl),
> +
> +	TP_ARGS(tre, cntrl),
> +
> +	TP_STRUCT__entry(
> +		__field(int,		cntrl_index)
> +		__field(u32,		channel)
> +		__field(unsigned int,	type)

One of the above int 32 bit types should go to the end.

> +		__field(u64,		treptr)
> +		__field(u32,		tredword0)
> +		__field(u32,		tredword1)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->cntrl_index = cntrl->index;
> +		__entry->channel = MHI_TRE_GET_EV_CHID(tre);
> +		__entry->type = MHI_TRE_GET_EV_TYPE(tre);
> +		__entry->treptr = tre->ptr;
> +		__entry->tredword0 = tre->dword[0];
> +		__entry->tredword1 = tre->dword[1];
> +	),
> +
> +	TP_printk("mhi%d.%u type=%u treptr=%llx tredword0=%08x tredword1=%08x",
> +		  __entry->cntrl_index, __entry->channel, __entry->type,
> +		  __entry->treptr, __entry->tredword0, __entry->tredword1)
> +);
> +
> +#endif /* _TRACE_MHI_H */
> +

To have this file called "trace.h" in the drivers/bus/mhi/core directory,
you would need to also add:

#undef TRACE_INCLUDE_PATH
#undef TRACE_INCLUDE_FILE

#define TRACE_INCLUDE_PATH .
#define TRACE_INCLUDE_FILE trace


-- Steve

> +/* This part must be outside protection */
> +#include <trace/define_trace.h>

