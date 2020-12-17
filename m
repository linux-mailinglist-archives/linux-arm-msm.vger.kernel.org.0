Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9E92DDAF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 22:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730937AbgLQVqN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 16:46:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730976AbgLQVqN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 16:46:13 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262AAC0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 13:45:33 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id f29so154669uab.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 13:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N6Qw5qWHGXiBOAFmn045y0oSU+C/RyNs2jifzrZL0yo=;
        b=ZcZ83dyOnkD6dwwKJpvVr6vewC0zVz+2uguxiUfmKIk0n5yHhhSHdF1TdluxPoWHZy
         bjd+Of63HuPQjWdH74tjggwrf1NNVzL6ppVXSWtphIk97Z+Vuivk5/7ew/+FNhOM5hM7
         59YPscDOb6UHVtP2DYBPkINc/2qyZ/pKF9pTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N6Qw5qWHGXiBOAFmn045y0oSU+C/RyNs2jifzrZL0yo=;
        b=K9v6mMUkcmgKYe9Bt2Rkh26uzgqUZdVhM0pw498i4qsBwLDa37YBkiAOkjZ9F0BT5+
         9A50t48OFsZT3ajfCiAM4isRiT4+4r71DfJpFp3YsqmrCAJDVAUh5MLhtHSKwbnphPkY
         WLxDnjRJGkp9Mlx5ARU8XqQvtbq8NTE9rTC7tOZnTXOSiHgdlmNpf6+laGHUxZmCSbvH
         ni8kwabClUbwn4q+/+H8bGOmrY/4Acp2PmDlMPdxYOYXh9dM3T0rfIU9RK4vydzxCzxc
         CNksnF+E6Gncv6/ObNUF5iufQFUqvfFtpQ6yKb8DRJBWqqMxxdjLxpfl9LK0xBX7Q6HQ
         Yw8g==
X-Gm-Message-State: AOAM532VEp9c2tLnrnRGevN1nTFiS13+N9vCClNLqRpLImaXOzQZ1Ao3
        fYDHA2d+RKSxOSvbVamsDfrSQ0TnqX4Y/A==
X-Google-Smtp-Source: ABdhPJzjvK0Bvpp7JraJGNMQeEewxzrtn2kJqXQ0t9SmVQl1fXZP80KTRuUJPtSxtdTDH8HPWZAF3A==
X-Received: by 2002:ab0:b0f:: with SMTP id b15mr1179433uak.45.1608241531841;
        Thu, 17 Dec 2020 13:45:31 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a10sm3120951uaa.18.2020.12.17.13.45.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 13:45:30 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id u7so263861vsg.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 13:45:29 -0800 (PST)
X-Received: by 2002:a67:32c5:: with SMTP id y188mr1504180vsy.4.1608241529505;
 Thu, 17 Dec 2020 13:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20201216144114.v2.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
 <20201216144114.v2.2.Ibade998ed587e070388b4bf58801f1107a40eb53@changeid> <160817888737.1580929.1745000818550256213@swboyd.mtv.corp.google.com>
In-Reply-To: <160817888737.1580929.1745000818550256213@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Dec 2020 13:45:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UgGNy2MkYsf5jjL-fcSsqz0vNYsdrpd4hcfG=7tuJcGQ@mail.gmail.com>
Message-ID: <CAD=FV=UgGNy2MkYsf5jjL-fcSsqz0vNYsdrpd4hcfG=7tuJcGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] spi: spi-geni-qcom: Fail new xfers if
 xfer/cancel/abort pending
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, msavaliy@qti.qualcomm.com,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Dec 16, 2020 at 8:21 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-12-16 14:41:50)
> > If we got a timeout when trying to send an abort command then it means
> > that we just got 3 timeouts in a row:
> >
> > 1. The original timeout that caused handle_fifo_timeout() to be
> >    called.
> > 2. A one second timeout waiting for the cancel command to finish.
> > 3. A one second timeout waiting for the abort command to finish.
> >
> > SPI is clocked by the controller, so nothing (aside from a hardware
> > fault or a totally broken sequencer) should be causing the actual
> > commands to fail in hardware.  However, even though the hardware
> > itself is not expected to fail (and it'd be hard to predict how we
> > should handle things if it did), it's easy to hit the timeout case by
> > simply blocking our interrupt handler from running for a long period
> > of time.  Obviously the system is in pretty bad shape if a interrupt
> > handler is blocked for > 2 seconds, but there are certainly bugs (even
> > bugs in other unrelated drivers) that can make this happen.
> >
> > Let's make things a bit more robust against this case.  If we fail to
> > abort we'll set a flag and then we'll block all future transfers until
> > we have no more interrupts pending.
>
> Why can't we forcibly roll the ball forward and clear the irq if it's a
> cancel/abort that's pending? Basically tell the hardware that we
> understand it did the job and canceled things out but our sad little CPU
> didn't run that irq handler yet. Here have a cookie and get ready for
> the next transfer.
>
>         if (M_CMD_CANCEL_EN || M_CMD_ABORT_EN) /* but not the other irqs like CMD_DONE or refill fifos */
>                 writel(M_CMD_CANCEL_EN | M_CMD_ABORT_EN, se->base + SE_GENI_M_IRQ_CLEAR);
>
> This would let us limp along and try to send another transfer in the
> case that we timed out but the transfer went through by servicing our
> own interrupt.

A few problems:

1. The cancel and abort are commands and they generate a "done"
interrupt along with their "cancel" and/or "abort".  Clearing the
cancel/abort without the done will leave things in a much more
confused state.

2. If we timed out all the way down then there's probably _also_
interrupts for the previous transfer still pending.  Those would also
need to be cleared.  ...and we'd need to disable watermarks / read
pending data.

3. Even if we tried to solve all that, we're probably still in
terrible shape.  Sure, we could try to start another transfer, but if
the previous one failed because the interrupt handler was blocked then
the next one is just going to fail too so all the extra complexity we
just added to handle this was likely wasted.


The whole fact that you need to send little packets to the sequencer
(and wait for an interrupt to tell you that it got your packet) for
every last thing really doesn't work super well and it's just
especially bad for chip select.


> > +static bool spi_geni_is_abort_still_pending(struct spi_geni_master *mas)
> > +{
> > +       struct geni_se *se = &mas->se;
> > +       u32 m_irq, m_irq_en;
> > +
> > +       if (!mas->abort_failed)
> > +               return false;
> > +
> > +       /*
> > +        * The only known case where a transfer times out and then a cancel
> > +        * times out then an abort times out is if something is blocking our
> > +        * interrupt handler from running.  Avoid starting any new transfers
> > +        * until that sorts itself out.
> > +        */
> > +       m_irq = readl(se->base + SE_GENI_M_IRQ_STATUS);
> > +       m_irq_en = readl(se->base + SE_GENI_M_IRQ_EN);
>
> I suppose this could race with the irq handler. Maybe we should grab the
> irq lock around the register reads so we can synchronize with the irq
> handler and save a fail?

I don't _think_ it'll matter a whole lot but it also won't hurt, so sure.

-Doug
