Return-Path: <linux-arm-msm+bounces-39431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6FD9DB76D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20F2016602B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0E619004B;
	Thu, 28 Nov 2024 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXg0BRiq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F8158D96
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732796219; cv=none; b=R7GkpuVA1fWtWHOE+jajq1rRaU+hSWJniYT814k8aUTfApBCR8GPl1ixDXSO+pGg/Sr4UFqBvP3GeRS2SFjOMAFwTyR6jXOXVXZv3LS+Fn0HAWTnEQMmOmr1ELn3yJvqGkfQLo0N81Md8QV6qZLsPhHdYTzXpItrLrDsuiXxo9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732796219; c=relaxed/simple;
	bh=jKlZbsj+vWs9XglReebJo4NIy77MvWkhWFYIJt4/4UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikEKg2m9MxZyPT0tVM5w62AiGlGY//LyG3/3OP0uQIPfTR86KUrAqVR075AXJK8Fu6Y0+K5aAa77KImpUH40T5g9gaJW0IOeNoqEz5O3fOt6Z1QMBRC/1965BCB+XfCDbNx7GHFGDQUqcuPcCU/4JsOdcEp+PIQ2OmYi7mRvlYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXg0BRiq; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3ea33a922afso404449b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 04:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732796216; x=1733401016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPKouV9nZDtPa9K87PVwAOmma8mgnhndwIbTG3KS0V0=;
        b=OXg0BRiquFnPasFqGt+fYi41y84O4anui5xRi/BTQmF3kNlJB6IuBy8Sok6nNqlmX8
         9k15iMFCUp5JOUPYv3jq+1s73ug8EnQxfKvd7A1YJT1aECfyhiLTV1F4Nc6Y879+n8im
         IJeTGimk8UOueDtV6e0NkPkQAg6Jrm9BFxpKW9Fsze4O4+saIoy8gcbYRibnmdTm5rny
         kpxXiSh32ntxiE1spU8aOIBEqhePKFjSpGxBs3wsvGezWqwzEtKG4jQpdLXre0zsrvVf
         aarhyqOSirRn78EkRKXBmT8unsJ4EARUDaLQHQba4EPoiLV75o41D3WxTMwu/kGRPqeq
         k99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732796216; x=1733401016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPKouV9nZDtPa9K87PVwAOmma8mgnhndwIbTG3KS0V0=;
        b=CCII+fMz+rJCgsTP6NzG0R3eB+2XEhYnIHzghqyDM+vDz8Pv7Bpmeyt2pzn907wvH4
         YwToe2Od3BmWE40kjmpOtq4FWNP6zE+JpJqyuGRA+uZDQ8oMY30+qLGsFqzhcI235F3Z
         kiGsi4lc43gymkuFHPTcyL1x4OK7Epapf/5S6rhQAZH7x7IcC1hlHxUzZ2qYqahoEdj1
         Tz3rY5pD72+9Wpo8gFvtSBOWdLzLDzslimSHI+2ND5U5hhoWO+I/5fTfK7a3Tp8mjLix
         uM5a8ahuPS5LeS9ZPSetN9VCWBWdXLcnagfJ+O68zLCyaYY+x1sWB4r3ViRRo0wjazdZ
         +/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUnqhfOxgWpsjWEHPH0nwFMuHdgaBGQaemA0TWUOMqLNnXTdNQ2RtjCBRt7K5LyWKJgZQvRdyYmy+TKjVZU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsb8PeS2QEOPP1GmeP1VFFzb6vdssniq3/hdB5sTNin3opbwXL
	RyYHj+0qqtWPROdV4Kh3ndL6I68wd8WPG9Xw5bDjpkqxMRcvL3WUlwB5j65HAXSfoefemMvKwWU
	vSQuHqfGryvkNLT90jj6QNd9d1Lf5m5Inb8mnCjNIzMvHsi+S
X-Gm-Gg: ASbGncssyF5WAr0llkw27Jevegkb5IKjHeqHlFo+pYfi/s9ClQxHVzqhsClB9dtnIQV
	C93K+6Zl4m2QRYryiPdx+UOybOko7TuyM
