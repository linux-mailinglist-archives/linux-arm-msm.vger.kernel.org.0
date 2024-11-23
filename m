Return-Path: <linux-arm-msm+bounces-38907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0907A9D689F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 11:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A9FA280BF9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 10:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F07E165F04;
	Sat, 23 Nov 2024 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xfD0OCV5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D44681AC8
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732357985; cv=none; b=pNugwuutSrxOHgPC/d3SBl0F3+QSxRg5R5G32Df7PIoUMSxGCUTZawVMKaGUe/7D/hPdX8OqLROwpzt+6/vHgh009wSNkxcmr3Ll+iLVEHMo783YdY83MH5MJrjPvA2v0MmkVXoJbWsmf/1J/upVSZ3imX2As6nDKbNGqaT5Usk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732357985; c=relaxed/simple;
	bh=8d309dZj8L+LLGi7TCyVP4lihuEfnwayfTgPl1UVojg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzBhptEp6UT6oFNTegNSa4DiN03Es4qy2Upe+50Q5B8cOw9btRj576aEFUgY0DBIBwa6CAb2ByVOKt3+hlp+hlWLA8SvHFvBnPwhNh6bo3mLFrgYXXZ3RwfcXKSxwh5qldr0P+z3zSrLW/W8kBqtmsLsyY/SMRIDdiB26szMyoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xfD0OCV5; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-856f083f1cfso754070241.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732357982; x=1732962782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOAy6dGmKgwnK+hMIBdxM9O8pEvWbTqPaA1bD5Xxhxw=;
        b=xfD0OCV5YWF46V17D+JmNg3KWtr0pyU4EA6IlqHTl+SHq/t4xpFFDPf2oHQYwYV+F+
         HlYXUAs+xy1ewYagsUf5R2xXvbwtImkti2uFy8kdd6K54H/Z5Xneb17/s5S1EsNv7CWR
         0NH335qwhTr8Ua8bw/yC2lza6FGnVGZS3avpIrLTdpaA56pJ+RvwNz8jLimlphXw2w6X
         tLJLgBnUkx178TeLOb/oOT2g0xHW5wijaS9gpeqhdyEpc3DyYIhFlFksx4P2c3trgEPY
         aPAofVkpVIO5WC/yrM34cDmwsCTe/NUl369b2bQZp19A13/OA30ahrImrkhB4K6ROmXr
         v82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732357982; x=1732962782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOAy6dGmKgwnK+hMIBdxM9O8pEvWbTqPaA1bD5Xxhxw=;
        b=SPF9/qpOjL4VfeoEvXOnmQVT4TM8OmaZykQjaDWX/o3DTB0djtcYDNcjarsP4K8jis
         fgSpjAiUE/udLng8vVzjN6J02ADejixzBfVGCkXrMy5TiT2LdyON54RRZtZ53NG0Rbb+
         gn3tJA5YSj6h5Sn4aIKf5U4FteyEGjYKkHKFhBRVxBFVWb89AS47uk8H6PCyjfvbCzd5
         yRjqsSW/ue5wulW4sBHpFZ50GhB/bfNwy1656GzjaisfE+Aze8okI3EpYdHPiHLoMkzw
         cpXTDkh+qnQEQvqSCugOKSMjdzVypB+8ioIJJVLgjLjKUANGdDKK+vbZQrV3fS6Yq++T
         PgHw==
X-Forwarded-Encrypted: i=1; AJvYcCW1lwVgUxPdQqMKFUKjCr9SO+vcNabX5VBaZVn0Qn651aQMGqqFUpwVPxqFeNI4sNwUpY02qPFYKCfC8H00@vger.kernel.org
X-Gm-Message-State: AOJu0YxE3uUEwPmWxqyYSCbcqwquYM5NESDXKmbUtpuP5xroskIbNv/C
	MEAjw40x6SquYCQyDir7xEl/bwE8x4femB+lASy/duYk8Krd1gZEFnNV7MnS8yUuUD5XLveItux
	vcyDIKc48kqpfe+Blyy+Jc4l4QDgtYvnFllEtVg==
