Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD84E21E2E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 00:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgGMWSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 18:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgGMWR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 18:17:57 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E334C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:17:57 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id b24so4767671uak.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q6bh/1yGmZao7f6eku70ZfEjUaW4mF5NYpD2HrmZqeI=;
        b=j/XT5yyFl2LbkH2lZtHlwHq+F8pmbt1Tm85qFPI0z7iEFb3EPc0mzXcrqsqbTS90ZE
         m+To0qUhXZYncSMgOThqPs0W9mh1DSWxfcv8lMcNrpkhXIgav4O5Rdvp3cc2hXPZIt4/
         scL1jsPMSGprQyr2BJIXvr5HxYY7wWu9lH3s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q6bh/1yGmZao7f6eku70ZfEjUaW4mF5NYpD2HrmZqeI=;
        b=pzJiwEnJ5PZ6ibbP78VKDwGIhhqWiMM3d9jUw43Xu0QxWhjdKYHiDFKE5Gh15R6Qnb
         mYKrhjQvXK5sX6IxnDelDJi4E/jk/QpBAARUXCJgOS5vqZeDzt0CkpDt9JaWfypN/jAH
         2kXs8NCaHQaiwEzYFE1SEmHlM0c5igdSZnb2KIRQfrXYpibnfqZkw57MmZBcwGHywbfJ
         UZoRCO4nG/W4y31zv7z7sB4LP/NaHD4mB90YnPkCjIHkDv7uCb5H7V9/Bj6KnhzdvWTB
         KGSOX5Ip/7xxYUio4wmFxKMJGtccSOTKcd/bvXAxyvECHgHzYW/GshsvhvWORnbefGgp
         BUkQ==
X-Gm-Message-State: AOAM533R7K/SWJkwu7jCGvtzLpkBVWdK9SjxWdyHmoBi0AJ4LQhAej+E
        QZ8w6XfrvFH/0D3+W5nDi7hnyjVY0gY=
X-Google-Smtp-Source: ABdhPJxF0PRdZ06bUucuHQ6ldU0qBQYSuEkaQVSOrb/Jt4MCONXm//fH0wdPGTHVXfprgjmBHKwziw==
X-Received: by 2002:ab0:232:: with SMTP id 47mr1411368uas.48.1594678676294;
        Mon, 13 Jul 2020 15:17:56 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id x79sm1732529vsx.17.2020.07.13.15.17.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 15:17:55 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id d198so7500796vsc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:17:54 -0700 (PDT)
X-Received: by 2002:a05:6102:30b5:: with SMTP id y21mr1130601vsd.42.1594678673804;
 Mon, 13 Jul 2020 15:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org> <1592818308-23001-3-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1592818308-23001-3-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Jul 2020 15:17:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcKB0AbcYNymAbfvDac-8c3uGgOn3B1Q-U4d3ZrvGuag@mail.gmail.com>
Message-ID: <CAD=FV=WcKB0AbcYNymAbfvDac-8c3uGgOn3B1Q-U4d3ZrvGuag@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pinctrl: qcom: Add msmgpio irqchip flags
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

On Mon, Jun 22, 2020 at 2:32 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Add irqchip specific flags for msmgpio irqchip to mask non wakeirqs
> during suspend and mask before setting irq type.
>
> Masking before changing type should make sure any spurious interrupt
> is not detected during this operation.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 2419023..b909ffe 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1143,6 +1143,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>         pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
>         pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
>         pctrl->irq_chip.irq_set_vcpu_affinity = msm_gpio_irq_set_vcpu_affinity;
> +       pctrl->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND

I haven't tested it, but with my suggestion in patch #4 to use
irq_suspend and irq_resume, I presume adding IRQCHIP_MASK_ON_SUSPEND
is no longer needed?


> +                               | IRQCHIP_SET_TYPE_MASKED;

IIUC adding "IRQCHIP_SET_TYPE_MASKED" is unrelated to the rest of this
series, right?

-Doug
