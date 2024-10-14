Return-Path: <linux-arm-msm+bounces-34252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAE199C322
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 607631F2630C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 08:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A73156F44;
	Mon, 14 Oct 2024 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fy3lN9uL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCDF156F3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 08:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894303; cv=none; b=fchPJINQS42iQ3EY0/G3Lk8ZFpZd7MjjmF7FXmM48fQ6jaCUvFrEOnDVX5ppbEjWUpljZDNbaiM/U8AMjNTScVXIo8+Vjz6XiZ+7/2jrd66NAnwh8xkwq25ZQYsbF3BGnnp5RCj+dpXP2R6nO0Yul90Fy8Vu81EjrukrvN5hFmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894303; c=relaxed/simple;
	bh=bSrAWudPARldXiHGKpyEAcNe5O1DAJpIzRa/IHav+Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swhkerhkU7LzJ0BQT1Nh4f5+xGc1XEBMLUG+bwFnWjIvbgFaA0Mk45RnwlhEgQB760U3fgT0CwjFHl007bhSpL8+Fa5bw6iFLKjmCvU7SfjsaFrVaucHZRwCZnBFO1yhcmHtJW0umWDNACkknnCcdBRzA3lSzU3NFFXEcJTElFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fy3lN9uL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f58c68c5so1015393e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 01:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728894300; x=1729499100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hfW7J9erMIlvZVwH40xlH7a/MeCGU64sFdySDdF9nk=;
        b=Fy3lN9uL80qP27J9QuVJRSZ8ci7oljt/rjWTQdrM5Qsu+NVrTHkx3jLiWRpNIUvZRW
         DXu11c/Vtff6CBJRwHpTrus/rO+JulBLTukZ+EPpGT5jwh/5vV1xo3sUYVQPEjO/DBRN
         yCO7fD7C/CzAP9QEbElJ/GmKSSHGQcsYGIpCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894300; x=1729499100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hfW7J9erMIlvZVwH40xlH7a/MeCGU64sFdySDdF9nk=;
        b=JdkLT+tcXaSBqo48m1StTBJNeTpNL/DaDeGbG9kEJEtOX6wt7j8NVXmCEGdY6nGMft
         7Y/mepbuy092j9mbTnXD4hgjnaO2Y+35pF4e1McgYiIqtVOoi8jNeCs6F0lJjStwgngN
         22o6OkPl81YkPh3/jEcICLBmm+yalkbzbsur3xYF7ObM1Rnz2xb445IDase/eJ6626jy
         05LekoQQZxU0linqr0QY1TIViAYIHnBYW+aSqiz601ROE61+UmzNfBB5pGb6B8lymRlL
         fTiTvlsQmo/p3vN4ozRR1qjtYPhdN/mr9AtxRtMvWZ3QMkODVWD3qVXaE2kJK0CeI+Rg
         vI7g==
X-Forwarded-Encrypted: i=1; AJvYcCXOKLNK4ClYkrzDBg1aAWezm94613/Gjzu6suNKxdaVRuLEl6nvbq1NxGM9GdzDL6J4PbXY9N8oV9QCqXcP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ZMKdaq/tzeDvrkM8EJedgvWJK0TnDdMkY04yYewF4+YaSN9a
	xfSfDOa2RsTewgpXGKzWsMmYS/ELVRtDuLnnKapnw4zp9n3BOTqtY0yIpjccoKNYeFHERpSg9g+
	QmhquYoXAoBuBdYK1Mbg58ej6p1yqAjkhlqe0
X-Google-Smtp-Source: AGHT+IEy3zplL4+qLOG9nz0L5a8N8FX81DMds6yZSQeoAH/iFm1yiRg+sf+trJRZ9wYaT+OFA6JfzdNx+UxUjfbOmPU=
X-Received: by 2002:a05:6512:31d2:b0:539:9155:e8c1 with SMTP id
 2adb3069b0e04-539e54d76cbmr3219847e87.8.1728894299616; Mon, 14 Oct 2024
 01:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
 <20241010-b4-cleanup-h-of-node-put-thermal-v4-2-bfbe29ad81f4@linaro.org>
