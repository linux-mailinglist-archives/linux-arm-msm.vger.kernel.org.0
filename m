Return-Path: <linux-arm-msm+bounces-80942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 870A0C45789
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 09:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 576EB188FBC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEF22F7442;
	Mon, 10 Nov 2025 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/j7MBQo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006CC2FCBF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762765072; cv=none; b=EJSx4p+mMnIoixuMeNdbehvMQ5mOj2aDfgJ/KS+kfCO0ddtRvdleW5CYo43QLtm+FDOJeZsnEPCeJQD7DFFFegjNQVnRfW42klMWG8g36Qe0cpC9A72Qi9ICpykv7sIYvcCjfsVx59Im7pFLVtpwPbvi5eo6Q3SE38lwIk9rN2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762765072; c=relaxed/simple;
	bh=5GHxvDWQcxyWdVLkU5N2dv4/sQx2GEcWltELKfBhSMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E+OFxLTnj7AK5C6CBP34FrIjl7M5MZpoQwtrTd3wKUpaPALbkYfQC89elJOpk6OjGAvz9+Sd39KdJpddC10wKfFtIHtAPPAL+SLlFNCOzQaNJxFL9j+OfJVBbFUNrO2hfAzGhKumostm6rKCuOy/EMnYAGY4tHcFSpbxAAfy+a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/j7MBQo; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3d18422565eso1791782fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762765070; x=1763369870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+DU4bC9oY8isR66wkaZVD1cgl7C2T/3TuAVsgHOOjs=;
        b=e/j7MBQorKMv3qhfZeOQYJho6w+nD4h2hGcT7LJ64J8+9Vg+Q51G6QBqasYV2cCoLq
         8FDDenKGD4F9Swc9Z6VrZ+NrTg3nlf8DC3pLMEJGle3g1sSF6INESYbuI3z/ivk0K6Zq
         VO1X3xfLKRM11XLURzU86C6NeH9/FvwwF94qgC1KO0swnuJzeQXDE/Y34ALETmvD5hGm
         s7t2j8VZmwpr03U0qvfkw3NH7kOWhT+x4bNhhMuBxdrGeHup6S2YmXlYOllpjEi9JGV+
         xql8kq7nIEQdOxUaZ1q9Yl8er0/OxZtxzf4TJmZ3zMpHahpKAe7KvrXu9YpRz20nNdju
         XG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765070; x=1763369870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I+DU4bC9oY8isR66wkaZVD1cgl7C2T/3TuAVsgHOOjs=;
        b=b5XyN+h4UOaBJFdPShxC4ARgui0B7z/QDU5WDDbLf+4p+4WiCMhegWqGob35Ww7gLb
         RtuuO2Cmq0wjyunQmNzFx7nWXdQsILH7fb+RZLjyCwDYnOxhOhZtAljgqNyT1xZge6ef
         TVL+8zjF23KFaLlZ/KCZy/uX4dJ0O3V1x3CMXvM2HXc0qCNhX9ZCAwDJZmiLL4KZmLsE
         XrmCu6wC3rCNMoIK6um/uWlYyzo092t69DIsNHpDr6FQy9dTGMJrJ4Z/5XufgkhzvCET
         inDlmF+ClOvU0o1t6/kQpyoiZrE/C3gnu1WcQfXwXO+UmCdl2DZkgO2LfhKaTD4v3lsy
         OHqw==
X-Forwarded-Encrypted: i=1; AJvYcCV9DKS4b18pKxBUMs3NbJvUjF57jCSh8BAtua7dx/+c8wddVsaTEeX4VzetqZgydxLMDgNTjKVl/KLXbzhq@vger.kernel.org
X-Gm-Message-State: AOJu0YyekK87Ycn5gXfwCST1t1RBF1KmFmxi+LvnT0ocnoiNckkEDZOT
	FTmJ4HbVDLNkQTQVpRm86UXREOMtk/ce1n5sNvETPWMWiChV9l46vG8iNjtfrEh1ykyrZ1IG1N3
	e0cpLmWb3EpZOXw0XBmnz4W17CuHcNexW8Jm9tDoszw==
