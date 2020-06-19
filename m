Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5951FFF4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 02:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgFSAfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 20:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgFSAfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 20:35:09 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513E9C06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 17:35:09 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id x14so2612876uao.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 17:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sL5gZ4vOAKEirPKLzW02auBChHPmDUb8IY2xuO5IvUk=;
        b=YoGoPScH89CrVSf52d0551jmRTDhQPIuxmkDlYUfpuRR+FPM9Wu5+I79mM1TZNt6FB
         ok7O1Yy3TQ+J/i5f4mpkwV43SFeJZQ0adURF9ebgA7sIPuDXBRVdzT1Sf4TRXVgujQDj
         UrmCB+tHNuAI8lySYE/ZXe1IOjrSe7SOEU+Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sL5gZ4vOAKEirPKLzW02auBChHPmDUb8IY2xuO5IvUk=;
        b=HqEiTTqM1+WCgGSjzwWzTifya+TE6zVvEHG3iQEHyDaamyLqwTKsmzWyMS7fW4N0oC
         ch2T+GLPj4ycS3yYTPfaq0hhJpiB8zGE++fmW9G5dzvCwTy62PAN8ZR5hZi0vhIAUNKL
         WAKqTwSTC+QwUAlXceqWdj/vhFnk0DrQAEmF7ecE38GsNxlz2XCHViZRwOCJe7uwRUVb
         CA1LGV72M/ViQlVdbvaciVjQyRN+K7oCSLT1+dpypLXfInZpqYuL8CgejgW+pU644g5V
         AOV29v6PBwj1mcpU1WoU2CFxpCUc8BPdCEFV97KEzRaY2tWp3T4O9SBOeKN7seE7VlKY
         aKhg==
X-Gm-Message-State: AOAM530fDc3ebOZgNbvz1K0CS8h5xkiQtiDBgLjJAR1GDAvC95JSxxSl
        t9N+Ts57YKT8FJz1bYTrJ0YC3fdADjA=
X-Google-Smtp-Source: ABdhPJwJZzFJE/G2VUz7QB5YIeOB2vYqrW/Pav3yUGfdvMH2kT0QwC5B0UIPfERYXVc+7PzgH5gw1w==
X-Received: by 2002:a9f:2b03:: with SMTP id p3mr747006uaj.141.1592526908316;
        Thu, 18 Jun 2020 17:35:08 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id b7sm542867vsj.21.2020.06.18.17.35.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 17:35:07 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a10so2614755uan.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 17:35:07 -0700 (PDT)
X-Received: by 2002:a9f:3b1c:: with SMTP id i28mr773392uah.22.1592526906708;
 Thu, 18 Jun 2020 17:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200618150626.237027-1-dianders@chromium.org>
 <20200618080459.v4.5.Ib1e6855405fc9c99916ab7c7dee84d73a8bf3d68@changeid>
 <159250352382.62212.8085892973272354046@swboyd.mtv.corp.google.com>
 <CAD=FV=Xh3+cROZC8dCn99MLkngsyBcxq+Gv1CERayZXExwdygA@mail.gmail.com>
 <159251712230.62212.10744179843753723398@swboyd.mtv.corp.google.com>
 <CAD=FV=W1y4Z4T13i410zkb27mUxqn+rQE889=ckEEBhbPuci2w@mail.gmail.com> <159252347502.62212.15886549130634139267@swboyd.mtv.corp.google.com>
In-Reply-To: <159252347502.62212.15886549130634139267@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 17:34:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WC_EaktmUgev_13roVYyTsmHukYO0oJODhjVVryVPpzQ@mail.gmail.com>
Message-ID: <CAD=FV=WC_EaktmUgev_13roVYyTsmHukYO0oJODhjVVryVPpzQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] spi: spi-geni-qcom: Don't keep a local state variable
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 18, 2020 at 4:37 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2020-06-18 15:00:10)
> > On Thu, Jun 18, 2020 at 2:52 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > -----8<----
> > > diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> > > index d8f03ffb8594..670f83793aa4 100644
> > > --- a/drivers/spi/spi-geni-qcom.c
> > > +++ b/drivers/spi/spi-geni-qcom.c
> > > @@ -121,6 +121,10 @@ static void handle_fifo_timeout(struct spi_master *spi,
> > >         spin_lock_irq(&mas->lock);
> > >         reinit_completion(&mas->cancel_done);
> > >         writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
> > > +       /*
> > > +        * Make sure we don't finalize a spi transfer that timed out but
> > > +        * came in while cancelling.
> > > +        */
> > >         mas->cur_xfer = NULL;
> > >         mas->tx_rem_bytes = mas->rx_rem_bytes = 0;
> > >         geni_se_cancel_m_cmd(se);
> >
> > Sure.  It gets the point across, though
> > spi_finalize_current_transfer() is actually pretty harmless if you
> > call it while cancelling.  It just calls a completion.  I'd rather say
> > something like "If we're here because the SPI controller was calling
> > handle_err() then the transfer is done and we shouldn't hold onto it
> > anymore".
> >
>
> Agreed it's mostly harmless. I thought the concern was that 'cur_xfer'
> may reference a freed piece of memory so it's best to remove ownership
> of the pointer from here so that the irq handler doesn't try to finalize
> a transfer that may no longer exist. "Shouldn't hold onto it anymore"
> doesn't tell us why it shouldn't be held onto, leaving it to the reader
> to figure out why, which isn't good.

Right.  The point is that 'cur_xfer' isn't valid anymore after
handle_err() finishes so we shouldn't hold the pointer.  I'm OK with
your wording and am happy if Mark squashes it when he applies or I can
send out a new version soon.

-Doug
