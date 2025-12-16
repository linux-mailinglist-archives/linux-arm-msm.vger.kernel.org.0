Return-Path: <linux-arm-msm+bounces-85314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5004CC151A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 08:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1812630341E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 07:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E98FBF6;
	Tue, 16 Dec 2025 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lpmpf7Lr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4522749FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870438; cv=none; b=VT+XS6+Cy3uL3OZKHvvYYS4P7tIngAPGriNPXAr78wrv6YUzythyW95fXxuSCSC6zX+eSFxRDurrhGERjG80k2DM8a8huXJ+f2RZuBNltAJ/DMzys8Uq5HIskhhXrn0ktoSZ+vBH7a4Kb9SUGsmdZtxbfO0jO5HHSU7rTPLb0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870438; c=relaxed/simple;
	bh=afJGBzDRYXPLKRLUi36rv1TJEw66G7nq8Qwr10P9a+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxajBWxoXlo8NtQQAwOU2M6EChX2QVpp7XMQD3IifMPieNlucRXCkIMMVSGqK/k5t1OXwVNQfy03FEgTzrD4u55gcd2AsYhMkhXVdr15dagSnHP3+UQEaVeSwjMCRegNCsudLmoYFX96odSrUyKPyjp0tolF/W4Ym+B83wxzLr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lpmpf7Lr; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c6e9538945so2888521a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 23:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765870435; x=1766475235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJxuVx1hE8QwPo+5lZ9vSSExDNzQxar/zw9l2S0dxlw=;
        b=lpmpf7Lr8pLDHL00MvcoPN+7wg62wLL4F3NvJyPqt1HeOsgHx/SilTdytObjJdwwDJ
         u425rCSa33RV1MGK3uFk53OgHitkDmHTL1cbyj/f4OOibYuFxp5Hh8hRG9HXptl/UEHB
         estLT/9VFYqN4ULiDGkKHGREVJ0qMOaCzRi7HnQNuc76dph9zch1XgBSLpHcWzrbYrD4
         NRkiIqyq0Uv6v5sOMJ38eSOp/DxLXLWeBObb7YhNBt/606fsdXkvY+KvlIEWSFtLJYRw
         iiCnEf6qd9vb/MXuKAYVRHy8mPdSHfoJUDywnyaTchFZDi1rKgG/d6FKnmUXUyI3j0yh
         fTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765870435; x=1766475235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pJxuVx1hE8QwPo+5lZ9vSSExDNzQxar/zw9l2S0dxlw=;
        b=nsSLKMoB04TsElDkdXTiXXSkgblwImpRgOkNWbGredd0DL8Ix5D9eIOfMg05zRl6mZ
         5Dqqm6Ut+RWjV+8jRGAdYO+PNHkrHKQyW3iI/OzGSNW1BIMaBcp2NV1kd8LctVHHsEI9
         Y8zRLlfhaV+kbGWB+fbfPiRxWYiHhw3odUr1hCmXtzWWSdcJuz6CSgXV5LIU7H5Xe5jZ
         8GikB4Prwv5QIlMC0T2990Mze+bpBHnYTJfIAeV7GpfVdgUGGcLbL320OLUVjajxX6Ny
         XzKv2Gtx7ovaScQCeX88+AXJ4kuSpY9TBIT+end7etVjwPfMl08O+e8G5YolrLB6d2fK
         sIag==
X-Forwarded-Encrypted: i=1; AJvYcCVdwRoyrvNmIvYMq9PTduwWmLWoFeaaS2jqKc7Ra9B1+98Xi3O1KCLzH+5sx28TzNBg7DXar3/7izLrvSBk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzek5WKZxnHlYPpBAN6kOKURp8TOsvvY2tIf5+bgFitIgZF6wd+
	WPhQEWDv/4Zye4Slfjp2Ch7LFSi0DjcsDWUlr3swPIPeyda3bjs+Tr9KIuZK4oxdF8Bmv3kdBQB
	NSXaHMO8Wi9gLhxLP8DyGPYk3mL18io2ekLfzeoij06Y+XzFLfFwiJFo=
X-Gm-Gg: AY/fxX5/ZZzLJ3ZdK33ul4hcu6e3Ul4r1RnO4thvmd2RWUEgVPYedtei72V4xYV1YJe
	9Fxn+DOyy98zhm/ijUKdA8CO47zyasGOJ9I2Y7FaWFerSwigF4+i79cVapUowzpC2vMXy0ieKYb
	UKbX8AQlAlhNUtyKSSrBeapST0VIUfAICUsrEHTAbmU+DWvMCqfICbKm6Wxeh74fLnP8w8uk43x
	yCBGinNxpopkigY3A0iJwC4EqIJZ7UccMLnPTmN/6CzcJrJE1bn498wRovsCQ1/+UHMMpXM0Bye
	8wDq3uUO9x1IVSrMYi8NlNQ9NA==
X-Google-Smtp-Source: AGHT+IFgcI1iXYmQOJMbCoMzO4TuZILfDefDSjHP+dHpTw0q1q+63iQUVOEFLyAayV4+4wtBrXEibqfLYLgVtUxJtl0=
X-Received: by 2002:a05:6820:2114:b0:65b:328b:4b9c with SMTP id
 006d021491bc7-65b451b2947mr5857330eaf.18.1765870434698; Mon, 15 Dec 2025
 23:33:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
 <aTtn-x0hh18V7n7J@sumit-X1> <b29c97cd-cade-40ef-8e6d-d164b1d16059@oss.qualcomm.com>
 <aTtyR5J3AqXoE7to@sumit-X1> <7b074ee0-4f10-4fba-9680-3d87dcf766c1@oss.qualcomm.com>
