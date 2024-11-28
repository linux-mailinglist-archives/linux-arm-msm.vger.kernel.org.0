Return-Path: <linux-arm-msm+bounces-39433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 640669DB7DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BFFE1639A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A2219D8A7;
	Thu, 28 Nov 2024 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRZ4STF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99146195385
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732797876; cv=none; b=SHuVLkKfe9Jru9Npj5LvOhsAWgdlkp769vODJ9pRM2IKl2Y02cBFmuqKgWSaFOnv+zB9VOtBH0dTQ1xiIYXMJ+PzFxYkRwAvwRTEFNipKisF2EwQ2EpfHgBic/aUv7g+a+o1WgYmEz3uq6DB48m1Dy/7gty6XpKFZWYdLAcKKsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732797876; c=relaxed/simple;
	bh=QG2Bw0CFsK65sf2F3mX/5WYEx1edRTdDsngwfiShnA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1Dh64+DwsKblD32QOiXYaXWDM8D6d6i5094cX8MKNIpJGNEszu5p6Tx3FNueUTEBff3+kD6zJ6jFtp9j0Is4ySW8nhJT32kte4z09JtP7agpW620W67kSCmukfEB6oinqbmrovhSwHJkg1ETOrv2l1QhahptRhdFdn4CIXktnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRZ4STF8; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f1d2487b95so300773eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 04:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732797874; x=1733402674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSqMTXkTPUZd0zWVWYJL3/d+zJ1ZhIGUcZSiIB4A9bo=;
        b=VRZ4STF88RNNBpQtuIZAENpE0XJ8OiX+T4jEaoNM9PzQCoQAxTcxQVIyfZjLqL/0Wz
         3oGHpvl8vRy3grepMZPJg3U9cpqeCCC/gt+d+iu4fZrRfVxHuHl0Lbj2ryznnHeyicmK
         Kl5jBMMl5z4HzGMrllBzX6g30/TSaPTpz3is4mzjx9SnVgAggUA4H2Eqzw+7TAbTQFhq
         PEI2isi0lsBz6Vx7jj2+qRWMPP1svjfL+FhApu+25lzKfGXsS9c/X6mRtEUTLhQIPM3Q
         fpsU2s1MdiO3GfX9iCE/p6Vwn8sEl3xm/AxAtCkDUO7UoKMpvw6zIGt4r3HuDL0aA0X7
         zaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797874; x=1733402674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSqMTXkTPUZd0zWVWYJL3/d+zJ1ZhIGUcZSiIB4A9bo=;
        b=TBOI0ijDW3Fe4dCuhHnNc/+Z7NSyNP88488e69IFHlMKUhsJzBJvswLPbCLfPAZeVE
         Yr/UcGC8ZPylm3mK/JQ6BCbUCW232wY4BO2wXhva//W4EKui91xCV3X16Gky7c6ulACL
         DhaLVfO5oMskrBW/IlASQDdyUAjZrN9pUqtN5vlybrPaaXctdd/YQ/53YPNwEZKfvytY
         s+CYiKvqxaImOg5KOS9lhhIEMLIZgsD92xocBUOzv6Q6r7+CSy+/LcFvLvV60OlKJu6Y
         gfPtZwRyhwvFR2U5GVDbjvw8x5/GuXkckWLgSBcDpm0bZB6NB5KdOQ73IfViThG3g6K1
         zR+g==
X-Forwarded-Encrypted: i=1; AJvYcCX+a5L/02miDkZM0xtGHe6bdnUYmOlUbYJAoq77W/VUO5kyOE6cAP44gJPa6axO199VsgoJx8E9A4nERSWn@vger.kernel.org
X-Gm-Message-State: AOJu0YzjhGfXM7VwC0ZCJ0M7mbAHwYHkh5+5ElhIcFdmVhqSxLtHPeKd
	XPu2zZfUc/jSDpuEJT7ymT8BPDip0GOwk8ePwDkGgemt7K2eYu1OtQJjxcFSj1CMG1gEYj/O/qj
	kbJt/R6Mzc8YZs3FIvwKdXzOKygBsK02NuubWiBANcuFiKzyTcP4=
