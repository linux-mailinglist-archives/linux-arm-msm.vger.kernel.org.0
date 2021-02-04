Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885633100C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 00:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhBDXco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 18:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbhBDXcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 18:32:43 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8626C06178C
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 15:32:02 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id a19so5256880qka.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 15:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jfgN1Restt9I36IGGj88fWby00ZfDjFzTRO4sWvWV6w=;
        b=iyGX44jpeSw5rV8s/D8kmbogcE3FC4DfoYC/IYFTFoucCtFlV9sGrC5ubdA6OeVbh+
         bAdPfUI2GWVMK5V+RcKHtdmDAMG3eYaRhlTyhfVxJBNOQjhK8keu6dPp3ueASnR+AXZY
         HOGFAE/flO83W74H31y3HQrk+0gwyYGSsgAHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jfgN1Restt9I36IGGj88fWby00ZfDjFzTRO4sWvWV6w=;
        b=TIkE9cioBX6XLRQjKwN+qRnUf0tMBjIX17OrSiDRKymvhO26mGXM3F+JoDGM5pKd4H
         jfKtWRNg1z0C2dpYLd/XkmMXQZKtdah5xGNDRv2QoCgbsMrTS2GGRzENDFX42LCtTOBN
         WgGBBzoFUrQcK41JxFZORP+u6IpktoRrDxW2c7x5nQQRaeoQm8J+JT/xUvxk/nr7dscK
         QizOeCiRjjQQjqYy1tNWAUSEms4BK4qea+wpYX5EPxp25GU++oTupci56AYcdWFcmkUl
         MobXIHm7pMolRWrklbV15NXjevNkNaKocNSIyDKcCl9e0F6UlkzVhgggf+bduSUX/vSS
         lOWQ==
X-Gm-Message-State: AOAM530vGI/RoWiCHq9plk21Y08L88Eb8vKTSy07qpX+m4AKbuT1TrG0
        ZXfmhNKJuHFcGc9vydvdU6ZeNspuOQfsOw==
X-Google-Smtp-Source: ABdhPJwHNNW0xhzFjnjaDAKtxDVHfF2fHdpok6WYPkGyfbyPfUxtBlZOr8kQr9wKi8cqOQDpb/QJhw==
X-Received: by 2002:a05:620a:9c3:: with SMTP id y3mr1614299qky.327.1612481521583;
        Thu, 04 Feb 2021 15:32:01 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id v67sm6623130qkd.94.2021.02.04.15.32.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 15:32:01 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id r2so4915225ybk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 15:32:01 -0800 (PST)
X-Received: by 2002:a25:60d6:: with SMTP id u205mr2488489ybb.276.1612481520606;
 Thu, 04 Feb 2021 15:32:00 -0800 (PST)
MIME-Version: 1.0
References: <20210204204904.294555-1-dmitry.baryshkov@linaro.org> <YBx+LcgrbyUKpYig@builder.lan>
In-Reply-To: <YBx+LcgrbyUKpYig@builder.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 4 Feb 2021 15:31:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
Message-ID: <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: add pinctrl for SPI using
 GPIO as a CS
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 4, 2021 at 3:07 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 04 Feb 14:49 CST 2021, Dmitry Baryshkov wrote:
>
> > GENI SPI controller shows several issues if it manages the CS on its own
> > (see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
> > use GPIO for CS")) for the details. Provide pinctrl entries for SPI
> > controllers using the same CS pin but in GPIO mode.

I'm curious: were you seeing real problems or are you just trying to
optimize things more?  The only known problem (other than performance)
that I'm aware of is that if you get really high interrupt latency
then setting the chip select can appear to "fail" (we timeout waiting
for the interrupt saying that the chip select command was done).  The
SPI framework doesn't expect setting the chip select to be something
that can fail so error handling isn't the most amazing in this case,
though at least it shouldn't crash after the most recent fixes I sent
to the SPI driver.


> Doug, can you confirm that this is the final (or at least current)
> verdict?

As far as I know using a GPIO chip select is always superior on
Qualcomm hardware unless you're forced into GPI/GSI mode.  In GPI/GSI
mode (I think) you lose full control of the chip select anyway.  I
wrote this long-winded explanation recently to explain it to someone
else.  Pasting here in case it's useful, though there's overlap w/ the
commit message that Dmitry pointed at.

---

In general the Linux kernel supports using any GPIO as a SPI chip
select.  However, it also supports the concept that a SPI controller
may have its own way of controlling chip select.  You can freely mix
and match these approaches.  For instance maybe you've got 4 devices
on a single SPI "bus" (we never do this on Chrome OS designs but it is
possible).  The SPI controller itself might have the ability to
control two chip selects.  You could still make things work by hooking
two of the peripherals up to GPIOs and two up to the SPI controller's
native chip selects and it'd all be hunky dory.  Or you could choose
to not use any of the builtin chip selects and use all 4 on GPIOs.
...or 3 and 1.

When a SPI controller has a builtin chip select, it can usually be
configured in two ways: something more automatic where the controller
asserts the chip select and deasserts it automatically around
transfers or in a fully manual mode.  In general Linux prefers the
fully manual mode.  The Linux API to SPI endpoint drivers is super
flexible and allows them to assert/deassert chip select at will and
it's hard to honor that flexibility when it's not manually controlled.

If a SPI chip select is manually controlled it's not at all different
from a GPIO configured in "output mode".  Thus using a GPIO instead of
a builtin chip select has no real downsides.

On many SoCs, sc7180 included, pinmuxing allows you to reconfigure
almost any pin as a GPIO.  So it turns out that on sc7180 boards it's
just a different way of looking at it to say whether we're hooked up
to a GPIO or we're hooked up to the native chip select logic.  Both
are valid ways to look at it.

On Qualcomm SoCs it's incredibly inefficient to control the native SPI
chip select in "manual mode".  It involves sending a packet (a
command) to the SPI controller and waiting for it to respond that it
set the chip select.  However, it is plenty efficient to control
GPIOs.  Thus it is more efficient (with no real downsides) to envision
that the chip select is hooked up to a GPIO instead of the native chip
select.

---

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 380 +++++++++++++++++++++++++++
> >  1 file changed, 380 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 3cea28058a91..03015174ec06 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -3046,6 +3046,25 @@ config {
> >                               };
> >                       };
> >
> > +                     qup_spi0_cs_gpio: qup-spi0-cs-gpio {
>
> There might be others who need the same states, but I would prefer if we
> move this to the device's dts.

This is opposite to what Stephen requested, though it was in a review
on our gerrit and not on lists [1].  :-P

It definitely feels like a 6 of one half dozen of the other.  Unless
you're dead set on moving them to the board dts my bias would be
towards keeping consistent with what was done on sc7180.  If you
really want this moved to the board file we should do it for sc7180
too.


> > +                             mux {
>
> Rather than splitting the properties in {mux, cs, config} I think it
> makes more sense to split them in {spi, cs} or something like that.

In general pinconf doesn't belong in the SoC dts file.  If there's no
reason to change it seems like this should match what sc7180 did.


[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2406557/1/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
