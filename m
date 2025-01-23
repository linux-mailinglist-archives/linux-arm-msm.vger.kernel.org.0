Return-Path: <linux-arm-msm+bounces-45949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B42B9A1A2B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74419188E90B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4403C20E028;
	Thu, 23 Jan 2025 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n//OPUEx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D461CAA75
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630820; cv=none; b=Nka83uB/cgYXskxyCq5mQ1elTqxKgJPsji9tXcvGXpKjEXl3fUzEbBsYn126qUOSBW7XVLbFq5LJCFz5a9h1JPplWMBl33wiM/YS2Pynv5Q6Vl1sKLDEgR/BqlwemUo2RzLzTuoLX0McgxLz0U2sYFzahcoDmvOZ1WoG6Xs6yTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630820; c=relaxed/simple;
	bh=Vi+VNbrcCrprHEbwVXnIuFPghoNrENAF6nfe4eceRS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fmb02WSia5JnSmfY/g4RADlTHJo1rVyjHicHnyQD+3Tk2DyVU3GhslAlrTHmxUVU1V+omj7BH21tc3hwOZEd33VPLI7suremmgXi2hOKk5ESDTTsKeflVsfa0wceQJGcWxlREZEixNzcN373m5No37EnPGVpwg0LEUGqa55/5e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n//OPUEx; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso860904e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737630816; x=1738235616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UbK2QIG9UZ82+jDNZ5mfxY3AJqyqTWXM47nQcnNSjYk=;
        b=n//OPUExLwHRAoBox1vvGwArHaoWKuf7KOrJ8LrpR4cGCWNkfyULpcnPZRncXLAqOV
         tcGvFT9Aocjzt/OpwdkzcW2FXLeUoaQEcTsjv0IRmz/WKhzXmPQRWgxZhj8FvUdjN13X
         +zvXPCednvZgDwkAbFedyMnYQyTHKSO53vffvmGljRMcodgoRL2rCVXXFeZeQ10Zcn7i
         MhiFdBh5oD0mgAAfDezpDLIJE6xyKcYy540bzv1iL3CkJLKUC9mznREloaXoYeHo/DIg
         vW93AebZstGoEQxc6O8qrr/7NZNuS8RJb+/y0DDTPvB846J0xqFlVHj7Sy2rs4A7G0KQ
         bWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737630816; x=1738235616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbK2QIG9UZ82+jDNZ5mfxY3AJqyqTWXM47nQcnNSjYk=;
        b=glnCKiJ+AsT71vI/09q/WFBJlW3aqA4TXZQZ7iUNtDekWYZY8u6PbDm2o7uUfKzkQV
         d/wvnc4yWComhwTny0IGhO0HGYirHdow+uDrBS0H5qvsaJnGXB3tq5ydwfAyTv4p806M
         4kx3n0sKOI19AMyMFvGerNSA5qhbIJS70Uz4YNRaeLcLOvPpEULA5fjKoJEQcH+zgG77
         dUDLfTdVrMjCU0y268JdkzZQ534hY3+0Egyj1afQoDsV9NEvox305yAOUBnmtbrq/yH7
         6gxNtWqOeiU8U9fRBYJyIiPybr0A53MxvmfxQF82SX5uD6UvcuZMDF0C6pv54Ii2rfkN
         Wu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsV8ijrEiS5H3t1i48ToUEc6ZtF3ntJSxh8gap4OlPG5GVsUb9AHI08G5BASl5r2tO5rPRn/QTyB+6BBBD@vger.kernel.org
X-Gm-Message-State: AOJu0YxRd97zfhyXml+em77pR/gO2wFVaStVwdUvJFWQWY7o7GViaCqJ
	UwBmq2VPYFulmVuIqIRnRVC6qzZ1K2dsS0O6y3iDbuHAX5z5+yEIC4Rb9NnS+jwr6yYmoEMWexV
	I4I8=
X-Gm-Gg: ASbGncub3IKidt0SXcIjZCLzQMnDjaYfhGp9/ExsmErZSqucwr57yKnWUo6pML22fEE
	C+Kjl8zwtcUkN+rN06C0m0zAqydRexa/qqRyNxk/rj7x9VeZbwIFAnuA0d3cEL6Ogb7vL9ekgac
	owZKDKPM50pJ0y+kT/D0ArVbsTjMLT51Hrsj+bSmEd0gHLNoRNZ1PE2Pw9tUwFF9Z70FS/Ws102
	bEs6WMH48VS3XAFMhQNnkbSS7q9pbo/TmD+5ZmbsLK/t1rLFB38SyYBpwzdqGpPLO5iyST2Zarq
	OZbCvC8CQM0MzybkRXgAFndd4WkMnekv15PlMAg8pQ7D/xu1kNVdJZU0Y7mk