X-Gm-Gg: ASbGncuYra/SNdq0DasswsT+pZHvQO/UnYSu07YaV2pzF2mW+4E1rutCZaPJ2AQ2Ik/
	4Uu0uiGRTPsPBcR7AfHYPIZNoc6s/znvf2g==
X-Google-Smtp-Source: AGHT+IFyKw+XSwT40/2g7bjWG+DRjpApp57PLV8XmIHq8zch3d9KH7OmgnbDVkLFV9NMzmLNkXNkFH27Jc7cTuAawyE=
X-Received: by 2002:a05:6102:9d0:b0:4af:476:f45f with SMTP id
 ada2fe7eead31-4af0476f6d4mr857174137.23.1732357982008; Sat, 23 Nov 2024
 02:33:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-fix-tee_shm-refcount-upstream-v1-0-5da97f584fcd@quicinc.com>
 <20241120-fix-tee_shm-refcount-upstream-v1-3-5da97f584fcd@quicinc.com>
 <CAHUa44Eoxa+NfRF-XCuV-O5uVgtC3UMT0utCLrUZ4rCBREp=pQ@mail.gmail.com> <3ab115bf-7ac6-452f-b760-0d631b6e75dd@quicinc.com>
In-Reply-To: <3ab115bf-7ac6-452f-b760-0d631b6e75dd@quicinc.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Sat, 23 Nov 2024 16:02:50 +0530
Message-ID: <CAFA6WYNBsZ5V6N676yfDgTL4jMeXtEB0xGm5zSq3BFeeCpz9Nw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amirreza,

Thanks for proposing this.

On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
>
> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
>
> Hi Jens,
>
> > Hi Amirreza,
> >
> > On Thu, Nov 21, 2024 at 2:37=E2=80=AFAM Amirreza Zarrabi
> > <quic_azarrabi@quicinc.com> wrote:
> >>
> >> The default context has a lifespan similar to the tee_device.

Since it's associated with tee_device context, let's call it obvious
via renaming it as device context instead (s/def_ctx/dev_ctx/ in this
patch).

> >> It is used as a context for shared memory if the context to which the
> >> shared memory belongs is released, making the tee_shm an orphan.
> >> This allows the driver implementing shm_unregister to safely make
> >> subsequent calls, such as to a supplicant if needed.
> >>
> >> It also enables users to free the shared memory while the driver is
> >> blocked on unregister_tee_device safely.
> >>
> >> Preferably, this should be used for all driver internal uses, using
> >> teedev_get_def_context rather than calling teedev_open.

Makes sense to me.

