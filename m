Return-Path: <linux-arm-msm+bounces-39248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D819DA1EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 07:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 809BB169079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 06:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85369145A1C;
	Wed, 27 Nov 2024 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmNZdY/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2469213AA3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732687328; cv=none; b=oERjPFRHPrN/FksbUCctEecbB9FpomS+r2EeJ6EHT40GYjAQTyTclAwxriqn0/AeO2kIoHcKH/LaKbgSnwAgmtJ2zqQHXgkGMNMQn2Y370+Geak+rhKxM6J4HVcEjjWiw1nWWeIsLQT2YwA5n5BQtdT+uiGK9VlMembb0eEdkXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732687328; c=relaxed/simple;
	bh=UPEMoqVDW5+vANItoLNP1RG5IPc7Kd+25XiesT/guCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZgcw0pRnCWxgoKDtObwpZwFbNjbLLjJRwMZ5z/MxUYxAkYSNjJkIcqNjRqg1BJLrZ/b3embIxRm1SDSBO9G/5jn5A/uoyE8i5jvxsWuX537w8FwFJvcNIfcL8rAxicqXdvXSBe6PkbqWWjC76ycrUrL9WpWEUy1G+yxkjrlLeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmNZdY/d; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4af1ace57c7so254851137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 22:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732687325; x=1733292125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYj2+Bj9LTH37WUB1sa9W7uetzsO9LURIPsDUM4Nc04=;
        b=dmNZdY/dW7WvadapkHERUU03SwirH/IsUS1svJE9E7zhffifoc+deWSaSzRSSFkdgQ
         2IS5YjWFTgrJFqOfFyzs/bylGS2oXHYEZOWmpY4VjFcnWv+bxLHmmUYDxI1osIByaptL
         UAyWw6r3W84NY5rXKhHhe4rXGvFhiDFRtkPutgDmKZeeybTkUStKIDykBP62sMRY7H5E
         I9HabK64TEee5OzhEkygVKIkNKQFJAbGjCTcwx0PvndwWwHzvSRRDV1VylKiCRvHdxQo
         CTcquLN3IrhewA+aieE/uuqYm6L63IoGKs7pvwILP76AFfsNlgRtVbawgrB81dTCc909
         2hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732687325; x=1733292125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYj2+Bj9LTH37WUB1sa9W7uetzsO9LURIPsDUM4Nc04=;
        b=KVQmgUHEgg2JrBIeXCI7r9V//yLfPl8A5WYaE2WVIq6Mxk3FBp0oVFJVTe1wp+yQGG
         OM+s5ro88jdaJRE1X3VBh1Q94PqN+z+uQDfj1AQ9fAE11WIFWNpyWYICOg8kKA6008+2
         jOeomcOM6YPALHe2aSlQ06wVK59JahwPLzXhCWnalv5zj1BJMCANRPDJ2KVWUYCpiDNP
         Mezlf5DxDJMxZYFxJ8kJ2qnc+ZXBOke/Q0wZdoUxdYcvaOBPsvBzq4mmONnaUjIig8Bt
         6ILXMaUYUrtRQD6YkXWOBkMy6tggH/Rik2wkJX9HO81l4E0WS9vLpjCI4IvqjT/VkAi3
         nsDw==
X-Forwarded-Encrypted: i=1; AJvYcCUVyWNA5dSeRT1V2kkCbnQuerv+ekyZhmSAhDDLtDuxmUVqhA1FaXNgtDI6pHPjh9KG/hlG7bXGK8Khk/8R@vger.kernel.org
X-Gm-Message-State: AOJu0YzP4KUWi5sESd/SzfoFj0dZquDn12B5Id9eJhwTvkCDUUqDvH8N
	N6NK0o5Zi3+62x7Ex1VKb/f3b1uL481P2ROQ7F4p81MouvDaGUk0mz0rXsUPa0E5S5STUR1tT5O
	c+PeQXK819NPKf/dJG2Nxw5GkMtfzaXhYBIlGpN88dcZx54hSEE0=
