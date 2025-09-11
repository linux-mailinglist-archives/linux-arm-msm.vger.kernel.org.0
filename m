Return-Path: <linux-arm-msm+bounces-73070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8028FB52ABB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A46C486678
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 07:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDD82C026B;
	Thu, 11 Sep 2025 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C1dkI6Oo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686EC2BFC7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577397; cv=none; b=ig9rMZAVfysp8BIGEgpF3PDpq1hLZNdMW//bevin8CBSeMgV76DRwf3z7McsSqXJZq4OGGyArfvnQRRq+sHFRSneB4+flaZ4KcfxuTVrpnk92dDrxfz35vriFLi1JAfeR7Idbx1I45WGsif206revVc8DopHj92zn69JW09Zols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577397; c=relaxed/simple;
	bh=iQptQ7gTbmXxopSjxBxOANU0HqRVgiApdv76+PN6Eag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOYkTzEYntyBtDCdItz77PTN1OwbuLJI6EbFwXTiAf3PEGnxh5HB5Wb/BZ3LegkaiyHpSOvQZKd+r8jOPFX9/f5nonPqAK4zLUfe2w3eFRgh5v8kRiA0drYTwxPpC+wdsq8E43JvztVOSVU/3WHcRSlCGe8Frcpqii9BaH3eFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C1dkI6Oo; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-746d3b0d926so171348a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 00:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757577394; x=1758182194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcHgyDkcspweVIk7kRhliSymO4E+l9imWizmqVG+IwQ=;
        b=C1dkI6OoBl84RGEkPIel8mXic7XqikfRUDV7psj/UWtUjQYMj4vonX53DwUYqjiMsT
         fAR3QR1UKz4Txn7pTSSQ1zSwljsLSGqIE2UQe1ebOdFMU/EmeUo2KasMEPJ+8hrn7Waa
         /cDvCmmvjI8NnK+j+0iQwxeido3CA6/o/7tpiodBIVsIhA/2q3e0aqcUguenA59OuwPz
         147MQNleCaTsFIZFd9AWHX3m7fOBy+P46SewE3hwLGH++x4mViBEL6DSh9KipnYyalyL
         sCSkUS8ctdj4xxU6mNnNtUPtT9ys9B5Fy2fniCKDjQXT3wDpJCbTnjtty5dg0g6JgpqK
         jjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577394; x=1758182194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcHgyDkcspweVIk7kRhliSymO4E+l9imWizmqVG+IwQ=;
        b=li0zWXoHty6gJt50rXy0iEKE0P3YCZBQlVphfYhcPZ45+c7mbtPK6VPr4BRLo5s1F7
         /5C+YHH29vR29pcc/UjMRzr7vdD+GnIqjEtOv4il0jqNMoyBV7sxqOwhrPPFw1QEcHIE
         dW7DGLec8tUvBrse2rnuo4YXJ4SLcTUCMfN4+pNiHORKTrCTR55uUoMyQFTe5LFThyHO
         CTI3tjTjfmKZRF5bxUovYjK6B46qfdE5uq+mt4xFNY2XeEe9ejMewm7a5omdRf8lYBWs
         2GQFVwTaZO5iwk9qJaAakAJiSveg53xBn7eEf2d5VnDGxmg5DWrE68kicFEKm27iCbct
         Q3MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNSeJkwI/CETU9LRBtTc2+4z6yYC09Kx4osSVsc4ymmHnWeLE+xkHtOaN5UO001bFZPZtSuQrez29zEN9w@vger.kernel.org
X-Gm-Message-State: AOJu0YzSy/GJv6xSeFjSHnMAMHtcW9qbKbMRqWLaHQZwf4NTgamsRZm5
	GbqyCCqSclJw1GE+lbD/VpP53YoSnlj4HCk+98QtRvL+ZYGCPCi12PFMEHPmzyNqMZ008CrS75K
	kL3doigGDt8VqCGHe0kheNnkSr4sLCmwyAqYJkoCJPg==
X-Gm-Gg: ASbGncsEh40fR2qCD2LDlAfetROC9Cp+6nokC4RiiH+XN2nxeR35BphQ/iHPSrepKeg
	krgpqacGY8GKxaPR8Uyt8aU0e9e/qEzMVsoJn0Q1C3iPr/ZQujZkb3z8YzyY4rpbn4Reku0SHnU
	9jGvqvcqHMlcXga/3U5NJPbJs/bGXKIRq+iDOdrirxJpTIgvCgwbc3Rrrl/6m6Up45bROr4jHbF
	VK1Ofd5bN8A8/n+qDo=
X-Google-Smtp-Source: AGHT+IG9ZMBIi6nBb96Zia9gSrtbi78A+YjqGi7eJdd43h+fxHz0Dsu/RXvlzn6cV1ytlcXB923nl0QOCRHh3jcErhM=
X-Received: by 2002:a05:6830:67c5:b0:746:d4d3:c8b3 with SMTP id
 46e09a7af769-74c720f972bmr10157224a34.15.1757577394426; Thu, 11 Sep 2025
 00:56:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
 <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-5-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-5-520e867b3d74@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 11 Sep 2025 09:56:23 +0200
X-Gm-Features: Ac12FXyIP0WtPINFQV_xAL4fJ4Nl0DDdmiM8KSkVr4BQuuRBN2IjnhZ18XWv8gI
Message-ID: <CAHUa44EsGNuYzjZo_kBJfa6O6u0o14tfDNo2fhSeo+g0BpwX7Q@mail.gmail.com>
Subject: Re: [PATCH v11 05/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Apurupa Pattapu <quic_apurupa@quicinc.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amir,

On Thu, Sep 11, 2025 at 5:41=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> For drivers that can transfer data to the TEE without using shared
> memory from client, it is necessary to receive the user address
> directly, bypassing any processing by the TEE subsystem. Introduce
> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
> userspace buffers.
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>  include/linux/tee_drv.h  |  6 ++++++
>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>  3 files changed, 55 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index f8534a00c56c..bb2e3a6c23a3 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -457,6 +457,17 @@ static int params_from_user(struct tee_context *ctx,=
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
> @@ -490,6 +501,11 @@ static int params_to_user(struct tee_ioctl_param __u=
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
> @@ -690,6 +706,13 @@ static int params_to_supp(struct tee_context *ctx,
>                         ip.b =3D p->u.value.b;
>                         ip.c =3D p->u.value.c;
>                         break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +                       ip.a =3D (__force u64)p->u.ubuf.uaddr;

There's a warning on arm32:
drivers/tee/tee_core.c: In function 'params_to_supp':
drivers/tee/tee_core.c:821:32: warning: cast from pointer to integer
of different size [-Wpointer-to-int-cast]
  821 |                         ip.a =3D (__force u64)p->u.ubuf.uaddr;

I think you need to cast to unsigned long instead.

Cheers,
Jens


> +                       ip.b =3D p->u.ubuf.size;
> +                       ip.c =3D 0;
> +                       break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -792,6 +815,16 @@ static int params_from_supp(struct tee_param *params=
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
> index 824f1251de60..7915e8869cbd 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -82,6 +82,11 @@ struct tee_param_memref {
>         struct tee_shm *shm;
>  };
>
> +struct tee_param_ubuf {
> +       void __user *uaddr;
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
> index d843cf980d98..0e3b735dcfca 100644
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

