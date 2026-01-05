Return-Path: <linux-arm-msm+bounces-87406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5C0CF3095
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 11:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9EC973002971
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 10:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4343321DE;
	Mon,  5 Jan 2026 10:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFVA8cYw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873163321D6
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767609930; cv=none; b=aiESuTvgNQzrvJ/oAWpO1imcs8FetEJoXSEdCdDvwYQ3I4djkS+Mt7tfpu3O5hrn5SafA4HPSXBw7KQsBe2Icg2MgxpoyQ0q1fb0nD54/pCEx/bGyEc/6J5eLJh3zYU9fqWLet5vrGDMo6JSvBg2FDhgvBsXdqA3aLAahCY3kB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767609930; c=relaxed/simple;
	bh=eALf5K3bRKOxxqoXlfmdndxf/3mGZ1kyf0ofomZHvgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hanml60ccVDxLSYBMYHWmCpoqmf5hAnAzyiwYpsM2dJMMaUP6Qh6szvIJF8Y7DCByJjwBC8j23JSzaNYVKkELWP9ivP3TVQ/z+0sc5zm/e/Ynjp26QOknuaF4o6tUk03/T/jg1z0YZXk3F0Ne/DTttL4r55yvnbRlOHZ1dqrBAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFVA8cYw; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-459993ff4fcso2694965b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 02:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767609927; x=1768214727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbfo3VAG2V1COS2yJgiRNDBqK2UQf3Ldn6aq1VH3eSg=;
        b=jFVA8cYwuCEOLqqNpCepcu803VW3r/OKktjZ2aG2kCcWGbTzvx8kKx4s6vlkwYaaYY
         yN911gWkvEJzI+g9MiZ6VbMytB2pWd8wJDbnSdF8bHLWyoFk9OcCnS5D7OTJ/Y0nuI/A
         35S/V2pBg53L7bOehTP4Iok0NA9EmrMSxNDLWRedNxmy/zyvSAgm1zlLwDn4hw8WJZyZ
         CFo8WoVRfDHvegWmDN00qB6qx3QhOw+31b9SJF48e1I9uEszOj71NSn4Z9Hn2wvWfxGI
         Uz7Ef4ukJ6vGPUujvLnKtstre2S7yQV3uQJ5kHliK2aQYM2KYZfNYr5Omc95HVMW1re8
         jA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767609927; x=1768214727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tbfo3VAG2V1COS2yJgiRNDBqK2UQf3Ldn6aq1VH3eSg=;
        b=CptKTffPVXmd1PIVNsGqGKG6Xz76AhJqRxmIBVmd4JVYtu+ITACA5XJT/0ceeUydF5
         Vu9VIs6D+UHHAIrdk/OxK05Xo6kmeJUB8WcXl8R3TLwOz+CstIQ+pIkPi/mDLj02MwRt
         e0F/i7XMjIYP3ALG3L7z0IzrTTxuHdHLnShMkjiTa/PlLFI8orx1IuW2KL73t/LuD9qX
         gSEtliiHTfFvBEyES09P+Q5IccMM/mkZyf7b7Q697Y1hdAUgrXZp4msVxi/c7ERlbUeY
         uJsFujYRJufJ/NwutkSeN3wCArEhXixGTqoSXqr949Mql6rdXCpq1dpc3bomKowN6p/L
         TiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEvyvnTFfhFEGpCBmVBhCcF7KJ0km5HvgcLL8Gk4GPkein6yUqfWbV/Or27Q11oET17UIPw36te//0KPmp@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9WBIDT7W5ofYuTq/GiT2LoiHoCEUDEdNHGf6gYPDKjnTYfd6
	Gkn1fyEDsujyg3FfLwEC0gYLmKGGEn3jr/OL+yy/+/wtocDQz/Vxtqc/kOcJEvj5Og82s4QS9q0
	VAo/9FCtC3Ge2QeQ4OZmBmvXQVYhj9l9Vo/gzkS6vdA==
