Return-Path: <linux-arm-msm+bounces-52098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32DA6A951
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 16:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76B903AE7E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 15:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78EA8F6B;
	Thu, 20 Mar 2025 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4PearK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7B11DE8B4
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 15:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742482962; cv=none; b=LB2yV5xFvYOuhGQVGyzaJl2roaexFS77p2IujM2bS7xzt2imdfFbrMLzfSDzkY4VzhdKfG8QYSHNAvSYXrHTA7tCFR/P2l9Kmt+HloldUj7HfQhL+08o+zRpQGN+YRtlAjohhsdBH5ea47vgWGg9z5YGGvNCrRBNr4VL8BPgcXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742482962; c=relaxed/simple;
	bh=0cgnDgdNzVW36FA9PDsbGMmk5rxfx1Eu6N9mxulMwrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWcuWWakOduuIFAE6iox0ST/AJefm6TjJ4nLP1GmBXjYaeEJntE8xgThZ+z3v2od7OOAHs3vJ4H9qynWvV6QkIX9LJPuHLcNCaz4QxqzvhHpFEa0pKoUK9ZkIx9x2JdkQEdKvh3QIFaaE600ELMOQEbx6fNv0m2VIUbWfcTiK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M4PearK3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso8366995e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742482959; x=1743087759; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9sehYKzuHhP4cHDSTPPw63jIQFVIC/gPZCdP7Ex2olE=;
        b=M4PearK3AXWvZOg7aTNGGdjuEYJ1xZp7rKZ890Xra6N5Cw3tlXuwJHEPrjXEEmjT9M
         4C2hOLRWJJJkcsqQFf3/3lVU+x8UTpQRLGD2ocAQHSe2GUao/lrzjsbYlTsAg9ajN8cU
         /9sH2ppNA0tSp3XY2MjJWF8uhV1+uqLCEPQ1FMlpYQMykazCE/Z2MjJG/fU5zuU2xflK
         sNSDH9/tDZhgfZonqlntC53KizODSpIst6xKKXTEx28jzixdfyKJDhK3UeoWZmSk1x9X
         ttN96EoDgw47SHy3JpYtAEodtznhX+euou2rX7fXhu/Wc14clA6rftT1rsjXg1/Z8R/y
         k1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742482959; x=1743087759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sehYKzuHhP4cHDSTPPw63jIQFVIC/gPZCdP7Ex2olE=;
        b=hTCCIwPXE34FUILPJvy3q7EftNTRlEVwYFCgcoH64Ri9sEO27XkfQccQGK8erInjZc
         z1vo6vIE+ulI9eUZSSgX3CrzfyrbjdgVJjrympn2s3lTJQPwn0iFV77fYoT4JV27tQL+
         THUk9dlPi0o65kVaiPZ6BEkPM9zxfiPXvW42iqjYgkfYWuOjdIVCZEtXZTTKfI4qEPXZ
         bUHUaWzaDbBUEhlvA+dntwlDiU/D66pZsM9nShm6MCImED0R8FC3ODeS+IcUlIEaD+rn
         u3tebdppTpXBSTKN+TKszk65lXU2HwrC5QqwNri5gPf8qgPICjwwOq381/DyS9nxDbsf
         iFeA==
X-Forwarded-Encrypted: i=1; AJvYcCUkyMwMYPKiMzQTwwWWYWtum7E/rZ4ub/X51KsyHyRO4NfbAjITFvW7i9jLg31a3yLxPH0PF/jcYeHkEslG@vger.kernel.org
X-Gm-Message-State: AOJu0YwDGmVOslXl0bO13Se/o4fb7UHkyBa1l2DAlDuYaPYZjWpMu1y1
	a9ZSb1DahVw1LebzyTnMW6O1tqZwRaQAEU6owsJHk94mGW3IiAP79CE0oPN2wUkmDXh73Y0iUuT
	DC0prOPlKUrloAEDdEfKcbCiH8SurE/aeUVcZVw==
X-Gm-Gg: ASbGncuL2aFZNHdB5+uW8lbdklpevD6LBVv3wzdDs87+l7P60WgMdhtgCVDzr568SKp
	VPTRFrmwdK9SJrQXBgBCVJ62TMaKGM5etL//kHUDmwCcLb6/BRKiawmaal5QnMXdtAqqYniJ2qZ
	Is5aCniRfdGGYr46MtC+UUcGSZytlG7fLsBLmXkbbkN5Ho5YniM1NRngxhgxg=
X-Google-Smtp-Source: AGHT+IGLy2W/hhzQpQkvhVEEFt6eBc/L+uTy5kS3QUwNT6NyACApSJCXQFCTQQeF1TAwP9QEm0Un31S+ZrQDHRbkqHs=
X-Received: by 2002:a05:6000:1787:b0:390:de33:b0ef with SMTP id
 ffacd0b85a97d-399739d3dbcmr5247560f8f.30.1742482957077; Thu, 20 Mar 2025
 08:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org> <20250320115633.4248-5-srinivas.kandagatla@linaro.org>
