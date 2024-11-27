Return-Path: <linux-arm-msm+bounces-39259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91A9DA2F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 08:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75831168FF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 07:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670CD14D2BD;
	Wed, 27 Nov 2024 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tx7A3tV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6AF1494B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 07:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732692168; cv=none; b=bHu9sbZgQ5WtMHT5OWIN0qtIkNx1ygVb8giSm3PR933nJL9y+GhSh5lE27WyE/6dCZD+lyfGsqOZf+jXJQwAgg4LNMnFpb8qP6TlhaTmflD4UxFu4X0qVx7pdwaFoioT/lfe2AXBPf6e0WUPHrdLPFR8mRqFsP/AGHgcBGq1rXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732692168; c=relaxed/simple;
	bh=XQ1jKHx64FkhDzwOROMxLDQFKD19UsGDBRmJRZ3RS6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mysLEg0BkoWF6M2dLVoHTy25scHv4NeAK+Q9m4AXMvTMFyGwb9jmJ+ZjKc+tOiJa8C+19QcezhD6HY2McxC4XD0txGqlLkIbaaO3TiuFIeE2mQ6OXuOn6CXVwRLG1o5r5G/fOjY80nBZfxXDgZXfQVoggOZT4mLrao8ZkUybwaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tx7A3tV1; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2964645d2b7so3766389fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 23:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732692165; x=1733296965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDSzoLRjhQ7dfedPQ2Se1XhBUHBOrxiWlZYrJgWGF64=;
        b=tx7A3tV1ftg4NOrivfh59mePpPW2bQCl3FitGzaOWvGfz5c9Pdzu5tzOhV7Fk656w8
         a81fMMUovBPPm4rMk9VGtXJP0w0DEIO1rVuXmbwGOYAfRQIkYdgNkXaSKlxa4/ht2Fri
         wbNuEOGAGWlXLmxd/F1PKMV6CQ3dj5QiFTibQMNB4O1cp4Yp3AFQbHCN87liVD4NObao
         xJIPQpGJET/FnaTycjPa40KomMts80CdAZQhmbdVDoEN5kLDdkwxihhAKZZqYG8JAmPy
         AeGjKKh5fZhWSE5Xc8wBPTBGw6HL0UkEIR0N0zYyVggISjyQn1elh1ZoBm6+HchYuqd6
         NRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732692165; x=1733296965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDSzoLRjhQ7dfedPQ2Se1XhBUHBOrxiWlZYrJgWGF64=;
        b=k1xx9bPoXZqYOdpy79y9O4Pdtq/MKhiBp+mmhfSiUPoxcSWY1AsFVKyg2MxuEzLlDs
         0K0eE2I3p4pINPje6YAcShgq4F7sBS776vLnAYD9bXzKMnqft03Csudv0BBuytk08UzT
         HBJT8E1S5M21fWX5mMT1e69U300gbla6ciecOZNOByyeXkFHsx5ObTTQ71JsuQ/J+OVU
         CbkkHLDdiUh67zaTrTiUFcvjpxZs6AbzXQATb401jpd5hp9OfGJhcyP0hiXOApWmeQb8
         GtW+J7nK5RbwQUDzxHAfsWwkJcCULA2hvH13oON3yvH4YWdNpAfC3xI+snWYK5Glwh2e
         lueg==
X-Forwarded-Encrypted: i=1; AJvYcCXPn7UPAYNW49BoKL5l7nGuLYQzoMrXFX27z8zLfMEI+YTrrnTvdDckJ4IUW6eVW4qM2A9AvNuVtBO1JGjS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxj/0c06X3yel9wr/fsdhOZklQXwjhjiqKrzTk8qIPufT/1BwW
	JagSMAG5wOdGYBy5bUdb6SKIIT9kBTXmPqpn/5pn8Gla3Wombhtr4b7nD428QdyRV5pfL1kRWLW
	ccB94WIPm7BTCyd8ei6h1d62zc6Y2AtBBDSIzKQ==
X-Gm-Gg: ASbGncu39jx3fg1inOdav8bD6PW9Ha1ZTyHuFsygc50dqewf7/zivNvnnlBC8vVbUlA
	AnVFMg8KFH1JpoAS6rg7VymN8eqvfuJE=
