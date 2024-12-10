Return-Path: <linux-arm-msm+bounces-41299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8EA9EB04E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 12:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 683B4188907B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 11:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C06C19E99A;
	Tue, 10 Dec 2024 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZSvp3cQA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A291A070E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733831912; cv=none; b=F7o7ZhUz1C49JphJqFKRKBg5+VVDz8JpjF4yOLY3Zl61M9eRif8Z9xX1ZJEws/kUZ4UQJtImeihd8ZWj7VHfz7jtgk5/K2X/Lk4sgoySCAutlPhDER5EJIirVeQueUE2D87l7pjQHFuZHAebig/12DTq4Hsvhm6fTrwhpyGeh2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733831912; c=relaxed/simple;
	bh=Fdi1cVjZeqCXMvX/6Zzp7qTMhWr93jYkG8DJvOgB93U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neTarz6cYkc2z5a+qCUMlTpRA/wS0AidotqHnX+yuXeqne7eT4yyBaArXt3GirSuw9JVm8CUITJPn4ngU+al8FETa3+QENioxhZBoJT5hynS6IvoHWrtI4mIIUHKQi9auvjQd4GHupF49G56STOh7tA4siv4JP1eA6MLkWLjdK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZSvp3cQA; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-71dfc9ac7caso715020a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 03:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733831907; x=1734436707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiqjhJvxNLoCWBTRo7PAkIKP0Uec1gxoFpZkWZBY3+I=;
        b=ZSvp3cQAibje2gBH7T0LHWsOuMcg43B34zyHisIx2rrrePrBTpKVX8+eHAG03kZeHW
         di3COcp/su43pzaiOtwO5id04D78buOuNtN+CU7h8gOlOpUV+JLlGf79BUApokWlFfsS
         4tPswVbB50xf6ZcJ0aaN9HaU0e2SDCOnIhIrfTErcoISpFzUVwLxOriqhZzFT8GCD2EM
         8PIfYaSJ76pgWUCflIPNshgyw47HVNIPPgf2zW1/XhqFXU0MrxdNAF1wQsLzkr9/bbrl
         kxYyrT9/LPpv6yVP5dOHprDcSkFmT/4buc2odAI289PtCFLiflTYZwMleTEuB7fZuLLZ
         jFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733831907; x=1734436707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiqjhJvxNLoCWBTRo7PAkIKP0Uec1gxoFpZkWZBY3+I=;
        b=H/MaedP/1tyJLXSUd43L6QZgKm5wqWbEVkT7lR2fn89mJQRQXjBh55TcPvV3fBmWzs
         WA51k8NTHt8wcrEsP4NLu2bhH7fTma+iebx6HEfQjVEMX4jMZIsSnzBMDH0Cd3YbYgMB
         53zaKG3YiK5eY4gIV7OWpRkxbBNlqJIGmHDiCg7z1mOmj1AX/pFbQPfcV+TD0nXZ+BGv
         WofzxR4d3UdXmgt4wCKVDpduJTE8tV1AK1dI5Vm42LjYlLnsQu3I05EXsRHyP5BNXI7u
         7fZklkzfdLfrtu2ucZxq3g1uPFvJNODougVAdWhy8FGe1py4VHuGF6/4JCiqXzEdd1+R
         SBZg==
X-Forwarded-Encrypted: i=1; AJvYcCXYIyxNPD1nRCfW/S0sbVbNSVA3MkA6nbT1j0pgWUe1raZ2xAlOfzYYbic/tpH6lmSm4c/jU6kdSJmXOmIV@vger.kernel.org
X-Gm-Message-State: AOJu0YzGGmN6ioqSCyhBbCIO67f721GWmCWFAp3YGV8ERCQPJJCGaW4U
	lofsHNkEaqV4ESiW27calkee3K1mtFT3AH50knXvw65KNmHVwz+2CfrpZcKVQjZDnH+dRpkm/1g
	Rckx4r3ZthKMNJLa1tHUOBErm+DmXN0wPmQKc6g==
X-Gm-Gg: ASbGncvRogqLI0OIwRgx2LOCZvdlsSkOXZF5djDGVaTZQApWukqCer4LCzKP04L9FRi
	Rs30mxPoT1OEFWImxTwBE68qIpwOrdtpiMyRo
X-Google-Smtp-Source: AGHT+IE8AgCEZQDVv7qbzzUpgiYOflcOftrwdqP/qVwZ8HhTg2E4mM+0+tmsbZCJdYV3gsAbNCIbJfM3CHni5jZmNkY=
X-Received: by 2002:a05:6830:6317:b0:71d:3e91:31b0 with SMTP id
 46e09a7af769-71dcf4b53ebmr14190198a34.4.1733831906427; Tue, 10 Dec 2024
 03:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-8-f502ef01e016@quicinc.com>
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-8-f502ef01e016@quicinc.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 10 Dec 2024 12:58:14 +0100
Message-ID: <CAHUa44GqyaouPquw+DE1ASRwVOBw5xDstcpaNpmLmQbXmp6CuQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] tee: add Qualcomm TEE driver
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amirreza,

