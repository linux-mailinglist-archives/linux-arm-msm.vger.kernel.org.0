Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841B724211D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 22:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgHKUJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 16:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbgHKUJP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 16:09:15 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DBDFC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:09:14 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id s81so14126vkb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6qJqVdc/uC0k/47tmN/6OGWwLLeKwWyMRmMGNyMuMes=;
        b=H3ZdlnlZZbMSAPEofrl6nm6YexFFLFIlxi1eqa1GptjaFwv/xFa49I/fUr0oFBROIv
         9aU6FfSZBMqZYb8nS74vVLPJYMrj7tE81Xq79ZWbCcCyu4RRn0sOk9D/yKEs59P3iJcR
         14Kbt+2OH5xfn8oZtuAkZoCLV21W+/GQ320Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6qJqVdc/uC0k/47tmN/6OGWwLLeKwWyMRmMGNyMuMes=;
        b=sJFhdqrOs6+3UY3nQLnA8+O062CxajC8HmI9DO3ejorteiZss8Vbly5YzJdzX+yDtd
         ZvThXlFEb5+Y4RH9vKkKC11F0x3WI4BV7o1F1/csJEDKsJuhoTav9ZN+9B9sxKB+mYU3
         OOZN/8u5bszSK0Jq6goJ+16lx0Cr+zGE9VdrvqEk23Y9LQJeYhyLT+NCkw9ey3T6qvwY
         Jl0dcat9BCkNLL24uIhoE1AC11gsM+IkUM24DyXKwtEumdWmDAiAnyBVNJ6KiXqOJX7a
         aBBugBNu7lQPBdlJSCm/zj3spRplRepwv2Ae13hv+jLQljE+nDCycOrJUG7I3FeKYnoL
         Na3A==
X-Gm-Message-State: AOAM533y8RASI87pgGslcCMSSTtyHpSiGV7ZthyfDTYZDZYfVZ3g0uli
        ndiPcEO1V5PM/xNVdoMbfISkMRBqZVg=
X-Google-Smtp-Source: ABdhPJyrwLm0IDe4v0vXY8yQSiJh7dqQVdl5M9mH0TRZVnnv39KbEJ7kMVTt9GhEyMoSNDSU4vSgGg==
X-Received: by 2002:a1f:a402:: with SMTP id n2mr10296715vke.77.1597176553875;
        Tue, 11 Aug 2020 13:09:13 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id l84sm3287vkl.36.2020.08.11.13.09.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 13:09:13 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id b26so6634835vsa.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:09:12 -0700 (PDT)
X-Received: by 2002:a05:6102:213a:: with SMTP id f26mr25614974vsg.6.1597176552506;
 Tue, 11 Aug 2020 13:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-4-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1597058460-16211-4-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 11 Aug 2020 13:09:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XH3183sJiP68v_Ka2+b=rYb8Y=7G=RcdbxdsK+nzyW=g@mail.gmail.com>
Message-ID: <CAD=FV=XH3183sJiP68v_Ka2+b=rYb8Y=7G=RcdbxdsK+nzyW=g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and
 irq_resume_one() callbacks
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Aug 10, 2020 at 4:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> From: Douglas Anderson <dianders@chromium.org>
>
> The "struct irq_chip" has two callbacks in it: irq_suspend() and
> irq_resume().  These two callbacks are interesting because sometimes
> an irq chip needs to know about suspend/resume, but they are a bit
> awkward because:
> 1. They are called once for the whole irq_chip, not once per IRQ.
>    It's passed data for one of the IRQs enabled on that chip.  That
>    means it's up to the irq_chip driver to aggregate.
> 2. They are only called if you're using "generic-chip", which not
>    everyone is.
> 3. The implementation uses syscore ops, which apparently have problems
>    with s2idle.
>
> Probably the old irq_suspend() and irq_resume() callbacks should be
> deprecated.
>
> Let's introcuce a nicer API that works for all irq_chip devices.  This

You grabbed my patch (which is great, thanks!) but forgot to address
Stephen's early feedback from <https://crrev.com/c/2321123>.
Specifically:

s/introcuce/introduce


> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -468,10 +468,16 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
>   * @irq_bus_sync_unlock:function to sync and unlock slow bus (i2c) chips
>   * @irq_cpu_online:    configure an interrupt source for a secondary CPU
>   * @irq_cpu_offline:   un-configure an interrupt source for a secondary CPU
> + * @irq_suspend_one:   called on an every irq to suspend it; called even if
> + *                     this IRQ is configured for wakeup

s/called on an/called on

> + * @irq_resume_one:    called on an every irq to resume it; called even if
> + *                     this IRQ is configured for wakeup

s/called on an/called on


-Doug
