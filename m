Return-Path: <linux-arm-msm+bounces-52262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63179A6D35A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 04:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B292416FBBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 03:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED7044C7C;
	Mon, 24 Mar 2025 03:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="RXVTcCwB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683481D540
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742787666; cv=none; b=VoBBBVqvaChrIdM48lZS0X2iQye+ZX5kbuPd7lX8VDcRzNPihF46WPxHuP2H1aQ3cDIxIEI7547h1gGbgHlyRrIGrXuub/q831g33pCwUiuKKkOudeEQsp+b3F6mYj84dW29KMCXOw1MlBfLVbtR1CtqObpiJaSKJSwcdI/W2Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742787666; c=relaxed/simple;
	bh=YTOyujB6HV49uiuieNmfjMnZV25DYjCLt8LZ3xZbu44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oeap+YoVaH1NGOkbni6TgZAaPryhhBbJeMexjMiQ+PlwdNtc1rkNaz3gR9YgEnsvwbfAGTS5aQ5fDsghTNKXNd9eVk8kPsYs9ATkHgvr4HVkkX6WunLozpNk/RSB7EJAXi2WnoY7c2jx41fjJeM9LWszaByC+1MlywfZ5hwuB/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=RXVTcCwB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso5848884a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Mar 2025 20:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1742787663; x=1743392463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqAdn5drDLdHVQt7mXUZCWV+B5j9LdmitoQylJry1D4=;
        b=RXVTcCwBTGC7PGGBMPuP8GDVhCGVAqVuRgz5hpEqRVQZVIY7nxxcd6xjXjhqsKlUy/
         BRFwW/KZqkDsHKszDi7QdXGXNGWRDqUUCMmvtGtT3ANAKjcp9nsva2mBo2j4CbSkjOZs
         mR7bmwX+hkapREK2a8G+AUW8G47rxeJuHMEvSGrZqjdCHVY4eBUWNoyiPTBbrfX6Hnwk
         NnflVn6e03a3BtrYU2cKFt+YRGsBIQDH13rpkPx5OwZGxyKd2EmGhNUVdkgL+Odz6Hag
         Quon4Kwc0uBToN8H8STp0HKPM9lNnaLseQ91POCoqrx4wjtXHrr1Q4q0RUYYuBozMdyt
         v/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742787663; x=1743392463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqAdn5drDLdHVQt7mXUZCWV+B5j9LdmitoQylJry1D4=;
        b=R0//q0tmTwL3o1YUyLHu8kXx0gcLFOa3JIKFYytpVtv1919FTm9GNY2C9FKqcuKaf/
         h+OC7xCmhKv+e2gtvmq1LoyBt5QO59Z+2RIqVLKha0Q0cBhms2uRplvMDXjw5zMXrazT
         r5SWzSI4iviRM6b0LNtzZDTJamtBwoSk+RTCqoBxBkcVcT7/inQChybPWHBIBs6B8JfF
         H8Kck5jjLk5QaGxg/GdXsoa/+ohANROjyLLkBmmtYZFNzUV4a/2m6IRPG6Oe1dtuHP8C
         4qx1joHfqMsjb/4uOsB+0IZB4RaX4+9iwropAPjY4wk7MPk0dFHK6+6inZABkdcxbBrN
         bdtA==
X-Forwarded-Encrypted: i=1; AJvYcCW0w/DQWoLGWH3lGM1BODQ/FS3unZuMnb7mD6HWWttg1/0gZ7ljAaraoC5AaRmbbRxye8nsiAACP5NEwGP7@vger.kernel.org
X-Gm-Message-State: AOJu0YwVMgcmdrrxFM7iuvLUTcV/+EOnzS5kPoVcD+71tJXzOVUCf1vp
	WDalp1h+Ua+PW+y1Y7C0F6QKkdpOLr+pdwUiwJ+eBPOBLFNKc3aD8rc84PZZwmIbEYgxdY2rRwE
	hxhLA83/J+Hh4ChIykppU1ZGNeWq2DFo586HCkA==
