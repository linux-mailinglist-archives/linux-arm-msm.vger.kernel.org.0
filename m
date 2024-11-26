Return-Path: <linux-arm-msm+bounces-39171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D0E9D9354
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 09:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 632172830BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 08:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFAA18C332;
	Tue, 26 Nov 2024 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U/TYY0rC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635391369B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732609991; cv=none; b=fFLNguHpiFMBkoyN56ua6hzHNyT6dOh0jXSBFL7YNQMIBmojpDnqvm09fs8K+8cfRhrUvr0gqvqFbWJerNMQ9BbqtVdnR+Wth3VpR44NKnMUNKjDR0zXLs8fbqbNWMSSr38WSkbiqHxhFMr+lBxL3oF5OTCeMi3W1aGCY1ll0FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732609991; c=relaxed/simple;
	bh=xv4pL/khsymkF3uV+EJi6e+wcaFI03Lx8J2Yip4YAqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KnzW3e/vG5dJUD7PURfJHjKraDn5np3t6dQLubtja25DeyqYnBZZPej0isyyz70Q19MzdkW9bklqbO1TT2NRiCUa3YNrShR/l0dD7OWIQcElX1XILobOrTFxqEx5NNqxskajC9z0bJlH37gKtN/GwL+V6FhfcX2FAwU1Lanqp3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U/TYY0rC; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2968322f5feso2699541fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 00:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732609988; x=1733214788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiKd5LOdMIFpDMZsquX6Szr4648r4GnM2z1utMPRsKk=;
        b=U/TYY0rC2KHCs/F0PL8YJa4c5/4AUOgcShgSWOyZ5cBWVgx5DxHAK0g1DMt/Ow72g+
         rx2rqiV+/gWWaJK0cjsI4/ljL9MEc9o5//vGsR08cpXhc/uwi5T0DoVH+eFEXzX/7xij
         XIMDOcvB4b8BhIlFQ1WAFtO1Yz6i9K5TGZPpif4B9lKwxB59/T5aiWcai+Bqqbx8Nihh
         0YwUhAfTIARzj6DyYqBWV703FdgtqxgG+DzqUsAk5XcHJBNe+U+EbciwPhr7+5vU8Kog
         +olD5qAqv/C35+gVWRouENdLQoG31vM8m9fVTYL2sGQyMvsOTebS+snNxhLr6XtHKljE
         aiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732609988; x=1733214788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiKd5LOdMIFpDMZsquX6Szr4648r4GnM2z1utMPRsKk=;
        b=UrmphEoSADOfUahuV1rMrxv8B120s6Gqhle7RyayBHSezwlaWm2MILpXSp0UjMTd8F
         qEvAIRk13g6OKw8BeMIFKdq30VgOLlddfuSO6VbIQ+n4SWdpJWzYgH1D/XA2h6AVwXdy
         R07soYpIdrY+LzkR0S+dLe0hQHLBaKqW8mk4j4LmAiA4ecYz8KOwcE7VYfc7tsAs7l61
         DvG6GGh8+3Kd3akKJUp2mbupDUc3I+nPdhZMVwz+XvlQ7/yyDXIczKBkJRmg6shrrXG4
         vR/1H9tEF7jdAhLufr8GupMKEs7PnJvkfY+FJgm5uik0rv4l5saRevPBX34t5BMu42IL
         m1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWrlLbKJXRgJwNpk4IQcpvCShBC1X4afH2oaVodLNXgQ+BIpipl4uFTBNAIgK6ekJyFgUKGodb4PMSU/i+o@vger.kernel.org
X-Gm-Message-State: AOJu0YxAj5MhZYaoxJ0a3+Xm93WjKOiNo+cfo2pKJt9WsCvNXipmt9Hn
	wjgobshbFimV8DRDk6VCLuwU9u4oAJ9kA4vtTcODHigp0qW1y+soz4rug+AObl/0ZCknIb+ZBtg
	HeqcYyUDwlRCAEsSFMrc7wz/cBLKdrKVb1dTcLQ==
X-Gm-Gg: ASbGncsy8dwGzsq/MfDjW/dEDTLprACyEfGjLHvrxg5iMOQzrTfGAUbB5bMw0jA5nHc
	cLhq1N1wesKvYRlIgRnLARBfmAyreIsc=