X-Gm-Gg: AY/fxX50M3WwSSJpni5po5bEft8z8qdk4igEcqAtIth/K3JbzT48zHGIwsu3rs+Z6mP
	I26MNIJ50Buj2OwYdTj0IBufs1P5y7NB07oKCqZ60m+BXDNsPE8bHA7c9qDFc6VzYAq9HHx1pc+
	FCsSyDcpSJEFW5efqH1lgvvyAHIUUrD99U96NgKc4rdK4k8H2f28a3FmrCScwflt7BZwOAOgLLG
	KZ11MAhDkI0jLPdsMIwu9TQGe9NF3EZ/LiAd5Pk7SuEMH0yYya6/w81tO57fPGrYpOWz3MZpZO8
	wXh22OCxjCapHR8BLtSJxSbQTA==
X-Google-Smtp-Source: AGHT+IGI/mK9Fh8eQRtLlCcrWEi6MJHRt6mLRzizqsEn77LrTLCYTSG41+6Vo4/l7cB7eDR+n1Mk0jNOLm/Oj50mVqA=
X-Received: by 2002:a05:6820:6fd7:b0:65d:1c:f39d with SMTP id
 006d021491bc7-65d0eb2e176mr15362351eaf.84.1767609927390; Mon, 05 Jan 2026
 02:45:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251208020844.5310-6-krzysztof.kozlowski@oss.qualcomm.com> <eca4b7b7-d4de-4209-9965-4a8ce027caee@oss.qualcomm.com>
In-Reply-To: <eca4b7b7-d4de-4209-9965-4a8ce027caee@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 Jan 2026 11:45:15 +0100
X-Gm-Features: AQt7F2rW1d_WIKXIzDR4oO66eb8z6IxBmTiY48uzKUg7VxhM2OMIYdglPf1A19A
Message-ID: <CAHUa44GbvEEsyqRyOkmvyEtHaAQjJ_oytHiYrjMN1jjEtKkhdQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] tee: qcomtee: user: Fix confusing cleanup.h syntax
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 11:50=E2=80=AFPM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
>
>
> On 12/8/2025 1:08 PM, Krzysztof Kozlowski wrote:
> > Initializing automatic __free variables to NULL without need (e.g.
> > branches with different allocations), followed by actual allocation is
> > in contrary to explicit coding rules guiding cleanup.h:
> >
> > "Given that the "__free(...) =3D NULL" pattern for variables defined at
> > the top of the function poses this potential interdependency problem th=
e
> > recommendation is to always define and assign variables in one statemen=
t
> > and not group variable definitions at the top of the function when
> > __free() is used."
> >
> > Code does not have a bug, but is less readable and uses discouraged
> > coding practice, so fix that by moving declaration to the place of
> > assignment.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.co=
m>
> > ---
> >  drivers/tee/qcomtee/user_obj.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_=
obj.c
> > index 0139905f2684..6aa3aefd67f0 100644
> > --- a/drivers/tee/qcomtee/user_obj.c
> > +++ b/drivers/tee/qcomtee/user_obj.c
> > @@ -228,10 +228,10 @@ static int qcomtee_user_object_dispatch(struct qc=
omtee_object_invoke_ctx *oic,
> >  {
> >       struct qcomtee_user_object *uo =3D to_qcomtee_user_object(object)=
;
> >       struct qcomtee_context_data *ctxdata =3D uo->ctx->data;
> > -     struct qcomtee_ureq *ureq __free(kfree) =3D NULL;
> >       int errno;
> >
> > -     ureq =3D kzalloc(sizeof(*ureq), GFP_KERNEL);
> > +     struct qcomtee_ureq *ureq __free(kfree) =3D kzalloc(sizeof(*ureq)=
,
> > +                                                       GFP_KERNEL);
> >       if (!ureq)
> >               return -ENOMEM;
> >
> > @@ -367,10 +367,10 @@ int qcomtee_user_param_to_object(struct qcomtee_o=
bject **object,
> >                                struct tee_param *param,
> >                                struct tee_context *ctx)
> >  {
> > -     struct qcomtee_user_object *user_object __free(kfree) =3D NULL;
> >       int err;
> >
> > -     user_object =3D kzalloc(sizeof(*user_object), GFP_KERNEL);
> > +     struct qcomtee_user_object *user_object __free(kfree) =3D
> > +             kzalloc(sizeof(*user_object), GFP_KERNEL);
> >       if (!user_object)
> >               return -ENOMEM;
> >
>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

I'm picking up this.

Thanks,
Jens

