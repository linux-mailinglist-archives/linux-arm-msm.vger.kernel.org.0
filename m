Return-Path: <linux-arm-msm+bounces-53607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B718A81D40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 08:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B91024C0825
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 06:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB8A1DE8A8;
	Wed,  9 Apr 2025 06:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vJIsxAmt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E302AE97
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180877; cv=none; b=LY5He5nnXcvz2KW135rgIloNh2lQ/WuWMcuIO2KEjxlntvCx7iI7XWc82zV22RHZ2CZbJL4ShIEab6mzurLdcYDRASMSN0cQx2X9J2C4mdJiN7x7SjwTn5F+jguxtlet60gFumwd2o3Lum6PTlTjHMnOSFh59i/l2055ohwdllc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180877; c=relaxed/simple;
	bh=zGxwNnUmXMfwKZuG7h/jRUqwjfd847rvoRfhHknNCNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAHQO8ZMBhEwnnLXi/r7Z4Yia5nXIwobQ0Bo9cHwEyu8EXnzUEX9mAGIPCzoWTcWhj1v15oGnYDx/Gx2fmnn5ixGMaOHR3EpHm4i34TyWgwGq1BYPKCTldBKa3C99FY4pORWowW683hIKk7LTUmulAM4U61FzZmuvz/Nq85zlFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vJIsxAmt; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2d09d495c6cso22601fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 23:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744180874; x=1744785674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lg1zubIIQ2f2lCdRuDMx0bvXEmWPDBNMHPp9FQ2hXHQ=;
        b=vJIsxAmtHxGn6TgMJ0aYwAJWx2ql3iKMTxFGrgDMYj/PYs9KRyA2fx2FPbdwOQOhYb
         Zq5d+1sL9DN2OmDK4Kd+apohS4Uy9if37x3IjiGMcEUrI19Y7/3jnkZ5CDk1HRqE1cp4
         ukHtLeE9TlUhfMUfQ8UozTI6hcXjErCxW+Ogw8JrChWMl5jRVrC7Fwlm9+VjDx1j+5VC
         4gzDUJIuUQqzRVl8kpyCWf3Lk7GZ9H6wtgZK/eW0WfQvQyEufl9HTMJ5l6czOTLVKQL6
         jrlLDMPGtFhaVVLjLFnre8/gwMvMRtzuSWvs4TlorVZNJOV6urHP632GTw3ZWfGUqXrU
         Tqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180874; x=1744785674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lg1zubIIQ2f2lCdRuDMx0bvXEmWPDBNMHPp9FQ2hXHQ=;
        b=pSz1YMpTzbO9kK6p+dpl5Ska/3/nxeCzljuwAOuEd6KTnEJan51bsv0fEDv3J4szuI
         aFQVJgmYeutk3kE4bElsL2Lr2E6DqxtX9PYyXNJhDAq3v/5fZwJGBPM8B+CZTu5Zqet5
         q5tCiDXbUh5HIqBjCNbawAc2gsxFgUpe24lrER4msUmHX3oBAVbYqRzvKSbapuBzZP1W
         tcFwAImaPCaCeaupMHHNlROECF0p7aMd/a0K4N0Ll1WlBwIks5z3/nyEicM9GCiIEOKi
         K1z3EVAGm/AqrmCkQRIvpDPeqe2HUdWaVRFxhpnK/QFdaS9Qk0Rhf6Pk9SVOZhaLvQ/2
         Te7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQvEJXpF6uUlaDJg56zDHyg4EAlqYUvCIjZa8AqyRgzlbrwub5H7HSk1LJ+F9thsAagyZ8PjYbnEH1yo7M@vger.kernel.org
X-Gm-Message-State: AOJu0Yznud05oUV2kvmUAbuDJJAxaMUOspWpDv2QII3ujf5uFP1d50EY
	r/BuunOIjwtEzz0KZxOezAZ4j9D4yLlwAvnRWyc3875WklZL0fDjQIg94mRGJJbqCfHERROWkuO
	92Posd/chEWlgqO7vK9sRFojzv5y9jqYMz3N1Bw==
X-Gm-Gg: ASbGncuKyZNmfP2vIVM4PuT44ysPjio7smBOJNikx3dMjet6dLtJNWhvtHmpT436BSY
	7jL8pwdKRLCGelUd5mvTuVSp8sDTyYSJuw04e+V0zqD8xA3glMjjB9hIHb2nwrwPA/J2cKjp0i4
	e5cwQdArrwQ/aWHHIBHmWZjgQ=
X-Google-Smtp-Source: AGHT+IEcOaeO7Dkm5yTCQ3Lz50IL70ppiKK0D3qC/MhJowKSiZsAxvldI+lzaOfmcOXeeFDEQzyNagex8XBOSbhG59c=
X-Received: by 2002:a05:6871:618c:b0:297:c04:9191 with SMTP id
 586e51a60fabf-2d091733057mr659862fac.3.1744180874156; Tue, 08 Apr 2025
 23:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
 <CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com> <5de2a378-77cf-4373-b3ae-faeebb931e2d@oss.qualcomm.com>
