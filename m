Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBF2442242
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 22:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhKAVHY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 17:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbhKAVHX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 17:07:23 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B894DC061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 14:04:49 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id h81so14363417iof.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 14:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65jDPfBpqzh1SVGsQCqxZHrsT33rrJhILf2Fclkb08g=;
        b=CDgNHzQhfNf1YPq2tYY+/T0WtRXHC1qbzcm3IQ3yj+OmPjRmzY8p1i/x714lGiB0lj
         3XvAC7XW2LLwLqdemgGnmisO8yX0Z4RyURcFcLMNm940Y7hJBzjTiGyGSLFaFxAzXrWV
         WZ2IJWLlizZtfqHCSRiKmo/djbib8Qelp+vek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65jDPfBpqzh1SVGsQCqxZHrsT33rrJhILf2Fclkb08g=;
        b=AkxLynWZNHr3OUj4I1jFpEleTy+5918+6DX5XpdrFDokCnI+miqDSmQW9zcSB8h7zu
         jPPLJ3qXLkGeneUPWb4DDCWC0IHxD/Gvq/Pkjid9SMqmzZaRLXu8fabpxQJDri8WmnFp
         SUHHhpmxqsVLKhQ13zCnBO/xJ5qygw4pMh7UxXEItMvGRzjSqBt4wxdNYpQPwW4DvudE
         40tDYIGS+udmYLpcc+pp7TuAqDojYQLl56GOnFeXOn5vLxw3BLYzPvM19YdhMQupmYm4
         UoK/NIilFCRcU8X/FMxijOJQUscdhUZkF+c73K6hyMEDEctKJAy+QG4rbMQW9OzHZp4j
         CEqA==
X-Gm-Message-State: AOAM533ZrA/eAwa/j6NUlwl5nzDK15w4HeQNQcseo1aaecbirGfppwFN
        UFAvFWL27k3cPvujDfoXRb11hpwWk0Vo9A==
X-Google-Smtp-Source: ABdhPJxRX5v77F+c+vxsnyZwj3ELwJ2+9Wm/sTugihcA8dsqkSq8h4vGvOL98cOyohPbdrtn14BP+w==
X-Received: by 2002:a05:6638:1924:: with SMTP id p36mr13700543jal.96.1635800688588;
        Mon, 01 Nov 2021 14:04:48 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id f11sm5834960ilu.82.2021.11.01.14.04.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 14:04:48 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id k1so4530788ilo.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 14:04:48 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a67:: with SMTP id w7mr15354968ilv.165.1635800686977;
 Mon, 01 Nov 2021 14:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 1 Nov 2021 14:04:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UoTFzZn5h_VNrwrt2E5P2k9WmqZ7nXFLDHyMzUvSzhUA@mail.gmail.com>
Message-ID: <CAD=FV=UoTFzZn5h_VNrwrt2E5P2k9WmqZ7nXFLDHyMzUvSzhUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add egpio feature support
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Oct 26, 2021 at 5:09 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> From: Prasad Sodagudi <psodagud@codeaurora.org>
>
> egpio is a scheme which allows special power Island Domain IOs
> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
> TLMM functions with Island Domain functions.
> With this scheme, an IO can be controlled both by the cpu running
> linux and the Island processor. This provides great flexibility to
> re-purpose the Island IOs for regular TLMM usecases.
>
> 2 new bits are added to ctl_reg, egpio_present is a read only bit
> which shows if egpio feature is available or not on a given gpio.
> egpio_enable is the read/write bit and only effective if egpio_present
> is 1. Once its set, the Island IO is controlled from Chip TLMM.
> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
>
> To support this we add a new function 'egpio' which can be used to
> set the egpio_enable to 0, for any other TLMM controlled functions
> we set the egpio_enable to 1.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 17 +++++++++++++++--
>  drivers/pinctrl/qcom/pinctrl-msm.h |  4 ++++
>  2 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 8476a8a..bfdba3a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -185,6 +185,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>         unsigned int irq = irq_find_mapping(gc->irq.domain, group);
>         struct irq_data *d = irq_get_irq_data(irq);
>         unsigned int gpio_func = pctrl->soc->gpio_func;
> +       unsigned int egpio_func = pctrl->soc->egpio_func;
>         const struct msm_pingroup *g;
>         unsigned long flags;
>         u32 val, mask;
> @@ -218,8 +219,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>         raw_spin_lock_irqsave(&pctrl->lock, flags);
>
>         val = msm_readl_ctl(pctrl, g);
> -       val &= ~mask;
> -       val |= i << g->mux_bit;
> +
> +       if (egpio_func && i == egpio_func) {
> +               if (val & BIT(g->egpio_present))
> +                       val &= ~BIT(g->egpio_enable);
> +               else
> +                       return -EINVAL;
> +       } else {
> +               val &= ~mask;
> +               val |= i << g->mux_bit;
> +               /* Check if egpio present and enable that feature */
> +               if (egpio_func && (val & BIT(g->egpio_present)))
> +                       val |= BIT(g->egpio_enable);
> +       }
> +
>         msm_writel_ctl(val, pctrl, g);
>
>         raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index e31a516..b7110ac 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -77,6 +77,8 @@ struct msm_pingroup {
>         unsigned drv_bit:5;
>
>         unsigned od_bit:5;
> +       unsigned egpio_enable:5;
> +       unsigned egpio_present:5;
>         unsigned oe_bit:5;
>         unsigned in_bit:5;
>         unsigned out_bit:5;
> @@ -119,6 +121,7 @@ struct msm_gpio_wakeirq_map {
>   *                            to be aware that their parent can't handle dual
>   *                            edge interrupts.
>   * @gpio_func: Which function number is GPIO (usually 0).
> + * @egpio_func: Which function number is eGPIO

nit: in the above, document that this is actually a _virtual_ number.
In other words it doesn't actually map to any real hardware register
setting. Also maybe document 0 here means that eGPIO isn't supported
on this SoC. ...and lastly, all the other entries in this docstring
end with a ".". Something roughly like this:

 * @egpio_func: If non-zero then this SoC supports eGPIO. Even though in
                hardware this is a mux 1-level above the TLMM, we'll treat
                it as if this is just another mux state of the TLMM. Since
                it doesn't really map to hardware, we'll allocate a virtual
                function number for eGPIO and any time we see that function
                number used we'll treat it as a request to mux away from
                our TLMM towards another owner.

Thinking about this made me look a little closer at your virtual
function number, though. On sc7280 (in the next patch) you chose
function "9" as GPIO. Things smell a little strange, though.
Apparently sc7280 was already setup for a non-virtual "function 9"
since "nfuncs" was 10. Was this just a fortunate bug that kept you
from having to touch all the sc7280 PINGROUP definitions in the next
patch, or is there actually a true "function 9" somewhere in the
hardware that we might want to someday add to Linux? If so, should we
pick eGPIO as 10?

...and then, looking further, what would happen if we picked eGPIO 10?
Should "nfuncs" include this virtual number, or not? If "nfuncs"
_does_ include this number and it bumps you over to the next
"order_base_2" then the mask calculated by msm_pinmux_set_mux() will
be wrong. If "nfuncs" _doesn't_ include this number then we should
probably document that fact, and (I suppose) change sc7280's "nfuncs"
down to 9?


-Doug
