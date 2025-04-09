Return-Path: <linux-arm-msm+bounces-53620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2D8A81FC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 10:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A07873BA836
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 08:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E4225B692;
	Wed,  9 Apr 2025 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yrOlad9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCE625D200
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187255; cv=none; b=V1ecl+WYcvAz/PjScYkk/tDxhD+5TVXdG6zov1z0+OhPar6cQFFFMV6mNqOkYea5aczqOuBfWqnLgDqXHkEhatHMJ1AOWodC4JqmmCp1aul8B+Sbbk34xPowmPOUSP6mjfgYKpiYzJ0el2fCM8zh0thBjF5CF1KV4n2wixSEBok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187255; c=relaxed/simple;
	bh=jkHYEX1Ktd5OqU5tbqEEOC9i8YxJ6TPdszvCIdEeSeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6i71DWUNq3jYFGPLRx9I3LiQpXa+jwAX7NLbsI982r3id8nYcyLSazRqD60R+gXGRO1+tFKtGkaTzHF58mi9rD4O4xWw4coGoTIGNTcrUD2N8LarwEyGIrOEF8rHBLo2FXw7GWw7ij/rggBOK2B9nS8geUxx7yJ0x92Md7GJlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yrOlad9b; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72c40235c34so1551457a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744187252; x=1744792052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/lMrgXCt3JM3AMAeq45BbCg9Kkq7K6y3EXwhXyUEBw=;
        b=yrOlad9biyApdRTJanMQTvQCodVssZ4SUTIWfVLBVS2g4oehGJ/yhfDlx1072CSkr/
         CtThwRi2RKcb8rHUkduN5JHDHJr96pFHJJvKKz/nchiRLPqVfKJHXZpJ5cKP4EkQQ/vz
         Ws8Azv4Bc6Lr83S9WSkR9dzUi+DSNzUJy+kTEm2Loh6y0I57s/wSKnuZYireefZbUy3G
         tn7/qIAh+B2TnltI7R3L45dKZlJvfIaTlel7V7HlhksSOWwOoA2QpzgXV+dO87AB8yTy
         x9DmVQGP+Gk+8aAaby8WlgYOlSD9rNeeIegZnwqTiNzHFGumzdlBQchqcOs2jVlvTpav
         +Xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187252; x=1744792052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/lMrgXCt3JM3AMAeq45BbCg9Kkq7K6y3EXwhXyUEBw=;
        b=UT8VAxRYCdr3H5yc5U2tMGKGiEsGC2ISSCopemWxSfUU4Sr+1VnBxssmk3qSv0WS49
         qWXos1oVsnbV0vZ5uOhJPUIrSRKik492uQeMduKEMERn0gjYKnyQXnO93imIQNNRYedB
         KybDk7pLuN5ezhjoSydW6PeQCX8obtteA0MHvlrTuOUVw0EECXphE0y7oOUOCEnmQcqX
         wx1ulCZskFFiKpejc/QI3asxC7ZkUmVrO0ciOcnF9U3yL69cKdQu/t+kO4TVbX2MsaNH
         tUmgyZJ4RLSduZnyurB8QyHnA9C/Dd6/nZSkiNPwM40WW0CNdFTS4ZA0qBOBtunfxDBy
         z2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVCGVwX8Dl+cqoj+Cs0Z2UyIZUT5TtWVUt4jgthQ9FcaZVQQnd0cEh3zFgDwveJ3Ae/0AqrgskephNSYHNl@vger.kernel.org
X-Gm-Message-State: AOJu0YyIW2RNAPRB+J7IzR/kYPrAUcN33JyF746d1PyDaTMLz6yr7DX6
	qIa/jORV8GmzJ99Gm3QJepPMS2ZzUyN5O1nnLBgUVmAOEdCHLFQ6JEPPjGhluoRHs3kPVuPi/P5
	FPA1SvLjzmFT4WlhWoG28fbLUjg1jM8a73/bhFA==
