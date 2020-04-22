Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5C71B3F35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 12:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgDVKfp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 06:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730344AbgDVKX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 06:23:29 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FAFC03C1AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:23:28 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f8so763646plt.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=WRRFLMP1BZKaT01S2NP0T7yJMR9Vv9XgNrqlamOXvlk=;
        b=h2u4L54UOBk5bt6yv8RXgBBHJazXRBpDVcwKdGjQh8rJdtnaRazSV/jGVNL229gKug
         KO4ju7yXSfaW2KATsjEEa2gdlizp+eNdhoRtNbGfw/i16Vie+HMSKHFQhAPxa0WVwMz3
         dTtWlPOFZBnGd6uMIQ6/7SRFss6P5y7pOQPzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=WRRFLMP1BZKaT01S2NP0T7yJMR9Vv9XgNrqlamOXvlk=;
        b=XlqRhOPkGmUjzXfRiPAPnvVrOZ2X3P2OAg+dU1pS+4uNYuEe6rs8Scm+CvluJoEgwr
         X3jJK38X3T+yfC8pDnBG6r0NKm+TuwwmrMKgBDsq+Pggizvwpvg3gWtZKc6r5K+8gWHk
         kjlkY187P6uPZ1hpMfOOKDJq3nGtn1odUl9FdvlnIDfb+8w2qwds67APQsXRwjl7h7De
         Bj/E85bzR2M+fosN2YUWoYAvk8M5vCTEwn8SCUmd1MRABIkJ9V+no3UYfDgfqFn0fnYi
         +tp8Fo+BWDazD+Fkckvsag08l3v/v+2dWw4ji0iNWKW2K4Izrc95B3y4LiIv5H2Xw/PH
         JcIA==
X-Gm-Message-State: AGi0PubjqjsYjaZbuNNlEMxJwjV2loxa4pSAWYWhR1rx459DZuB0dHTI
        gw2KM0v4cm+OoR56gH6RxAFMPg==
X-Google-Smtp-Source: APiQypIlibtTzWoHaOZSF9q8way5d7W2yJSRS6zaspDWYgGUnJV4TbKw4SlxZxjRNZrPc7P2cqeBag==
X-Received: by 2002:a17:90a:b10f:: with SMTP id z15mr9879288pjq.188.1587551008343;
        Wed, 22 Apr 2020 03:23:28 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x12sm4998977pfq.209.2020.04.22.03.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:23:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200420220458.v2.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
References: <20200421050622.8113-1-dianders@chromium.org> <20200420220458.v2.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
Subject: Re: [PATCH v2 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        jernej.skrabec@siol.net, bjorn.andersson@linaro.org,
        robdclark@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, bgolaszewski@baylibre.com, daniel@ffwll.ch,
        linus.walleij@linaro.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Wed, 22 Apr 2020 03:23:26 -0700
Message-ID: <158755100643.159702.17904334834962681759@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-20 22:06:17)
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> be used as GPIOs in a system.  Each pin can be configured as input,
> output, or a special function for the bridge chip.  These are:
> - GPIO1: SUSPEND Input
> - GPIO2: DSIA VSYNC
> - GPIO3: DSIA HSYNC or VSYNC
> - GPIO4: PWM
>=20
> Let's expose these pins as GPIOs.  A few notes:
> - Access to ti-sn65dsi86 is via i2c so we set "can_sleep".
> - These pins can't be configured for IRQ.
> - There are no programmable pulls or other fancy features.
> - Keeping the bridge chip powered might be expensive.  The driver is
>   setup such that if all used GPIOs are only inputs we'll power the
>   bridge chip on just long enough to read the GPIO and then power it
>   off again.  Setting a GPIO as output will keep the bridge powered.
> - If someone releases a GPIO we'll implicitly switch it to an input so
>   we no longer need to keep the bridge powered for it.
>=20
> Becaue of all of the above limitations we just need to implement a

Because

> bare-bones GPIO driver.  The device tree bindings already account for
> this device being a GPIO controller so we only need the driver changes
> for it.
>=20
> NOTE: Despite the fact that these pins are nominally muxable I don't
> believe it makes sense to expose them through the pinctrl interface as
> well as the GPIO interface.  The special functions are things that the
> bridge chip driver itself would care about and it can just configure
> the pins as needed.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>=20

Cool patch.

> Changes in v2:
> - ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")
>=20
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 165 ++++++++++++++++++++++++++
>  1 file changed, 165 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 6ad688b320ae..d04c2b83d699 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -874,6 +886,153 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn=
_bridge *pdata)
>         return 0;
>  }
> =20
> +static struct ti_sn_bridge *gchip_to_pdata(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct ti_sn_bridge, gchip);
> +}
> +
> +static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
> +                                          unsigned int offset)
> +{
> +       struct ti_sn_bridge *pdata =3D gchip_to_pdata(chip);
> +
> +       return (atomic_read(&pdata->gchip_output) & BIT(offset)) ?

Any reason this isn't a bitmap?

> +               GPIOF_DIR_OUT : GPIOF_DIR_IN;

And why can't we read the hardware to figure out if it's in output or
input mode?

> +}
> +
[...]
> +static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
> +                                             unsigned int offset, int va=
l)
> +{
> +       struct ti_sn_bridge *pdata =3D gchip_to_pdata(chip);
> +       int shift =3D offset * 2;
> +       int old_gchip_output;
> +       int ret;
> +
> +       old_gchip_output =3D atomic_fetch_or(BIT(offset), &pdata->gchip_o=
utput);

I presume gpiolib is already preventing a gpio from being modified twice
at the same time. So is this atomic stuff really necessary?

> +       if (old_gchip_output & BIT(offset))
> +               return 0;
> +
> +       pm_runtime_get_sync(pdata->dev);
> +
> +       /* Set value first to avoid glitching */
> +       ti_sn_bridge_gpio_set(chip, offset, val);
> +
> +       /* Set direction */
> +       ret =3D regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> +                                0x3 << shift, SN_GPIO_MUX_OUTPUT << shif=
t);
> +       if (ret) {
> +               atomic_andnot(BIT(offset), &pdata->gchip_output);
> +               pm_runtime_put(pdata->dev);
> +       }
> +
> +       return ret;
> +}
> +
> +static void ti_sn_bridge_gpio_free(struct gpio_chip *chip, unsigned int =
offset)
> +{
> +       /* We won't keep pm_runtime if we're input, so switch there on fr=
ee */
> +       ti_sn_bridge_gpio_direction_input(chip, offset);
> +}
> +
> +static const char * const ti_sn_bridge_gpio_names[] =3D {
> +       "GPIO1", "GPIO2", "GPIO3", "GPIO4"
> +};
> +
> +static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
> +{
[...]
> +       pdata->gchip.names =3D ti_sn_bridge_gpio_names;
> +       pdata->gchip.ngpio =3D ARRAY_SIZE(ti_sn_bridge_gpio_names);
> +       ret =3D devm_gpiochip_add_data(pdata->dev, &pdata->gchip, pdata);
> +       if (ret) {
> +               dev_err(pdata->dev, "can't add gpio chip\n");
> +               return ret;
> +       }
> +
> +       return 0;

return ret?

> +}
> +
>  static int ti_sn_bridge_probe(struct i2c_client *client,
>                               const struct i2c_device_id *id)
>  {