> >>
> >> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> >> ---
> >>  drivers/tee/optee/core.c    |  2 +-
> >>  drivers/tee/optee/ffa_abi.c |  2 +-
> >>  drivers/tee/optee/smc_abi.c |  2 +-
> >>  drivers/tee/tee_core.c      | 83 +++++++++++++++++++++++++++++-------=
---------
> >>  drivers/tee/tee_private.h   |  3 --
> >>  drivers/tee/tee_shm.c       | 18 ++--------
> >>  include/linux/tee_core.h    | 15 ++++++++
> >>  include/linux/tee_drv.h     |  7 ----
> >>  8 files changed, 73 insertions(+), 59 deletions(-)
> >>
> >> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> >> index c75fddc83576..78d43d0c8014 100644
> >> --- a/drivers/tee/optee/core.c
> >> +++ b/drivers/tee/optee/core.c
> >> @@ -173,7 +173,7 @@ void optee_remove_common(struct optee *optee)
> >>
> >>         optee_notif_uninit(optee);
> >>         optee_shm_arg_cache_uninit(optee);
> >> -       teedev_close_context(optee->ctx);
> >> +
> >>         /*
> >>          * The two devices have to be unregistered before we can free =
the
> >>          * other resources.
> >> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> >> index f3af5666bb11..6ad94f0788ad 100644
> >> --- a/drivers/tee/optee/ffa_abi.c
> >> +++ b/drivers/tee/optee/ffa_abi.c
> >> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_=
dev)
> >>         optee_shm_arg_cache_init(optee, arg_cache_flags);
> >>         mutex_init(&optee->rpmb_dev_mutex);
> >>         ffa_dev_set_drvdata(ffa_dev, optee);
> >> -       ctx =3D teedev_open(optee->teedev);
> >> +       ctx =3D teedev_get_def_context(optee->teedev);
> >>         if (IS_ERR(ctx)) {
> >>                 rc =3D PTR_ERR(ctx);
> >>                 goto err_rhashtable_free;
> >> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> >> index e9456e3e74cc..c77a3e631d04 100644
> >> --- a/drivers/tee/optee/smc_abi.c
> >> +++ b/drivers/tee/optee/smc_abi.c
> >> @@ -1722,7 +1722,7 @@ static int optee_probe(struct platform_device *p=
dev)
> >>         mutex_init(&optee->rpmb_dev_mutex);
> >>
> >>         platform_set_drvdata(pdev, optee);
> >> -       ctx =3D teedev_open(optee->teedev);
> >> +       ctx =3D teedev_get_def_context(optee->teedev);
> >>         if (IS_ERR(ctx)) {
> >>                 rc =3D PTR_ERR(ctx);
> >>                 goto err_supp_uninit;
> >> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> >> index 93f3b330aec8..805e1336089d 100644
> >> --- a/drivers/tee/tee_core.c
> >> +++ b/drivers/tee/tee_core.c
> >> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(struct tee_device *t=
eedev)
> >>                 goto err;
> >>         }
> >>
> >> -       kref_init(&ctx->refcount);
> >>         ctx->teedev =3D teedev;
> >>         INIT_LIST_HEAD(&ctx->list_shm);
> >>         rc =3D teedev->desc->ops->open(ctx);
> >> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(struct tee_device =
*teedev)
> >>  }
> >>  EXPORT_SYMBOL_GPL(teedev_open);
> >>
> >> -void teedev_ctx_get(struct tee_context *ctx)
> >> +struct tee_context *teedev_get_def_context(struct tee_device *teedev)
> >>  {
> >> -       if (ctx->releasing)
> >> -               return;
> >> +       int rc;
> >> +       struct tee_context *ctx =3D &teedev->def_ctx;
> >>
> >> -       kref_get(&ctx->refcount);
> >> -}
> >> +       ctx->teedev =3D teedev;
> >> +       INIT_LIST_HEAD(&ctx->list_shm);
> >> +       rc =3D teedev->desc->ops->open(ctx);
> >> +       if (rc)
> >> +               return ERR_PTR(rc);
> >
> > I think ctx->teedev and ctx->list_shm must always be initialized or
> > &teedev->def_ctx can't be used in teedev_close_context().
>
> True, but &teedev->def_ctx is never used in teedev_close_context().
> The closing of the &teedev->def_ctx simply ignored. So once opened,
> &teedev->def_ctx will always remain open until the tee_device is alive.
>
> > We could initialize teedev->def_ctx on the first call to teedev_open()
> > on that tee_device. We need a way to tell the
> > teedev->desc->ops->open() to the backed driver that it's initializing
> > the default context though, or optee_open() can't handle the
> > tee-supplicant case properly.
> >
>
> That's a good point. This way, it is guaranteed that there is one def_ctx
> per teedev. There should be a way to tell the open() callback that it is
> a def_ctx, so it is not registered as a supplicant context.
>
>
> > Should we allow this function to be called more than once for each teed=
ev?
>
> Yes, moving to teedev_open() will fix the issue.
>
> > Do we need serialization in this function if it's called after the
> > driver is probed?
> >
>
> True. I'll make sure there is no race.
>
> >>
> >> -static void teedev_ctx_release(struct kref *ref)
> >> -{
> >> -       struct tee_context *ctx =3D container_of(ref, struct tee_conte=
xt,
> >> -                                              refcount);
> >> -       ctx->releasing =3D true;
> >> -       ctx->teedev->desc->ops->release(ctx);
> >> -       kfree(ctx);
> >> +       return ctx;
> >>  }
> >> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
> >>
> >> -void teedev_ctx_put(struct tee_context *ctx)
> >> +void teedev_close_context(struct tee_context *ctx)
> >>  {
> >> -       if (ctx->releasing)
> >> +       struct tee_device *teedev =3D ctx->teedev;
> >> +       struct tee_shm *shm;
> >> +
> >> +       if (ctx =3D=3D &teedev->def_ctx)
> >>                 return;
> >>
> >> -       kref_put(&ctx->refcount, teedev_ctx_release);
> >> -}
> >> +       teedev->desc->ops->release(ctx);
> >>
> >> -void teedev_close_context(struct tee_context *ctx)
> >> -{
> >> -       struct tee_device *teedev =3D ctx->teedev;
> >> +       mutex_lock(&teedev->mutex);
> >> +       list_for_each_entry(shm, &ctx->list_shm, link) {
> >> +               /* Context released. However, shm still holding a teed=
ev reference.
> >> +                * Replace shm->ctx with the default context so that t=
ee_shm_get_from_id()
> >> +                * fails (i.e. it is not accessible from userspace) bu=
t shm still
> >> +                * holds a valid context for further clean up, e.g. sh=
m_unregister().
> >> +                */
> >
> > /*
> >  * Please format
> >  * multiline comments
> >  * like this. Please
> >  * keep the lines at
> >  * max 80 columns
> >  * here and at other
> >  * places in the patch-
> >  * set.
> >  */
> >
>
> Ack.
>
> >> +               shm->ctx =3D &teedev->def_ctx;
> >
> > shm->ctx will always point to a valid context, even if it is the
> > default context. It seems that we can always get hold of the correct
> > teedev via shm->ctx->teedev. Do we need "tee: revert removal of
> > redundant teedev in struct tee_shm"?
> >
>
> It was there in case we wanted to use NULL, but with def_ctx, it is not
> necessary. I am withdrawing that commit. :).
>
> > Shouldn't the shm be removed from the ctx->list_shm and be moved to
> > teedev->def_ctx.list_shm?