X-Google-Smtp-Source: AGHT+IGeJeE+ULvjdIjVpQQfxf9YF3TgWvqjMR0fAW0H4UjSkmi5V9VwVEhp7d9p8yYqciYBNtuqZWLZOz0RSezczV8=
X-Received: by 2002:a05:6871:6a1:b0:296:827c:9067 with SMTP id
 586e51a60fabf-29dc430820cmr1586885fac.27.1732692164941; Tue, 26 Nov 2024
 23:22:44 -0800 (PST)
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
 <CAHUa44F7_yGQFJq6BsoCv6AfB_TjuiGP84YaQ-kz=_e1ni+xyA@mail.gmail.com> <CAFA6WYORjTjfA-QTcyuvqpBOr9uoS+KVikA2mhyfdMmh5K0tiA@mail.gmail.com>
In-Reply-To: <CAFA6WYORjTjfA-QTcyuvqpBOr9uoS+KVikA2mhyfdMmh5K0tiA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 27 Nov 2024 08:22:33 +0100
Message-ID: <CAHUa44Gh3Y9a=ci7FPibiT=hFGbn+B7iaAY1n_Q6MDYoO6PJdA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Amirreza Zarrabi <quic_azarrabi@quicinc.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 7:02=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> On Tue, 26 Nov 2024 at 20:52, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >
> > On Tue, Nov 26, 2024 at 1:27=E2=80=AFPM Sumit Garg <sumit.garg@linaro.o=
rg> wrote:
> > >
> > > On Tue, 26 Nov 2024 at 14:03, Jens Wiklander <jens.wiklander@linaro.o=
rg> wrote:
> > > >
> > > > On Mon, Nov 25, 2024 at 9:55=E2=80=AFPM Amirreza Zarrabi
> > > > <quic_azarrabi@quicinc.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On 11/25/2024 6:51 PM, Sumit Garg wrote:
> > > > > > On Mon, 25 Nov 2024 at 12:53, Jens Wiklander <jens.wiklander@li=
naro.org> wrote:
> > > > > >>
> > > > > >> On Mon, Nov 25, 2024 at 7:14=E2=80=AFAM Sumit Garg <sumit.garg=
@linaro.org> wrote:
> > > > > >>>
> > > > > >>> On Mon, 25 Nov 2024 at 03:00, Amirreza Zarrabi
> > > > > >>> <quic_azarrabi@quicinc.com> wrote:
> > > > > >>>>
> > > > > >>>>
> > > > > >>>> Hi Sumit,
> > > > > >>>>
> > > > > >>>> Thank you so much for the comemnts :).
> > > > > >>>>
> > > > > >>>> On 11/23/2024 9:32 PM, Sumit Garg wrote:
> > > > > >>>>> Hi Amirreza,
> > > > > >>>>>
> > > > > >>>>> Thanks for proposing this.
> > > > > >>>>>
> > > > > >>>>> On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
> > > > > >>>>> <quic_azarrabi@quicinc.com> wrote:
> > > > > >>>>>>
> > > > > >>>>>>
> > > > > >>>>>> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
> > > > > >>>>>>
> > > > > >>>>>> Hi Jens,
> > > > > >>>>>>
> > > > > >>>>>>> Hi Amirreza,
> > > > > >>>>>>>
> > > > > >>>>>>> On Thu, Nov 21, 2024 at 2:37=E2=80=AFAM Amirreza Zarrabi
> > > > > >>>>>>> <quic_azarrabi@quicinc.com> wrote:
> > > > > >>>>>>>>
> > > > > >>>>>>>> The default context has a lifespan similar to the tee_de=
vice.
> > > > > >>>>>
> > > > > >>>>> Since it's associated with tee_device context, let's call i=
t obvious
> > > > > >>>>> via renaming it as device context instead (s/def_ctx/dev_ct=
x/ in this
> > > > > >>>>> patch).
> > > > > >>>>>
> > > > > >>>>
> > > > > >>>> Make sense, I'll rename it.
> > > > > >>>>
> > > > > >>>>>>>> It is used as a context for shared memory if the context=
 to which the