X-Gm-Gg: ASbGncuMwS6OynD3dPmZD86BhypNdk6wQbOw5Rxafn3R9KwJdJ2GRzanccVz2UWypc7
	9JJvyt1fs352oMsNPGVsLjoC7DNo+dRb7ynpYQIum4CEHPZKY0ajCEkGYXVtS9TQCeYU7Hoz7Qp
	0Alr9FidFkXc9L+Lq16kXNKRL9Kdg=
X-Google-Smtp-Source: AGHT+IEf4WGbQ3qxvrIMk05GS8LR6ITHlULcjaOKtIwGgAmn7Z7RZxqOJXmb4UVfsxdcask06dK+SKmvNHb4sJYQXxw=
X-Received: by 2002:a05:6402:90c:b0:5e7:9d01:109d with SMTP id
 4fb4d7f45d1cf-5ebcd528857mr8535251a12.32.1742787662737; Sun, 23 Mar 2025
 20:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Sun, 23 Mar 2025 22:40:51 -0500
X-Gm-Features: AQ5f1Jrs3YNxuyzEK2PKwShWt84XVzo4wlyPswgCV-soNnQk2eSI4Vg06XK4Sdo
Message-ID: <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng Fan,

On Sun, Mar 23, 2025 at 9:28=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use dev_gpiod_get to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
> output low, set value 0 means output high with gpiod API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  sound/soc/codecs/wcd938x.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 1ae498c323912ed799dcc033e7777936d90c9284..c70da29406f36883e4926eca4=
0ab5ba5df02c383 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -11,7 +11,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/component.h>
>  #include <sound/tlv.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of.h>
>  #include <sound/jack.h>
>  #include <sound/pcm.h>
> @@ -171,7 +170,7 @@ struct wcd938x_priv {
>         int flyback_cur_det_disable;
>         int ear_rx_path;
>         int variant;
> -       int reset_gpio;
> +       struct gpio_desc *reset_gpio;
>         struct gpio_desc *us_euro_gpio;
>         u32 micb1_mv;
>         u32 micb2_mv;
> @@ -3251,9 +3250,9 @@ static int wcd938x_populate_dt_data(struct wcd938x_=
priv *wcd938x, struct device
>         struct wcd_mbhc_config *cfg =3D &wcd938x->mbhc_cfg;
>         int ret;
>
> -       wcd938x->reset_gpio =3D of_get_named_gpio(dev->of_node, "reset-gp=
ios", 0);
> -       if (wcd938x->reset_gpio < 0)
> -               return dev_err_probe(dev, wcd938x->reset_gpio,
> +       wcd938x->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_ASIS);
> +       if (IS_ERR(wcd938x->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(wcd938x->reset_gpio),
>                                      "Failed to get reset gpio\n");
>
>         wcd938x->us_euro_gpio =3D devm_gpiod_get_optional(dev, "us-euro",
> @@ -3297,10 +3296,10 @@ static int wcd938x_populate_dt_data(struct wcd938=
x_priv *wcd938x, struct device
>
>  static int wcd938x_reset(struct wcd938x_priv *wcd938x)
>  {
> -       gpio_direction_output(wcd938x->reset_gpio, 0);
> +       gpiod_set_value(wcd938x->reset_gpio, 1);
>         /* 20us sleep required after pulling the reset gpio to LOW */
>         usleep_range(20, 30);
> -       gpio_set_value(wcd938x->reset_gpio, 1);
> +       gpiod_set_value(wcd938x->reset_gpio, 0);
>         /* 20us sleep required after pulling the reset gpio to HIGH */
>         usleep_range(20, 30);
>
>
> --
> 2.37.1
>
>

With this patchset applied, the wcd938x codec used in the Thinkpad
X13s stops working:

wcd938x_codec audio-codec: soundwire device init timeout
wcd938x_codec audio-codec: ASoC: error at snd_soc_component_probe on
audio-codec: -110
snd-sc8280xp sound: ASoC: failed to instantiate card -110
snd-sc8280xp sound: probe with driver snd-sc8280xp failed with error -110

-- steev