X-Gm-Gg: ASbGncvJRPtgfO19a2S3r6h34UJ6ePoK1f3e9jN766B1sxVt4Xgb35ishNhW3qhMkFR
	j6tsEN4gHHndtg/zY85JmIi1K/q8n39eF
X-Google-Smtp-Source: AGHT+IE2l9PphZ2+GBX3aj5xPOUxJGGkNhIC+fc9r9Hj6e6EOjs7epigTJIu+c9v376v1jpRZSc/qApOst/qPlTw+4k=
X-Received: by 2002:a05:6358:703:b0:1ca:9839:5d0b with SMTP id
 e5c5f4694b2df-1cab15f7c2cmr432068055d.15.1732797873561; Thu, 28 Nov 2024
 04:44:33 -0800 (PST)
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
 <CAHUa44F7_yGQFJq6BsoCv6AfB_TjuiGP84YaQ-kz=_e1ni+xyA@mail.gmail.com>
 <CAFA6WYORjTjfA-QTcyuvqpBOr9uoS+KVikA2mhyfdMmh5K0tiA@mail.gmail.com> <89599f39-9e95-49df-ac70-0827559653f6@quicinc.com>
In-Reply-To: <89599f39-9e95-49df-ac70-0827559653f6@quicinc.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 28 Nov 2024 18:14:22 +0530
Message-ID: <CAFA6WYMrOt=u7VNrhPRsLkQq95rgkMXd-inuSg2hLHQDjtP8=Q@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 28 Nov 2024 at 02:29, Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
>
>
> On 11/27/2024 5:01 PM, Sumit Garg wrote:
> > On Tue, 26 Nov 2024 at 20:52, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> >>
> >> On Tue, Nov 26, 2024 at 1:27=E2=80=AFPM Sumit Garg <sumit.garg@linaro.=
org> wrote:
> >>>
> >>> On Tue, 26 Nov 2024 at 14:03, Jens Wiklander <jens.wiklander@linaro.o=
rg> wrote:
> >>>>
> >>>> On Mon, Nov 25, 2024 at 9:55=E2=80=AFPM Amirreza Zarrabi
> >>>> <quic_azarrabi@quicinc.com> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 11/25/2024 6:51 PM, Sumit Garg wrote:
> >>>>>> On Mon, 25 Nov 2024 at 12:53, Jens Wiklander <jens.wiklander@linar=
o.org> wrote:
> >>>>>>>
> >>>>>>> On Mon, Nov 25, 2024 at 7:14=E2=80=AFAM Sumit Garg <sumit.garg@li=
naro.org> wrote:
> >>>>>>>>
> >>>>>>>> On Mon, 25 Nov 2024 at 03:00, Amirreza Zarrabi
> >>>>>>>> <quic_azarrabi@quicinc.com> wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Hi Sumit,
> >>>>>>>>>
> >>>>>>>>> Thank you so much for the comemnts :).
> >>>>>>>>>
> >>>>>>>>> On 11/23/2024 9:32 PM, Sumit Garg wrote:
> >>>>>>>>>> Hi Amirreza,
> >>>>>>>>>>
> >>>>>>>>>> Thanks for proposing this.
> >>>>>>>>>>
> >>>>>>>>>> On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
> >>>>>>>>>> <quic_azarrabi@quicinc.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> Hi Jens,
> >>>>>>>>>>>
> >>>>>>>>>>>> Hi Amirreza,
> >>>>>>>>>>>>
> >>>>>>>>>>>> On Thu, Nov 21, 2024 at 2:37=E2=80=AFAM Amirreza Zarrabi
> >>>>>>>>>>>> <quic_azarrabi@quicinc.com> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> The default context has a lifespan similar to the tee_devic=
e.
> >>>>>>>>>>
> >>>>>>>>>> Since it's associated with tee_device context, let's call it o=
bvious
> >>>>>>>>>> via renaming it as device context instead (s/def_ctx/dev_ctx/ =
in this
> >>>>>>>>>> patch).
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Make sense, I'll rename it.
> >>>>>>>>>
> >>>>>>>>>>>>> It is used as a context for shared memory if the context to=
 which the