X-Google-Smtp-Source: AGHT+IERe4kxUAeWP4wSOXrmiZHb34wl4W43w8J6oh17JviK1KTZ3IY6rgYfpx3QEyOfEAkFUOfYyQ==
X-Received: by 2002:ac2:511e:0:b0:542:98bb:5678 with SMTP id 2adb3069b0e04-5439c248293mr6188315e87.25.1737630815998;
        Thu, 23 Jan 2025 03:13:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0eae0sm2586522e87.79.2025.01.23.03.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:13:34 -0800 (PST)
Date: Thu, 23 Jan 2025 13:13:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <drh2ikzku37tblmpkjbcdqjllynb3shsfogljfkhq2vcsej2ga@4ex36yehg2e6>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
 <bmg5em2f673vis6wwtjx6ibkhee7d3zocwesgoafsgt5jxbfqn@w73y6gmzbamj>
 <53ce4792-6eca-42ae-b5d7-24d524697344@quicinc.com>
 <fm4wxyu7dv7wzz6szwtz4vyukzxmzajtzqlidaed4hcrabhpe2@eqw6vimhzkjm>
 <0dd43d4f-0399-454b-96fd-2d4f5f36ea14@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dd43d4f-0399-454b-96fd-2d4f5f36ea14@quicinc.com>

On Thu, Jan 23, 2025 at 03:19:21PM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 1/23/2025 1:18 PM, Dmitry Baryshkov wrote:
> > On Thu, Jan 23, 2025 at 11:16:41AM +0530, Ekansh Gupta wrote:
> >>
> >>
> >> On 10/7/2024 7:27 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Oct 07, 2024 at 02:15:15PM GMT, Ekansh Gupta wrote:
> >>>> InvokeV2 request is intended to support multiple enhanced invoke
> >>>> requests like CRC check, performance counter enablement and polling
> >>>> mode for RPC invocations. CRC check is getting enabled as part of
> >>>> this patch. CRC check for input and output argument helps in ensuring
> >>>> data consistency over a remote call. If user intends to enable CRC
> >>>> check, first local user CRC is calculated at user end and a CRC buffer
> >>>> is passed to DSP to capture remote CRC values. DSP is expected to
> >>>> write to the remote CRC buffer which is then compared at user level
> >>>> with the local CRC values.
> >>> This doesn't explain why this is necessary. Why do you need to checksum
> >>> arguments?
> >> This helps if the user suspects any data inconsistencies in the buffers passed to DSP over
> >> remote call. This is not enabled by default and user can enable it as per their reqirement.
> >> I'll add this information.
> > An inconsistency where? Between the kernel and the DSP? Between the user
> > and the DSP? Does it cover buffer contents or just the addresses?
> Inconsistency between user and DSP. crc_user is calculated at user library before
> making ioctl call and it is compared against the crc data which is filled by DSP and
> copied to user.
> This covers inconsistency in buffer contents.

What is the reason for possible inconsistencies? Is it a debugging
feature?

> >
> >>> Also, what if the DSP firmware doesn't support CRC? How should userspace
> >>> know that?
> >> CRC support on DSP is there since long time(>6years).
> > This doesn't give us a lot. Upstream kernel supports fastrpc since
> > MSM8916 and MSM8996. Do those platforms support CRC?
> The metadata buffer as of today also carries space for CRC information:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n877
> 
> So this is common across all platforms.
> 
> In case CRC is not supported on any older platform, it would result in crc mismatch at user library.
> As of now a warning is getting logged there, I can add the information suggesting the failure might
> also occur if CRC is not supported.

Logs go to /dev/null, they are ignored by users, etc. So either there
should be an actual error being returned by the kernel / library, or it
can be completely ignored and skipped.

So, do MSM8916 / MSM8996 / SDM845 support CRC? If not, that must be
handled somehow.

> > And if they do, why do we need the invoke_v2? Can we modify existing
> > code instead?
> invoke_v2 is needed because there is a need to pass user crc pointer over ioctl call which
> cannot be achieved using existing code. Also there are plans to add more features to this
> invoke_v2 request which will carry some information from user.

Is it really extensible without breaking the ABI?

> >
> >> From user space CRC check failure is
> >> not fatal and is printed as a warning. But if copy of CRC to user fails, it will result in remote
> >> call failure. Should I keep it as fatal considering that ever very old DSP support this or should
> >> I consider the copy failure as non-fatal as userspace is treating this as a warning?
> > warnings can remain unseen for a long time. Consider a GUI app. Nobody
> > is there to view kernel warnings or library output.
> Let me see if this can be done. Are you suggesting that the app will be somewhat tracking
> if there is any crc check mismatch failures?