> > > > > >>>>>>>> shared memory belongs is released, making the tee_shm an=
 orphan.
> > > > > >>>>>>>> This allows the driver implementing shm_unregister to sa=
fely make
> > > > > >>>>>>>> subsequent calls, such as to a supplicant if needed.
> > > > > >>>>>>>>
> > > > > >>>>>>>> It also enables users to free the shared memory while th=
e driver is
> > > > > >>>>>>>> blocked on unregister_tee_device safely.
> > > > > >>>>>>>>
> > > > > >>>>>>>> Preferably, this should be used for all driver internal =
uses, using
> > > > > >>>>>>>> teedev_get_def_context rather than calling teedev_open.
> > > > > >>>>>
> > > > > >>>>> Makes sense to me.
> > > > > >>>>>
> > > > > >>>>>>>>
> > > > > >>>>>>>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.c=
om>
> > > > > >>>>>>>> ---
> > > > > >>>>>>>>  drivers/tee/optee/core.c    |  2 +-
> > > > > >>>>>>>>  drivers/tee/optee/ffa_abi.c |  2 +-
> > > > > >>>>>>>>  drivers/tee/optee/smc_abi.c |  2 +-
> > > > > >>>>>>>>  drivers/tee/tee_core.c      | 83 ++++++++++++++++++++++=
+++++++----------------
> > > > > >>>>>>>>  drivers/tee/tee_private.h   |  3 --
> > > > > >>>>>>>>  drivers/tee/tee_shm.c       | 18 ++--------
> > > > > >>>>>>>>  include/linux/tee_core.h    | 15 ++++++++
> > > > > >>>>>>>>  include/linux/tee_drv.h     |  7 ----
> > > > > >>>>>>>>  8 files changed, 73 insertions(+), 59 deletions(-)
> > > > > >>>>>>>>
> > > > > >>>>>>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/opte=
e/core.c
> > > > > >>>>>>>> index c75fddc83576..78d43d0c8014 100644
> > > > > >>>>>>>> --- a/drivers/tee/optee/core.c
> > > > > >>>>>>>> +++ b/drivers/tee/optee/core.c
> > > > > >>>>>>>> @@ -173,7 +173,7 @@ void optee_remove_common(struct opte=
e *optee)
> > > > > >>>>>>>>
> > > > > >>>>>>>>         optee_notif_uninit(optee);
> > > > > >>>>>>>>         optee_shm_arg_cache_uninit(optee);
> > > > > >>>>>>>> -       teedev_close_context(optee->ctx);
> > > > > >>>>>>>> +
> > > > > >>>>>>>>         /*
> > > > > >>>>>>>>          * The two devices have to be unregistered befor=
e we can free the
> > > > > >>>>>>>>          * other resources.
> > > > > >>>>>>>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/o=
ptee/ffa_abi.c
> > > > > >>>>>>>> index f3af5666bb11..6ad94f0788ad 100644
> > > > > >>>>>>>> --- a/drivers/tee/optee/ffa_abi.c
> > > > > >>>>>>>> +++ b/drivers/tee/optee/ffa_abi.c
> > > > > >>>>>>>> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct ff=
a_device *ffa_dev)
> > > > > >>>>>>>>         optee_shm_arg_cache_init(optee, arg_cache_flags)=
;
> > > > > >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> > > > > >>>>>>>>         ffa_dev_set_drvdata(ffa_dev, optee);
> > > > > >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> > > > > >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > > > > >>>>>>>>         if (IS_ERR(ctx)) {
> > > > > >>>>>>>>                 rc =3D PTR_ERR(ctx);
> > > > > >>>>>>>>                 goto err_rhashtable_free;
> > > > > >>>>>>>> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/o=
ptee/smc_abi.c
> > > > > >>>>>>>> index e9456e3e74cc..c77a3e631d04 100644
> > > > > >>>>>>>> --- a/drivers/tee/optee/smc_abi.c
> > > > > >>>>>>>> +++ b/drivers/tee/optee/smc_abi.c
> > > > > >>>>>>>> @@ -1722,7 +1722,7 @@ static int optee_probe(struct plat=
form_device *pdev)
> > > > > >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> > > > > >>>>>>>>
> > > > > >>>>>>>>         platform_set_drvdata(pdev, optee);
> > > > > >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> > > > > >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > > > > >>>>>>>>         if (IS_ERR(ctx)) {
> > > > > >>>>>>>>                 rc =3D PTR_ERR(ctx);
> > > > > >>>>>>>>                 goto err_supp_uninit;
> > > > > >>>>>>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_co=
re.c
> > > > > >>>>>>>> index 93f3b330aec8..805e1336089d 100644
> > > > > >>>>>>>> --- a/drivers/tee/tee_core.c
> > > > > >>>>>>>> +++ b/drivers/tee/tee_core.c
> > > > > >>>>>>>> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(struct=
 tee_device *teedev)
> > > > > >>>>>>>>                 goto err;
> > > > > >>>>>>>>         }
> > > > > >>>>>>>>
> > > > > >>>>>>>> -       kref_init(&ctx->refcount);
> > > > > >>>>>>>>         ctx->teedev =3D teedev;
> > > > > >>>>>>>>         INIT_LIST_HEAD(&ctx->list_shm);
> > > > > >>>>>>>>         rc =3D teedev->desc->ops->open(ctx);
> > > > > >>>>>>>> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(stru=
ct tee_device *teedev)
> > > > > >>>>>>>>  }
> > > > > >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_open);
> > > > > >>>>>>>>
> > > > > >>>>>>>> -void teedev_ctx_get(struct tee_context *ctx)
> > > > > >>>>>>>> +struct tee_context *teedev_get_def_context(struct tee_d=
evice *teedev)
> > > > > >>>>>>>>  {
> > > > > >>>>>>>> -       if (ctx->releasing)
> > > > > >>>>>>>> -               return;
> > > > > >>>>>>>> +       int rc;
> > > > > >>>>>>>> +       struct tee_context *ctx =3D &teedev->def_ctx;
> > > > > >>>>>>>>
> > > > > >>>>>>>> -       kref_get(&ctx->refcount);
> > > > > >>>>>>>> -}
> > > > > >>>>>>>> +       ctx->teedev =3D teedev;
> > > > > >>>>>>>> +       INIT_LIST_HEAD(&ctx->list_shm);
> > > > > >>>>>>>> +       rc =3D teedev->desc->ops->open(ctx);
> > > > > >>>>>>>> +       if (rc)
> > > > > >>>>>>>> +               return ERR_PTR(rc);
> > > > > >>>>>>>
> > > > > >>>>>>> I think ctx->teedev and ctx->list_shm must always be init=
ialized or
> > > > > >>>>>>> &teedev->def_ctx can't be used in teedev_close_context().
> > > > > >>>>>>
> > > > > >>>>>> True, but &teedev->def_ctx is never used in teedev_close_c=
ontext().
> > > > > >>>>>> The closing of the &teedev->def_ctx simply ignored. So onc=
e opened,
> > > > > >>>>>> &teedev->def_ctx will always remain open until the tee_dev=
ice is alive.
> > > > > >>>>>>
> > > > > >>>>>>> We could initialize teedev->def_ctx on the first call to =
teedev_open()
> > > > > >>>>>>> on that tee_device. We need a way to tell the
> > > > > >>>>>>> teedev->desc->ops->open() to the backed driver that it's =
initializing
> > > > > >>>>>>> the default context though, or optee_open() can't handle =
the
> > > > > >>>>>>> tee-supplicant case properly.
> > > > > >>>>>>>
> > > > > >>>>>>
> > > > > >>>>>> That's a good point. This way, it is guaranteed that there=
 is one def_ctx
> > > > > >>>>>> per teedev. There should be a way to tell the open() callb=
ack that it is
> > > > > >>>>>> a def_ctx, so it is not registered as a supplicant context=
.
> > > > > >>>>>>
> > > > > >>>>>>
> > > > > >>>>>>> Should we allow this function to be called more than once=
 for each teedev?
> > > > > >>>>>>
> > > > > >>>>>> Yes, moving to teedev_open() will fix the issue.
> > > > > >>>>>>
> > > > > >>>>>>> Do we need serialization in this function if it's called =
after the
> > > > > >>>>>>> driver is probed?
> > > > > >>>>>>>
> > > > > >>>>>>
> > > > > >>>>>> True. I'll make sure there is no race.
> > > > > >>>>>>
> > > > > >>>>>>>>
> > > > > >>>>>>>> -static void teedev_ctx_release(struct kref *ref)
> > > > > >>>>>>>> -{
> > > > > >>>>>>>> -       struct tee_context *ctx =3D container_of(ref, st=
ruct tee_context,
> > > > > >>>>>>>> -                                              refcount)=
;
> > > > > >>>>>>>> -       ctx->releasing =3D true;
> > > > > >>>>>>>> -       ctx->teedev->desc->ops->release(ctx);
> > > > > >>>>>>>> -       kfree(ctx);
> > > > > >>>>>>>> +       return ctx;
> > > > > >>>>>>>>  }
> > > > > >>>>>>>> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
> > > > > >>>>>>>>
> > > > > >>>>>>>> -void teedev_ctx_put(struct tee_context *ctx)
> > > > > >>>>>>>> +void teedev_close_context(struct tee_context *ctx)
> > > > > >>>>>>>>  {
> > > > > >>>>>>>> -       if (ctx->releasing)
> > > > > >>>>>>>> +       struct tee_device *teedev =3D ctx->teedev;
> > > > > >>>>>>>> +       struct tee_shm *shm;
> > > > > >>>>>>>> +
> > > > > >>>>>>>> +       if (ctx =3D=3D &teedev->def_ctx)
> > > > > >>>>>>>>                 return;
> > > > > >>>>>>>>
> > > > > >>>>>>>> -       kref_put(&ctx->refcount, teedev_ctx_release);
> > > > > >>>>>>>> -}
> > > > > >>>>>>>> +       teedev->desc->ops->release(ctx);
> > > > > >>>>>>>>
> > > > > >>>>>>>> -void teedev_close_context(struct tee_context *ctx)
> > > > > >>>>>>>> -{
> > > > > >>>>>>>> -       struct tee_device *teedev =3D ctx->teedev;
> > > > > >>>>>>>> +       mutex_lock(&teedev->mutex);
> > > > > >>>>>>>> +       list_for_each_entry(shm, &ctx->list_shm, link) {
> > > > > >>>>>>>> +               /* Context released. However, shm still =
holding a teedev reference.
> > > > > >>>>>>>> +                * Replace shm->ctx with the default con=
text so that tee_shm_get_from_id()
> > > > > >>>>>>>> +                * fails (i.e. it is not accessible from=
 userspace) but shm still
> > > > > >>>>>>>> +                * holds a valid context for further cle=
an up, e.g. shm_unregister().
> > > > > >>>>>>>> +                */
> > > > > >>>>>>>
> > > > > >>>>>>> /*
> > > > > >>>>>>>  * Please format
> > > > > >>>>>>>  * multiline comments
> > > > > >>>>>>>  * like this. Please
> > > > > >>>>>>>  * keep the lines at
> > > > > >>>>>>>  * max 80 columns
> > > > > >>>>>>>  * here and at other
> > > > > >>>>>>>  * places in the patch-
> > > > > >>>>>>>  * set.
> > > > > >>>>>>>  */
> > > > > >>>>>>>
> > > > > >>>>>>
> > > > > >>>>>> Ack.
> > > > > >>>>>>
> > > > > >>>>>>>> +               shm->ctx =3D &teedev->def_ctx;
> > > > > >>>>>>>
> > > > > >>>>>>> shm->ctx will always point to a valid context, even if it=
 is the
