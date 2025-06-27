Return-Path: <linux-arm-msm+bounces-62717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2297DAEAC79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 04:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 741463AAC52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242C518C02;
	Fri, 27 Jun 2025 02:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0m/UIwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B6A2F1FC4;
	Fri, 27 Jun 2025 02:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750989695; cv=none; b=mLYXMl8NWDFTorjm+1fSkSTf33AXlHijEyxa1eVAhbUuWPGdgf2l6wdetDb7O5VDGJx3mFfcK1YWzHGFQclqPrE2qk/WYL4RW2+8AdTMiICUntL9+1qw/RsaObxNUhykbZ7tEE1mq+iZJWEb9hbNza3vpIlIBwm0HB9bmmY+5d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750989695; c=relaxed/simple;
	bh=fNMOLkjJEnP8Cdvd71Kj0uBYZCipG7yHl6zNB8V0ebM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ik5CtKED//VC3meGGmAHLn3Um4+CA2Q9T1WCrRZal01YnwLGbe7gxUwMYKbhBfX0a3O2yrLuGY+RMMkFnqAgw6cwzd6KROw0GrutSn1dvZcbLjGrLwyV70Bu/gNUxzByfyn9kLpbDYRXQ6JyhG2t21OF1faXxVIl3bCtCssQYkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0m/UIwE; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-530d764149eso488792e0c.1;
        Thu, 26 Jun 2025 19:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750989691; x=1751594491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iv+ULazfCotUfqTUQgUOXEi7/XbND58A2hHC6r5AKlU=;
        b=f0m/UIwEboLoBA5xRBWN/0ri+5skryLl/MdomrJWZmUh1aqCTSwRCj9SOVMOhuKNtd
         P8YEp1NgDnbBg+xPHQAjTjjFeYKXZQx6A4xOvOc4brJYYvLEda/H8cetUk5ZJRxMnPac
         3BvBTYedy0ojlHZ6h2cuQ5tvTswFb5+I8mn+8JhSWpKq8NP1iUb5yjj/ptL6LHGZtz02
         wXty6KaS/uWMwgh3rZoSquuop91c2B0MOS7PelhVRyTKgRMuX2hmXm4Dh4z5OOCS0EsH
         /ARgtd6Tj/t9RkhskJiU+7YXdLVr6EcG7rRW7BqYXMyaRrRtavcZp2bOlpMPztUmqDAJ
         B9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750989691; x=1751594491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iv+ULazfCotUfqTUQgUOXEi7/XbND58A2hHC6r5AKlU=;
        b=szieqtJCfmYFUJmGf3lkLeF6K9G6d1LUqNQaKiVaIRzAWGfzRkoYx0Z6Wx1ZR73Wse
         TLPaQrFp2uXgvbCBUEWv6MBkoHSsLbELo45PxhSkV1vhjL96hbFcOxpiOz8L16updUxH
         Vr4glLbWY9gQzYcztLWtocaZcFD2GYfm8xgyM9nQ9DtDWPNV6rb7okH3tzgwsntCHPYD
         7O0zcJqczCrkuCjnU4szTjDZkkd5iguon5jVCUurxNrfn9J+TKmiG3iPHLliwR9sDk2R
         vsI2msZcJSj7W+0AT84216C0PjHjhNndt4Q9RdY1Xh2nvjj9yL7D2/ki0KesvFzpRpLc
         BvsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5DFHCmUGH8GtZ4XLww2t+8LyuamYx4iCyzTYQYTWpX9VkuBwJk5QdTDOr4J1OI4CbADzfmEQTmarObNry26jTz7I=@vger.kernel.org, AJvYcCVvZS6jVGLWnFINm4QtVGnEuFR4WCxB+3OTRMh6KW87mdPMteFKAvcFlW2yog2ji9OmmGIOnawDxuW8yrul@vger.kernel.org, AJvYcCWeCLD5k5yaGAq7TraoMw+eHUuNh1R9VLBkKpTLpS781tZz6NOf3RUxXLr6G1a/wyTlRquzaC8EaT20J9l9@vger.kernel.org
X-Gm-Message-State: AOJu0YwduSZB/0IK6guMNMEW6AATLWJLbnj2pA0KG0bfIVo/1c5ZupNh
	6O7jlmeU7vJqgqtVHLpssyV8aejioh/MeDLZMijLejO3/MGhT1Ki6xD9d5RGdRAPfwLPh0nvRw0
	wbZrVsdXTeYPGvluhgRH756oky6wXpDw=
X-Gm-Gg: ASbGnctMMVOrZAcUKFJkA4EzHvx8FXDodVie3UOlAuyTbPPzDmwDEhYVCV00Gp+oFQS
	PpBuZgdwAg8VI0e6GzNwyxIc3i/6VYJGD6fMF8dXpK2FXXelTxeYkrKaY3jgVP9H14+QFvsaOWn
	LeKGyWMrVE7BrUMpJGLMhIQ1CogK7JZQmJPBo6f36/Rg==
X-Google-Smtp-Source: AGHT+IEfDkUmXmdGNiYTAmO+fSQE3VFxMdbIHmR6wR3Spz90Kei7f1lHrowLtUvc0N5RL+zWLCQWluZ6/tNtS2e7eSo=
X-Received: by 2002:a05:6122:21a1:b0:531:4041:c4c7 with SMTP id
 71dfb90a1353d-5330bfd4563mr1451187e0c.7.1750989691380; Thu, 26 Jun 2025
 19:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de> <20250618-restricted-pointers-drm-v1-1-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-1-781e0d88cd92@linutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 11:00:55 +0900
X-Gm-Features: Ac12FXzQxzyREaVVCRYXuMvFKjupkA98dfTPk38AOS_x9wbPi10kqXkSS64ZqjU
Message-ID: <CAAQKjZNG73CX8ebxqLgcYRGguGya-9zODL3BTdBDgbgJLJZ9jw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: samsung-dsim: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2025=EB=85=84 6=EC=9B=94 18=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 4:56, T=
homas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
>
> Switch to the regular pointer formatting which is safer and
> easier to reason about.

Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 0014c497e3fe7d8349a119dbdda30d65d816cccf..bccc88d2594840647d7107c13=
d69104912087384 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1095,7 +1095,7 @@ static void samsung_dsim_send_to_fifo(struct samsun=
g_dsim *dsi,
>         bool first =3D !xfer->tx_done;
>         u32 reg;
>
> -       dev_dbg(dev, "< xfer %pK: tx len %u, done %u, rx len %u, done %u\=
n",
> +       dev_dbg(dev, "< xfer %p: tx len %u, done %u, rx len %u, done %u\n=
",
>                 xfer, length, xfer->tx_done, xfer->rx_len, xfer->rx_done)=
;
>
>         if (length > DSI_TX_FIFO_SIZE)
> @@ -1293,7 +1293,7 @@ static bool samsung_dsim_transfer_finish(struct sam=
sung_dsim *dsi)
>         spin_unlock_irqrestore(&dsi->transfer_lock, flags);
>
>         dev_dbg(dsi->dev,
> -               "> xfer %pK, tx_len %zu, tx_done %u, rx_len %u, rx_done %=
u\n",
> +               "> xfer %p, tx_len %zu, tx_done %u, rx_len %u, rx_done %u=
\n",
>                 xfer, xfer->packet.payload_length, xfer->tx_done, xfer->r=
x_len,
>                 xfer->rx_done);
>
>
> --
> 2.49.0
>
>