X-Gm-Gg: ASbGncvqvLBxpyQ3syiGhAXK6zB2vkbTdLFRCsNbySuHLmZxMHPenEN1zNuucS3D04B
	rLMijSw6l/MK9nGl71sv2m+dnomfaPFqZ
X-Google-Smtp-Source: AGHT+IFG3XBWjmHp8iRN5Xljtu23ITld1lCc0UdZQ94nec2hK9d+4+SRn05BD7ReRsHUVWsoR5q17tKwE0N07xm68PU=
X-Received: by 2002:a05:6102:b15:b0:4af:111b:a787 with SMTP id
 ada2fe7eead31-4af35e67dc4mr6435773137.1.1732687324939; Tue, 26 Nov 2024
 22:02:04 -0800 (PST)
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
 <CAFA6WYPUZN752aT7+ejoiYYoLs_XNV7w9wT7kBrE=vvEJO+8_g@mail.gmail.com> <CAHUa44F7_yGQFJq6BsoCv6AfB_TjuiGP84YaQ-kz=_e1ni+xyA@mail.gmail.com>
In-Reply-To: <CAHUa44F7_yGQFJq6BsoCv6AfB_TjuiGP84YaQ-kz=_e1ni+xyA@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 27 Nov 2024 11:31:53 +0530
Message-ID: <CAFA6WYORjTjfA-QTcyuvqpBOr9uoS+KVikA2mhyfdMmh5K0tiA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Amirreza Zarrabi <quic_azarrabi@quicinc.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Nov 2024 at 20:52, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> On Tue, Nov 26, 2024 at 1:27=E2=80=AFPM Sumit Garg <sumit.garg@linaro.org=
> wrote:
> >
> > On Tue, 26 Nov 2024 at 14:03, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> > >
> > > On Mon, Nov 25, 2024 at 9:55=E2=80=AFPM Amirreza Zarrabi
> > > <quic_azarrabi@quicinc.com> wrote:
> > > >
> > > >
> > > >
> > > > On 11/25/2024 6:51 PM, Sumit Garg wrote:
> > > > > On Mon, 25 Nov 2024 at 12:53, Jens Wiklander <jens.wiklander@lina=
ro.org> wrote:
> > > > >>
> > > > >> On Mon, Nov 25, 2024 at 7:14=E2=80=AFAM Sumit Garg <sumit.garg@l=
inaro.org> wrote:
> > > > >>>
> > > > >>> On Mon, 25 Nov 2024 at 03:00, Amirreza Zarrabi
> > > > >>> <quic_azarrabi@quicinc.com> wrote:
> > > > >>>>
> > > > >>>>
> > > > >>>> Hi Sumit,
> > > > >>>>
> > > > >>>> Thank you so much for the comemnts :).
> > > > >>>>
> > > > >>>> On 11/23/2024 9:32 PM, Sumit Garg wrote:
> > > > >>>>> Hi Amirreza,
> > > > >>>>>
> > > > >>>>> Thanks for proposing this.
> > > > >>>>>
> > > > >>>>> On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
> > > > >>>>> <quic_azarrabi@quicinc.com> wrote:
> > > > >>>>>>
> > > > >>>>>>
> > > > >>>>>> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
> > > > >>>>>>
> > > > >>>>>> Hi Jens,
> > > > >>>>>>
> > > > >>>>>>> Hi Amirreza,
> > > > >>>>>>>
> > > > >>>>>>> On Thu, Nov 21, 2024 at 2:37=E2=80=AFAM Amirreza Zarrabi
> > > > >>>>>>> <quic_azarrabi@quicinc.com> wrote:
> > > > >>>>>>>>
> > > > >>>>>>>> The default context has a lifespan similar to the tee_devi=
ce.
> > > > >>>>>
> > > > >>>>> Since it's associated with tee_device context, let's call it =
obvious
> > > > >>>>> via renaming it as device context instead (s/def_ctx/dev_ctx/=
 in this
> > > > >>>>> patch).
> > > > >>>>>
> > > > >>>>
> > > > >>>> Make sense, I'll rename it.
> > > > >>>>
> > > > >>>>>>>> It is used as a context for shared memory if the context t=
o which the
> > > > >>>>>>>> shared memory belongs is released, making the tee_shm an o=
rphan.
> > > > >>>>>>>> This allows the driver implementing shm_unregister to safe=
ly make
> > > > >>>>>>>> subsequent calls, such as to a supplicant if needed.
> > > > >>>>>>>>
> > > > >>>>>>>> It also enables users to free the shared memory while the =
driver is
> > > > >>>>>>>> blocked on unregister_tee_device safely.
> > > > >>>>>>>>
> > > > >>>>>>>> Preferably, this should be used for all driver internal us=
es, using
> > > > >>>>>>>> teedev_get_def_context rather than calling teedev_open.
> > > > >>>>>
> > > > >>>>> Makes sense to me.
> > > > >>>>>
> > > > >>>>>>>>
> > > > >>>>>>>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com=
>
> > > > >>>>>>>> ---
> > > > >>>>>>>>  drivers/tee/optee/core.c    |  2 +-
> > > > >>>>>>>>  drivers/tee/optee/ffa_abi.c |  2 +-
> > > > >>>>>>>>  drivers/tee/optee/smc_abi.c |  2 +-
> > > > >>>>>>>>  drivers/tee/tee_core.c      | 83 ++++++++++++++++++++++++=
+++++----------------
> > > > >>>>>>>>  drivers/tee/tee_private.h   |  3 --
> > > > >>>>>>>>  drivers/tee/tee_shm.c       | 18 ++--------
> > > > >>>>>>>>  include/linux/tee_core.h    | 15 ++++++++
> > > > >>>>>>>>  include/linux/tee_drv.h     |  7 ----
> > > > >>>>>>>>  8 files changed, 73 insertions(+), 59 deletions(-)
> > > > >>>>>>>>
> > > > >>>>>>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/=
core.c
> > > > >>>>>>>> index c75fddc83576..78d43d0c8014 100644
> > > > >>>>>>>> --- a/drivers/tee/optee/core.c
> > > > >>>>>>>> +++ b/drivers/tee/optee/core.c
> > > > >>>>>>>> @@ -173,7 +173,7 @@ void optee_remove_common(struct optee =
*optee)
> > > > >>>>>>>>
> > > > >>>>>>>>         optee_notif_uninit(optee);
> > > > >>>>>>>>         optee_shm_arg_cache_uninit(optee);
> > > > >>>>>>>> -       teedev_close_context(optee->ctx);
> > > > >>>>>>>> +
> > > > >>>>>>>>         /*
> > > > >>>>>>>>          * The two devices have to be unregistered before =
we can free the
> > > > >>>>>>>>          * other resources.
> > > > >>>>>>>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/opt=
ee/ffa_abi.c
> > > > >>>>>>>> index f3af5666bb11..6ad94f0788ad 100644
> > > > >>>>>>>> --- a/drivers/tee/optee/ffa_abi.c
> > > > >>>>>>>> +++ b/drivers/tee/optee/ffa_abi.c
> > > > >>>>>>>> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct ffa_=
device *ffa_dev)
> > > > >>>>>>>>         optee_shm_arg_cache_init(optee, arg_cache_flags);
> > > > >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> > > > >>>>>>>>         ffa_dev_set_drvdata(ffa_dev, optee);
> > > > >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> > > > >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > > > >>>>>>>>         if (IS_ERR(ctx)) {
> > > > >>>>>>>>                 rc =3D PTR_ERR(ctx);
> > > > >>>>>>>>                 goto err_rhashtable_free;
> > > > >>>>>>>> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/opt=
ee/smc_abi.c
> > > > >>>>>>>> index e9456e3e74cc..c77a3e631d04 100644
> > > > >>>>>>>> --- a/drivers/tee/optee/smc_abi.c
> > > > >>>>>>>> +++ b/drivers/tee/optee/smc_abi.c
> > > > >>>>>>>> @@ -1722,7 +1722,7 @@ static int optee_probe(struct platfo=
rm_device *pdev)
> > > > >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> > > > >>>>>>>>
> > > > >>>>>>>>         platform_set_drvdata(pdev, optee);
> > > > >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> > > > >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > > > >>>>>>>>         if (IS_ERR(ctx)) {
> > > > >>>>>>>>                 rc =3D PTR_ERR(ctx);
> > > > >>>>>>>>                 goto err_supp_uninit;
> > > > >>>>>>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core=
.c
> > > > >>>>>>>> index 93f3b330aec8..805e1336089d 100644
> > > > >>>>>>>> --- a/drivers/tee/tee_core.c
> > > > >>>>>>>> +++ b/drivers/tee/tee_core.c
> > > > >>>>>>>> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(struct t=
ee_device *teedev)
> > > > >>>>>>>>                 goto err;
> > > > >>>>>>>>         }
> > > > >>>>>>>>
> > > > >>>>>>>> -       kref_init(&ctx->refcount);
> > > > >>>>>>>>         ctx->teedev =3D teedev;
> > > > >>>>>>>>         INIT_LIST_HEAD(&ctx->list_shm);
> > > > >>>>>>>>         rc =3D teedev->desc->ops->open(ctx);
> > > > >>>>>>>> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(struct=
 tee_device *teedev)
> > > > >>>>>>>>  }
> > > > >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_open);
> > > > >>>>>>>>
> > > > >>>>>>>> -void teedev_ctx_get(struct tee_context *ctx)
> > > > >>>>>>>> +struct tee_context *teedev_get_def_context(struct tee_dev=
ice *teedev)
> > > > >>>>>>>>  {
> > > > >>>>>>>> -       if (ctx->releasing)
> > > > >>>>>>>> -               return;
> > > > >>>>>>>> +       int rc;
> > > > >>>>>>>> +       struct tee_context *ctx =3D &teedev->def_ctx;
> > > > >>>>>>>>
> > > > >>>>>>>> -       kref_get(&ctx->refcount);
> > > > >>>>>>>> -}
> > > > >>>>>>>> +       ctx->teedev =3D teedev;
> > > > >>>>>>>> +       INIT_LIST_HEAD(&ctx->list_shm);
> > > > >>>>>>>> +       rc =3D teedev->desc->ops->open(ctx);
> > > > >>>>>>>> +       if (rc)
> > > > >>>>>>>> +               return ERR_PTR(rc);
> > > > >>>>>>>
> > > > >>>>>>> I think ctx->teedev and ctx->list_shm must always be initia=
lized or
> > > > >>>>>>> &teedev->def_ctx can't be used in teedev_close_context().
> > > > >>>>>>
> > > > >>>>>> True, but &teedev->def_ctx is never used in teedev_close_con=
text().
> > > > >>>>>> The closing of the &teedev->def_ctx simply ignored. So once =
opened,
> > > > >>>>>> &teedev->def_ctx will always remain open until the tee_devic=
e is alive.
> > > > >>>>>>
> > > > >>>>>>> We could initialize teedev->def_ctx on the first call to te=
edev_open()
> > > > >>>>>>> on that tee_device. We need a way to tell the
> > > > >>>>>>> teedev->desc->ops->open() to the backed driver that it's in=
itializing
> > > > >>>>>>> the default context though, or optee_open() can't handle th=
e
> > > > >>>>>>> tee-supplicant case properly.
> > > > >>>>>>>
> > > > >>>>>>
> > > > >>>>>> That's a good point. This way, it is guaranteed that there i=
s one def_ctx
> > > > >>>>>> per teedev. There should be a way to tell the open() callbac=
k that it is
> > > > >>>>>> a def_ctx, so it is not registered as a supplicant context.
> > > > >>>>>>
> > > > >>>>>>
> > > > >>>>>>> Should we allow this function to be called more than once f=
or each teedev?
> > > > >>>>>>
> > > > >>>>>> Yes, moving to teedev_open() will fix the issue.
> > > > >>>>>>
> > > > >>>>>>> Do we need serialization in this function if it's called af=
ter the
> > > > >>>>>>> driver is probed?
> > > > >>>>>>>
> > > > >>>>>>
> > > > >>>>>> True. I'll make sure there is no race.
> > > > >>>>>>
> > > > >>>>>>>>
> > > > >>>>>>>> -static void teedev_ctx_release(struct kref *ref)
> > > > >>>>>>>> -{
> > > > >>>>>>>> -       struct tee_context *ctx =3D container_of(ref, stru=
ct tee_context,
> > > > >>>>>>>> -                                              refcount);
> > > > >>>>>>>> -       ctx->releasing =3D true;
> > > > >>>>>>>> -       ctx->teedev->desc->ops->release(ctx);
> > > > >>>>>>>> -       kfree(ctx);
> > > > >>>>>>>> +       return ctx;
> > > > >>>>>>>>  }
> > > > >>>>>>>> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
> > > > >>>>>>>>
> > > > >>>>>>>> -void teedev_ctx_put(struct tee_context *ctx)
> > > > >>>>>>>> +void teedev_close_context(struct tee_context *ctx)
> > > > >>>>>>>>  {
> > > > >>>>>>>> -       if (ctx->releasing)
> > > > >>>>>>>> +       struct tee_device *teedev =3D ctx->teedev;
> > > > >>>>>>>> +       struct tee_shm *shm;
> > > > >>>>>>>> +
> > > > >>>>>>>> +       if (ctx =3D=3D &teedev->def_ctx)
> > > > >>>>>>>>                 return;
> > > > >>>>>>>>
> > > > >>>>>>>> -       kref_put(&ctx->refcount, teedev_ctx_release);
> > > > >>>>>>>> -}
> > > > >>>>>>>> +       teedev->desc->ops->release(ctx);
> > > > >>>>>>>>
> > > > >>>>>>>> -void teedev_close_context(struct tee_context *ctx)
> > > > >>>>>>>> -{
> > > > >>>>>>>> -       struct tee_device *teedev =3D ctx->teedev;
> > > > >>>>>>>> +       mutex_lock(&teedev->mutex);
> > > > >>>>>>>> +       list_for_each_entry(shm, &ctx->list_shm, link) {
> > > > >>>>>>>> +               /* Context released. However, shm still ho=
lding a teedev reference.
> > > > >>>>>>>> +                * Replace shm->ctx with the default conte=
xt so that tee_shm_get_from_id()
> > > > >>>>>>>> +                * fails (i.e. it is not accessible from u=
serspace) but shm still
> > > > >>>>>>>> +                * holds a valid context for further clean=
 up, e.g. shm_unregister().
> > > > >>>>>>>> +                */
> > > > >>>>>>>
> > > > >>>>>>> /*
> > > > >>>>>>>  * Please format
> > > > >>>>>>>  * multiline comments
> > > > >>>>>>>  * like this. Please
> > > > >>>>>>>  * keep the lines at
> > > > >>>>>>>  * max 80 columns
> > > > >>>>>>>  * here and at other
> > > > >>>>>>>  * places in the patch-
> > > > >>>>>>>  * set.
> > > > >>>>>>>  */
> > > > >>>>>>>
> > > > >>>>>>
> > > > >>>>>> Ack.
> > > > >>>>>>
> > > > >>>>>>>> +               shm->ctx =3D &teedev->def_ctx;
> > > > >>>>>>>
> > > > >>>>>>> shm->ctx will always point to a valid context, even if it i=
s the
> > > > >>>>>>> default context. It seems that we can always get hold of th=
e correct
> > > > >>>>>>> teedev via shm->ctx->teedev. Do we need "tee: revert remova=
l of
> > > > >>>>>>> redundant teedev in struct tee_shm"?
> > > > >>>>>>>
> > > > >>>>>>
> > > > >>>>>> It was there in case we wanted to use NULL, but with def_ctx=
, it is not
> > > > >>>>>> necessary. I am withdrawing that commit. :).
> > > > >>>>>>
> > > > >>>>>>> Shouldn't the shm be removed from the ctx->list_shm and be =
moved to
> > > > >>>>>>> teedev->def_ctx.list_shm?
> > > > >>>>>
> > > > >>>>> +1
> > > > >>>>>
> > > > >>>>
> > > > >>>> Ack.
> > > > >>>>
> > > > >>>>>>>
> > > > >>>>>>
> > > > >>>>>> Not really. If we put shm in the teedev->def_ctx.list_shm, b=
y the time
> > > > >>>>>> we are closing the def_ctx, the list is guaranteed to be emp=
ty.
> > > > >>>>>>
> > > > >>>>>> However, I understand it is cleaner and more consistent to d=
o that rather
> > > > >>>>>> than making changes to tee_shm_put().
> > > > >>>>>>
> > > > >>>>>> I'll do it.
> > > > >>>>>>
> > > > >>>>>>>> +       }
> > > > >>>>>>>> +       mutex_unlock(&teedev->mutex);
> > > > >>>>>>>>
> > > > >>>>>>>> -       teedev_ctx_put(ctx);
> > > > >>>>>>>> +       kfree(ctx);
> > > > >>>>>>>>         tee_device_put(teedev);
> > > > >>>>>>>>  }
> > > > >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_close_context);
> > > > >>>>>>>> @@ -946,6 +952,8 @@ struct tee_device *tee_device_alloc(co=
nst struct tee_desc *teedesc,
> > > > >>>>>>>>
> > > > >>>>>>>>         teedev->desc =3D teedesc;
> > > > >>>>>>>>         teedev->pool =3D pool;
> > > > >>>>>>>> +       /* Only open default context when teedev_get_def_c=
ontext() called. */
> > > > >>>>>>>> +       teedev->def_ctx.teedev =3D NULL;
> > > > >>>>>
> > > > >>>>> Why don't you open the device context here only? This will as=
sociate
> > > > >>>>> it automatically with teedev lifespan and then
> > > > >>>>> teedev_get_def_context() will just return a reference to that=
.
> > > > >>>>>
> > > > >>>>> -Sumit
> > > > >>>>>
> > > > >>>>
> > > > >>>> So my assumption is that the tee_devic_alloc() is called as pa=
rt of
> > > > >>>> the driver initialization; there is no guarantee that at this =
time the
> > > > >>>> driver is actually ready to accept any open() callback.
> > > > >>>>
> > > > >>>
> > > > >>> The drivers should be able to handle open() callback since we a=
lready
> > > > >>> check for !teedesc->ops->open in the beginning of tee_devic_all=
oc().
> > > > >>> Also, we need to open a device context for !TEE_DESC_PRIVILEGED=
 such
> > > > >>> that we don't open a supplicant device context there.
> > > > >>
> > > > >> It would be nice to have the device context fully initialized wh=
en the
> > > > >> probe function returns. How about adding a "bool is_dev_ctx" to =
struct
> > > > >> tee_context so the open() callback can tell that this is a speci=
al
> > > > >> tee_contex?
> > > > >
> > > > > Sure, that will be useful to distinguish the device context from
> > > > > normal client context.
> > > > >
> > > > > -Sumit
> > > > >
> > > >
> > > > So, as far as the open() callback, I do not believe checking if it =
is not null
> > > > is reasonable for calling it here. Most drivers allocate resources =
and then
> > > > initialize them. So, assume these steps for a TEE driver:
> > > >  (1) allocate internal data structures,
> > > >  (2) allocate the device,
> > > >  (3) initialize the internal data structurse and then
> > > >  (4) register the device.
> > > >
> > > > Having these steps for a backend driver means that if you call open=
() at
> > > > step (2), the internal data structures are not ready.
> >
> > As part of tee_device_alloc(), every driver has to pass "const struct
> > tee_desc *teedesc" fully initialized. Which internal data structures
> > are you referring too? Is there any upstream example?
>
> It's reasonable to wait with the open() callback until step 4 above,
> which should correspond with the tee_device_register() call. Data
> written only once doesn't need serialized access if the fields are
> only accessed after they have been fully initialized.

Fair enough, I can live with the device context opened after registering it=
.

>
> >
> > > >
> > > > I was originally thinking of going with Jens' suggestion to open de=
v_ctx in
> > > > the teedev_open(), and use a flag to distinguish the type of contex=
t for
> > > > the open() callback
> > > >
> > > > What about this:
> > > > Open the dev_ctx in the tee_device_register(), at the last step bef=
ore
> > > > setting the TEE_DEVICE_FLAG_REGISTERED flag. Then the open() callba=
ck can
> > > > check for this flag to determine if it is a normal context or dev_c=
tx.
> > > > If the open() is called while the device has not been registered, i=
t should
> > > > handle it differently
> > >
> > > That makes sense, the driver should be prepared to handle open() call=
s
> > > after tee_device_register() anyway.
> > > However, there is no serialization of the flags field in struct
> > > tee_device. Hmm, would it be too hacky for the open() callback to
> > > check if &ctx->teedev.dev_ctx =3D=3D ctx? We could add a helper funct=
ion
> > > to wrap that check.
> > >
> >
> > Your suggested change requires every driver to update open() callback
> > and later other callbacks may have to support it too. IMHO, only
> > teedev_get_dev_ctx() should be able to return a reference to device
> > context for usage within the TEE and the implementation driver.
>
> Yes, but it's only the OP-TEE driver that needs anything special. It
> looks like the others can be left unchanged.

I suppose it's most likely the upcoming QTEE driver requiring it.

>
> >
> > I am still not able to understand why the following won't work with a
> > clear lifetime for the device context?
> >
> > tee_device_alloc()
> >   -> if (!(teedesc->flags & TEE_DESC_PRIVILEGED))
> > desc->ops->open(&teedev->dev_ctx);
>
> We must also have a fully initialized dev_ctx for the supplicant
> device.

Currently I only see following for OP-TEE driver:

ctx =3D teedev_open(optee->teedev);

And I can't see anything like below:

ctx =3D teedev_open(optee->supp_teedev);

Where do you think that the dev_ctx is required for a supplicant
device? AFAICS, currently opening a context with the supplicant device
means that the supplicant daemon is available to handle RPCs which
won't be possible during OP-TEE driver probe. Am I missing something?

> I'd rather delay the open() callback until
> tee_device_register() since the dev_ctx is guaranteed not to be needed
> before that.

Okay, the updated call chain can look like:

tee_device_register()
  -> if (!(teedev->desc->flags & TEE_DESC_PRIVILEGED))
         desc->ops->open(&teedev->dev_ctx);
>
> >
> > tee_device_put()
> >   -> if (teedev->dev_ctx) desc->ops->release(&teedev->dev_ctx);
>
> teedev->dev_ctx is supposed to be embedded in struct tee_device, so
> the if isn't needed.

I added "if" to cover the case when dev_ctx is not initialized for the
supplicant device.

-Sumit

>
> Cheers,
> Jens
>
> >
> > -Sumit
> >
> > > Cheers,
> > > Jens
> > >
> > > >
> > > > - Amir
> > > >
> > > > >>
> > > > >> Cheers,
> > > > >> Jens
> > > > >>
> > > > >>>
> > > > >>> -Sumit

