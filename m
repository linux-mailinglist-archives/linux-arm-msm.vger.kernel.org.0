Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2090142DFC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 18:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbhJNQ5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 12:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbhJNQ5n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 12:57:43 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262C9C061753
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 09:55:38 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id y67so4547438iof.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 09:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o+zdN+lceoRdZihF10APOuMOlB4igBR3wLSssTOtiUA=;
        b=of8KjvQt3adKeW4QyIHeBuZURPUIWHs4W5yXZEkTXy1acQdYCNrZgDFZNwt5/EJ5qa
         ecqjwW3evura2DG1Q4b07dmnoP3owujuF9zT0j68F5/+VIHwzBBJKV5Efy65kRKgia2C
         2snvrlCcAB/iU58FcoIlcblp1Lk5D/uvw8EWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o+zdN+lceoRdZihF10APOuMOlB4igBR3wLSssTOtiUA=;
        b=isRVw5HWI9IOAx/GnI2f/KG0qnDYm6MwcrIjy7WR7dSs+2g8KtKJglI6QGavAKy+S2
         wwOH3xeI+SQ97KG5zgFS/Y4rEuGq1dcUtIN7uwSpSFJs7S/6zYrQRNSzDTX5C3zdSkIW
         MqJAKC7J/9J7w965ctOjrTAuP6emjTiJRDzM2MiLlWDNU58/NbDHY9ezSGvtDDHkoQo/
         wm6UtUZGolR0KtDIWqq8fqRTeph9SGXmFK8dAzoshCJMo3O7nc+e6TIzRc3i+uIIn363
         hG/jLPmHRuCKSDojoJky+hTgDLXausbdHXhSMYIHByWqSOO2bnTbY9+5y34iP/YVUCUu
         krng==
X-Gm-Message-State: AOAM530GNQ50+yRgbuGu5D5KD4C6E4yA7AWYLnLZYcmKIBaokf4VEGxt
        HQ27Tk3L97h73kvyFttNsHtbwaANzZzTew==
X-Google-Smtp-Source: ABdhPJxNAKDjb3NdWhg51f86vjoGskIFGmI/BJpI+mBo6XEKtGNxNFfIhnYq4hjrq6BZqJDAYlyYNQ==
X-Received: by 2002:a6b:7847:: with SMTP id h7mr56218iop.115.1634230537299;
        Thu, 14 Oct 2021 09:55:37 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id u2sm1367127ion.54.2021.10.14.09.55.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 09:55:36 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id a8so4194241ilj.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 09:55:36 -0700 (PDT)
X-Received: by 2002:a05:6e02:1785:: with SMTP id y5mr88932ilu.142.1634230535952;
 Thu, 14 Oct 2021 09:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210625052213.32260-1-vkoul@kernel.org> <20210625052213.32260-5-vkoul@kernel.org>
 <CAD=FV=UfZxKyUZMK9c74KmMBBqgYROn1zp+vLfHaj_ghUK1t+g@mail.gmail.com> <YWhVIm+rqRMmkMMn@matsya>
In-Reply-To: <YWhVIm+rqRMmkMMn@matsya>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Oct 2021 09:55:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMrurp4TLD7BCpVR9-+daHidHhkHG6P7u69HOBcvkMxA@mail.gmail.com>
Message-ID: <CAD=FV=XMrurp4TLD7BCpVR9-+daHidHhkHG6P7u69HOBcvkMxA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] spi: spi-geni-qcom: Add support for GPI dma
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Thu, Oct 14, 2021 at 9:04 AM Vinod Koul <vkoul@kernel.org> wrote:
> > > +static bool geni_can_dma(struct spi_controller *ctlr,
> > > +                        struct spi_device *slv, struct spi_transfer *xfer)
> > > +{
> > > +       struct spi_geni_master *mas = spi_master_get_devdata(slv->master);
> > > +
> > > +       /* check if dma is supported */
> > > +       if (mas->cur_xfer_mode == GENI_GPI_DMA)
> > > +               return true;
> > > +
> > > +       return false;
> > > +}
> >
> > nit: might as well handle GENI_SE_DMA as well since it's just as easy
> > to test against GENI_SE_FIFO?
>
> I think I will leave that for the person adding GENI_SE_DMA support :)

