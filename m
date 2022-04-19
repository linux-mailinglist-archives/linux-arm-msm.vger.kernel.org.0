Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599645075D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 19:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355039AbiDSRFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 13:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355629AbiDSREv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 13:04:51 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B897E457BA
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:55:44 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z99so22073839ede.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mvLjz0njahz5PSdk06N4fNganymZL6zmFdqJGNpo6kg=;
        b=lyvUtvWkZZgipPTQuvf/6SvWqzKOnrDsuU+Wt2SrnJMdOQE80Lc/E4YhBUD1D5FLc2
         PM/eXxKvBqGeL9IXzWO2qLCv57s0LaBhHz0piYdVL0u+NQZ/nNKz5kyIMPTMBuapuIzj
         nCHB0m47jWTl02BH7c8DGie+sr88LSWaI7WNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mvLjz0njahz5PSdk06N4fNganymZL6zmFdqJGNpo6kg=;
        b=KGz7kOeeBI7JxqplxCtYVAVNLZJqtkghN8DF7OqRroPVXqiuJ/jwNmDcT44+SnK3OD
         csJkhWtapxvhh08NM6Ql2/Xk/qVsf7+4vIqoN5P249cm6DBXyFTRD0wV7tALpb2Hoosw
         YPGqpfem1ohYjwQjpJ/A/WFzuRYjg+Ba2t0sUZ6zQxnKA0YQfMAPypeDIQpCvhbSMX6X
         09ftzabqEp/HJrPWC6yJjrDTJWme/yJJVayiJ4x9HfYuDJcwgLgq/QirngkSdLIl4CYG
         e99Ee1Zan3wFU7QfmjFJUfb2hSDw08PyzLREZX5RgVUN59pjkB2qHWPT7FNzXI+L2O1c
         oZdw==
X-Gm-Message-State: AOAM531gPWXtBFgwg+tUinbAQRx0Lo3EdX5fuEWjAoM+ErhT4MX/tIV9
        D9P/U39SPmAON/sQEzKJrb7zh6BQG+8fTsdA
X-Google-Smtp-Source: ABdhPJwqY+aDU03+FFIUx2BO86mRwuZ9UXxh8SSiHZ0A5P9Hr2EpllXappiTwrfFpT0DzuSY84Ba1A==
X-Received: by 2002:a05:6402:27c7:b0:41b:51ca:f542 with SMTP id c7-20020a05640227c700b0041b51caf542mr18667895ede.149.1650387339725;
        Tue, 19 Apr 2022 09:55:39 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709063bc800b006e898cfd926sm5832806ejf.134.2022.04.19.09.55.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 09:55:39 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id bv16so6142608wrb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:55:38 -0700 (PDT)
X-Received: by 2002:adf:a29c:0:b0:20a:a246:a826 with SMTP id
 s28-20020adfa29c000000b0020aa246a826mr4796793wra.422.1650387338293; Tue, 19
 Apr 2022 09:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220330090947.9100-1-chenxiangrui@huaqin.corp-partner.google.com>
 <a0eb6bf9-256a-29b1-2211-496df710f531@linaro.org> <CAD=FV=UjyLofXZqnj=bL89fza5JS6O5Np9W-A4V4WK+na0hdrw@mail.gmail.com>
 <b7ff08b8-60fb-7629-9399-3d5cca46ab9e@linaro.org> <CAD=FV=Vx5g_xTRZGc9wW=ZLnfsOcubTYFcnYQRC5jLm+n3en0w@mail.gmail.com>
 <606cc762-a0c2-49a4-3e5d-d2dbd4595bc7@linaro.org>
