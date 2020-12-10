Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4B82D6B8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 00:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgLJXIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 18:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730292AbgLJXIe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 18:08:34 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5D5C0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 15:07:53 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id q10so3787635vsr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 15:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ONZYLHWdcGthQ4rAFKElicD9Id+pbxXQkNXTzDIEtW0=;
        b=MZOa+sDkCaEnAmCZXqCE1nJPzAe9e5NH7LnaVXHTOO9FER6Pay7WW4+5bdjZks41EI
         yFUkFUN7AP0rrWxar1tAo+kLvG4XA0MK4CfAtd3tnRYEzGZzYpwX9i63IEMVrDUA9R2p
         G6dmUfaaYkOvJ4NTe3EhUWjtDTZHFChv9/1gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ONZYLHWdcGthQ4rAFKElicD9Id+pbxXQkNXTzDIEtW0=;
        b=bUnzx+ObKQSQlF4E2mc9rwCfTGjO/IsppXRt8QNSh+4Z2aoCXBMS3PEPUQrQdTksi2
         2Lsh1C5zAf9JltxYfnldZv1z/cFC+FCg7gI089UfvWhHRWgkqc6BXmb9SKSAPCwvyDHC
         X9/ScOHgW17b+z/ASfAZK+yThagktjQgMwIRF0UqcE01TUdKW6XHH13RsuEVa/M/YcmS
         rW6ZI5pGi1Xxqj6EEIEvbGkBZlAskpk1ucPpNng0KI5Jr4yikdy+JJKPftQzsu+CUVto
         7BnLJgOevr51t0oWFFtaoNrzJUrWd7o2RkrUYbf1CJQmkad/3np17slu82upf2C4ceFC
         nc8Q==
X-Gm-Message-State: AOAM5308+al0v6cFGQLAPDRD/qll2kMWGepYW/dJN2McyG5WqY0Y718c
        G6tea9OrFzB40rWoBDTV+rEls9zwTjQZCw==
X-Google-Smtp-Source: ABdhPJzhuzea+LEIsBOrNKcwzYMSWGTHws2+CYLyLMTiZFwUZz31d07BRimA9cP6iTgMXir9F1+OiA==
X-Received: by 2002:a67:7243:: with SMTP id n64mr11254501vsc.50.1607641672239;
        Thu, 10 Dec 2020 15:07:52 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id s20sm736258vks.21.2020.12.10.15.07.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 15:07:51 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id i62so1639689vkb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 15:07:51 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr12097008vke.7.1607641670684;
 Thu, 10 Dec 2020 15:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20201203074459.13078-1-rojay@codeaurora.org> <CAD=FV=XKyXnjsM4iS-ydRWBnmYMojPOaYAdYhOkxkPTCQf0RLQ@mail.gmail.com>
 <160757022002.1580929.8656750350166301192@swboyd.mtv.corp.google.com>
 <CAD=FV=WtU3cnRe6pDKFMA9_0cnQFtSOyohY_bJwZObK+KrbhVQ@mail.gmail.com> <160764107797.1580929.14768824290834396298@swboyd.mtv.corp.google.com>
In-Reply-To: <160764107797.1580929.14768824290834396298@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 15:07:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WuQjKC6GHy8d2nuqS-fgsUfxYrJosg3eyC9JU1FPCcjw@mail.gmail.com>
Message-ID: <CAD=FV=WuQjKC6GHy8d2nuqS-fgsUfxYrJosg3eyC9JU1FPCcjw@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-geni-qcom: Fix NULL pointer access in geni_spi_isr
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Roja Rani Yarubandi <rojay@codeaurora.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 2:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2020-12-10 09:14:15)
> >
> > This is my untested belief of what's happening
> >
> >  CPU0                                CPU1
> >  ----                                ----
> >                                      setup_fifo_xfer()
> >                                       ...
> >                                       geni_se_setup_m_cmd()
> >                                       <hardware starts transfer>
> >  <unrelated interrupt storm>          spin_unlock_irq()
> >  <continued interrupt storm>         <time passes>
> >  <continued interrupt storm>         <transfer complets in hardware>
> >  <continued interrupt storm>         <hardware sets M_RX_FIFO_WATERMARK_EN>
> >  <continued interrupt storm>         <time passes>
> >  <continued interrupt storm>         handle_fifo_timeout()
> >  <continued interrupt storm>          spin_lock_irq()
> >  <continued interrupt storm>          mas->cur_xfer = NULL
> >  <continued interrupt storm>          geni_se_cancel_m_cmd()
> >  <continued interrupt storm>          spin_unlock_irq()
> >  <continued interrupt storm>          wait_for_completion_timeout() => timeout
> >  <continued interrupt storm>          spin_lock_irq()
> >  <continued interrupt storm>          geni_se_abort_m_cmd()
> >  <continued interrupt storm>          spin_unlock_irq()
> >  <continued interrupt storm>          wait_for_completion_timeout() => timeout
> >  <interrupt storm ends>
> >  geni_spi_isr()
> >   spin_lock()
> >   if (m_irq & M_RX_FIFO_WATERMARK_EN)
> >    geni_spi_handle_rx()
> >     mas->cur_xfer NULL derefrence
>
> Ok so the one line summary is "If geni_spi_isr() is sufficiently delayed
> then we may deref NULL in the irq handler because the handler tries to
> deref mas->cur_xfer after the timeout handling code has set it to NULL".