In-Reply-To: <5de2a378-77cf-4373-b3ae-faeebb931e2d@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 9 Apr 2025 08:41:02 +0200
X-Gm-Features: ATxdqUGhoGZIEx3Ym3PuzG5zEQQIskuGmF1s73EkPFrW4w3uoAZ-oqJKPmuDlxQ
Message-ID: <CAHUa44F-t29Hu0o3+0vFLjtrnA8ZGycPFcUTXEOmms9B=cZ6XA@mail.gmail.com>
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

Hi Amirreza,

On Wed, Apr 9, 2025 at 2:28=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi jens,
>
> On 4/8/2025 10:19 PM, Jens Wiklander wrote:
>
> Hi Amirreza,
>
> On Fri, Mar 28, 2025 at 3:48=E2=80=AFAM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> For drivers that can transfer data to the TEE without using shared
> memory from client, it is necessary to receive the user address
> directly, bypassing any processing by the TEE subsystem. Introduce
> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
> userspace buffers.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>  include/linux/tee_drv.h  |  6 ++++++
>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>  3 files changed, 55 insertions(+), 6 deletions(-)
>
> Is this patch needed now that the QCOMTEE driver supports shared
> memory? I prefer keeping changes to the ABI to a minimum.
>
> Cheers,
> Jens
>
> Unfortunately, this is still required. QTEE supports two types of data tr=
ansfer:
> (1) using UBUF and (2) memory objects. Even with memory object support, s=
ome APIs still
> expect to receive data using UBUF. For instance, to load a TA, QTEE offer=
s two interfaces:
> one where the TA binary is in UBUF and another where the TA binary is in =
a memory object.

Is this a limitation in the QTEE backend driver or on the secure side?
Can it be fixed? I don't ask for changes in the ABI to the secure
world since I assume you haven't made such changes while this patch
set has evolved.

Cheers,
Jens

>
> Best Regards,
> Amir
>
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 22cc7d624b0c..bc862a11d437 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *ctx,=
 struct tee_param *params,
>                         params[n].u.value.b =3D ip.b;
>                         params[n].u.value.c =3D ip.c;
>                         break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +                       params[n].u.ubuf.uaddr =3D u64_to_user_ptr(ip.a);
> +                       params[n].u.ubuf.size =3D ip.b;
> +
> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> +                                      params[n].u.ubuf.size))
> +                               return -EFAULT;
> +
> +                       break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param __u=
ser *uparams,
>                             put_user(p->u.value.c, &up->c))
>                                 return -EFAULT;
>                         break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
> +                               return -EFAULT;
> +                       break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>                         if (put_user((u64)p->u.memref.size, &up->b))
> @@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx,
>                         ip.b =3D p->u.value.b;
>                         ip.c =3D p->u.value.c;
>                         break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +                       ip.a =3D (u64)p->u.ubuf.uaddr;
> +                       ip.b =3D p->u.ubuf.size;
> +                       ip.c =3D 0;
> +                       break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *params=
, size_t num_params,
>                         p->u.value.b =3D ip.b;
>                         p->u.value.c =3D ip.c;
>                         break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +                       p->u.ubuf.uaddr =3D u64_to_user_ptr(ip.a);
> +                       p->u.ubuf.size =3D ip.b;
> +
> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> +                                      params[n].u.ubuf.size))
> +                               return -EFAULT;
> +
> +                       break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>                         /*
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index ce23fd42c5d4..d773f91c6bdd 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -82,6 +82,11 @@ struct tee_param_memref {
>         struct tee_shm *shm;
>  };
>
> +struct tee_param_ubuf {
> +       void * __user uaddr;
> +       size_t size;
> +};
> +
>  struct tee_param_value {
>         u64 a;
>         u64 b;
> @@ -92,6 +97,7 @@ struct tee_param {
>         u64 attr;
>         union {
>                 struct tee_param_memref memref;
> +               struct tee_param_ubuf ubuf;
>                 struct tee_param_value value;
>         } u;
>  };
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index d0430bee8292..3e9b1ec5dfde 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and outp=
ut */
>
> +/*
> + * These defines userspace buffer parameters.
> + */
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and outp=
ut */
> +
>  /*
>   * Mask for the type part of the attribute, leaves room for more types
>   */
> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>  /**
>   * struct tee_ioctl_param - parameter
>   * @attr: attributes
> - * @a: if a memref, offset into the shared memory object, else a value p=
arameter
> - * @b: if a memref, size of the buffer, else a value parameter
> + * @a: if a memref, offset into the shared memory object,
> + *     else if a ubuf, address of the user buffer,
> + *     else a value parameter
> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>   * @c: if a memref, shared memory identifier, else a value parameter
>   *
> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used=
 in
> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NO=
NE
> - * indicates that none of the members are used.
> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value =
is
> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYP=
E_UBUF_*
> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the m=
embers
> + * are used.
>   *
>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>   * identifier representing the shared memory object. A memref can refere=
nce
>
> --
> 2.34.1
>