In-Reply-To: <20250320115633.4248-5-srinivas.kandagatla@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 20 Mar 2025 15:02:26 +0000
X-Gm-Features: AQ5f1JqX1AbEBgRZ7qH0d-U0vmoh9b57-Gri1YjGtvQ8vBotPCbRFlHhbhRg0oY
Message-ID: <CACr-zFB+mAFTPGpT2ihwB43yY_aBmKfb0wYf7PxpYbULh5PfXw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org, 
	krzk+dt@kernel.org, ivprusov@salutedevices.com, luca.ceresoli@bootlin.com, 
	zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com, 
	robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz, 
	tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	johan+linaro@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Srini,

On Thu, 20 Mar 2025 at 12:03, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi mux is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable.
>
> move to using mux control to enable both regulator and handle gpios,
> deprecate the usage of gpio.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>  sound/soc/codecs/Kconfig   |  2 ++
>  sound/soc/codecs/wcd938x.c | 38 ++++++++++++++++++++++++++++++--------
>  2 files changed, 32 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index ee35f3aa5521..b04076282c8b 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -2226,6 +2226,8 @@ config SND_SOC_WCD938X
>         tristate
>         depends on SOUNDWIRE || !SOUNDWIRE
>         select SND_SOC_WCD_CLASSH
> +       select MULTIPLEXER
> +       imply MUX_GPIO
>
>  config SND_SOC_WCD938X_SDW
>         tristate "WCD9380/WCD9385 Codec - SDW"
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index f2a4f3262bdb..b7a235eef6ba 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -19,6 +19,7 @@
>  #include <linux/regmap.h>
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
> +#include <linux/mux/consumer.h>
>  #include <linux/regulator/consumer.h>
>
>  #include "wcd-clsh-v2.h"
> @@ -178,6 +179,8 @@ struct wcd938x_priv {
>         int variant;
>         int reset_gpio;
>         struct gpio_desc *us_euro_gpio;
> +       struct mux_control *us_euro_mux;
> +       u32 mux_state;
>         u32 micb1_mv;
>         u32 micb2_mv;
>         u32 micb3_mv;
> @@ -3243,9 +3246,16 @@ static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool activ
>
>         wcd938x = snd_soc_component_get_drvdata(component);
>
> -       value = gpiod_get_value(wcd938x->us_euro_gpio);
> +       if (!wcd938x->us_euro_mux) {
> +               value = gpiod_get_value(wcd938x->us_euro_gpio);
>
> -       gpiod_set_value(wcd938x->us_euro_gpio, !value);
> +               gpiod_set_value(wcd938x->us_euro_gpio, !value);
> +       } else {
> +               mux_control_deselect(wcd938x->us_euro_mux);
> +               wcd938x->mux_state = !wcd938x->mux_state;
> +               if (mux_control_select(wcd938x->us_euro_mux, wcd938x->mux_state))
> +                       dev_err(component->dev, "Unable to select us/euro mux state\n");
> +       }
>
>         return true;
>  }
> @@ -3261,14 +3271,23 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
>                 return dev_err_probe(dev, wcd938x->reset_gpio,
>                                      "Failed to get reset gpio\n");
>
> -       wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
> -                                               GPIOD_OUT_LOW);
> -       if (IS_ERR(wcd938x->us_euro_gpio))
> -               return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> -                                    "us-euro swap Control GPIO not found\n");
> +       wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
> +       if (IS_ERR(wcd938x->us_euro_mux)) {
> +               if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
> +                       return -EPROBE_DEFER;
> +
> +               /* mux is optional and now fallback to using gpio */
> +               wcd938x->us_euro_mux = NULL;
> +               wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
> +               if (IS_ERR(wcd938x->us_euro_gpio))
> +                       return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> +                                            "us-euro swap Control GPIO not found\n");
> +       } else {
> +               if (mux_control_select(wcd938x->us_euro_mux, wcd938x->mux_state))
> +                       dev_err(dev, "Unable to select us/euro mux state\n");
> +       }
>
>         cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
> -
>         wcd938x->supplies[0].supply = "vdd-rxtx";
>         wcd938x->supplies[1].supply = "vdd-io";
>         wcd938x->supplies[2].supply = "vdd-buck";
> @@ -3581,6 +3600,9 @@ static void wcd938x_remove(struct platform_device *pdev)
>         pm_runtime_set_suspended(dev);
>         pm_runtime_dont_use_autosuspend(dev);
>
> +       if (wcd938x->us_euro_mux)
> +               mux_control_deselect(wcd938x->us_euro_mux);
> +
>         regulator_bulk_disable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
>         regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
>  }
> --
> 2.39.5
>
>

