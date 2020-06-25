Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE22F20A52F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390683AbgFYSse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390163AbgFYSsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:48:33 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11435C08C5DB
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 11:48:33 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id q15so2014616uap.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 11:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2HSTlC+xvvTVEIiDZNjif/2YAB7NC9wGDci4TXjb5k4=;
        b=QdiN+KN1PCgdTfT0qykspOWdQ0GE4a85keVNhJF/B9KD8nX5OCzgdo9kGqhhOVkDRo
         GtNrZJ5gc0rix6/CbFnqDTKqFgkUW+1wadHAcXvEMhQ2JN191kY3xSNDLi9AHOS0q4l9
         QGy8G5DkOZtfKQMzuV6cg3GZYbt6UvDuk5Z30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2HSTlC+xvvTVEIiDZNjif/2YAB7NC9wGDci4TXjb5k4=;
        b=cFDcIEfbo9Qcam30jdh5R+LS7LL9Lz8YQsbG1uzx9Cmbev05FPeEuU6Yi9fEQ1D/zm
         lpqR0VLTv92I2NfEblwfvBHy2Y8nQ1wwnU/DL/REC64qDsAZJrvnipaWB7NN/F2cNZzl
         jaF8MEXRNauDcl4KA3IXWTiNO57UkENpQX4iFmBOHici3WpgGr7BRb7lMoBdZJIiEoAd
         PlE//I4siWjprlmOI3zk2Mrm+b2FHQI7thewGiOpuv7vWAOlaUHH2c7L6ltt/4qbVExh
         U2D6M+5GSobdJ2Aa0EajyuHUu3rXJjStuq8AotB72vaMJX3gqPA2JMAAVKR3+0cBmXnH
         Jv8A==
X-Gm-Message-State: AOAM532ElcaOm6VnAnVpaYWp1cDEMtfN1V/oq2Ty5NOhrW/XK2GRTAMk
        h4YX9XMJvk/oD07k0RKQxFv9tcfo620=
X-Google-Smtp-Source: ABdhPJyhN9jpVBN1BMg9MNTVtDAWcwAufEDdVNebw7lCf+6Fqpw0/VDOm7a3qBnjx6vgCvieJf3jnw==
X-Received: by 2002:ab0:3145:: with SMTP id e5mr23429434uam.73.1593110911126;
        Thu, 25 Jun 2020 11:48:31 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id e14sm934093vsa.33.2020.06.25.11.48.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 11:48:30 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id r9so2227565ual.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 11:48:29 -0700 (PDT)
X-Received: by 2002:ab0:29c1:: with SMTP id i1mr23082895uaq.120.1593110909222;
 Thu, 25 Jun 2020 11:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200624170746.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
 <159304830840.62212.6716845486281369794@swboyd.mtv.corp.google.com>
 <CAD=FV=X=hbrT4o-PDs70zodAMUKEyLty7L92GtkyYBKQX_tt+w@mail.gmail.com> <159306803629.62212.16332166359080248822@swboyd.mtv.corp.google.com>