I suggest returning -EIO to the app.

> >
> >>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc.c      | 161 ++++++++++++++++++++++++------------
> >>>>  include/uapi/misc/fastrpc.h |   7 ++
> >>>>  2 files changed, 116 insertions(+), 52 deletions(-)
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>> index 74181b8c386b..8e817a763d1d 100644
> >>>> --- a/drivers/misc/fastrpc.c
> >>>> +++ b/drivers/misc/fastrpc.c
> >>>> @@ -573,13 +573,15 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
> >>>>  
> >>>>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>>>  			struct fastrpc_user *user, u32 kernel, u32 sc,
> >>>> -			struct fastrpc_invoke_args *args)
> >>>> +			struct fastrpc_invoke_v2 *inv2)
> >>>>  {
> >>>>  	struct fastrpc_channel_ctx *cctx = user->cctx;
> >>>>  	struct fastrpc_invoke_ctx *ctx = NULL;
> >>>> +	struct fastrpc_invoke_args *args = NULL;
> >>> Why do you need to init to NULL if you are going to set it two lines
> >>> below?
> >>>
> >>>>  	unsigned long flags;
> >>>>  	int ret;
> >>>>  
> >>>> +	args = (struct fastrpc_invoke_args *)inv2->inv.args;
> >>> Why does it need a typecast?
> >>>
> >>>>  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> >>>>  	if (!ctx)
> >>>>  		return ERR_PTR(-ENOMEM);
> >>>> @@ -611,6 +613,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>>>  	/* Released in fastrpc_context_put() */
> >>>>  	fastrpc_channel_ctx_get(cctx);
> >>>>  
> >>>> +	ctx->crc = (u32 *)(uintptr_t)inv2->crc;
> >>> Oh, but why? Also is it a user pointer or in-kernel data? If it's a
> >>> user-based pointer, where is the accessiblity check? Why isn't it
> >>> annotated properly?
> >> This is a user pointer where the crc data is expected to be copied. There is no
> >> other access to this pointer from kernel. I'm planning to change the data type
> >> for crc as (void __user*) inside fastrpc_invoke_ctx structure.
> > Yes, please. Also make sure that sparse doesn't add any warnings
> > regarding pointer conversions.
> Ack.
> >
> >>>>  	ctx->sc = sc;
> >>>>  	ctx->retval = -1;
> >>>>  	ctx->pid = current->pid;
> >>>> @@ -1070,6 +1073,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>>>  	struct fastrpc_invoke_buf *list;
> >>>>  	struct fastrpc_phy_page *pages;
> >>>>  	u64 *fdlist;
> >>>> +	u32 *crclist;
> >>>>  	int i, inbufs, outbufs, handles;
> >>>>  
> >>>>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> >>>> @@ -1078,6 +1082,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
> >>>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> >>>>  	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
> >>>> +	crclist = (u32 *)(fdlist + FASTRPC_MAX_FDLIST);
> >>> I think we should rewrite this parsing somehow. Is the format of data
> >>> documented somewhere?
> >> fdlist, crclist and poll(planned) are the only pointers that is being used. I'm planning
> >> to store these pointers to ctx structure and directly use it wherever needed. This will
> >> clean-up this unnecessary calculations at multiple places.
> >
> > Please do. Nevertheless, the format also must be documented.
> Ack.
> >
> >>>>  
> >>>>  	for (i = inbufs; i < ctx->nbufs; ++i) {
> >>>>  		if (!ctx->maps[i]) {
> >>>> @@ -1102,6 +1107,12 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>>>  			fastrpc_map_put(mmap);
> >>>>  	}
> >>>>  
> >>>> +	if (ctx->crc && crclist && rpra) {
> >>>> +		if (copy_to_user((void __user *)ctx->crc, crclist,
> >>>> +				FASTRPC_MAX_CRCLIST * sizeof(u32)))
> >>> Oh, so it's a user pointer. Then u32* was completely incorrect.
> >>> Also you are copying FASTRPC_MAX_CRCLIST elements. Are all of them
> >>> filled? Or are we leaking some data to userspace?
> >> Yes, right. Planning clean-up in next patch.
> >>
> >> All of FASTRPC_MAX_CRCLIST is filled with crc data by DSP so copying should be fine.
> > Huh? I definitely want to see documentation for function arguments.
> Sure. I'll also modify the metadata layout doc here to add fdlist, CRC and other planned contents.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n842

This is not a documentation. E.g. I can not write code using that
description. For example, it mentions neither FDLIST nor CRC.

> >
> >>>> +			return -EFAULT;
> >>>> +	}
> >>>> +
> >>>>  	return 0;
> >>>>  }
> >>>>  

-- 
With best wishes
Dmitry

