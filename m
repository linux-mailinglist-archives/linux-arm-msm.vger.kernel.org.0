Return-Path: <linux-arm-msm+bounces-3580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA967807405
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 16:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8496F1F21554
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 15:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916CA45971;
	Wed,  6 Dec 2023 15:54:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A98182C3;
	Wed,  6 Dec 2023 15:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B672CC433C8;
	Wed,  6 Dec 2023 15:54:32 +0000 (UTC)
Date: Wed, 6 Dec 2023 10:55:00 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, <linux-kernel@vger.kernel.org>,
 <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <quic_vbadigan@quicinc.com>,
 <quic_ramkri@quicinc.com>, <quic_nitegupt@quicinc.com>,
 <quic_skananth@quicinc.com>, <quic_parass@quicinc.com>
Subject: Re: [PATCH v7] bus: mhi: host: Add tracing support
Message-ID: <20231206105500.148ea367@gandalf.local.home>
In-Reply-To: <20231206-ftrace_support-v7-1-aca49a04268b@quicinc.com>
References: <20231206-ftrace_support-v7-1-aca49a04268b@quicinc.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Dec 2023 21:12:57 +0530
Krishna chaitanya chundru <quic_krichai@quicinc.com> wrote:

> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index f78aefd2d7a3..6acb85f4c5f8 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -20,6 +20,9 @@
>  #include <linux/wait.h>
>  #include "internal.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include "trace.h"
> +
>  static DEFINE_IDA(mhi_controller_ida);
>  
>  const char * const mhi_ee_str[MHI_EE_MAX] = {
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index dcf627b36e82..507cf3351a97 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -15,6 +15,7 @@
>  #include <linux/skbuff.h>
>  #include <linux/slab.h>
>  #include "internal.h"
> +#include "trace.h"
>  
>  int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
>  			      void __iomem *base, u32 offset, u32 *out)
> @@ -491,11 +492,9 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  
>  	state = mhi_get_mhi_state(mhi_cntrl);
>  	ee = mhi_get_exec_env(mhi_cntrl);
> -	dev_dbg(dev, "local ee: %s state: %s device ee: %s state: %s\n",
> -		TO_MHI_EXEC_STR(mhi_cntrl->ee),
> -		mhi_state_str(mhi_cntrl->dev_state),
> -		TO_MHI_EXEC_STR(ee), mhi_state_str(state));
>  
> +	trace_mhi_intvec_states(mhi_cntrl->mhi_dev->name, mhi_cntrl->ee,
> +				mhi_cntrl->dev_state, ee, state);

I'm not sure if this was discussed before, but why not just pass in the
mhi_cntrl pointer and do the assigning in the TRACE_EVENT()
TP_fast_assign() portion?

It will save on setting up the parameters.

>  	if (state == MHI_STATE_SYS_ERR) {
>  		dev_dbg(dev, "System error detected\n");
>  		pm_state = mhi_tryset_pm_state(mhi_cntrl,
> @@ -832,6 +831,10 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  	while (dev_rp != local_rp) {
>  		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
>  
> +		trace_mhi_ctrl_event(mhi_cntrl->mhi_dev->name, local_rp,
> +				     local_rp->ptr, local_rp->dword[0],
> +				     local_rp->dword[1]);

And here..

> +
>  		switch (type) {
>  		case MHI_PKT_TYPE_BW_REQ_EVENT:
>  		{
> @@ -997,6 +1000,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  	while (dev_rp != local_rp && event_quota > 0) {
>  		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
>  
> +		trace_mhi_data_event(mhi_cntrl->mhi_dev->name, local_rp, local_rp->ptr,
> +				     local_rp->dword[0], local_rp->dword[1]);

and here..

for the local_rp. Especially since you are just repeating what you send
into the two events. You can consolidate it down to just adding that in the
TP_fast_assign() of the shared DECLARE_EVENT_CLASS().

> +
>  		chan = MHI_TRE_GET_EV_CHID(local_rp);
>  
>  		WARN_ON(chan >= mhi_cntrl->max_chan);
> @@ -1235,6 +1241,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
>  	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
>  
> +	trace_mhi_gen_tre(mhi_cntrl->mhi_dev->name, mhi_chan->chan, mhi_tre,
> +			  mhi_tre->ptr, mhi_tre->dword[0], mhi_tre->dword[1]);

Same here. You can pass in the mhi_tre pointer.

>  	/* increment WP */
>  	mhi_add_ring_element(mhi_cntrl, tre_ring);
>  	mhi_add_ring_element(mhi_cntrl, buf_ring);
> @@ -1327,9 +1335,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
>  	enum mhi_cmd_type cmd = MHI_CMD_NOP;
>  	int ret;
>  
> -	dev_dbg(dev, "%d: Updating channel state to: %s\n", mhi_chan->chan,
> -		TO_CH_STATE_TYPE_STR(to_state));
> -
> +	trace_mhi_channel_command_start(mhi_cntrl->mhi_dev->name, mhi_chan->chan, to_state);

And here..

>  	switch (to_state) {
>  	case MHI_CH_STATE_TYPE_RESET:
>  		write_lock_irq(&mhi_chan->lock);
> @@ -1396,9 +1402,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
>  		write_unlock_irq(&mhi_chan->lock);
>  	}
>  
> -	dev_dbg(dev, "%d: Channel state change to %s successful\n",
> -		mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
> -
> +	trace_mhi_channel_command_end(mhi_cntrl->mhi_dev->name, mhi_chan->chan, to_state);

and here..

Where you can also update the DECLARE_EVENT_CLASS() to directly access the
mhi_cntrl and mhi_chan pointers. Sometimes it's better to do the
dereference from inside the TP_fast_assign. That way, things like eprobes
and bpf tracing can also have access to the full structure if needed.

-- Steve