In-Reply-To: <159306803629.62212.16332166359080248822@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Jun 2020 11:48:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WsmKrWYhvGSq7CYhsQW9fvZ318py2oCawwv5NYOhVB4w@mail.gmail.com>
Message-ID: <CAD=FV=WsmKrWYhvGSq7CYhsQW9fvZ318py2oCawwv5NYOhVB4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Switch SPI to use GPIO for CS
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, LKML" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 24, 2020 at 11:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2020-06-24 20:35:16)
> > Hi,
> >
> > On Wed, Jun 24, 2020 at 6:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Douglas Anderson (2020-06-24 17:08:04)
> > > > The geni SPI protocol appears to have been designed without taking
> > > > Linux needs into account.  In all the normal flows it takes care of
> > > > setting chip select itself.  However, Linux likes to manage the chip
> > > > select so it can do fancy things.
> > > >
> > > > Back when we first landed the geni SPI driver we worked around this
> > > > by:
> > > > - Always setting the FRAGMENTATION bit in transfers, which (I believe)
> > > >   tells the SPI controller not to mess with the chip select during
> > > >   transfers.
> > > > - Controlling the chip select manually by sending the SPI controller
> > > >   commands to assert or deassert the chip select.
> > > >
> > > > Our workaround was fine and it's been working OK, but it's really
> > > > quite inefficient.  A normal SPI transaction now needs to do:
> > > > 1. Start a command to set the chip select.
> > > > 2. Wait for an interrupt from controller saying chip select done.
> > > > 3. Do a transfer.
> > > > 4. Start a command to unset the chip select.
> > > > 5. Wait for an interrupt from controller saying chip select done.
> > >
> > > I thought the GENI hardware was supposed to be able to queue commands up
> > > and then plow through them to interrupt the CPU when it finished. If
> > > that was supported would there be any problems? I assume we could remove
> > > the wait for CS disable and interrupt on step 5 and also the wait for
> > > CS/interrupt on step 2 because it is bundled with the transfer in step
> > > 3.
> >
> > Do you have any details or pointers to documentation on said ability
> > to queue commands?  I don't think I've ever heard of it.
> >
> > How exactly would it work, anyway?  There's no sequence number or
> > anything in GENI and there's a single "DONE" interrupt that signals
> > both "CS Done" and "Transfer Done", so without some really good docs
> > I'd have a really hard time figuring out how this is supposed to work.
>
> The driver is written to do the simplest thing possible, FIFOs and lots
> of interrupts. There are three different modes: PIO, DMA, and GSI/GPI
> (Generic Software Interface/Generic Programming Interface (those are
> ridiculous acronyms)). I don't know if the DMA mode gains anything,
> probably not except for large transfers but then why not use GSI? The
> performance gain, as far as I can tell, is to use GSI/GPI to program
> sequences into the serial engine (SE) and then kick them off and wait.
> The other side benefit of this is that it lets us share the same QUP
> between different EEs (execution environments) in the system.
>
> I hope someone at qcom can help to upstream support for this if
> performance is important. Otherwise we're left to stick band-aids on a
> driver that is polling a FIFO (sadness). I googled for the google pixel4
> kernel and found this[1] so maybe that can be used as a reference to
> support GSI mode. It looks like CS is stuck into the GSI queue thing
> (see go_flags and FRAGMENTATION[3]).

Definitely I'd be interested to see patches to make SPI work faster.
I'm going to try to characterize how slow things still are and then
will probably try to convince Qualcomm to help since I didn't see lots
of other obvious speedups.  Maybe, as you say, GSI/GPI is magic.

One thing I realized thinking through all this, though.  If we just
naively queue chip select commands without waiting for completion
we'll break Linux's assumptions.  Specifically Linux assumes that when
the SPI driver's set_cs() command returns that the chip select has
actually been set.  If a SPI client drivers sometimes need chip select
to be asserted for a minimum amount of time and so they need to know
that set_cs() actually did its job.  Checkout "struct spi_transfer"
and elements like "delay_usecs".  I know cros_ec uses some of these
fancier features.  See do_cros_ec_pkt_xfer_spi() for reference.

Ah, I guess if the GSI/GPI mode is fancy enough, though, maybe we
could implement one layer higher in the SPI core and provide a
transfer_one_message() instead of transfer_one().  Then we'd be fully
in charge of doing all of the delays ourselves.  So if we could queue
up a "set cs, optional delay, do transfer, optional delay, set cs,
optional delay, ..." then maybe it'd be OK.  I guess if there could be
multiple execution environments using the SPI we'd absolutely need to
implement this anyway since other EEs using the QUP would screw up the
standard timeout calculations.  Even if we did this, though, we still
might have trouble with multiple EEs for some fancier Linux drivers
without more work.  Specifically Linux drivers are allowed to call
spi_bus_lock() and then assume that they have full control of the bus
even across multiple messages.  I guess we'd need some way to make
sure that other EEs aren't running and then lock them out?  We also
would have to figure out how to handle the Linux API which allows you
to mess with lots of SPI parameters (including transfer speed) in the
middle of a message.


So I guess the summary of this is:

- Using GSI mode is a reason to not use GPIOs for chip select assuming
that GSI mode can actually support everything we need and is actually
faster.

- If there are multiple EEs then (mabye?) we can't use GPIOs for chip
select even ignoring GSI mode.  I don't know enough about multiple EEs
and what kind of sharing is supported to know for sure.  Is it
expected that multiple EEs are talking to the same physical peripheral
or are they using the same QUP but w/ a different chip select?  Are
pin mux settings forced to be the same for all EEs?


I guess the question is: are we interested in a short term speedup
while we wait for a better solution?  Maybe the right solution is to
just override this to use GPIOs only on boards known not to support
multiple EEs instead of overriding it in the overall SoC device tree
file?