X-Google-Smtp-Source: AGHT+IEOwCgWj5inssiHXcQsqEu2vqJE8pQz+FN1vHs+sqQ7crHFepX5Wtw7fTO+fOmcSPO1G+GSfrgHkh46I8XjeS8=
X-Received: by 2002:a05:6808:188b:b0:3e6:2620:2000 with SMTP id
 5614622812f47-3ea6dd9f247mr6638731b6e.35.1732796216113; Thu, 28 Nov 2024
 04:16:56 -0800 (PST)
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
 <CAFA6WYORjTjfA-QTcyuvqpBOr9uoS+KVikA2mhyfdMmh5K0tiA@mail.gmail.com> <CAHUa44Gh3Y9a=ci7FPibiT=hFGbn+B7iaAY1n_Q6MDYoO6PJdA@mail.gmail.com>
In-Reply-To: <CAHUa44Gh3Y9a=ci7FPibiT=hFGbn+B7iaAY1n_Q6MDYoO6PJdA@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 28 Nov 2024 17:46:44 +0530
Message-ID: <CAFA6WYOismrfoMLhkZo1GuSdZQDFz6dAF84f-cQxTidwgVoMAA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] tee: introduce orphan tee_shm and default context
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Amirreza Zarrabi <quic_azarrabi@quicinc.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Nov 2024 at 12:52, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> On Wed, Nov 27, 2024 at 7:02=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org=
> wrote:
> >
> > On Tue, 26 Nov 2024 at 20:52, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> > >
> > > On Tue, Nov 26, 2024 at 1:27=E2=80=AFPM Sumit Garg <sumit.garg@linaro=
.org> wrote:
> > > >
> > > > On Tue, 26 Nov 2024 at 14:03, Jens Wiklander <jens.wiklander@linaro=
.org> wrote:
> > > > >
> > > > > On Mon, Nov 25, 2024 at 9:55=E2=80=AFPM Amirreza Zarrabi
> > > > > <quic_azarrabi@quicinc.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 11/25/2024 6:51 PM, Sumit Garg wrote:
> > > > > > > On Mon, 25 Nov 2024 at 12:53, Jens Wiklander <jens.wiklander@=
linaro.org> wrote:
> > > > > > >>
> > > > > > >> On Mon, Nov 25, 2024 at 7:14=E2=80=AFAM Sumit Garg <sumit.ga=
rg@linaro.org> wrote:
> > > > > > >>>
> > > > > > >>> On Mon, 25 Nov 2024 at 03:00, Amirreza Zarrabi
> > > > > > >>> <quic_azarrabi@quicinc.com> wrote:
> > > > > > >>>>
> > > > > > >>>>
> > > > > > >>>> Hi Sumit,
> > > > > > >>>>
> > > > > > >>>> Thank you so much for the comemnts :).
> > > > > > >>>>
> > > > > > >>>> On 11/23/2024 9:32 PM, Sumit Garg wrote:
> > > > > > >>>>> Hi Amirreza,
> > > > > > >>>>>
> > > > > > >>>>> Thanks for proposing this.
> > > > > > >>>>>
> > > > > > >>>>> On Fri, 22 Nov 2024 at 06:38, Amirreza Zarrabi
> > > > > > >>>>> <quic_azarrabi@quicinc.com> wrote:
> > > > > > >>>>>>
> > > > > > >>>>>>
> > > > > > >>>>>> On 11/21/2024 11:08 PM, Jens Wiklander wrote:
> > > > > > >>>>>>
> > > > > > >>>>>> Hi Jens,
> > > > > > >>>>>>
> > > > > > >>>>>>> Hi Amirreza,
> > > > > > >>>>>>>
> > > > > > >>>>>>> On Thu, Nov 21, 2024 at 2:37=E2=80=AFAM Amirreza Zarrab=
i
> > > > > > >>>>>>> <quic_azarrabi@quicinc.com> wrote:
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> The default context has a lifespan similar to the tee_=
device.
> > > > > > >>>>>
> > > > > > >>>>> Since it's associated with tee_device context, let's call=
 it obvious
