Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75FF52D633A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 18:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392687AbgLJRPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 12:15:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392679AbgLJRPK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 12:15:10 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4920DC06179C
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 09:14:30 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id x4so3239288vsp.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 09:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xMgQPzANQdeOqMY+fXyJVOEZa71a65TdMFizwM/N9b0=;
        b=WnikWqu/v1U0viE/wvjK6QZAW6WMiIGtgjXOrFJM+gR4YgZklzOOU/3A8DYKZRjnvZ
         /KqbvstT7mebzyo7tqJPILPN8Rt1PlqqIB0GFGSeFC2zpLhD7d9cxFeoYc9hsbVOUQqE
         N9dRWSWNxoK4zG9RdmRRpq8Q0VxyW6mOw60ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xMgQPzANQdeOqMY+fXyJVOEZa71a65TdMFizwM/N9b0=;
        b=F3JmYee78XbcqslY9Dm7UwJ+pkNvkHa4S3QGkXh6SgKYSvNfQiq1u2a/F6a8HM6FXT
         JOdFvs1XDBsg3Ynd+qjCvBiupU5k3Bbl1no1NuJqpPBAWt278jgyTLd7PBJSlkIpATgT
         ZgP5ofg1hWG/ET7tWgKn3Drbx3wGYNkRnhuB+cX5FwZA8aeClProFRnKzAaj9AsD3sNj
         0szh2RVvufqXK3kuaa64a9eLR07uIKl7nRdTrM8gyVxm+PCFUbpmHloVbQyKzLLm8qYn
         uHqMMDFtfxGPuqaYKF67f6MpnLAlss+ClvtKpm56RwD2IyloUCzUQqkTCbANOO+25G4e
         /7Fw==
X-Gm-Message-State: AOAM531TbpmBs3CPW5pJYtYqMYcQLIZQ+Ez8/O/NPiCTD+lngyS4+OUV
        nq9JCnCK8wuoyOJ3SnbroAcBXTzsoidRHg==
X-Google-Smtp-Source: ABdhPJz1/RMhdynWTIEtJ7uhzxfIZPr1+euR9LBRzy1lHQt7gYmEXB0vnmzytdbXr1yGykPbv3z6Eg==
X-Received: by 2002:a67:fe50:: with SMTP id m16mr9444890vsr.59.1607620468867;
        Thu, 10 Dec 2020 09:14:28 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a133sm573790vsd.5.2020.12.10.09.14.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 09:14:28 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id i62so1385736vkb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 09:14:27 -0800 (PST)
X-Received: by 2002:ac5:ce9b:: with SMTP id 27mr10106859vke.9.1607620467257;
 Thu, 10 Dec 2020 09:14:27 -0800 (PST)
MIME-Version: 1.0
References: <20201203074459.13078-1-rojay@codeaurora.org> <CAD=FV=XKyXnjsM4iS-ydRWBnmYMojPOaYAdYhOkxkPTCQf0RLQ@mail.gmail.com>
 <160757022002.1580929.8656750350166301192@swboyd.mtv.corp.google.com>
In-Reply-To: <160757022002.1580929.8656750350166301192@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 09:14:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WtU3cnRe6pDKFMA9_0cnQFtSOyohY_bJwZObK+KrbhVQ@mail.gmail.com>
Message-ID: <CAD=FV=WtU3cnRe6pDKFMA9_0cnQFtSOyohY_bJwZObK+KrbhVQ@mail.gmail.com>
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

On Wed, Dec 9, 2020 at 7:17 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2020-12-03 08:40:46)
>
> > I would guess that if "mas->cur_xfer" is NULL then
> > geni_spi_handle_rx() should read all data in the FIFO and throw it
> > away and geni_spi_handle_tx() should set SE_GENI_TX_WATERMARK_REG to
> > 0.  NOTE: I _think_ that with the synchronize_irq() I'm suggesting
> > above we'll avoid this case, but it never hurts to be defensive.
> >
> >
> > Does that all make sense?  So the summary is that instead of your patch:
>
> Can we get a CPU diagram describing the race and scenario where this
> happens? Something like:
>
>   CPU0                                CPU1
>   ----                                ----
>   setup_fifo_xfer()
>    spin_lock_irq(&mas->lock);
>    spin_unlock_irq(&mas->lock);
>    mas->cur_xfer = xfer
>    ...
>    <IRQ>
>                                       geni_spi_isr()
>                                        geni_spi_handle_rx()
>                                         <NULL deref boom explosion!>
>
> But obviously this example diagram is incorrect and some timeout happens
> instead? Sorry, I'm super lazy and don't want to read many paragraphs of
> text. :) I'd rather have a diagram like above that clearly points out
> the steps taken to the NULL pointer deref.

