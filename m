Return-Path: <linux-arm-msm+bounces-36735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8669B90D9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 13:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A8CBB20DEF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 12:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9C1161310;
	Fri,  1 Nov 2024 12:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ml7H3Wj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ADC86252;
	Fri,  1 Nov 2024 12:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462537; cv=none; b=qxYeWAtUifWbBPcy2rekfOOnGbgZuR0YTfvuuCg7xhiGhfVTaapsMnRwx70JlCV55Ke0QZD+bvGybYQxEcJOuo+l+ZFsGSP4o+rdGB+3CH46xzAOOqWH9XAgUVxGlr18sn63SAl2x1uEI4nBC3J4f+G7HSs9rj3LCjCqwsElSFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462537; c=relaxed/simple;
	bh=zXlmXsSCyrYCiE4Y/bcDk5StCf2s7K479mjZtcQLKgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYkQ1bmzWFF64sXyJWeKm2TuJkD4OZtBBzQyqnxllt3ddt6HfP/XVKdF2v6ujoQZCCBPxYxQt12APu804OmuEMjQR8NcY+svyzSY0d2axNS/fy91N5DfCMuO0YkAU+ffb5uHdU2ComMWw7rPfIgq9KM9w4Gq6FduJifcJkho9c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ml7H3Wj2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D35CC4CED1;
	Fri,  1 Nov 2024 12:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730462537;
	bh=zXlmXsSCyrYCiE4Y/bcDk5StCf2s7K479mjZtcQLKgU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ml7H3Wj2Wb1oJIQILdWCH4AbMvtTWYFZNBVwvpXpaSrOB7mGyePq951GoUOhlimz6
	 qKthGosqlxtb75TTqLoXXp5DswycEgq9oV5vzvI8Iwp07oOAnednu078BYVkQUjDiq
	 mlPqKuLLg3UarSWp7r0cse1F8zYqmvEEI4gblAeNPPA9zaw5zBt/D7fI8vN4xe+aVh
	 Aa3zzzJXLAqxB17pwyo+Fjidm7VOxfpb5chwnB86jZ++F3M2MNBXdvhy621PPHrVdK
	 8rzs/sLU17vxlkNRtWcCbBzJDnVWbV3XNSlU38MGPiw7lC4wTCL0LUZqmf4Qo42fVl
	 oLRoqGkALDxUA==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e30d1d97d20so1682759276.2;
        Fri, 01 Nov 2024 05:02:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUU7znHpkFqrQj0GNwtjz1/PF9bXY8SKowW28GogSWVZyBkWzZ35UDUdIXG1dJ6glD/fzEREuYXprSMbwQP@vger.kernel.org, AJvYcCVLP8nQajao3hBfP9pFFnAz75XAyXIPHNdedOgVzDXaF09XN8nfFjRSN34g+adLT8rCig8R+qRjCdr8+Kx4Zg==@vger.kernel.org, AJvYcCVVOirxLIWasPgn9IbG9/SRhF8M+I6rK3d4fpYS5FnoHsdSmAICaL4LeLlqbbR+XsxUimVPlC6T0ke+@vger.kernel.org, AJvYcCVf60hykBEQmkJIvd3zUmXUBkR9AbswN7saHcfe3GIBaPhvJWx/i3ePCg3VWdkn1wYrLPo/rLOcNAey/Nc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx4pMk8f4BC4dO/x2JZ73HDMymFXcsoyaWhCYSWL5MqDnzUIMc
	IQllT7LEEPnVi7l3Li98Zcxzm9caPPvD2IdQevhRZ7f7U+qLKO+luwEF/TXnBr7qZd7bC8s7n5F
	dbmh48DmHLfwcuMzxbebITMDx2A==
X-Google-Smtp-Source: AGHT+IGsNLqMz/aG++/V/FvS+KiQcFzeIW8oeXXwcgYyCoEntih6aXTowBTADYjXqSGa4NgckdwB9Lxq9hsxw5pJMHA=
X-Received: by 2002:a05:690c:6e10:b0:6e3:24c1:cdf8 with SMTP id
 00721157ae682-6e9d8a2c2a1mr231777577b3.22.1730462535994; Fri, 01 Nov 2024
 05:02:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241101053154.497550-1-alexey.klimov@linaro.org> <20241101053154.497550-8-alexey.klimov@linaro.org>
In-Reply-To: <20241101053154.497550-8-alexey.klimov@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 1 Nov 2024 07:02:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJE20OHcbKY13eQsYjbNumj_vQEKQw28GU0tH0Si=G+ZA@mail.gmail.com>
Message-ID: <CAL_JsqJE20OHcbKY13eQsYjbNumj_vQEKQw28GU0tH0Si=G+ZA@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] ASoC: codecs: add wsa881x-i2c amplifier codec driver
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, 
	andersson@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com, 
	lgirdwood@gmail.com, perex@perex.cz, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dmitry.baryshkov@linaro.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 12:32=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> Add support to analog mode of WSA8810/WSA8815 Class-D Smart Speaker