> > > > > >>>>>>> default context. It seems that we can always get hold of =
the correct
> > > > > >>>>>>> teedev via shm->ctx->teedev. Do we need "tee: revert remo=
val of
> > > > > >>>>>>> redundant teedev in struct tee_shm"?
> > > > > >>>>>>>
> > > > > >>>>>>
> > > > > >>>>>> It was there in case we wanted to use NULL, but with def_c=
tx, it is not
> > > > > >>>>>> necessary. I am withdrawing that commit. :).
> > > > > >>>>>>
> > > > > >>>>>>> Shouldn't the shm be removed from the ctx->list_shm and b=
e moved to
> > > > > >>>>>>> teedev->def_ctx.list_shm?
> > > > > >>>>>
> > > > > >>>>> +1
> > > > > >>>>>
> > > > > >>>>
> > > > > >>>> Ack.
> > > > > >>>>
> > > > > >>>>>>>
> > > > > >>>>>>
> > > > > >>>>>> Not really. If we put shm in the teedev->def_ctx.list_shm,=
 by the time
> > > > > >>>>>> we are closing the def_ctx, the list is guaranteed to be e=
mpty.
> > > > > >>>>>>
> > > > > >>>>>> However, I understand it is cleaner and more consistent to=
 do that rather
> > > > > >>>>>> than making changes to tee_shm_put().
> > > > > >>>>>>
> > > > > >>>>>> I'll do it.
> > > > > >>>>>>
> > > > > >>>>>>>> +       }
> > > > > >>>>>>>> +       mutex_unlock(&teedev->mutex);
> > > > > >>>>>>>>
> > > > > >>>>>>>> -       teedev_ctx_put(ctx);
> > > > > >>>>>>>> +       kfree(ctx);
> > > > > >>>>>>>>         tee_device_put(teedev);
> > > > > >>>>>>>>  }
> > > > > >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_close_context);
> > > > > >>>>>>>> @@ -946,6 +952,8 @@ struct tee_device *tee_device_alloc(=
const struct tee_desc *teedesc,
> > > > > >>>>>>>>
> > > > > >>>>>>>>         teedev->desc =3D teedesc;
> > > > > >>>>>>>>         teedev->pool =3D pool;
> > > > > >>>>>>>> +       /* Only open default context when teedev_get_def=
_context() called. */
> > > > > >>>>>>>> +       teedev->def_ctx.teedev =3D NULL;
> > > > > >>>>>
> > > > > >>>>> Why don't you open the device context here only? This will =
associate
> > > > > >>>>> it automatically with teedev lifespan and then
> > > > > >>>>> teedev_get_def_context() will just return a reference to th=
at.
> > > > > >>>>>
> > > > > >>>>> -Sumit
> > > > > >>>>>
> > > > > >>>>
> > > > > >>>> So my assumption is that the tee_devic_alloc() is called as =
part of
> > > > > >>>> the driver initialization; there is no guarantee that at thi=
s time the
> > > > > >>>> driver is actually ready to accept any open() callback.
> > > > > >>>>
> > > > > >>>
> > > > > >>> The drivers should be able to handle open() callback since we=
 already
> > > > > >>> check for !teedesc->ops->open in the beginning of tee_devic_a=
lloc().
> > > > > >>> Also, we need to open a device context for !TEE_DESC_PRIVILEG=
ED such
> > > > > >>> that we don't open a supplicant device context there.
> > > > > >>
> > > > > >> It would be nice to have the device context fully initialized =
when the
> > > > > >> probe function returns. How about adding a "bool is_dev_ctx" t=
o struct
> > > > > >> tee_context so the open() callback can tell that this is a spe=
cial
> > > > > >> tee_contex?
> > > > > >
> > > > > > Sure, that will be useful to distinguish the device context fro=
m
> > > > > > normal client context.
> > > > > >
> > > > > > -Sumit
> > > > > >
> > > > >
> > > > > So, as far as the open() callback, I do not believe checking if i=
t is not null
> > > > > is reasonable for calling it here. Most drivers allocate resource=
s and then
> > > > > initialize them. So, assume these steps for a TEE driver:
> > > > >  (1) allocate internal data structures,
> > > > >  (2) allocate the device,
> > > > >  (3) initialize the internal data structurse and then
> > > > >  (4) register the device.
> > > > >
> > > > > Having these steps for a backend driver means that if you call op=
en() at
> > > > > step (2), the internal data structures are not ready.
> > >
> > > As part of tee_device_alloc(), every driver has to pass "const struct
> > > tee_desc *teedesc" fully initialized. Which internal data structures
> > > are you referring too? Is there any upstream example?
> >
> > It's reasonable to wait with the open() callback until step 4 above,
> > which should correspond with the tee_device_register() call. Data
> > written only once doesn't need serialized access if the fields are
> > only accessed after they have been fully initialized.
>
> Fair enough, I can live with the device context opened after registering =
it.
>
> >
> > >
> > > > >
> > > > > I was originally thinking of going with Jens' suggestion to open =
dev_ctx in
> > > > > the teedev_open(), and use a flag to distinguish the type of cont=
ext for
> > > > > the open() callback
> > > > >
> > > > > What about this:
> > > > > Open the dev_ctx in the tee_device_register(), at the last step b=
efore
> > > > > setting the TEE_DEVICE_FLAG_REGISTERED flag. Then the open() call=
back can
> > > > > check for this flag to determine if it is a normal context or dev=
_ctx.
> > > > > If the open() is called while the device has not been registered,=
 it should
> > > > > handle it differently
> > > >
> > > > That makes sense, the driver should be prepared to handle open() ca=
lls
> > > > after tee_device_register() anyway.
> > > > However, there is no serialization of the flags field in struct
> > > > tee_device. Hmm, would it be too hacky for the open() callback to
> > > > check if &ctx->teedev.dev_ctx =3D=3D ctx? We could add a helper fun=
ction
> > > > to wrap that check.
> > > >
> > >
> > > Your suggested change requires every driver to update open() callback
> > > and later other callbacks may have to support it too. IMHO, only
> > > teedev_get_dev_ctx() should be able to return a reference to device
> > > context for usage within the TEE and the implementation driver.
> >
> > Yes, but it's only the OP-TEE driver that needs anything special. It
> > looks like the others can be left unchanged.
>
> I suppose it's most likely the upcoming QTEE driver requiring it.
>
> >
> > >
> > > I am still not able to understand why the following won't work with a
> > > clear lifetime for the device context?
> > >
> > > tee_device_alloc()
> > >   -> if (!(teedesc->flags & TEE_DESC_PRIVILEGED))
> > > desc->ops->open(&teedev->dev_ctx);
> >
> > We must also have a fully initialized dev_ctx for the supplicant
> > device.
>
> Currently I only see following for OP-TEE driver:
>
> ctx =3D teedev_open(optee->teedev);
>
> And I can't see anything like below:
>
> ctx =3D teedev_open(optee->supp_teedev);
>
> Where do you think that the dev_ctx is required for a supplicant
> device? AFAICS, currently opening a context with the supplicant device
> means that the supplicant daemon is available to handle RPCs which
> won't be possible during OP-TEE driver probe. Am I missing something?

One reason for initializing dev_ctx for all tee_devices is in
teedev_close_context(), where the tee_shms still active are
transferred to dev_ctx. The teedev member was re-introduced in this
patch set, but it can be removed again if we can depend on the dev_ctx
to always be available in teedev_close_context(). Even the
tee-supplicant may close its tee_context with active tee_shms at some
point. It might be possible to use half-baked dev_ctx, but then we'd
be burdened with keeping track of which dev_ctx can be used for what.
We want as few special cases as possible.

>
> > I'd rather delay the open() callback until
> > tee_device_register() since the dev_ctx is guaranteed not to be needed
> > before that.
>
> Okay, the updated call chain can look like:
>
> tee_device_register()
>   -> if (!(teedev->desc->flags & TEE_DESC_PRIVILEGED))
>          desc->ops->open(&teedev->dev_ctx);
> >
> > >
> > > tee_device_put()
> > >   -> if (teedev->dev_ctx) desc->ops->release(&teedev->dev_ctx);
> >
> > teedev->dev_ctx is supposed to be embedded in struct tee_device, so
> > the if isn't needed.
>
> I added "if" to cover the case when dev_ctx is not initialized for the
> supplicant device.

OK.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens
> >
> > >
> > > -Sumit
> > >
> > > > Cheers,
> > > > Jens
> > > >
> > > > >
> > > > > - Amir
> > > > >
> > > > > >>
> > > > > >> Cheers,
> > > > > >> Jens
> > > > > >>
> > > > > >>>
> > > > > >>> -Sumit