This is my untested belief of what's happening

 CPU0                                CPU1
 ----                                ----
                                     setup_fifo_xfer()
                                      ...
                                      geni_se_setup_m_cmd()
                                      <hardware starts transfer>
 <unrelated interrupt storm>          spin_unlock_irq()
 <continued interrupt storm>         <time passes>
 <continued interrupt storm>         <transfer complets in hardware>
 <continued interrupt storm>         <hardware sets M_RX_FIFO_WATERMARK_EN>
 <continued interrupt storm>         <time passes>
 <continued interrupt storm>         handle_fifo_timeout()
 <continued interrupt storm>          spin_lock_irq()
 <continued interrupt storm>          mas->cur_xfer = NULL
 <continued interrupt storm>          geni_se_cancel_m_cmd()
 <continued interrupt storm>          spin_unlock_irq()
 <continued interrupt storm>          wait_for_completion_timeout() => timeout
 <continued interrupt storm>          spin_lock_irq()
 <continued interrupt storm>          geni_se_abort_m_cmd()
 <continued interrupt storm>          spin_unlock_irq()
 <continued interrupt storm>          wait_for_completion_timeout() => timeout
 <interrupt storm ends>
 geni_spi_isr()
  spin_lock()
  if (m_irq & M_RX_FIFO_WATERMARK_EN)
   geni_spi_handle_rx()
    mas->cur_xfer NULL derefrence

With my proposed fix, I believe that would transform into:

 CPU0                                CPU1
 ----                                ----
                                     setup_fifo_xfer()
                                      ...
                                      geni_se_setup_m_cmd()
                                      <hardware starts transfer>
 <unrelated interrupt storm>          spin_unlock_irq()
 <continued interrupt storm>         <time passes>
 <continued interrupt storm>         <transfer complets in hardware>
 <continued interrupt storm>         <hardware sets M_RX_FIFO_WATERMARK_EN>
 <continued interrupt storm>         <time passes>
 <continued interrupt storm>         handle_fifo_timeout()
 <continued interrupt storm>          synchronize_irq()
 <continued interrupt storm>           <time passes>
 <interrupt storm ends>
 geni_spi_isr()
  ...
                                       <synchronize_irq() finishes>
                                      spin_lock_irq()
                                      mas->cur_xfer = NULL
                                      geni_se_cancel_m_cmd()
                                      spin_unlock_irq()
 geni_spi_isr()
   ...
                                      wait_for_completion_timeout() => success

The extra synchronize_irq() I was suggesting at the end of the
function would be an extra bit of paranoia.  Maybe a new storm showed
up while we were processing the timeout?


> > 1. Add synchronize_irq() at the start and end of
> > handle_fifo_timeout().  Not under lock.
> >
> > 2. In geni_spi_handle_rx(), check for NULL "mas->cur_xfer".  Read all
> > data in the FIFO (don't cap at rx_rem_bytes), but throw it away.
> >
> > 3. In geni_spi_handle_tx(), check for NULL "mas->cur_xfer".  Don't
> > write any data.  Just write 0 to SE_GENI_TX_WATERMARK_REG.
> >
> > I think #1 is the real fix, but #2 and #3 will avoid crashes in case
> > there's another bug somewhere.
>
> Aren't 2 and 3 papering over some weird problem though where irqs are
> coming in unexpectedly?

I think that's what I said but in different words?  #1 is the real fix
but #2 and #3 will keep us from crashing (AKA paper over) if we have
some other (unexpected) bug.  We'll already have an error in the log
in this case "Failed to cancel/abort m_cmd" so it doesn't feel
necessary to crash with a NULL dereference...

-Doug
