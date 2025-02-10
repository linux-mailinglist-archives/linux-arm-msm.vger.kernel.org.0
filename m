Return-Path: <linux-arm-msm+bounces-47408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 672AAA2E999
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398601886418
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E227E1C5F1F;
	Mon, 10 Feb 2025 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D/i7Z0ny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83CF1C5F0C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183762; cv=none; b=WaXKCIakUH3aeZ0ccbskWS58RVAXDL0dfpNPXUD7F7oNWsilqYeqHow5J+WmS/wSm8lFKukfcxb92X8X0XFZtU9ESbL2yl9VBVyyekySnN3rckCUg7hurDupxjmVx/tG/hIsFaNCA+sSSZn2EbwRU3MOLcyiWxuQuiSE/JHkv6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183762; c=relaxed/simple;
	bh=z8keGltcRYdS4CnFon956qG2ds2eIQuQFhCD7k+/4V4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYrxRQHDrJYvrAZ3uwUtmVdze3ZnCjNiTZsUTDX6FtoQ8DiX2SvvTgZSGao2TObgczhKQwPkD1XfWGd1WdXe5mSXYALxNVQkGXpg/jcubo3cF0Lu0xCgvXKaIRclPs6BHAJRO1zTMp8ve9ZBiPxF8qSwUVeKlX/xCUjxg3vVB/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D/i7Z0ny; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ef7c9e9592so32020457b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 02:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739183758; x=1739788558; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7LztZBr9UCNRH3665/itmC4BjC9OAqgTvSMO1KGR3xk=;
        b=D/i7Z0nyQC+Wm4LvdbJl6APMnJkNid13YSpNeEB/mvgB1xmlqMiV/kTGUuv8yKqUOg
         8gJnCoN3wOvE98fLZqclrXxQf2Px/dzNpFS2G/MyZqphMTUdb8/Sc++uLuSO+q2iY1Lg
         rWsoddA5CW9HEijSJFJX0cNJYKcypHEhwh2i6fbwhh0jxpFUbtV8krXiJRvpTfy3nhEo
         jz551ni1p/r+agr0JW5HbXuSyOkm/T3twrg+bCI7J2pg5m/SyRZNVUpDA4dCONYQkPli
         gfK/qJDmvx1DMYEY5Uc0XuV/5GemLYUGHbk5ulOkkL3EcmUeYmRMFHbJw+Dkh1gr4l5X
         RBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183758; x=1739788558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LztZBr9UCNRH3665/itmC4BjC9OAqgTvSMO1KGR3xk=;
        b=nvwx/e5M6Ws9zUBL5EfudQlW0VcAGNr3pFSFxAuZlPJGnbfDlrrFtWeKMPU6afL2s2
         We2zuhAK7qPehE8s4bCJRqZ7oLLa62GvyDWa5jSkmSlKuQ7bIFCVH/51cMGWEUbYohFA
         3CfxVIMpMt7hYwmc/NOievQ/5s1biejNF4CyPnMETkMIVrNhCJWtbb3owHgMz5LWvJqS
         uVUXozu5rvUd0/Fxfyx3ru/6m+GeUR1bsgC/dEeH0DekxmfFTtdGPAuNCvIkttrfjOUE
         HPaZ1zFnag+lvyE73s09buY9Wc8BDJNn/RB1qEfV7LW1C/1E89vhQZ2KKxbdNZJot5/H
         24ig==
X-Forwarded-Encrypted: i=1; AJvYcCW3Woob7FjRog8lXdHPujsn+ahPwWoHdVLa32+sRRahCu0IhvwrWvHE6qHYRUjq6Xr2yUEAOMBi4CZRGdOr@vger.kernel.org
X-Gm-Message-State: AOJu0YwJonJN0e7jN5NFhoKtsAU+Vnn8eoZ77UzpL+nzZ0EhnW3v3LrY
	KA9qrWDunECVo5scH3cvzFEGRqN7/27ksu1S2dbgY/mWlbMoRh21KtYkpjGIjqEFJ2jZYglY6Fq
	h3Qf2F3oStyq8A9ZRG7vK5LSgAUZA4Sle62kvZA==
X-Gm-Gg: ASbGncsmTMOTxIB+bmOsInS9cHhtTpYUjO5I8ZEtSG/HXWK/1R696gjEDxzPc84g8bR
	4V0aq2uTS0yckUs8q0CBJorRlSyeH0pm+B17xwhfxmfQX/kvvSpFO/1xnnNna4WdGmJgurEHTcU
	pV9h0Fajm6/2A=
X-Google-Smtp-Source: AGHT+IHt8hQwFd2lr2bqG242EFIHlbAYjCytUcpkE4iweROj/UMkohB1x0JR7pFoKeYm/Ay9mFUX1xMElnfFd5zGBZw=
X-Received: by 2002:a05:690c:610a:b0:6f9:87da:b763 with SMTP id
 00721157ae682-6f9b2818c4bmr98338027b3.12.1739183758565; Mon, 10 Feb 2025
 02:35:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-6-quic_ekangupt@quicinc.com> <im7gi5ib7wnihu3ff4a2erqctne2pm2zf3wl4qmuejz4dfhf7e@z5au6vnm5por>
 <08b469b8-2339-4fde-9472-fcaadbb4ed87@quicinc.com> <jeixk4dmk53ubnujop3sp2lc6jffugjmzndmmqmyuft7uquibt@s2h2dgj7yj7h>
 <053dd6d6-9ca2-4723-8c21-da4093f00e03@quicinc.com>