In-Reply-To: <606cc762-a0c2-49a4-3e5d-d2dbd4595bc7@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 Apr 2022 09:55:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W_SA-3PfDFi-Gkjk9pew5bchFNjQhXX8MkZyuy5UohEQ@mail.gmail.com>
Message-ID: <CAD=FV=W_SA-3PfDFi-Gkjk9pew5bchFNjQhXX8MkZyuy5UohEQ@mail.gmail.com>
Subject: Re: [PATCH] CHROMIUM: arm64: dts: qcom: Add sc7180-gelarshie
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 19, 2022 at 8:47 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/04/2022 19:36, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Apr 14, 2022 at 12:10 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 13/04/2022 23:48, Doug Anderson wrote:
> >>> I'm actually kinda curious: is there really a good reason for this? I
> >>> know I haven't been adding things to
> >>> `Documentation/devicetree/bindings/arm/qcom.yaml` for Qualcomm
> >>> Chromebooks.  Ironically, it turns out that the script I typically use
> >>> to invoke checkpatch happens to have "--no-tree" as an argument and
> >>> that seems to disable this check. Doh!
> >>>
> >>> That being said, though, I do wonder a little bit about the value of
> >>> enumerating the top-level compatible like this in a yaml file.
> >>> Certainly the yaml schema validation in general can be quite useful,
> >>> but this top-level listing seems pure overhead. I guess it makes some
> >>> tools happy, but other than that it seems to provide very little
> >>> value...
> >>
> >> If compatible is not part of ABI, it is allowed to change in whatever
> >> shape one wishes. In such case, how can anyone (e.g. user-space)
> >> identify the board? Model name? Also not part of ABI (not documented)...
> >
> > Hmm, it is a good question. I guess one issue is that the way
> > Chromebooks interact with the bootloader it's not trivially easy to
> > enumerate what exactly the compatible will be in this hardcoded list.
> > It all has to do with the whole "revision" and "sku" scheme the
> > bootloader on ARM Chromebooks uses. For example, on one Chromebook I
> > have the bootloader prints out:
> >
> > Compat preference: google,lazor-rev5-sku6 google,lazor-rev5
> > google,lazor-sku6 google,lazor
> >
> > What that means is that:
> >
> > 1. The bootloader will first look for 'google,lazor-rev5-sku6'. If it
> > finds a dts with that compatible it will pick it.
> >
> > 2. The bootloader will then look for 'google,lazor-rev5'. If it finds
> > a dts with that compatible it will pick it.
> >
> > 3. The bootloader will then look for 'google,lazor-sku6'. If it finds
> > a dts with that compatible it will pick it.
> >
> > 4. Finally, the bootloader will look for 'google,lazor'.
> >
> > There's a method to the madness. Among other things, this allows
> > revving the board revision for a change to the board even if it
> > _should_ be invisible to software. The rule is always that the
> > "newest" device tree that's in Linux is always listed _without_ a
> > board revision number. An example might help.
> >
> > a) Assume '-rev5' is the newest revision available. In Linux this
> > would be the only dts that advertises "google,lazor" (with no -rev).
> > Previous dts file would advertise "-rev3" or "-rev4" or whatever.
> >
> > b) We need to spin the board for something that should be invisible to
> > software. Just in case, HW guys change the board strappings to -rev6.
> > This works _seamlessly_ because the newest dts file always advertises
> > just "google,lazor"
> >
> > c) We spin the board for something that's _not_ invisible. It will be
> > "-rev7". Now, we go back and add "-rev5" and "-rev6" to the old board
> > dts file and remove the advertisement for "google,lazor". We create a
> > new dts file for -rev7 that advertises "google,lazor".
>
> Except shuffling the compatibles in bindings, you are changing the
> meaning of final "google,lazor" compatible. The bootloader works as
> expected - from most specific (rev5-sku6) to most generic compatible
> (google,lazor) but why do you need to advertise the latest rev as
> "google,lazor"? Why the bootloader on latest rev (e.g. rev7) cannot bind
> to rev7 compatible?

