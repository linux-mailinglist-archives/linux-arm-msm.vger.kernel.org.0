Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11A12098C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 05:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389663AbgFYDfh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 23:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388485AbgFYDfe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 23:35:34 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8447C061795
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 20:35:33 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id r9so1436607ual.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 20:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zt5YvFe/0F+bWJgTS3kII0SGfZuZaLK6nHaXi0WGsWM=;
        b=i00CCZjmDKwYuQM+UKH0th2PYsJzYpCI3wpvtwLt0Tt9OYWvWAntwVBLeZ6x7AY3ic
         f5RUb7l7DAjCwgbPXYqffaL+hZkRg3TTfqd22Ja7UWuHwacMErgsCczKs3H6fbHtNy1u
         N8aAnNBLzPktP3hBHOY7gPnq/Z8w2LfsCKK/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zt5YvFe/0F+bWJgTS3kII0SGfZuZaLK6nHaXi0WGsWM=;
        b=MvGCfrm0PwmgDEgKSynKNaigBRlYTF5KujWgbJAP7S2///92cHf64vI3UC2l9P/H7l
         TSHEZm5E1V2ZedShzAqae95sx72cEEMc7lnoZbvPAudf0RcEVbB1nl/VzkN1BM5DyJiJ
         MAcKAn+mkKjDwYrlIQ4sglhLHSTPrrYxYOHxVcjtp7MksF8P3M+cGk3HL5nnRABvtjNa
         PZI1Z4NrZvgzGMZq6J3cFVq5iFgGh+uOG+5MiAN6UgNbqLMi+PhyIKxP5TZIXQMYwJBx
         kCXcYzxP+va+lD5bgbYLrDzTwE/vQVuycU899KgdewKYhuoqzCjpUe7JJhXjx6oGdv39
         ZLvw==
X-Gm-Message-State: AOAM530Sz9fvsM5MB4elCzsVwRN3XnMAXbA6zlMhAUCTnJ+lQr/6XNxZ
        RGSY5oEmEhtLLYllH7nr2ASd8dNggDo=
X-Google-Smtp-Source: ABdhPJwPyqiQt0WvGMj/SH3rT4m2XQqIBpcVH/zMu08jJVuPnf6ZSNvRX7ENTuKXjrcdktVSXP/RhQ==
X-Received: by 2002:ab0:3043:: with SMTP id x3mr20587391ual.10.1593056132075;
        Wed, 24 Jun 2020 20:35:32 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id t74sm1842099vkc.12.2020.06.24.20.35.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 20:35:31 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id v1so2759182vsb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 20:35:30 -0700 (PDT)
X-Received: by 2002:a67:2fc6:: with SMTP id v189mr9563477vsv.198.1593056130302;
 Wed, 24 Jun 2020 20:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200624170746.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
 <159304830840.62212.6716845486281369794@swboyd.mtv.corp.google.com>
In-Reply-To: <159304830840.62212.6716845486281369794@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Jun 2020 20:35:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=hbrT4o-PDs70zodAMUKEyLty7L92GtkyYBKQX_tt+w@mail.gmail.com>
Message-ID: <CAD=FV=X=hbrT4o-PDs70zodAMUKEyLty7L92GtkyYBKQX_tt+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Switch SPI to use GPIO for CS
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 24, 2020 at 6:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-06-24 17:08:04)
> > The geni SPI protocol appears to have been designed without taking
> > Linux needs into account.  In all the normal flows it takes care of
> > setting chip select itself.  However, Linux likes to manage the chip
> > select so it can do fancy things.
> >
> > Back when we first landed the geni SPI driver we worked around this
> > by:
> > - Always setting the FRAGMENTATION bit in transfers, which (I believe)
> >   tells the SPI controller not to mess with the chip select during
> >   transfers.
> > - Controlling the chip select manually by sending the SPI controller
> >   commands to assert or deassert the chip select.
> >
> > Our workaround was fine and it's been working OK, but it's really
> > quite inefficient.  A normal SPI transaction now needs to do:
> > 1. Start a command to set the chip select.
> > 2. Wait for an interrupt from controller saying chip select done.
> > 3. Do a transfer.
> > 4. Start a command to unset the chip select.
> > 5. Wait for an interrupt from controller saying chip select done.
>
> I thought the GENI hardware was supposed to be able to queue commands up
> and then plow through them to interrupt the CPU when it finished. If
> that was supported would there be any problems? I assume we could remove
> the wait for CS disable and interrupt on step 5 and also the wait for
> CS/interrupt on step 2 because it is bundled with the transfer in step
> 3.

Do you have any details or pointers to documentation on said ability
to queue commands?  I don't think I've ever heard of it.

How exactly would it work, anyway?  There's no sequence number or
anything in GENI and there's a single "DONE" interrupt that signals
both "CS Done" and "Transfer Done", so without some really good docs
I'd have a really hard time figuring out how this is supposed to work.


> Where is the delay? On step 2 where we wait to transfer or at step 5
> when we wait for CS to be dropped, or both?

Presumably every CS change takes the same amount of time?  ...so I'd
say "both".  If it really matters I can try to measure.


> > Things are made a bit worse because the Linux GPIO framework assumes
> > that setting a chip select is quick.  Thus the SPI core can be seen to
> > tell us to set our chip select even when it's already in the right
> > state and we were dutifully kicking off commands and waiting for
> > interrupts.  While we could optimize that particular case, we'd still
> > be left with the slowness when we actually needed to toggle the chip
> > select.
>
> One thing to note is that the GPIO driver doesn't tell us that it has
> actually asserted/deasserted the GPIO. It writes to the controller and
> moves on so we don't know when it has actually gone into effect.
> Hopefully moving to GPIO mode doesn't mean we get weird problems where
> CS isn't asserted yet and a transfer starts wiggling the lines.

