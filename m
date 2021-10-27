Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158A643CD00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 17:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242485AbhJ0PIo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 11:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242006AbhJ0PIj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 11:08:39 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5F6C061767
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 08:06:14 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id y1so2185451plk.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 08:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iJaFedjfgO3mNmh/C96uSOhUiL4aNQtn0C47wpwNS5I=;
        b=iVVFlAopGMkcd0hJu+/aKOZS9/FSNpWdZd1kDncujnrTaRWMIl4ygVplZCmy9QgKZY
         I60D6XySDqyzSLBmYS64MiRD/W1141i3Koe9x3WFMJkNZDwhu1wfkDN4AZwudkqyFN7m
         pma05zVPG7QH+a+O3TABH235+3jkQOClywd2PcOC/N8yhIkGXdRzjDq+NkWBdWIijNvf
         hvNhmtJedQXRIOfkXU6o+ipaxeoec2FfSS+rw9QunswdHWxq0wQiE5ZX5HyC2zUYUsYw
         j9JwyHMVAIHJgV+EbqwSBsYKGgdoSsvi5pHctY2zP3UgOTJqOC5faTpATZjOXE+DUhxR
         aC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iJaFedjfgO3mNmh/C96uSOhUiL4aNQtn0C47wpwNS5I=;
        b=tu0yrFZ8qirVX7c/yjdektsAPmFOVysvq+/q1thVTMWPiI27z7QTHofeAHs2erPsOC
         6nYaNBFgSecOnAPbKK2wRCQ/bnqfZyFtw+K1YEMMRFPTpNl8BqYk5v8Mp7na8O+tX+n4
         43hCs0GX/3S38fRtDcIe0cAEJtSavxTVvfofIYnp4JKfgGGy2Woy/Yf7vraFdvsmK2x9
         ywLEP34Tz/kdwZz+M00XFN05nZEtbesqtaz4+7HOS6eaS3ScjNAPxiGtA8kuVm4IVVPA
         QAloS9NQhcFmRSTAay8i7b+V3Je8MDynHyBlm9FtRI/TQUoAV5Ocl8ynHAJUUpIYNFLk
         wE5A==
X-Gm-Message-State: AOAM531yCm7jcw3+htSQc1Sq1Dd2s0+awgOyGwOXiDszCcvodEkgmCT1
        jPZY7PFZ/cggGNXwqfNKNZ7QK7vKBe/gWcZUxuan/O6LvawQMg==
X-Google-Smtp-Source: ABdhPJz8vpePzqPS0evtX4SnKhe7a/3eMQYQVPtaOBsulrZNJ4aqXPW9jO9ulnVJfxyOzxk45EsJg44EwOI93DtlxXM=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id na13mr6380872pjb.232.1635347173756;
 Wed, 27 Oct 2021 08:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211025170925.3096444-1-bjorn.andersson@linaro.org> <65243a98-61b9-3311-f41d-fa4782448baa@kali.org>
In-Reply-To: <65243a98-61b9-3311-f41d-fa4782448baa@kali.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 27 Oct 2021 17:06:02 +0200
Message-ID: <CAG3jFytmcFcA5W3vmcpWTWrc36-YFMPZ1wAB8gAJfiHHLWmaCA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] pwm: Introduce single-PWM of_xlate function
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Oct 2021 at 19:21, Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 10/25/21 12:09 PM, Bjorn Andersson wrote:
> > The existing pxa driver and the upcoming addition of PWM support in the
> > TI sn565dsi86 DSI/eDP bridge driver both has a single PWM channel and
> > thereby a need for a of_xlate function with the period as its single
> > argument.
> >
> > Introduce a common helper function in the core that can be used as
> > of_xlate by such drivers and migrate the pxa driver to use this.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > Tested-by: Steev Klimaszewski <steev@kali.org>
> > ---
> >
> > Changes since v6:
> > - None
> >
> >   drivers/pwm/core.c    | 26 ++++++++++++++++++++++++++
> >   drivers/pwm/pwm-pxa.c | 16 +---------------
> >   include/linux/pwm.h   |  2 ++
> >   3 files changed, 29 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index 4527f09a5c50..2c6b155002a2 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -152,6 +152,32 @@ of_pwm_xlate_with_flags(struct pwm_chip *pc, const=
 struct of_phandle_args *args)
