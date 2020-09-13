Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A096C267D06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Sep 2020 03:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgIMBJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 21:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgIMBJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 21:09:23 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6371BC061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 18:09:22 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id j185so7549147vsc.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 18:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i9DQlEn18Ne5QZIGhlVmoX6i55/RyFGtM85bTQuKmQw=;
        b=QfBwWmgFdvX7Gh1OtDTZusFGrEck1a4wYW77TC8ng3QOGndLg9NfGwyJl2zdczMUYk
         oJiHd8Rf4fbrDqfkvKWFi5FmzqTqGgHaRVbjbYVLc4D2cyqGBW+DrR+2giV747+c+Ee3
         Tcak6TVPfrpkMyysAuHUu0Uok6xcPxIxYFXG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i9DQlEn18Ne5QZIGhlVmoX6i55/RyFGtM85bTQuKmQw=;
        b=PROBq6qHrVHKr+30GcSWLFEgwcmdnXOlSA4nX6PW/HQ09LX/yAnEI0uqE6WlkUfUSg
         h5vAYJ8F4Lx9LnbCnBNMzoM0A9jK1BrimzGhI5rqkBJIrBEFJvz+woo+1c+j6L4fRm3m
         03+nangd8q3tx7biTIj0r67+hieWRGBgUrcw2R1HeYLNtVVFYfXZP5VkKxUwvaggmWLf
         MkOaMw7MfbGqpmorETV6jy73HNW4Fnhq9I+orGvbidO7kE5hlQpA8kofIr5J6eVw2qm1
         q+0caLtgnxeZqR4cYpPY4CPLZhRvXuEVdORF/HQPkmMSnSe6hE6mwsysrktXmOhRfqig
         bTxw==
X-Gm-Message-State: AOAM530v27U2trqNejy3cKhoCRBM/vcqU+wuNmChAksxSp2YrG7EYloy
        87DpOr/KeU7cg7Dxhp+W1mjMQeoBoI75zw==
X-Google-Smtp-Source: ABdhPJzd+MRUY7fBE+zWqTqLOQy0bZaM2Iyu87B3bF61UNDsoP9EmtmeGidFTj7dCP9w1Jo3tpajvQ==
X-Received: by 2002:a05:6102:808:: with SMTP id g8mr4694224vsb.100.1599959359599;
        Sat, 12 Sep 2020 18:09:19 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id l65sm1120771vkh.33.2020.09.12.18.09.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2020 18:09:18 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id c25so3291296vkm.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 18:09:17 -0700 (PDT)
X-Received: by 2002:a1f:9406:: with SMTP id w6mr4427509vkd.0.1599959357510;
 Sat, 12 Sep 2020 18:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200912140730.1.Ie67fa32009b94702d56232c064f1d89065ee8836@changeid>
 <20200912140730.3.Ided778fb4cd078e36c6b240d1b279cd7a534a313@changeid> <20200912225440.GB3715@yoga>
In-Reply-To: <20200912225440.GB3715@yoga>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 12 Sep 2020 18:09:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=in+-GL-9p1b6w8g8CJ0jdhGWhsZNAvap=W1MAPMEKQ@mail.gmail.com>
Message-ID: <CAD=FV=V=in+-GL-9p1b6w8g8CJ0jdhGWhsZNAvap=W1MAPMEKQ@mail.gmail.com>
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

On Sat, Sep 12, 2020 at 3:54 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 12 Sep 16:08 CDT 2020, Douglas Anderson wrote:
>
> > When setting up a bidirectional transfer we need to program both the
> > TX and RX lengths.  We don't need a memory barrier between those two
> > writes.  Factor out the __iowmb() and use writel_relaxed().  This
> > saves a fraction of a microsecond of setup overhead on bidirectional
> > transfers.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/spi/spi-geni-qcom.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> > index 92d88bf85a90..6c7e12b68bf0 100644
> > --- a/drivers/spi/spi-geni-qcom.c
> > +++ b/drivers/spi/spi-geni-qcom.c
> > @@ -376,15 +376,22 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
> >       len &= TRANS_LEN_MSK;
> >
> >       mas->cur_xfer = xfer;
> > +
> > +     /*
> > +      * Factor out the __iowmb() so that we can use writel_relaxed() for
> > +      * both writes below and thus only incur the overhead once even if
> > +      * we execute both of them.
> > +      */
>
> How many passes through this function do we have to take before saving
> the amount of time it took me to read this comment?
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for the review!  Yeah, in Chrome OS we do a crazy amount of SPI
transfers since our EC and security chip are connected over SPI and we
seem to pile a whole lot of stuff into the EC.  This means we keep
coming back to the SPI controller again and again when profiling
things.  I'm hoping that we'll eventually be able to get DMA enabled
here, but until then at least it's nice to make the FIFO transfers
better...

-Doug
