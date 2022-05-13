Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8835260CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 13:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379869AbiEMLO7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 07:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379809AbiEMLOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 07:14:49 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D8E2A8044
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 04:14:44 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id x22so6544963qto.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SBDxVj1nmh6VS/RoV7L/XKPJo0ILCXguhigrIdGmn5Y=;
        b=ReHu/FYiQyhCdCYpDITJ2vI12co9Ze9xTJ8Y6j7h1wRL4O8jCdd2fk0ap0lr4Km73u
         x36a84TaLEqQH+IqYFAlkjO0bWmIPlcjQUgpA9S8C/0kBCKR7tnUZ/43A2TYdQNf6U1l
         itduEnqhN/tf0aEL7nzJl7dHutmcykroGXgqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SBDxVj1nmh6VS/RoV7L/XKPJo0ILCXguhigrIdGmn5Y=;
        b=yqx9gJL6nnXoazkaTY9RR/S0DoHnkUjx4VZup/QJbnbvXnmdrWNI2k0dov3NCPT2kq
         alplPc3cQXXxsLOp/55MZqSXgtrW1Ma8HtF0dILiOTiu0/f1XYdnxNNKaVucJa5PE7a+
         AAx2uzsJh0OREzzjAPLkavie3VtlAOMjhmAXmSYN01qs5KpGPsquDjw8uLDcYN9Ro8gr
         OPx4ScP93dVY28cAvGYwtY3+Jz5a06TWhAgyZUD+jPcPQ0AATp+C3SdYyw2xaMOHExxP
         F2DyoMQmNf5gGGdsFX16rwsgqEYz82xAQId9G2NpJLzqUVBBLZ4gTq4sD4g62hys67wi
         42CQ==
X-Gm-Message-State: AOAM533xWtm+Ozd4UfJqRQiZX+QGCllQLahtw+2VNjtfmct6vg2x+Y6X
        g9R1s2jc3ryic4lDUHwc7Uv1l1c4GoAAvTCwv568bw==
X-Google-Smtp-Source: ABdhPJwxVPEVNydnGVwXBgBU30xlh2RgrKVjgnTyhbuMIC9o6thUsWItM63n+TIVfXCyNgrZRKLSTLJqKzFK9pcAaoU=
X-Received: by 2002:a05:622a:18a7:b0:2f3:c715:caf1 with SMTP id
 v39-20020a05622a18a700b002f3c715caf1mr3904348qtc.226.1652440482977; Fri, 13
 May 2022 04:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220512162320.2213488-1-maz@kernel.org>
In-Reply-To: <20220512162320.2213488-1-maz@kernel.org>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Fri, 13 May 2022 20:14:32 +0900
Message-ID: <CAFr9PXnDqbgd4AebPQepWe5RF2utPcp2PJGoVhVNwX3ZZzsc-g@mail.gmail.com>
Subject: Re: [PATCH] gpio: Remove dynamic allocation from populate_parent_alloc_arg()
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel-team@android.com, Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Robert Richter <rric@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi March,

On Fri, 13 May 2022 at 01:23, Marc Zyngier <maz@kernel.org> wrote:
> diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
> index b2c90bdd39d0..52d7b8d99170 100644
> --- a/drivers/gpio/gpio-msc313.c
> +++ b/drivers/gpio/gpio-msc313.c
> @@ -550,15 +550,12 @@ static struct irq_chip msc313_gpio_irqchip = {
>   * so we need to provide the fwspec. Essentially gpiochip_populate_parent_fwspec_twocell
>   * that puts GIC_SPI into the first cell.
>   */
> -static void *msc313_gpio_populate_parent_fwspec(struct gpio_chip *gc,
> -                                            unsigned int parent_hwirq,
> -                                            unsigned int parent_type)
> +static int msc313_gpio_populate_parent_fwspec(struct gpio_chip *gc,
> +                                             union gpio_irq_fwspec *gfwspec,
> +                                             unsigned int parent_hwirq,
> +                                             unsigned int parent_type)
>  {
> -       struct irq_fwspec *fwspec;
> -
> -       fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
> -       if (!fwspec)
> -               return NULL;
> +       struct irq_fwspec *fwspec = &gfwspec->fwspec;
>
>         fwspec->fwnode = gc->irq.parent_domain->fwnode;
>         fwspec->param_count = 3;
> @@ -566,7 +563,7 @@ static void *msc313_gpio_populate_parent_fwspec(struct gpio_chip *gc,
>         fwspec->param[1] = parent_hwirq;
>         fwspec->param[2] = parent_type;
>
> -       return fwspec;
> +       return 0;
>  }
>
>  static int msc313e_gpio_child_to_parent_hwirq(struct gpio_chip *chip,

This bit looks fine to me. I will test it over the weekend.

Cheers,

Daniel
