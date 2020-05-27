Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAEB41E44C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 15:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388988AbgE0N4c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 09:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388709AbgE0N4c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 09:56:32 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2F9C08C5C3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 06:56:30 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z206so10870618lfc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=guH7o/1zYnrQw/f4NGxjhbP6GUVVrqoSi4RVWW1wiy4=;
        b=h/rFP5jU7cioPjV1DkfLT60l5HzFyDlE43d+yIyGjpfGLX2l3Efe85Ur+Ba64KLcoM
         zSYmCjOkxvc2ZeDK7/xCokEXGfmeESMxEhM1vFyZ4mm4OVpkfYIy0kTgHat70yi0Ebfh
         68eNZx98yKTvnu/hHahi3tJ2DC11bSZCNOB2nh/hZy5a7Je7cZbRmg0Segd0Iab7I/tD
         7ZYha8VDL6/NZ+JjecV+WhiRmjxXBoR/aC4fDyHB5sUCzU6KG+SAE2itO0Krph+MUMMM
         FGtepvb7QfEBglndReZsyTY+Q4Kt9DyQAdzaxgfPQa9ouzGJPES8JZJFix8W7ptVwJ21
         LXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=guH7o/1zYnrQw/f4NGxjhbP6GUVVrqoSi4RVWW1wiy4=;
        b=nYC23NZO3LCM4Wxfh7fDoqzd0U3Uk1yjcVMROGz6Vw5VS/uEFNIOqx2CpIsadJqVbF
         YGc9wKTEQTHEjBCQSM0go2l3berAxiTDSlpbOhzxjREr61a5Rte/9wPci7W92Wn3XDxV
         UR/FpWJ6HdnL14I3wBOHvF4tTX6r+emc5nTbQ5lTnVeHgWpwXrC/uhL7bnRXQwgNF1gS
         Xd0KeQgfOzf+NxMQcB+AMyLX2M8zNeWZgvtoHUVrEBB8g9245BT4xkNL3MBIZ4is5Lak
         3e3sdyRBogrnndp501eSFqVuATKiiYgQWqbyKMWiHISV4UeVqb9L+e9X0yGSRBLlILAI
         avTQ==
X-Gm-Message-State: AOAM530DFf78lNXUhySCAQPzZmSJDPUHx7N1U4RgCKt9CntadRz+BC0U
        cqZ1kCbDyJ+HMvBHtvWg+Dy/kB8vw5VOc8zE0SEFIw==
X-Google-Smtp-Source: ABdhPJxrYvCdWpEHRw3d7mzHw1j45r/ov/6G/cOSMxC5Z8VzEhLXjdUKpusqyG8DMTsrJLjU1wzwEFrlZvIRc1t0YLM=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr3207793lfn.77.1590587788858;
 Wed, 27 May 2020 06:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
 <1590253873-11556-2-git-send-email-mkshah@codeaurora.org> <CACRpkdba9j4EdCkD5OeL=3A4Zeb57vO78FAXA9fo0SOgBE57ag@mail.gmail.com>
 <3efa1f69-1e1d-f919-d47e-b4c5c73532b7@xs4all.nl>
In-Reply-To: <3efa1f69-1e1d-f919-d47e-b4c5c73532b7@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 15:56:16 +0200
Message-ID: <CACRpkdY3pJVvAi_a=pVVQQbQyA3_b=o2pJqb5W8Wivp-SSy+tA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Russell King <linux@armlinux.org.uk>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 27, 2020 at 12:38 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:

> However, I discovered that patch 256efaea1fdc ("gpiolib: fix up emulated
> open drain outputs") broke the cec-gpio driver on the Raspberry Pi starting
> with kernel v5.5.
>
> The CEC pin is an open drain pin that is used in both input and output
> directions and has an interrupt (which is of course disabled while in
> output mode).
>
> With this patch the interrupt can no longer be requested:
>
> [    4.157806] gpio gpiochip0: (pinctrl-bcm2835): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>
> [    4.168086] gpio gpiochip0: (pinctrl-bcm2835): unable to lock HW IRQ 7 for IRQ
> [    4.175425] genirq: Failed to request resources for cec-gpio@7 (irq 79) on irqchip pinctrl-bcm2835
> [    4.184597] cec-gpio: probe of cec-gpio@7 failed with error -5

There is nothing conceptually wrong with that patch so I think we
need to have the irqchip code check if it is input *OR* open drain.

I'll send a separate patch for this, it should be an easy fix.

Yours,
Linus Walleij
