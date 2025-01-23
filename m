Return-Path: <linux-arm-msm+bounces-45906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E85DA19F5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 920B53AEC4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D47420101E;
	Thu, 23 Jan 2025 07:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DgKNzKIm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB93A201100
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 07:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737618508; cv=none; b=TU6eRVbSZcNMBKAc7ncoUGdSdbK8cPVJmFDJai/lbc3Kz/Gef9avE2kXlfv3QT/Tpv/sfemOTETO0fpsvCyfsjsNBf4F66H2oOnef/goxoYFzzAL32h//ednR0gUtKSLYPIX/hKNspGcMw6INg0GKj6KihKoIM3Lv+lK6bObwjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737618508; c=relaxed/simple;
	bh=gb4FezsF6x3C2Rl71Nina0qR9KJ/p7/xUvqSKDT4aRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IM2gmy4T7L7K5ingL4Ly1lJdkgT46Jq+TYgKtrPy1MPBREu71qhBNWxu3Qsb66fGAhT0nWMKD4IGGi9ODCyHW+MtKEgiJ2aw/ixmsEbHLoKwgiDpJKSoOYHbZVGGVgSFewU2Qm00oSjK8SX1YGOGXIYmiom6XW3WZFHSggUwUwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DgKNzKIm; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54025432becso707602e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 23:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737618504; x=1738223304; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TAgzBFWvoNfqrs2RKpM4hGMsxrdxynI/YaPcW7eqIuI=;
        b=DgKNzKImfCncHpzxKTm8w3sBSbC4bHL+xcWKEU6bNeghAXBSz6d4NtNzIR+0vzxj/w
         yLrltUJqTGhqZTaDIVSWeB2XWYFk/s3VMr0cI/iuc6ck1s56hS5R33tS/p8s0vETdgvl
         vxVBzCuRS7LesVuWMx5DF71Vn5zWBOksC1ViYWqd8Aa3U4mkRpi5gLCx1468r1RRN/Vr
         brcyg+4StJGg6QcnNwAaBcWg8yX0+FuJC08ElDdNcEdBS0KnCTSyREo9U7MPnWivQX8Y
         fBPXLNxFs866Zx4X8/Xwc7TbxxzzXJTJwQDcTY2vWJ5/0ajsd5xLVggvL1CiUsnrE/og
         g4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737618504; x=1738223304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TAgzBFWvoNfqrs2RKpM4hGMsxrdxynI/YaPcW7eqIuI=;
        b=ezoHBzK52BO76UgxqlLxHKBBDavgy95nS2hYYcl8G9Jx/qytL20CXKZm6YvEK6ebot
         ymMcY0Sy7lDE090FQwP9wcCN1U5ES0pL71DHAc+L4Q58hltEIOZ74YSCV9zDDp6OMxf4
         qH0T+q9XCBd+ZgIeB1bv+ytGUb3kAz5ES1n89VID7jxyoZFqbo4GlpOV2Vj2ndDDr/Kb
         PksQYndTuT3VS9Y3MOUlBAqYG16xQemKCRBN3PNRe6ZlisJbkxLzw5BQRu7LenmoxsPU
         JjnUZX1GSM3NKtN6MzJWi3qYaubuCVsPgcUIitxo5SSkNPSFW/Lri1j78pZeYVoWmz+H
         +HxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0aRRXBtZb+hy22RXdopCiR4Dh10/8NCNmYlBCBZj4RlawukI/0GtcRMhBGgXImfKvI3akDMNP++CDd4P6@vger.kernel.org
X-Gm-Message-State: AOJu0YyI3CoMhU5SECblLlzAb41FHtqdp9iZPsjV4dPm4qxUqi25Otaq
	hZykRYRVf7rBsChQkIIeM/8LqpcCorRWxwZp73TZ8h+WyLk4n+Hg3eMOILnUlzI=