In-Reply-To: <053dd6d6-9ca2-4723-8c21-da4093f00e03@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Feb 2025 12:35:46 +0200
X-Gm-Features: AWEUYZmraPlEmdmws6gXHl7rBHz9XPzrdqwD1L7uBe0XsCT7vz2EaVFBgVPPQ0k
Message-ID: <CAA8EJppDK8MZw0s-2sOM9mf3smRfqCcyy=opq0dEF0AOCnWraA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] misc: fastrpc: Modify context id mask to support
 polling mode
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
	dri-devel@lists.freedesktop.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 11:05, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
>
> On 1/29/2025 4:53 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 29, 2025 at 11:13:05AM +0530, Ekansh Gupta wrote:
> >>
> >>
> >> On 1/29/2025 5:00 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Jan 27, 2025 at 10:12:39AM +0530, Ekansh Gupta wrote:
> >>>> DSP needs last 4 bits of context id to be 0 for polling mode to be
> >>>> supported as setting of last 8 is intended for async mode(not yet
> >>>> supported on upstream driver) and setting these bits restrics
> >>>> writing to poll memory from DSP. Modify context id mask to ensure
> >>>> polling mode is supported.
> >>> Shouldn't this commit come before the previous one?
> >> Yes, I'll change the order in next series.
> >>
> >> Thanks for reviewing the changes.
> > Please consider asking somebody for the internal review before sending
> > patches. This should help you to catch such mistakes.
> >
> > Next, I keep on asking for a sensible userspace and testing suite. No,
> > existing fastrpc doesn't pass that criteria. We have discussed that, but
> > I see no changes in the development. The PR that you've linked in the
> > cover letter contains a single commit, covering documentation, new
> > IOCTL, CRC support, poll mode support, etc. What if the discussion ends
> > up accepting the CRC support but declining the polling mode? Or vice
> > versa, accepting poll mode but declining the CRC support? There is no
> > easy way for us to review userspace impact, corresponding changes, etc.
>
> We are working with our Legal team to push HexagonSDK publicly , that  will
> have sample apps for all features supported by upstream driver and can be used
> for testing.
>
> I'll break down the PR to multiple meaningful commits based on the features
> that are getting added.
>
> >
> > Last, but not least: I want to bring up Sima's response in one of the
> > earlier discussions ([1]): "Yeah, if fastrpc just keeps growing the
> > story will completely different."
> >
> > You are adding new IOCTL and new ivocation API. That totally sounds
> > like "keeps growing", which returns us back to the uAPI question,
> > drm_accel.h and the rest of the questions on the userspace, compiler,
> > etc.
> >
> > [1] https://lore.kernel.org/dri-devel/Znk87-xCx8f3fIUL@phenom.ffwll.local/
>
> Currently, we are upstreaming the features supported on DSP for publicly
> available platforms. No features for future platforms are planned for FastRPC
> driver.
>
> We are also looking in having the driver under drivers/accel for any new features
> that are planned in future platforms.

Granted that there is a single driver, supporting all platforms, I
don't think that supporting new vs old platforms makes any sense.
The message from Sima was about growing the driver / uAPI. From my
point of view, adding a new IOCTL points out active driver development
(from the upstream kernel point of view).
Please talk to your only upstream users - libssc / hexagonrpcd
developers. It should be them reviewing your uAPI changes, not just
me.

And yes, from my side, the question would be the same: if you are
adding a new uAPI, why is it not following drm_accel.h? "It has been
done this way ages ago" isn't an answer for _new_ IOCTLs.

>
> --ekansh
>
> >
> >
> >> --ekansh
> >>
> >>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc.c | 8 ++++----
> >>>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>> index 257a741af115..ef56c793c564 100644
> >>>> --- a/drivers/misc/fastrpc.c
> >>>> +++ b/drivers/misc/fastrpc.c
> >>>> @@ -40,7 +40,7 @@
> >>>>  #define FASTRPC_INIT_HANDLE       1
> >>>>  #define FASTRPC_DSP_UTILITIES_HANDLE      2
> >>>>  #define FASTRPC_MAX_STATIC_HANDLE (20)
> >>>> -#define FASTRPC_CTXID_MASK (0xFF0)
> >>>> +#define FASTRPC_CTXID_MASK (0xFF0000)
> >>>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >>>>  #define INIT_FILE_NAMELEN_MAX (128)
> >>>>  #define FASTRPC_DEVICE_NAME       "fastrpc"
> >>>> @@ -524,7 +524,7 @@ static void fastrpc_context_free(struct kref *ref)
> >>>>            fastrpc_buf_free(ctx->buf);
> >>>>
> >>>>    spin_lock_irqsave(&cctx->lock, flags);
> >>>> -  idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> >>>> +  idr_remove(&cctx->ctx_idr, ctx->ctxid >> 16);
> >>>>    spin_unlock_irqrestore(&cctx->lock, flags);
> >>>>
> >>>>    kfree(ctx->maps);
> >>>> @@ -664,7 +664,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>>>            spin_unlock_irqrestore(&cctx->lock, flags);
> >>>>            goto err_idr;
> >>>>    }
> >>>> -  ctx->ctxid = ret << 4;
> >>>> +  ctx->ctxid = ret << 16;
> >>>>    spin_unlock_irqrestore(&cctx->lock, flags);
> >>>>
> >>>>    kref_init(&ctx->refcount);
> >>>> @@ -2675,7 +2675,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
> >>>>    if (len < sizeof(*rsp))
> >>>>            return -EINVAL;
> >>>>
> >>>> -  ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> >>>> +  ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 16);
> >>>>
> >>>>    spin_lock_irqsave(&cctx->lock, flags);
> >>>>    ctx = idr_find(&cctx->ctx_idr, ctxid);
> >>>> --
> >>>> 2.34.1
> >>>>
>


-- 
With best wishes
Dmitry