> > > > > > >>>>> via renaming it as device context instead (s/def_ctx/dev_=
ctx/ in this
> > > > > > >>>>> patch).
> > > > > > >>>>>
> > > > > > >>>>
> > > > > > >>>> Make sense, I'll rename it.
> > > > > > >>>>
> > > > > > >>>>>>>> It is used as a context for shared memory if the conte=
xt to which the
> > > > > > >>>>>>>> shared memory belongs is released, making the tee_shm =
an orphan.
> > > > > > >>>>>>>> This allows the driver implementing shm_unregister to =
safely make
> > > > > > >>>>>>>> subsequent calls, such as to a supplicant if needed.
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> It also enables users to free the shared memory while =
the driver is
> > > > > > >>>>>>>> blocked on unregister_tee_device safely.
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> Preferably, this should be used for all driver interna=
l uses, using
> > > > > > >>>>>>>> teedev_get_def_context rather than calling teedev_open=
.
> > > > > > >>>>>
> > > > > > >>>>> Makes sense to me.
> > > > > > >>>>>
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc=
.com>
> > > > > > >>>>>>>> ---
> > > > > > >>>>>>>>  drivers/tee/optee/core.c    |  2 +-
> > > > > > >>>>>>>>  drivers/tee/optee/ffa_abi.c |  2 +-
> > > > > > >>>>>>>>  drivers/tee/optee/smc_abi.c |  2 +-
> > > > > > >>>>>>>>  drivers/tee/tee_core.c      | 83 ++++++++++++++++++++=
+++++++++----------------
> > > > > > >>>>>>>>  drivers/tee/tee_private.h   |  3 --
> > > > > > >>>>>>>>  drivers/tee/tee_shm.c       | 18 ++--------
> > > > > > >>>>>>>>  include/linux/tee_core.h    | 15 ++++++++
> > > > > > >>>>>>>>  include/linux/tee_drv.h     |  7 ----
> > > > > > >>>>>>>>  8 files changed, 73 insertions(+), 59 deletions(-)
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/op=
tee/core.c
> > > > > > >>>>>>>> index c75fddc83576..78d43d0c8014 100644
> > > > > > >>>>>>>> --- a/drivers/tee/optee/core.c
> > > > > > >>>>>>>> +++ b/drivers/tee/optee/core.c
> > > > > > >>>>>>>> @@ -173,7 +173,7 @@ void optee_remove_common(struct op=
tee *optee)
> > > > > > >>>>>>>>
> > > > > > >>>>>>>>         optee_notif_uninit(optee);
> > > > > > >>>>>>>>         optee_shm_arg_cache_uninit(optee);
> > > > > > >>>>>>>> -       teedev_close_context(optee->ctx);
> > > > > > >>>>>>>> +
> > > > > > >>>>>>>>         /*
> > > > > > >>>>>>>>          * The two devices have to be unregistered bef=
ore we can free the
> > > > > > >>>>>>>>          * other resources.
> > > > > > >>>>>>>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee=
/optee/ffa_abi.c
> > > > > > >>>>>>>> index f3af5666bb11..6ad94f0788ad 100644
> > > > > > >>>>>>>> --- a/drivers/tee/optee/ffa_abi.c
> > > > > > >>>>>>>> +++ b/drivers/tee/optee/ffa_abi.c
> > > > > > >>>>>>>> @@ -949,7 +949,7 @@ static int optee_ffa_probe(struct =
ffa_device *ffa_dev)
> > > > > > >>>>>>>>         optee_shm_arg_cache_init(optee, arg_cache_flag=
s);
> > > > > > >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> > > > > > >>>>>>>>         ffa_dev_set_drvdata(ffa_dev, optee);
> > > > > > >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> > > > > > >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > > > > > >>>>>>>>         if (IS_ERR(ctx)) {
> > > > > > >>>>>>>>                 rc =3D PTR_ERR(ctx);
> > > > > > >>>>>>>>                 goto err_rhashtable_free;
> > > > > > >>>>>>>> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee=
/optee/smc_abi.c
> > > > > > >>>>>>>> index e9456e3e74cc..c77a3e631d04 100644
> > > > > > >>>>>>>> --- a/drivers/tee/optee/smc_abi.c
> > > > > > >>>>>>>> +++ b/drivers/tee/optee/smc_abi.c
> > > > > > >>>>>>>> @@ -1722,7 +1722,7 @@ static int optee_probe(struct pl=
atform_device *pdev)
> > > > > > >>>>>>>>         mutex_init(&optee->rpmb_dev_mutex);
> > > > > > >>>>>>>>
> > > > > > >>>>>>>>         platform_set_drvdata(pdev, optee);
> > > > > > >>>>>>>> -       ctx =3D teedev_open(optee->teedev);
> > > > > > >>>>>>>> +       ctx =3D teedev_get_def_context(optee->teedev);
> > > > > > >>>>>>>>         if (IS_ERR(ctx)) {
> > > > > > >>>>>>>>                 rc =3D PTR_ERR(ctx);
> > > > > > >>>>>>>>                 goto err_supp_uninit;
> > > > > > >>>>>>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_=
core.c
> > > > > > >>>>>>>> index 93f3b330aec8..805e1336089d 100644
> > > > > > >>>>>>>> --- a/drivers/tee/tee_core.c
> > > > > > >>>>>>>> +++ b/drivers/tee/tee_core.c
> > > > > > >>>>>>>> @@ -57,7 +57,6 @@ struct tee_context *teedev_open(stru=
ct tee_device *teedev)
> > > > > > >>>>>>>>                 goto err;
> > > > > > >>>>>>>>         }
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> -       kref_init(&ctx->refcount);
> > > > > > >>>>>>>>         ctx->teedev =3D teedev;
> > > > > > >>>>>>>>         INIT_LIST_HEAD(&ctx->list_shm);
> > > > > > >>>>>>>>         rc =3D teedev->desc->ops->open(ctx);
> > > > > > >>>>>>>> @@ -73,36 +72,43 @@ struct tee_context *teedev_open(st=
ruct tee_device *teedev)
> > > > > > >>>>>>>>  }
> > > > > > >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_open);
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> -void teedev_ctx_get(struct tee_context *ctx)
> > > > > > >>>>>>>> +struct tee_context *teedev_get_def_context(struct tee=
_device *teedev)
> > > > > > >>>>>>>>  {
> > > > > > >>>>>>>> -       if (ctx->releasing)
> > > > > > >>>>>>>> -               return;
> > > > > > >>>>>>>> +       int rc;
> > > > > > >>>>>>>> +       struct tee_context *ctx =3D &teedev->def_ctx;
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> -       kref_get(&ctx->refcount);
> > > > > > >>>>>>>> -}
> > > > > > >>>>>>>> +       ctx->teedev =3D teedev;
> > > > > > >>>>>>>> +       INIT_LIST_HEAD(&ctx->list_shm);
> > > > > > >>>>>>>> +       rc =3D teedev->desc->ops->open(ctx);
> > > > > > >>>>>>>> +       if (rc)
> > > > > > >>>>>>>> +               return ERR_PTR(rc);
> > > > > > >>>>>>>
> > > > > > >>>>>>> I think ctx->teedev and ctx->list_shm must always be in=
itialized or
> > > > > > >>>>>>> &teedev->def_ctx can't be used in teedev_close_context(=
).
> > > > > > >>>>>>
> > > > > > >>>>>> True, but &teedev->def_ctx is never used in teedev_close=
_context().
> > > > > > >>>>>> The closing of the &teedev->def_ctx simply ignored. So o=
nce opened,
> > > > > > >>>>>> &teedev->def_ctx will always remain open until the tee_d=
evice is alive.
> > > > > > >>>>>>
> > > > > > >>>>>>> We could initialize teedev->def_ctx on the first call t=
o teedev_open()
> > > > > > >>>>>>> on that tee_device. We need a way to tell the
> > > > > > >>>>>>> teedev->desc->ops->open() to the backed driver that it'=
s initializing
> > > > > > >>>>>>> the default context though, or optee_open() can't handl=
e the
> > > > > > >>>>>>> tee-supplicant case properly.
> > > > > > >>>>>>>
> > > > > > >>>>>>
> > > > > > >>>>>> That's a good point. This way, it is guaranteed that the=
re is one def_ctx
> > > > > > >>>>>> per teedev. There should be a way to tell the open() cal=
lback that it is
> > > > > > >>>>>> a def_ctx, so it is not registered as a supplicant conte=
xt.
> > > > > > >>>>>>
> > > > > > >>>>>>
> > > > > > >>>>>>> Should we allow this function to be called more than on=
ce for each teedev?
> > > > > > >>>>>>
> > > > > > >>>>>> Yes, moving to teedev_open() will fix the issue.
> > > > > > >>>>>>
> > > > > > >>>>>>> Do we need serialization in this function if it's calle=
d after the
> > > > > > >>>>>>> driver is probed?
> > > > > > >>>>>>>
> > > > > > >>>>>>
> > > > > > >>>>>> True. I'll make sure there is no race.
> > > > > > >>>>>>
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> -static void teedev_ctx_release(struct kref *ref)
> > > > > > >>>>>>>> -{
> > > > > > >>>>>>>> -       struct tee_context *ctx =3D container_of(ref, =
struct tee_context,
> > > > > > >>>>>>>> -                                              refcoun=
t);
> > > > > > >>>>>>>> -       ctx->releasing =3D true;
> > > > > > >>>>>>>> -       ctx->teedev->desc->ops->release(ctx);
> > > > > > >>>>>>>> -       kfree(ctx);
> > > > > > >>>>>>>> +       return ctx;
> > > > > > >>>>>>>>  }
> > > > > > >>>>>>>> +EXPORT_SYMBOL_GPL(teedev_get_def_context);
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> -void teedev_ctx_put(struct tee_context *ctx)
> > > > > > >>>>>>>> +void teedev_close_context(struct tee_context *ctx)
> > > > > > >>>>>>>>  {
> > > > > > >>>>>>>> -       if (ctx->releasing)
> > > > > > >>>>>>>> +       struct tee_device *teedev =3D ctx->teedev;
> > > > > > >>>>>>>> +       struct tee_shm *shm;
> > > > > > >>>>>>>> +
> > > > > > >>>>>>>> +       if (ctx =3D=3D &teedev->def_ctx)
> > > > > > >>>>>>>>                 return;
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> -       kref_put(&ctx->refcount, teedev_ctx_release);
> > > > > > >>>>>>>> -}
> > > > > > >>>>>>>> +       teedev->desc->ops->release(ctx);
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> -void teedev_close_context(struct tee_context *ctx)
> > > > > > >>>>>>>> -{
> > > > > > >>>>>>>> -       struct tee_device *teedev =3D ctx->teedev;
> > > > > > >>>>>>>> +       mutex_lock(&teedev->mutex);
> > > > > > >>>>>>>> +       list_for_each_entry(shm, &ctx->list_shm, link)=
 {
> > > > > > >>>>>>>> +               /* Context released. However, shm stil=
l holding a teedev reference.
> > > > > > >>>>>>>> +                * Replace shm->ctx with the default c=
ontext so that tee_shm_get_from_id()
> > > > > > >>>>>>>> +                * fails (i.e. it is not accessible fr=
om userspace) but shm still
> > > > > > >>>>>>>> +                * holds a valid context for further c=
lean up, e.g. shm_unregister().
> > > > > > >>>>>>>> +                */
> > > > > > >>>>>>>
> > > > > > >>>>>>> /*
> > > > > > >>>>>>>  * Please format
> > > > > > >>>>>>>  * multiline comments
> > > > > > >>>>>>>  * like this. Please
> > > > > > >>>>>>>  * keep the lines at
> > > > > > >>>>>>>  * max 80 columns
> > > > > > >>>>>>>  * here and at other
> > > > > > >>>>>>>  * places in the patch-
> > > > > > >>>>>>>  * set.
> > > > > > >>>>>>>  */
> > > > > > >>>>>>>
> > > > > > >>>>>>
> > > > > > >>>>>> Ack.
> > > > > > >>>>>>
> > > > > > >>>>>>>> +               shm->ctx =3D &teedev->def_ctx;
> > > > > > >>>>>>>
> > > > > > >>>>>>> shm->ctx will always point to a valid context, even if =
it is the
> > > > > > >>>>>>> default context. It seems that we can always get hold o=
f the correct
> > > > > > >>>>>>> teedev via shm->ctx->teedev. Do we need "tee: revert re=
moval of
> > > > > > >>>>>>> redundant teedev in struct tee_shm"?
> > > > > > >>>>>>>
> > > > > > >>>>>>
> > > > > > >>>>>> It was there in case we wanted to use NULL, but with def=
_ctx, it is not
> > > > > > >>>>>> necessary. I am withdrawing that commit. :).
> > > > > > >>>>>>
> > > > > > >>>>>>> Shouldn't the shm be removed from the ctx->list_shm and=
 be moved to