> >>>>>>>>>>>>> shared memory belongs is released, making the tee_shm an or=
phan.
> >>>>>>>>>>>>> This allows the driver implementing shm_unregister to safel=
y make
> >>>>>>>>>>>>> subsequent calls, such as to a supplicant if needed.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> It also enables users to free the shared memory while the d=
river is
> >>>>>>>>>>>>> blocked on unregister_tee_device safely.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Preferably, this should be used for all driver internal use=
s, using
> >>>>>>>>>>>>> teedev_get_def_context rather than calling teedev_open.
> >>>>>>>>>>
> >>>>>>>>>> Makes sense to me.
> >>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>  drivers/tee/optee/core.c    |  2 +-
> >>>>>>>>>>>>>  drivers/tee/optee/ffa_abi.c |  2 +-
> >>>>>>>>>>>>>  drivers/tee/optee/smc_abi.c |  2 +-
> >>>>>>>>>>>>>  drivers/tee/tee_core.c      | 83 +++++++++++++++++++++++++=
++++----------------
> >>>>>>>>>>>>>  drivers/tee/tee_private.h   |  3 --
> >>>>>>>>>>>>>  drivers/tee/tee_shm.c       | 18 ++--------
> >>>>>>>>>>>>>  include/linux/tee_core.h    | 15 ++++++++
> >>>>>>>>>>>>>  include/linux/tee_drv.h     |  7 ----
> >>>>>>>>>>>>>  8 files changed, 73 insertions(+), 59 deletions(-)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/c=
ore.c
> >>>>>>>>>>>>> index c75fddc83576..78d43d0c8014 100644
> >>>>>>>>>>>>> --- a/drivers/tee/optee/core.c
> >>>>>>>>>>>>> +++ b/drivers/tee/optee/core.c
> >>>>>>>>>>>>> @@ -173,7 +173,7 @@ void optee_remove_common(struct optee *=
optee)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>         optee_notif_uninit(optee);
> >>>>>>>>>>>>>         optee_shm_arg_cache_uninit(optee);
> >>>>>>>>>>>>> -       teedev_close_context(optee->ctx);
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>>         /*
> >>>>>>>>>>>>>          * The two devices have to be unregistered before w=
e can free the
> >>>>>>>>>>>>>          * other resources.
> >>>>>>>>>>>>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/opte=
e/ffa_abi.c
> >>>>>>>>>>>>> index f3af5666bb11..6ad94f0788ad 100644
> >>>>>>>>>>>>> --- a/drivers/tee/optee/ffa_abi.c
> >>>>>>>>>>>>> +++ b/drivers/tee/optee/ffa_abi.c
> >>>>>>>>>>>>> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct ffa_d=
evice *ffa_dev)
> >>>>>>>>>>>>>         optee_shm_arg_cache_init(optee, arg_cache_flags);
> >>>>>>>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> >>>>>>>>>>>>>         ffa_dev_set_drvdata(ffa_dev, optee);
> >>>>>>>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> >>>>>>>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> >>>>>>>>>>>>>         if (IS_ERR(ctx)) {
> >>>>>>>>>>>>>                 rc =3D PTR_ERR(ctx);
> >>>>>>>>>>>>>                 goto err_rhashtable_free;
> >>>>>>>>>>>>> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/opte=
e/smc_abi.c
> >>>>>>>>>>>>> index e9456e3e74cc..c77a3e631d04 100644
> >>>>>>>>>>>>> --- a/drivers/tee/optee/smc_abi.c
> >>>>>>>>>>>>> +++ b/drivers/tee/optee/smc_abi.c
> >>>>>>>>>>>>> @@ -1722,7 +1722,7 @@ static int optee_probe(struct platfor=
m_device *pdev)
> >>>>>>>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>         platform_set_drvdata(pdev, optee);
> >>>>>>>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> >>>>>>>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> >>>>>>>>>>>>>         if (IS_ERR(ctx)) {
> >>>>>>>>>>>>>                 rc =3D PTR_ERR(ctx);
> >>>>>>>>>>>>>                 goto err_supp_uninit;
> >>>>>>>>>>>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.=
c
> >>>>>>>>>>>>> index 93f3b330aec8..805e1336089d 100644
> >>>>>>>>>>>>> --- a/drivers/tee/tee_core.c
> >>>>>>>>>>>>> +++ b/drivers/tee/tee_core.c
> >>>>>>>>>>>>> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(struct te=
e_device *teedev)
> >>>>>>>>>>>>>                 goto err;
> >>>>>>>>>>>>>         }
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -       kref_init(&ctx->refcount);
> >>>>>>>>>>>>>         ctx->teedev =3D teedev;
> >>>>>>>>>>>>>         INIT_LIST_HEAD(&ctx->list_shm);
> >>>>>>>>>>>>>         rc =3D teedev->desc->ops->open(ctx);
> >>>>>>>>>>>>> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(struct =
tee_device *teedev)
> >>>>>>>>>>>>>  }
> >>>>>>>>>>>>>  EXPORT_SYMBOL_GPL(teedev_open);
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -void teedev_ctx_get(struct tee_context *ctx)
> >>>>>>>>>>>>> +struct tee_context *teedev_get_def_context(struct tee_devi=
ce *teedev)
> >>>>>>>>>>>>>  {
> >>>>>>>>>>>>> -       if (ctx->releasing)
> >>>>>>>>>>>>> -               return;
> >>>>>>>>>>>>> +       int rc;
> >>>>>>>>>>>>> +       struct tee_context *ctx =3D &teedev->def_ctx;
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -       kref_get(&ctx->refcount);
> >>>>>>>>>>>>> -}
> >>>>>>>>>>>>> +       ctx->teedev =3D teedev;
> >>>>>>>>>>>>> +       INIT_LIST_HEAD(&ctx->list_shm);
> >>>>>>>>>>>>> +       rc =3D teedev->desc->ops->open(ctx);
> >>>>>>>>>>>>> +       if (rc)
> >>>>>>>>>>>>> +               return ERR_PTR(rc);
> >>>>>>>>>>>>
> >>>>>>>>>>>> I think ctx->teedev and ctx->list_shm must always be initial=
ized or
> >>>>>>>>>>>> &teedev->def_ctx can't be used in teedev_close_context().
> >>>>>>>>>>>
> >>>>>>>>>>> True, but &teedev->def_ctx is never used in teedev_close_cont=
ext().
> >>>>>>>>>>> The closing of the &teedev->def_ctx simply ignored. So once o=
pened,
> >>>>>>>>>>> &teedev->def_ctx will always remain open until the tee_device=
 is alive.
> >>>>>>>>>>>
> >>>>>>>>>>>> We could initialize teedev->def_ctx on the first call to tee=
dev_open()
> >>>>>>>>>>>> on that tee_device. We need a way to tell the
> >>>>>>>>>>>> teedev->desc->ops->open() to the backed driver that it's ini=
tializing
> >>>>>>>>>>>> the default context though, or optee_open() can't handle the
> >>>>>>>>>>>> tee-supplicant case properly.
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> That's a good point. This way, it is guaranteed that there is=
 one def_ctx
> >>>>>>>>>>> per teedev. There should be a way to tell the open() callback=
 that it is
> >>>>>>>>>>> a def_ctx, so it is not registered as a supplicant context.
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>>> Should we allow this function to be called more than once fo=
r each teedev?
> >>>>>>>>>>>
> >>>>>>>>>>> Yes, moving to teedev_open() will fix the issue.
> >>>>>>>>>>>
> >>>>>>>>>>>> Do we need serialization in this function if it's called aft=
er the
> >>>>>>>>>>>> driver is probed?
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> True. I'll make sure there is no race.
> >>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -static void teedev_ctx_release(struct kref *ref)
> >>>>>>>>>>>>> -{
> >>>>>>>>>>>>> -       struct tee_context *ctx =3D container_of(ref, struc=
t tee_context,
> >>>>>>>>>>>>> -                                              refcount);
> >>>>>>>>>>>>> -       ctx->releasing =3D true;
> >>>>>>>>>>>>> -       ctx->teedev->desc->ops->release(ctx);
> >>>>>>>>>>>>> -       kfree(ctx);
> >>>>>>>>>>>>> +       return ctx;
> >>>>>>>>>>>>>  }
> >>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -void teedev_ctx_put(struct tee_context *ctx)
> >>>>>>>>>>>>> +void teedev_close_context(struct tee_context *ctx)
> >>>>>>>>>>>>>  {
> >>>>>>>>>>>>> -       if (ctx->releasing)
> >>>>>>>>>>>>> +       struct tee_device *teedev =3D ctx->teedev;
> >>>>>>>>>>>>> +       struct tee_shm *shm;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +       if (ctx =3D=3D &teedev->def_ctx)
> >>>>>>>>>>>>>                 return;
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -       kref_put(&ctx->refcount, teedev_ctx_release);
> >>>>>>>>>>>>> -}
> >>>>>>>>>>>>> +       teedev->desc->ops->release(ctx);
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -void teedev_close_context(struct tee_context *ctx)
> >>>>>>>>>>>>> -{
> >>>>>>>>>>>>> -       struct tee_device *teedev =3D ctx->teedev;
> >>>>>>>>>>>>> +       mutex_lock(&teedev->mutex);
> >>>>>>>>>>>>> +       list_for_each_entry(shm, &ctx->list_shm, link) {
> >>>>>>>>>>>>> +               /* Context released. However, shm still hol=
ding a teedev reference.
> >>>>>>>>>>>>> +                * Replace shm->ctx with the default contex=
t so that tee_shm_get_from_id()
> >>>>>>>>>>>>> +                * fails (i.e. it is not accessible from us=
erspace) but shm still
> >>>>>>>>>>>>> +                * holds a valid context for further clean =
up, e.g. shm_unregister().
> >>>>>>>>>>>>> +                */
> >>>>>>>>>>>>
> >>>>>>>>>>>> /*
> >>>>>>>>>>>>  * Please format
> >>>>>>>>>>>>  * multiline comments
> >>>>>>>>>>>>  * like this. Please
> >>>>>>>>>>>>  * keep the lines at
> >>>>>>>>>>>>  * max 80 columns
> >>>>>>>>>>>>  * here and at other
> >>>>>>>>>>>>  * places in the patch-
> >>>>>>>>>>>>  * set.
> >>>>>>>>>>>>  */
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Ack.
> >>>>>>>>>>>
> >>>>>>>>>>>>> +               shm->ctx =3D &teedev->def_ctx;
> >>>>>>>>>>>>
> >>>>>>>>>>>> shm->ctx will always point to a valid context, even if it is=
 the
