Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53915281D0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 22:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgJBUnC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 16:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgJBUnC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 16:43:02 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06498C0613D0
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2020 13:43:02 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id n7so545583vkq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 13:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oH2IuyJXkJ1EymE28KST/lfUbPTq/MguUoQDeaf9X/A=;
        b=f4ddM9o0HoyR2qHPNs+JOjY3teqYwTHoazjRh97xTRWxJHHFB9odVE2FunznsuHQMJ
         rZ0s/jT5xM/BKOu0D4YyFhbktO2Mpgz+ciHPDoxxkQRYfxKKOtdHenUSUyfTpUoevqVx
         3PSbxF++REzZ/XFpL6Mx3n4Bwgl1x4E9bmkEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oH2IuyJXkJ1EymE28KST/lfUbPTq/MguUoQDeaf9X/A=;
        b=roOagYPDSqq/n/jaRI6ApQ/1arfgJSHwtGVfdQAX5oJS1alshAgBc+9veUsc2A1hg6
         1Pb8jwI8zWUg85NicEvEyHWwMgDtVwfGli0uAVJ6yfQzSqezRJkEkHplCIyY3kL+zNi7
         UFYvRdRBsFkvwtSRVMAMBFomr6AspRsh3+P0GFLyy/9yIe+HxKiJCLdOlixSusrqZ27W
         vmr/JJpKAocdkF2ShKpa9hcdjoVdDoLAD5OmrrV8BI8xGthsSogY8sKxGeq5BH4z82wS
         wbd6ybYRO8m2Qm9XZQeSOayo9QGl+D518UcpOnRpHo3eOokB+wvG3ESjZZKcyVzD425t
         gnkg==
X-Gm-Message-State: AOAM5323APLNFs4fYlrTjhvWxqcxG5MAozoMNxtTcGZrQvGLgyNoz8n4
        zsh3GxZzt3Q/80cV/XDmfV7Bnma+dT8N/A==
X-Google-Smtp-Source: ABdhPJyWOWgdogUoxJwpWbbBqoCsyCNE4i795qwHsM0+NGd1i/QEeMjZYvcRky8XfgZNGpk9AqTQYg==
X-Received: by 2002:a1f:a94c:: with SMTP id s73mr2376283vke.19.1601671380921;
        Fri, 02 Oct 2020 13:43:00 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id z7sm408900vsn.14.2020.10.02.13.42.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 13:43:00 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id q26so724040uaa.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 13:42:59 -0700 (PDT)
X-Received: by 2002:ab0:29d7:: with SMTP id i23mr2429826uaq.121.1601671379400;
 Fri, 02 Oct 2020 13:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200930223532.77755-1-bjorn.andersson@linaro.org> <20200930223532.77755-3-bjorn.andersson@linaro.org>
In-Reply-To: <20200930223532.77755-3-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 2 Oct 2020 13:42:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbEMi-xviVfJCY4U5ncSUU8-9_Q_VMHZn5uDAp1pNH+g@mail.gmail.com>
Message-ID: <CAD=FV=XbEMi-xviVfJCY4U5ncSUU8-9_Q_VMHZn5uDAp1pNH+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi86: Expose backlight controls
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Sep 30, 2020 at 3:40 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The TI SN65DSI86 can be configured to generate a PWM pulse on GPIO4,
> to be used to drive a backlight driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/bridge/Kconfig        |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 143 +++++++++++++++++++++++++-
>  2 files changed, 140 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 43271c21d3fc..eea310bd88e1 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -195,6 +195,7 @@ config DRM_TI_SN65DSI86
>         select REGMAP_I2C
>         select DRM_PANEL
>         select DRM_MIPI_DSI
> +       select BACKLIGHT_CLASS_DEVICE
>         help
>           Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 5b6e19ecbc84..41e24d0dbd18 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -68,6 +68,7 @@
>  #define  SN_GPIO_MUX_OUTPUT                    1
>  #define  SN_GPIO_MUX_SPECIAL                   2
>  #define  SN_GPIO_MUX_MASK                      0x3
> +#define  SN_GPIO_MUX_SHIFT(gpio)               ((gpio) * 2)
>  #define SN_AUX_WDATA_REG(x)                    (0x64 + (x))
>  #define SN_AUX_ADDR_19_16_REG                  0x74
>  #define SN_AUX_ADDR_15_8_REG                   0x75
> @@ -86,6 +87,12 @@
>  #define SN_ML_TX_MODE_REG                      0x96
>  #define  ML_TX_MAIN_LINK_OFF                   0
>  #define  ML_TX_NORMAL_MODE                     BIT(0)
> +#define SN_PWM_PRE_DIV_REG                     0xA0
> +#define SN_BACKLIGHT_SCALE_REG                 0xA1
> +#define SN_BACKLIGHT_REG                       0xA3
> +#define SN_PWM_CTL_REG                         0xA5
> +#define  SN_PWM_ENABLE                         BIT(1)
> +#define  SN_PWM_INVERT                         BIT(0)
>  #define SN_AUX_CMD_STATUS_REG                  0xF4
>  #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT          BIT(3)
>  #define  AUX_IRQ_STATUS_AUX_SHORT              BIT(5)
> @@ -155,6 +162,8 @@ struct ti_sn_bridge {
>         struct gpio_chip                gchip;
>         DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>  #endif
> +       u32                             brightness;
> +       u32                             max_brightness;

You missed adding to the docstring for brightness and max_brightness.

Also: why do you need your own copy of these two values?  Couldn't you
just store the "struct backlight_device *" that came back from
"devm_backlight_device_register()" and then reference
bl->props.brightness / bl->props.max_brightness?


>  };
>
>  static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
> @@ -173,6 +182,18 @@ static const struct regmap_config ti_sn_bridge_regmap_config = {
>         .cache_type = REGCACHE_NONE,
>  };
>
> +static void ti_sn_bridge_read_u16(struct ti_sn_bridge *pdata,
> +                                 unsigned int reg, u16 *val)
> +{
> +       unsigned int high;
> +       unsigned int low;
> +
> +       regmap_read(pdata->regmap, reg, &low);
> +       regmap_read(pdata->regmap, reg + 1, &high);
> +
> +       *val = high << 8 | low;
> +}