> > > Where is the delay? On step 2 where we wait to transfer or at step 5
> > > when we wait for CS to be dropped, or both?
> >
> > Presumably every CS change takes the same amount of time?  ...so I'd
> > say "both".  If it really matters I can try to measure.
>
> Sure. You say you got a 25% speedup so I'm curious where the time
> improvement came from and what the raw numbers were before and after
> this patch.

In all cases I did 3 runs, so providing the average and raw:

# flashrom -p ec -r /tmp/foo.bin

IRQs before: 55796 ((55258 + 55613 + 56519) / 3)
IRQs after: 37512 ((37654 + 36312 + 38571) / 3)

Time before: 11.991 ((12.049 + 11.985 + 11.938) / 3)
Time after: 9.111 ((8.894 + 9.428 + 9.012) / 3)

# time flashrom -p ec -w /tmp/foo.bin

IRQs before: 52568 ((52343 + 52666 + 52696) / 3)
IRQs after: 36507 ((36051 + 35745 + 37727) / 3)

Time before: 13.015 ((12.940 + 13.004 + 13.100) / 3)
Time after: 9.325 ((8.934 + 9.520 +9.522) / 3)


I also gathered a bunch of timings.  Timings at boot are pretty wild
because so many things are happening at once, but it calms down a bit
later on.  Here are two patches I used for timings which also include
some sample timings in their description:

https://crrev.com/c/2267286
https://crrev.com/c/2267290

The quick summary is: even assuming no other overhead at all it takes
about 8 - 9 us just to assert the chip select.  The IRQ overhead isn't
a ton usually (2 - 4 us) but it takes a little while (~10us with lots
of variation) before we start running again on the task that was
waiting.

One thing I did note in the commit message is that I can also get a
speedup (though not as impressive) without configuring the CS to be a
GPIO by just caching the chip select state in the driver and avoiding
setting the chip select when it's already correct.  I still have this
patch, though it doesn't do anything if we switch the CS to GPIO.  I
can still post it if needed.  I stuck it at
<https://crrev.com/c/2267278> for now.  That only gave a 15% speedup,
not 25%.


> > > > Things are made a bit worse because the Linux GPIO framework assumes
> > > > that setting a chip select is quick.  Thus the SPI core can be seen to
> > > > tell us to set our chip select even when it's already in the right
> > > > state and we were dutifully kicking off commands and waiting for
> > > > interrupts.  While we could optimize that particular case, we'd still
> > > > be left with the slowness when we actually needed to toggle the chip
> > > > select.
> > >
> > > One thing to note is that the GPIO driver doesn't tell us that it has
> > > actually asserted/deasserted the GPIO. It writes to the controller and
> > > moves on so we don't know when it has actually gone into effect.
> > > Hopefully moving to GPIO mode doesn't mean we get weird problems where
> > > CS isn't asserted yet and a transfer starts wiggling the lines.
> >
> > cs-gpios is a pretty normal Linux concept and not something I
> > invented.  It's documented to work just fine and I can't see this as
> > being a real problem.
>
> This isn't just cs-gpios though. It's a general problem for the gpio
> controller on qcom platforms. I take it that it's worked well in the
> past so you feel confident that cs-gpios is solid. That's fair.

Hrm.  Is the qcom gpio driver somehow different from other platforms?
I think most code assumes that if it asserts a GPIO that it's
asserted, since it might be doing timing based on setting that GPIO.
I mean there are certainly things like pin rise times and also the
time it takes for the MMIO write to go over the bus, but I don't think
we need to worry about them here.