X-Gm-Gg: ASbGncvdLS/nvjyGCh2VuON1Fc7fdlISTcsxWmPBEodRbJiJ5zuJhvSBS/PA1q4E+35
	ZKzwMTYXA3Q2Iz2X7u8P+nQ00PVdyYGPStcMOC/9gH3A1L29WzaM9dVUwT69eL3MjzQEe5E8ILC
	uhPz49/teCoAmuZ2hlGD+2Pd1GMFYb0WdM+/4MsulkkmR3FaY6Spn991lGsYNNT8FFlN9hZu8A0
	mw4/L/YXeFtmD41g+9l4iTgrbGyv4ErJBvwCDN4U/6imejsBATEPqMXLstQQSivE5Dnii422y/5
	zqgStdpqvfY39cXHvnZBsNbJQU6PvhOdWgOvpIe/Zu9TN4tFdkMzlQUX1kSm
X-Google-Smtp-Source: AGHT+IENeSO7SdQX1wA+LznM3S48DXfC8H8DlOH/8cEqpLDj4dPtBtGzAftqKzC/6B8p5rtafrPe3w==
X-Received: by 2002:a05:6512:ac7:b0:542:2934:71a7 with SMTP id 2adb3069b0e04-5439c24626amr9424531e87.15.1737618503461;
        Wed, 22 Jan 2025 23:48:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78683sm2519992e87.242.2025.01.22.23.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 23:48:23 -0800 (PST)
Date: Thu, 23 Jan 2025 09:48:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <fm4wxyu7dv7wzz6szwtz4vyukzxmzajtzqlidaed4hcrabhpe2@eqw6vimhzkjm>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
 <bmg5em2f673vis6wwtjx6ibkhee7d3zocwesgoafsgt5jxbfqn@w73y6gmzbamj>
 <53ce4792-6eca-42ae-b5d7-24d524697344@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53ce4792-6eca-42ae-b5d7-24d524697344@quicinc.com>

On Thu, Jan 23, 2025 at 11:16:41AM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 10/7/2024 7:27 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 07, 2024 at 02:15:15PM GMT, Ekansh Gupta wrote:
> >> InvokeV2 request is intended to support multiple enhanced invoke
> >> requests like CRC check, performance counter enablement and polling
> >> mode for RPC invocations. CRC check is getting enabled as part of
> >> this patch. CRC check for input and output argument helps in ensuring
> >> data consistency over a remote call. If user intends to enable CRC
> >> check, first local user CRC is calculated at user end and a CRC buffer
> >> is passed to DSP to capture remote CRC values. DSP is expected to
> >> write to the remote CRC buffer which is then compared at user level
> >> with the local CRC values.
> > This doesn't explain why this is necessary. Why do you need to checksum
> > arguments?
> This helps if the user suspects any data inconsistencies in the buffers passed to DSP over
> remote call. This is not enabled by default and user can enable it as per their reqirement.
> I'll add this information.

An inconsistency where? Between the kernel and the DSP? Between the user
and the DSP? Does it cover buffer contents or just the addresses?

> >
> > Also, what if the DSP firmware doesn't support CRC? How should userspace
> > know that?
> CRC support on DSP is there since long time(>6years).

This doesn't give us a lot. Upstream kernel supports fastrpc since
MSM8916 and MSM8996. Do those platforms support CRC?
And if they do, why do we need the invoke_v2? Can we modify existing
code instead?

> From user space CRC check failure is
> not fatal and is printed as a warning. But if copy of CRC to user fails, it will result in remote
> call failure. Should I keep it as fatal considering that ever very old DSP support this or should
> I consider the copy failure as non-fatal as userspace is treating this as a warning?

warnings can remain unseen for a long time. Consider a GUI app. Nobody
is there to view kernel warnings or library output.