cs-gpios is a pretty normal Linux concept and not something I
invented.  It's documented to work just fine and I can't see this as
being a real problem.


> > All the chip select lines can actually be muxed to be GPIOs and
> > there's really no downside in doing so.  Now Linux can assert and
> > deassert the chip select at will with a simple MMIO write.
> >
> > The SPI driver will still have the ability to set the chip select, but
> > not we just won't use it.
>
> s/not/now/?

Sigh.  I always make that typo.  I can spin if need be to fix.


> > With this change I tested reading the firmware off the EC connected to
> > a ChromeOS device (flashrom -p ec -r ...).  I saw about a 25% speedup
> > in total runtime of the command and a 30% reduction in interrupts
> > generated (measured by /proc/interrupts).
>
> I see nothing wrong with specifying the CS gpios in DT. Seems like that
> should always be there and then the driver should decide to use GPIO
> mode or not. So
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> for that part.

I appreciate the tag, but I'm not sure it's working the way you're
thinking it does?  See:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/spi/spi-controller.yaml

From there, when you specify spi-gpios it's saying: definitely use
this GPIO as the chip select, don't use your native one.  The bindings
explicitly show how you would specify the native GPIO.

If we wanted the SPI controller to decide one way or the other on its
own, I guess we'd need an entirely new property saying that if it
wanted to control its chip select with GPIO then here's the GPIO and
then we'd need to provide a pinmux config for that.  That feels
overkill to me since I really see no reason not to use it as a GPIO.

It's kinda like saying: if an SoC provided two different ways to set a
pin, one of which always delayed 50 us to assert and one that asserted
instantly, do we really need to write drivers to support both modes?
No.  The mode which delays 50 us is useless and there was no good
reason for the SoC to invent that mode and no reason to try to support
it in software.


> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 ++++++++++++++++++++++++----
> >  1 file changed, 49 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 3a8076c8bdbf..74c8503b560e 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -1204,65 +1213,97 @@ pinmux {
> >                         qup_spi0_default: qup-spi0-default {
> >                                 pinmux {
> >                                         pins = "gpio34", "gpio35",
> > -                                              "gpio36", "gpio37";
> > +                                              "gpio36";
> >                                         function = "qup00";
> >                                 };
> > +                               pinmux-cs {
> > +                                       pins = "gpio37";
> > +                                       function = "gpio";
> > +                               };
> >                         };
> >
> >                         qup_spi1_default: qup-spi1-default {
> >                                 pinmux {
> >                                         pins = "gpio0", "gpio1",
> > -                                              "gpio2", "gpio3";
> > +                                              "gpio2";
> >                                         function = "qup01";
> >                                 };
> > +                               pinmux-cs {
> > +                                       pins = "gpio3";
> > +                                       function = "gpio";
> > +                               };
> >                         };
> >
> >                         qup_spi3_default: qup-spi3-default {
> >                                 pinmux {
> >                                         pins = "gpio38", "gpio39",
> > -                                              "gpio40", "gpio41";
> > +                                              "gpio40";
> >                                         function = "qup03";
> >                                 };
> > +                               pinmux-cs {
> > +                                       pins = "gpio41";
> > +                                       function = "gpio";
> > +                               };
> >                         };
> >
> >                         qup_spi5_default: qup-spi5-default {
> >                                 pinmux {
> >                                         pins = "gpio25", "gpio26",
> > -                                              "gpio27", "gpio28";
> > +                                              "gpio27";
> >                                         function = "qup05";
> >                                 };
> > +                               pinmux-cs {
> > +                                       pins = "gpio28";
> > +                                       function = "gpio";
> > +                               };
> >                         };
> >
> >                         qup_spi6_default: qup-spi6-default {
> >                                 pinmux {
> >                                         pins = "gpio59", "gpio60",
> > -                                              "gpio61", "gpio62";
> > +                                              "gpio61";
> >                                         function = "qup10";
> >                                 };
> > +                               pinmux-cs {
> > +                                       pins = "gpio62";
> > +                                       function = "gpio";
> > +                               };
> >                         };
> >
> >                         qup_spi8_default: qup-spi8-default {
> >                                 pinmux {
> >                                         pins = "gpio42", "gpio43",
> > -                                              "gpio44", "gpio45";
> > +                                              "gpio44";
> >                                         function = "qup12";
> >                                 };
> > +                               pinmux-cs {
> > +                                       pins = "gpio45";
> > +                                       function = "gpio";
> > +                               };
> >                         };
> >
> >                         qup_spi10_default: qup-spi10-default {
> >                                 pinmux {
> >                                         pins = "gpio86", "gpio87",
> > -                                              "gpio88", "gpio89";
> > +                                              "gpio88";
> >                                         function = "qup14";
> >                                 };
> > +                               pinmux-cs {
> > +                                       pins = "gpio89";
> > +                                       function = "gpio";
> > +                               };
> >                         };
> >
> >                         qup_spi11_default: qup-spi11-default {
> >                                 pinmux {
> >                                         pins = "gpio53", "gpio54",
> > -                                              "gpio55", "gpio56";
> > +                                              "gpio55";
> >                                         function = "qup15";
> >                                 };
> > +                               pinmux-cs {
> > +                                       pins = "gpio56";
> > +                                       function = "gpio";
> > +                               };
> >                         };
>
> Perhaps we should have qup-spiN-default and qup-spiN-cs-gpio though?
> That way the driver can properly mux the pin to be gpio mode if it wants
> to. I don't see a way to mux the pin to be "qup" until the driver
> decides it doesn't want that.

This seems like extra complexity.  Why would the SPI controller ever
need to control the GPIO itself.  If we ever do come up with a reason
we can solve it then?

-Doug
