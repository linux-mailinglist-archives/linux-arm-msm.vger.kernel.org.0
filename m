Return-Path: <linux-arm-msm+bounces-39214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835249D9A5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 16:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7BFB1657DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 15:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B701D61A1;
	Tue, 26 Nov 2024 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lmlRaC/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBD61D5CFE
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732634559; cv=none; b=Su/eiHJVbxOmTfd2u6qGR52N6RmHN0XJJOK++JhXgWkrpp2s2OXCcs7aUWTUGVpu3EVzn3l7sS9wE0nVeKpfWMW2pbj+hXtfQZROjDAHyXjeAqUGoHqL1A8UtzH7HFpGAjJlx8DUBfOGEdiTi3Fwtk6Pd7d1EjeweZ4Kx3twlME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732634559; c=relaxed/simple;
	bh=5qm61UYsIhVAOJkUyECrncBZAbDiYtBL2kH+11Adz58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8U98CF/e0wMm5kiUF+syGffzVLkYRKS3xsjdnf04YKjmTMk+xkNGsoTRd/shsN0+EsIWdr8vivgLSIAKsUTrpavVUfP8ElsG26yCcmgmkTAPR6DSH20bDyHQ9ELR4indp7YlMph+0hUi6p/ZhXSDcBPnN6zWyZbFLa3sxPzgXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lmlRaC/L; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-288fa5ce8f0so2533014fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 07:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732634555; x=1733239355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66QMSoLYOZ7xKQg47/I6oDIem4h1TMd6xglE/tAxrKg=;
        b=lmlRaC/LsXmjZpcA+J3oldM+8MiTlAJEPBHqnm7lGLg3Oup9pcRkTlGjWSyY7vzX0w
         6Wp32QbnH6AE+qmTruDk3jsavRUKB7lJmR4pGFGbQyLl3OEpp0CLJcK+7QCfsoj7FO89
         81mqh4Wou03HwFHi6hxkuLZyfk7BQTIy6dY9fc6GHpuJ/3oQhw9Xif+QN3CJY6NHq0DS
         DQp6M+iD2LP5ZiTHwzYKxRoHP2eB2lhwZSj0sy9J4YzO5oobRK73XwfQZ08yuHEHcdkd
         cy3lhMBugT9t4eIXSh9SDgTx7YAJCjuShWMWYwie6TkJvi2AdQebe3N9nXHaC9lUfsbb
         9r4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732634555; x=1733239355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66QMSoLYOZ7xKQg47/I6oDIem4h1TMd6xglE/tAxrKg=;
        b=NxDzdvEO1qjcH4Zxyw92Qumb5Ow4RhZJvet4lu2LVCY3Z8FmccwmEnDS5RJSDZd6Su
         ROY6qqWOETVhxE3hdF+UF9LtArvKjYYWzP52hZHEuj/Zqb2TCBtybNLDcYlCnt4FEZpg
         oMc2k3Mda/KzUnkrcupm/58BYdsnmLWs6ik8rfL2LWegQefC7+YqaAYFR9ceUnkxWmvG
         Xw+xa8Oxt7uX3e1e69PBWOxSJ6YnHtvfani4Fefnc2UjHDLuVSEPmkFi21yOcx8vGTLy
         TljZmQdIAwuDpWUKEDy/zIwL27LGorvJtnzYXIRnSwnqRifaSgA9jg6uV8T9fjO38Dj3
         jk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXv0jBQmQS1YwuXLg7hfRgS1Ou4sYk8bGPXi1mShsdbIkks02fB1FxvnMnC6evn67ohtwyBkXt5DXfl41a@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpsi81VK2R2GbvDgleQPFxhemVeBuu1QzR9FfQTtspvlGvL+R
	pHo51eDdsD9/YdbcxKV7cj1DYXMvIq2+9JRxYZw3sEdWPfUPboJGrPuPfdhlmvVDZxlMbCjkyXt
	Ze/hM9R6K9AvWqJiQRHCMuguc6sQsmsMf2UY0YQ==
X-Gm-Gg: ASbGncvj3oXIB2JiOnnlMTtd8J+YKnjz8RajMrmjnfx2U/x/CEqQrNSLQIaaag8ND5F
	FUuSajBhv2LQ0OvXPo1YCUr6m+6UxF6U=