+1

> >
>
> Not really. If we put shm in the teedev->def_ctx.list_shm, by the time
> we are closing the def_ctx, the list is guaranteed to be empty.
>
> However, I understand it is cleaner and more consistent to do that rather
> than making changes to tee_shm_put().
>
> I'll do it.
>
> >> +       }
> >> +       mutex_unlock(&teedev->mutex);
> >>
> >> -       teedev_ctx_put(ctx);
> >> +       kfree(ctx);
> >>         tee_device_put(teedev);
> >>  }
> >>  EXPORT_SYMBOL_GPL(teedev_close_context);
> >> @@ -946,6 +952,8 @@ struct tee_device *tee_device_alloc(const struct t=
ee_desc *teedesc,
> >>
> >>         teedev->desc =3D teedesc;
> >>         teedev->pool =3D pool;
> >> +       /* Only open default context when teedev_get_def_context() cal=
led. */
> >> +       teedev->def_ctx.teedev =3D NULL;

Why don't you open the device context here only? This will associate
it automatically with teedev lifespan and then
teedev_get_def_context() will just return a reference to that.

-Sumit

> >>
> >>         return teedev;
> >>  err_devt:
> >> @@ -1027,16 +1035,31 @@ EXPORT_SYMBOL_GPL(tee_device_register);
> >>
> >>  void tee_device_put(struct tee_device *teedev)
> >>  {
> >> -       mutex_lock(&teedev->mutex);
> >> -       /* Shouldn't put in this state */
> >> -       if (!WARN_ON(!teedev->desc)) {
> >> -               teedev->num_users--;
> >> -               if (!teedev->num_users) {
> >> -                       teedev->desc =3D NULL;
> >> -                       complete(&teedev->c_no_users);
> >> -               }
> >> +       const struct tee_desc *desc;
> >> +
> >> +       scoped_guard(mutex, &teedev->mutex) {
> >> +               desc =3D teedev->desc;
> >> +
> >> +               /* Shouldn't put in this state */
> >> +               if (WARN_ON(!desc))
> >> +                       return;
> >> +
> >> +               /* If there is still users for teedev */
> >> +               if (--teedev->num_users)
> >
> > Please do teedev->num_users-- first and then check. It makes the code
> > easier to read.
>
> Ack.
>
> >
> >> +                       return;
> >> +
> >> +               /* tee_device_unregister() has been called and there i=
s no
> >> +                * user in userspace or kernel, including orphan shm f=
or teedev.
> >> +                * Set teedev->desc to NULL, so that teedev can not be=
 reused.
> >> +                */
> >> +               teedev->desc =3D NULL;
> >>         }
> >> -       mutex_unlock(&teedev->mutex);
> >> +
> >> +       /* Release the default context */
> >> +       desc->ops->release(&teedev->def_ctx);
> >
> > This should only be done if teedev->def_ctx has been initialized.
> >
>
> Ack.
>
> > Cheers,
> > Jens
>
> Thank you very much for your comments :).
> If you're okay with introducing def_ctx, I'll prepare a complete patchset
> with all the details.
>
> Best Regards,
> Amir
>
>
> >
> >> +       teedev->def_ctx.teedev =3D NULL;
> >> +
> >> +       complete(&teedev->c_no_users);
> >>  }
> >>
> >>  bool tee_device_get(struct tee_device *teedev)
> >> diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> >> index 9bc50605227c..6c7bcc308958 100644
> >> --- a/drivers/tee/tee_private.h
> >> +++ b/drivers/tee/tee_private.h
> >> @@ -17,9 +17,6 @@ int tee_shm_get_fd(struct tee_shm *shm);
> >>  bool tee_device_get(struct tee_device *teedev);
> >>  void tee_device_put(struct tee_device *teedev);
> >>
> >> -void teedev_ctx_get(struct tee_context *ctx);
> >> -void teedev_ctx_put(struct tee_context *ctx);
> >> -
> >>  struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_=
t size);
> >>  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
> >>                                           unsigned long addr, size_t l=
ength);
> >> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> >> index c0164c0f4a01..f07274291edf 100644
> >> --- a/drivers/tee/tee_shm.c
> >> +++ b/drivers/tee/tee_shm.c
> >> @@ -59,8 +59,6 @@ static void tee_shm_release(struct tee_shm *shm)
> >>                 release_registered_pages(shm);
> >>         }
> >>
> >> -       teedev_ctx_put(shm->ctx);
> >> -
> >>         kfree(shm);
> >>
> >>         tee_device_put(teedev);
> >> @@ -93,13 +91,6 @@ static struct tee_shm *shm_alloc_helper(struct tee_=
context *ctx, size_t size,
> >>         shm->flags =3D flags;
> >>         shm->teedev =3D teedev;
> >>         shm->id =3D id;
> >> -
> >> -       /*
> >> -        * We're assigning this as it is needed if the shm is to be
> >> -        * registered. If this function returns OK then the caller exp=
ected
> >> -        * to call teedev_ctx_get() or clear shm->ctx in case it's not
> >> -        * needed any longer.
> >> -        */
> >>         shm->ctx =3D ctx;
> >>
> >>         rc =3D teedev->pool->ops->alloc(teedev->pool, shm, size, align=
);
> >> @@ -112,7 +103,6 @@ static struct tee_shm *shm_alloc_helper(struct tee=
_context *ctx, size_t size,
> >>         list_add_tail(&shm->link, &ctx->list_shm);
> >>         mutex_unlock(&teedev->mutex);
> >>
> >> -       teedev_ctx_get(ctx);
> >>         return shm;
> >>  err_kfree:
> >>         kfree(shm);
> >> @@ -295,12 +285,10 @@ register_shm_helper(struct tee_context *ctx, str=
uct iov_iter *iter, u32 flags,
> >>                 goto err_dev_put;
> >>         }
> >>
> >> -       teedev_ctx_get(ctx);
> >> -
> >>         shm =3D kzalloc(sizeof(*shm), GFP_KERNEL);
> >>         if (!shm) {
> >>                 ret =3D ERR_PTR(-ENOMEM);
> >> -               goto err_ctx_put;
> >> +               goto err_dev_put;
> >>         }
> >>
> >>         refcount_set(&shm->refcount, 1);
> >> @@ -313,7 +301,7 @@ register_shm_helper(struct tee_context *ctx, struc=
t iov_iter *iter, u32 flags,
> >>         num_pages =3D iov_iter_npages(iter, INT_MAX);
> >>         if (!num_pages) {
> >>                 ret =3D ERR_PTR(-ENOMEM);
> >> -               goto err_ctx_put;
> >> +               goto err_dev_put;
> >>         }
> >>
> >>         shm->pages =3D kcalloc(num_pages, sizeof(*shm->pages), GFP_KER=
NEL);
> >> @@ -361,8 +349,6 @@ register_shm_helper(struct tee_context *ctx, struc=
t iov_iter *iter, u32 flags,
> >>         kfree(shm->pages);
> >>  err_free_shm:
> >>         kfree(shm);
> >> -err_ctx_put:
> >> -       teedev_ctx_put(ctx);
> >>  err_dev_put:
> >>         tee_device_put(teedev);
> >>         return ret;
> >> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> >> index a38494d6b5f4..13393ddac530 100644
> >> --- a/include/linux/tee_core.h
> >> +++ b/include/linux/tee_core.h
> >> @@ -44,6 +44,7 @@
> >>   * @idr:       register of user space shared memory objects allocated=
 or
> >>   *             registered on this device
> >>   * @pool:      shared memory pool
> >> + * @def_ctx:   default context used if there is no context available,=
 e.g. internal driver calls.
> >>   */
> >>  struct tee_device {
> >>         char name[TEE_MAX_DEV_NAME_LEN];
> >> @@ -60,6 +61,7 @@ struct tee_device {
> >>
> >>         struct idr idr;
> >>         struct tee_shm_pool *pool;
> >> +       struct tee_context def_ctx;
> >>  };
> >>
> >>  /**
> >> @@ -309,6 +311,19 @@ static inline bool tee_param_is_memref(struct tee=
_param *param)
> >>   */
> >>  struct tee_context *teedev_open(struct tee_device *teedev);
> >>
> >> +/**
> >> + * teedev_get_def_context() - Get default context for a struct tee_de=
vice
> >> + * @teedev:    Device to open
> >> + *
> >> + * Unlike a context that returned from teedev_open(), the default con=
text is static
> >> + * and available as long as @teedev has a user ''other then this cont=
ext''. This context
> >> + * can be used for driver internal operation and clean up where a con=
text should be
> >> + * available, while tee_device_unregister() is waiting for other user=
s to go away.
> >> + *
> >> + * @return a pointer to struct tee_context on success or an ERR_PTR o=
n failure.
> >> + */
> >> +struct tee_context *teedev_get_def_context(struct tee_device *teedev)=
;
> >> +
> >>  /**
> >>   * teedev_close_context() - closes a struct tee_context
> >>   * @ctx:       The struct tee_context to close
> >> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> >> index 1b57cddfecc8..9633e14ba484 100644
> >> --- a/include/linux/tee_drv.h
> >> +++ b/include/linux/tee_drv.h
> >> @@ -7,7 +7,6 @@
> >>  #define __TEE_DRV_H
> >>
> >>  #include <linux/device.h>
> >> -#include <linux/kref.h>
> >>  #include <linux/list.h>
> >>  #include <linux/mod_devicetable.h>
> >>  #include <linux/tee.h>
> >> @@ -25,10 +24,6 @@ struct tee_device;
> >>   * @teedev:    pointer to this drivers struct tee_device
> >>   * @list_shm:  List of shared memory object owned by this context
> >>   * @data:      driver specific context data, managed by the driver
> >> - * @refcount:  reference counter for this structure
> >> - * @releasing:  flag that indicates if context is being released righ=
t now.
> >> - *             It is needed to break circular dependency on context d=
uring
> >> - *              shared memory release.
> >>   * @supp_nowait: flag that indicates that requests in this context sh=
ould not
> >>   *              wait for tee-supplicant daemon to be started if not p=
resent
> >>   *              and just return with an error code. It is needed for =
requests
> >> @@ -41,8 +36,6 @@ struct tee_context {
> >>         struct tee_device *teedev;
> >>         struct list_head list_shm;
> >>         void *data;
> >> -       struct kref refcount;
> >> -       bool releasing;
> >>         bool supp_nowait;
> >>         bool cap_memref_null;
> >>  };
> >>
> >> --
> >> 2.34.1
> >>