> > > > > > >>>>>>> teedev->def_ctx.list_shm?
> > > > > > >>>>>
> > > > > > >>>>> +1
> > > > > > >>>>>
> > > > > > >>>>
> > > > > > >>>> Ack.
> > > > > > >>>>
> > > > > > >>>>>>>
> > > > > > >>>>>>
> > > > > > >>>>>> Not really. If we put shm in the teedev->def_ctx.list_sh=
m, by the time
> > > > > > >>>>>> we are closing the def_ctx, the list is guaranteed to be=
 empty.
> > > > > > >>>>>>
> > > > > > >>>>>> However, I understand it is cleaner and more consistent =
to do that rather
> > > > > > >>>>>> than making changes to tee_shm_put().
> > > > > > >>>>>>
> > > > > > >>>>>> I'll do it.
> > > > > > >>>>>>
> > > > > > >>>>>>>> +       }
> > > > > > >>>>>>>> +       mutex_unlock(&teedev->mutex);
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> -       teedev_ctx_put(ctx);
> > > > > > >>>>>>>> +       kfree(ctx);
> > > > > > >>>>>>>>         tee_device_put(teedev);
> > > > > > >>>>>>>>  }
> > > > > > >>>>>>>>  EXPORT_SYMBOL_GPL(teedev_close_context);
> > > > > > >>>>>>>> @@ -946,6 +952,8 @@ struct tee_device *tee_device_allo=
c(const struct tee_desc *teedesc,
> > > > > > >>>>>>>>
> > > > > > >>>>>>>>         teedev->desc =3D teedesc;
> > > > > > >>>>>>>>         teedev->pool =3D pool;
> > > > > > >>>>>>>> +       /* Only open default context when teedev_get_d=
ef_context() called. */
> > > > > > >>>>>>>> +       teedev->def_ctx.teedev =3D NULL;
> > > > > > >>>>>
> > > > > > >>>>> Why don't you open the device context here only? This wil=
l associate
> > > > > > >>>>> it automatically with teedev lifespan and then
> > > > > > >>>>> teedev_get_def_context() will just return a reference to =
that.
> > > > > > >>>>>
> > > > > > >>>>> -Sumit
> > > > > > >>>>>
> > > > > > >>>>
> > > > > > >>>> So my assumption is that the tee_devic_alloc() is called a=
s part of
> > > > > > >>>> the driver initialization; there is no guarantee that at t=
his time the
> > > > > > >>>> driver is actually ready to accept any open() callback.
> > > > > > >>>>
> > > > > > >>>
> > > > > > >>> The drivers should be able to handle open() callback since =
we already
> > > > > > >>> check for !teedesc->ops->open in the beginning of tee_devic=
_alloc().
> > > > > > >>> Also, we need to open a device context for !TEE_DESC_PRIVIL=
EGED such
> > > > > > >>> that we don't open a supplicant device context there.
> > > > > > >>
> > > > > > >> It would be nice to have the device context fully initialize=
d when the
> > > > > > >> probe function returns. How about adding a "bool is_dev_ctx"=
 to struct
> > > > > > >> tee_context so the open() callback can tell that this is a s=
pecial
> > > > > > >> tee_contex?
> > > > > > >
> > > > > > > Sure, that will be useful to distinguish the device context f=
rom
> > > > > > > normal client context.
> > > > > > >
> > > > > > > -Sumit
> > > > > > >
> > > > > >
> > > > > > So, as far as the open() callback, I do not believe checking if=
 it is not null
> > > > > > is reasonable for calling it here. Most drivers allocate resour=
ces and then
> > > > > > initialize them. So, assume these steps for a TEE driver:
> > > > > >  (1) allocate internal data structures,
> > > > > >  (2) allocate the device,
> > > > > >  (3) initialize the internal data structurse and then
> > > > > >  (4) register the device.
> > > > > >
> > > > > > Having these steps for a backend driver means that if you call =
open() at
> > > > > > step (2), the internal data structures are not ready.
> > > >
> > > > As part of tee_device_alloc(), every driver has to pass "const stru=
ct
> > > > tee_desc *teedesc" fully initialized. Which internal data structure=
s
> > > > are you referring too? Is there any upstream example?
> > >
> > > It's reasonable to wait with the open() callback until step 4 above,
> > > which should correspond with the tee_device_register() call. Data
> > > written only once doesn't need serialized access if the fields are
> > > only accessed after they have been fully initialized.
> >
> > Fair enough, I can live with the device context opened after registerin=
g it.
> >
> > >
> > > >
> > > > > >
> > > > > > I was originally thinking of going with Jens' suggestion to ope=
n dev_ctx in
> > > > > > the teedev_open(), and use a flag to distinguish the type of co=
ntext for
> > > > > > the open() callback
> > > > > >
> > > > > > What about this:
> > > > > > Open the dev_ctx in the tee_device_register(), at the last step=
 before
> > > > > > setting the TEE_DEVICE_FLAG_REGISTERED flag. Then the open() ca=
llback can
> > > > > > check for this flag to determine if it is a normal context or d=
ev_ctx.
> > > > > > If the open() is called while the device has not been registere=
d, it should
> > > > > > handle it differently
> > > > >
> > > > > That makes sense, the driver should be prepared to handle open() =
calls
> > > > > after tee_device_register() anyway.
> > > > > However, there is no serialization of the flags field in struct
> > > > > tee_device. Hmm, would it be too hacky for the open() callback to
> > > > > check if &ctx->teedev.dev_ctx =3D=3D ctx? We could add a helper f=
unction
> > > > > to wrap that check.
> > > > >
> > > >
> > > > Your suggested change requires every driver to update open() callba=
ck
> > > > and later other callbacks may have to support it too. IMHO, only
> > > > teedev_get_dev_ctx() should be able to return a reference to device
> > > > context for usage within the TEE and the implementation driver.
> > >
> > > Yes, but it's only the OP-TEE driver that needs anything special. It
> > > looks like the others can be left unchanged.
> >
> > I suppose it's most likely the upcoming QTEE driver requiring it.
> >
> > >
> > > >
> > > > I am still not able to understand why the following won't work with=
 a
> > > > clear lifetime for the device context?
> > > >
> > > > tee_device_alloc()
> > > >   -> if (!(teedesc->flags & TEE_DESC_PRIVILEGED))
> > > > desc->ops->open(&teedev->dev_ctx);
> > >
> > > We must also have a fully initialized dev_ctx for the supplicant
> > > device.
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
>
> One reason for initializing dev_ctx for all tee_devices is in
> teedev_close_context(), where the tee_shms still active are
> transferred to dev_ctx. The teedev member was re-introduced in this
> patch set, but it can be removed again if we can depend on the dev_ctx
> to always be available in teedev_close_context(). Even the
> tee-supplicant may close its tee_context with active tee_shms at some
> point. It might be possible to use half-baked dev_ctx, but then we'd
> be burdened with keeping track of which dev_ctx can be used for what.
> We want as few special cases as possible.
>

Okay that sounds reasonable to lower the complexity. However,
currently we only allow a single supplicant context so having another
device context exception for that shouldn't be an issue.

-Sumit


> >
> > > I'd rather delay the open() callback until
> > > tee_device_register() since the dev_ctx is guaranteed not to be neede=
d
> > > before that.
> >
> > Okay, the updated call chain can look like:
> >
> > tee_device_register()
> >   -> if (!(teedev->desc->flags & TEE_DESC_PRIVILEGED))
> >          desc->ops->open(&teedev->dev_ctx);
> > >
> > > >
> > > > tee_device_put()
> > > >   -> if (teedev->dev_ctx) desc->ops->release(&teedev->dev_ctx);
> > >
> > > teedev->dev_ctx is supposed to be embedded in struct tee_device, so
> > > the if isn't needed.
> >
> > I added "if" to cover the case when dev_ctx is not initialized for the
> > supplicant device.
>
> OK.
>
> Cheers,
> Jens
>
> >
> > -Sumit
> >
> > >
> > > Cheers,
> > > Jens
> > >
> > > >
> > > > -Sumit
> > > >
> > > > > Cheers,
> > > > > Jens
> > > > >
> > > > > >
> > > > > > - Amir
> > > > > >
> > > > > > >>
> > > > > > >> Cheers,
> > > > > > >> Jens
> > > > > > >>
> > > > > > >>>
> > > > > > >>> -Sumit