X-Google-Smtp-Source: AGHT+IHEgfo2qYlKJKUqmB/VTYwC1HLxukcxnvFIY71dREOgLq/PPGEUceUKxjQj9xnaaYIlmrPuDwTCHhteUvA/fRU=
X-Received: by 2002:a05:6870:b491:b0:25d:ff1b:3793 with SMTP id
 586e51a60fabf-29720e6dc2emr14312795fac.35.1732634555087; Tue, 26 Nov 2024
 07:22:35 -0800 (PST)
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
 <CAFA6WYNbvxs-KRBkBxdD7M0Z=qLkT0ODDo-4_H5ZbZxqK4va7g@mail.gmail.com>
 <1a9269cb-204a-472d-b495-ac44f36cf131@quicinc.com> <CAHUa44EZ2r=QRcsWfFs-ZqnTYEOpB4Ou4qpk4Y49NEPh-TTCeg@mail.gmail.com>
 <CAFA6WYPUZN752aT7+ejoiYYoLs_XNV7w9wT7kBrE=vvEJO+8_g@mail.gmail.com>
In-Reply-To: <CAFA6WYPUZN752aT7+ejoiYYoLs_XNV7w9wT7kBrE=vvEJO+8_g@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 26 Nov 2024 16:22:23 +0100
Message-ID: <CAHUa44F7_yGQFJq6BsoCv6AfB_TjuiGP84YaQ-kz=_e1ni+xyA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Amirreza Zarrabi <quic_azarrabi@quicinc.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 1:27=E2=80=AFPM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> On Tue, 26 Nov 2024 at 14:03, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >
> > On Mon, Nov 25, 2024 at 9:55=E2=80=AFPM Amirreza Zarrabi
> > <quic_azarrabi@quicinc.com> wrote:
> > >
> > >
> > >
> > > On 11/25/2024 6:51 PM, Sumit Garg wrote:
> > > > On Mon, 25 Nov 2024 at 12:53, Jens Wiklander <jens.wiklander@linaro=
.org> wrote:
> > > >>
> > > >> On Mon, Nov 25, 2024 at 7:14=E2=80=AFAM Sumit Garg <sumit.garg@lin=
aro.org> wrote:
> > > >>>
> > > >>> On Mon, 25 Nov 2024 at 03:00, Amirreza Zarrabi
> > > >>> <quic_azarrabi@quicinc.com> wrote:
> > > >>>>
> > > >>>>
> > > >>>> Hi Sumit,
> > > >>>>
> > > >>>> Thank you so much for the comemnts :).
> > > >>>>
> > > >>>> On 11/23/2024 9:32 PM, Sumit Garg wrote:
> > > >>>>> Hi Amirreza,
> > > >>>>>
> > > >>>>> Thanks for proposing this.
> > > >>>>>
> > > >>>>> On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
> > > >>>>> <quic_azarrabi@quicinc.com> wrote:
> > > >>>>>>
> > > >>>>>>
> > > >>>>>> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
> > > >>>>>>
> > > >>>>>> Hi Jens,
> > > >>>>>>
> > > >>>>>>> Hi Amirreza,
> > > >>>>>>>
> > > >>>>>>> On Thu, Nov 21, 2024 at 2:37=E2=80=AFAM Amirreza Zarrabi
> > > >>>>>>> <quic_azarrabi@quicinc.com> wrote:
> > > >>>>>>>>
> > > >>>>>>>> The default context has a lifespan similar to the tee_device=
.
> > > >>>>>
> > > >>>>> Since it's associated with tee_device context, let's call it ob=
vious
> > > >>>>> via renaming it as device context instead (s/def_ctx/dev_ctx/ i=
n this
> > > >>>>> patch).
> > > >>>>>
> > > >>>>
> > > >>>> Make sense, I'll rename it.
> > > >>>>
> > > >>>>>>>> It is used as a context for shared memory if the context to =
which the
> > > >>>>>>>> shared memory belongs is released, making the tee_shm an orp=
han.
> > > >>>>>>>> This allows the driver implementing shm_unregister to safely=
 make
