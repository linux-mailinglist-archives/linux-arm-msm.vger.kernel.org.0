Return-Path: <linux-arm-msm+bounces-39055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 043E99D7BEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 08:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89EF91619B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 07:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C19156F3A;
	Mon, 25 Nov 2024 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B7MTIVvA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241C15F41F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732519414; cv=none; b=PIrNklqmKM0je7gqxot+W7CSq/nuEnLUY7Emzcq1m4KlUIpMl9DeksILJ4z1TYQentJh9inM5rxVaMZ+GScIWX+ihViV09brpmqzsMH1nom+zwprePcyGBsDPcLCtXGhaKwUaA9NzkW4Kz96CjJbAA1m8mZ92+ywJDidumWI6M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732519414; c=relaxed/simple;
	bh=DVHc3GquT4nIufcc/hyKfVy/FFTjnthG/avI49p0tpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lY/qwIu4TYOgTgz5ow63H24VxD36T95qNOEhpjq7vxyBoInR1Htaw8kb+5FTe2Ur3oTEy2HGxKh5CgrV7tXypv2rjDnIkpQO8iqalHsfYyUJxPG+TScEsSMvv8yjxaw2iyT6k5Z3WI/h9MBl+REzhb4VTV98MMTjd0om55+bcSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B7MTIVvA; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2965e65ce89so2511227fac.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Nov 2024 23:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732519411; x=1733124211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anQacVNzBDdvU15juUghvBoVjKWhotOsO8MLxea2Zkw=;
        b=B7MTIVvA9LzBCQ3jD8d8ilscw/SEZKw4o/DxxlS1DHHy74Tb/m1pi0Vvskg9qEOcIL
         ULl0b8SNr67NUE49ARWOclTCiICSSmFxCv/j0JZoAnlLpmaCkBOzxRTJ44BnXOYnxmVM
         UjrQz8laAX/Ik2/0hx+z6I/hKswNLGT4PvJYJ89jgP0vQ7l98F5SfzxNHVVpcgpfnBpf
         +x//pvQ4ZHSjOA9wfVc3ituVCoKiYVbYYgSI6UHJ0mzRlHLUwOBO6eBs7zzJ1mePEz2/
         HMZjohKCJsw8Rb226TC9y67SgxxWgwZc7fDFmq1GfOuH0sQ2T6qPaxbnE20ujl6lys8h
         bpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732519411; x=1733124211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anQacVNzBDdvU15juUghvBoVjKWhotOsO8MLxea2Zkw=;
        b=VqGhvgsbauw8w+0bBhahAS30g/FfI8vKkh6jS1wS+R35NVYdMIyD3TNiiafzBqwCSF
         UZHkvuaRJaqfNqWZzHfuVYSEYwVOCdgCCPNymubenbHWvFOS+qeEjo5Hnu5TaWbWZRAh
         lSjiQ1mXY1E2vqvkvVqc/JyXkT07NQxZWALvzSv96X0YUVLDVfvgnLVNjcww9NuibVwx
         m0fJ0Jn6+qnr4yvFe/r+PERcNQ0roCEAVqI4lNXg7IE/tcD/65gz89HQx376f6IY6dlj
         ZoRQMxLW6heyARCLTd8JYipdAF4ama4pTVV9Nq3pjq5QSMaqLLqYsHSTdthynaNgDqZQ
         ePWA==
X-Forwarded-Encrypted: i=1; AJvYcCXIoPBMC/nqTBaG0UU8qpaViO/JHNCMZ+DTEXq/iV6EfbHIAkuCas9Mqx3a5CbzxF6ZUpNaf14pwXXSgI5g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8BfVmlYuiUQ/q+CC3x6nlM1tCjTyjMA5i5KBP/lPT+4q93Ft8
	UNWU6Z6viDO6YtvZTT1h0sAsRi4yHi79qWw3wIBYUH4a4ClCBB4jNuEauBx/rk+CFvYMOfXuo3d
	/WuRA3OmU3fnZchtoKM8J34BoDr0AEJ0qUxAAYA==
X-Gm-Gg: ASbGnct3YKtIl44n0RgBoRdaIhauRqUKTb/Al3dPF4UFuz3Kx4sNvE5/WY1xp23omxm
	j2lp2DUdZ1QrPAxet9ZlbOqG8QaXvGdg=