Sure.


>   CPU0                                CPU1
>   ----                                ----
>                                       setup_fifo_xfer()
>                                        ...
>                                        geni_se_setup_m_cmd()
>                                        <hardware starts transfer>
>   unrelated_irq_handler()              spin_unlock_irq()
>    ...
>                                         <transfer completes in hardware>
>                                         <hardware sets M_RX_FIFO_WATERMARK_EN>
>
>                                        handle_fifo_timeout()
>                                         spin_lock_irq()
>                                         mas->cur_xfer = NULL
>                                         geni_se_cancel_m_cmd()
>                                         spin_unlock_irq()
>                                         wait_for_completion_timeout() => timeout
>                                         spin_lock_irq()
>                                         geni_se_abort_m_cmd()
>                                         spin_unlock_irq()
>                                         wait_for_completion_timeout() => timeout
>    return IRQ_HANDLED;
>   gic_handle_irq()
>    geni_spi_isr()
>     spin_lock()
>     if (m_irq & M_RX_FIFO_WATERMARK_EN)
>      geni_spi_handle_rx()
>       rx_buf = mas->cur_xfer->rx_buf <--- OOPS!
>
> > With my proposed fix, I believe that would transform into:
> >
> >  CPU0                                CPU1
> >  ----                                ----
> >                                      setup_fifo_xfer()
> >                                       ...
> >                                       geni_se_setup_m_cmd()
> >                                       <hardware starts transfer>
> >  <unrelated interrupt storm>          spin_unlock_irq()
> >  <continued interrupt storm>         <time passes>
> >  <continued interrupt storm>         <transfer complets in hardware>
> >  <continued interrupt storm>         <hardware sets M_RX_FIFO_WATERMARK_EN>
> >  <continued interrupt storm>         <time passes>
> >  <continued interrupt storm>         handle_fifo_timeout()
> >  <continued interrupt storm>          synchronize_irq()
> >  <continued interrupt storm>           <time passes>
> >  <interrupt storm ends>
> >  geni_spi_isr()
> >   ...
> >                                        <synchronize_irq() finishes>
> >                                       spin_lock_irq()
> >                                       mas->cur_xfer = NULL
> >                                       geni_se_cancel_m_cmd()
> >                                       spin_unlock_irq()
> >  geni_spi_isr()
> >    ...
> >                                       wait_for_completion_timeout() => success
> >
> > The extra synchronize_irq() I was suggesting at the end of the
> > function would be an extra bit of paranoia.  Maybe a new storm showed
> > up while we were processing the timeout?
>
> Shouldn't we check in the timeout logic to see if m_irq has
> M_RX_FIFO_WATERMARK_EN or M_TX_FIFO_WATERMARK_EN set instead? Similarly
> for the CS assert/deassert stuff. If the timeout hits but one of those
> bits are set then it seems we've run into some poor irqsoff section but
> the hardware is still working. Calling synchronize_irq() wouldn't help
> if the CPU handling the irqs (i.e. CPU0) had irqs off for a long time,
> right? It will only ensure that other irq handlers have completed, which
> may be a problem, but not the only one.
>
> TL;DR: Peek at the irq status register in the timeout logic and skip it
> if the irq is pending?

I don't have tons of experience with synchronize_irq(), but the
function comment seems to indicate that as long as the interrupt is
pending synchronize_irq() will do what we want even if the CPU that
should handle the interrupt is in an irqsoff section.  Digging a
little bit I guess it relies upon the interrupt controller being able
to read this state, but (hopefully) the GIC can?

If it doesn't work like I think it does, I'd be OK with peeking in the
IRQ status register, but we shouldn't _skip_ the logic IMO.  As long
as we believe that an interrupt could happen in the future we
shouldn't return from handle_fifo_timeout().  It's impossible to
reason about how future transfers would work if the pending interrupt
from the previous transfer could fire at any point.

-Doug
