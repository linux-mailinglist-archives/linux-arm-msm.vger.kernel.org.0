Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB1835AFE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 15:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfF3N0h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 09:26:37 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43233 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfF3N0h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 09:26:37 -0400
Received: by mail-ed1-f66.google.com with SMTP id e3so18285044edr.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jun 2019 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TR/U35GOSzbg7ErKFjslW1/rjmDfua81/9ryZaRuObY=;
        b=Tk0wJIMf02ZT9yzKyXRjQ1yuzqF24JjisloZxoU9WjFL18PJuddVZIAvQxqGZ+wLg/
         4mpu1+VgJ3s9pL8u1uF8phaixMqcr8+gWI/aH/AOrq7yx8wMH6SkloINNcQf83knVXVE
         RPGzPWJ81VUK29UOfDgngVY6GzmQbDM5WsZuCGEblaiqKGgnn8vDJTsk+RvsJTn3bNwb
         cZ6Yqs9ns/p+Ned0aNAoDApN3tkPWSyzhb2CwPT9FGhz0TMFEGlzFpKYHf2nbhFG2R1m
         DgJ5N1oKowFGkQA2swBEYet28zhFjO0FBvxda0cVgdDLP2CjWJEwrJeXlo1ZB/a1wVNU
         80fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TR/U35GOSzbg7ErKFjslW1/rjmDfua81/9ryZaRuObY=;
        b=Ld7C6XrZbPx2XUl8adEjheVBCVse8DdCngC8xB61r7+IV7IMM9J3yWju/0iK8bEcHO
         dFgocCfWAGmeuWR6CvcgIiyrMXg6VhDT7FBfDR6YRSdHIXcSs2C/3jG9W1i5qkFMs7Ri
         5YcUEqCCW94qCL6+uPGaxA6xlbKPRXCxawsC0iRC//nntjkcy8B6Pb3ZsEImwg0oNDti
         YsgoKBQo/fLfv+DUzcS9dOTj53lzR7sOH0Jb7INOX8E2pTAflTY7d9GwZzTTu5LvMG0N
         omxxd8D0s5tA/aFCLTkc0gjt4tYggU5Kw+EOgLC57XG1zrG7zOIUU1BG2UUfzW31WvJp
         JWHw==
X-Gm-Message-State: APjAAAXEyTRNMwwo1pgETSsLohaUdMT7TNzmn/4fGoWEz0PE/OcEil8F
        BuEd5PydgfdTNybQE2t9F4B3gGJ8DIB/s4LspvU=
X-Google-Smtp-Source: APXvYqzOPJhV5cAVdRoldfDPOHtp/lTr0+e/QzIsU2Vql/2sUpxAKqhx17GBjBu63jJC1o7jG/OSbnfjAlPJtxM2mAE=
X-Received: by 2002:a50:a544:: with SMTP id z4mr22877808edb.71.1561901195731;
 Sun, 30 Jun 2019 06:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org> <20190629125933.679-4-linus.walleij@linaro.org>
In-Reply-To: <20190629125933.679-4-linus.walleij@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 30 Jun 2019 06:26:19 -0700
Message-ID: <CAF6AEGun2QEMVyO+L3W0UJubgzVPrFr5jkVoTOwHpy9b4MeJMQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpio: of: Support some legacy Qualcomm HDMI bindings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 29, 2019 at 6:02 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Insteaf of the MSM DRM code going around and inspecting the
> device tree nodes by itself to find "qcom,misc" GPIO phandles,
> we add a quirk to the core so that if "qcom,misc-gpios" and
> "qcom,misc-gpio" isn't found, we try to find just
> "qcom,misc" as a last resort. Provide an explicit whitelist
> for those GPIOs.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Rob/Sean: if the approach is overall OK I will merge this
> one patch already for v5.3 so the rest can be queued for
> v5.4 later.

I'm ok with this.. although I wonder if we need to try this hard for
backwards compat?  At least I don't see any upstream dts
using the old names.  Maybe it is ok to just look the other way and break them.

IIRC the old names were based on old downstream android kernel
bindings.. but upstream snapdragon support is pretty good these days
and it has been years since I've had to do drm/msm development by
backporting the upstream driver to a crusty old android kernel.

BR,
-R

> ---
>  drivers/gpio/gpiolib-of.c | 43 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index aec7bd86ae7e..c927eaf6c88f 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -286,6 +286,45 @@ static struct gpio_desc *of_find_regulator_gpio(struct device *dev, const char *
>         return desc;
>  }
>
> +/*
> + * Some non-standard Qualcomm HDMI GPIOs need to be supported as they exist
> + * in random old device trees out there.
> + */
> +static struct gpio_desc *of_find_hdmi_gpio(struct device *dev,
> +                                          const char *con_id,
> +                                          enum of_gpio_flags *of_flags)
> +{
> +       /*
> +        * These are the connection IDs we accept as legacy GPIO phandles.
> +        * If we get here, the same prefix ending with "-gpio" and "-gpios"
> +        * has already been tried so now we finally try with no suffix.
> +        */
> +       const char *whitelist[] = {
> +               "qcom,hdmi-tx-ddc-clk",
> +               "qcom,hdmi-tx-ddc-data",
> +               "qcom,hdmi-tx-hpd",
> +               "qcom,hdmi-tx-mux-en",
> +               "qcom,hdmi-tx-mux-sel",
> +               "qcom,hdmi-tx-mux-lpm",
> +       };
> +       struct device_node *np = dev->of_node;
> +       struct gpio_desc *desc;
> +       int i;
> +
> +       if (!IS_ENABLED(CONFIG_DRM_MSM))
> +               return ERR_PTR(-ENOENT);
> +
> +       if (!con_id)
> +               return ERR_PTR(-ENOENT);
> +
> +       i = match_string(whitelist, ARRAY_SIZE(whitelist), con_id);
> +       if (i < 0)
> +               return ERR_PTR(-ENOENT);
> +
> +       desc = of_get_named_gpiod_flags(np, con_id, 0, of_flags);
> +       return desc;
> +}
> +
>  struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
>                                unsigned int idx, unsigned long *flags)
>  {
> @@ -330,6 +369,10 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
>         if (IS_ERR(desc) && PTR_ERR(desc) != -EPROBE_DEFER)
>                 desc = of_find_regulator_gpio(dev, con_id, &of_flags);
>
> +       /* Special handling for HDMI GPIOs if used */
> +       if (IS_ERR(desc) && PTR_ERR(desc) != -EPROBE_DEFER)
> +               desc = of_find_hdmi_gpio(dev, con_id, &of_flags);
> +
>         if (IS_ERR(desc))
>                 return desc;
>
> --
> 2.20.1
>