X-Gm-Gg: ASbGncvYl2MsLeOR5vntHOKcybinruVUUE3wwxtR3BH+BU29AzZPZ8L2CmCPlvTo8Zk
	TbnxR8jK8xaOmqjqDPNhUuw1+/eMWu497rtWG4B+jG5yOZvI6/ikPi7IvobjAvtTqn3v+dsqklJ
	9mkM0YnbPiVHdQC5zyIGh2AqY=
X-Google-Smtp-Source: AGHT+IEZeTFmVGTODWpd4xX+uFSSHfdEGipiWyYBCt8L1cARUIZAiR6ETmFp0kxz7VRwM4TyG8bHNU5bF8YWbLJbRHo=
X-Received: by 2002:a05:6870:7194:b0:2c6:72d3:fc93 with SMTP id
 586e51a60fabf-2d09176b3c9mr745417fac.12.1744187252078; Wed, 09 Apr 2025
 01:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
 <CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com>
 <5de2a378-77cf-4373-b3ae-faeebb931e2d@oss.qualcomm.com> <CAHUa44F-t29Hu0o3+0vFLjtrnA8ZGycPFcUTXEOmms9B=cZ6XA@mail.gmail.com>
 <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>
In-Reply-To: <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 9 Apr 2025 10:27:20 +0200
X-Gm-Features: ATxdqUGMP5rCKKVvoNhq1SVNDfoVDLELnKd9DL_eKtgXdtc8jbz_99zAWdvG1vE
Message-ID: <CAHUa44G9NS-kyqEuuJrqijNttGANUJ_3W0uu+686fhA2C6pYDQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Apurupa Pattapu <quic_apurupa@quicinc.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 9:20=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
>
>
> On 4/9/2025 4:41 PM, Jens Wiklander wrote:
> > Hi Amirreza,
> >
> > On Wed, Apr 9, 2025 at 2:28=E2=80=AFAM Amirreza Zarrabi
> > <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> Hi jens,
> >>
> >> On 4/8/2025 10:19 PM, Jens Wiklander wrote:
> >>
> >> Hi Amirreza,
> >>
> >> On Fri, Mar 28, 2025 at 3:48=E2=80=AFAM Amirreza Zarrabi
> >> <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> For drivers that can transfer data to the TEE without using shared
> >> memory from client, it is necessary to receive the user address
> >> directly, bypassing any processing by the TEE subsystem. Introduce
> >> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
> >> userspace buffers.
> >>
> >> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> ---
> >>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
> >>  include/linux/tee_drv.h  |  6 ++++++
> >>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
> >>  3 files changed, 55 insertions(+), 6 deletions(-)
> >>
> >> Is this patch needed now that the QCOMTEE driver supports shared
> >> memory? I prefer keeping changes to the ABI to a minimum.
> >>
> >> Cheers,
> >> Jens
> >>
> >> Unfortunately, this is still required. QTEE supports two types of data=
 transfer:
> >> (1) using UBUF and (2) memory objects. Even with memory object support=
, some APIs still
> >> expect to receive data using UBUF. For instance, to load a TA, QTEE of=
fers two interfaces:
> >> one where the TA binary is in UBUF and another where the TA binary is =
in a memory object.
> >
> > Is this a limitation in the QTEE backend driver or on the secure side?
> > Can it be fixed? I don't ask for changes in the ABI to the secure
> > world since I assume you haven't made such changes while this patch
> > set has evolved.
> >
> > Cheers,
> > Jens
>
> The secure-side ABI supports passing data using memcpy to the same
> buffer that contains the message for QTEE, rather than using a memory
> object. Some services tend to use this approach for small data instead
> of allocating a memory object. I have no choice but to expose this suppor=
t.

Got it, thanks! It's needed.

>
> Throughout the patchset, I have not made any change to the ABI but
> tried to provide support for the memory object in a separate,
> independent commit, distinct from the UBUF.

OK

Cheers,
Jens