On Tue, Dec 3, 2024 at 5:20=E2=80=AFAM Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
> Introduce basic support for invoking objects hosted in QTEE and userspace
> through the TEE subsystem.
>
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
>  drivers/tee/qcomtee/Makefile          |   2 +
>  drivers/tee/qcomtee/call.c            | 707 ++++++++++++++++++++++++++++=
++++++
>  drivers/tee/qcomtee/core.c            |   8 +
>  drivers/tee/qcomtee/qcomtee_private.h | 166 ++++++++
>  drivers/tee/qcomtee/user_obj.c        | 625 ++++++++++++++++++++++++++++=
++
>  include/uapi/linux/tee.h              |   1 +
>  6 files changed, 1509 insertions(+)
>
> diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
> index 108bc7fdabcb..6bf91481fde3 100644
> --- a/drivers/tee/qcomtee/Makefile
> +++ b/drivers/tee/qcomtee/Makefile
> @@ -1,7 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_QCOMTEE) +=3D qcomtee.o
>  qcomtee-objs +=3D async.o
> +qcomtee-objs +=3D call.o
>  qcomtee-objs +=3D core.o
>  qcomtee-objs +=3D primordial_obj.o
>  qcomtee-objs +=3D qcom_scm.o
>  qcomtee-objs +=3D release.o
> +qcomtee-objs +=3D user_obj.o
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> new file mode 100644
> index 000000000000..11bb31836808
> --- /dev/null
> +++ b/drivers/tee/qcomtee/call.c
> @@ -0,0 +1,707 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/tee.h>
> +#include <linux/mm.h>
> +#include <linux/platform_device.h>
> +#include <linux/firmware/qcom/qcom_tzmem.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +
> +#include "qcomtee_private.h"
> +
> +/**
> + * enum qcom_tee_object_host - Object host where it is managed.
> + * @QCOM_TEE_OBJECT_HOST_USER: objects in userspace.
> + * @QCOM_TEE_OBJECT_HOST_TEE: objects in QTEE.
> + *
> + * We refer to object hosted in userspace as 'Local Object' and objects =
hosted
> + * in QTEE as 'Remote Object'.
> + */
> +enum qcom_tee_object_host {
> +       QCOM_TEE_OBJECT_HOST_USER,      /* Object that is managed in user=
space. */
> +       QCOM_TEE_OBJECT_HOST_TEE,       /* Object that is managed in QTEE=
. */
> +};
> +
> +/* Read object ID host information. */
> +static enum qcom_tee_object_host qcom_tee_object_host(struct tee_param *=
param)
> +{
> +       if (param->u.objref.flags & QCOM_TEE_OBJREF_FLAG_USER)
> +               return QCOM_TEE_OBJECT_HOST_USER;
> +       return QCOM_TEE_OBJECT_HOST_TEE;
> +}
> +
> +/* qcom_tee_context_add_qtee_object() - Add a QTEE object to the context=
.
> + * @param: TEE parameter represents @object.
> + * @object: QTEE object.
> + * @ctx: context to add the object.
> + *
> + * It assumes @object is %QCOM_TEE_OBJECT_TYPE_TEE and caller has alread=
y issued
> + * qcom_tee_object_get() for @object.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_context_add_qtee_object(struct tee_param *param, struct qco=
m_tee_object *object,
> +                                    struct qcom_tee_context *ctx)
> +{
> +       int ret;
> +
> +       guard(mutex)(&ctx->lock);
> +       ret =3D idr_alloc(&ctx->qtee_objects_idr, object, 0, 0, GFP_KERNE=
L);
> +       if (ret < 0)
> +               return ret;
> +
> +       param->u.objref.id =3D ret;
> +       /* QTEE Object: !QCOM_TEE_OBJREF_FLAG_USER. */
> +       param->u.objref.flags =3D 0;
> +
> +       return 0;
> +}
> +
> +static int find_qtee_object(struct qcom_tee_object **object, unsigned lo=
ng id,
> +                           struct qcom_tee_context *ctx)
> +{
> +       int err =3D 0;
> +
> +       guard(rcu)();
> +       /* Object release is RCU protected. */
> +       *object =3D idr_find(&ctx->qtee_objects_idr, id);
> +       if (!qcom_tee_object_get(*object))
> +               err =3D -EINVAL;
> +
> +       return err;
> +}
> +
> +static void del_qtee_object(unsigned long id, struct qcom_tee_context *c=
tx)
> +{
> +       struct qcom_tee_object *object;
> +
> +       scoped_guard(mutex, &ctx->lock)
> +               object =3D idr_remove(&ctx->qtee_objects_idr, id);
> +       qcom_tee_object_put(object);
> +}
> +
> +/* Get the QTEE object added with qcom_tee_context_add_qtee_object(). */
> +int qcom_tee_context_find_qtee_object(struct qcom_tee_object **object, s=
truct tee_param *param,
> +                                     struct qcom_tee_context *ctx)
> +{
> +       /* 'qtee_objects_idr' stores QTEE objects only. */
> +       if (qcom_tee_object_host(param) !=3D QCOM_TEE_OBJECT_HOST_TEE)
> +               return -EINVAL;
> +       return find_qtee_object(object, param->u.objref.id, ctx);
> +}
> +
> +/**
> + * qcom_tee_context_del_qtee_object() - Delete a QTEE object from the co=
ntext.
> + * @param: TEE parameter represents @object.
> + * @ctx: context to delete the object.
> + *
> + * @param returned by qcom_tee_context_add_qtee_object().
> + */
> +void qcom_tee_context_del_qtee_object(struct tee_param *param, struct qc=
om_tee_context *ctx)
> +{
> +       /* 'qtee_objects_idr' stores QTEE objects only. */
> +       if (qcom_tee_object_host(param) =3D=3D QCOM_TEE_OBJECT_HOST_TEE)
> +               del_qtee_object(param->u.objref.id, ctx);
> +}
> +
> +/**
> + * qcom_tee_objref_to_arg() - Convert OBJREF parameter to QTEE argument =
in a context.
> + * @arg: QTEE argument.
> + * @param: TEE parameter.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It assumes @param is OBJREF.
> + * It does not set @arg.type; caller should initialize it to a correct
> + * &enum qcom_tee_arg_type value.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_objref_to_arg(struct qcom_tee_arg *arg, struct tee_param *p=
aram,
> +                          struct qcom_tee_context *ctx)
> +{
> +       struct qcom_tee_object *object;
> +       int err;
> +
> +       if (arg->type !=3D QCOM_TEE_ARG_TYPE_IO &&
> +           arg->type !=3D QCOM_TEE_ARG_TYPE_OO)
> +               return -EINVAL;
> +
> +       /* It is a NULL object?! */
> +       if (param->u.objref.id =3D=3D TEE_OBJREF_NULL) {
> +               arg->o =3D NULL_QCOM_TEE_OBJECT;
> +
> +               return 0;
> +       }
> +
> +       switch (qcom_tee_object_host(param)) {
> +       case QCOM_TEE_OBJECT_HOST_USER:
> +               err =3D qcom_tee_user_param_to_object(&object, param, ctx=
);
> +               if (err)
> +                       break;
> +
> +               /* Keep a copy for driver as QTEE may release it (e.g. us=
ing async msg). */
> +               qcom_tee_object_get(object);
> +
> +               break;
> +       case QCOM_TEE_OBJECT_HOST_TEE:
> +               err =3D qcom_tee_context_find_qtee_object(&object, param,=
 ctx);
> +
> +               break;
> +       }
> +
> +       arg->o =3D err ? NULL_QCOM_TEE_OBJECT : object;
> +
> +       return err;
> +}
> +
> +/**
> + * qcom_tee_objref_from_arg() - Convert QTEE argument to OBJREF param in=
 a context.
> + * @param: TEE parameter.
> + * @arg: QTEE argument.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It assumes @arg is of %QCOM_TEE_ARG_TYPE_IO or %QCOM_TEE_ARG_TYPE_OO.
> + * It does not set @param.attr; caller should initialize it to a correct=
 OBJREF type.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_objref_from_arg(struct tee_param *param, struct qcom_tee_ar=
g *arg,
> +                            struct qcom_tee_context *ctx)
> +{
> +       struct qcom_tee_object *object;
> +       int err;
> +
> +       /* param should be of OBJREF. */
> +       if (param->attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT &&
> +           param->attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT &&
> +           param->attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT)
> +               return -EINVAL;
> +
> +       object =3D arg->o;
> +
> +       switch (typeof_qcom_tee_object(object)) {
> +       case QCOM_TEE_OBJECT_TYPE_NULL:
> +               param->u.objref.id =3D TEE_OBJREF_NULL;
> +               err =3D 0;
> +
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
> +               err =3D qcom_tee_user_param_from_object(param, object, ct=
x);
> +
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_TEE:
> +               err =3D qcom_tee_context_add_qtee_object(param, object, c=
tx);
> +
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_ROOT:
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return err;
> +}
> +
> +/**
> + * qcom_tee_params_to_args() - Convert TEE parameters to QTEE arguments =
in a context.
> + * @u: QTEE arguments.
> + * @params: TEE parameters.
> + * @num_params: number of elements in the parameter array.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It assumes @u has at least @num_param + 1 entries and has been initia=
lized
> + * with %QCOM_TEE_ARG_TYPE_INV as &struct qcom_tee_arg.type.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +static int qcom_tee_params_to_args(struct qcom_tee_arg *u,
> +                                  struct tee_param *params, int num_para=
ms,
> +                                  struct qcom_tee_context *ctx)
> +{
> +       struct qcom_tee_object *object;
> +       int i;
> +
> +       for (i =3D 0; i < num_params; i++) {
> +               switch (params[i].attr) {
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT:
> +                       u[i].flags =3D QCOM_TEE_ARG_FLAGS_UADDR;
> +                       u[i].b.uaddr =3D params[i].u.membuf.uaddr;
> +                       u[i].b.size =3D params[i].u.membuf.size;
> +
> +                       if (params[i].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TY=
PE_MEMBUF_INPUT)
> +                               u[i].type =3D QCOM_TEE_ARG_TYPE_IB;
> +                       else /* TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT *=
/
> +                               u[i].type =3D QCOM_TEE_ARG_TYPE_OB;
> +
> +                       break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
> +                       u[i].type =3D QCOM_TEE_ARG_TYPE_IO;
> +                       if (qcom_tee_objref_to_arg(&u[i], &params[i], ctx=
))
> +                               goto out_failed;
> +
> +                       break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
> +                       u[i].type =3D QCOM_TEE_ARG_TYPE_OO;
> +                       u[i].o =3D NULL_QCOM_TEE_OBJECT;
> +                       break;
> +               default: /* Unsupported TEE parameters. */
> +                       goto out_failed;
> +               }
> +       }
> +
> +       return 0;
> +
> +out_failed:
> +
> +       /* On ERROR: */
> +       /* Put IO objects processed so far. */
> +       for (--i; i >=3D 0; i--) {
> +               if (u[i].type !=3D QCOM_TEE_ARG_TYPE_IO)
> +                       continue;
> +
> +               object =3D u[i].o;
> +               qcom_tee_user_object_set_notify(object, false);
> +               /* For callback object, we hold a reference for the drive=
r, put it. */
> +               if (typeof_qcom_tee_object(object) =3D=3D QCOM_TEE_OBJECT=
_TYPE_CB_OBJECT)
> +                       qcom_tee_object_put(object);
> +               /* Put QTEE copy of object. */
> +               qcom_tee_object_put(object);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +/**
> + * qcom_tee_params_from_args() - Convert QTEE arguments to TEE parameter=
s in a context.
> + * @params: TEE parameters.
> + * @u: QTEE arguments.
> + * @num_params: number of elements in the parameter array.
> + * @ctx: context in which the conversion should happen.
> + *
> + * @u should have been already initialized by qcom_tee_params_to_args().
> + * This also represents end of a QTEE invocation that started with qcom_=
tee_params_to_args()
> + * by releasing %QCOM_TEE_ARG_TYPE_IO objects.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +static int qcom_tee_params_from_args(struct tee_param *params,
> +                                    struct qcom_tee_arg *u, int num_para=
ms,
> +                                    struct qcom_tee_context *ctx)
> +{
> +       int i, np;
> +
> +       for (np =3D 0; u[np].type; np++) {
> +               enum qcom_tee_arg_type at =3D u[np].type;
> +
> +               if (at =3D=3D QCOM_TEE_ARG_TYPE_OB) {
> +                       /* TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT */
> +                       params[np].u.value.b =3D u[np].b.size;
> +
> +               } else if (at =3D=3D QCOM_TEE_ARG_TYPE_IO) {
> +                       /* IEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT */
> +                       qcom_tee_object_put(u[np].o);
> +
> +               } else if (at =3D=3D QCOM_TEE_ARG_TYPE_OO) {
> +                       /* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
> +                       if (qcom_tee_objref_from_arg(&params[np], &u[np],=
 ctx))
> +                               goto out_failed;
> +               }
> +       }
> +
> +       return 0;
> +
> +out_failed:
> +
> +       /* On ERROR: */
> +       /*  - Release params associated to QTEE objects in this context s=
o far. */
> +       for (i =3D 0; i < np; i++) {
> +               if (params[i].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJRE=
F_OUTPUT)
> +                       qcom_tee_context_del_qtee_object(&params[i], ctx)=
;
> +       }
> +       /*  - Release any IO and OO objects not processed so far. */
> +       while (u[i].type) {
> +               if (u[i].type =3D=3D QCOM_TEE_ARG_TYPE_OO ||
> +                   u[i].type =3D=3D QCOM_TEE_ARG_TYPE_IO)
> +                       qcom_tee_object_put(u[i++].o);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +/* TEE Device Ops. */
> +
> +static int qcom_tee_params_check(struct tee_param *params, int num_param=
s)
> +{
> +       int io =3D 0, oo =3D 0, ib =3D 0, ob =3D 0;
> +       int i;
> +
> +       /* QTEE accepts 64 arguments. */
> +       if (num_params > QCOM_TEE_ARGS_MAX)
> +               return -EINVAL;
> +
> +       /* Supported parameter types. */
> +       for (i =3D 0; i < num_params; i++) {
> +               switch (params[i].attr) {
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT:
> +                       ib++; break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT:
> +                       ob++; break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
> +                       io++; break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
> +                       oo++; break;
> +               default:
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       /*  QTEE accepts 16 arguments of each supported types. */
> +       if (io > QCOM_TEE_ARGS_PER_TYPE || oo > QCOM_TEE_ARGS_PER_TYPE ||
> +           ib > QCOM_TEE_ARGS_PER_TYPE || ob > QCOM_TEE_ARGS_PER_TYPE)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +/* Check if user issued a permitted operation on ROOT_QCOM_TEE_OBJECT fr=
om userspace. */
> +static int qcom_tee_root_object_check(u32 op, struct tee_param *params, =
int num_params)
> +{
> +       /* Some privileged operations recognized by QTEE. */
> +       if (op =3D=3D 4 || op =3D=3D 8 || op =3D=3D 9)
> +               return -EINVAL;
> +
> +       /* OP 5 is to register with QTEE by passing credential object as =
input OBJREF. */
> +       /* TEE_OBJREF_NULL as credential object represents a privileged c=
lient for QTEE,
> +        * only kernel can pass TEE_OBJREF_NULL.
> +        */
> +       if (op =3D=3D 5) {
> +               if (num_params !=3D 2)
> +                       return -EINVAL;
> +
> +               if (params[0].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJRE=
F_INPUT &&
> +                   params[1].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJRE=
F_OUTPUT) {
> +                       if (params[0].u.objref.id =3D=3D TEE_OBJREF_NULL)
> +                               return -EINVAL;
> +
> +               } else if (params[0].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYP=
E_OBJREF_OUTPUT &&
> +                          params[1].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYP=
E_OBJREF_INPUT) {
> +                       if (params[1].u.objref.id =3D=3D TEE_OBJREF_NULL)
> +                               return -EINVAL;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * qcom_tee_object_invoke() - Invoke a QTEE object.
> + * @tee_ctx: TEE context.
> + * @arg: ioctl arguments.
> + * @params: parameters for the object.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +static int qcom_tee_object_invoke(struct tee_context *tee_ctx,
> +                                 struct tee_ioctl_object_invoke_arg *arg=
,
> +                                 struct tee_param *params)
> +{
> +       struct qcom_tee_object_invoke_ctx *oic __free(kfree) =3D NULL;
> +       struct qcom_tee_context *ctx =3D tee_ctx->data;
> +       struct qcom_tee_arg *u __free(kfree) =3D NULL;
> +       struct qcom_tee_object *object;
> +       int i, ret, result;
> +
> +       if (qcom_tee_params_check(params, arg->num_params))
> +               return -EINVAL;
> +
> +       /* Handle OBJREF reserved operations. */
> +       if (arg->op =3D=3D QCOM_TEE_OBJREF_OP_RELEASE) {
> +               del_qtee_object(arg->object, ctx);
> +
> +               return 0;
> +       }
> +
> +       /* Unsupported reserved operation. */
> +       if (arg->op > QCOM_TEE_OBJREF_OP_MIN)
> +               return -EINVAL;
> +
> +       oic =3D kzalloc(sizeof(*oic), GFP_KERNEL);
> +       if (!oic)
> +               return -ENOMEM;
> +
> +       /* +1 for ending QCOM_TEE_ARG_TYPE_INV. */
> +       u =3D kzalloc(sizeof(*u) * (arg->num_params + 1), GFP_KERNEL);

Please use kcalloc().

> +       if (!u)
> +               return -ENOMEM;
> +
> +       if (arg->object =3D=3D TEE_OBJREF_NULL &&
> +           !qcom_tee_root_object_check(arg->op, params, arg->num_params)=
) {
> +               /* Use ROOT if NULL is invoked. */
> +               object =3D ROOT_QCOM_TEE_OBJECT;
> +       } else {
> +               /* Get object being invoked. */
> +               ret =3D find_qtee_object(&object, arg->object, ctx);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret =3D qcom_tee_params_to_args(u, params, arg->num_params, ctx);
> +       if (ret)
> +               goto out;
> +
> +       ret =3D qcom_tee_object_do_invoke(oic, object, arg->op, u, &resul=
t);
> +       if (!ret) {
> +               if (!result) {
> +                       /* Only parse QTEE response on SUCCESS. */
> +                       ret =3D qcom_tee_params_from_args(params, u, arg-=
>num_params, ctx);
> +               } else {
> +                       /* Put driver's IO objects copy; get in qcom_tee_=
params_to_args(). */
> +                       qcom_tee_arg_for_each_input_object(i, u)
> +                               qcom_tee_object_put(u[i++].o);
> +               }
> +       } else if (ret !=3D -EAGAIN && ret !=3D -ENODEV) {
> +               /* Unable to initiate a QTEE invocation; cleanup qcom_tee=
_params_to_args(). */
> +               qcom_tee_arg_for_each_input_object(i, u) {
> +                       qcom_tee_user_object_set_notify(u[i].o, false);
> +                       if (typeof_qcom_tee_object(u[i].o) =3D=3D QCOM_TE=
E_OBJECT_TYPE_CB_OBJECT)
> +                               qcom_tee_object_put(u[i].o);
> +                       qcom_tee_object_put(u[i].o);
> +               }
> +       }
> +
> +       arg->ret =3D result;
> +out:
> +       qcom_tee_object_put(object);
> +
> +       return ret;
> +}
> +
> +/**
> + * qcom_tee_supp_recv() - Pick a request for the supplicant.
> + * @tee_ctx: TEE context.
> + * @op: requested operation on object.
> + * @num_params: number of elements in the parameter array, updated with =
number used.
> + * @params: parameters for @op.
> + *
> + * The first parameter is a %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT meta =
parameter.
> + * On input, it provides a user buffer. This buffer is used for paramete=
rs of type
> + * %TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT in qcom_tee_cb_params_from_ar=
gs().
> + * On output, object id and request id are stored in the meta parameter.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +static int qcom_tee_supp_recv(struct tee_context *tee_ctx, u32 *op, u32 =
*num_params,
> +                             struct tee_param *params)
> +{
> +       struct qcom_tee_user_object_request_data data;
> +       struct qcom_tee_context *ctx =3D tee_ctx->data;
> +       void __user *uaddr;
> +       size_t ubuf_size;
> +       int i, ret;
> +
> +       if (!*num_params)
> +               return -EINVAL;
> +
> +       /* We expect the first parameter to be an INOUT + meta parameter.=
 */
> +       if (params->attr !=3D (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT | TE=
E_IOCTL_PARAM_ATTR_META))
> +               return -EINVAL;
> +
> +       /* Others parameters are none. */
> +       for (i =3D 1; i < *num_params; i++)
> +               if (params[i].attr)
> +                       return -EINVAL;
> +
> +       if (IS_ALIGNED(params->u.value.a, 8))
> +               return -EINVAL;
> +
> +       /* User buffer and size from meta parameter. */
> +       uaddr =3D u64_to_user_ptr(params->u.value.a);
> +       ubuf_size =3D params->u.value.b;
> +       /* Process TEE parameters. +/-1 to ignore meta parameter. */
> +       ret =3D qcom_tee_user_object_pop(ctx, params + 1, *num_params - 1=
, uaddr, ubuf_size, &data);
> +       if (ret)
> +               return ret;
> +
> +       params->u.value.a =3D data.object_id;
> +       params->u.value.b =3D data.id;
> +       params->u.value.c =3D 0;
> +       *op =3D data.op;
> +       *num_params =3D data.np + 1;
> +
> +       return 0;
> +}
> +
> +/**
> + * qcom_tee_supp_send() - Pick a request for the supplicant.
> + * @tee_ctx: TEE context.
> + * @ret: return value of the request.
> + * @num_params: number of elements in the parameter array.
> + * @params: returned parameters.
> + *
> + * The first parameter is a %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT meta =
parameter.
> + * It specifies the request id this response is belong to.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +static int qcom_tee_supp_send(struct tee_context *tee_ctx, u32 errno, u3=
2 num_params,
> +                             struct tee_param *params)
> +{
> +       struct qcom_tee_context *ctx =3D tee_ctx->data;
> +       int id;
> +
> +       if (!num_params)
> +               return -EINVAL;
> +
> +       /* We expect the first parameter to be an INPUT + meta parameter.=
 */
> +       if (params->attr !=3D (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT | TE=
E_IOCTL_PARAM_ATTR_META))
> +               return -EINVAL;
> +
> +       /* Get the req_id of response. */
> +       id =3D params->u.value.a;
> +
> +       /* Process TEE parameters. +/-1 to ignore meta parameter. */
> +       return qcom_tee_user_object_submit(ctx, params + 1, num_params - =
1, id, errno);
> +}
> +
> +static int qcom_tee_open(struct tee_context *tee_context)
> +{
> +       struct qcom_tee_context *ctx __free(kfree) =3D NULL;
> +       int err;
> +
> +       ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       err =3D init_srcu_struct(&ctx->req_srcu);
> +       if (err)
> +               return err;
> +
> +       ctx->tee_context =3D tee_context;
> +       idr_init(&ctx->qtee_objects_idr);
> +       idr_init(&ctx->reqs_idr);
> +       mutex_init(&ctx->lock);
> +       init_completion(&ctx->req_c);
> +       kref_init(&ctx->ref_cnt);
> +
> +       tee_context->data =3D no_free_ptr(ctx);
> +
> +       return 0;
> +}
> +
> +static void qcom_tee_release(struct tee_context *tee_context)
> +{
> +       struct qcom_tee_context *ctx =3D tee_context->data;
> +       struct qcom_tee_object *object;
> +       int id;
> +
> +       /* Process QUEUED or PROCESSING requests. */
> +       qcom_tee_requests_destroy(ctx);
> +
> +       /* Release QTEE objects. */
> +       idr_for_each_entry(&ctx->qtee_objects_idr, object, id)
> +               qcom_tee_object_put(object);
> +
> +       /* Put the context; wait for all user objects to go away. */
> +       kref_put(&ctx->ref_cnt, __qcom_tee_context_destroy);
> +}
> +
> +void __qcom_tee_context_destroy(struct kref *ref_cnt)
> +{
> +       struct qcom_tee_context *ctx =3D container_of(ref_cnt, struct qco=
m_tee_context, ref_cnt);
> +
> +       idr_destroy(&ctx->qtee_objects_idr);
> +       idr_destroy(&ctx->reqs_idr);
> +       cleanup_srcu_struct(&ctx->req_srcu);
> +       kfree(ctx);
> +}
> +
> +static void qcom_tee_get_version(struct tee_device *teedev, struct tee_i=
octl_version_data *vers)
> +{
> +       struct tee_ioctl_version_data v =3D {
> +               .impl_id =3D TEE_IMPL_ID_QTEE,
> +               .gen_caps =3D TEE_GEN_CAP_OBJREF,
> +       };
> +
> +       *vers =3D v;
> +}
> +
> +static const struct tee_driver_ops qcom_tee_ops =3D {
> +       .get_version =3D qcom_tee_get_version,
> +       .open =3D qcom_tee_open,
> +       .release =3D qcom_tee_release,
> +       .object_invoke_func =3D qcom_tee_object_invoke,
> +       .supp_recv =3D qcom_tee_supp_recv,
> +       .supp_send =3D qcom_tee_supp_send,
> +};
> +
> +static const struct tee_desc qcom_tee_desc =3D {
> +       .name =3D "qcom_tee",
> +       .ops =3D &qcom_tee_ops,
> +       .owner =3D THIS_MODULE,
> +};
> +
> +static int qcom_tee_probe(struct platform_device *pdev)
> +{
> +       struct tee_device *teedev;
> +       int err;
> +
> +       if (!qcom_scm_is_available())
> +               return -EPROBE_DEFER;
> +
> +       teedev =3D tee_device_alloc(&qcom_tee_desc, NULL, NULL, NULL);
> +       if (IS_ERR(teedev))
> +               return PTR_ERR(teedev);
> +
> +       err =3D tee_device_register(teedev);
> +       if (err)
> +               goto err_unreg_teedev;
> +
> +       platform_set_drvdata(pdev, teedev);
> +       return 0;
> +
> +err_unreg_teedev:
> +       tee_device_unregister(teedev);
> +
> +       return err;
> +}
> +
> +static void qcom_tee_remove(struct platform_device *pdev)
> +{
> +       struct tee_device *teedev =3D platform_get_drvdata(pdev);
> +
> +       /* Keep a copy, tee_device_unregister() sets it to NULL. */
teedev shouldn't be accessed after a call to tee_device_unregister()

> +       struct tee_shm_pool *pool =3D teedev->pool;
> +
> +       /* Wait for users to go away. */
> +       tee_device_unregister(teedev);
> +       tee_shm_pool_free(pool);
Why? You supplied NULL when tee_device_alloc() was called.

> +}
> +
> +static const struct of_device_id qcom_tee_dt_match[] =3D {
> +       { .compatible =3D "qcom,tee" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, qcom_tee_dt_match);
> +
> +static struct platform_driver qcom_tee_platform_driver =3D {
> +       .probe =3D qcom_tee_probe,
> +       .remove =3D qcom_tee_remove,
> +       .driver =3D {
> +               .name =3D "qcom_tee",
> +               .of_match_table =3D qcom_tee_dt_match,
> +       },
> +};
> +
> +int qcom_tee_driver_register(void)
> +{
> +       return platform_driver_register(&qcom_tee_platform_driver);
> +}
> +
> +void qcom_tee_driver_unregister(void)
> +{
> +       platform_driver_unregister(&qcom_tee_platform_driver);
> +}
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index 79f1181cf676..545857e117db 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -904,8 +904,14 @@ static int __init qcom_tee_object_invoke_init(void)
>         if (ret)
>                 goto err_kobject_put;
>
> +       ret =3D qcom_tee_driver_register();
> +       if (ret)
> +               goto err_remove_group;
> +
>         return 0;
>
> +err_remove_group:
> +       sysfs_remove_group(qcom_tee_object_invoke_kobj, &attr_group);
>  err_kobject_put:
>         /* Remove '/sys/firmware/qcom_tee'. */
>         kobject_put(qcom_tee_object_invoke_kobj);
> @@ -920,6 +926,8 @@ module_init(qcom_tee_object_invoke_init);
>
>  static void __exit qcom_tee_object_invoke_deinit(void)
>  {
> +       qcom_tee_driver_unregister();
> +
>         /* Wait for RELEASE operations for QTEE objects. */
>         qcom_tee_release_destroy();
>         qcom_tee_msg_buffers_destroy();
> diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/=
qcomtee_private.h
> index c718cd2d8463..15f358260ed7 100644
> --- a/drivers/tee/qcomtee/qcomtee_private.h
> +++ b/drivers/tee/qcomtee/qcomtee_private.h
> @@ -10,6 +10,14 @@
>  #include <linux/kobject.h>
>  #include <linux/tee_core.h>
>
> +/* Flags relating to object reference. */
> +#define QCOM_TEE_OBJREF_FLAG_USER 1
> +
> +/* Reserved OBJREF operations. */
> +/* These operations are not sent to QTEE and handled in driver. */
> +#define QCOM_TEE_OBJREF_OP_MIN USHRT_MAX
> +#define QCOM_TEE_OBJREF_OP_RELEASE (QCOM_TEE_OBJREF_OP_MIN + 1)
> +
>  struct qcom_tee_object *qcom_tee_idx_erase(u32 idx);
>  void qcom_tee_object_free(struct qcom_tee_object *object);
>
> @@ -44,9 +52,167 @@ int __qcom_tee_object_do_invoke(struct qcom_tee_objec=
t_invoke_ctx *oic,
>                                 struct qcom_tee_object *object, u32 op, s=
truct qcom_tee_arg *u,
>                                 int *result);
>
> +/**
> + * struct qcom_tee_context - Clients or supplicants context.
> + * @tee_context: TEE context.
> + * @qtee_objects_idr: QTEE objects in this context.
> + * @reqs_idr: Requests currently being processed.
> + * @lock: mutex for @reqs_idr and @qtee_objects_idr.
> + * @req_srcu: srcu for exclusive access to requests.
> + * @req_c: completion used when supplicant is waiting for requests.
> + * @released: state of this context.
> + * @ref_cnt: ref count.
> + */
> +struct qcom_tee_context {

Other drivers call their conterpart of this struct *_context_data.
Using the same pattern here makes it easier to recognize the struct in
the rest of the code.

> +       struct tee_context *tee_context;
> +
> +       struct idr qtee_objects_idr;
> +       struct idr reqs_idr;
> +       /* Synchronize access to @reqs_idr, @qtee_objects_idr and updatin=
g requests state. */
> +       struct mutex lock;
> +       struct srcu_struct req_srcu;

Why do you use this synchronization primitive? I don't know enough
about this primitive to tell if you use it for the right purpose so
perhaps you can help me understand which properties you need.

> +       struct completion req_c;
> +
> +       int released;
> +
> +       struct kref ref_cnt;

Why does this struct need a different lifetime than struct tee_context?

> +};
> +
> +void __qcom_tee_context_destroy(struct kref *ref_cnt);
> +
> +/* qcom_tee_context_add_qtee_object() - Add a QTEE object to the context=
.
> + * @param: TEE parameter represents @object.
> + * @object: QTEE object.
> + * @ctx: context to add the object.
> + *
> + * It assumes @object is %QCOM_TEE_OBJECT_TYPE_TEE and caller has alread=
y issued
> + * qcom_tee_object_get() for @object.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_context_add_qtee_object(struct tee_param *param, struct qco=
m_tee_object *object,
> +                                    struct qcom_tee_context *ctx);
> +
> +/* Get the QTEE object added with qcom_tee_context_add_qtee_object(). */
> +int qcom_tee_context_find_qtee_object(struct qcom_tee_object **object, s=
truct tee_param *param,
> +                                     struct qcom_tee_context *ctx);
> +
> +/**
> + * qcom_tee_context_del_qtee_object() - Delete a QTEE object from the co=
ntext.
> + * @param: TEE parameter represents @object.
> + * @ctx: context to delete the object.
> + *
> + * @param returned by qcom_tee_context_add_qtee_object().
> + */
> +void qcom_tee_context_del_qtee_object(struct tee_param *param, struct qc=
om_tee_context *ctx);
> +
> +/**
> + * qcom_tee_objref_to_arg() - Convert OBJREF parameter to QTEE argument =
in a context.
> + * @arg: QTEE argument.
> + * @param: TEE parameter.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It assumes @param is OBJREF.
> + * It does not set @arg.type; caller should initialize it to a correct
> + * &enum qcom_tee_arg_type value.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_objref_to_arg(struct qcom_tee_arg *arg, struct tee_param *p=
aram,
> +                          struct qcom_tee_context *ctx);
> +
> +/**
> + * qcom_tee_objref_from_arg() - Convert QTEE argument to OBJREF param in=
 a context.
> + * @param: TEE parameter.
> + * @arg: QTEE argument.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It assumes @arg is of %QCOM_TEE_ARG_TYPE_IO or %QCOM_TEE_ARG_TYPE_OO.
> + * It does not set @param.attr; caller should initialize it to a correct=
 OBJREF type.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_objref_from_arg(struct tee_param *param, struct qcom_tee_ar=
g *arg,
> +                            struct qcom_tee_context *ctx);
> +
> +int qcom_tee_driver_register(void);
> +void qcom_tee_driver_unregister(void);
> +
>  /* OBJECTS: */
>
>  /* (1) Primordial Object. */
>  extern struct qcom_tee_object qcom_tee_primordial_object;
>
> +/* (2) User Object API. */
> +
> +/* Is it a user object? */
> +int is_qcom_tee_user_object(struct qcom_tee_object *object);
> +
> +/* Set user object's 'notify on release' flag. */
> +void qcom_tee_user_object_set_notify(struct qcom_tee_object *object, boo=
l notify);
> +
> +/**
> + * qcom_tee_user_param_to_object() - Convert OBJREF parameter to &struct=
 qcom_tee_object.
> + * @object: object returned.
> + * @param: TEE parameter.
> + * @ctx: context in which the conversion should happen.
> + *
> + * @param is OBJREF with %TEE_IOCTL_OBJREF_USER flags.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_user_param_to_object(struct qcom_tee_object **object, struc=
t tee_param *param,
> +                                 struct qcom_tee_context *ctx);
> +
> +/* Reverse what qcom_tee_user_param_to_object() does. */
> +int qcom_tee_user_param_from_object(struct tee_param *param, struct qcom=
_tee_object *object,
> +                                   struct qcom_tee_context *ctx);
> +
> +struct qcom_tee_user_object_request_data {
> +       int id;                         /* Id assigned to the request. */
> +       u64 object_id;                  /* Object id being invoked by QTE=
E. */
> +       u32 op;                         /* Requested operation on object.=
 */
> +       int np;                         /* Number of parameters in the re=
quest.*/
> +};
> +
> +/**
> + * qcom_tee_user_object_pop() - Pop a request for a user object.
> + * @ctx: context to look for user object.
> + * @params: parameters for @op.
> + * @num_params: number of elements in the parameter array.
> + * @uaddr: user buffer for output MEMBUF parameters.
> + * @size: size of user buffer @uaddr.
> + * @data: information for the pop request.
> + *
> + * @params is filled along with @data for the picked request.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_user_object_pop(struct qcom_tee_context *ctx,
> +                            struct tee_param *params, int num_params,
> +                            void __user *uaddr, size_t size,
> +                            struct qcom_tee_user_object_request_data *da=
ta);
> +
> +/**
> + * qcom_tee_user_object_submit() - Submit a response for a user object.
> + * @ctx: context to look for user object.
> + * @params: returned parameters.
> + * @num_params: number of elements in the parameter array.
> + * @id: request id for the response.
> + * @errno: result of user object invocation.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_user_object_submit(struct qcom_tee_context *ctx,
> +                               struct tee_param *params, int num_params,=
 int id, int errno);
> +
> +/**
> + * qcom_tee_requests_destroy() - Destroy requests in a context.
> + * @ctx: context for which to destroy requests.
> + *
> + * After calling qcom_tee_requests_destroy(), @ctx can not be reused.
> + * It should be called on @ctx cleanup path.
> + */
> +void qcom_tee_requests_destroy(struct qcom_tee_context *ctx);
> +
>  #endif /* QCOM_TEE_PRIVATE_H */
> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_ob=
j.c
> new file mode 100644
> index 000000000000..4c671a3ae0de
> --- /dev/null
> +++ b/drivers/tee/qcomtee/user_obj.c
> @@ -0,0 +1,625 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include "qcomtee_private.h"
> +
> +/**
> + * DOC: User Objects aka Supplicants
> + *
> + * Any userspace process with access to the TEE device file can behave a=
s a supplicant
> + * by creating a user object. Any TEE parameter of type OBJREF with %QCO=
M_TEE_OBJREF_FLAG_USER
> + * flag set is considered as user object.
> + *
> + * A supplicant uses qcom_tee_user_object_pick() (i.e. TEE_IOC_SUPPL_REC=
V) to receive a
> + * QTEE user object request and qcom_tee_user_object_submit() (i.e. TEE_=
IOC_SUPPL_SEND)
> + * to submit a response. QTEE expects to receive the response, including=
 OB and OO in
> + * specific order in the message; parameters submitted with qcom_tee_use=
r_object_submit()
> + * should maintain this order.
> + */
> +
> +/**
> + * struct qcom_tee_user_object - User object.
> + * @object: &struct qcom_tee_object representing this user object.
> + * @ctx: context for which user object is defined.
> + * @object_id: object ID in @ctx.
> + * @nor: notify userspace if object is released.
> + *
> + * Any object managed in userspace is represented with this struct.
> + * If @nor is set, on release a notification message is send back to the=
 userspace.
> + */
> +struct qcom_tee_user_object {
> +       struct qcom_tee_object object;
> +       struct qcom_tee_context *ctx;
> +       u64 object_id;
> +
> +       bool nor;
> +};
> +
> +#define to_qcom_tee_user_object(o) container_of((o), struct qcom_tee_use=
r_object, object)
> +
> +static struct qcom_tee_object_operations qcom_tee_user_object_ops;
> +
> +/* Is it a user object? */
> +int is_qcom_tee_user_object(struct qcom_tee_object *object)
> +{
> +       return object !=3D NULL_QCOM_TEE_OBJECT &&
> +               typeof_qcom_tee_object(object) =3D=3D QCOM_TEE_OBJECT_TYP=
E_CB_OBJECT &&
> +               object->ops =3D=3D &qcom_tee_user_object_ops;
> +}
> +
> +/* Set user object's 'notify on release' flag. */
> +void qcom_tee_user_object_set_notify(struct qcom_tee_object *object, boo=
l notify)
> +{
> +       if (is_qcom_tee_user_object(object))
> +               WRITE_ONCE(to_qcom_tee_user_object(object)->nor, notify);

It looks like this depends on some synchronization. Please add a
comment on how this works.

> +}
> +
> +/**
> + * enum qcom_tee_req_state - Current state of request.
> + * @QCOM_TEE_REQ_QUEUED: Request is waiting for supplicant.
> + * @QCOM_TEE_REQ_PROCESSING: Request has been picked by the supplicant.
> + * @QCOM_TEE_REQ_PROCESSED: Response has been submitted for the request.
> + */
> +enum qcom_tee_req_state {
> +       QCOM_TEE_REQ_QUEUED =3D 1,
> +       QCOM_TEE_REQ_PROCESSING,
> +       QCOM_TEE_REQ_PROCESSED,
> +};
> +
> +/* User requests sent to supplicants. */
> +struct qcom_tee_user_req {
> +       enum qcom_tee_req_state state;
> +
> +       int req_id;                     /* Request ID. */
> +       u64 object_id;                  /* User object ID. */
> +       u32 op;                         /* Operation to perform on object=
. */
> +       struct qcom_tee_arg *args;      /* QTEE arguments for this operat=
ion. */
> +       int errno;                      /* Result of operation. */
> +
> +       struct completion c;            /* Completion for whoever wait fo=
r results. */
> +};
> +
> +/* Static placeholder for a request in PROCESSING state in qcom_tee_cont=
ext.reqs_idr.
> + * If the thread initiated the QTEE call using qcom_tee_object_invoke() =
dies, and supplicant
> + * is processing the request, we replace the entry in qcom_tee_context.r=
eqs_idr with
> + * __empty_ureq. So (1) the req_id remains busy and not reused, and (2) =
supplicant fails to
> + * submit response and does the necessary rollback.
> + */
> +static struct qcom_tee_user_req __empty_ureq =3D { .state =3D QCOM_TEE_R=
EQ_PROCESSING };
> +
> +/* Enqueue a user request for a context. */
> +static int qcom_tee_request_enqueue(struct qcom_tee_user_req *ureq, stru=
ct qcom_tee_context *ctx)
> +{
> +       int ret;
> +
> +       guard(mutex)(&ctx->lock);
> +       /* Supplicant is dying. */
> +       if (ctx->released)
> +               return -ENODEV;
> +
> +       ret =3D idr_alloc(&ctx->reqs_idr, ureq, 0, 0, GFP_KERNEL);
> +       if (ret < 0)
> +               return ret;
> +
> +       ureq->req_id =3D ret;
> +       ureq->state =3D QCOM_TEE_REQ_QUEUED;
> +
> +       return 0;
> +}
> +
> +/**
> + * qcom_tee_requests_destroy() - Destroy requests in a context.
> + * @ctx: context for which to destroy requests.
> + */
> +void qcom_tee_requests_destroy(struct qcom_tee_context *ctx)
> +{
> +       struct qcom_tee_user_req *ureq;
> +       int id;
> +
> +       guard(mutex)(&ctx->lock);
> +
> +       /* So qcom_tee_request_enqueue() refuses new requests. */
> +       ctx->released =3D 1;
> +       idr_for_each_entry(&ctx->reqs_idr, ureq, id) {
> +               if (ureq =3D=3D &__empty_ureq)
> +                       continue;
> +               /* ureq in QUEUED or PROCESSING state, terminate them. */
> +               if (ureq->op =3D=3D QCOM_TEE_OBJREF_OP_RELEASE) {
> +                       kfree(ureq);
> +               } else {
> +                       ureq->state =3D QCOM_TEE_REQ_PROCESSED;
> +                       ureq->errno =3D -ENODEV;
> +                       complete(&ureq->c);
> +               }
> +       }
> +}
> +
> +/**
> + * qcom_tee_supp_pop_entry() - Pop the next request in a context.

When you pop something you'd expect it to be removed also.

> + * @ctx: context from which to pop a request.
> + * @ubuf_size: size of available buffer for MEMBUF parameters.
> + * @num_params: number of entries for TEE parameter array.
> + *
> + * It does not remove the request from &qcom_tee_context.reqs_idr.
> + * It checks if @num_params is large enough to fit the next request argu=
ments.
> + * It checks if @ubuf_size is large enough to fit IB buffer arguments fr=
om QTEE.
> + * It updates request state to %QCOM_TEE_REQ_PROCESSING state.
> + *
> + * Return: On success return a request or NULL and ERR_PTR on failure.
> + */
> +static struct qcom_tee_user_req *qcom_tee_supp_pop_entry(struct qcom_tee=
_context *ctx,
> +                                                        size_t ubuf_size=
, int num_params)
> +{
> +       struct qcom_tee_user_req *ureq;
> +       struct qcom_tee_arg *u;
> +       int i, id;
> +
> +       guard(mutex)(&ctx->lock);
> +
> +       /* Find the a QUEUED request. */

Is it _a_ or _the_?

> +       idr_for_each_entry(&ctx->reqs_idr, ureq, id)
> +               if (ureq->state =3D=3D QCOM_TEE_REQ_QUEUED)
> +                       break;

Will this always result in a FIFO processing?

> +
> +       if (!ureq)
> +               return NULL;
> +
> +       u =3D ureq->args;
> +       /* (1) Is there enough TEE parameters? */
> +       if (num_params < qcom_tee_args_len(u))
> +               return ERR_PTR(-EINVAL);
> +
> +       /* (2) Is there enough space to pass input buffers? */
> +       qcom_tee_arg_for_each_input_buffer(i, u) {
> +               ubuf_size =3D size_sub(ubuf_size, u[i].b.size);
> +               if (ubuf_size =3D=3D SIZE_MAX)
> +                       return ERR_PTR(-EINVAL);
> +
> +               ubuf_size =3D round_down(ubuf_size, 8);
> +       }
> +
> +       /* Ready to process request 'QUEUED -> PROCESSING'. */
> +       ureq->state =3D QCOM_TEE_REQ_PROCESSING;
> +
> +       return ureq;
> +}
> +
> +/* User object dispatcher. */
> +static int qcom_tee_user_object_dispatch(struct qcom_tee_object_invoke_c=
tx *oic,
> +                                        struct qcom_tee_object *object, =
u32 op,
> +                                        struct qcom_tee_arg *args)
> +{
> +       struct qcom_tee_user_object *uo =3D to_qcom_tee_user_object(objec=
t);
> +       struct qcom_tee_user_req *ureq __free(kfree);
> +       struct qcom_tee_context *ctx =3D uo->ctx;
> +       int errno;
> +
> +       ureq =3D kzalloc(sizeof(*ureq), GFP_KERNEL);
> +       if (!ureq)
> +               return -ENOMEM;
> +
> +       init_completion(&ureq->c);
> +       ureq->object_id =3D uo->object_id;
> +       ureq->op =3D op;
> +       ureq->args =3D args;
> +
> +       /* Queue the request. */
> +       if (qcom_tee_request_enqueue(ureq, ctx))
> +               return -ENODEV;
> +
> +       /* Wakeup supplicant to process it. */
> +       complete(&ctx->req_c);
> +
> +       /* Wait for supplicant to process the request. */
> +       /* Supplicant is expected to process request in a timely manner. =
We wait as KILLABLE,

requests

> +        * in case supplicant and invoke thread both running from a same =
user process, otherwise

the same

> +        * the process stuck on fatal signal.

might get stuck on a fatal signal?

> +        */

Please combine into one comment.

> +       if (!wait_for_completion_state(&ureq->c, TASK_KILLABLE | TASK_FRE=
EZABLE)) {
> +               errno =3D ureq->errno;
> +               /* On SUCCESS, end_cb_notify frees the request. */
> +               if (!errno)
> +                       oic->data =3D no_free_ptr(ureq);
> +       } else {
> +               enum qcom_tee_req_state prev_state;
> +
> +               errno =3D -ENODEV;
> +
> +               scoped_guard(mutex, &ctx->lock) {
> +                       prev_state =3D ureq->state;
> +                       /* Replace ureq with '__empty_ureq' to keep req_i=
d reserved. */
> +                       if (prev_state =3D=3D QCOM_TEE_REQ_PROCESSING)
> +                               idr_replace(&ctx->reqs_idr, &__empty_ureq=
, ureq->req_id);
> +                       /* Remove ureq as supplicant has never seen this =
request. */
> +                       else if (prev_state =3D=3D QCOM_TEE_REQ_QUEUED)
> +                               idr_remove(&ctx->reqs_idr, ureq->req_id);
> +               }
> +
> +               /* Wait for exclusive access to ureq. */
> +               synchronize_srcu(&ctx->req_srcu);

I'm sorry, I don't follow.

Cheers,
Jens

> +
> +               /* Supplicant did some work for us, we should not discard=
 it. */
> +               if (prev_state =3D=3D QCOM_TEE_REQ_PROCESSED) {
> +                       errno =3D ureq->errno;
> +                       /* On SUCCESS, end_cb_notify frees the request. *=
/
> +                       if (!errno)
> +                               oic->data =3D no_free_ptr(ureq);
> +               }
> +       }
> +
> +       return errno;
> +}
> +
> +/* Called after submitting the callback response. */
> +static void qcom_tee_user_object_end_cb_notify(struct qcom_tee_object_in=
voke_ctx *oic,
> +                                              struct qcom_tee_object *un=
used_object, int err)
> +{
> +       struct qcom_tee_user_req *ureq =3D oic->data;
> +       struct qcom_tee_arg *u =3D ureq->args;
> +       struct qcom_tee_object *object;
> +       int i;
> +
> +       qcom_tee_arg_for_each_output_object(i, u) {
> +               object =3D u[i].o;
> +               /* If err, drop QTEE copy otherwise just drop driver's co=
py. */
> +               if (err && (typeof_qcom_tee_object(object) =3D=3D QCOM_TE=
E_OBJECT_TYPE_CB_OBJECT))
> +                       qcom_tee_object_put(object);
> +               qcom_tee_object_put(object);
> +       }
> +
> +       kfree(ureq);
> +}
> +
> +static void qcom_tee_user_object_release(struct qcom_tee_object *object)
> +{
> +       struct qcom_tee_user_object *uo =3D to_qcom_tee_user_object(objec=
t);
> +       struct qcom_tee_context *ctx =3D uo->ctx;
> +       struct qcom_tee_user_req *ureq;
> +
> +       static struct qcom_tee_arg args[] =3D { { .type =3D QCOM_TEE_ARG_=
TYPE_INV } };
> +
> +       if (READ_ONCE(uo->nor)) {
> +               ureq =3D kzalloc(sizeof(*ureq), GFP_KERNEL);
> +               if (ureq) {
> +                       ureq->object_id =3D uo->object_id;
> +                       ureq->op =3D QCOM_TEE_OBJREF_OP_RELEASE;
> +                       ureq->args =3D args;
> +
> +                       /* Queue the RELEASE request and wake supplicant =
to process it. */
> +                       qcom_tee_request_enqueue(ureq, ctx);
> +
> +                       complete(&ctx->req_c);
> +               } else {
> +                       pr_err("failed to notify user object (%s) release=
.\n",
> +                              qcom_tee_object_name(object));
> +               }
> +       }
> +
> +       /* Matching get is in qcom_tee_user_param_to_object(). */
> +       kref_put(&ctx->ref_cnt, __qcom_tee_context_destroy);
> +       kfree(uo);
> +}
> +
> +static struct qcom_tee_object_operations qcom_tee_user_object_ops =3D {
> +       .release =3D qcom_tee_user_object_release,
> +       .notify =3D qcom_tee_user_object_end_cb_notify,
> +       .dispatch =3D qcom_tee_user_object_dispatch,
> +};
> +
> +/**
> + * qcom_tee_user_param_to_object() - Convert OBJREF parameter to &struct=
 qcom_tee_object.
> + * @object: object returned.
> + * @param: TEE parameter.
> + * @ctx: context in which the conversion should happen.
> + *
> + * @param is OBJREF with %QCOM_TEE_OBJREF_FLAG_USER flags.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_user_param_to_object(struct qcom_tee_object **object, struc=
t tee_param *param,
> +                                 struct qcom_tee_context *ctx)
> +{
> +       struct qcom_tee_user_object *user_object __free(kfree) =3D NULL;
> +       struct qcom_tee_object *uo;
> +       int err;
> +
> +       user_object =3D kzalloc(sizeof(*user_object), GFP_KERNEL);
> +       if (!user_object)
> +               return -ENOMEM;
> +
> +       user_object->ctx =3D ctx;
> +       user_object->object_id =3D param->u.objref.id;
> +       /* By default, always notify userspace on release. */
> +       user_object->nor =3D true;
> +
> +       err =3D qcom_tee_object_user_init(&user_object->object, QCOM_TEE_=
OBJECT_TYPE_CB_OBJECT,
> +                                       &qcom_tee_user_object_ops, "uo-%l=
u", param->u.objref.id);
> +       if (err)
> +               return err;
> +
> +       uo =3D &no_free_ptr(user_object)->object;
> +       /* Keep context alive as user object is alive. */
> +       kref_get(&ctx->ref_cnt);
> +
> +       *object =3D uo;
> +
> +       return 0;
> +}
> +
> +/* Reverse what qcom_tee_user_param_to_object() does. */
> +int qcom_tee_user_param_from_object(struct tee_param *param, struct qcom=
_tee_object *object,
> +                                   struct qcom_tee_context *ctx)
> +{
> +       struct qcom_tee_user_object *uo;
> +
> +       if (!is_qcom_tee_user_object(object))
> +               return -EINVAL;
> +
> +       uo =3D to_qcom_tee_user_object(object);
> +       /* Sure if the object is in a same context as caller? */
> +       if (uo->ctx !=3D ctx)
> +               return -EINVAL;
> +
> +       param->u.objref.id =3D uo->object_id;
> +       param->u.objref.flags =3D QCOM_TEE_OBJREF_FLAG_USER;
> +
> +       /* User objects are valid in the context of userspace; drop the d=
river copy. */
> +       qcom_tee_object_put(object);
> +
> +       return 0;
> +}
> +
> +/**
> + * qcom_tee_cb_params_from_args() - Convert QTEE arguments to TEE parame=
ters in a context.
> + * @params: TEE parameters.
> + * @u: QTEE arguments.
> + * @num_params: number of elements in the parameter array.
> + * @ubuf_addr: user buffer for argument of type %QCOM_TEE_ARG_TYPE_IB.
> + * @ubuf_size: size of user buffer.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It expects @params to have enough entries for @u. Entries in @params =
are of
> + * %TEE_IOCTL_PARAM_ATTR_TYPE_NONE. On failure, it puts IO objects.
> + *
> + * Return: On success return number of input parameters processed or <0 =
on failure.
> + */
> +static int qcom_tee_cb_params_from_args(struct tee_param *params,
> +                                       struct qcom_tee_arg *u, int num_p=
arams,
> +                                       void __user *ubuf_addr, size_t ub=
uf_size,
> +                                       struct qcom_tee_context *ctx)
> +{
> +       int i, np =3D 0;
> +
> +       qcom_tee_arg_for_each(i, u) {
> +               enum qcom_tee_arg_type at =3D u[i].type;
> +
> +               if (at =3D=3D QCOM_TEE_ARG_TYPE_IB) {
> +                       params[np].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEM=
BUF_INPUT;
> +
> +                       /* Underflow already checked in qcom_tee_supp_pop=
_entry(). */
> +                       ubuf_size =3D round_down(ubuf_size - u[i].b.size,=
 8);
> +                       params[np].u.membuf.uaddr =3D (void * __user)(ubu=
f_addr + ubuf_size);
> +                       params[np].u.membuf.size =3D u[i].b.size;
> +                       if (copy_to_user(params[np].u.membuf.uaddr, u[i].=
b.addr, u[i].b.size))
> +                               goto out_failed;
> +
> +                       np++;
> +               } else if (at =3D=3D QCOM_TEE_ARG_TYPE_IO) {
> +                       params[np].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJ=
REF_INPUT;
> +                       if (qcom_tee_objref_from_arg(&params[np], &u[i], =
ctx))
> +                               goto out_failed;
> +
> +                       np++;
> +               }
> +       }
> +
> +       return np;
> +
> +out_failed:
> +
> +       /* On ERROR: */
> +       /*  - Release params associated to QTEE objects in this context s=
o far. */
> +       for (; np >=3D 0; np--) {
> +               if (params[np].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJR=
EF_INPUT)
> +                       qcom_tee_context_del_qtee_object(&params[np], ctx=
);
> +       }
> +       /*  - Release any IO objects not processed so far. */
> +       while (u[i].type) {
> +               if (u[i].type =3D=3D QCOM_TEE_ARG_TYPE_IO)
> +                       qcom_tee_object_put(u[i++].o);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +/**
> + * qcom_tee_cb_params_to_args() - Convert TEE parameters to QTEE argumen=
ts in a context.
> + * @u: QTEE arguments.
> + * @params: TEE parameters.
> + * @num_params: number of elements in the parameter array.
> + * @ctx: context in which the conversion should happen.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +static int qcom_tee_cb_params_to_args(struct qcom_tee_arg *u,
> +                                     struct tee_param *params, int num_p=
arams,
> +                                     struct qcom_tee_context *ctx)
> +{
> +       struct qcom_tee_object *object;
> +       int i, np =3D 0;
> +
> +       qcom_tee_arg_for_each(i, u) {
> +               enum qcom_tee_arg_type at =3D u[i].type;
> +
> +               if (at =3D=3D QCOM_TEE_ARG_TYPE_OB) {
> +                       if (params[np].attr !=3D TEE_IOCTL_PARAM_ATTR_TYP=
E_MEMBUF_OUTPUT ||
> +                           params[np].u.membuf.size > u[i].b.size)
> +                               goto out_failed;
> +
> +                       if (copy_from_user(u[i].b.addr, params[np].u.memb=
uf.uaddr, u[i].b.size))
> +                               goto out_failed;
> +
> +                       u[i].b.size =3D params[np].u.membuf.size;
> +
> +                       np++;
> +               } else if (at =3D=3D QCOM_TEE_ARG_TYPE_OO) {
> +                       if (params[np].attr =3D=3D TEE_IOCTL_PARAM_ATTR_T=
YPE_OBJREF_OUTPUT) {
> +                               if (qcom_tee_objref_to_arg(&u[i], &params=
[np], ctx))
> +                                       goto out_failed;
> +                       } else {
> +                               goto out_failed;
> +                       }
> +
> +                       np++;
> +               }
> +       }
> +
> +       return 0;
> +
> +out_failed:
> +
> +       /* On ERROR: */
> +       /* Put OO objects processed so far. */
> +       for (--i; i >=3D 0; i--) {
> +               if (u[i].type !=3D QCOM_TEE_ARG_TYPE_OO)
> +                       continue;
> +
> +               object =3D u[i].o;
> +               qcom_tee_user_object_set_notify(object, false);
> +               /* For callback object, we hold a reference for the drive=
r, put it. */
> +               if (typeof_qcom_tee_object(object) =3D=3D QCOM_TEE_OBJECT=
_TYPE_CB_OBJECT)
> +                       qcom_tee_object_put(object);
> +               /* Put QTEE copy of object. */
> +               qcom_tee_object_put(object);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +/**
> + * qcom_tee_user_object_pop() - Pop a request for a user object.
> + * @ctx: context to look for user object.
> + * @params: parameters for @op.
> + * @num_params: number of elements in the parameter array.
> + * @uaddr: user buffer for output MEMBUF parameters.
> + * @size: size of user buffer @uaddr.
> + * @data: information for the pop request.
> + *
> + * @params is filled along with @data for the picked request.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_user_object_pop(struct qcom_tee_context *ctx,
> +                            struct tee_param *params, int num_params,
> +                            void __user *uaddr, size_t size,
> +                            struct qcom_tee_user_object_request_data *da=
ta)
> +{
> +       struct qcom_tee_user_req *ureq;
> +       struct qcom_tee_arg *req_args;
> +       u64 req_object_id;
> +       u32 req_op;
> +       int req_id;
> +       int ret;
> +
> +       while (1) {
> +               scoped_guard(srcu, &ctx->req_srcu) {
> +                       /* Pop a request 'QUEUED -> PROCESSING'. */
> +                       ureq =3D qcom_tee_supp_pop_entry(ctx, size, num_p=
arams);
> +                       if (!ureq)
> +                               goto wait_for_request;
> +
> +                       /* On failure, issue with params, e.g. not enough=
 space in user buffer. */
> +                       if (IS_ERR(ureq))
> +                               return PTR_ERR(ureq);
> +
> +                       /* ''Prepare user request:'' */
> +                       req_id =3D ureq->req_id;
> +                       req_object_id =3D ureq->object_id;
> +                       req_op =3D ureq->op;
> +                       req_args =3D ureq->args;
> +                       ret =3D qcom_tee_cb_params_from_args(params, req_=
args,
> +                                                          num_params, ua=
ddr,
> +                                                          size, ctx);
> +               }
> +
> +               if (ret >=3D 0)
> +                       break;
> +
> +               /* On failure, issue with req_args, e.g. invalid object. =
*/
> +               scoped_guard(mutex, &ctx->lock) {
> +                       /* If (!=3D __empty_req) then 'PROCESSING -> PROC=
ESSED'. */
> +                       if (idr_remove(&ctx->reqs_idr, req_id) =3D=3D ure=
q) {
> +                               ureq->state =3D QCOM_TEE_REQ_PROCESSED;
> +                               ureq->errno =3D ret;
> +                               /* Send error to QTEE. */
> +                               complete(&ureq->c);
> +                       }
> +               }
> +
> +               /* Try next request. */
> +               continue;
> +
> +wait_for_request:
> +               /* Wait for a new QUEUED request. */
> +               if (wait_for_completion_interruptible(&ctx->req_c))
> +                       return -ERESTARTSYS;
> +       }
> +
> +       /* It is a RELEASE message; no one is waiting for result. */
> +       if (req_op =3D=3D QCOM_TEE_OBJREF_OP_RELEASE) {
> +               scoped_guard(mutex, &ctx->lock)
> +                       idr_remove(&ctx->reqs_idr, req_id);
> +               kfree(ureq);
> +       }
> +
> +       /* ''Pick a pending request:'' */
> +       data->id =3D req_id;
> +       data->object_id =3D req_object_id;
> +       data->op =3D req_op;
> +       data->np =3D ret;
> +
> +       return 0;
> +}
> +
> +/**
> + * qcom_tee_user_object_submit() - Submit a response for a user object.
> + * @ctx: context to look for user object.
> + * @params: returned parameters.
> + * @num_params: number of elements in the parameter array.
> + * @id: request id for the response.
> + * @errno: result of user object invocation.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcom_tee_user_object_submit(struct qcom_tee_context *ctx,
> +                               struct tee_param *params, int num_params,=
 int id, int errno)
> +{
> +       struct qcom_tee_user_req *ureq;
> +
> +       scoped_guard(srcu, &ctx->req_srcu) {
> +               scoped_guard(mutex, &ctx->lock) {
> +                       ureq =3D idr_remove(&ctx->reqs_idr, id);
> +                       /* Is id invalid, or no one is waiting on respons=
e. */
> +                       if (ureq =3D=3D &__empty_ureq || !ureq)
> +                               return -ENODEV;
> +
> +                       ureq->state =3D QCOM_TEE_REQ_PROCESSED;
> +               }
> +
> +               ureq->errno =3D errno;
> +               /* Process params only on SUCCESS. */
> +               if (!errno)
> +                       ureq->errno =3D qcom_tee_cb_params_to_args(ureq->=
args, params,
> +                                                                num_para=
ms, ctx);
> +
> +               errno =3D (!errno && ureq->errno) ? ureq->errno : 0;
> +               /* Send result to QTEE. */
> +               complete(&ureq->c);
> +       }
> +
> +       return errno;
> +}
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index 5d33a8009efb..00e599d1582d 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -59,6 +59,7 @@
>  #define TEE_IMPL_ID_OPTEE      1
>  #define TEE_IMPL_ID_AMDTEE     2
>  #define TEE_IMPL_ID_TSTEE      3
> +#define TEE_IMPL_ID_QTEE       4
>
>  /*
>   * OP-TEE specific capabilities
>
> --
> 2.34.1
>