I was just thinking of changing the "if" statement:

if (mas->cur_xfer_mode != GENI_SE_FIFO)

It's no skin off your teeth and would make one fewer line to change
if/when the other DMA mode is supported. In any case, I won't push it.
;-)


> > > @@ -738,6 +1021,14 @@ static int spi_geni_probe(struct platform_device *pdev)
> > >         if (ret)
> > >                 goto spi_geni_probe_runtime_disable;
> > >
> > > +       /*
> > > +        * check the mode supported and set_cs for fifo mode only
> > > +        * for dma (gsi) mode, the gsi will set cs based on params passed in
> > > +        * TRE
> > > +        */
> > > +       if (mas->cur_xfer_mode == GENI_SE_FIFO)
> > > +               spi->set_cs = spi_geni_set_cs;
> >
> > I'm curious: is there no way to get set_cs() working in GPI mode? In
> > an off-thread conversation Qualcomm seemed to indicate that it was
> > possible, but maybe they didn't quite understand what I was asking.
> >
> > Without an implementation of set_cs() there will be drivers in Linux
> > that simply aren't compatible because they make the assumption that
> > they can lock the bus, set the CS, and do several transfers that are
> > part of some logical "transaction". I believe that both of the SPI
> > peripherals on boards that I work on, cros-ec and the SPI TPM make
> > this assumption. I don't even believe that the drivers can be "fixed"
> > because the requirement is more at the protocol level. The protocol
> > requires you to do things like:
> >
> > 0. Lock the bus.
> > 1. Set the CS.
> > 2. Transfer a few bytes, reading the response as you go.
> > 3. Once you see the other side respond that it's ready, transfer some
> > more bytes.
> > 4. Release the CS.
> > 5. Unlock the bus.
> >
> > You can't do this without a set_cs() implementation because of the
> > requirement to read the responses of the other side before moving on
> > to the next phase of the transfer.
> >
> > As I understand it this is roughly the equivalent of i2c clock
> > stretching but much more ad-hoc and defined peripherals-by-peripheral.
> >
> > In any case, I guess you must have examples of peripherals that need
> > GPI mode and don't need set_cs() so we shouldn't block your way
> > forward, but I'm just curious if you had more info on this.
>
> So I have asked some qcom folks, they tell me it is _possible_ to use
> the cs bit in the TRE and it can work. But TBH I am not yet convinced it
> would work as advertised. So do you enable the GPI mode for chrome books
> or it is SE DMA mode (i think SE DMA mode might be simpler to use for
> your case)

Sounds promising. I'm curious about why you're not convinced it would
work as advertised? Right now we have all our SPI devices running in
FIFO mode (!) and we've been trying to find a way to get them in DMA
mode. I think Qualcomm is trying to avoid supporting both SE DMA and
GPI DMA mode so they are saying that once GPI mode works then we can
just use that.

I don't really have a huge objection to that, but I also have zero
experience with GPI DMA mode. We don't have any need (at the moment)
to share our SPI bus with multiple execution environments, but it
seems like GPI mode _could_ still work as long as the chip select
problem is solved. I did manage to get some more documentation and I
do see a "LOCK" command, so maybe that combined with leaving the CS
asserted would solve the problem? Maybe Mark would allow your driver
to get called from spi_bus_lock() and spi_bus_unlock(). That seems
like it would be important to do anyway to match the Linux SPI client
model...

NOTE: in reality, we sorta paper over the "chip select" problem anyway
on Chromebooks. We just configure the chip select lines as GPIOs and
let Linux manage them. There is much less overhead in setting a GPIO
compared to messaging a QUP, so this improves performance. As long as
this continues to work, perhaps we don't care about whether we can
really tell GPI mode to leave the CS asserted.

-Doug
