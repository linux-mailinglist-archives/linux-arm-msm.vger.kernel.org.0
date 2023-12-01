Return-Path: <linux-arm-msm+bounces-2933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D88010B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 18:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40F63B20DC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE7A4D582;
	Fri,  1 Dec 2023 17:06:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8428E1F612;
	Fri,  1 Dec 2023 17:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7B2C433C9;
	Fri,  1 Dec 2023 17:06:24 +0000 (UTC)
Date: Fri, 1 Dec 2023 12:06:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 <linux-kernel@vger.kernel.org>, <mhi@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <quic_vbadigan@quicinc.com>, <quic_ramkri@quicinc.com>,
 <quic_nitegupt@quicinc.com>, <quic_skananth@quicinc.com>,
 <quic_parass@quicinc.com>
Subject: Re: [PATCH v5] bus: mhi: host: Add tracing support
Message-ID: <20231201120648.795ea00c@gandalf.local.home>
In-Reply-To: <15c0130a-1a4b-c08b-714b-05166f48d23b@quicinc.com>
References: <20231127-ftrace_support-v5-1-eb67daead4f1@quicinc.com>
	<15c0130a-1a4b-c08b-714b-05166f48d23b@quicinc.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 1 Dec 2023 10:01:33 -0700
Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:

> > +DECLARE_EVENT_CLASS(mhi_process_event_ring,
> > +
> > +	TP_PROTO(const char *name, void *rp, __le64 ptr,
> > +		 __le32 dword0, __le32 dword1),
> > +
> > +	TP_ARGS(name, rp, ptr, dword0, dword1),
> > +
> > +	TP_STRUCT__entry(
> > +		__string(name, name)
> > +		__field(__le32, dword0)
> > +		__field(__le32, dword1)
> > +		__field(int, state)
> > +		__field(__le64, ptr)
> > +		__field(void *, rp)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__assign_str(name, name);
> > +		__entry->rp = rp;
> > +		__entry->ptr = ptr;
> > +		__entry->dword0 = dword0;
> > +		__entry->dword1 = dword1;
> > +		__entry->state = MHI_TRE_GET_EV_STATE((struct mhi_ring_element *)entry->rp);  
> 
> "entry"?
> Also, you have the "rp" that was passed into the trace, why not just 
> directly use that?

Agreed.

-- Steve

