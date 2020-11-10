Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A582AD784
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 14:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730368AbgKJNcG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 08:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJNcF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 08:32:05 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879ADC0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 05:32:05 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id w142so10556443lff.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 05:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=il23hITCqpxK2KRgonKc+lZYY9qSqjOLZ5WOY5ud//k=;
        b=eZsD/YY8FuEfxVATHStyvm+EUySeSb5pDpxl2yI0vSyMxqVlz5O602Mqb6Ll03GRex
         B2JFyB4ps5kCym3tA0KpvBkxeisAgbh+8uu1BkHddSVGDWauHO6vZfNj0UitFncjBTSF
         VrLx3yV9+eJvPBu109zvRX/W0ypnyNbMXQsJo9VYqrt//VxjhfrfbcZ8bK6JDqr5INbd
         OEFQgPSoHcSp0zOL0vp52Az2ds0NG7GUdkB/QhG1mc0Gy3R1nD26B9TW6UiG7oXZJSSm
         ewiKW1Mti/Nj4Jfumj7rQIjn9IxDfqSju5xthPR88Tl94HrXEhJdLQ2GOPv3o93gFshU
         Lx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=il23hITCqpxK2KRgonKc+lZYY9qSqjOLZ5WOY5ud//k=;
        b=LjfX5+zHi/nzNvMcw2NJEJnxiiCwpDsoa+x4PjoC2+0nYawkL//Xod8XChQPPAUpRy
         MleYji8ln7PKuKhFS77+qyAv/qLd+DorXwAkg2Bb9gBpclreGvUl0UxNPiiVn/+qW1VP
         cVDGLlnvjdh5kfolX1JoZ44RhJLUldvoeyRpFb98WpKMqWCeG33ZJPKaQjK35SJc1RvA
         BXGjKgDP+YhWrOGBHsvbH+ejL/S/V0P9roWZMytO5GrQD2W9p+LM0ES4Sq8x1UDFZ43M
         FH2jaDanUDIsjXaArmbeWON5AeIE/DYmjRaD2n104kvp5V4eukX5WtwhpQjYXu1Z+EHh
         dElw==
X-Gm-Message-State: AOAM530UQQSuZlu8OMIDcESyBFj1p6ugaoubK622Q85qJCOKjrc00KVH
        xbgUMiVRSEjMK/bvIsFdxSf8H4AYOBBZRCuTvfheUw==
X-Google-Smtp-Source: ABdhPJzWJ3lOVKlGcQ8YECy3hPBeXO41jPP1o22E0DHyk2dojD3Vo8yORWGB+/5mvWJjM1nIipJ8VbO1YOMsF9jqZaw=
X-Received: by 2002:a19:5e0b:: with SMTP id s11mr6921684lfb.502.1605015123992;
 Tue, 10 Nov 2020 05:32:03 -0800 (PST)
MIME-Version: 1.0
References: <1604561884-10166-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1604561884-10166-1-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:31:53 +0100
Message-ID: <CACRpkdZJ6yrisNKFG8MJEOhzAV7HRtUTniXpnFVd9fpVy75ruw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Move clearing pending IRQ to
 .irq_request_resources callback
To:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?open_list=3AGPIO_SUBSYSTEM_=3Clinux=2Dgpio=40vger=2Ekernel=2Eorg=3E=2C_Andy_?=
         =?UTF-8?Q?Gross_=3Cagross=40kernel=2Eorg=3E=2C_Thomas_Gleixner_=3Ctglx=40linutronix=2E?=
         =?UTF-8?Q?de=3E=2C_Jason_Cooper_=3Cjason=40lakedaemon=2Enet=3E=2C_Doug_Anderson_=3Cdia?=
         =?UTF-8?Q?nders=40chromium=2Eorg=3E=2C_Rajendra_Nayak_=3Crnayak=40codeaurora=2Eorg=3E=2C?=
         =?UTF-8?Q?_Lina_Iyer_=3Cilina=40codeaurora=2Eorg=3E=2C?= 
        <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        =?UTF-8?Q?open_list=3AGPIO_SUBSYSTEM_=3Clinux=2Dgpio=40vger=2Ekernel=2Eorg=3E=2C_Andy_?=
         =?UTF-8?Q?Gross_=3Cagross=40kernel=2Eorg=3E=2C_Thomas_Gleixner_=3Ctglx=40linutronix=2E?=
         =?UTF-8?Q?de=3E=2C_Jason_Cooper_=3Cjason=40lakedaemon=2Enet=3E=2C_Doug_Anderson_=3Cdia?=
         =?UTF-8?Q?nders=40chromium=2Eorg=3E=2C_Rajendra_Nayak_=3Crnayak=40codeaurora=2Eorg=3E=2C?=
         =?UTF-8?Q?_Lina_Iyer_=3Cilina=40codeaurora=2Eorg=3E=2C?= 
        <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 5, 2020 at 8:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:

> When GPIOs that are routed to PDC are used as output they can still latch
> the IRQ pending at GIC. As a result the spurious IRQ was handled when the
> client driver change the direction to input to starts using it as IRQ.
>
> Currently such erroneous latched IRQ are cleared with .irq_enable callback
> however if the driver continue to use GPIO as interrupt and invokes
> disable_irq() followed by enable_irq() then everytime during enable_irq()
> previously latched interrupt gets cleared.
>
> This can make edge IRQs not seen after enable_irq() if they had arrived
> after the driver has invoked disable_irq() and were pending at GIC.
>
> Move clearing erroneous IRQ to .irq_request_resources callback as this is
> the place where GPIO direction is changed as input and its locked as IRQ.
>
> While at this add a missing check to invoke msm_gpio_irq_clear_unmask()
> from .irq_enable callback only when GPIO is not routed to PDC.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

This looks critical so I applied it for fixes so we get some
rotation in linux-next.

If Bjorn has other opinions he will tell us :)

Yours,
Linus Walleij