X-Google-Smtp-Source: AGHT+IGTncXJeTWot6sXu3Q2BFjP60zPNzm3uvyP+I1QeLEXb23FP8GlKqRvCawot1zXDpJi+mGHA/hAhS5HU9yd8oM=
X-Received: by 2002:a05:6871:531b:b0:296:e5d1:277c with SMTP id
 586e51a60fabf-29720ddd31cmr8461755fac.34.1732519411209; Sun, 24 Nov 2024
 23:23:31 -0800 (PST)
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
 <a4e474c2-80b7-45db-b1a0-37950168edf0@quicinc.com> <CAFA6WYOvMnvdhLvgOzLMyugRLPc62pHdJEGAhhwDJHRrVxCs1Q@mail.gmail.com>
In-Reply-To: <CAFA6WYOvMnvdhLvgOzLMyugRLPc62pHdJEGAhhwDJHRrVxCs1Q@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 25 Nov 2024 08:23:19 +0100
Message-ID: <CAHUa44HZbODOx7N4+WiNjQwrjwo7T=bQfZ5N-EjoMmXnfC4-Lg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Amirreza Zarrabi <quic_azarrabi@quicinc.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 7:14=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> On Mon, 25 Nov 2024 at 03:00, Amirreza Zarrabi
> <quic_azarrabi@quicinc.com> wrote:
> >
> >
> > Hi Sumit,
> >
> > Thank you so much for the comemnts :).
> >
> > On 11/23/2024 9:32 PM, Sumit Garg wrote:
> > > Hi Amirreza,
> > >
> > > Thanks for proposing this.
> > >
> > > On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
> > > <quic_azarrabi@quicinc.com> wrote:
> > >>
> > >>
> > >> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
> > >>
> > >> Hi Jens,
> > >>
> > >>> Hi Amirreza,
> > >>>
> > >>> On Thu, Nov 21, 2024 at 2:37=E2=80=AFAM Amirreza Zarrabi
> > >>> <quic_azarrabi@quicinc.com> wrote:
> > >>>>
> > >>>> The default context has a lifespan similar to the tee_device.
> > >
> > > Since it's associated with tee_device context, let's call it obvious
> > > via renaming it as device context instead (s/def_ctx/dev_ctx/ in this
> > > patch).
> > >
> >
> > Make sense, I'll rename it.
> >
> > >>>> It is used as a context for shared memory if the context to which =
the
> > >>>> shared memory belongs is released, making the tee_shm an orphan.
> > >>>> This allows the driver implementing shm_unregister to safely make
> > >>>> subsequent calls, such as to a supplicant if needed.
> > >>>>
> > >>>> It also enables users to free the shared memory while the driver i=
s
> > >>>> blocked on unregister_tee_device safely.
> > >>>>
> > >>>> Preferably, this should be used for all driver internal uses, usin=
g
> > >>>> teedev_get_def_context rather than calling teedev_open.
> > >
> > > Makes sense to me.
> > >
> > >>>>
> > >>>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> > >>>> ---
> > >>>>  drivers/tee/optee/core.c    |  2 +-
> > >>>>  drivers/tee/optee/ffa_abi.c |  2 +-
> > >>>>  drivers/tee/optee/smc_abi.c |  2 +-
> > >>>>  drivers/tee/tee_core.c      | 83 +++++++++++++++++++++++++++++---=
-------------
> > >>>>  drivers/tee/tee_private.h   |  3 --
> > >>>>  drivers/tee/tee_shm.c       | 18 ++--------
> > >>>>  include/linux/tee_core.h    | 15 ++++++++
> > >>>>  include/linux/tee_drv.h     |  7 ----
> > >>>>  8 files changed, 73 insertions(+), 59 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> > >>>> index c75fddc83576..78d43d0c8014 100644
> > >>>> --- a/drivers/tee/optee/core.c
> > >>>> +++ b/drivers/tee/optee/core.c
> > >>>> @@ -173,7 +173,7 @@ void optee_remove_common(struct optee *optee)
> > >>>>
> > >>>>         optee_notif_uninit(optee);
> > >>>>         optee_shm_arg_cache_uninit(optee);
> > >>>> -       teedev_close_context(optee->ctx);
> > >>>> +
> > >>>>         /*
> > >>>>          * The two devices have to be unregistered before we can f=
ree the
> > >>>>          * other resources.
> > >>>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_a=
bi.c
> > >>>> index f3af5666bb11..6ad94f0788ad 100644
> > >>>> --- a/drivers/tee/optee/ffa_abi.c
> > >>>> +++ b/drivers/tee/optee/ffa_abi.c
> > >>>> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct ffa_device *=
ffa_dev)
> > >>>>         optee_shm_arg_cache_init(optee, arg_cache_flags);
> > >>>>         mutex_init(&optee->rpmb_dev_mutex);
> > >>>>         ffa_dev_set_drvdata(ffa_dev, optee);
> > >>>> -       ctx =3D teedev_open(optee->teedev);
> > >>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > >>>>         if (IS_ERR(ctx)) {
> > >>>>                 rc =3D PTR_ERR(ctx);
> > >>>>                 goto err_rhashtable_free;
> > >>>> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_a=
bi.c
> > >>>> index e9456e3e74cc..c77a3e631d04 100644
> > >>>> --- a/drivers/tee/optee/smc_abi.c
> > >>>> +++ b/drivers/tee/optee/smc_abi.c
> > >>>> @@ -1722,7 +1722,7 @@ static int optee_probe(struct platform_devic=
e *pdev)
> > >>>>         mutex_init(&optee->rpmb_dev_mutex);
> > >>>>
> > >>>>         platform_set_drvdata(pdev, optee);
> > >>>> -       ctx =3D teedev_open(optee->teedev);
> > >>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > >>>>         if (IS_ERR(ctx)) {
> > >>>>                 rc =3D PTR_ERR(ctx);
> > >>>>                 goto err_supp_uninit;
> > >>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > >>>> index 93f3b330aec8..805e1336089d 100644
> > >>>> --- a/drivers/tee/tee_core.c
> > >>>> +++ b/drivers/tee/tee_core.c
> > >>>> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(struct tee_devic=
e *teedev)
> > >>>>                 goto err;
> > >>>>         }
> > >>>>
> > >>>> -       kref_init(&ctx->refcount);
> > >>>>         ctx->teedev =3D teedev;
> > >>>>         INIT_LIST_HEAD(&ctx->list_shm);
> > >>>>         rc =3D teedev->desc->ops->open(ctx);
> > >>>> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(struct tee_dev=
ice *teedev)
> > >>>>  }
> > >>>>  EXPORT_SYMBOL_GPL(teedev_open);
> > >>>>
> > >>>> -void teedev_ctx_get(struct tee_context *ctx)
> > >>>> +struct tee_context *teedev_get_def_context(struct tee_device *tee=
dev)
> > >>>>  {
> > >>>> -       if (ctx->releasing)
> > >>>> -               return;
> > >>>> +       int rc;
> > >>>> +       struct tee_context *ctx =3D &teedev->def_ctx;
> > >>>>
> > >>>> -       kref_get(&ctx->refcount);
> > >>>> -}
> > >>>> +       ctx->teedev =3D teedev;
> > >>>> +       INIT_LIST_HEAD(&ctx->list_shm);
> > >>>> +       rc =3D teedev->desc->ops->open(ctx);
> > >>>> +       if (rc)
> > >>>> +               return ERR_PTR(rc);
> > >>>
> > >>> I think ctx->teedev and ctx->list_shm must always be initialized or
> > >>> &teedev->def_ctx can't be used in teedev_close_context().
> > >>
> > >> True, but &teedev->def_ctx is never used in teedev_close_context().
> > >> The closing of the &teedev->def_ctx simply ignored. So once opened,
> > >> &teedev->def_ctx will always remain open until the tee_device is ali=
ve.
> > >>
> > >>> We could initialize teedev->def_ctx on the first call to teedev_ope=
n()
> > >>> on that tee_device. We need a way to tell the
> > >>> teedev->desc->ops->open() to the backed driver that it's initializi=
ng
> > >>> the default context though, or optee_open() can't handle the
> > >>> tee-supplicant case properly.
> > >>>
> > >>
> > >> That's a good point. This way, it is guaranteed that there is one de=
f_ctx
> > >> per teedev. There should be a way to tell the open() callback that i=
t is
> > >> a def_ctx, so it is not registered as a supplicant context.
> > >>
> > >>
> > >>> Should we allow this function to be called more than once for each =
teedev?
> > >>
> > >> Yes, moving to teedev_open() will fix the issue.
> > >>
> > >>> Do we need serialization in this function if it's called after the
> > >>> driver is probed?
> > >>>
> > >>
> > >> True. I'll make sure there is no race.
> > >>
> > >>>>
> > >>>> -static void teedev_ctx_release(struct kref *ref)
> > >>>> -{
> > >>>> -       struct tee_context *ctx =3D container_of(ref, struct tee_c=
ontext,
> > >>>> -                                              refcount);
> > >>>> -       ctx->releasing =3D true;
> > >>>> -       ctx->teedev->desc->ops->release(ctx);
> > >>>> -       kfree(ctx);
> > >>>> +       return ctx;
> > >>>>  }
> > >>>> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
> > >>>>
> > >>>> -void teedev_ctx_put(struct tee_context *ctx)
> > >>>> +void teedev_close_context(struct tee_context *ctx)
> > >>>>  {
> > >>>> -       if (ctx->releasing)
> > >>>> +       struct tee_device *teedev =3D ctx->teedev;
> > >>>> +       struct tee_shm *shm;
> > >>>> +
> > >>>> +       if (ctx =3D=3D &teedev->def_ctx)
> > >>>>                 return;
> > >>>>
> > >>>> -       kref_put(&ctx->refcount, teedev_ctx_release);
> > >>>> -}
> > >>>> +       teedev->desc->ops->release(ctx);
> > >>>>
> > >>>> -void teedev_close_context(struct tee_context *ctx)
> > >>>> -{
> > >>>> -       struct tee_device *teedev =3D ctx->teedev;
> > >>>> +       mutex_lock(&teedev->mutex);
> > >>>> +       list_for_each_entry(shm, &ctx->list_shm, link) {
> > >>>> +               /* Context released. However, shm still holding a =
teedev reference.
> > >>>> +                * Replace shm->ctx with the default context so th=
at tee_shm_get_from_id()
> > >>>> +                * fails (i.e. it is not accessible from userspace=
) but shm still
> > >>>> +                * holds a valid context for further clean up, e.g=
. shm_unregister().
> > >>>> +                */
> > >>>
> > >>> /*
> > >>>  * Please format
> > >>>  * multiline comments
> > >>>  * like this. Please
> > >>>  * keep the lines at
> > >>>  * max 80 columns
> > >>>  * here and at other
> > >>>  * places in the patch-
> > >>>  * set.
> > >>>  */
> > >>>
> > >>
> > >> Ack.
> > >>
> > >>>> +               shm->ctx =3D &teedev->def_ctx;
> > >>>
> > >>> shm->ctx will always point to a valid context, even if it is the
> > >>> default context. It seems that we can always get hold of the correc=
t
> > >>> teedev via shm->ctx->teedev. Do we need "tee: revert removal of
> > >>> redundant teedev in struct tee_shm"?
> > >>>
> > >>
> > >> It was there in case we wanted to use NULL, but with def_ctx, it is =
not
> > >> necessary. I am withdrawing that commit. :).
> > >>
> > >>> Shouldn't the shm be removed from the ctx->list_shm and be moved to
> > >>> teedev->def_ctx.list_shm?
> > >
> > > +1
> > >
> >
> > Ack.
> >
> > >>>
> > >>
> > >> Not really. If we put shm in the teedev->def_ctx.list_shm, by the ti=
me
> > >> we are closing the def_ctx, the list is guaranteed to be empty.
> > >>
> > >> However, I understand it is cleaner and more consistent to do that r=
ather
> > >> than making changes to tee_shm_put().
> > >>
> > >> I'll do it.
> > >>
> > >>>> +       }
> > >>>> +       mutex_unlock(&teedev->mutex);
> > >>>>
> > >>>> -       teedev_ctx_put(ctx);
> > >>>> +       kfree(ctx);
> > >>>>         tee_device_put(teedev);
> > >>>>  }
> > >>>>  EXPORT_SYMBOL_GPL(teedev_close_context);
> > >>>> @@ -946,6 +952,8 @@ struct tee_device *tee_device_alloc(const stru=
ct tee_desc *teedesc,
> > >>>>
> > >>>>         teedev->desc =3D teedesc;
> > >>>>         teedev->pool =3D pool;
> > >>>> +       /* Only open default context when teedev_get_def_context()=
 called. */
> > >>>> +       teedev->def_ctx.teedev =3D NULL;
> > >
> > > Why don't you open the device context here only? This will associate
> > > it automatically with teedev lifespan and then
> > > teedev_get_def_context() will just return a reference to that.
> > >
> > > -Sumit
> > >
> >
> > So my assumption is that the tee_devic_alloc() is called as part of
> > the driver initialization; there is no guarantee that at this time the
> > driver is actually ready to accept any open() callback.
> >
>
> The drivers should be able to handle open() callback since we already
> check for !teedesc->ops->open in the beginning of tee_devic_alloc().
> Also, we need to open a device context for !TEE_DESC_PRIVILEGED such
> that we don't open a supplicant device context there.

It would be nice to have the device context fully initialized when the
probe function returns. How about adding a "bool is_dev_ctx" to struct
tee_context so the open() callback can tell that this is a special
tee_contex?

Cheers,
Jens

>
> -Sumit

