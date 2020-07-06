Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24B421603A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2020 22:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgGFUYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jul 2020 16:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgGFUYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jul 2020 16:24:34 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F41EC061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2020 13:24:34 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id g22so4696066vke.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2020 13:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DGql7KgjF3RRgjYDtLO8zSCx9KVGEva8Jd1iGMAKsuA=;
        b=XFn63Oot/wsEytB33U8ac66WHBUC15SLm8s9frUm+6TLATnElKo+THw+QkWGAtRjNC
         l3EfWubMzIa7XPYcMMYE+kaDG42fw4t3ZUcI2q/FAymaNfvCndJrMwKZzoL0RlgTOmy0
         rCHuNo3gjO+BTa9HzlNpm9WAQ9oWNcS8MlAvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DGql7KgjF3RRgjYDtLO8zSCx9KVGEva8Jd1iGMAKsuA=;
        b=SKBB+D1PNWHqkGCHltyj1IBWI7pTd7RpdmDIFOrAT00TcYUgJ5q4Ah/YVzN9QI/sAP
         CLmTwQnP593EdT+TZrOiAXp7ToACGALv3AjnDSoBKcRzzYLiGf6rOo8SF2zU6rbYx7kP
         Va54YHc1Sq7GJq7y8QPmloxZmXISXiW5Z7FmMcpRffQ0glRfGUx2OCgi3gWjVyssyRWr
         ExgMwypS2DHk929j9D6Vv7+ccFmkU9ZEVcW/iXoZ+Gvf+DMLpdG2MysL34dEIqxbTbnL
         sPnQE6BcXkKlFpN3gk4YjsbC3Oer25ZhAnC9rgropakld+FE2nBltYNPL7p1yFTXouEF
         ZySw==
X-Gm-Message-State: AOAM533LiHQpIZrJecVZleYVHPEdUIDQObRcLF9Tr8twzoHLZ37YNVw3
        EFwDg7zll1eQJlwhsqakXexqbeZbZeM=
X-Google-Smtp-Source: ABdhPJx8pjDfdEMdAXEG1W7OMy6q+zULRa1W6NkXz0WzXKNO8Y303ClT7L67ypQcWinMvz8vJ7CsfA==
X-Received: by 2002:a1f:ac51:: with SMTP id v78mr33737988vke.78.1594067072459;
        Mon, 06 Jul 2020 13:24:32 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id x79sm238523vsx.17.2020.07.06.13.24.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 13:24:31 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id m25so21275112vsp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2020 13:24:31 -0700 (PDT)
X-Received: by 2002:a05:6102:94:: with SMTP id t20mr22923661vsp.106.1594067070957;
 Mon, 06 Jul 2020 13:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <1593762506-32680-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1593762506-32680-1-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Jul 2020 13:24:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyhJ6g0DZS=ysT-AyXJoiRX=UFE9fXY2NEHfuUHYUXCQ@mail.gmail.com>
