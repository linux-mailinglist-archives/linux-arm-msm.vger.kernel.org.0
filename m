Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6532DB28B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 18:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbgLOR1D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 12:27:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729673AbgLOR0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 12:26:47 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A4EC06179C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 09:26:07 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id p7so11405077vsf.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 09:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sbuHr3bWDR9/2Yf2WWZApdlIvtrOaBHBHilDLviF1YE=;
        b=GuxshamyJReJ1Dqcd9r8MK6EP8K6a9yduJcQYWq1oc3UIrRTq9pxC/k097zQJV4NiZ
         VJrp2v9SAVdgug16WdUrxWDlfN96HKMz2nti01LtQV1oCOcq8j3Et80z61pq33bQ5dV9
         aUIprRoDAg8SS51d/0PSFbJVuh+LR/sK9bkCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbuHr3bWDR9/2Yf2WWZApdlIvtrOaBHBHilDLviF1YE=;
        b=haJq5JUVceozm2+21ivXOunQlmAYBD1pkajs+xP08A150veVMsq9EBl3YmQxSSZNFz
         BUxPDP1SlSPHfYlhvIo49b7hNhraGvTOdudtMGqyokTqJqLv3nmBVhjTo8k7qCYMSNzu
         GJaCaz9qvPIT+cgHk1A5mchQxqeJM8aOpyfxpKig/YJiSY8jSn1wDadLQVVVNSTbAEBf
         2xzUkjhyBL/jkf8RHVSywxf0bixr08fvsXDxsJTIyevNbkaH7I/xIv4V++YSvEyReK1K
         eS3H9wxZIZrpAdrnSV4fXGAVi3YtBzdySnRWvguQAuf4n5vVHAm9tpCbFGkIzjR0+8sO
         9W0Q==
X-Gm-Message-State: AOAM530qYry6GXF57yTyisVutoQ7JT/Uisym/c8Ryd0M1qMGJwnpFviU
        Y0bnR2gnP67zxowehnXGJCFoJn+Miu/BCg==
X-Google-Smtp-Source: ABdhPJxqmIqwJdW144wqdUlEMLke2YzXFodr5giqLPgyHjtst5I2XUR8YWd2g3o57DjeIS2uxZbv/Q==
X-Received: by 2002:a05:6102:9c2:: with SMTP id g2mr27028577vsi.35.1608053165912;
        Tue, 15 Dec 2020 09:26:05 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id d84sm2903097vkd.29.2020.12.15.09.26.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 09:26:04 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id q10so11387244vsr.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 09:26:04 -0800 (PST)
X-Received: by 2002:a67:70c6:: with SMTP id l189mr28486557vsc.34.1608053163642;
 Tue, 15 Dec 2020 09:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20201214162937.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
 <20201214162937.2.Ibade998ed587e070388b4bf58801f1107a40eb53@changeid> <160800104145.1580929.10562113130948868794@swboyd.mtv.corp.google.com>
In-Reply-To: <160800104145.1580929.10562113130948868794@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 15 Dec 2020 09:25:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UT0+BKrUPbATGCbO1fmwwmrKbSy5c+mW-61wS1y6TtJw@mail.gmail.com>
Message-ID: <CAD=FV=UT0+BKrUPbATGCbO1fmwwmrKbSy5c+mW-61wS1y6TtJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: spi-geni-qcom: Really ensure the previous xfer
 is done before new one
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

On Mon, Dec 14, 2020 at 6:57 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-12-14 16:30:19)
> > diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> > index 6f736e94e9f4..5ef2e9f38ac9 100644
> > --- a/drivers/spi/spi-geni-qcom.c
> > +++ b/drivers/spi/spi-geni-qcom.c
> > @@ -145,12 +145,49 @@ static void handle_fifo_timeout(struct spi_master *spi,
> >                 dev_err(mas->dev, "Failed to cancel/abort m_cmd\n");
> >  }
> >
> > +static int spi_geni_check_busy(struct spi_geni_master *mas)
>
> Maybe spi_geni_is_busy() and return bool?

Yeah, that's cleaner, thanks.


> > +       spin_lock_irq(&mas->lock);
> > +       m_irq = readl(se->base + SE_GENI_M_IRQ_STATUS);
> > +       m_irq_en = readl(se->base + SE_GENI_M_IRQ_EN);
> > +       spin_unlock_irq(&mas->lock);
> > +
> > +       if (m_irq & m_irq_en) {
>
> Is this really "busy" though? If we canceled something out then maybe
> the irq has fired but what if it's to tell us that we have some
> available space in the TX fifo? Does that really matter? It seems like
> if we have an RX irq when we're starting a transfer that might be bad
> too but we could forcibly clear that by acking it here and then setting
> the fifo word count that we're expecting for rx?
>
> Put another way, why isn't this driver looking at the TX and RX fifo
> status registers more than in one place?

I'm not sure I understand all your concerns.  Can you clarify?  In
case it helps, I'll add a few thoughts here:

1. SPI is a controller clocked protocol and this is the driver for the
controller.  There is no way to get a RX IRQ unless we initiate it.

2. The code always takes care to make sure that when we're done with a
transfer that we disable the TX watermark.  This means we won't get
any more interrupts.

The only time an interrupt could still be pending when we start a new
transfer is:

a) If the interrupt handler is still running on another CPU.  In that
case it will have the spinlock and won't release it until it clears
the interrupts.

b) If we had a timeout on the previous transfer and then got timeouts
sending the cancel and abort.

In general when we're starting a new transfer we assume that we can
program the hardware willy-nilly.  If there's some chance something
else is happening (or our interrupt could go off) then it breaks that
whole model.

I've addressed all your other concerns and I'm ready to send out v2,
but I'll hold off until you confirm that the above explanation
satisfies your questions.  If you can think of any extra comments
somewhere that would help document that better I'm happy to add them
into the commit or commit message.


-Doug