In-Reply-To: <7b074ee0-4f10-4fba-9680-3d87dcf766c1@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 16 Dec 2025 08:33:43 +0100
X-Gm-Features: AQt7F2pwugYqW3nJWhjtHv1ppCx-uDAzlDiP3MdQeHwnJLNKjL7ZHy9bFIyp3LI
Message-ID: <CAHUa44EO8HYA=KgouSt902RJ63H-Vz24nOaaj7PATVT0n2fkeA@mail.gmail.com>
Subject: Re: [PATCH 1/3] tee: qcomtee: call: Fix confusing cleanup.h syntax
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 15, 2025 at 9:30=E2=80=AFPM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 12/12/2025 12:39 PM, Sumit Garg wrote:
> > On Fri, Dec 12, 2025 at 02:07:40AM +0100, Krzysztof Kozlowski wrote:
> >> On 12/12/2025 01:55, Sumit Garg wrote:
> >>> On Mon, Dec 08, 2025 at 03:08:45AM +0100, Krzysztof Kozlowski wrote:
> >>>> Initializing automatic __free variables to NULL without need (e.g.
> >>>> branches with different allocations), followed by actual allocation =
is
> >>>> in contrary to explicit coding rules guiding cleanup.h:
> >>>>
> >>>> "Given that the "__free(...) =3D NULL" pattern for variables defined=
 at
> >>>> the top of the function poses this potential interdependency problem=
 the
> >>>> recommendation is to always define and assign variables in one state=
ment
> >>>> and not group variable definitions at the top of the function when
> >>>> __free() is used."
> >>>>
> >>>> Code does not have a bug, but is less readable and uses discouraged
> >>>> coding practice, so fix that by moving declaration to the place of
> >>>> assignment.
> >>>
> >>> Okay I see but..
> >>>
> >>>>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm=
.com>
> >>>> ---
> >>>>  drivers/tee/qcomtee/call.c | 17 ++++++++---------
> >>>>  1 file changed, 8 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> >>>> index 65f9140d4e1f..8f8830f0df26 100644
> >>>> --- a/drivers/tee/qcomtee/call.c
> >>>> +++ b/drivers/tee/qcomtee/call.c
> >>>> @@ -395,9 +395,7 @@ static int qcomtee_object_invoke(struct tee_cont=
ext *ctx,
> >>>>                             struct tee_ioctl_object_invoke_arg *arg,
> >>>>                             struct tee_param *params)
> >>>>  {
> >>>> -  struct qcomtee_object_invoke_ctx *oic __free(kfree) =3D NULL;
> >>>>    struct qcomtee_context_data *ctxdata =3D ctx->data;
> >>>> -  struct qcomtee_arg *u __free(kfree) =3D NULL;
> >>>>    struct qcomtee_object *object;
> >>>>    int i, ret, result;
> >>>>
> >>>> @@ -412,12 +410,14 @@ static int qcomtee_object_invoke(struct tee_co=
ntext *ctx,
> >>>>    }
> >>>>
> >>>>    /* Otherwise, invoke a QTEE object: */
> >>>> -  oic =3D qcomtee_object_invoke_ctx_alloc(ctx);
> >>>> +  struct qcomtee_object_invoke_ctx *oic __free(kfree) =3D
> >>>> +          qcomtee_object_invoke_ctx_alloc(ctx);
> >>>>    if (!oic)
> >>>>            return -ENOMEM;
> >>>>
> >>>>    /* +1 for ending QCOMTEE_ARG_TYPE_INV. */
> >>>> -  u =3D kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
> >>>> +  struct qcomtee_arg *u __free(kfree) =3D kcalloc(arg->num_params +=
 1, sizeof(*u),
> >>>> +                                                GFP_KERNEL);
> >>>
> >>> ..this makes the code less readable with variable declarations floati=
ng
> >>
> >> Which is intentional.
> >>
> >>> within the function. I would rather favor to not use the cleanup.h co=
nstruct
> >>> but use explicit kfree() invocations instead like it's done in all ot=
her
> >>> allocations in the TEE subsystem.
> >>
> >> Sure, fair. I just don't get why introducing cleanup.h without actuall=
y
> >> accepting its explicitly documented style...
> >>
> >
> > TBH, it is likely overlooked during review of the QTEE driver. Having a
> > builtin warning for the undesired syntax would help the reviewers here.
> >
> > -Sumit
>
> While the style may seem unusual -- as stated in cleanup.h, using cleanup=
 helpers
> makes the code more readable overall compared to relying on multiple goto=
 statements.
> Also, it=E2=80=99s not just about the "__free(...) =3D NULL" use cases --=
 there are locks
> involved as well. Switching to direct free() would require reverting thos=
e locks,
> since mixing cleanup helpers with manual cleanup is not acceptable.
>
> If this behavior is explicitly documented in cleanup.h, there is no reaso=
n not
> to use it as intended. I also support Krzysztof=E2=80=99s suggestion.

It looks quite ugly, and it can't be mixed with the usual goto
cleanups (I suspect some care is needed with switch cases too), so we
must be careful where we use it. It's not obvious that this pattern
should be used in every function. However, where it's used, it should,
of course, be used correctly.

Thanks for the fixes, Krzysztof.

Amir, if you're happy with the fixes, can you give your R-B for each of the=
m?

Thanks,
Jens

