Return-Path: <linux-arm-msm+bounces-39047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B89D7B7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 07:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45421281D8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 06:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EE517E8F7;
	Mon, 25 Nov 2024 06:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ywRKjc7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43C116F0E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732515285; cv=none; b=r8MxD/89kc/fSW1eWR8TFzjhwDOsUNLb2CLWViFpppW2abQKPwZgWMvtW8yO58mQicpJbafcuBURijwzFrnOHMKfSVBqJCJy37Dz6jayJXnWQYEHpyFgsx8nREjzC3Xs16+phKvrC5++Qp4sJpPf/bB7QzqZ34SqhmyIXnZ99Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732515285; c=relaxed/simple;
	bh=cywJT1P2ID6SjaGpN2h2l0WCULKEWjCHNgrDcPYP9po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l97Fm/z8NrdL4SVqO8WvmIp4sSCrc9BgdFIltsMGWdHiPDCBq54ZIWxuNn4LsUcUInucPgLvFQyZJMUdCiFxnLwWMRrBwSWRWf1C/gmENaaaQYM6cMtyUINB/X96RWwdr6/Abpn0sUcD/NYgQ15mZ7vopqTILa6VtTGIe4eescI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ywRKjc7w; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85715f21c82so1051146241.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Nov 2024 22:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732515282; x=1733120082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izaxiE/7iH2YFBidpMQ+bdsFs7wgOusWpoiEObVlqYM=;
        b=ywRKjc7wXRJkFx2W9BwnIg8TmikUB+Vr6n8WQz5elLv/L0Ih4Pp6tcCovn8vr0ecpt
         M/4fxwnK0eJICf8KEUuzejQ7hBc2xPfstkkPiotvXksAgDc8/yCk2UJDPqU3UvrPwsR/
         6tSNLO2zOG15eUgtpCbwZLscJBU4AqRqYNUoT0BWvD4daF5OabYJVWGmIW1coyrl3GtY
         dqeACi8TyHw46mYBU5Nl8Ch0MKx0XQO9XGs+pIbgPHWQ2JZ8T9m1ecwS9VwKNUhZvzeo
         HDKVuk3OjMbPtUlr58wtH3oxdSRMLd3FIxE7sJeHwTJRRGp74lhHjTJCxDFHoYruWjKW
         QotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732515282; x=1733120082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izaxiE/7iH2YFBidpMQ+bdsFs7wgOusWpoiEObVlqYM=;
        b=rztlnzR0HHT9nMIkkA4SBko/JPytRw5mBGUFXrzLagpZ8HfFfXCcKvQhaN0YN0X3fq
         Y9C2OQC4BEG3++/4Nm7GAcFY8Ed7tjgrFh/reYwIoElMi3XhC5wxp4kvGHUapRAJDik2
         16SVUykQtRJRtDx03eAn+AWLkOFAVe/MvRr2ikciBW3bwba3eRdCzo0SE15RPEN25NtM
         Ny2ZdKdbAvrvcAwuPhzdIyY4no94fwbREdFwYxgtaKCRk9uKd3Ue61Xw2NPwHcDG+yFM
         JHQpVBtg4fADLVdeduGPWy1WJ400aLXkuBu4q17ENYeGEvxyczDidX8ZLISiMKYv9WTu
         BuHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG4ASvrk0/M42gGglmcznU9uIf8eqij3UzVwUjNjEImkxHpHa3qtfyPbwi/m9NMFbv48qZLbAfuFeoLbnY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoo7SZ72lwvuk5D0854ku+RhkppYJZCDdlx2Bh0AhWuSh9u7X1
	xQPJ3c0Ss+l8RxggN97WjSKdJuwpiEmcSp/4xESxVVSBeiFbET1pOmNLxpwuYhqRLS9mZe4D//r
	H/enEIHHcJk166ogftASELcbI1znrxldqAIxcsXFa+8kTh8oMXTE=
X-Gm-Gg: ASbGnctXPntEH8Fz0s95FAwI1zHG6a4kJEVyXDvSyfWpe/0eWg2Yd86YJgYHinlFi8D
	129OaxA/ADeihuO7cwe9+p8Q2rCO3j+Gx+A==
