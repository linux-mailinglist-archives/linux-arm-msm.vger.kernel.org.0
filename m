Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD4AC189115
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 23:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgCQWJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 18:09:01 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42800 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgCQWJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 18:09:00 -0400
Received: by mail-vs1-f66.google.com with SMTP id i25so15113098vsq.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 15:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Xufgn0OKnMLWDPNBQrBmijk0THuIRKUCGVKI3TWem0=;
        b=LBJ9w5xwNE+aBUpx4MuIBjJU02sMVrYW95UIgpl6Hn+EPqaaAypPL66XKyS0+i0eJj
         jq7EupSJOtI6HbkN/hpEtWRmRVwoDi97USDSDIz1xe4nHt+IF1BNqHKZr/k9bsECGllG
         7OtjEB1LbjxCMdtwAHoPDkhA912qlFRmbtT7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Xufgn0OKnMLWDPNBQrBmijk0THuIRKUCGVKI3TWem0=;
        b=BvCwguaTykuYFKvZiq40ZiiQ6dwpnTe6WV2lwET9OTjXuW82m4mJnHaYxzkVLlcKpB
         NPIqHbOlZSrW+Js09jKYtWWqBDPhAgTyZiRZRWw8rCS5moEVtkNJpHR/0QkLFJMYEOaq
         3ZJRsQpPncR5wFTi+XmkURR7nh4cq5OrqoDVyLyimjpuRQAnjXC0aSACN6JHf4zzObZV
         E3uodUiG8Np1GvpAxG90aEhXAHetf3FaXtorH1r8xLmWmHYzAc5057r+I9ZAAH71ke6e
         svP7k4WU2HyqmOgFd+zB1HmAgTtLWQLJ07VMcRKI3IjAcIraj9txopk45GBuWaiTC/IY
         aPeg==
X-Gm-Message-State: ANhLgQ0RKW4G1DDtqFrEd3pA6O1FsYCsQ/tBQo71E++ECeC6BzoMF2DF
        rapT72aH5LyVmlFzAXsvQWfVI65U0/Q=
X-Google-Smtp-Source: ADFU+vvT1MaH1kDSGeYgeO0i+rZ/nunCNGvud3kcU8XzjnikcXNnKFStOsuZ27L2so8jCaRFDT53/A==
X-Received: by 2002:a67:7346:: with SMTP id o67mr956174vsc.1.1584482938192;
        Tue, 17 Mar 2020 15:08:58 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id q1sm1871225vsq.24.2020.03.17.15.08.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 15:08:57 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id o124so6503658vkc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 15:08:57 -0700 (PDT)
X-Received: by 2002:ac5:c7b6:: with SMTP id d22mr1237683vkn.75.1584482936521;
 Tue, 17 Mar 2020 15:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200317133653.v2.1.I752ebdcfd5e8bf0de06d66e767b8974932b3620e@changeid>
 <158448096503.88485.8894151453752608519@swboyd.mtv.corp.google.com>
In-Reply-To: <158448096503.88485.8894151453752608519@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Mar 2020 15:08:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+c4GZU1p3xYT3t=0Q2cLFxoiM=vqc8SsxOKehxbZPXw@mail.gmail.com>
Message-ID: <CAD=FV=U+c4GZU1p3xYT3t=0Q2cLFxoiM=vqc8SsxOKehxbZPXw@mail.gmail.com>
Subject: Re: [PATCH v2] spi: spi-geni-qcom: Speculative fix of "nobody cared"
 about interrupt
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 17, 2020 at 2:36 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > Patch is marked "speculative" because I have no way to reproduce this
> > problem, so I'm just hoping this fixes it.  Weakly ordered memory
> > makes my brain hurt.
>
> It could be that. It could also be the poor design of geni_se_init() and
> how it enables many interrupts that this driver doesn't look to handle?
> Why do we allow the wrapper to enable all those bits in
> M_COMMON_GENI_M_IRQ_EN and S_COMMON_GENI_S_IRQ_EN if nobody is going to
> handle them?

It is possible it's related to an interrupt that we don't handle.  However:

* IMO having the locking in place is safer anyway.  At some point I
read that advice that trying to reason about weakly ordered memory was
simply too hard for the average person (even the average kernel
developer).  In 99% of the cases you could just use a lock so it's
super clear and the performance difference is near zero.

