Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 853DD193499
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 00:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgCYXcL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 19:32:11 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34286 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbgCYXcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 19:32:11 -0400
Received: by mail-lj1-f195.google.com with SMTP id p10so4247660ljn.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2020 16:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pz27N0s4bGqH38nVVinTBm250zTTCRPj61s65LyetcI=;
        b=oYlq9hh8/Gm/GSnuSQ/qhFMJzCvCTbM2E8LCW7ECvEPoGwPzJEaEPEZTfFFOti0HIo
         iixVNgOlh+cRVQY4Btmg658tF7b3EvFUF4NFLZO+TEJIedkrMJn4ESbkJ6C6buL0HvAB
         p7/R6klzpdVBtLs3Hq32KTzADXqpD7GxgRRSmDMRg4xhD/8YuqcnGo0yJPyt2c/8pn4V
         oPikUzntwzEJf5PYkdQk4bzMkVqaGuNH8B2zsejRqZZhQzBuf5ZwCZwoBrgHfM6A0h8m
         3Hhp3mDku8/QWsVgHZ7TYX29HS3vStwruDnPZzDvwL/444YpcDwXgwYZBgObnNh7lsUP
         NqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pz27N0s4bGqH38nVVinTBm250zTTCRPj61s65LyetcI=;
        b=iMvtembtH+sdSZd1utkyl1MhU/f672QkJG5EmU3hls1IYxPKSWOFOyrmYOLFybw6+1
         6Pl/GT12cg8QhGwMoB9zl/nNVoTPbZmsGPws0wM5+LvdrdyYJdNiXsjDd8hPEinZvjLI
         z78R/hpPtTuQ77o0+9f1kknwptcHwnwblYy1pRORhFR8n+68q9wzpSFsBCmu1Am8FKoo
         pXacU9vCij/HOyiNoVa4kTutNxuImnApj31FFNqUT1NMtzfOcblH5Vjv/uuKnEptxsUL
         kroNzHW8ovaNf6SZsPfx0uDgo+j65ngnYPfjvDWbm2K44/j9c+mdWar5dhrqW16b2KAO
         M7Lg==
X-Gm-Message-State: AGi0PubrF45g3LLLoffnnrMSM6e/0+Bs/1I85oYNSJ1Icq+2UD+UoREQ
        lLy+6pf4yhov00qSxI4Rp7Nxb2uax+/oAF71smU6ZQ==
X-Google-Smtp-Source: ADFU+vvXIlLAfb8Xes354yKGGFdqP+RtXwv/3ffUwqUHgps7GAEJ4AW0bT2D5wlGkKjN1zULPZwmyJMihIfPrh93b3M=
X-Received: by 2002:a05:651c:1026:: with SMTP id w6mr3350282ljm.168.1585179128988;
 Wed, 25 Mar 2020 16:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200313191513.11365-1-ansuelsmth@gmail.com>
In-Reply-To: <20200313191513.11365-1-ansuelsmth@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Mar 2020 00:31:57 +0100
Message-ID: <CACRpkdYvCHB_1FkHft3875iNZm9cGizFVLQQR56Lr95tEB_kwg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: use scm_call to route GPIO irq to Apps
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 13, 2020 at 8:15 PM Ansuel Smith <ansuelsmth@gmail.com> wrote:

> For IPQ806x targets, TZ protects the registers that are used to
> configure the routing of interrupts to a target processor.
> To resolve this, this patch uses scm call to route GPIO interrupts
> to application processor. Also the scm call interface is changed.
>
> Signed-off-by: Ajay Kishore <akisho@codeaurora.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

That's advanced. I'd really like Bjorn's review on this.

> +       ret = of_device_is_compatible(pctrl->dev->of_node,
> +                                       "qcom,ipq8064-pinctrl");
>         /* Route interrupts to application cpu */
> -       val = msm_readl_intr_target(pctrl, g);
> -       val &= ~(7 << g->intr_target_bit);
> -       val |= g->intr_target_kpss_val << g->intr_target_bit;
> -       msm_writel_intr_target(val, pctrl, g);
> +       if (!ret) {

Can't you just:

if (!of_device_is_compatible(pctrl->dev->of_node, "qcom,ipq8064-pinctrl")) {

OK maybe nitpicky.

> +               val = msm_readl_intr_target(pctrl, g);
> +               val &= ~(7 << g->intr_target_bit);
> +               val |= g->intr_target_kpss_val << g->intr_target_bit;
> +               msm_writel_intr_target(val, pctrl, g);
> +       } else {
> +               const __be32 *reg = of_get_property(pctrl->dev->of_node,
> +                                                   "reg", NULL);
> +
> +               if (reg) {
> +                       u32 addr = be32_to_cpup(reg) + g->intr_target_reg;
> +
> +                       qcom_scm_io_readl(addr, &val);
> +                       __iormb();
> +
> +                       val &= ~(7 << g->intr_target_bit);
> +                       val |= g->intr_target_kpss_val << g->intr_target_bit;
> +
> +                       __iowmb();
> +                       ret = qcom_scm_io_writel(addr, val);
> +                       if (ret)
> +                               pr_err("\n Routing interrupts to Apps proc failed");
> +               }

Can we at least put a little comment on top here and explain what is
going on?

Yours,
Linus Walleij