The problem really comes along when a board strapped as -rev8 comes
along that is a board spin (and thus a new revision) but "should" be
invisible to software. Since it should be invisible to software we
want it to boot without any software changes. As per my previous mail,
sometimes HW guys make these changes without first consulting software
(since it's invisible to SW!) and we want to make sure that they're
still going to strap as "-rev8".

So what happens with this -rev8 board? The bootloader will check and
it won't see any device tree that advertises "google,lazor-rev8",
right? If _all_ lazor revisions all include the "google,lazor"
compatible then the bootloader won't have any way to know which to
pick. The bootloader _doesn't_ have the smarts to know that "-rev7" is
closest to "-rev8". It'll just randomly pick one of the "google,lazor"
boards. :( This is why we only advertise "google,lazor" for the newest
device tree.

Yes, I agree it's not beautiful but it's what we ended up with. I
don't think we want to compromise on the ability to boot new revisions
without software changes because that will just incentivize people to
not increment the board revision. The only other option would be to
make the bootloader smart enough to pick the "next revision down" but
so far they haven't been willing to do that.


I guess the question, though, is what action should be taken. I guess
options are:

1. Say that the above requirement that new "invisible" HW revs can
boot w/ no software changes is not a worthy requirement. Personally, I
wouldn't accept this option.

2. Ignore. Don't try to document top level compatible for these devices.

3. Document the compatible and accept that it's going to shuffle around a lot.

4. Try again to get the bootloader to match earlier revisions as fallbacks.


> > Now we can certainly argue back and forth above the above scheme and
> > how it's terrible and/or great, but it definitely works pretty well
> > and it's what we've been doing for a while now. Before that we used to
> > proactively add a whole bunch of "future" revisions "just in case".
> > That was definitely worse and had the same problem that we'd have to
> > shuffle compatibles. See, for instance `rk3288-veyron-jerry.dts`.
> >
> > One thing we _definitely_ don't want to do is to give HW _any_
> > incentive to make board spins _without_ changing the revision. HW
> > sometimes makes spins without first involving software and if it
> > doesn't boot because they updated the board ID then someone in China
> > will just put the old ID in and ship it off. That's bad.
> >
> > --
> >
> > But I guess this doesn't answer your question: how can userspace
> > identify what board this is running? I don't have an answer to that,
> > but I guess I'd say that the top-level "compatible" isn't really it.
>
> It can, the same as bootloader, by looking at the most specific
> compatible (rev7).
>
> > If nothing else, I think just from the definition it's not guaranteed
> > to be right, is it? From the spec: "Specifies a list of platform
> > architectures with which this platform is compatible." The key thing
> > is "a list". If this can be a list of things then how can you use it
> > to uniquely identify what one board you're on?
>
> The most specific compatible identifies or, like recently Rob confirmed
> in case of Renesas, the list of compatibles:
> https://lore.kernel.org/linux-devicetree/Yk2%2F0Jf151gLuCGz@robh.at.kernel.org/

I'm confused. If the device tree contains the compatibles:

"google,lazor-rev4", "google,lazor-rev3", "google,lazor", "qualcomm,sc7180"

You want to know what board you're on and you look at the compatible,
right? You'll decide that you're on a "google,lazor-rev4" which is the
most specific compatible. ...but you could have booted a
"google,lazor-rev3". How do you know?

Further, imagine a case where two different HW manufacturers take some
reference design and each build hardware that's identical except for
what's plugged into PCIe / USB / eDP ports. We could have a single
device tree for these, right? So you could imagine a device tree with
compatibles these compatibles to support the imaginary CompUTown
CompUBox and the TheBestStuff BestBox computers:

"computown,compubox", "thebeststuff,bestbox"

Now you boot up. How do you know if you're on a CompUBox or a BestBox?


> > That all being said, I think that on Chrome OS the userspace tools
> > _do_ some amount of parsing of the compatible strings here. For
> > Chromebooks they leverage the fact that they understand the above
> > scheme and thus can figure things out. I think they also use things
> > like `/proc/device-tree/firmware/coreboot/board-id` and
> > `/proc/device-tree/firmware/coreboot/sku-id`. That doesn't seem to be
> > documented, though. :(
> >
> > I guess the question is, though, why do you need to know what board you're on?
>
> You might have (and I had in some previous job) single user-space
> application working on different HW and responding slightly differently,
> depending on the hardware it runs. Exactly the same as kernel behaves
> differently, depending on DTB. The differences for example might be in
> GPIOs or some other interfaces managed via user-space drivers, not in
> presence of devices. Another example are system tests behaving
> differently depending on the DUT, where again you run the tests in a
> generic way so the DUT is autodetected based on board.
>
> Of course you could say: different hardware, has different DTB, so
> user-space should check entire tree, to figure out how to operate that
> hardware. Yeah, that's one way, very complex and actually duplicating
> kernel's work. Embedded apps are specialized, so it is much easier for
> them to check board compatible and make assumptions on that.

I mean, it's fine if you want to make assumptions for the hardware
that you work on.

-Doug