> >
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c      | 161 ++++++++++++++++++++++++------------
> >>  include/uapi/misc/fastrpc.h |   7 ++
> >>  2 files changed, 116 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 74181b8c386b..8e817a763d1d 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -573,13 +573,15 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
> >>  
> >>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>  			struct fastrpc_user *user, u32 kernel, u32 sc,
> >> -			struct fastrpc_invoke_args *args)
> >> +			struct fastrpc_invoke_v2 *inv2)
> >>  {
> >>  	struct fastrpc_channel_ctx *cctx = user->cctx;
> >>  	struct fastrpc_invoke_ctx *ctx = NULL;
> >> +	struct fastrpc_invoke_args *args = NULL;
> > Why do you need to init to NULL if you are going to set it two lines
> > below?
> >
> >>  	unsigned long flags;
> >>  	int ret;
> >>  
> >> +	args = (struct fastrpc_invoke_args *)inv2->inv.args;
> > Why does it need a typecast?
> >
> >>  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> >>  	if (!ctx)
> >>  		return ERR_PTR(-ENOMEM);
> >> @@ -611,6 +613,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>  	/* Released in fastrpc_context_put() */
> >>  	fastrpc_channel_ctx_get(cctx);
> >>  
> >> +	ctx->crc = (u32 *)(uintptr_t)inv2->crc;
> > Oh, but why? Also is it a user pointer or in-kernel data? If it's a
> > user-based pointer, where is the accessiblity check? Why isn't it
> > annotated properly?
> This is a user pointer where the crc data is expected to be copied. There is no
> other access to this pointer from kernel. I'm planning to change the data type
> for crc as (void __user*) inside fastrpc_invoke_ctx structure.

Yes, please. Also make sure that sparse doesn't add any warnings
regarding pointer conversions.

> >
> >>  	ctx->sc = sc;
> >>  	ctx->retval = -1;
> >>  	ctx->pid = current->pid;
> >> @@ -1070,6 +1073,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>  	struct fastrpc_invoke_buf *list;
> >>  	struct fastrpc_phy_page *pages;
> >>  	u64 *fdlist;
> >> +	u32 *crclist;
> >>  	int i, inbufs, outbufs, handles;
> >>  
> >>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> >> @@ -1078,6 +1082,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
> >>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> >>  	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
> >> +	crclist = (u32 *)(fdlist + FASTRPC_MAX_FDLIST);
> > I think we should rewrite this parsing somehow. Is the format of data
> > documented somewhere?
> fdlist, crclist and poll(planned) are the only pointers that is being used. I'm planning
> to store these pointers to ctx structure and directly use it wherever needed. This will
> clean-up this unnecessary calculations at multiple places.


Please do. Nevertheless, the format also must be documented.

> >
> >>  
> >>  	for (i = inbufs; i < ctx->nbufs; ++i) {
> >>  		if (!ctx->maps[i]) {
> >> @@ -1102,6 +1107,12 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>  			fastrpc_map_put(mmap);
> >>  	}
> >>  
> >> +	if (ctx->crc && crclist && rpra) {
> >> +		if (copy_to_user((void __user *)ctx->crc, crclist,
> >> +				FASTRPC_MAX_CRCLIST * sizeof(u32)))
> > Oh, so it's a user pointer. Then u32* was completely incorrect.
> > Also you are copying FASTRPC_MAX_CRCLIST elements. Are all of them
> > filled? Or are we leaking some data to userspace?
> Yes, right. Planning clean-up in next patch.
> 
> All of FASTRPC_MAX_CRCLIST is filled with crc data by DSP so copying should be fine.

Huh? I definitely want to see documentation for function arguments.

> >
> >> +			return -EFAULT;
> >> +	}
> >> +
> >>  	return 0;
> >>  }
> >>  
> >> @@ -1137,13 +1148,12 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
> >>  
> >>  }
> >>  
> >> -static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
> >> -				   u32 handle, u32 sc,
> >> -				   struct fastrpc_invoke_args *args)
> >> +static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct fastrpc_invoke_v2 *inv2)
> > Please don't touch what doesn't need to be touched. You are replacing
> > handle/sc/args with inv2, not touching the first line.
> Ack.
> >
> >>  {
> >>  	struct fastrpc_invoke_ctx *ctx = NULL;
> >>  	struct fastrpc_buf *buf, *b;
> >> -
> >> +	struct fastrpc_invoke inv;
> >> +	u32 handle, sc;
> >>  	int err = 0;
> >>  
> >>  	if (!fl->sctx)
> >> @@ -1152,12 +1162,15 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
> >>  	if (!fl->cctx->rpdev)
> >>  		return -EPIPE;
> >>  
> >> +	inv = inv2->inv;
> >> +	handle = inv.handle;
> >> +	sc = inv.sc;
> >>  	if (handle == FASTRPC_INIT_HANDLE && !kernel) {
> >>  		dev_warn_ratelimited(fl->sctx->dev, "user app trying to send a kernel RPC message (%d)\n",  handle);
> >>  		return -EPERM;
> >>  	}
> >>  
> >> -	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
> >> +	ctx = fastrpc_context_alloc(fl, kernel, sc, inv2);
> >>  	if (IS_ERR(ctx))
> >>  		return PTR_ERR(ctx);
> >>  
> >> @@ -1239,6 +1252,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  {
> >>  	struct fastrpc_init_create_static init;
> >>  	struct fastrpc_invoke_args *args;
> >> +	struct fastrpc_invoke_v2 ioctl = {0};
> > Why do you need to init it?
> Ack.
> >
> >>  	struct fastrpc_phy_page pages[1];
> >>  	char *name;
> >>  	int err;
> >> @@ -1248,7 +1262,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  		u32 namelen;
> >>  		u32 pageslen;
> >>  	} inbuf;
> >> -	u32 sc;
> >>  
> >>  	args = kcalloc(FASTRPC_CREATE_STATIC_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
> >>  	if (!args)
> >> @@ -1313,10 +1326,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  	args[2].length = sizeof(*pages);
> >>  	args[2].fd = -1;
> >>  
> >> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
> >> -
> >> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> >> -				      sc, args);
> >> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> >> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
> >> +	ioctl.inv.args = (u64)args;
> > Can you pass it as is, without typecasts?
> Cleaned up in refactoring change.
> >
> >> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
> >>  	if (err)
> >>  		goto err_invoke;
> >>  
> >> @@ -1357,6 +1370,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> >>  {
> >>  	struct fastrpc_init_create init;
> >>  	struct fastrpc_invoke_args *args;
> >> +	struct fastrpc_invoke_v2 ioctl = {0};
> >>  	struct fastrpc_phy_page pages[1];
> >>  	struct fastrpc_map *map = NULL;
> >>  	struct fastrpc_buf *imem = NULL;
> >> @@ -1370,7 +1384,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> >>  		u32 attrs;
> >>  		u32 siglen;
> >>  	} inbuf;
> >> -	u32 sc;
> >>  	bool unsigned_module = false;
> >>  
> >>  	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
> >> @@ -1444,12 +1457,12 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> >>  	args[5].length = sizeof(inbuf.siglen);
> >>  	args[5].fd = -1;
> >>  
> >> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
> >> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> >> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
> >>  	if (init.attrs)
> >> -		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
> >> -
> >> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> >> -				      sc, args);
> >> +		ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
> > if (init.attrs)
> >     ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
> > else
> >     ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
> >
> >> +	ioctl.inv.args = (u64)args;
> >> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
> >>  	if (err)
> >>  		goto err_invoke;
> >>  
> >> @@ -1501,17 +1514,18 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
> >>  static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
> >>  {
> >>  	struct fastrpc_invoke_args args[1];
> >> +	struct fastrpc_invoke_v2 ioctl = {0};
> >>  	int tgid = 0;
> >> -	u32 sc;
> >>  
> >>  	tgid = fl->tgid;
> >>  	args[0].ptr = (u64)(uintptr_t) &tgid;
> >>  	args[0].length = sizeof(tgid);
> >>  	args[0].fd = -1;
> >> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
> >>  
> >> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> >> -				       sc, &args[0]);
> >> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> >> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
> >> +	ioctl.inv.args = (u64)args;
> >> +	return fastrpc_internal_invoke(fl, true, &ioctl);
> >>  }
> >>  
> >>  static int fastrpc_device_release(struct inode *inode, struct file *file)
> >> @@ -1647,45 +1661,77 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
> >>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
> >>  {
> >>  	struct fastrpc_invoke_args args[1];
> >> +	struct fastrpc_invoke_v2 ioctl = {0};
> >>  	int tgid = fl->tgid;
> >> -	u32 sc;
> >>  
> >>  	args[0].ptr = (u64)(uintptr_t) &tgid;
> >>  	args[0].length = sizeof(tgid);
> >>  	args[0].fd = -1;
> >> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
> >>  	fl->pd = pd;
> >>  
> >> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> >> -				       sc, &args[0]);
> >> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> >> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
> >> +	ioctl.inv.args = (u64)args;
> >> +	return fastrpc_internal_invoke(fl, true, &ioctl);
> >>  }
> >>  
> >> -static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
> >> +static int fastrpc_copy_args(struct fastrpc_invoke *inv)
> >>  {
> >>  	struct fastrpc_invoke_args *args = NULL;
> >> -	struct fastrpc_invoke inv;
> >>  	u32 nscalars;
> >> -	int err;
> >> -
> >> -	if (copy_from_user(&inv, argp, sizeof(inv)))
> >> -		return -EFAULT;
> >>  
> >>  	/* nscalars is truncated here to max supported value */
> >> -	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
> >> +	nscalars = REMOTE_SCALARS_LENGTH(inv->sc);
> >>  	if (nscalars) {
> >>  		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
> >>  		if (!args)
> >>  			return -ENOMEM;
> >>  
> >> -		if (copy_from_user(args, (void __user *)(uintptr_t)inv.args,
> >> +		if (copy_from_user(args, (void __user *)(uintptr_t)inv->args,
> > Wait... So inv->args is a user pointer? Then how can you assign a
> > kernel-based pointer to the same field? I think you need to sanitize
> > your structures. One is userspace-facing. It should be using userspace
> > data pointers, etc. Another one is a kernel representation of the ioctl
> > args. It might have a different structure, it shouldn't contain __user
> > data, etc.
> I'm planning to have a new structure to carry ctx specific data which will be saved in
> fastrpc_invoke_ctx structure during fastrpc_context_alloc.
> 
> Something like this:
> struct fastrpc_ctx_args {
>     struct fastrpc_invoke_args *args;  /* Carries args that is copied from ioctl structure */
>     void __user *crc; /* Carries CRC user pointer where the crcdata from DSP will be copied for user to read */
>     u64 poll_timeout; /* Carried context specific poll_timeout information */
> };
> 
> Do you see any problem with this?

Not yet. But I'd like to see patches first.

> >
> >>  				   nscalars * sizeof(*args))) {
> >>  			kfree(args);
> >>  			return -EFAULT;
> >>  		}
> >>  	}
> >> +	inv->args = args;
> >>  
> >> -	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, args);
> >> -	kfree(args);
> >> +	return 0;
> >> +}
> > Looking at the rest of the code, I think the patch needs to be split.
> > CRC is the minor issue at this point, please focus on getting existing
> > data being handled correctly while refactoring the code to use new
> > structure. I'd suggest seeing two struct definitions: one for the
> > userspace and another one for the kernel space.
> I've made changes for refactoring where instead of using userspace structure, I'm
> planning to use fastrpc_ctx_args structure mentioned above.
> >
> >> +
> >> +static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
> >> +{
> >> +	struct fastrpc_invoke_v2 ioctl = {0};
> >> +	struct fastrpc_invoke inv;
> >> +	int err;
> >> +
> >> +	if (copy_from_user(&inv, argp, sizeof(inv)))
> >> +		return -EFAULT;
> >> +
> >> +	err = fastrpc_copy_args(&inv);
> >> +	if (err)
> >>
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry

