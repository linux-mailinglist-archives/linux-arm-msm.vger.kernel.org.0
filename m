Return-Path: <linux-arm-msm+bounces-39200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5EB9D9748
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 13:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AA3EB21957
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 12:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95761D0E08;
	Tue, 26 Nov 2024 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNvsvvsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9617816F8F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732624033; cv=none; b=hs715kGkdNQHB1SgmKAT8a+cFkuhaACSCXgLjsJ5LbCjLTd3G6n2ze9zPzc9EEDFR2M7lPNnP1A38o49CtX72sOH5LuAPpgiWiAlMR3SGrJJ5aQ7+6anHFThIEhBenaiPMGgfe7pfbkkePIalxfZUa0hXpEHzEEFQz0uLl/t6gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732624033; c=relaxed/simple;
	bh=2cTFRIuM4stRmiv2b2p1Dos72VtjSf8R8JQEODs4Wgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kckNUOcJ+3FkMkQCd6urn2Tbzmr847Jm7K+8F7JfEOu1Acu425xeSl4oe3hlwz/MOC/gzwrv8VKg61p9igx9Pr6EFNG+MLlTiQy2pxMqC/WypzJXzd0ZpfmuwvKLUH1UhxmTNITe/XZ2mT2d4nBjAffo1yx40G5AMb64hsFT9JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNvsvvsU; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-856e7566b2cso1591486241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 04:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732624030; x=1733228830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHdH2PvGJBsqjICJSX/h8dkqdgnYtETmK3puRpJ+0ck=;
        b=yNvsvvsUfrhYR1QA/Mr4R1Bb+gpqKER9B0VxH+dIjrnQNYcrmi7PUhoa8MEOB8jYIN
         hewtR0IM/5s2T5eay63wIvfbUabmQ0Kx1NyrX7SHrUucwQSLxAGgJsHEpxLDBn6lpB8L
         Elr/4klrxEdPnqqACk2EGQXNMeKrY3j46ckxuWJPB64+CNJoTP+7OAdjfm2h8K9asysz
         13rm9LCBOFtDv/MEh3Dy3JzeZVtYgjLMI+FDd5rUmxBnyS+YybrkcSAGH00UPT5nE+Kg
         XkwGdS40FD2WwCXU0f7q3LFEbNQPg2Ub3svAr06bnc4KH+ucSSzOQ5eNSonev3MZXb4t
         R/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732624030; x=1733228830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHdH2PvGJBsqjICJSX/h8dkqdgnYtETmK3puRpJ+0ck=;
        b=IJkynexmrkHLVWDkf6Vaur+WRghHG8OeVl1t5PTBLsbRGGmfpUAU/JG+zaBakF9vD9
         BUXOgnuj85QEmETj5HY/Sp+0F8GLGLN4hJw75E07/smfNDYaf9QUCMK9eVwm6zLGEAwY
         FnxPhJ2tZKNVWcYyBR0KClkIKzEfWvtt9eqPN7NX3LA3wfQ6ESVm3wWJbd59QJk0ePUh
         qeUORXqIHunPCdhXEc/2E9oAnUO2x0ZDi6O1GSrLpqfTubJCktlY84OeQdQv3Lxc82m5
         2KLKP4KHqcDRbEX13hE4CncpP1caY+kQ8wAL406Kqi7BWkkpWQIfhzHOkjTviOYoOy3C
         RWEw==
X-Forwarded-Encrypted: i=1; AJvYcCU8IUvlueSfyuCZEDAzoSn2fDRY7ryVcuM0EvmGeXSGqDaHldSODUWPrpWgyN3s6eIRsrNGg5B2ZTnqNgV0@vger.kernel.org
X-Gm-Message-State: AOJu0YywPVV/ttkDFqgbcwPJsYNV4tGqtHvezxPHT/YbeYor4ggtYbVd
	/3O4EU0e0Ws5UYcnaUEZ4VnC80cviKW+kO9IzBNrEjtxR2/uZPYVCJK5BRFDvNK9vPxSGWO4EKp
	soX3OYzbHw/Szs8iACvFTT8mGkXDS5TMReT3LPPTRNNFrRkmopJQ=
X-Gm-Gg: ASbGncubwZw/lU2s0DGP0vcyGn4saV01Ilp0s976OSR0wlpvZ8S9c3Vdcc/7zN8MsDY
	yPbxlirBX3HscrAoBkhe/wUGbV2f3AVhhtg==
X-Google-Smtp-Source: AGHT+IGOYu4FpKqf2XQSOb9WxUP5GciGk2dA3y5IkIO4ap1cCvMEWIhNYm77RgsuAzhC2nqbr/lX2UPLUryh5ZG7RUU=
X-Received: by 2002:a05:6102:942:b0:4ad:4bfd:5b0d with SMTP id
 ada2fe7eead31-4addce3d7damr15652034137.23.1732624030438; Tue, 26 Nov 2024
 04:27:10 -0800 (PST)
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
In-Reply-To: <CAHUa44EZ2r=QRcsWfFs-ZqnTYEOpB4Ou4qpk4Y49NEPh-TTCeg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 26 Nov 2024 17:56:58 +0530
Message-ID: <CAFA6WYPUZN752aT7+ejoiYYoLs_XNV7w9wT7kBrE=vvEJO+8_g@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Amirreza Zarrabi <quic_azarrabi@quicinc.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Nov 2024 at 14:03, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> On Mon, Nov 25, 2024 at 9:55=E2=80=AFPM Amirreza Zarrabi
> <quic_azarrabi@quicinc.com> wrote:
> >
> >
> >
> > On 11/25/2024 6:51 PM, Sumit Garg wrote:
> > > On Mon, 25 Nov 2024 at 12:53, Jens Wiklander <jens.wiklander@linaro.o=
rg> wrote:
> > >>
> > >> On Mon, Nov 25, 2024 at 7:14=E2=80=AFAM Sumit Garg <sumit.garg@linar=
o.org> wrote:
> > >>>
> > >>> On Mon, 25 Nov 2024 at 03:00, Amirreza Zarrabi
> > >>> <quic_azarrabi@quicinc.com> wrote:
> > >>>>
> > >>>>
> > >>>> Hi Sumit,
> > >>>>
> > >>>> Thank you so much for the comemnts :).
> > >>>>
> > >>>> On 11/23/2024 9:32 PM, Sumit Garg wrote:
> > >>>>> Hi Amirreza,
> > >>>>>
> > >>>>> Thanks for proposing this.
> > >>>>>
> > >>>>> On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
> > >>>>> <quic_azarrabi@quicinc.com> wrote:
> > >>>>>>
> > >>>>>>
> > >>>>>> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
> > >>>>>>
> > >>>>>> Hi Jens,
> > >>>>>>
> > >>>>>>> Hi Amirreza,
> > >>>>>>>
> > >>>>>>> On Thu, Nov 21, 2024 at 2:37=E2=80=AFAM Amirreza Zarrabi
> > >>>>>>> <quic_azarrabi@quicinc.com> wrote:
> > >>>>>>>>
> > >>>>>>>> The default context has a lifespan similar to the tee_device.
> > >>>>>
> > >>>>> Since it's associated with tee_device context, let's call it obvi=
ous
> > >>>>> via renaming it as device context instead (s/def_ctx/dev_ctx/ in =
this
> > >>>>> patch).
> > >>>>>
> > >>>>
> > >>>> Make sense, I'll rename it.
> > >>>>
> > >>>>>>>> It is used as a context for shared memory if the context to wh=
ich the
> > >>>>>>>> shared memory belongs is released, making the tee_shm an orpha=
n.
> > >>>>>>>> This allows the driver implementing shm_unregister to safely m=
ake
> > >>>>>>>> subsequent calls, such as to a supplicant if needed.
> > >>>>>>>>
> > >>>>>>>> It also enables users to free the shared memory while the driv=
er is
> > >>>>>>>> blocked on unregister_tee_device safely.
> > >>>>>>>>
> > >>>>>>>> Preferably, this should be used for all driver internal uses, =
using
> > >>>>>>>> teedev_get_def_context rather than calling teedev_open.
> > >>>>>
> > >>>>> Makes sense to me.
> > >>>>>
> > >>>>>>>>
> > >>>>>>>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> > >>>>>>>> ---
> > >>>>>>>>  drivers/tee/optee/core.c    |  2 +-
> > >>>>>>>>  drivers/tee/optee/ffa_abi.c |  2 +-
> > >>>>>>>>  drivers/tee/optee/smc_abi.c |  2 +-
> > >>>>>>>>  drivers/tee/tee_core.c      | 83 ++++++++++++++++++++++++++++=
+----------------
> > >>>>>>>>  drivers/tee/tee_private.h   |  3 --
> > >>>>>>>>  drivers/tee/tee_shm.c       | 18 ++--------
> > >>>>>>>>  include/linux/tee_core.h    | 15 ++++++++
> > >>>>>>>>  include/linux/tee_drv.h     |  7 ----
> > >>>>>>>>  8 files changed, 73 insertions(+), 59 deletions(-)
> > >>>>>>>>
> > >>>>>>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core=
.c
> > >>>>>>>> index c75fddc83576..78d43d0c8014 100644
> > >>>>>>>> --- a/drivers/tee/optee/core.c
> > >>>>>>>> +++ b/drivers/tee/optee/core.c
> > >>>>>>>> @@ -173,7 +173,7 @@ void optee_remove_common(struct optee *opt=
ee)
> > >>>>>>>>
> > >>>>>>>>         optee_notif_uninit(optee);
> > >>>>>>>>         optee_shm_arg_cache_uninit(optee);
> > >>>>>>>> -       teedev_close_context(optee->ctx);
> > >>>>>>>> +
> > >>>>>>>>         /*
> > >>>>>>>>          * The two devices have to be unregistered before we c=
an free the
> > >>>>>>>>          * other resources.
> > >>>>>>>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/f=
fa_abi.c
> > >>>>>>>> index f3af5666bb11..6ad94f0788ad 100644
> > >>>>>>>> --- a/drivers/tee/optee/ffa_abi.c
> > >>>>>>>> +++ b/drivers/tee/optee/ffa_abi.c
> > >>>>>>>> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct ffa_devi=
ce *ffa_dev)
> > >>>>>>>>         optee_shm_arg_cache_init(optee, arg_cache_flags);
> > >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> > >>>>>>>>         ffa_dev_set_drvdata(ffa_dev, optee);
> > >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> > >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > >>>>>>>>         if (IS_ERR(ctx)) {
> > >>>>>>>>                 rc =3D PTR_ERR(ctx);
> > >>>>>>>>                 goto err_rhashtable_free;
> > >>>>>>>> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/s=
mc_abi.c
> > >>>>>>>> index e9456e3e74cc..c77a3e631d04 100644
> > >>>>>>>> --- a/drivers/tee/optee/smc_abi.c
> > >>>>>>>> +++ b/drivers/tee/optee/smc_abi.c
> > >>>>>>>> @@ -1722,7 +1722,7 @@ static int optee_probe(struct platform_d=
evice *pdev)
> > >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> > >>>>>>>>
> > >>>>>>>>         platform_set_drvdata(pdev, optee);
> > >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> > >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > >>>>>>>>         if (IS_ERR(ctx)) {
> > >>>>>>>>                 rc =3D PTR_ERR(ctx);
> > >>>>>>>>                 goto err_supp_uninit;
> > >>>>>>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > >>>>>>>> index 93f3b330aec8..805e1336089d 100644
> > >>>>>>>> --- a/drivers/tee/tee_core.c
> > >>>>>>>> +++ b/drivers/tee/tee_core.c
> > >>>>>>>> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(struct tee_d=
evice *teedev)
> > >>>>>>>>                 goto err;
> > >>>>>>>>         }
> > >>>>>>>>
> > >>>>>>>> -       kref_init(&ctx->refcount);
> > >>>>>>>>         ctx->teedev =3D teedev;
> > >>>>>>>>         INIT_LIST_HEAD(&ctx->list_shm);
> > >>>>>>>>         rc =3D teedev->desc->ops->open(ctx);
> > >>>>>>>> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(struct tee=
_device *teedev)
> > >>>>>>>>  }
> > >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_open);
> > >>>>>>>>
> > >>>>>>>> -void teedev_ctx_get(struct tee_context *ctx)
> > >>>>>>>> +struct tee_context *teedev_get_def_context(struct tee_device =
*teedev)
> > >>>>>>>>  {
> > >>>>>>>> -       if (ctx->releasing)
> > >>>>>>>> -               return;
> > >>>>>>>> +       int rc;
> > >>>>>>>> +       struct tee_context *ctx =3D &teedev->def_ctx;
> > >>>>>>>>
> > >>>>>>>> -       kref_get(&ctx->refcount);
> > >>>>>>>> -}
> > >>>>>>>> +       ctx->teedev =3D teedev;
> > >>>>>>>> +       INIT_LIST_HEAD(&ctx->list_shm);
> > >>>>>>>> +       rc =3D teedev->desc->ops->open(ctx);
> > >>>>>>>> +       if (rc)
> > >>>>>>>> +               return ERR_PTR(rc);
> > >>>>>>>
> > >>>>>>> I think ctx->teedev and ctx->list_shm must always be initialize=
d or
> > >>>>>>> &teedev->def_ctx can't be used in teedev_close_context().
> > >>>>>>
> > >>>>>> True, but &teedev->def_ctx is never used in teedev_close_context=
().
> > >>>>>> The closing of the &teedev->def_ctx simply ignored. So once open=
ed,
> > >>>>>> &teedev->def_ctx will always remain open until the tee_device is=
 alive.
> > >>>>>>
> > >>>>>>> We could initialize teedev->def_ctx on the first call to teedev=
_open()
> > >>>>>>> on that tee_device. We need a way to tell the
> > >>>>>>> teedev->desc->ops->open() to the backed driver that it's initia=
lizing
> > >>>>>>> the default context though, or optee_open() can't handle the
> > >>>>>>> tee-supplicant case properly.
> > >>>>>>>
> > >>>>>>
> > >>>>>> That's a good point. This way, it is guaranteed that there is on=
e def_ctx
> > >>>>>> per teedev. There should be a way to tell the open() callback th=
at it is
> > >>>>>> a def_ctx, so it is not registered as a supplicant context.
> > >>>>>>
> > >>>>>>
> > >>>>>>> Should we allow this function to be called more than once for e=
ach teedev?
> > >>>>>>
> > >>>>>> Yes, moving to teedev_open() will fix the issue.
> > >>>>>>
> > >>>>>>> Do we need serialization in this function if it's called after =
the
> > >>>>>>> driver is probed?
> > >>>>>>>
> > >>>>>>
> > >>>>>> True. I'll make sure there is no race.
> > >>>>>>
> > >>>>>>>>
> > >>>>>>>> -static void teedev_ctx_release(struct kref *ref)
> > >>>>>>>> -{
> > >>>>>>>> -       struct tee_context *ctx =3D container_of(ref, struct t=
ee_context,
> > >>>>>>>> -                                              refcount);
> > >>>>>>>> -       ctx->releasing =3D true;
> > >>>>>>>> -       ctx->teedev->desc->ops->release(ctx);
> > >>>>>>>> -       kfree(ctx);
> > >>>>>>>> +       return ctx;
> > >>>>>>>>  }
> > >>>>>>>> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
> > >>>>>>>>
> > >>>>>>>> -void teedev_ctx_put(struct tee_context *ctx)
> > >>>>>>>> +void teedev_close_context(struct tee_context *ctx)
> > >>>>>>>>  {
> > >>>>>>>> -       if (ctx->releasing)
> > >>>>>>>> +       struct tee_device *teedev =3D ctx->teedev;
> > >>>>>>>> +       struct tee_shm *shm;
> > >>>>>>>> +
> > >>>>>>>> +       if (ctx =3D=3D &teedev->def_ctx)
> > >>>>>>>>                 return;
> > >>>>>>>>
> > >>>>>>>> -       kref_put(&ctx->refcount, teedev_ctx_release);
> > >>>>>>>> -}
> > >>>>>>>> +       teedev->desc->ops->release(ctx);
> > >>>>>>>>
> > >>>>>>>> -void teedev_close_context(struct tee_context *ctx)
> > >>>>>>>> -{
> > >>>>>>>> -       struct tee_device *teedev =3D ctx->teedev;
> > >>>>>>>> +       mutex_lock(&teedev->mutex);
> > >>>>>>>> +       list_for_each_entry(shm, &ctx->list_shm, link) {
> > >>>>>>>> +               /* Context released. However, shm still holdin=
g a teedev reference.
> > >>>>>>>> +                * Replace shm->ctx with the default context s=
o that tee_shm_get_from_id()
> > >>>>>>>> +                * fails (i.e. it is not accessible from users=
pace) but shm still
> > >>>>>>>> +                * holds a valid context for further clean up,=
 e.g. shm_unregister().
> > >>>>>>>> +                */
> > >>>>>>>
> > >>>>>>> /*
> > >>>>>>>  * Please format
> > >>>>>>>  * multiline comments
> > >>>>>>>  * like this. Please
> > >>>>>>>  * keep the lines at
> > >>>>>>>  * max 80 columns
> > >>>>>>>  * here and at other
> > >>>>>>>  * places in the patch-
> > >>>>>>>  * set.
> > >>>>>>>  */
> > >>>>>>>
> > >>>>>>
> > >>>>>> Ack.
> > >>>>>>
> > >>>>>>>> +               shm->ctx =3D &teedev->def_ctx;
> > >>>>>>>
> > >>>>>>> shm->ctx will always point to a valid context, even if it is th=
e
> > >>>>>>> default context. It seems that we can always get hold of the co=
rrect
> > >>>>>>> teedev via shm->ctx->teedev. Do we need "tee: revert removal of
> > >>>>>>> redundant teedev in struct tee_shm"?
> > >>>>>>>
> > >>>>>>
> > >>>>>> It was there in case we wanted to use NULL, but with def_ctx, it=
 is not