X-Google-Smtp-Source: AGHT+IGDyPqaPsMuOlroYdAXWKosCTjeBsB3JVIOQiAcViUM89DGYMGA4F6scdE5hAoRo7hs1pnOhdmqTaKqg7JVy1U=
X-Received: by 2002:a05:6870:9129:b0:297:686:8ddd with SMTP id
 586e51a60fabf-29720e3ab8bmr13112339fac.39.1732609988314; Tue, 26 Nov 2024
 00:33:08 -0800 (PST)
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
 <CAHUa44HZbODOx7N4+WiNjQwrjwo7T=bQfZ5N-EjoMmXnfC4-Lg@mail.gmail.com>
 <CAFA6WYNbvxs-KRBkBxdD7M0Z=qLkT0ODDo-4_H5ZbZxqK4va7g@mail.gmail.com> <1a9269cb-204a-472d-b495-ac44f36cf131@quicinc.com>
In-Reply-To: <1a9269cb-204a-472d-b495-ac44f36cf131@quicinc.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 26 Nov 2024 09:32:56 +0100
Message-ID: <CAHUa44EZ2r=QRcsWfFs-ZqnTYEOpB4Ou4qpk4Y49NEPh-TTCeg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 9:55=E2=80=AFPM Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
>
>
> On 11/25/2024 6:51 PM, Sumit Garg wrote:
> > On Mon, 25 Nov 2024 at 12:53, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> >>
> >> On Mon, Nov 25, 2024 at 7:14=E2=80=AFAM Sumit Garg <sumit.garg@linaro.=
org> wrote:
> >>>
> >>> On Mon, 25 Nov 2024 at 03:00, Amirreza Zarrabi
> >>> <quic_azarrabi@quicinc.com> wrote:
> >>>>
> >>>>
> >>>> Hi Sumit,
> >>>>
> >>>> Thank you so much for the comemnts :).
> >>>>
> >>>> On 11/23/2024 9:32 PM, Sumit Garg wrote:
> >>>>> Hi Amirreza,
> >>>>>
> >>>>> Thanks for proposing this.
> >>>>>
> >>>>> On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
> >>>>> <quic_azarrabi@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
> >>>>>>
> >>>>>> Hi Jens,
> >>>>>>
> >>>>>>> Hi Amirreza,
> >>>>>>>
> >>>>>>> On Thu, Nov 21, 2024 at 2:37=E2=80=AFAM Amirreza Zarrabi
> >>>>>>> <quic_azarrabi@quicinc.com> wrote:
> >>>>>>>>
> >>>>>>>> The default context has a lifespan similar to the tee_device.
> >>>>>
> >>>>> Since it's associated with tee_device context, let's call it obviou=
s
> >>>>> via renaming it as device context instead (s/def_ctx/dev_ctx/ in th=
is
> >>>>> patch).
> >>>>>
> >>>>
> >>>> Make sense, I'll rename it.
> >>>>
> >>>>>>>> It is used as a context for shared memory if the context to whic=
h the
> >>>>>>>> shared memory belongs is released, making the tee_shm an orphan.
> >>>>>>>> This allows the driver implementing shm_unregister to safely mak=
e
> >>>>>>>> subsequent calls, such as to a supplicant if needed.
> >>>>>>>>
> >>>>>>>> It also enables users to free the shared memory while the driver=
 is