In-Reply-To: <20241010-b4-cleanup-h-of-node-put-thermal-v4-2-bfbe29ad81f4@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 16:24:48 +0800
Message-ID: <CAGXv+5EJvy6KwJZWCUTNQiec03WdB9m-XeEp4yicxD8FuWVrMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] thermal: of: Use scoped memory and OF handling to
 simplify thermal_of_trips_init()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 2:06=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Obtain the device node reference and allocate memory with
> scoped/cleanup.h to reduce error handling and make the code a bit
> simpler.
>
> The code is not equivalent in one minor aspect: outgoing parameter
> "*ntrips" will not be zeroed on errors of memory allocation.  This
> difference is not important, because code was already not zeroing it in
> case of earlier errors and the only caller does not rely on ntrips being
> 0 in case of errors.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Chen-Yu Tsai <wenst@chromium.org>
>
> Changes in v4:
> 1. Significant change: kzalloc() also with scoped-handling so the entire
>    error handling could be removed.
> 2. Due to above, drop review-tags (Chen-Yu, Jonathan).

The additional changes are the same as what I had done, except that
I used "return_ptr(tt)" instead of "return no_free_ptr(tt)", and I
had reset *ntrips to 0 at the beginning.

So,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> Changes in v2:
> 1. Drop left-over of_node_put in regular exit path (Chen-Yu)
> ---
>  drivers/thermal/thermal_of.c | 31 ++++++++-----------------------
>  1 file changed, 8 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index f0ffc0e335ba9406f4fd858d6c561f9d23f4b842..37db435b54b124abf25b1d75d=
6cc4fb75f1c1e5c 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -95,11 +95,9 @@ static int thermal_of_populate_trip(struct device_node=
 *np,
>
>  static struct thermal_trip *thermal_of_trips_init(struct device_node *np=
, int *ntrips)
>  {
> -       struct thermal_trip *tt;
> -       struct device_node *trips;
>         int ret, count;
>
> -       trips =3D of_get_child_by_name(np, "trips");
> +       struct device_node *trips __free(device_node) =3D of_get_child_by=
_name(np, "trips");
>         if (!trips) {
>                 pr_err("Failed to find 'trips' node\n");
>                 return ERR_PTR(-EINVAL);
> @@ -108,36 +106,23 @@ static struct thermal_trip *thermal_of_trips_init(s=
truct device_node *np, int *n
>         count =3D of_get_child_count(trips);
>         if (!count) {
>                 pr_err("No trip point defined\n");
> -               ret =3D -EINVAL;
> -               goto out_of_node_put;
> +               return ERR_PTR(-EINVAL);
>         }
>
> -       tt =3D kzalloc(sizeof(*tt) * count, GFP_KERNEL);
> -       if (!tt) {
> -               ret =3D -ENOMEM;
> -               goto out_of_node_put;
> -       }
> -
> -       *ntrips =3D count;
> +       struct thermal_trip *tt __free(kfree) =3D kzalloc(sizeof(*tt) * c=
ount, GFP_KERNEL);
> +       if (!tt)
> +               return ERR_PTR(-ENOMEM);
>
>         count =3D 0;
>         for_each_child_of_node_scoped(trips, trip) {
>                 ret =3D thermal_of_populate_trip(trip, &tt[count++]);
>                 if (ret)
> -                       goto out_kfree;
> +                       return ERR_PTR(ret);
>         }
>
> -       of_node_put(trips);
> +       *ntrips =3D count;
>
> -       return tt;
> -
> -out_kfree:
> -       kfree(tt);
> -       *ntrips =3D 0;
> -out_of_node_put:
> -       of_node_put(trips);
> -
> -       return ERR_PTR(ret);
> +       return no_free_ptr(tt);
>  }
>
>  static struct device_node *of_thermal_zone_find(struct device_node *sens=
or, int id)
>
> --
> 2.43.0
>

