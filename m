Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7506C1FD705
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 23:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgFQVTo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 17:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbgFQVTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 17:19:43 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D187C06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 14:19:43 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id q10so926856vka.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 14:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LHdZFdUDbaGgzBRvCS1RxiNBX+2cirFyQiX0yiGlqd8=;
        b=P/WwK15V/0uDYpjRkeIkohzcdcEDkyscFTPBz3N9o+l+e2hR38aGx8mkvATU7iwZ9q
         DAWaIaN9IoIgcGCAdaQhDbyzMTsnNxXPk9zcPed3fzu+ql578lJfjAI6l3FX18dcTCAt
         Hr1ufaFl6llNjQiVvMS45km4BWJb/nLQEmt1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LHdZFdUDbaGgzBRvCS1RxiNBX+2cirFyQiX0yiGlqd8=;
        b=P2MYhkL05P2FYNRVKtd7YXY1LkuB8a/31zqX/tWzkMGR/72lp5au+AbKZjHM6wxl+U
         JyEqA7aIncmJcWXqqTdkB6nHylwNwqodDdyKbehJPqSWVSpE9NQ84bf7+DhJVIAp1By7
         9/ZR2opFYE6NJEpFAu/s3KQiDoW/6LXENHCY9g0/oVI8dKUt5GvseLjv/fzjq8WRpmbt
         zfu1uA07Vf9gk6UBWjiak/uReCTtdsV9MAgbgGaFTX0iYUxer9iKXP2WysbBYkKJPqoJ
         5H0qaJCjALbUIgrYWSQwyEUSWR4Cy9ai3dsRpd/8yOqv0oV/WEbxFBbJk5r2HhJcolju
         D9PQ==
X-Gm-Message-State: AOAM533wXkMTCNJO50m4u/wXsuP2ZNliUkRpiuZ8HzKyEXPRezlrlJw1
        UvxAm+Ini389FfSzAsmKhDE2Wh3kO80=
X-Google-Smtp-Source: ABdhPJymm0vjRZkUeBrMG44rbEBoVjzfJrugJdE4Qteg5kc04MP/fgt/CIvv7Ub77wwGJXeJb/FLqQ==
X-Received: by 2002:a1f:ac51:: with SMTP id v78mr1147237vke.78.1592428781981;
        Wed, 17 Jun 2020 14:19:41 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id s19sm104046vke.14.2020.06.17.14.19.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 14:19:41 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id o2so2302956vsr.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 14:19:41 -0700 (PDT)
X-Received: by 2002:a05:6102:21a9:: with SMTP id i9mr1003417vsb.109.1592428780700;
 Wed, 17 Jun 2020 14:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200616104050.84764-1-dianders@chromium.org> <20200616034044.v3.2.I752ebdcfd5e8bf0de06d66e767b8974932b3620e@changeid>
 <159242718864.62212.18160698526818943096@swboyd.mtv.corp.google.com>
In-Reply-To: <159242718864.62212.18160698526818943096@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Jun 2020 14:19:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UmH2WwhyZZSyuYE2n2BzaS8486Bu2fMHu+RFfX5x3MUg@mail.gmail.com>
Message-ID: <CAD=FV=UmH2WwhyZZSyuYE2n2BzaS8486Bu2fMHu+RFfX5x3MUg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] spi: spi-geni-qcom: Mo' betta locking
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dilip Kota <dkota@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Wed, Jun 17, 2020 at 1:53 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-06-16 03:40:47)
> > If you added a bit of a delay (like a trace_printk) into the ISR for
> > the spi-geni-qcom driver, you would suddenly start seeing some errors
> > spit out.  The problem was that, though the ISR itself held a lock,
> > other parts of the driver didn't always grab the lock.
> >
> > One example race was this:
> > a) Driver queues off a command to set a Chip Select (CS).
> > b) ISR fires indicating the CS is done.
> > c) Done bit is set, so we complete().
> > d) Second CPU gallops off and starts a transfer.
> > e) Second CPU starts messing with hardware / software state (not under
> >    spinlock).
> > f) ISR now does things like set "mas->cur_mcmd" to CMD_NONE, prints
> >    errors if "tx_rem_bytes" / "rx_rem_bytes" have been set, and also
> >    Acks all interrupts it handled.
>
> Can we get a CPU0/CPU1 diagram here? At point e) I got sort of lost. And
> maybe it's not even a dual CPU problem? i.e. it can happen on one CPU?
>
>     CPU0
>     ----
>  a) spi_geni_set_cs()
>      mas->cur_mcmd = CMD_CS
>      wait_for_completion_timeout(&xfer_done)
>  b)  <INTERRUPT>
>      geni_spi_isr()
>  c)   complete(&xfer_done);
>      <END INTERRUPT>
>      pm_runtime_put(mas->dev);
>  d) galloping?
>
> I got lost... Sorry!