>
> Best regards,
> Amir
>
> >
> >>
> >> Best Regards,
> >> Amir
> >>
> >> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> >> index 22cc7d624b0c..bc862a11d437 100644
> >> --- a/drivers/tee/tee_core.c
> >> +++ b/drivers/tee/tee_core.c
> >> @@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *c=
tx, struct tee_param *params,
> >>                         params[n].u.value.b =3D ip.b;
> >>                         params[n].u.value.c =3D ip.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       params[n].u.ubuf.uaddr =3D u64_to_user_ptr(ip.=
a);
> >> +                       params[n].u.ubuf.size =3D ip.b;
> >> +
> >> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> >> +                                      params[n].u.ubuf.size))
> >> +                               return -EFAULT;
> >> +
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >> @@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param =
__user *uparams,
> >>                             put_user(p->u.value.c, &up->c))
> >>                                 return -EFAULT;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
> >> +                               return -EFAULT;
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >>                         if (put_user((u64)p->u.memref.size, &up->b))
> >> @@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx=
,
> >>                         ip.b =3D p->u.value.b;
> >>                         ip.c =3D p->u.value.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       ip.a =3D (u64)p->u.ubuf.uaddr;
> >> +                       ip.b =3D p->u.ubuf.size;
> >> +                       ip.c =3D 0;
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >> @@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *par=
ams, size_t num_params,
> >>                         p->u.value.b =3D ip.b;
> >>                         p->u.value.c =3D ip.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       p->u.ubuf.uaddr =3D u64_to_user_ptr(ip.a);
> >> +                       p->u.ubuf.size =3D ip.b;
> >> +
> >> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> >> +                                      params[n].u.ubuf.size))
> >> +                               return -EFAULT;
> >> +
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >>                         /*
> >> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> >> index ce23fd42c5d4..d773f91c6bdd 100644
> >> --- a/include/linux/tee_drv.h
> >> +++ b/include/linux/tee_drv.h
> >> @@ -82,6 +82,11 @@ struct tee_param_memref {
> >>         struct tee_shm *shm;
> >>  };
> >>
> >> +struct tee_param_ubuf {
> >> +       void * __user uaddr;
> >> +       size_t size;
> >> +};
> >> +
> >>  struct tee_param_value {
> >>         u64 a;
> >>         u64 b;
> >> @@ -92,6 +97,7 @@ struct tee_param {
> >>         u64 attr;
> >>         union {
> >>                 struct tee_param_memref memref;
> >> +               struct tee_param_ubuf ubuf;
> >>                 struct tee_param_value value;
> >>         } u;
> >>  };
> >> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> >> index d0430bee8292..3e9b1ec5dfde 100644
> >> --- a/include/uapi/linux/tee.h
> >> +++ b/include/uapi/linux/tee.h
> >> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
> >>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
> >>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and o=
utput */
> >>
> >> +/*
> >> + * These defines userspace buffer parameters.
> >> + */
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and o=
utput */
> >> +
> >>  /*
> >>   * Mask for the type part of the attribute, leaves room for more type=
s
> >>   */
> >> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
> >>  /**
> >>   * struct tee_ioctl_param - parameter
> >>   * @attr: attributes
> >> - * @a: if a memref, offset into the shared memory object, else a valu=
e parameter
> >> - * @b: if a memref, size of the buffer, else a value parameter
> >> + * @a: if a memref, offset into the shared memory object,
> >> + *     else if a ubuf, address of the user buffer,
> >> + *     else a value parameter
> >> + * @b: if a memref or ubuf, size of the buffer, else a value paramete=
r
> >>   * @c: if a memref, shared memory identifier, else a value parameter
> >>   *
> >> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is u=
sed in
> >> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
> >> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE=
_NONE
> >> - * indicates that none of the members are used.
> >> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or val=
ue is
> >> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
> >> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_=
TYPE_UBUF_*
> >> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of th=
e members
> >> + * are used.
> >>   *
> >>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
> >>   * identifier representing the shared memory object. A memref can ref=
erence
> >>
> >> --
> >> 2.34.1
> >>
>