> >>>>>>>> blocked on unregister_tee_device safely.
> >>>>>>>>
> >>>>>>>> Preferably, this should be used for all driver internal uses, us=
ing
> >>>>>>>> teedev_get_def_context rather than calling teedev_open.
> >>>>>
> >>>>> Makes sense to me.
> >>>>>
> >>>>>>>>
> >>>>>>>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/tee/optee/core.c    |  2 +-
> >>>>>>>>  drivers/tee/optee/ffa_abi.c |  2 +-
> >>>>>>>>  drivers/tee/optee/smc_abi.c |  2 +-
> >>>>>>>>  drivers/tee/tee_core.c      | 83 +++++++++++++++++++++++++++++-=
---------------
> >>>>>>>>  drivers/tee/tee_private.h   |  3 --
> >>>>>>>>  drivers/tee/tee_shm.c       | 18 ++--------
> >>>>>>>>  include/linux/tee_core.h    | 15 ++++++++
> >>>>>>>>  include/linux/tee_drv.h     |  7 ----
> >>>>>>>>  8 files changed, 73 insertions(+), 59 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> >>>>>>>> index c75fddc83576..78d43d0c8014 100644
> >>>>>>>> --- a/drivers/tee/optee/core.c
> >>>>>>>> +++ b/drivers/tee/optee/core.c
> >>>>>>>> @@ -173,7 +173,7 @@ void optee_remove_common(struct optee *optee=
)
> >>>>>>>>
> >>>>>>>>         optee_notif_uninit(optee);
> >>>>>>>>         optee_shm_arg_cache_uninit(optee);
> >>>>>>>> -       teedev_close_context(optee->ctx);
> >>>>>>>> +
> >>>>>>>>         /*
> >>>>>>>>          * The two devices have to be unregistered before we can=
 free the
> >>>>>>>>          * other resources.
> >>>>>>>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa=
_abi.c
> >>>>>>>> index f3af5666bb11..6ad94f0788ad 100644
> >>>>>>>> --- a/drivers/tee/optee/ffa_abi.c
> >>>>>>>> +++ b/drivers/tee/optee/ffa_abi.c
> >>>>>>>> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct ffa_device=
 *ffa_dev)
> >>>>>>>>         optee_shm_arg_cache_init(optee, arg_cache_flags);
> >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> >>>>>>>>         ffa_dev_set_drvdata(ffa_dev, optee);
> >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> >>>>>>>>         if (IS_ERR(ctx)) {
> >>>>>>>>                 rc =3D PTR_ERR(ctx);
> >>>>>>>>                 goto err_rhashtable_free;
> >>>>>>>> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc=
_abi.c
> >>>>>>>> index e9456e3e74cc..c77a3e631d04 100644
> >>>>>>>> --- a/drivers/tee/optee/smc_abi.c
> >>>>>>>> +++ b/drivers/tee/optee/smc_abi.c
> >>>>>>>> @@ -1722,7 +1722,7 @@ static int optee_probe(struct platform_dev=
ice *pdev)
> >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> >>>>>>>>
> >>>>>>>>         platform_set_drvdata(pdev, optee);
> >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> >>>>>>>>         if (IS_ERR(ctx)) {
> >>>>>>>>                 rc =3D PTR_ERR(ctx);
> >>>>>>>>                 goto err_supp_uninit;
> >>>>>>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> >>>>>>>> index 93f3b330aec8..805e1336089d 100644
> >>>>>>>> --- a/drivers/tee/tee_core.c
> >>>>>>>> +++ b/drivers/tee/tee_core.c
> >>>>>>>> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(struct tee_dev=
ice *teedev)
> >>>>>>>>                 goto err;
> >>>>>>>>         }
> >>>>>>>>
> >>>>>>>> -       kref_init(&ctx->refcount);
> >>>>>>>>         ctx->teedev =3D teedev;
> >>>>>>>>         INIT_LIST_HEAD(&ctx->list_shm);
> >>>>>>>>         rc =3D teedev->desc->ops->open(ctx);
> >>>>>>>> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(struct tee_d=
evice *teedev)
> >>>>>>>>  }
> >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_open);
> >>>>>>>>
> >>>>>>>> -void teedev_ctx_get(struct tee_context *ctx)
> >>>>>>>> +struct tee_context *teedev_get_def_context(struct tee_device *t=
eedev)
> >>>>>>>>  {
> >>>>>>>> -       if (ctx->releasing)
> >>>>>>>> -               return;
> >>>>>>>> +       int rc;
> >>>>>>>> +       struct tee_context *ctx =3D &teedev->def_ctx;
> >>>>>>>>
> >>>>>>>> -       kref_get(&ctx->refcount);
> >>>>>>>> -}
> >>>>>>>> +       ctx->teedev =3D teedev;
> >>>>>>>> +       INIT_LIST_HEAD(&ctx->list_shm);
> >>>>>>>> +       rc =3D teedev->desc->ops->open(ctx);
> >>>>>>>> +       if (rc)
> >>>>>>>> +               return ERR_PTR(rc);
> >>>>>>>
> >>>>>>> I think ctx->teedev and ctx->list_shm must always be initialized =
or
> >>>>>>> &teedev->def_ctx can't be used in teedev_close_context().
> >>>>>>
> >>>>>> True, but &teedev->def_ctx is never used in teedev_close_context()=
.
> >>>>>> The closing of the &teedev->def_ctx simply ignored. So once opened=
,
> >>>>>> &teedev->def_ctx will always remain open until the tee_device is a=
live.
> >>>>>>
> >>>>>>> We could initialize teedev->def_ctx on the first call to teedev_o=
pen()
> >>>>>>> on that tee_device. We need a way to tell the
> >>>>>>> teedev->desc->ops->open() to the backed driver that it's initiali=
zing
> >>>>>>> the default context though, or optee_open() can't handle the
> >>>>>>> tee-supplicant case properly.
> >>>>>>>
> >>>>>>
> >>>>>> That's a good point. This way, it is guaranteed that there is one =
def_ctx
> >>>>>> per teedev. There should be a way to tell the open() callback that=
 it is
> >>>>>> a def_ctx, so it is not registered as a supplicant context.
> >>>>>>
> >>>>>>
> >>>>>>> Should we allow this function to be called more than once for eac=
h teedev?
> >>>>>>
> >>>>>> Yes, moving to teedev_open() will fix the issue.
> >>>>>>
> >>>>>>> Do we need serialization in this function if it's called after th=
e
> >>>>>>> driver is probed?
> >>>>>>>
> >>>>>>
> >>>>>> True. I'll make sure there is no race.
> >>>>>>
> >>>>>>>>
> >>>>>>>> -static void teedev_ctx_release(struct kref *ref)
> >>>>>>>> -{
> >>>>>>>> -       struct tee_context *ctx =3D container_of(ref, struct tee=
_context,
> >>>>>>>> -                                              refcount);
> >>>>>>>> -       ctx->releasing =3D true;
> >>>>>>>> -       ctx->teedev->desc->ops->release(ctx);
> >>>>>>>> -       kfree(ctx);
> >>>>>>>> +       return ctx;
> >>>>>>>>  }
> >>>>>>>> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
> >>>>>>>>
> >>>>>>>> -void teedev_ctx_put(struct tee_context *ctx)
> >>>>>>>> +void teedev_close_context(struct tee_context *ctx)
> >>>>>>>>  {
> >>>>>>>> -       if (ctx->releasing)
> >>>>>>>> +       struct tee_device *teedev =3D ctx->teedev;
> >>>>>>>> +       struct tee_shm *shm;
> >>>>>>>> +
> >>>>>>>> +       if (ctx =3D=3D &teedev->def_ctx)
> >>>>>>>>                 return;
> >>>>>>>>
> >>>>>>>> -       kref_put(&ctx->refcount, teedev_ctx_release);
> >>>>>>>> -}
> >>>>>>>> +       teedev->desc->ops->release(ctx);
> >>>>>>>>
> >>>>>>>> -void teedev_close_context(struct tee_context *ctx)
> >>>>>>>> -{
> >>>>>>>> -       struct tee_device *teedev =3D ctx->teedev;
> >>>>>>>> +       mutex_lock(&teedev->mutex);
> >>>>>>>> +       list_for_each_entry(shm, &ctx->list_shm, link) {
> >>>>>>>> +               /* Context released. However, shm still holding =
a teedev reference.
> >>>>>>>> +                * Replace shm->ctx with the default context so =
that tee_shm_get_from_id()
> >>>>>>>> +                * fails (i.e. it is not accessible from userspa=
ce) but shm still
> >>>>>>>> +                * holds a valid context for further clean up, e=
.g. shm_unregister().
> >>>>>>>> +                */
> >>>>>>>
> >>>>>>> /*
> >>>>>>>  * Please format
> >>>>>>>  * multiline comments
> >>>>>>>  * like this. Please
> >>>>>>>  * keep the lines at
> >>>>>>>  * max 80 columns
> >>>>>>>  * here and at other
> >>>>>>>  * places in the patch-
> >>>>>>>  * set.
> >>>>>>>  */
> >>>>>>>
> >>>>>>
> >>>>>> Ack.
> >>>>>>
> >>>>>>>> +               shm->ctx =3D &teedev->def_ctx;
> >>>>>>>
> >>>>>>> shm->ctx will always point to a valid context, even if it is the
> >>>>>>> default context. It seems that we can always get hold of the corr=
ect
> >>>>>>> teedev via shm->ctx->teedev. Do we need "tee: revert removal of
> >>>>>>> redundant teedev in struct tee_shm"?
> >>>>>>>
> >>>>>>
> >>>>>> It was there in case we wanted to use NULL, but with def_ctx, it i=
s not
> >>>>>> necessary. I am withdrawing that commit. :).
> >>>>>>
> >>>>>>> Shouldn't the shm be removed from the ctx->list_shm and be moved =
to
> >>>>>>> teedev->def_ctx.list_shm?
> >>>>>
> >>>>> +1
> >>>>>
> >>>>
> >>>> Ack.
> >>>>
> >>>>>>>
> >>>>>>
> >>>>>> Not really. If we put shm in the teedev->def_ctx.list_shm, by the =
time
> >>>>>> we are closing the def_ctx, the list is guaranteed to be empty.
> >>>>>>
> >>>>>> However, I understand it is cleaner and more consistent to do that=
 rather