* Most of the cases I saw of the "nobody cared" for geni-spi was on a
mostly idle system (presumably still doing periodic SPI transactions
to the EC, though).  It seems weird that one of these other interrupts
would suddenly fire.  It seems more likely that we just happened to
win a race of some sort.

If nothing else it will suddenly become very obvious after my patch
lands because I'll print out the status.


That all being said if someone wants to submit a patch to clean up
which interrupts are enabled I'd support it.


> > @@ -151,16 +151,19 @@ static void spi_geni_set_cs(struct spi_device *slv, bool set_flag)
> >         struct geni_se *se = &mas->se;
> >         unsigned long time_left;
> >
> > -       reinit_completion(&mas->xfer_done);
> >         pm_runtime_get_sync(mas->dev);
> >         if (!(slv->mode & SPI_CS_HIGH))
> >                 set_flag = !set_flag;
> >
> > +       spin_lock_irq(&mas->lock);
>
> Why is this spin_lock_irq() vs. spin_lock_irqsave()? This isn't possible
> to be called from somewhere that hasn't changed irq flags?

See below.


> > +       reinit_completion(&mas->xfer_done);
> > +
> >         mas->cur_mcmd = CMD_CS;
> >         if (set_flag)
> >                 geni_se_setup_m_cmd(se, SPI_CS_ASSERT, 0);
> >         else
> >                 geni_se_setup_m_cmd(se, SPI_CS_DEASSERT, 0);
> > +       spin_unlock_irq(&mas->lock);
>
> This will force on interrupts if they were masked.

I'll change it if you want, but in this function there is already a
call to "wait_for_completion_timeout".  That's not gonna be too happy
if this function is ever called with interrupts already masked.  Also
in this function is pm_runtime_get_sync() which in many cases will
sleep (I think we'll end up in geni_se_clks_on() which calls
clk_bulk_prepare_enable()).

In cases where you know for sure that interrupts aren't masked,
spin_lock_irq() and spin_unlock_irq() are fine and that's what they're
for, no?


> >         time_left = wait_for_completion_timeout(&mas->xfer_done, HZ);
> >         if (!time_left)
> > @@ -307,6 +310,8 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
> >         u32 spi_tx_cfg, len;
> >         struct geni_se *se = &mas->se;
> >
> > +       spin_lock_irq(&mas->lock);

...and just to answer the same question for here: setup_fifo_xfer() is
called from spi_geni_transfer_one() which is our "transfer_one"
function.  We don't happen to block anywhere in these functions, but
I'm nearly certain you are allowed to block in them.  We actually
return a positive number to indicate to the SPI core that we're not
doing the blocking ourselves but since the SPI core can't know we were
going to do that it has to assume we might block.


> > @@ -478,13 +485,29 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
> >         struct geni_se *se = &mas->se;
> >         u32 m_irq;
> >         unsigned long flags;
> > -
> > -       if (mas->cur_mcmd == CMD_NONE)
> > -               return IRQ_NONE;
> > +       irqreturn_t ret = IRQ_HANDLED;
> >
> >         spin_lock_irqsave(&mas->lock, flags);

Ironically the above could probably just be "spin_lock" since this is
our interrupt handler.  ;-)  I'll just leave it alone though since
what's there now doesn't hurt.


> >         m_irq = readl(se->base + SE_GENI_M_IRQ_STATUS);
>
> Does this read need to be inside the lock?

Probably not.  Discussion below.


> > +       /* Check for spurious interrupt */
> > +       if (!m_irq) {
> > +               ret = IRQ_NONE;
> > +               goto exit;
>
> I ask because it could be simplified by reading the status and then
> immediately returning IRQ_NONE if no bits are set without having to do
> the lock/unlock dance. And does writing 0 to the irq clear register do
> anything?

Sure.  I'll move it if you want.  It felt nicer to just keep the whole
thing under lock so I didn't have to think about whether it mattered.
...and anyone else looking at it didn't need to think about if it
mattered, too.  It it is very easy to say that it doesn't _hurt_ to
have it under lock other than having one extra memory read under lock.
...and presumably the case where the optimization matters is
incredibly rare (a spurious interrupt) and we just spent a whole lot
of cycles calling the interrupt handler to begin with for this
spurious interrupt.

I would have a hard time believing that a write of 0 to a "write 1 to
clear" register would have any impact.  It would be a pretty bad
hardware design...


So I guess in summary, I'm not planning to spin for any of these
things unless you really insist or you say I'm wrong about something
above or someone else says my opinions are the wrong opinions.

-Doug
