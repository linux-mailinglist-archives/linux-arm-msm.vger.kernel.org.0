Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847A926812C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Sep 2020 22:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgIMUf1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 16:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgIMUfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 16:35:23 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CEDC06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 13:35:23 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id i22so4809572uat.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7//k4ZnzRlGYM9EKbMfbSQEPgFFjkWDQWTX6iz6Bros=;
        b=LujPMVooXKT8EwHc0AmnxI0ZCCFHCgR387ccDWQ2vImrPK7nq6FNW7omZqh2xHS5q7
         ReZy3cnXtFX8glJwNY21b3o/pCV/U6w52PLXZ88ougT3nWKZFs1RTWKLVJm5u/TYDye5
         iNhGfZce5icXIqJi2H1Vtn3nkYF6WofKz0HRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7//k4ZnzRlGYM9EKbMfbSQEPgFFjkWDQWTX6iz6Bros=;
        b=NSZOf+KTWdZ129ajiZXvOFHT3X4lltzSf5sEXUCeaP1r2bbBIxt6NYeLM2NrBAfG9u
         9t981WV2xVam50lUu75001++/N7UtMi4dgWOIjfcyAmvi6j2H9/5GlgjiXZ7zOOUZfd+
         UBaWs4aXhaDaHVxCXl5NZrKqAtckM3DZGbZ8Zy9dyOWcGukMO/fK1h6wccKrFSi5zL/I
         jjbIaIey7EILlsjdVhk9mmKzFBIl/j9Sl2pT6xT9pbiz1R/I84ihvb+hwXQqFiy4SbRm
         gqsjnbY+sCixF2ndFWqVmn6TBoAmdCymh3T2KQV2nFgXVcBncNbE86TVJvBTYJrpg+TT
         25gg==
X-Gm-Message-State: AOAM530Kab1oUuxCs8qeZK/rFMIIVcWejNaIxAVtyYuZzluDz7VAOW9L
        fT/1l2wdEA2WUYpadfLw3y6dtHCn+xa61w==
X-Google-Smtp-Source: ABdhPJz++76csFBFHKZWWT1nyPxvRmPP6+G/Im6tOJ0SD1onDwy9gcP89cNZQyzrgRvJFWvVLg0XBw==
X-Received: by 2002:ab0:5e8:: with SMTP id e95mr5499416uae.72.1600029319840;
        Sun, 13 Sep 2020 13:35:19 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id r14sm1117305uao.14.2020.09.13.13.35.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2020 13:35:18 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id j185so8437292vsc.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 13:35:18 -0700 (PDT)
X-Received: by 2002:a67:ff97:: with SMTP id v23mr5969962vsq.11.1600029318182;
 Sun, 13 Sep 2020 13:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200912140730.1.Ie67fa32009b94702d56232c064f1d89065ee8836@changeid>
 <20200912140730.3.Ided778fb4cd078e36c6b240d1b279cd7a534a313@changeid>
 <20200912225440.GB3715@yoga> <CAD=FV=V=in+-GL-9p1b6w8g8CJ0jdhGWhsZNAvap=W1MAPMEKQ@mail.gmail.com>
In-Reply-To: <CAD=FV=V=in+-GL-9p1b6w8g8CJ0jdhGWhsZNAvap=W1MAPMEKQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sun, 13 Sep 2020 13:35:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WdxezP_cpuQjLdgOS8geOC=uW5n=TfRoZG7vJc=_aCbQ@mail.gmail.com>
Message-ID: <CAD=FV=WdxezP_cpuQjLdgOS8geOC=uW5n=TfRoZG7vJc=_aCbQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] spi: spi-geni-qcom: Slightly optimize setup of
 bidirectional xfters
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Sep 12, 2020 at 6:09 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, Sep 12, 2020 at 3:54 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Sat 12 Sep 16:08 CDT 2020, Douglas Anderson wrote:
> >
> > > When setting up a bidirectional transfer we need to program both the
> > > TX and RX lengths.  We don't need a memory barrier between those two
> > > writes.  Factor out the __iowmb() and use writel_relaxed().  This
> > > saves a fraction of a microsecond of setup overhead on bidirectional
> > > transfers.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  drivers/spi/spi-geni-qcom.c | 13 ++++++++++---
> > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> > > index 92d88bf85a90..6c7e12b68bf0 100644
> > > --- a/drivers/spi/spi-geni-qcom.c
> > > +++ b/drivers/spi/spi-geni-qcom.c
> > > @@ -376,15 +376,22 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
> > >       len &= TRANS_LEN_MSK;
> > >
> > >       mas->cur_xfer = xfer;
> > > +
> > > +     /*
> > > +      * Factor out the __iowmb() so that we can use writel_relaxed() for
> > > +      * both writes below and thus only incur the overhead once even if
> > > +      * we execute both of them.
> > > +      */
> >
> > How many passes through this function do we have to take before saving
> > the amount of time it took me to read this comment?
> >
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Thanks for the review!  Yeah, in Chrome OS we do a crazy amount of SPI
> transfers since our EC and security chip are connected over SPI and we
> seem to pile a whole lot of stuff into the EC.  This means we keep
> coming back to the SPI controller again and again when profiling
> things.  I'm hoping that we'll eventually be able to get DMA enabled
> here, but until then at least it's nice to make the FIFO transfers
> better...

Ugh.  Given the problem that the kernel test robot found, I'm gonna
say just drop this patch but keep the others I sent.  As per the CL
description, it's a pretty minor optimization and even though we do a
lot of SPI transfers it's probably more worth it to work towards DMA
mode than to try to find a cleaner solution for this one.

-Doug