> >>>>>> than making changes to tee_shm_put().
> >>>>>>
> >>>>>> I'll do it.
> >>>>>>
> >>>>>>>> +       }
> >>>>>>>> +       mutex_unlock(&teedev->mutex);
> >>>>>>>>
> >>>>>>>> -       teedev_ctx_put(ctx);
> >>>>>>>> +       kfree(ctx);
> >>>>>>>>         tee_device_put(teedev);
> >>>>>>>>  }
> >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_close_context);
> >>>>>>>> @@ -946,6 +952,8 @@ struct tee_device *tee_device_alloc(const st=
ruct tee_desc *teedesc,
> >>>>>>>>
> >>>>>>>>         teedev->desc =3D teedesc;
> >>>>>>>>         teedev->pool =3D pool;
> >>>>>>>> +       /* Only open default context when teedev_get_def_context=
() called. */
> >>>>>>>> +       teedev->def_ctx.teedev =3D NULL;
> >>>>>
> >>>>> Why don't you open the device context here only? This will associat=
e
> >>>>> it automatically with teedev lifespan and then
> >>>>> teedev_get_def_context() will just return a reference to that.
> >>>>>
> >>>>> -Sumit
> >>>>>
> >>>>
> >>>> So my assumption is that the tee_devic_alloc() is called as part of
> >>>> the driver initialization; there is no guarantee that at this time t=
he
> >>>> driver is actually ready to accept any open() callback.
> >>>>
> >>>
> >>> The drivers should be able to handle open() callback since we already
> >>> check for !teedesc->ops->open in the beginning of tee_devic_alloc().
> >>> Also, we need to open a device context for !TEE_DESC_PRIVILEGED such
> >>> that we don't open a supplicant device context there.
> >>
> >> It would be nice to have the device context fully initialized when the
> >> probe function returns. How about adding a "bool is_dev_ctx" to struct
> >> tee_context so the open() callback can tell that this is a special
> >> tee_contex?
> >
> > Sure, that will be useful to distinguish the device context from
> > normal client context.
> >
> > -Sumit
> >
>
> So, as far as the open() callback, I do not believe checking if it is not=
 null
> is reasonable for calling it here. Most drivers allocate resources and th=
en
> initialize them. So, assume these steps for a TEE driver:
>  (1) allocate internal data structures,
>  (2) allocate the device,
>  (3) initialize the internal data structurse and then
>  (4) register the device.
>
> Having these steps for a backend driver means that if you call open() at
> step (2), the internal data structures are not ready.
>
> I was originally thinking of going with Jens' suggestion to open dev_ctx =
in
> the teedev_open(), and use a flag to distinguish the type of context for
> the open() callback
>
> What about this:
> Open the dev_ctx in the tee_device_register(), at the last step before
> setting the TEE_DEVICE_FLAG_REGISTERED flag. Then the open() callback can
> check for this flag to determine if it is a normal context or dev_ctx.
> If the open() is called while the device has not been registered, it shou=
ld
> handle it differently

That makes sense, the driver should be prepared to handle open() calls
after tee_device_register() anyway.
However, there is no serialization of the flags field in struct
tee_device. Hmm, would it be too hacky for the open() callback to
check if &ctx->teedev.dev_ctx =3D=3D ctx? We could add a helper function
to wrap that check.

Cheers,
Jens

>
> - Amir
>
> >>
> >> Cheers,
> >> Jens
> >>
> >>>
> >>> -Sumit

