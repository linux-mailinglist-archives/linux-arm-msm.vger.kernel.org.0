Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF3C2DC918
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 23:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbgLPWnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 17:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgLPWnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 17:43:06 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C0FC06179C
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 14:42:26 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id s85so13888149vsc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 14:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l84zCJ7SbWCk38L857tmBbT/ticKRRMfqTuIr+c884Q=;
        b=iGzFcIYneBH6SXZdRU/VFCtin4OmgOitxNyHeeqIk6b/REmu3ZMXh7Blu34vhke8vi
         WYwv2zsr/DzBHMGugpcZGTWoxIkn5YHLglDxz5p/QAUIxevX5r0DRSCsS0cU8r49nVnz
         rY0l9gvm5Q2rrt8K1xCKfRJTT8HmnE/NPxWpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l84zCJ7SbWCk38L857tmBbT/ticKRRMfqTuIr+c884Q=;
        b=gCKm6Rn8fF5B8NcUv5CmpdJ3ozsSaaErm51N6Nl9roCRsmH1sxewRp+Rl3OBjTaEIs
         xG773zf9wEjkxugrN57IwlW0y980R2sVNcNPPbwlWtFH5+YfbINilcaTKOfNLlpdL+Yz
         M0GxGRNc8vV5FHaFrd4ldzjTMU5Zc+Jflh25hFF2gVjIr4qFlS1C0gNiRhwhwP2lQO2Z
         0YnhmrCjy2TzvZ0W1BUeS4LJ8aLbeDSZPtNd3OJ5M1qLc/oWqQheTkznvTcFfZnBffMH
         adF+MnHsfuHdEiPxP6iGwHDuYkp1wOxPDL7UkRdkjbmIIkYJnzf1Aqmne5zaGHBj4/Gc
         8dsQ==
X-Gm-Message-State: AOAM5322FUzA3BZ47Daatp1FSAhSQSjEjq1mWfe1YiLTnaoT/41yNL8Y
        UBC/UCIojcmJORtcIigVk+lC+XJdI47e1A==
X-Google-Smtp-Source: ABdhPJzosLxNWTiawyvuu9To+0VvWKwFPabhML9mkzRYQn+jin9udWePdGIHb+pciDXPAi5i0wXQqA==
X-Received: by 2002:a67:f043:: with SMTP id q3mr16624135vsm.14.1608158541417;
        Wed, 16 Dec 2020 14:42:21 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id g15sm3102151uak.19.2020.12.16.14.42.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 14:42:20 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id x26so13903044vsq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 14:42:20 -0800 (PST)
X-Received: by 2002:a67:32c5:: with SMTP id y188mr32306099vsy.4.1608158539861;
 Wed, 16 Dec 2020 14:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20201214162937.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
 <20201214162937.2.Ibade998ed587e070388b4bf58801f1107a40eb53@changeid>
 <160800104145.1580929.10562113130948868794@swboyd.mtv.corp.google.com>
 <CAD=FV=UT0+BKrUPbATGCbO1fmwwmrKbSy5c+mW-61wS1y6TtJw@mail.gmail.com>
 <160807113302.1580929.9178584426202538854@swboyd.mtv.corp.google.com>
 <CAD=FV=XSrqzDFHGpW3b_Sx+bA8u8MMGqdfMJnXkKhkWL6H952A@mail.gmail.com> <160808147515.1580929.1688687061880694586@swboyd.mtv.corp.google.com>
In-Reply-To: <160808147515.1580929.1688687061880694586@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 16 Dec 2020 14:42:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WL9ZWz-nGzP0CWWNVFuG8fnSsA8R906B10J-X6_jwMLg@mail.gmail.com>
Message-ID: <CAD=FV=WL9ZWz-nGzP0CWWNVFuG8fnSsA8R906B10J-X6_jwMLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: spi-geni-qcom: Really ensure the previous xfer
 is done before new one
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, msavaliy@qti.qualcomm.com,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 15, 2020 at 5:18 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2020-12-15 15:34:59)
> > On Tue, Dec 15, 2020 at 2:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Doug Anderson (2020-12-15 09:25:51)
> > > > In general when we're starting a new transfer we assume that we can
> > > > program the hardware willy-nilly.  If there's some chance something
> > > > else is happening (or our interrupt could go off) then it breaks that
> > > > whole model.
> > >
> > > Right. I thought this patch was making sure that the hardware wasn't in
> > > the process of doing something else when we setup the transfer. I'm
> > > saying that only checking the irq misses the fact that maybe the
> > > transfer hasn't completed yet or a pending irq hasn't come in yet, but
> > > the fifo status would tell us that the fifo is transferring something or
> > > receiving something. If an RX can't happen, then the code should clearly
> > > show that an RX irq isn't expected, and mask out that bit so it is
> > > ignored or explicitly check for it and call WARN_ON() if the bit is set.
> > >
> > > I'm wondering why we don't check the FIFO status and the irq bits to
> > > make sure that some previous cancelled operation isn't still pending
> > > either in the FIFO or as an irq. While this patch will fix the scenario
> > > where the irq is delayed but pending in the hardware it won't cover the
> > > case that the hardware itself is wedged, for example because the
> > > sequencer just decided to stop working entirely.
> >
> > It also won't catch the case where the SoC decided that all GPIOs are
> > inverted and starts reporting highs for lows and lows for highs, nor
> > does it handle the case where the CPU suddenly switches to Big Endian
> > mode for no reason.  :-P
> >
> > ...by that, I mean I'm not trying to catch the case where the hardware
> > itself is behaving in a totally unexpected way.  I have seen no
> > instances where the hardware wedges nor where the sequencer stops
> > working and until I see them happen I'm not inclined to add code for
> > them.  Without seeing them actually happen I'm not really sure what
> > the right way to recover would be.  We've already tried "cancel" and
> > "abort" and then waited at least 1 second.  If you know of some sort
> > of magic "unwedge" then we should add it into handle_fifo_timeout().
>
> I am not aware of an "unwedge" command. Presumably the cancel/abort
> stuff makes the FIFO state "sane" so there's nothing to see in the FIFO
> status registers. I wonder if we should keep around some "did we cancel
> last time?" flag and only check the isr if we canceled out and timed
> out to boot? That would be a cheap and easy check to make sure that we
> don't check this each transaction.

Sure.  I guess technically it would be a "did we fail to cancel last time".


> > However, super delayed interrupts due to software not servicing the
> > interrupt in time is something that really happens, if rarely.  Adding
> > code to account for that seems worth it and is easy to test...
> >
>
> Agreed. The function name is wrong then as the device is not "busy". So
> maybe spi_geni_isr_pending()? That would clearly describe what's being
> checked.

I changed this to just be about the abort.  See if v2 looks better to you.