> family of amplifiers. Such amplifiers is primarily interfaced with
> SoundWire but they also support analog mode which is configurable
> by setting one of the pins to high/low. In such case the WSA881X
> amplifier is configurable only using i2c.
>
> To have stereo two WSA881X amplifiers are required but mono
> configurations are also possible.
>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/codecs/Kconfig          |   11 +
>  sound/soc/codecs/Makefile         |    2 +
>  sound/soc/codecs/wsa881x-common.h |   19 +
>  sound/soc/codecs/wsa881x-i2c.c    | 1454 +++++++++++++++++++++++++++++
>  4 files changed, 1486 insertions(+)
>  create mode 100644 sound/soc/codecs/wsa881x-i2c.c
>
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index b8ea8cf73d63..3d7868977262 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -350,6 +350,7 @@ config SND_SOC_ALL_CODECS
>         imply SND_SOC_WM9712
>         imply SND_SOC_WM9713
>         imply SND_SOC_WSA881X
> +       imply SND_SOC_WSA881X_I2C
>         imply SND_SOC_WSA883X
>         imply SND_SOC_WSA884X
>         imply SND_SOC_ZL38060
> @@ -2484,6 +2485,16 @@ config SND_SOC_WSA881X
>           This enables support for Qualcomm WSA8810/WSA8815 Class-D
>           Smart Speaker Amplifier.
>
> +config SND_SOC_WSA881X_I2C
> +       tristate "WSA881X Codec - Analog mode"
> +       depends on I2C
> +       select REGMAP_I2C
> +       select SND_SOC_WSA881X_COMMON
> +       help
> +         This enables support for Qualcomm WSA8810/WSA8815 Class-D Smart
> +         Speaker Amplifier that works in analog mode and configurable
> +         via I2C.
> +
>  config SND_SOC_WSA883X
>         tristate "WSA883X Codec"
>         depends on SOUNDWIRE
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index bc1498cedf08..682bdf63abea 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -399,6 +399,7 @@ snd-soc-wm9713-y :=3D wm9713.o
>  snd-soc-wm-hubs-y :=3D wm_hubs.o
>  snd-soc-wsa881x-y :=3D wsa881x.o
>  snd-soc-wsa881x-common-y :=3D wsa881x-common.o
> +snd-soc-wsa881x-i2c-y :=3D wsa881x-i2c.o
>  snd-soc-wsa883x-y :=3D wsa883x.o
>  snd-soc-wsa884x-y :=3D wsa884x.o
>  snd-soc-zl38060-y :=3D zl38060.o
> @@ -821,6 +822,7 @@ obj-$(CONFIG_SND_SOC_WM_ADSP)       +=3D snd-soc-wm-a=
dsp.o
>  obj-$(CONFIG_SND_SOC_WM_HUBS)  +=3D snd-soc-wm-hubs.o
>  obj-$(CONFIG_SND_SOC_WSA881X)  +=3D snd-soc-wsa881x.o
>  obj-$(CONFIG_SND_SOC_WSA881X_COMMON)   +=3D snd-soc-wsa881x-common.o
> +obj-$(CONFIG_SND_SOC_WSA881X_I2C)      +=3D snd-soc-wsa881x-i2c.o
>  obj-$(CONFIG_SND_SOC_WSA883X)  +=3D snd-soc-wsa883x.o
>  obj-$(CONFIG_SND_SOC_WSA884X)  +=3D snd-soc-wsa884x.o
>  obj-$(CONFIG_SND_SOC_ZL38060)  +=3D snd-soc-zl38060.o
> diff --git a/sound/soc/codecs/wsa881x-common.h b/sound/soc/codecs/wsa881x=
-common.h
> index cf8643e1f7f7..1b9c20cd3807 100644
> --- a/sound/soc/codecs/wsa881x-common.h
> +++ b/sound/soc/codecs/wsa881x-common.h
> @@ -2,6 +2,7 @@
>  #ifndef __WSA881x_COMMON_H__
>  #define __WSA881x_COMMON_H__
>
> +#include <linux/i2c.h>
>  #include <linux/soundwire/sdw.h>
>  #include <sound/soc.h>
>
> @@ -193,6 +194,24 @@ struct wsa881x_priv {
>         bool port_enable[WSA881X_MAX_SWR_PORTS];
>  #endif
>
> +#if IS_ENABLED(CONFIG_SND_SOC_WSA881X_I2C)
> +       /* i2c interace for analog mode */
> +       struct regmap *regmap_analog;
> +       /* First client is for digital part, the second is for analog par=
t */
> +       struct i2c_client *client[2];
> +       struct snd_soc_component *component;
> +       struct snd_soc_dai_driver *dai_driver;
> +       struct snd_soc_component_driver *driver;
> +       struct gpio_desc *mclk_pin;
> +       struct clk *wsa_mclk;
> +       bool boost_enable;
> +       int spk_pa_gain;
> +       struct i2c_msg xfer_msg[2];
> +       bool regmap_flag;
> +       bool wsa_active;
> +       int index;
> +       int version;
> +#endif
>         struct gpio_desc *sd_n;
>         /*
>          * Logical state for SD_N GPIO: high for shutdown, low for enable=
.
> diff --git a/sound/soc/codecs/wsa881x-i2c.c b/sound/soc/codecs/wsa881x-i2=
c.c
> new file mode 100644
> index 000000000000..74fa85306ad9
> --- /dev/null
> +++ b/sound/soc/codecs/wsa881x-i2c.c
> @@ -0,0 +1,1454 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015-2016, 2018-2020, The Linux Foundation. All rights =
reserved.
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + * Copyright (c) 2024, Linaro Limited
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/of_gpio.h>

No new users of this please. We are working on removing it.

Rob

