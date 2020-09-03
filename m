Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649DB25C328
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 16:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgICOp4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 10:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729292AbgICOfR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 10:35:17 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D65C061246
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 07:35:17 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id z12so963421uam.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rXLxFi+fNCyjeqFnfAYDTSiQ62DVLQBxSbiw89atuck=;
        b=C8FbPyMoOuaDAUAP3f6Tkl0bV7CbwuPoTySJwTJt/01GpE+KCTnWNnGUtKNKPTCaiQ
         0h840v0TCvEk+7wTUtgVDPJ1KqE9eNc3jxsZYrpi4GMk0FmgnW1ga0OgwW2QJv04wdLp
         /p3Lhr/5FCpe7NCfyVFe4jL0DICEnJBP5lN2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rXLxFi+fNCyjeqFnfAYDTSiQ62DVLQBxSbiw89atuck=;
        b=mCiTvuWABp2sv0nyQXLtZRRT/g+h0XmUD4xDby8NF2nEDDin4YwVfA76Ic+3iEgzbp
         a6n/NkYqkOO/i0Z+jXB2wmID24gpQXQUMg1k/iuMcXNFuCaj5Taide5iaiYlfdOjZZ9r
         lN8eGCiZEVZed5tBUBzFFhe3vzdiQ7BvC/ZDapE8P5Qu3dswhqwzE4JdLgoZ7mzyvx+I
         q6s34hT/fxsQV+Eyqtys5PO+I0kWsBqlIdG6x7bdJJRT7o8OO6UswI8OUBKpVvavmmGm
         7m4j0nIfKN47A7hLmWELu1U9neeRZomF7EGbqc83/I5KbXHgSIUSOdfGk9vGdWsuF707
         CZ4g==
X-Gm-Message-State: AOAM5322c6HhzeAUubDZBYshf/PX5ALSdCugIZ7BIjmXRrvXioTyXpYW
        LevmovzNiNsjGizX9TXSLTrqTyAupwDMQg==
X-Google-Smtp-Source: ABdhPJwVBXZefaqRvbFHFfO7M2tqqPkAa1/mHSOz/ODwsrDM5lnl818YSPhalb8+Ts77In2mwVFZJw==
X-Received: by 2002:ab0:14b0:: with SMTP id d45mr1369282uae.139.1599143715273;
        Thu, 03 Sep 2020 07:35:15 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id b125sm516292vkb.6.2020.09.03.07.35.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 07:35:14 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id y194so1861998vsc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 07:35:14 -0700 (PDT)
X-Received: by 2002:a67:e447:: with SMTP id n7mr2033870vsm.53.1599143714032;
 Thu, 03 Sep 2020 07:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200902164303.1.I5e598a25222b4534c0083b61dbfa4e0e76f66171@changeid>
 <CAPDyKFoyKjKhwKGtLMtEyDSeSiBU6wasc=jt6c=sHnhN8jqqjg@mail.gmail.com>
In-Reply-To: <CAPDyKFoyKjKhwKGtLMtEyDSeSiBU6wasc=jt6c=sHnhN8jqqjg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Sep 2020 07:35:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaWwJnquPy+9aB89-1OwKmYKJv2PpfOkgo94Z6J8uRUg@mail.gmail.com>
Message-ID: <CAD=FV=WaWwJnquPy+9aB89-1OwKmYKJv2PpfOkgo94Z6J8uRUg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: Prefer asynchronous probe
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 3, 2020 at 1:10 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 3 Sep 2020 at 01:43, Douglas Anderson <dianders@chromium.org> wrote:
> >
> > Turning on initcall debug on one system showed this:
> >   initcall sdhci_msm_driver_init+0x0/0x28 returned 0 after 34782 usecs
> >
> > The lion's share of this time (~33 ms) was in mmc_power_up().  This
> > shouldn't be terribly surprising since there are a few calls to delay
> > based on "power_delay_ms" and the default delay there is 10 ms.
> >
> > Because we haven't specified that we'd prefer asynchronous probe for
> > this driver then we'll wait for this driver to finish before we start
> > probes for more drivers.  While 33 ms doesn't sound like tons, every
> > little bit counts.
> >
> > There should be little problem with turning on asynchronous probe for
> > this driver.  It's already possible that previous drivers may have
> > turned on asynchronous probe so we might already have other things
> > (that probed before us) probing at the same time we are anyway.  This
> > driver isn't really providing resources (clocks, regulators, etc) that
> > other drivers need to probe and even if it was they should be handling
> > -EPROBE_DEFER.
> >
> > Let's turn this on and get a bit of boot speed back.
>
> Thanks for a very well written commit message!
>
> Indeed, I am sure many mmc host drivers could benefit from a similar
> change. At least regular platform drivers and amba drivers are pretty
> sure to work, but who knows.

Yeah, and many non-mmc drivers can benefit too, which is why I've been
sending several of these patches recently as I optimize boot perf on
the device that's sitting in front of me.  ;-)  I think the idea was
that eventually we'd want the kernel to just turn on async by default
everywhere, but at the time the flag was introduced there were too
many subtle bugs everywhere.  It feels like one way to get to the
point where we'd be confident that this is OK to turn on everywhere is
to just start turning it on in lots of places.  Once enough places
have it on then perhaps that will give folks confidence that it's OK
to turn on by default across the board.

If you'd like, I can post patches to update some other set of MMC host
drivers, either as one giant patch (hard to backport, but not as
spammy) or as a large pile of patches.  I've never played with
coccinelle so I'd probably fall back to doing this by hand.  I could
probably only test on a small handful (I think I have easy access to
dw-mmc-rockchip and sdhci-of-arasan besides the msm one I already
posted), so another option is that I could also just post for those
devices...  ...or we can just hope others will notice and start
posting similar patches themselves after testing.  Let me know what
you'd prefer.  ;-)

-Doug