> >   }
> >   EXPORT_SYMBOL_GPL(of_pwm_xlate_with_flags);
> >
> > +struct pwm_device *
> > +of_pwm_single_xlate(struct pwm_chip *pc, const struct of_phandle_args =
*args)
> > +{
> > +     struct pwm_device *pwm;
> > +
> > +     if (pc->of_pwm_n_cells < 1)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     /* validate that one cell is specified, optionally with flags */
> > +     if (args->args_count !=3D 1 && args->args_count !=3D 2)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     pwm =3D pwm_request_from_chip(pc, 0, NULL);
> > +     if (IS_ERR(pwm))
> > +             return pwm;
> > +
> > +     pwm->args.period =3D args->args[0];
> > +     pwm->args.polarity =3D PWM_POLARITY_NORMAL;
> > +
> > +     if (args->args_count =3D=3D 2 && args->args[2] & PWM_POLARITY_INV=
ERTED)
> > +             pwm->args.polarity =3D PWM_POLARITY_INVERSED;
> > +
> > +     return pwm;
> > +}
> > +EXPORT_SYMBOL_GPL(of_pwm_single_xlate);
> > +
> >   static void of_pwmchip_add(struct pwm_chip *chip)
> >   {
> >       if (!chip->dev || !chip->dev->of_node)
> > diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
> > index a9efdcf839ae..238ec88c130b 100644
> > --- a/drivers/pwm/pwm-pxa.c
> > +++ b/drivers/pwm/pwm-pxa.c
> > @@ -148,20 +148,6 @@ static const struct platform_device_id *pxa_pwm_ge=
t_id_dt(struct device *dev)
> >       return id ? id->data : NULL;
> >   }
> >
> > -static struct pwm_device *
> > -pxa_pwm_of_xlate(struct pwm_chip *pc, const struct of_phandle_args *ar=
gs)
> > -{
> > -     struct pwm_device *pwm;
> > -
> > -     pwm =3D pwm_request_from_chip(pc, 0, NULL);
> > -     if (IS_ERR(pwm))
> > -             return pwm;
> > -
> > -     pwm->args.period =3D args->args[0];
> > -
> > -     return pwm;
> > -}
> > -
> >   static int pwm_probe(struct platform_device *pdev)
> >   {
> >       const struct platform_device_id *id =3D platform_get_device_id(pd=
ev);
> > @@ -187,7 +173,7 @@ static int pwm_probe(struct platform_device *pdev)
> >       pc->chip.npwm =3D (id->driver_data & HAS_SECONDARY_PWM) ? 2 : 1;
> >
> >       if (IS_ENABLED(CONFIG_OF)) {
> > -             pc->chip.of_xlate =3D pxa_pwm_of_xlate;
> > +             pc->chip.of_xlate =3D of_pwm_single_xlate;
> >               pc->chip.of_pwm_n_cells =3D 1;
> >       }
> >
> > diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> > index 725c9b784e60..dd51d4931fdc 100644
> > --- a/include/linux/pwm.h
> > +++ b/include/linux/pwm.h
> > @@ -414,6 +414,8 @@ struct pwm_device *pwm_request_from_chip(struct pwm=
_chip *chip,
> >
> >   struct pwm_device *of_pwm_xlate_with_flags(struct pwm_chip *pc,
> >               const struct of_phandle_args *args);
> > +struct pwm_device *of_pwm_single_xlate(struct pwm_chip *pc,
> > +                                    const struct of_phandle_args *args=
);
> >
> >   struct pwm_device *pwm_get(struct device *dev, const char *con_id);
> >   struct pwm_device *of_pwm_get(struct device *dev, struct device_node =
*np,
>
> v7 of the series is tested by me on the Lenovo Yoga C630
>
> Tested-By: Steev Klimaszewski <steev@kali.org>
>

Applied to drm-misc-next.