> > >>>>>> necessary. I am withdrawing that commit. :).
> > >>>>>>
> > >>>>>>> Shouldn't the shm be removed from the ctx->list_shm and be move=
d to
> > >>>>>>> teedev->def_ctx.list_shm?
> > >>>>>
> > >>>>> +1
> > >>>>>
> > >>>>
> > >>>> Ack.
> > >>>>
> > >>>>>>>
> > >>>>>>
> > >>>>>> Not really. If we put shm in the teedev->def_ctx.list_shm, by th=
e time
> > >>>>>> we are closing the def_ctx, the list is guaranteed to be empty.
> > >>>>>>
> > >>>>>> However, I understand it is cleaner and more consistent to do th=
at rather
> > >>>>>> than making changes to tee_shm_put().
> > >>>>>>
> > >>>>>> I'll do it.
> > >>>>>>
> > >>>>>>>> +       }
> > >>>>>>>> +       mutex_unlock(&teedev->mutex);
> > >>>>>>>>
> > >>>>>>>> -       teedev_ctx_put(ctx);
> > >>>>>>>> +       kfree(ctx);
> > >>>>>>>>         tee_device_put(teedev);
> > >>>>>>>>  }
> > >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_close_context);
> > >>>>>>>> @@ -946,6 +952,8 @@ struct tee_device *tee_device_alloc(const =
struct tee_desc *teedesc,
> > >>>>>>>>
> > >>>>>>>>         teedev->desc =3D teedesc;
> > >>>>>>>>         teedev->pool =3D pool;
> > >>>>>>>> +       /* Only open default context when teedev_get_def_conte=
xt() called. */
> > >>>>>>>> +       teedev->def_ctx.teedev =3D NULL;
> > >>>>>
> > >>>>> Why don't you open the device context here only? This will associ=
ate
> > >>>>> it automatically with teedev lifespan and then
> > >>>>> teedev_get_def_context() will just return a reference to that.
> > >>>>>
> > >>>>> -Sumit
> > >>>>>
> > >>>>
> > >>>> So my assumption is that the tee_devic_alloc() is called as part o=
f
> > >>>> the driver initialization; there is no guarantee that at this time=
 the
> > >>>> driver is actually ready to accept any open() callback.
> > >>>>
> > >>>
> > >>> The drivers should be able to handle open() callback since we alrea=
dy
> > >>> check for !teedesc->ops->open in the beginning of tee_devic_alloc()=
.
> > >>> Also, we need to open a device context for !TEE_DESC_PRIVILEGED suc=
h
> > >>> that we don't open a supplicant device context there.
> > >>
> > >> It would be nice to have the device context fully initialized when t=
he
> > >> probe function returns. How about adding a "bool is_dev_ctx" to stru=
ct
> > >> tee_context so the open() callback can tell that this is a special
> > >> tee_contex?
> > >
> > > Sure, that will be useful to distinguish the device context from
> > > normal client context.
> > >
> > > -Sumit
> > >
> >
> > So, as far as the open() callback, I do not believe checking if it is n=
ot null
> > is reasonable for calling it here. Most drivers allocate resources and =
then
> > initialize them. So, assume these steps for a TEE driver:
> >  (1) allocate internal data structures,
> >  (2) allocate the device,
> >  (3) initialize the internal data structurse and then
> >  (4) register the device.
> >
> > Having these steps for a backend driver means that if you call open() a=
t
> > step (2), the internal data structures are not ready.

As part of tee_device_alloc(), every driver has to pass "const struct
tee_desc *teedesc" fully initialized. Which internal data structures
are you referring too? Is there any upstream example?

> >
> > I was originally thinking of going with Jens' suggestion to open dev_ct=
x in
> > the teedev_open(), and use a flag to distinguish the type of context fo=
r
> > the open() callback
> >
> > What about this:
> > Open the dev_ctx in the tee_device_register(), at the last step before
> > setting the TEE_DEVICE_FLAG_REGISTERED flag. Then the open() callback c=
an
> > check for this flag to determine if it is a normal context or dev_ctx.
> > If the open() is called while the device has not been registered, it sh=
ould
> > handle it differently
>
> That makes sense, the driver should be prepared to handle open() calls
> after tee_device_register() anyway.
> However, there is no serialization of the flags field in struct
> tee_device. Hmm, would it be too hacky for the open() callback to
> check if &ctx->teedev.dev_ctx =3D=3D ctx? We could add a helper function
> to wrap that check.
>

Your suggested change requires every driver to update open() callback
and later other callbacks may have to support it too. IMHO, only
teedev_get_dev_ctx() should be able to return a reference to device
context for usage within the TEE and the implementation driver.

I am still not able to understand why the following won't work with a
clear lifetime for the device context?

tee_device_alloc()
  -> if (!(teedesc->flags & TEE_DESC_PRIVILEGED))
desc->ops->open(&teedev->dev_ctx);

tee_device_put()
  -> if (teedev->dev_ctx) desc->ops->release(&teedev->dev_ctx);

-Sumit

> Cheers,
> Jens
>
> >
> > - Amir
> >
> > >>
> > >> Cheers,
> > >> Jens
> > >>
> > >>>
> > >>> -Sumit