Ideally you should be error checking your reads.  I know this driver
isn't very good about error checking the regmap reads in general, but
probably that should be fixed.  Certainly i2c-backed regmaps can have
failures and you will then do your math on whatever uninitialized
memory was on the stack.  That seems bad.

Presumably you'll then want to return the error code from this
function?  If for some reason you don't, your function should just
return the val instead of passing by reference.


>  static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
>                                    unsigned int reg, u16 val)
>  {
> @@ -180,6 +201,50 @@ static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
>         regmap_write(pdata->regmap, reg + 1, val >> 8);
>  }
>
> +static int ti_sn_backlight_update(struct ti_sn_bridge *pdata)
> +{
> +       unsigned int pre_div;
> +
> +       if (!pdata->max_brightness)
> +               return 0;
> +
> +       /* Enable PWM on GPIO4 */
> +       regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> +                          SN_GPIO_MUX_MASK << SN_GPIO_MUX_SHIFT(4 - 1),
> +                          SN_GPIO_MUX_SPECIAL << SN_GPIO_MUX_SHIFT(4 - 1));
> +
> +       if (pdata->brightness) {
> +               /* Set max brightness */
> +               ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, pdata->max_brightness);
> +
> +               /* Set brightness */
> +               ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_REG, pdata->brightness);
> +
> +               /*
> +                * The PWM frequency is derived from the refclk as:
> +                * PWM_FREQ = REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)
> +                *
> +                * A hand wavy estimate based on 12MHz refclk and 500Hz desired
> +                * PWM frequency gives us a pre_div resulting in a PWM
> +                * frequency of between 500 and 1600Hz, depending on the actual
> +                * refclk rate.
> +                *
> +                * One is added to avoid high BACKLIGHT_SCALE values to produce
> +                * a pre_div of 0 - which cancels out the large BACKLIGHT_SCALE
> +                * value.
> +                */
> +               pre_div = 12000000 / (500 * pdata->max_brightness) + 1;
> +               regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);

Different panels have different requirements for PWM frequency.  Some
may also have different duty-cycle to brightness curves that differ
based on the PWM frequency and it would be nice to make sure we know
what frequency we're at rather than getting something random-ish.  It
feels like you need to be less hand-wavy.  You should presumably
specify the desired frequency in the device tree and then do the math.


> +               /* Enable PWM */
> +               regmap_update_bits(pdata->regmap, SN_PWM_CTL_REG, SN_PWM_ENABLE, SN_PWM_ENABLE);
> +       } else {
> +               regmap_update_bits(pdata->regmap, SN_PWM_CTL_REG, SN_PWM_ENABLE, 0);
> +       }

While technically it works OK to conflate brightness = 0 with
backlight disabled (the PWM driver exposed by the Chrome OS EC does,
at least), I believe the API in Linux does make a difference.  Why not
match the Linux API.  If Linux says that the backlight should be at
brightness 50 but should be off, set the brightness to 50 and turn the
backlight off.  If it says set the brightness to 0 and turn it on,
honor it.

I believe (but haven't tested) one side effect of the way you're doing
is is that:

set_brightness(50)
blank()
unblank()
get_brightness()

...will return 0, not 50.  I believe (but haven't tested) that if you
don't implement get_brightness() it would fix things,


> +static int ti_sn_backlight_update_status(struct backlight_device *bl)
> +{
> +       struct ti_sn_bridge *pdata = bl_get_data(bl);
> +       int brightness = bl->props.brightness;
> +
> +       if (bl->props.power != FB_BLANK_UNBLANK ||
> +           bl->props.fb_blank != FB_BLANK_UNBLANK ||
> +           bl->props.state & BL_CORE_FBBLANK) {

backlight_is_blank() instead of open-coding?  ...or you somehow don't
want the extra test for "BL_CORE_SUSPENDED" ?


> +               pdata->brightness = 0;

As per comments in ti_sn_backlight_update(), IMO you want to keep
enabled / disabled state separate from brightness.


> +       }
> +
> +       pdata->brightness = brightness;
> +
> +       return ti_sn_backlight_update(pdata);
> +}

Just to be neat and tidy, I'd expect something in the above would do a
pm_runtime_get_sync() when the backlight first turns on and
pm_runtime_put() when the backlight goes blank.  Right now you're
relying on the fact that the backlight is usually turned on later in
the sequence, but it shouldn't hurt to add an extra pm_runtime
reference and means you're no longer relying on the implicitness.
