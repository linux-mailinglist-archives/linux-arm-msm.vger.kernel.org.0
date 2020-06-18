Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D181FFDA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 00:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731524AbgFRWA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 18:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgFRWA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 18:00:26 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE02C06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 15:00:24 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id r5so1914134vso.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 15:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JJH2EhuV/l7lkkyLG+fPn9FLJNHdoBEceDl0Qlyep9Q=;
        b=BuEgVqa7JJLH/NwKBu8Sw33xZRs5BjNpsUCbu53oaMGOfj8rIToOq03sVNfeMQ0eSN
         XHqwE1QZaeylpeCgx8Azm6R9RJttc3GRF91SUFrc3gUIOTrNV+mYLkzqzbKNBpdFkvyw
         eUrvad2APf3CIoCUdT6o0wTqhaxATvNBU0yoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JJH2EhuV/l7lkkyLG+fPn9FLJNHdoBEceDl0Qlyep9Q=;
        b=ULtWtegWZisR7bDGLo1B02AwQh3bfBFK+iN93o3pGMhliGORLXSJK5alK07JTQDsjS
         10y4KSYLBaynzQbw9K30+WlahHixLhDmGesIHvHvQadAIMe1wwUC3ILAFaJhUbzeqYT4
         LqrShhGYnLd1cgtAyAdVJumj3yT7/BA1fcDkHDnh0v1Kj+YSfU8h/5dY7n6cSKNAmkK6
         reaWlveNHaZCdQw9Cj9KzKZEtOVc41cnGxZHguRacpZQztO4Uvx904jfhZp6jirO5CNd
         7W3NMyBhoHkcp0epvtK2l1daLuAZFoxtDlI+TbkO3dKyix4jJ8RTOWT1FVfPS5uxcbod
         kuDQ==
X-Gm-Message-State: AOAM531V6/WQFBQ6gke8ss37jm2RFU6YtFddTsPFDDEZ8Yfz59yqtDA8
        rQugpVug0dLFu++h6Kb3y67p2g8V6Vk=
X-Google-Smtp-Source: ABdhPJzPBwrqijTEsbNNsBdlJs5MM1HJEKog0Y4aiRWhKkLlgGo07Ap35oz6Bio0PvFDE4jeR7R0gQ==
X-Received: by 2002:a05:6102:15b:: with SMTP id a27mr5458180vsr.141.1592517623338;
        Thu, 18 Jun 2020 15:00:23 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id g5sm489917vsp.26.2020.06.18.15.00.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 15:00:22 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id t132so4474265vst.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 15:00:22 -0700 (PDT)
X-Received: by 2002:a67:62c4:: with SMTP id w187mr3093005vsb.109.1592517622000;
 Thu, 18 Jun 2020 15:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200618150626.237027-1-dianders@chromium.org>
 <20200618080459.v4.5.Ib1e6855405fc9c99916ab7c7dee84d73a8bf3d68@changeid>
 <159250352382.62212.8085892973272354046@swboyd.mtv.corp.google.com>
 <CAD=FV=Xh3+cROZC8dCn99MLkngsyBcxq+Gv1CERayZXExwdygA@mail.gmail.com> <159251712230.62212.10744179843753723398@swboyd.mtv.corp.google.com>
In-Reply-To: <159251712230.62212.10744179843753723398@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 15:00:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W1y4Z4T13i410zkb27mUxqn+rQE889=ckEEBhbPuci2w@mail.gmail.com>
Message-ID: <CAD=FV=W1y4Z4T13i410zkb27mUxqn+rQE889=ckEEBhbPuci2w@mail.gmail.com>
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

On Thu, Jun 18, 2020 at 2:52 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2020-06-18 13:09:47)
> > On Thu, Jun 18, 2020 at 11:05 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Douglas Anderson (2020-06-18 08:06:26)
> > > > @@ -126,20 +120,23 @@ static void handle_fifo_timeout(struct spi_master *spi,
> > > >         struct geni_se *se = &mas->se;
> > > >
> > > >         spin_lock_irq(&mas->lock);
> > > > -       reinit_completion(&mas->xfer_done);
> > > > -       mas->cur_mcmd = CMD_CANCEL;
> > > > -       geni_se_cancel_m_cmd(se);
> > > > +       reinit_completion(&mas->cancel_done);
> > > >         writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
> > > > +       mas->cur_xfer = NULL;
> > >
> > > BTW, is this necessary? It's subtlely placed here without a comment why.
> >
> > I believe so.  Now that we don't have the "cur_mcmd" we rely on
> > cur_xfer being NULL to tell the difference between a "done" for chip
> > select vs. a "done" for transfer.
> >
> > * When we start a transfer we set "cur_xfer" to a non-NULL pointer.
> > When the transfer finishes we set it to NULL again.
> >
> > * When we start a chip select transfer we _don't_ explicitly set it to
> > NULL because it should already be NULL.
> >
> > * When we are aborting a transfer we need to NULL so we can handle the
> > chip select that will come next.
> >
> > I suppose it's possible that we could get by without without NULLing
> > it because I believe when the "abort" IRQ finally fires then it will
> > include a "DONE" and that would presumably NULL it out.  ...but I
> > guess if both the cancel and abort timed out and no IRQ ever fired
> > then nothing would have NULLed it and the next chip select would be
> > confused.
>
> I was going to say that we should set it NULL when starting CS but that
> is not as important as clearing it out when a cancel/abort is processing
> so that a stale transfer isn't kept around.
>
> >
> > Prior to getting rid of "cur_mcmd" this all wasn't needed because
> > "cur_xfer" was only ever looked at if "cur_mcmd" was set to
> > "CMD_XFER".
> >
> >
> > One part of my change that is technically not related to the removal
> > of "cur_mcmd" is the part where I do "mas->tx_rem_bytes =
> > mas->rx_rem_bytes = 0;".  I can split that as a separate change if you
> > want but it seemed fine to just clean up this extra bit of state here.
> >
>
> How about a comment like this?
>
> -----8<----
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index d8f03ffb8594..670f83793aa4 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -121,6 +121,10 @@ static void handle_fifo_timeout(struct spi_master *spi,
>         spin_lock_irq(&mas->lock);
>         reinit_completion(&mas->cancel_done);
>         writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
> +       /*
> +        * Make sure we don't finalize a spi transfer that timed out but
> +        * came in while cancelling.
> +        */
>         mas->cur_xfer = NULL;
>         mas->tx_rem_bytes = mas->rx_rem_bytes = 0;
>         geni_se_cancel_m_cmd(se);

Sure.  It gets the point across, though
spi_finalize_current_transfer() is actually pretty harmless if you
call it while cancelling.  It just calls a completion.  I'd rather say
something like "If we're here because the SPI controller was calling
handle_err() then the transfer is done and we shouldn't hold onto it
anymore".

-Doug