Message-ID: <CAD=FV=WyhJ6g0DZS=ysT-AyXJoiRX=UFE9fXY2NEHfuUHYUXCQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sc7180: Make gpio28 non wakeup capable
 for google,lazor
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        LinusW <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 3, 2020 at 12:49 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> The PDC irqchip driver currently does not handle dual-edge interrupts,
> and we have google,lazor board with sc7180 designed to configure gpio28
> as a dual-edge interrupt. This interrupt is however not expected to be
> wakeup capable on this board, so an easy way to fix this, seems to be to
> make this gpio non wakeup capable and let TLMM handle it (which is capable
> of handling dual-edge irqs)
>
> To be able to do so only on this board, so other boards designed with
> this SoC can continue to use gpio28 as a wakeup capable one, make a
> copy of msm_gpio_wakeirq_map for lazor and remove gpio28 from the
> list.
>
> Reported-by: Jimmy Cheng-Yi Chiang <cychiang@google.com>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7180.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> index 1b6465a..0668933 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> @@ -1135,7 +1135,24 @@ static const struct msm_gpio_wakeirq_map sc7180_pdc_map[] = {
>         {117, 114}, {118, 119},
>  };
>
> -static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
> +/* Dropped gpio28 from the map for the google,lazor board */
> +static const struct msm_gpio_wakeirq_map sc7180_lazor_pdc_map[] = {
> +       {0, 40}, {3, 50}, {4, 42}, {5, 70}, {6, 41}, {9, 35},
> +       {10, 80}, {11, 51}, {16, 20}, {21, 55}, {22, 90}, {23, 21},
> +       {24, 61}, {26, 52}, {30, 100}, {31, 33}, {32, 81},
> +       {33, 62}, {34, 43}, {36, 91}, {37, 53}, {38, 63}, {39, 72},
> +       {41, 101}, {42, 7}, {43, 34}, {45, 73}, {47, 82}, {49, 17},
> +       {52, 109}, {53, 102}, {55, 92}, {56, 56}, {57, 57}, {58, 83},
> +       {59, 37}, {62, 110}, {63, 111}, {64, 74}, {65, 44}, {66, 93},
> +       {67, 58}, {68, 112}, {69, 32}, {70, 54}, {72, 59}, {73, 64},
> +       {74, 71}, {78, 31}, {82, 30}, {85, 103}, {86, 38}, {87, 39},
> +       {88, 45}, {89, 46}, {90, 47}, {91, 48}, {92, 60}, {93, 49},
> +       {94, 84}, {95, 94}, {98, 65}, {101, 66}, {104, 67}, {109, 104},
> +       {110, 68}, {113, 69}, {114, 113}, {115, 108}, {116, 121},
> +       {117, 114}, {118, 119},
> +};
> +
> +static struct msm_pinctrl_soc_data sc7180_pinctrl = {
>         .pins = sc7180_pins,
>         .npins = ARRAY_SIZE(sc7180_pins),
>         .functions = sc7180_functions,
> @@ -1151,6 +1168,10 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
>
>  static int sc7180_pinctrl_probe(struct platform_device *pdev)
>  {
> +       if (of_machine_is_compatible("google,lazor")) {
> +               sc7180_pinctrl.wakeirq_map = sc7180_lazor_pdc_map;
> +               sc7180_pinctrl.nwakeirq_map = ARRAY_SIZE(sc7180_lazor_pdc_map);
> +       }

As much as I want patches landed and things working, the above just
doesn't feel like a viable solution.  I guess it could work as a short
term hack but it's going to become untenable pretty quickly.  As we
have more variants of this we're going to have to just keep piling
more machines in here, right?  ...this is also already broken for us
because not all boards will have the "google,lazor" compatible.  From
the current Chrome OS here are the compatibles for various revs/SKUs

compatible = "google,lazor-rev0", "qcom,sc7180";
compatible = "google,lazor-rev0-sku0", "qcom,sc7180";
compatible = "google,lazor", "qcom,sc7180";
compatible = "google,lazor-sku0", "qcom,sc7180";
compatible = "google,lazor-rev2", "qcom,sc7180";

...so of the 5 boards you'll only match one of them.


Maybe I'm jumping into a situation again where I'm ignorant since I
haven't followed all the prior conversation, but is it really that
hard to just add dual edge support to the PDC irqchip driver?  ...or
maybe it's just easier to change the pinctrl driver to emulate dual
edge itself and that can work around the problem in the PDC?  There
seem to be a few samples you could copy from:

$ git log --oneline --no-merges --grep=emulate drivers/pinctrl/
3221f40b7631 pinctrl: mediatek: emulate GPIO interrupt on both-edges
5a92750133ff pinctrl: rockchip: emulate both edge triggered interrupts

...and if you look at those two commits they refer to other examples.
The mediatek one says:

> This follows an example of drivers/gpio/gpio-mxc.c.

...and the Rockchip one says:

> implement a solution similar to pinctrl-coh901

That means you have at least 4 samples to look at?


-Doug
