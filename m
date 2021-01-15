Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661C12F705D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 03:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731849AbhAOCJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 21:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731846AbhAOCJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 21:09:16 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F5DC061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 18:08:36 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id y12so4197371pji.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 18:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=s4glimfX6ZrQ7lXIX7N60ewBb6BcNo8mLwcaocWfkJs=;
        b=dY9OunBvsaqpupDqw3wIfJ59xluWzpOXkKsWrHiV1VSh7kJngUXFqL48GWAURzSM2+
         A39t0pz/abgIGYobx75srbeUK1CwzdLdlaHYFRlD5WzvWdz0GKAKUUXi6Cgojm5o3txs
         oJ51aXxaKp7Dg03GutCJzeQFtpXQHSvl/m9sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=s4glimfX6ZrQ7lXIX7N60ewBb6BcNo8mLwcaocWfkJs=;
        b=Sm4cCJPgCnhxH9Vc8Vf8Lx5zS1J7Krw/Ga0+ImWcJapiArW/94mVLygnDnf7EBl3Ux
         umidsbjgpVdtot92htQBy3gomAZOWrNFYvJg3+Uyg49lxYBg8eIGjaWjyUZVSV57khnw
         pf2iZgmt63sood7QNMekLPDKqaj3FdEypJIsaGO5X/TL/weUpKEVT3jkyzKdG/MD9NCB
         69lXFXMhq8+WesoAiiShImxaa604G2fpZb6RMslc1AfgR3BOTUsSvhR+bvcraxyGgRO/
         vHctj8HLbfrxkBP6OD4A6Wh5qKwk3tIEXSFk2s5pxzZwap0pMPs0CS1h+SSA4nj+Mjty
         SM3w==
X-Gm-Message-State: AOAM532X01g8gqgqpKguFfqWrmHubRXxsTfBxXOaN01YSMjKjTlh7pgk
        9iYDFLXT2s9VWaWCF1d6KzIbww==
X-Google-Smtp-Source: ABdhPJy310EDfrLfGpIKbZ8t+e/T4xlaUFlgpdfagBPjUnLp0m+FQ7SHjGS9SyEFYn6hVflloBwVeQ==
X-Received: by 2002:a17:90a:6fe4:: with SMTP id e91mr6532625pjk.39.1610676515759;
        Thu, 14 Jan 2021 18:08:35 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id o32sm7204075pgm.10.2021.01.14.18.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 18:08:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114154004.v6.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
References: <20210114154004.v6.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid> <20210114154004.v6.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
Subject: Re: [PATCH v6 4/4] pinctrl: qcom: Don't clear pending interrupts when enabling
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Neeraj Upadhyay <neeraju@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Thu, 14 Jan 2021 18:08:33 -0800
Message-ID: <161067651323.3661239.14709087785393568909@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-01-14 15:40:27)
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 192ed31eabf4..712a693425fc 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1097,16 +1128,11 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
>         }
> =20
>         /*
> -        * Clear the interrupt that may be pending before we enable
> -        * the line.
> -        * This is especially a problem with the GPIOs routed to the
> -        * PDC. These GPIOs are direct-connect interrupts to the GIC.
> -        * Disabling the interrupt line at the PDC does not prevent
> -        * the interrupt from being latched at the GIC. The state at
> -        * GIC needs to be cleared before enabling.
> +        * The disable / clear-enable workaround we do in msm_pinmux_set_=
mux()
> +        * only works if disable is not lazy since we only clear any bogus
> +        # interrupt in hardware. Explicitly mark the interrupt as UNLAZY.

Ah! What is # doing there?

>          */
> -       if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> -               irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
> +       irq_set_status_flags(d->irq, IRQ_DISABLE_UNLAZY);
>