> > > > With this change I tested reading the firmware off the EC connected to
> > > > a ChromeOS device (flashrom -p ec -r ...).  I saw about a 25% speedup
> > > > in total runtime of the command and a 30% reduction in interrupts
> > > > generated (measured by /proc/interrupts).
> > >
> > > I see nothing wrong with specifying the CS gpios in DT. Seems like that
> > > should always be there and then the driver should decide to use GPIO
> > > mode or not. So
> > >
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > >
> > > for that part.
> >
> > I appreciate the tag, but I'm not sure it's working the way you're
> > thinking it does?  See:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/spi/spi-controller.yaml
> >
> > From there, when you specify spi-gpios it's saying: definitely use
> > this GPIO as the chip select, don't use your native one.  The bindings
> > explicitly show how you would specify the native GPIO.
> >
> > If we wanted the SPI controller to decide one way or the other on its
> > own, I guess we'd need an entirely new property saying that if it
> > wanted to control its chip select with GPIO then here's the GPIO and
> > then we'd need to provide a pinmux config for that.  That feels
> > overkill to me since I really see no reason not to use it as a GPIO.
>
> In the case of GPI or DMA mode or not either of those there seems to be
> quite a bit of overkill^Wconfigurability. Maybe the device node should
> get a different compatible string in these cases so that we can
> differentiate what is the intended mode of operation of the QUP.
> Otherwise I don't see how GSI could be supported when cs-gpios is
> present.
>
> The thing that shouldn't be happening is needing to change the dts file
> at the SoC level to make the driver do something different when that
> something different can be decided by the OS. More succinctly, from a DT
> perspective something is wrong if we're tweaking this node to change
> driver behavior.

I agree that GSI doesn't seem like it could be supported when cs-gpios
is present.

I guess I'm not quite as wedded to the immutability of the dts.  While
it's nice to not totally churn the dts and we're supposed to keep in
mind that the dts is supposed to be mostly stable, it doesn't feel
horrible to me to say that if you wanted to enable GSI that you'd have
to change the dts.

How about if we look at it this way: wouldn't it be possible to design
a board where the chip select of the SPI was over on some totally
different GPIO that's not part of a QUP?  The generic SPI bindings
(spi-controller.yaml) explicitly call this out as an OK thing to do,
saying that you could even have some devices using the native
controller chip select and some devices using a GPIO and that's OK.

Assuming we accept that as a valid use case then the SPI driver needs
to be able to work in a non-GSI mode if it's doing a transfer that's
using a GPIO chip select, right?  So if the dts specifies cs-gpios it
will still need to work.


Describing the SPI connection using cs-gpios instead of the native cs
is also not false.  The chip select line _is_ hooked up to a GPIO.
That same line can also be muxed to be the native chip select but that
doesn't make it untrue that it can also be thought of as a GPIO.

I mean, we could also certainly add an entry like this:

  qcom,native-cs-gpio = <...>

...and then we could add a second pinmux config in addition to
"default" called "native-cs-gpio" or something.  Then, if the driver
detected that "native-cs-gpio" (the GPIO and the pinconf) were there
and the driver hadn't yet implemented GSI and the driver knew there
weren't multiple execution environments then it could change the
pinmux and just set the GPIO in its set_cs() function.  That would be
more pristine from a device tree perspective (we're describing
_everything_), but it would also be a heck of a lot more code and
complexity.


Maybe yet another way to think about this whole thing: presumably we
would need firmware changes if we wanted to support sharing a SPI port
across multiple execution environments, right?  The dts describes not
just hardware but also (to some extent) firmware.  When we have
firmware that supports multiple EEs and it's all working then that
would be a good time to change the dts to describe the device+firmware
combo.


So to wrap it all up w/ a bow:

* I can post the SPI change that avoids setting the CS if it was
already right so everyone can get a (smaller) perf boost right away.
Simple and clean.

* We make the change to use cs-gpios just in board-specific device
trees for boards known not to support multiple EEs.  If/when firmware
changes are needed to support multiple EEs we'll update the dts.

* Geni SPI driver should always support both cs-gpios and native cs,
so we don't have to worry about incompatible changes.  Both are valid
ways to describe the device (assuming multiple EEs aren't used).

* If/when we get GSI code we won't be able to use it without changing
away from cs-gpios but cs-gpios should still be functional.


> > It's kinda like saying: if an SoC provided two different ways to set a
> > pin, one of which always delayed 50 us to assert and one that asserted
> > instantly, do we really need to write drivers to support both modes?
> > No.  The mode which delays 50 us is useless and there was no good
> > reason for the SoC to invent that mode and no reason to try to support
> > it in software.
> >
>
> [1] https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-coral-4.14-android10-c2f2/drivers/spi/spi-geni-qcom.c
>
> P.S. I see that android "fixed"[2] a race condition in the interrupt
> routine. Sounds familiar...
>
> [2] https://android.googlesource.com/kernel/msm/+/4ba87b2911be7a83e710c0211f2c1e512d3cd196
> [3] https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-coral-4.14-android10-c2f2/drivers/spi/spi-geni-qcom.c#655

It makes me incredibly disappointed to see fixes like this that
weren't posted upstream.

-Doug
