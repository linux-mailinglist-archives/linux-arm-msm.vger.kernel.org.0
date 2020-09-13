Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552CF2681EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 01:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgIMXw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 19:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgIMXw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 19:52:56 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0A3C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 16:52:56 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id m12so13355557otr.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 16:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cjTC+eAJra0bRI0RrkCBQx4hFPfWWvTFYjqreZqxCXI=;
        b=KaQJKv1xFYknURe9W6Dh7XU2NUJXgh5zvgZeVFj+Gw8vaNFKj1T9Xn4JhNrb7XpqaW
         o4Chdb/S/IawfuQzcZZlriYUVHs3RYkm8gfn+0yf14LjaMB0LgVSqnQj8tYTy4EdJTgM
         OvmnRtk918LDQJrnFr02s/04SGPvvfXJGVssxTWTnJGoun+3W2UHX5IwuWKG6Rc+wjk0
         6abQvt/3c80RipBQhUSDHGnsit8Hxp79+dZReMtGw0aHvEChdez8Wthd3BWS7nNYyKye
         E5AiYwsnYWLVuV9S85ciBib1aWf2z7U3jQkueIS9xo12uyR5rmPmpCyZWuiWjFr/mrc0
         G5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cjTC+eAJra0bRI0RrkCBQx4hFPfWWvTFYjqreZqxCXI=;
        b=X2oHY8IUfJ2l7raaAu7OoYzg/yfzhJ/56IbTxyLFxvXrTFx9HD/1ZzuG7rIOlHxAh9
         bEvfYrP+hO/KLWkB2KxHYInHEg0N2EoJi2fbwT2CTsmnEpCliq662COamNJhWLN/WH0m
         1zH9gfr3I/r823idS4fLKNfoZHbg8xjLw37s+tszOc99z0cbM2TK+W3y84nv8JFKNYIh
         2kwTLAikXFwa0HzpAnpcJXivlaK496qbmYkPAwmGO0Vd6Onw2fuepctr0gk8XDv+NK3L
         R7nK/LrU+zois3RjiPbUwRPZGE7P3JB83FLaFW8PeCh5jeEDo/7JJeV7mZE9M4X3kJRF
         NCzA==
X-Gm-Message-State: AOAM530hrT5Gw7AMewNkObpzBIyP8u39YIxBbVfBvbm6wjHamffnpONu
        BVNYVqcVh1PbcaaWjYmXT/z4xDaKXyEhNb/rE/CeKQ==
X-Google-Smtp-Source: ABdhPJzpwqRbvojg2vTRIJFfZBxWJcdxeZPcUZeBj07YoHaky3SSJXmPPn07SMWVvBg1JGA2cHJo/s21kYtUC9jrS04=
X-Received: by 2002:a9d:6010:: with SMTP id h16mr7669191otj.262.1600041172616;
 Sun, 13 Sep 2020 16:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200913225005.30218-1-dmitry.baryshkov@linaro.org> <20200913234452.GX3715@yoga>
In-Reply-To: <20200913234452.GX3715@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 14 Sep 2020 02:52:41 +0300
Message-ID: <CAA8EJpqCm3zF32qeEX3UR-FjXk1-_cgmEnW6h9aG9aDMp3ZXcw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sm8250: correct sdc2_clk and ngpios
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Mon, 14 Sep 2020 at 02:44, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sun 13 Sep 17:50 CDT 2020, Dmitry Baryshkov wrote:
>
> > Correct sdc2_clk pin definition (register offset) and ngpios (SM8250 has
> > 180 GPIO pins).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a
> > ---
> >  drivers/pinctrl/qcom/pinctrl-sm8250.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> > index a660f1274b66..4f7dae61b089 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> > @@ -1308,7 +1308,7 @@ static const struct msm_pingroup sm8250_groups[] = {
> >       [178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
> >       [179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
> >       [180] = UFS_RESET(ufs_reset, 0xb8000),
> > -     [181] = SDC_PINGROUP(sdc2_clk, 0x7000, 14, 6),
> > +     [181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),
>
> You're right.
>
> >       [182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
> >       [183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
> >  };
> > @@ -1320,7 +1320,7 @@ static const struct msm_pinctrl_soc_data sm8250_pinctrl = {
> >       .nfunctions = ARRAY_SIZE(sm8250_functions),
> >       .groups = sm8250_groups,
> >       .ngroups = ARRAY_SIZE(sm8250_groups),
> > -     .ngpios = 181,
> > +     .ngpios = 180,
>
> But, while it is correct that SM8250 only has 180 GPIOs, we're exposing
> UFS_RESET as a gpio as well, so this should therefor be 181. Sorry for
> the obfuscation here...

True. Could you please drop the second part of the patch on your own?
Or would you prefer for me to send v2?



-- 
With best wishes
Dmitry