X-Google-Smtp-Source: AGHT+IHo0k9b09a1pUXUIUBBkTTKUvlF/WMfMbSffUorXACHyHZhvUjBs5iTLTlXMKFvNS3cZCwifZxu/btB52kTp8w=
X-Received: by 2002:a05:6102:3f49:b0:4a8:ffbb:5531 with SMTP id
 ada2fe7eead31-4addcece627mr10051933137.25.1732515281665; Sun, 24 Nov 2024
 22:14:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-fix-tee_shm-refcount-upstream-v1-0-5da97f584fcd@quicinc.com>
 <20241120-fix-tee_shm-refcount-upstream-v1-3-5da97f584fcd@quicinc.com>
 <CAHUa44Eoxa+NfRF-XCuV-O5uVgtC3UMT0utCLrUZ4rCBREp=pQ@mail.gmail.com>
 <3ab115bf-7ac6-452f-b760-0d631b6e75dd@quicinc.com> <CAFA6WYNBsZ5V6N676yfDgTL4jMeXtEB0xGm5zSq3BFeeCpz9Nw@mail.gmail.com>
 <a4e474c2-80b7-45db-b1a0-37950168edf0@quicinc.com>
In-Reply-To: <a4e474c2-80b7-45db-b1a0-37950168edf0@quicinc.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 25 Nov 2024 11:44:30 +0530
Message-ID: <CAFA6WYOvMnvdhLvgOzLMyugRLPc62pHdJEGAhhwDJHRrVxCs1Q@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Nov 2024 at 03:00, Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
>
> Hi Sumit,
>
> Thank you so much for the comemnts :).
>
> On 11/23/2024 9:32 PM, Sumit Garg wrote:
> > Hi Amirreza,
> >
> > Thanks for proposing this.
> >
> > On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
> > <quic_azarrabi@quicinc.com> wrote:
> >>
> >>
> >> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
> >>
> >> Hi Jens,
> >>
> >>> Hi Amirreza,
> >>>
> >>> On Thu, Nov 21, 2024 at 2:37=E2=80=AFAM Amirreza Zarrabi
> >>> <quic_azarrabi@quicinc.com> wrote:
> >>>>
> >>>> The default context has a lifespan similar to the tee_device.
> >
> > Since it's associated with tee_device context, let's call it obvious
> > via renaming it as device context instead (s/def_ctx/dev_ctx/ in this
> > patch).
> >
>
> Make sense, I'll rename it.
>
> >>>> It is used as a context for shared memory if the context to which th=
e
> >>>> shared memory belongs is released, making the tee_shm an orphan.
> >>>> This allows the driver implementing shm_unregister to safely make
> >>>> subsequent calls, such as to a supplicant if needed.
> >>>>
> >>>> It also enables users to free the shared memory while the driver is
> >>>> blocked on unregister_tee_device safely.
> >>>>
> >>>> Preferably, this should be used for all driver internal uses, using
> >>>> teedev_get_def_context rather than calling teedev_open.
> >
> > Makes sense to me.
> >
> >>>>
> >>>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> >>>> ---
> >>>>  drivers/tee/optee/core.c    |  2 +-
> >>>>  drivers/tee/optee/ffa_abi.c |  2 +-
> >>>>  drivers/tee/optee/smc_abi.c |  2 +-
> >>>>  drivers/tee/tee_core.c      | 83 +++++++++++++++++++++++++++++-----=
-----------
> >>>>  drivers/tee/tee_private.h   |  3 --
> >>>>  drivers/tee/tee_shm.c       | 18 ++--------
> >>>>  include/linux/tee_core.h    | 15 ++++++++
> >>>>  include/linux/tee_drv.h     |  7 ----
> >>>>  8 files changed, 73 insertions(+), 59 deletions(-)
> >>>>
> >>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> >>>> index c75fddc83576..78d43d0c8014 100644
> >>>> --- a/drivers/tee/optee/core.c
> >>>> +++ b/drivers/tee/optee/core.c
> >>>> @@ -173,7 +173,7 @@ void optee_remove_common(struct optee *optee)
> >>>>
> >>>>         optee_notif_uninit(optee);
> >>>>         optee_shm_arg_cache_uninit(optee);
> >>>> -       teedev_close_context(optee->ctx);
> >>>> +
> >>>>         /*
> >>>>          * The two devices have to be unregistered before we can fre=
e the
> >>>>          * other resources.
> >>>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi=
.c
> >>>> index f3af5666bb11..6ad94f0788ad 100644
> >>>> --- a/drivers/tee/optee/ffa_abi.c
> >>>> +++ b/drivers/tee/optee/ffa_abi.c
> >>>> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct ffa_device *ff=
a_dev)
> >>>>         optee_shm_arg_cache_init(optee, arg_cache_flags);
> >>>>         mutex_init(&optee->rpmb_dev_mutex);
> >>>>         ffa_dev_set_drvdata(ffa_dev, optee);
> >>>> -       ctx =3D teedev_open(optee->teedev);
> >>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> >>>>         if (IS_ERR(ctx)) {
> >>>>                 rc =3D PTR_ERR(ctx);
> >>>>                 goto err_rhashtable_free;
> >>>> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi=
.c
> >>>> index e9456e3e74cc..c77a3e631d04 100644
> >>>> --- a/drivers/tee/optee/smc_abi.c
> >>>> +++ b/drivers/tee/optee/smc_abi.c
> >>>> @@ -1722,7 +1722,7 @@ static int optee_probe(struct platform_device =
*pdev)
> >>>>         mutex_init(&optee->rpmb_dev_mutex);
> >>>>
> >>>>         platform_set_drvdata(pdev, optee);
> >>>> -       ctx =3D teedev_open(optee->teedev);
> >>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> >>>>         if (IS_ERR(ctx)) {
> >>>>                 rc =3D PTR_ERR(ctx);
> >>>>                 goto err_supp_uninit;
> >>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> >>>> index 93f3b330aec8..805e1336089d 100644
> >>>> --- a/drivers/tee/tee_core.c
> >>>> +++ b/drivers/tee/tee_core.c
> >>>> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(struct tee_device =
*teedev)
> >>>>                 goto err;
> >>>>         }
> >>>>
> >>>> -       kref_init(&ctx->refcount);
> >>>>         ctx->teedev =3D teedev;
> >>>>         INIT_LIST_HEAD(&ctx->list_shm);
> >>>>         rc =3D teedev->desc->ops->open(ctx);
> >>>> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(struct tee_devic=
e *teedev)
> >>>>  }
> >>>>  EXPORT_SYMBOL_GPL(teedev_open);
> >>>>
> >>>> -void teedev_ctx_get(struct tee_context *ctx)
> >>>> +struct tee_context *teedev_get_def_context(struct tee_device *teede=
v)
> >>>>  {
> >>>> -       if (ctx->releasing)
> >>>> -               return;
> >>>> +       int rc;
> >>>> +       struct tee_context *ctx =3D &teedev->def_ctx;
> >>>>
> >>>> -       kref_get(&ctx->refcount);
> >>>> -}
> >>>> +       ctx->teedev =3D teedev;
> >>>> +       INIT_LIST_HEAD(&ctx->list_shm);
> >>>> +       rc =3D teedev->desc->ops->open(ctx);
> >>>> +       if (rc)
> >>>> +               return ERR_PTR(rc);
> >>>
> >>> I think ctx->teedev and ctx->list_shm must always be initialized or
> >>> &teedev->def_ctx can't be used in teedev_close_context().
> >>
> >> True, but &teedev->def_ctx is never used in teedev_close_context().
> >> The closing of the &teedev->def_ctx simply ignored. So once opened,
> >> &teedev->def_ctx will always remain open until the tee_device is alive=
.
> >>
> >>> We could initialize teedev->def_ctx on the first call to teedev_open(=
)
> >>> on that tee_device. We need a way to tell the
> >>> teedev->desc->ops->open() to the backed driver that it's initializing
> >>> the default context though, or optee_open() can't handle the
> >>> tee-supplicant case properly.
> >>>
> >>
> >> That's a good point. This way, it is guaranteed that there is one def_=
ctx
> >> per teedev. There should be a way to tell the open() callback that it =
is
> >> a def_ctx, so it is not registered as a supplicant context.
> >>
> >>
> >>> Should we allow this function to be called more than once for each te=
edev?
> >>
> >> Yes, moving to teedev_open() will fix the issue.
> >>
> >>> Do we need serialization in this function if it's called after the
> >>> driver is probed?
> >>>
> >>
> >> True. I'll make sure there is no race.
> >>
> >>>>
> >>>> -static void teedev_ctx_release(struct kref *ref)
> >>>> -{
> >>>> -       struct tee_context *ctx =3D container_of(ref, struct tee_con=
text,
> >>>> -                                              refcount);
> >>>> -       ctx->releasing =3D true;
> >>>> -       ctx->teedev->desc->ops->release(ctx);
> >>>> -       kfree(ctx);
> >>>> +       return ctx;
> >>>>  }
> >>>> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
> >>>>
> >>>> -void teedev_ctx_put(struct tee_context *ctx)
> >>>> +void teedev_close_context(struct tee_context *ctx)
> >>>>  {
> >>>> -       if (ctx->releasing)
> >>>> +       struct tee_device *teedev =3D ctx->teedev;
> >>>> +       struct tee_shm *shm;
> >>>> +
> >>>> +       if (ctx =3D=3D &teedev->def_ctx)
> >>>>                 return;
> >>>>
> >>>> -       kref_put(&ctx->refcount, teedev_ctx_release);
> >>>> -}
> >>>> +       teedev->desc->ops->release(ctx);
> >>>>
> >>>> -void teedev_close_context(struct tee_context *ctx)
> >>>> -{
> >>>> -       struct tee_device *teedev =3D ctx->teedev;
> >>>> +       mutex_lock(&teedev->mutex);
> >>>> +       list_for_each_entry(shm, &ctx->list_shm, link) {
> >>>> +               /* Context released. However, shm still holding a te=
edev reference.
> >>>> +                * Replace shm->ctx with the default context so that=
 tee_shm_get_from_id()
> >>>> +                * fails (i.e. it is not accessible from userspace) =
but shm still
> >>>> +                * holds a valid context for further clean up, e.g. =
shm_unregister().
> >>>> +                */
> >>>
> >>> /*
> >>>  * Please format
> >>>  * multiline comments
> >>>  * like this. Please
> >>>  * keep the lines at
> >>>  * max 80 columns
> >>>  * here and at other
> >>>  * places in the patch-
> >>>  * set.
> >>>  */
> >>>
> >>
> >> Ack.
> >>
> >>>> +               shm->ctx =3D &teedev->def_ctx;
> >>>
> >>> shm->ctx will always point to a valid context, even if it is the
> >>> default context. It seems that we can always get hold of the correct
> >>> teedev via shm->ctx->teedev. Do we need "tee: revert removal of
> >>> redundant teedev in struct tee_shm"?
> >>>
> >>
> >> It was there in case we wanted to use NULL, but with def_ctx, it is no=
t
> >> necessary. I am withdrawing that commit. :).
> >>
> >>> Shouldn't the shm be removed from the ctx->list_shm and be moved to
> >>> teedev->def_ctx.list_shm?
> >
> > +1
> >
>
> Ack.
>
> >>>
> >>
> >> Not really. If we put shm in the teedev->def_ctx.list_shm, by the time
> >> we are closing the def_ctx, the list is guaranteed to be empty.
> >>
> >> However, I understand it is cleaner and more consistent to do that rat=
her
> >> than making changes to tee_shm_put().
> >>
> >> I'll do it.
> >>
> >>>> +       }
> >>>> +       mutex_unlock(&teedev->mutex);
> >>>>
> >>>> -       teedev_ctx_put(ctx);
> >>>> +       kfree(ctx);
> >>>>         tee_device_put(teedev);
> >>>>  }
> >>>>  EXPORT_SYMBOL_GPL(teedev_close_context);
> >>>> @@ -946,6 +952,8 @@ struct tee_device *tee_device_alloc(const struct=
 tee_desc *teedesc,
> >>>>
> >>>>         teedev->desc =3D teedesc;
> >>>>         teedev->pool =3D pool;
> >>>> +       /* Only open default context when teedev_get_def_context() c=
alled. */
> >>>> +       teedev->def_ctx.teedev =3D NULL;
> >
> > Why don't you open the device context here only? This will associate
> > it automatically with teedev lifespan and then
> > teedev_get_def_context() will just return a reference to that.
> >
> > -Sumit
> >
>
> So my assumption is that the tee_devic_alloc() is called as part of
> the driver initialization; there is no guarantee that at this time the
> driver is actually ready to accept any open() callback.
>

The drivers should be able to handle open() callback since we already
check for !teedesc->ops->open in the beginning of tee_devic_alloc().
Also, we need to open a device context for !TEE_DESC_PRIVILEGED such
that we don't open a supplicant device context there.

-Sumit

