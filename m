Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0DA25CE55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 01:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgICX2z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 19:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgICX2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 19:28:51 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC7CC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 16:28:50 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id n7so1227795vkq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 16:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zBCZhBygC1UVuyhB28Mkxg6VIAClsA68YLoMi7be6qk=;
        b=mRUfysYmS3NDn5aKWuf1gtB4334+e2ypg80FQGoiH8AAUtyd428dXVDQmMJNlU9aA/
         J3oeET6+toomiPWirNevd0JtqTZEnYWTMIZeeb6+op3mgRtvOiIgZhfTeMuv96i5JMlE
         +wwugTe/+akeQf5UVpePPMPBkPTLlwJ84wltE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zBCZhBygC1UVuyhB28Mkxg6VIAClsA68YLoMi7be6qk=;
        b=HPoDHTH7hBD/HUVo+gYxAZgss1vhSo0+Qhm9tYW5UEIFdWktXczZr1UsxMI8t5a+nW
         HUJFmCFWoa4q4J1eePIS/wxFey3nfM9uuKHS15I+iKtgop7YTeXzgmNGA/HodUanFFmt
         ppun0g/I9SabQRLBXxbx5dWvnAAHR7cGuBkje7y5qYSNlpq172t/xFjatQauAYu7JjZW
         xtEhT1l7CTpMKLxaF2jX6Wfo96FGorNg10ff+NQOPOoM1m0AwzT+Fl94ZpluzhcrVSgC
         Jz3PpVa9HelxSrCJlP7WoUV5sqSySpDDfvxZ/Zlvlu6+wzmINeHOU0GmBW7/rVNd4Tdt
         2zIw==
X-Gm-Message-State: AOAM531B6fAbhTmIMR91DMoHhGNYqlE5ydZ8EPymxewwHGObF5U0utpX
        /QVUMzeSgrWl+v2loxK2LBImdU2NgsMPaA==
X-Google-Smtp-Source: ABdhPJyaJRsxIiY1sNuB5/bWNzp4cWOfUIRd9DiJcOX4HID458J4BT2bZk2eSKv9Mz9wX5o4VnUAww==
X-Received: by 2002:a1f:4646:: with SMTP id t67mr3844162vka.75.1599175729390;
        Thu, 03 Sep 2020 16:28:49 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a195sm732086vka.42.2020.09.03.16.28.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 16:28:48 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id j188so2709885vsd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 16:28:48 -0700 (PDT)
X-Received: by 2002:a67:2203:: with SMTP id i3mr4069456vsi.110.1599175728077;
 Thu, 03 Sep 2020 16:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200902164303.1.I5e598a25222b4534c0083b61dbfa4e0e76f66171@changeid>
 <CAPDyKFoyKjKhwKGtLMtEyDSeSiBU6wasc=jt6c=sHnhN8jqqjg@mail.gmail.com>
 <CAD=FV=WaWwJnquPy+9aB89-1OwKmYKJv2PpfOkgo94Z6J8uRUg@mail.gmail.com> <CAPDyKFq31bucJhP9hp1HSqh-qM2uNGHgDoyQpmbJf00nEf_T4Q@mail.gmail.com>
In-Reply-To: <CAPDyKFq31bucJhP9hp1HSqh-qM2uNGHgDoyQpmbJf00nEf_T4Q@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Sep 2020 16:28:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UK+Ri8MN+Ty4rC-OmDCBLPjiRx8s8d8w35JbuT8z7LjQ@mail.gmail.com>
Message-ID: <CAD=FV=UK+Ri8MN+Ty4rC-OmDCBLPjiRx8s8d8w35JbuT8z7LjQ@mail.gmail.com>
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

On Thu, Sep 3, 2020 at 7:44 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 3 Sep 2020 at 16:35, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Sep 3, 2020 at 1:10 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > On Thu, 3 Sep 2020 at 01:43, Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > Turning on initcall debug on one system showed this:
> > > >   initcall sdhci_msm_driver_init+0x0/0x28 returned 0 after 34782 usecs
> > > >
> > > > The lion's share of this time (~33 ms) was in mmc_power_up().  This
> > > > shouldn't be terribly surprising since there are a few calls to delay
> > > > based on "power_delay_ms" and the default delay there is 10 ms.
> > > >
> > > > Because we haven't specified that we'd prefer asynchronous probe for
> > > > this driver then we'll wait for this driver to finish before we start
> > > > probes for more drivers.  While 33 ms doesn't sound like tons, every
> > > > little bit counts.
> > > >
> > > > There should be little problem with turning on asynchronous probe for
> > > > this driver.  It's already possible that previous drivers may have
> > > > turned on asynchronous probe so we might already have other things
> > > > (that probed before us) probing at the same time we are anyway.  This
> > > > driver isn't really providing resources (clocks, regulators, etc) that
> > > > other drivers need to probe and even if it was they should be handling
> > > > -EPROBE_DEFER.
> > > >
> > > > Let's turn this on and get a bit of boot speed back.
> > >
> > > Thanks for a very well written commit message!
> > >
> > > Indeed, I am sure many mmc host drivers could benefit from a similar
> > > change. At least regular platform drivers and amba drivers are pretty
> > > sure to work, but who knows.
> >
> > Yeah, and many non-mmc drivers can benefit too, which is why I've been
> > sending several of these patches recently as I optimize boot perf on
> > the device that's sitting in front of me.  ;-)  I think the idea was
> > that eventually we'd want the kernel to just turn on async by default
> > everywhere, but at the time the flag was introduced there were too
> > many subtle bugs everywhere.  It feels like one way to get to the
> > point where we'd be confident that this is OK to turn on everywhere is
> > to just start turning it on in lots of places.  Once enough places
> > have it on then perhaps that will give folks confidence that it's OK
> > to turn on by default across the board.
>
> Yeah, I guess this is the only way forward at this point.
>
> >
> > If you'd like, I can post patches to update some other set of MMC host
> > drivers, either as one giant patch (hard to backport, but not as
> > spammy) or as a large pile of patches.  I've never played with
> > coccinelle so I'd probably fall back to doing this by hand.  I could
> > probably only test on a small handful (I think I have easy access to
> > dw-mmc-rockchip and sdhci-of-arasan besides the msm one I already
> > posted), so another option is that I could also just post for those
> > devices...  ...or we can just hope others will notice and start
> > posting similar patches themselves after testing.  Let me know what
> > you'd prefer.  ;-)
>
> Honestly, I don't know. You go ahead with the option you prefer - then
> I will have a look. :-)
>
> Don't worry if we break some, as it should be rather easy to fix - as
> long as we keep an eye on it.

OK, I probably spent way too much time on it, but here it is in all of
its glory:

https://lore.kernel.org/r/20200903232441.2694866-1-dianders@chromium.org/

-Doug