X-Gm-Gg: ASbGncvewT1uJ0mmt2ICiMidB60bwjT7AylEvk5hGE3J9PRoTH40QgR0KqYYVSZWaPJ
	VpOKaUpOJiZzKHqsk9y9IJiG/CwSIYPM08MMdkw9I5d0pzauMBV2GBi3DMZXLGLwHKWeElBTVTf
	1MXKv0zZtoCtmaZgNURYGbqRehlilDnwTRIKuD1qPuLbDp7B77MPzz4YIzaePV9QLIIf+ktzroc
	7zG5df7jXXLXZdAB6FoMYHUBS0xiq5BzCQW2FHC/6D+hkJx4KkUnAMjrCQhDlDKLbyZ9jcaxSUb
	vCN/
X-Google-Smtp-Source: AGHT+IEvNSWQF8V50WXZvHvTh5vdg6c1kYKSH5fDM/Ta6RUD/FEZDy3lz08IzLZFRWp24NzfBrjEWgoxjvYDKgubZn0=
X-Received: by 2002:a05:6870:899a:b0:3d4:760f:544b with SMTP id
 586e51a60fabf-3e7c294ab31mr5259236fac.46.1762765070045; Mon, 10 Nov 2025
 00:57:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105-aheev-uninitialized-free-attr-tee-v1-1-2e1ee8483bc5@gmail.com>
In-Reply-To: <20251105-aheev-uninitialized-free-attr-tee-v1-1-2e1ee8483bc5@gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 10 Nov 2025 09:57:38 +0100
X-Gm-Features: AWmQ_bmbfwlbuD27u393tcu35e2C0scPDS3Uy66i-DK7aOy74DFrH1rStFwJq9A
Message-ID: <CAHUa44GYnZFaZQBNbV0=RSR7r61+ErYdQtEsRObNALz2CwT_Gg@mail.gmail.com>
Subject: Re: [PATCH] tee: fix uninitialized pointers with free attr
To: Ally Heev <allyheev@gmail.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 5, 2025 at 3:20=E2=80=AFPM Ally Heev <allyheev@gmail.com> wrote=
:
>
> Uninitialized pointers with `__free` attribute can cause undefined
> behaviour as the memory assigned(randomly) to the pointer is freed
> automatically when the pointer goes out of scope
>
> tee doesn't have any bugs related to this as of now, but
> it is better to initialize and assign pointers with `__free` attr
> in one statement to ensure proper scope-based cleanup
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
> Signed-off-by: Ally Heev <allyheev@gmail.com>
> ---
>  drivers/tee/qcomtee/call.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index ac134452cc9cfd384c28d41547545f2c5748d86c..8b7b4decddd8d1811dc0a7cc4=
6a4a4fbada45526 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -645,12 +645,13 @@ static void qcomtee_get_version(struct tee_device *=
teedev,
>  static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 i=
d,
>                                           u32 *version)
>  {
> -       struct qcomtee_object_invoke_ctx *oic __free(kfree);
>         struct qcomtee_object *client_env, *service;
>         struct qcomtee_arg u[3] =3D { 0 };
>         int result;
>
> -       oic =3D qcomtee_object_invoke_ctx_alloc(ctx);
> +       struct qcomtee_object_invoke_ctx *oic __free(kfree) =3D
> +               qcomtee_object_invoke_ctx_alloc(ctx);

Can we zero-initialize oic at its original location instead? Doing it
here looks messy.

Thanks,
Jens

> +
>         if (!oic)
>                 return;
>
>
> ---
> base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
> change-id: 20251105-aheev-uninitialized-free-attr-tee-0221e45ec5a2
>
> Best regards,
> --
> Ally Heev <allyheev@gmail.com>
>