> >>>>>>>>>>>> default context. It seems that we can always get hold of the=
 correct
> >>>>>>>>>>>> teedev via shm->ctx->teedev. Do we need "tee: revert removal=
 of
> >>>>>>>>>>>> redundant teedev in struct tee_shm"?
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> It was there in case we wanted to use NULL, but with def_ctx,=
 it is not
> >>>>>>>>>>> necessary. I am withdrawing that commit. :).
> >>>>>>>>>>>
> >>>>>>>>>>>> Shouldn't the shm be removed from the ctx->list_shm and be m=
oved to
> >>>>>>>>>>>> teedev->def_ctx.list_shm?
> >>>>>>>>>>
> >>>>>>>>>> +1
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Ack.
> >>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Not really. If we put shm in the teedev->def_ctx.list_shm, by=
 the time
> >>>>>>>>>>> we are closing the def_ctx, the list is guaranteed to be empt=
y.
> >>>>>>>>>>>
> >>>>>>>>>>> However, I understand it is cleaner and more consistent to do=
 that rather
> >>>>>>>>>>> than making changes to tee_shm_put().
> >>>>>>>>>>>
> >>>>>>>>>>> I'll do it.
> >>>>>>>>>>>
> >>>>>>>>>>>>> +       }
> >>>>>>>>>>>>> +       mutex_unlock(&teedev->mutex);
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -       teedev_ctx_put(ctx);
> >>>>>>>>>>>>> +       kfree(ctx);
> >>>>>>>>>>>>>         tee_device_put(teedev);
> >>>>>>>>>>>>>  }
> >>>>>>>>>>>>>  EXPORT_SYMBOL_GPL(teedev_close_context);
> >>>>>>>>>>>>> @@ -946,6 +952,8 @@ struct tee_device *tee_device_alloc(con=
st struct tee_desc *teedesc,
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>         teedev->desc =3D teedesc;
> >>>>>>>>>>>>>         teedev->pool =3D pool;
> >>>>>>>>>>>>> +       /* Only open default context when teedev_get_def_co=
ntext() called. */
> >>>>>>>>>>>>> +       teedev->def_ctx.teedev =3D NULL;
> >>>>>>>>>>
> >>>>>>>>>> Why don't you open the device context here only? This will ass=
ociate
> >>>>>>>>>> it automatically with teedev lifespan and then
> >>>>>>>>>> teedev_get_def_context() will just return a reference to that.
> >>>>>>>>>>
> >>>>>>>>>> -Sumit
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> So my assumption is that the tee_devic_alloc() is called as par=
t of
> >>>>>>>>> the driver initialization; there is no guarantee that at this t=
ime the
> >>>>>>>>> driver is actually ready to accept any open() callback.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> The drivers should be able to handle open() callback since we al=
ready
> >>>>>>>> check for !teedesc->ops->open in the beginning of tee_devic_allo=
c().
> >>>>>>>> Also, we need to open a device context for !TEE_DESC_PRIVILEGED =
such
> >>>>>>>> that we don't open a supplicant device context there.
> >>>>>>>
> >>>>>>> It would be nice to have the device context fully initialized whe=
n the
> >>>>>>> probe function returns. How about adding a "bool is_dev_ctx" to s=
truct
> >>>>>>> tee_context so the open() callback can tell that this is a specia=
l
> >>>>>>> tee_contex?
> >>>>>>
> >>>>>> Sure, that will be useful to distinguish the device context from
> >>>>>> normal client context.
> >>>>>>
> >>>>>> -Sumit
> >>>>>>
> >>>>>
> >>>>> So, as far as the open() callback, I do not believe checking if it =
is not null
> >>>>> is reasonable for calling it here. Most drivers allocate resources =
and then
> >>>>> initialize them. So, assume these steps for a TEE driver:
> >>>>>  (1) allocate internal data structures,
> >>>>>  (2) allocate the device,
> >>>>>  (3) initialize the internal data structurse and then
> >>>>>  (4) register the device.
> >>>>>
> >>>>> Having these steps for a backend driver means that if you call open=
() at
> >>>>> step (2), the internal data structures are not ready.
> >>>
> >>> As part of tee_device_alloc(), every driver has to pass "const struct
> >>> tee_desc *teedesc" fully initialized. Which internal data structures
> >>> are you referring too? Is there any upstream example?
> >>
> >> It's reasonable to wait with the open() callback until step 4 above,
> >> which should correspond with the tee_device_register() call. Data
> >> written only once doesn't need serialized access if the fields are
> >> only accessed after they have been fully initialized.
> >
> > Fair enough, I can live with the device context opened after registerin=
g it.
> >
> >>
> >>>
> >>>>>
> >>>>> I was originally thinking of going with Jens' suggestion to open de=
v_ctx in
> >>>>> the teedev_open(), and use a flag to distinguish the type of contex=
t for
> >>>>> the open() callback
> >>>>>
> >>>>> What about this:
> >>>>> Open the dev_ctx in the tee_device_register(), at the last step bef=
ore
> >>>>> setting the TEE_DEVICE_FLAG_REGISTERED flag. Then the open() callba=
ck can
> >>>>> check for this flag to determine if it is a normal context or dev_c=
tx.
> >>>>> If the open() is called while the device has not been registered, i=
t should
> >>>>> handle it differently
> >>>>
> >>>> That makes sense, the driver should be prepared to handle open() cal=
ls
> >>>> after tee_device_register() anyway.
> >>>> However, there is no serialization of the flags field in struct
> >>>> tee_device. Hmm, would it be too hacky for the open() callback to
> >>>> check if &ctx->teedev.dev_ctx =3D=3D ctx? We could add a helper func=
tion
> >>>> to wrap that check.
> >>>>
> >>>
> >>> Your suggested change requires every driver to update open() callback
> >>> and later other callbacks may have to support it too. IMHO, only
> >>> teedev_get_dev_ctx() should be able to return a reference to device
> >>> context for usage within the TEE and the implementation driver.
> >>
> >> Yes, but it's only the OP-TEE driver that needs anything special. It
> >> looks like the others can be left unchanged.
> >
> > I suppose it's most likely the upcoming QTEE driver requiring it.
> >
>
> I don't believe this is correct. This requirement is implicitly imposed
> by the TEE subsystem API. If calling open() is acceptable in
> tee_device_alloc(), then I could argue that tee_device_register() and
> tee_device_alloc() should be merged into a single function. If a driver
> is ready to handle requests, why delay its exposure by postponing the
> registration?

You can't mix in device alloc/init with device registration. As soon
as you register a device, it's available for user-space to issue
IOCTLs. So if there is any race between device init and it's usage
then it's going to cause hard to debug issues.

There can be an argument that dev_ctx being a member of "struct
tee_device" so it should get initialized alongside other bits in
tee_device_alloc() (we can rename
s/tee_device_alloc()/tee_device_init()/ if that makes it obvious). But
I can live with the device context getting initialized as the first
thing in tee_device_register() avoiding the race window mentioned
above.

>
> By calling open() in tee_device_alloc(), you indirectly impose an unspoke=
n
> requirement on developers regarding how they should write their drivers,
> such as the steps they should take to probe the device.

Still not sure why it isn't an explicit requirement when you are
already passing an initialized ops structure to tee_device_alloc().

-Sumit

>
> Regards,
> Amir
>
> >>
> >>>
> >>> I am still not able to understand why the following won't work with a
> >>> clear lifetime for the device context?
> >>>
> >>> tee_device_alloc()
> >>>   -> if (!(teedesc->flags & TEE_DESC_PRIVILEGED))
> >>> desc->ops->open(&teedev->dev_ctx);
> >>
> >> We must also have a fully initialized dev_ctx for the supplicant
> >> device.
> >
> > Currently I only see following for OP-TEE driver:
> >
> > ctx =3D teedev_open(optee->teedev);
> >
> > And I can't see anything like below:
> >
> > ctx =3D teedev_open(optee->supp_teedev);
> >
> > Where do you think that the dev_ctx is required for a supplicant
> > device? AFAICS, currently opening a context with the supplicant device
> > means that the supplicant daemon is available to handle RPCs which
> > won't be possible during OP-TEE driver probe. Am I missing something?
> >
> >> I'd rather delay the open() callback until
> >> tee_device_register() since the dev_ctx is guaranteed not to be needed
> >> before that.
> >
> > Okay, the updated call chain can look like:
> >
> > tee_device_register()
> >   -> if (!(teedev->desc->flags & TEE_DESC_PRIVILEGED))
> >          desc->ops->open(&teedev->dev_ctx);
> >>
> >>>
> >>> tee_device_put()
> >>>   -> if (teedev->dev_ctx) desc->ops->release(&teedev->dev_ctx);
> >>
> >> teedev->dev_ctx is supposed to be embedded in struct tee_device, so
> >> the if isn't needed.
> >
> > I added "if" to cover the case when dev_ctx is not initialized for the
> > supplicant device.
> >
> > -Sumit
> >
> >>
> >> Cheers,
> >> Jens
> >>
> >>>
> >>> -Sumit
> >>>
> >>>> Cheers,
> >>>> Jens
> >>>>
> >>>>>
> >>>>> - Amir
> >>>>>
> >>>>>>>
> >>>>>>> Cheers,
> >>>>>>> Jens
> >>>>>>>
> >>>>>>>>
> >>>>>>>> -Sumit