I think you need two CPUs, at least for the race I'm thinking of.
Maybe this is clearer?

CPU1:
=> spi_geni_set_cs() starts
=> spi_geni_set_cs() calls wait_for_completion_timeout(&xfer_done)
CPU0:
=> geni_spi_isr() starts
=> geni_spi_isr() calls complete(&xfer_done)
=> geni_spi_isr() stalls
CPU1:
=> spi_geni_set_cs() call to wait_for_completion_timeout() finishes
=> spi_geni_set_cs() exits.
=> spi_geni_transfer_one() is called
=> spi_geni_transfer_one() calls setup_fifo_xfer()
=> setup_fifo_xfer() sets "cur_mcmd"
=> setup_fifo_xfer() sets "tx_rem_bytes"
=> setup_fifo_xfer() sets "rx_rem_bytes"
=> setup_fifo_xfer() kicks off a transfer
CPU0:
=> geni_spi_isr() finishes stalling
=> geni_spi_isr() sets "cur_mcmd" to NULL
=> geni_spi_isr() checks "tx_rem_bytes" to confirm it's 0.
=> geni_spi_isr() checks "rx_rem_bytes" to confirm it's 0.
=> geni_spi_isr() clears any "DONE" interrupt that is pending

I can update the commit message to have that if it's helpful and makes
sense.  In the above example I have a fake "stall" that wouldn't
really happen, but in general if adding a delay somewhere creates a
race condition then the race condition was there anyway.  Also, with
weakly ordered memory it's possible that a write on one CPU could
clobber a write made by another CPU even if they happened in opposite
orders.

The race is fixed by my patch because when CPU1 starts
setup_fifo_xfer() it won't be able to grab the spinlock until the ISR
is totally done.


> > Let's fix this.  Before we start messing with hardware, we'll grab the
> > lock to make sure that the IRQ handler from some previous command has
> > really finished.  We don't need to hold the lock unless we're in a
> > state where more interrupts can come in, but we at least need to make
> > sure the previous IRQ is done.  This lock is used exclusively to
> > prevent the IRQ handler and non-IRQ from stomping on each other.  The
> > SPI core handles all other mutual exclusion.
>
> Ok maybe the problem is the completion at c) never happens until the
> wait_for_completion_timeout() times out?

No need for a timeout to happen.  Just putting a few "trace_printk"
calls in the ISR at strategic places was enough for me to see the
race.


> > As part of this, we change the way that the IRQ handler detects
> > spurious interrupts.  Previously we checked for our state variable
> > being set to IRQ_NONE, but that was done outside the spinlock.  We
> > could move it into the spinlock, but instead let's just change it to
> > look for the lack of any IRQ status bits being set.  This can be done
> > outside the lock--the hardware certainly isn't grabbing or looking at
> > the spinlock when it updates its status register.
> >
> > It's possible that this will fix real (but very rare) errors seen in
> > the field that look like:
> >   irq ...: nobody cared (try booting with the "irqpoll" option)
> >
> > NOTE: an alternate strategy considered here was to always make the
> > complete() / spi_finalize_current_transfer() the very last thing in
> > our IRQ handler.  With such a change you could consider that we could
> > be "lockless".  In that case, though, we'd have to be very careful w/
> > memory barriers so we made sure we didn't have any bugs with weakly
> > ordered memory.  Using spinlocks makes the driver much easier to
> > understand.
> >
> > Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI based QUP")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Split out some lock cleanup to previous patch.
> > - Don't need to read IRQ status register inside spinlock.
> > - Don't check for state CMD_NONE; later patch is removing state var.
> > - Don't hold the lock for all of setup_fifo_xfer().
> > - Comment about why it's safe to Ack interrupts at the end.
> > - Subject/desc changed since race is definitely there.
> >
> > Changes in v2:
> > - Detect true spurious interrupt.
> > - Still return IRQ_NONE for state machine mismatch, but print warn.
> >
> >  drivers/spi/spi-geni-qcom.c | 45 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 42 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> > index c7d2c7e45b3f..e0f0e5c241f3 100644
> > --- a/drivers/spi/spi-geni-qcom.c
> > +++ b/drivers/spi/spi-geni-qcom.c
> > @@ -367,6 +384,12 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
> >         }
> >         writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
> >         mas->cur_mcmd = CMD_XFER;
> > +
> > +       /*
> > +        * Lock around right before we start the transfer since our
> > +        * interrupt controller could come in at any time now.
>
> drop 'controller'?

Sure, I'll fix in the next spin.

-Doug