> > > >>>>>>>> subsequent calls, such as to a supplicant if needed.
> > > >>>>>>>>
> > > >>>>>>>> It also enables users to free the shared memory while the dr=
iver is
> > > >>>>>>>> blocked on unregister_tee_device safely.
> > > >>>>>>>>
> > > >>>>>>>> Preferably, this should be used for all driver internal uses=
, using
> > > >>>>>>>> teedev_get_def_context rather than calling teedev_open.
> > > >>>>>
> > > >>>>> Makes sense to me.
> > > >>>>>
> > > >>>>>>>>
> > > >>>>>>>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> > > >>>>>>>> ---
> > > >>>>>>>>  drivers/tee/optee/core.c    |  2 +-
> > > >>>>>>>>  drivers/tee/optee/ffa_abi.c |  2 +-
> > > >>>>>>>>  drivers/tee/optee/smc_abi.c |  2 +-
> > > >>>>>>>>  drivers/tee/tee_core.c      | 83 ++++++++++++++++++++++++++=
+++----------------
> > > >>>>>>>>  drivers/tee/tee_private.h   |  3 --
> > > >>>>>>>>  drivers/tee/tee_shm.c       | 18 ++--------
> > > >>>>>>>>  include/linux/tee_core.h    | 15 ++++++++
> > > >>>>>>>>  include/linux/tee_drv.h     |  7 ----
> > > >>>>>>>>  8 files changed, 73 insertions(+), 59 deletions(-)
> > > >>>>>>>>
> > > >>>>>>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/co=
re.c
> > > >>>>>>>> index c75fddc83576..78d43d0c8014 100644
> > > >>>>>>>> --- a/drivers/tee/optee/core.c
> > > >>>>>>>> +++ b/drivers/tee/optee/core.c
> > > >>>>>>>> @@ -173,7 +173,7 @@ void optee_remove_common(struct optee *o=
ptee)
> > > >>>>>>>>
> > > >>>>>>>>         optee_notif_uninit(optee);
> > > >>>>>>>>         optee_shm_arg_cache_uninit(optee);
> > > >>>>>>>> -       teedev_close_context(optee->ctx);
> > > >>>>>>>> +
> > > >>>>>>>>         /*
> > > >>>>>>>>          * The two devices have to be unregistered before we=
 can free the
> > > >>>>>>>>          * other resources.
> > > >>>>>>>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee=
/ffa_abi.c
> > > >>>>>>>> index f3af5666bb11..6ad94f0788ad 100644
> > > >>>>>>>> --- a/drivers/tee/optee/ffa_abi.c
> > > >>>>>>>> +++ b/drivers/tee/optee/ffa_abi.c
> > > >>>>>>>> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct ffa_de=
vice *ffa_dev)
> > > >>>>>>>>         optee_shm_arg_cache_init(optee, arg_cache_flags);
> > > >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> > > >>>>>>>>         ffa_dev_set_drvdata(ffa_dev, optee);
> > > >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> > > >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > > >>>>>>>>         if (IS_ERR(ctx)) {
> > > >>>>>>>>                 rc =3D PTR_ERR(ctx);
> > > >>>>>>>>                 goto err_rhashtable_free;
> > > >>>>>>>> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee=
/smc_abi.c
> > > >>>>>>>> index e9456e3e74cc..c77a3e631d04 100644
> > > >>>>>>>> --- a/drivers/tee/optee/smc_abi.c
> > > >>>>>>>> +++ b/drivers/tee/optee/smc_abi.c
> > > >>>>>>>> @@ -1722,7 +1722,7 @@ static int optee_probe(struct platform=
_device *pdev)
> > > >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> > > >>>>>>>>
> > > >>>>>>>>         platform_set_drvdata(pdev, optee);
> > > >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> > > >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > > >>>>>>>>         if (IS_ERR(ctx)) {
> > > >>>>>>>>                 rc =3D PTR_ERR(ctx);
> > > >>>>>>>>                 goto err_supp_uninit;
> > > >>>>>>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > > >>>>>>>> index 93f3b330aec8..805e1336089d 100644
> > > >>>>>>>> --- a/drivers/tee/tee_core.c
> > > >>>>>>>> +++ b/drivers/tee/tee_core.c
> > > >>>>>>>> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(struct tee=
_device *teedev)
> > > >>>>>>>>                 goto err;
> > > >>>>>>>>         }
> > > >>>>>>>>
> > > >>>>>>>> -       kref_init(&ctx->refcount);
> > > >>>>>>>>         ctx->teedev =3D teedev;
> > > >>>>>>>>         INIT_LIST_HEAD(&ctx->list_shm);
> > > >>>>>>>>         rc =3D teedev->desc->ops->open(ctx);
> > > >>>>>>>> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(struct t=
ee_device *teedev)
> > > >>>>>>>>  }
> > > >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_open);
> > > >>>>>>>>
> > > >>>>>>>> -void teedev_ctx_get(struct tee_context *ctx)
> > > >>>>>>>> +struct tee_context *teedev_get_def_context(struct tee_devic=
e *teedev)
> > > >>>>>>>>  {
> > > >>>>>>>> -       if (ctx->releasing)
> > > >>>>>>>> -               return;
> > > >>>>>>>> +       int rc;
> > > >>>>>>>> +       struct tee_context *ctx =3D &teedev->def_ctx;
> > > >>>>>>>>
> > > >>>>>>>> -       kref_get(&ctx->refcount);
> > > >>>>>>>> -}
> > > >>>>>>>> +       ctx->teedev =3D teedev;
> > > >>>>>>>> +       INIT_LIST_HEAD(&ctx->list_shm);
> > > >>>>>>>> +       rc =3D teedev->desc->ops->open(ctx);
> > > >>>>>>>> +       if (rc)
> > > >>>>>>>> +               return ERR_PTR(rc);
> > > >>>>>>>
> > > >>>>>>> I think ctx->teedev and ctx->list_shm must always be initiali=
zed or
> > > >>>>>>> &teedev->def_ctx can't be used in teedev_close_context().
> > > >>>>>>
> > > >>>>>> True, but &teedev->def_ctx is never used in teedev_close_conte=
xt().
> > > >>>>>> The closing of the &teedev->def_ctx simply ignored. So once op=
ened,
> > > >>>>>> &teedev->def_ctx will always remain open until the tee_device =
is alive.
> > > >>>>>>
> > > >>>>>>> We could initialize teedev->def_ctx on the first call to teed=
ev_open()
> > > >>>>>>> on that tee_device. We need a way to tell the
> > > >>>>>>> teedev->desc->ops->open() to the backed driver that it's init=
ializing
> > > >>>>>>> the default context though, or optee_open() can't handle the
> > > >>>>>>> tee-supplicant case properly.
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> That's a good point. This way, it is guaranteed that there is =
one def_ctx
> > > >>>>>> per teedev. There should be a way to tell the open() callback =
that it is
> > > >>>>>> a def_ctx, so it is not registered as a supplicant context.
> > > >>>>>>
> > > >>>>>>
> > > >>>>>>> Should we allow this function to be called more than once for=
 each teedev?
> > > >>>>>>
> > > >>>>>> Yes, moving to teedev_open() will fix the issue.
> > > >>>>>>
> > > >>>>>>> Do we need serialization in this function if it's called afte=
r the
> > > >>>>>>> driver is probed?
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> True. I'll make sure there is no race.
> > > >>>>>>
> > > >>>>>>>>
> > > >>>>>>>> -static void teedev_ctx_release(struct kref *ref)
> > > >>>>>>>> -{
> > > >>>>>>>> -       struct tee_context *ctx =3D container_of(ref, struct=
 tee_context,
> > > >>>>>>>> -                                              refcount);
> > > >>>>>>>> -       ctx->releasing =3D true;
> > > >>>>>>>> -       ctx->teedev->desc->ops->release(ctx);
> > > >>>>>>>> -       kfree(ctx);
> > > >>>>>>>> +       return ctx;
> > > >>>>>>>>  }
> > > >>>>>>>> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
> > > >>>>>>>>
> > > >>>>>>>> -void teedev_ctx_put(struct tee_context *ctx)
> > > >>>>>>>> +void teedev_close_context(struct tee_context *ctx)
> > > >>>>>>>>  {
> > > >>>>>>>> -       if (ctx->releasing)
> > > >>>>>>>> +       struct tee_device *teedev =3D ctx->teedev;
> > > >>>>>>>> +       struct tee_shm *shm;
> > > >>>>>>>> +
> > > >>>>>>>> +       if (ctx =3D=3D &teedev->def_ctx)
> > > >>>>>>>>                 return;
> > > >>>>>>>>
> > > >>>>>>>> -       kref_put(&ctx->refcount, teedev_ctx_release);
> > > >>>>>>>> -}
> > > >>>>>>>> +       teedev->desc->ops->release(ctx);
> > > >>>>>>>>
> > > >>>>>>>> -void teedev_close_context(struct tee_context *ctx)
> > > >>>>>>>> -{
> > > >>>>>>>> -       struct tee_device *teedev =3D ctx->teedev;
> > > >>>>>>>> +       mutex_lock(&teedev->mutex);
> > > >>>>>>>> +       list_for_each_entry(shm, &ctx->list_shm, link) {
> > > >>>>>>>> +               /* Context released. However, shm still hold=
ing a teedev reference.
> > > >>>>>>>> +                * Replace shm->ctx with the default context=
 so that tee_shm_get_from_id()
> > > >>>>>>>> +                * fails (i.e. it is not accessible from use=
rspace) but shm still
> > > >>>>>>>> +                * holds a valid context for further clean u=
p, e.g. shm_unregister().
> > > >>>>>>>> +                */
> > > >>>>>>>
> > > >>>>>>> /*
> > > >>>>>>>  * Please format
> > > >>>>>>>  * multiline comments
> > > >>>>>>>  * like this. Please
> > > >>>>>>>  * keep the lines at
> > > >>>>>>>  * max 80 columns
> > > >>>>>>>  * here and at other
> > > >>>>>>>  * places in the patch-
> > > >>>>>>>  * set.
> > > >>>>>>>  */
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> Ack.
> > > >>>>>>
> > > >>>>>>>> +               shm->ctx =3D &teedev->def_ctx;
> > > >>>>>>>
> > > >>>>>>> shm->ctx will always point to a valid context, even if it is =
the
> > > >>>>>>> default context. It seems that we can always get hold of the =
correct
> > > >>>>>>> teedev via shm->ctx->teedev. Do we need "tee: revert removal =
of
> > > >>>>>>> redundant teedev in struct tee_shm"?
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> It was there in case we wanted to use NULL, but with def_ctx, =
it is not
> > > >>>>>> necessary. I am withdrawing that commit. :).
> > > >>>>>>
> > > >>>>>>> Shouldn't the shm be removed from the ctx->list_shm and be mo=
ved to
> > > >>>>>>> teedev->def_ctx.list_shm?
> > > >>>>>
> > > >>>>> +1
> > > >>>>>
> > > >>>>
> > > >>>> Ack.
> > > >>>>
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> Not really. If we put shm in the teedev->def_ctx.list_shm, by =
the time
> > > >>>>>> we are closing the def_ctx, the list is guaranteed to be empty=
.
> > > >>>>>>
> > > >>>>>> However, I understand it is cleaner and more consistent to do =
that rather
> > > >>>>>> than making changes to tee_shm_put().
> > > >>>>>>
> > > >>>>>> I'll do it.
> > > >>>>>>
> > > >>>>>>>> +       }
> > > >>>>>>>> +       mutex_unlock(&teedev->mutex);
> > > >>>>>>>>
> > > >>>>>>>> -       teedev_ctx_put(ctx);
> > > >>>>>>>> +       kfree(ctx);
> > > >>>>>>>>         tee_device_put(teedev);
> > > >>>>>>>>  }
> > > >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_close_context);
> > > >>>>>>>> @@ -946,6 +952,8 @@ struct tee_device *tee_device_alloc(cons=
t struct tee_desc *teedesc,
> > > >>>>>>>>
> > > >>>>>>>>         teedev->desc =3D teedesc;
> > > >>>>>>>>         teedev->pool =3D pool;
> > > >>>>>>>> +       /* Only open default context when teedev_get_def_con=
text() called. */
> > > >>>>>>>> +       teedev->def_ctx.teedev =3D NULL;
> > > >>>>>
> > > >>>>> Why don't you open the device context here only? This will asso=
ciate
> > > >>>>> it automatically with teedev lifespan and then
> > > >>>>> teedev_get_def_context() will just return a reference to that.
> > > >>>>>
> > > >>>>> -Sumit
> > > >>>>>
> > > >>>>
> > > >>>> So my assumption is that the tee_devic_alloc() is called as part=
 of
> > > >>>> the driver initialization; there is no guarantee that at this ti=
me the
> > > >>>> driver is actually ready to accept any open() callback.
> > > >>>>
> > > >>>
> > > >>> The drivers should be able to handle open() callback since we alr=
eady
> > > >>> check for !teedesc->ops->open in the beginning of tee_devic_alloc=
().
> > > >>> Also, we need to open a device context for !TEE_DESC_PRIVILEGED s=
uch
> > > >>> that we don't open a supplicant device context there.
> > > >>
> > > >> It would be nice to have the device context fully initialized when=
 the
> > > >> probe function returns. How about adding a "bool is_dev_ctx" to st=
ruct
> > > >> tee_context so the open() callback can tell that this is a special
> > > >> tee_contex?
> > > >
> > > > Sure, that will be useful to distinguish the device context from
> > > > normal client context.
> > > >
> > > > -Sumit
> > > >
> > >
> > > So, as far as the open() callback, I do not believe checking if it is=
 not null
> > > is reasonable for calling it here. Most drivers allocate resources an=
d then
> > > initialize them. So, assume these steps for a TEE driver:
> > >  (1) allocate internal data structures,
> > >  (2) allocate the device,
> > >  (3) initialize the internal data structurse and then
> > >  (4) register the device.
> > >
> > > Having these steps for a backend driver means that if you call open()=
 at
> > > step (2), the internal data structures are not ready.
>
> As part of tee_device_alloc(), every driver has to pass "const struct
> tee_desc *teedesc" fully initialized. Which internal data structures
> are you referring too? Is there any upstream example?

It's reasonable to wait with the open() callback until step 4 above,
which should correspond with the tee_device_register() call. Data
written only once doesn't need serialized access if the fields are
only accessed after they have been fully initialized.

>
> > >
> > > I was originally thinking of going with Jens' suggestion to open dev_=
ctx in
> > > the teedev_open(), and use a flag to distinguish the type of context =
for
> > > the open() callback
> > >
> > > What about this:
> > > Open the dev_ctx in the tee_device_register(), at the last step befor=
e
> > > setting the TEE_DEVICE_FLAG_REGISTERED flag. Then the open() callback=
 can
> > > check for this flag to determine if it is a normal context or dev_ctx=
.
> > > If the open() is called while the device has not been registered, it =
should
> > > handle it differently
> >
> > That makes sense, the driver should be prepared to handle open() calls
> > after tee_device_register() anyway.
> > However, there is no serialization of the flags field in struct
> > tee_device. Hmm, would it be too hacky for the open() callback to
> > check if &ctx->teedev.dev_ctx =3D=3D ctx? We could add a helper functio=
n
> > to wrap that check.
> >
>
> Your suggested change requires every driver to update open() callback
> and later other callbacks may have to support it too. IMHO, only
> teedev_get_dev_ctx() should be able to return a reference to device
> context for usage within the TEE and the implementation driver.

Yes, but it's only the OP-TEE driver that needs anything special. It
looks like the others can be left unchanged.

>
> I am still not able to understand why the following won't work with a
> clear lifetime for the device context?
>
> tee_device_alloc()
>   -> if (!(teedesc->flags & TEE_DESC_PRIVILEGED))
> desc->ops->open(&teedev->dev_ctx);

We must also have a fully initialized dev_ctx for the supplicant
device. I'd rather delay the open() callback until
tee_device_register() since the dev_ctx is guaranteed not to be needed
before that.

>
> tee_device_put()
>   -> if (teedev->dev_ctx) desc->ops->release(&teedev->dev_ctx);

teedev->dev_ctx is supposed to be embedded in struct tee_device, so
the if isn't needed.

Cheers,
Jens

>
> -Sumit
>
> > Cheers,
> > Jens
> >
> > >
> > > - Amir
> > >
> > > >>
> > > >> Cheers,
> > > >> Jens
> > > >>
> > > >>>
> > > >>> -Sumit

