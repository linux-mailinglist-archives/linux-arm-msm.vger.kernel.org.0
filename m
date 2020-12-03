Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882562CDF52
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 21:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgLCUHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 15:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbgLCUHG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 15:07:06 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE510C061A52
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 12:06:25 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id b190so716268vka.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 12:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WwWDqEC8lyXk+mn1FQGbjXgjK1A6t7ai7KM73ZqCvxQ=;
        b=JZlzLv/7eUN9ngMAPHflR850vYNlUh906JW7nXe5twIRxisHFKPZJttlH5jNpvEvhb
         yKG/KJaF+YlnxZhqOAHdfTcGPlsMWZ+gnBWwmeafntjEpWxINf2/us1f1y63BGbuPoGE
         B4o/tnChgNBLLw7eeBdBwGq1VGAqi9VDdQcTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WwWDqEC8lyXk+mn1FQGbjXgjK1A6t7ai7KM73ZqCvxQ=;
        b=Hvxa0BvA5YNv1QcOYec0BWAy8+KcPPQagD6OM9usw0NyPSSR7eDsBTP12xTDVAaGP8
         +aj92fFJ1jYmFbWJObCZa893FTGpHewPzmYkiU3l/MQyEfMdmwbpdl3Z4HcfTGoa9/NT
         oEuX/vGouLx0KqRA3Qky/5UoLTvF+FHG2PzxrMIbfbemtPcE6drXDGq2LSqwIJzdrBEJ
         qOYAVC80UlCnRXyGWz4FpNcy94gKf0/paqEnS2MNeCjhJacHXPafGmgoagw7K4h7C0qz
         RA8k31dLTZb2KE/jA6ZeSZbFl3hWTLocAYdb7UioMMDL5H8fYo9DY3Uao8bsAspqxDAO
         JPqw==
X-Gm-Message-State: AOAM533twsYBUDy5Wal5k2zmjp5Cu1YeHYbLZ7JifdNG8XFL/KU3HEaR
        jZ7B8M4kEAajz+vtR6WbtxrV/6UIDdnWEg==
X-Google-Smtp-Source: ABdhPJzfipiPP6XrTMWuUskV78kiIHgqk5QTX/Gi8p7x3bv5eicbUgg/X+gRn+nJqU1nmgdl/i3+Bg==
X-Received: by 2002:a1f:cdc4:: with SMTP id d187mr1032126vkg.4.1607025984268;
        Thu, 03 Dec 2020 12:06:24 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id r23sm50794vsj.17.2020.12.03.12.06.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 12:06:23 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id h6so1966768vsr.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 12:06:23 -0800 (PST)
X-Received: by 2002:a67:4242:: with SMTP id p63mr1071347vsa.34.1607025982604;
 Thu, 03 Dec 2020 12:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20201202214935.1114381-1-swboyd@chromium.org> <CAHNYxRwMD4XahHXWW9z7b=VCOEsdPe5Df4CohNwmBy_ijWJ62g@mail.gmail.com>
 <160695172591.2717324.17788035024164242534@swboyd.mtv.corp.google.com> <160695644776.2717324.633265815704005177@swboyd.mtv.corp.google.com>
In-Reply-To: <160695644776.2717324.633265815704005177@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Dec 2020 12:06:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WDYdfURHWf8qGOSwT+7Y5i=9FMgRn5hYZA-oTfR6KoFQ@mail.gmail.com>
Message-ID: <CAD=FV=WDYdfURHWf8qGOSwT+7Y5i=9FMgRn5hYZA-oTfR6KoFQ@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-geni-qcom: Use the new method of gpio CS control
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Alexandru M Stan <amstan@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Dec 2, 2020 at 4:47 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Stephen Boyd (2020-12-02 15:28:45)
> > Quoting Alexandru M Stan (2020-12-02 14:18:20)
> > > Unfortunately this patch makes my cros-ec (the main EC that used to
> > > work even before my debugging) also fail to probe:
> > > [    0.839533] cros-ec-spi spi6.0: EC failed to respond in time
> > > [    1.040453] cros-ec-spi spi6.0: EC failed to respond in time
> > > [    1.040852] cros-ec-spi spi6.0: Cannot identify the EC: error -110
> > > [    1.040855] cros-ec-spi spi6.0: cannot register EC, fallback to spidev
> > > [    1.040942] cros-ec-spi: probe of spi6.0 failed with error -110
> > >
> > > I wasn't closely looking at this part closely when I was using my
> > > other spi port with spidev, so this is why I haven't noticed it
> > > before.
> > > Doug suggests this might be a polarity issue. More scoping to be had.
> > >
> >
> > Ah I see. It looks like the cs-gpios polarity is wrong for the DTS on
> > sc7180. That's a patch that Doug has sent in for the qcom tree, commit
> > 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to use
> > GPIO for CS") and it is pending for the next release (v5.11). Doug says
> > he will send in a fix for the DTS side, but this patch is still "good"
> > as far as I can tell. It moves us to use gpio descriptors and also finds
> > bugs like this in the DTS file that we would have missed otherwise
> > because the legacy mode doesn't look at the polarity flags in DT.
>
> And that is wrong. With even more investigation and Doug's eagle eyes it
> seems that the cros-ec driver is overriding the spi::mode to clear out
> the SPI_CS_HIGH bit that the spi core sets in there when using the gpio
> descriptors. I'll send a patch for cros-ec-spi shortly.

So do we need any coordinating here, are we OK w/ trogdor devices
being broken for a short period of time?

I think the device tree changes switching to use GPIO for chip select
is already queued in linux-next.  That means if we land this patch
before the fix to cros_ec [1] then we'll end up in a broken state.
Would we be able to do some quick landing to get the cros-ec fix into
v5.10 and then target the SPI patch for 5.11?

-Doug

[1] https://lore.kernel.org/r/20201203011649.1405292-2-swboyd@chromium.org/
