Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDF5267D07
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Sep 2020 03:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgIMBMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 21:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgIMBMJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 21:12:09 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2720C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 18:12:08 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id i22so4310315uat.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 18:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eaUKvG17QDFsiEMAiiN5tAG3XK9xts1CDUuIgPPVkFs=;
        b=YuUNpl3Ev5lNK/FHlTWko3kIUdAS2yo9gZ2RSb0HXuGs7XMbKulrv9r3668dnQWlso
         9hsec0djgWmeAdb/9vAOVRAbzm8xMGNwXd53E9szIg4t9nb/mWSASnIyXyGMXEVVDMlD
         3PAs2Mz1rmK6JGmbaHefYZG1IGQF3uYf4ht0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaUKvG17QDFsiEMAiiN5tAG3XK9xts1CDUuIgPPVkFs=;
        b=KFMJ0l+971n4nZL1R9PWUzNG6EpbUjtPJS1yFIEws9Ulzx0Z2mOIXbiEZTaX/AeGrB
         4jmhHTYuslC742sk22zn2YMDrHQaASFgere6DgbOCtqU5p9lugm/k16UN1LxG1mIHPlg
         6qsrN2j51yHggfv2VJ+nOaYyNFOGrBPxGhUmd+qzBXv7Pjj6xaP7CNywXGLH3RlqgW0/
         vwOc9xpO//m904kvF3DkhrUbrmDqHu3oBgX8+dMz/nS5JP1mYjlZTw14Ghs/TEb//8Pd
         wEC9yQv1dWHiKWXQrki6oELeCTNakXPF4wcMPauC4g3TpVVqy+kZvFKPjIGI+wpnWA0W
         FTJg==
X-Gm-Message-State: AOAM530S00QgYN74YBMAm24gU8TJrX1Ct5rPiazvrLIrlZMocpT8f/e9
        BgVeZSCI/UZlQxGfVsCx3My6HUtfeVTdpw==
X-Google-Smtp-Source: ABdhPJxvRbZMNKFRsYAZLObn/4JeLTJAS5/Jl1C2kD0texC0gfkuWbudL87Rx6oxRjeoFNPZIgjmUg==
X-Received: by 2002:ab0:6542:: with SMTP id x2mr2022231uap.127.1599959527701;
        Sat, 12 Sep 2020 18:12:07 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id n197sm1105361vkn.30.2020.09.12.18.12.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2020 18:12:07 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id y5so2925410vsd.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 18:12:06 -0700 (PDT)
X-Received: by 2002:a67:ff97:: with SMTP id v23mr4715341vsq.11.1599959526518;
 Sat, 12 Sep 2020 18:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200912140730.1.Ie67fa32009b94702d56232c064f1d89065ee8836@changeid>
 <20200912225302.GA3715@yoga>
In-Reply-To: <20200912225302.GA3715@yoga>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 12 Sep 2020 18:11:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VT+7RX=vdy0Ba_AB3dyMKVGu9uwP5bS2eew2W49BdcWA@mail.gmail.com>
Message-ID: <CAD=FV=VT+7RX=vdy0Ba_AB3dyMKVGu9uwP5bS2eew2W49BdcWA@mail.gmail.com>
Subject: Re: [PATCH 1/3] spi: spi-geni-qcom: Use the FIFO even more
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

On Sat, Sep 12, 2020 at 3:53 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 12 Sep 16:07 CDT 2020, Douglas Anderson wrote:
>
> > In commit 902481a78ee4 ("spi: spi-geni-qcom: Actually use our FIFO") I
> > explained that the maximum size we could program the FIFO was
> > "mas->tx_fifo_depth - 3" but that I chose "mas->tx_fifo_depth()"
> > because I was worried about decreased bandwidth.
> >
> > Since that time:
> > * All the interconnect patches have landed, making things run at the
> >   proper speed.
> > * I've done more measurements.
> >
> > This lets me confirm that there's really no downside of using the FIFO
> > more.  Specifically I did "flashrom -p ec -r /tmp/foo.bin" on a
> > Chromebook and averaged over several runs.
>
> Wouldn't there be a downside in the form of setting the watermark that
> close to the full FIFO we have less room for being late handling the
> interrupt? Or is there some mechanism involved that will prevent
> the FIFO from being overrun?

Yeah, I had that worry too, but, as described in 902481a78ee4 ("spi:
spi-geni-qcom: Actually use our FIFO"), it doesn't seem to be a
problem.  From that commit: "We are the SPI master, so it makes sense
that there would be no problems with overruns, the master should just
stop clocking."

-Doug
