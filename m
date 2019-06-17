Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B422B48141
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 13:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfFQLuW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 07:50:22 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35206 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfFQLuW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 07:50:22 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so9013306ljh.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 04:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jUC3oAv954DDdM3Qoub7t5o8CIOFNWz/tUxECd+JQ9s=;
        b=BuTo/QN7Xsk7pkbu1e9KTEhJat0l1vZhloCRxm0xW7p0PHAtECvTmN4DyRUvWnjY7F
         425/HzaReo/WGxA2vRP+9whOnA8l5R7G/hCUShepGlHEpyWlnF0+klfqxV0Zkhi8Bz+0
         jV4gq1J37BAZ3kW71udx4PVHTSDbvB43bURTwX7+6ZvcQpXKeN2toNqRAhr7RformkLw
         6pgUeq7MQcctyJamYjgMyuyaJSaXDbS9aSDe2bU6HRcHWNpFKZb1PUVZ5EBagKifKxOf
         +jrOWqbqJ4KyIlrZlv7VHhbJJqtfvDqgRIULjvBBernbELvj0uJYjzQabAfqGTX916DY
         uIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jUC3oAv954DDdM3Qoub7t5o8CIOFNWz/tUxECd+JQ9s=;
        b=ns20LBVPPMjeuluW+DUprhw/AfbB7mWDUjZaxm0sP2hbgIDolMM1FudR1IS16Y4wlq
         7HNO7YQD43ybFQWDN8tS+cj8+a4cUtyUv8dgrM0pDp57ZBLH5bjoDeyFsQEqNmI3kVur
         jsjA2M2G4vZTlt4iL/txH00YaS2ER/ZKWBsVRDydzkF3LnS/jxB0YNWE++uLRYk/LK5o
         h4SIbNsJ/ILdVYtKqPpEt/pgtsT1lsP87PcEo5BwNeKgwkKpq9rbhRLJL8PRxunxMNAj
         V7Srsqabm8jPuOWX4OrTv+ZsIp7JpZqBSBTAn+ydToFrZe80Aw0z4it6itWMW9asUL4h
         cnFQ==
X-Gm-Message-State: APjAAAWR70yKna6KBkvJfGpsyyh4zgTAaF9SSwGNSB5oyZu2WsClFGpo
        om0B+cyIAN9JUlIns28UgrpGSDM2GJMnwRuDJyXZjw==
X-Google-Smtp-Source: APXvYqxc9icfPV6JO31y7/yaQv+ExXgLV0eomSpNfThNBkfv0HxBRb+mT8ya0W5DCcu8LUONsl0ZC4+8TIbqz0JTEG0=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr29112501ljm.180.1560772220963;
 Mon, 17 Jun 2019 04:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190611185102.368ED21744@mail.kernel.org> <671f87d6-f4a4-6d2c-967b-e1aa0677d83e@codeaurora.org>
 <b0fdbcb1-4d5d-5c60-4150-7762a577cd10@codeaurora.org>
In-Reply-To: <b0fdbcb1-4d5d-5c60-4150-7762a577cd10@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Jun 2019 13:50:09 +0200
Message-ID: <CACRpkdahUNNOhQdri3T86jHr+qOBmXH61_AMmoWpv_be2koMrw@mail.gmail.com>
Subject: Re: Fwd: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
To:     Neeraj Upadhyay <neeraju@codeaurora.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Tengfei Fan <tengfeif@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, sramana@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 17, 2019 at 12:35 PM Neeraj Upadhyay <neeraju@codeaurora.org> wrote:

> Hi Stephen, there is one use case with is not covered by commit
> b55326dc969e (
>
> "pinctrl: msm: Really mask level interrupts to prevent latching"). That
> happens when
>
> gpio line is toggled between i/o mode and interrupt mode :
>
> 1. GPIO is configured as irq line. Peripheral raises interrupt.
>
> 2. IRQ handler runs and disables the irq line (through wq work).
>
> 3. GPIO is configured for input and and data is received from the
> peripheral.

There is no distinction between using a GPIO line as input
and using it for IRQ. All input GPIOs can be used for IRQs,
if the hardware supports it (has an irqchip).

> 4. Now, when GPIO is re-enabled as irq, we see spurious irq, and there
> isn't
>
> any data received on the gpio line, when it is read back after
> configuring as input.

That's an interesting usecase. Hans Verkuil reworked the
GPIO irq support very elegantly exactly to support this type
of usecase (irq switch on and off dynamically), where he
was even switching the line into output mode between
the IRQ trains. (one-wire transcactions for CEC).

> Patch https://lkml.org/lkml/2019/6/17/226 tries to cover this use case.
> Can you please provide your comments?

What this patch does is clear all pending IRQs at irq
unmask. This is usually safe, unless there may be cases
where you *want* to catch any pending IRQs. I guess
normally you don't so it should be safe?

The corner case is when you start some transaction
or whatever that gets ACKed by an IRQ and you actually
get the IRQ back before you had time to execute the code
enabling the IRQ.

That would be racy and bad code, as you should clearly
enable the IRQ first, then start the transaction. So I think
this patch is safe.

But let's see what Bjorn says.

Yours,
Linus Walleij
