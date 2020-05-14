Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3221D36AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 18:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgENQkh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 12:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgENQkg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 12:40:36 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B210AC061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 09:40:36 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id r3so1833078qve.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 09:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HWFeoUCCAGrwFNZxgc3//5BRvEIhNROwr+Wf1EbQfmY=;
        b=UvPlZl0iOaSxRCrz4fSlO6xyQ4m5RIN2qw1rZtiYNuvBFSSNHUv+z6jsScDG2JkoLZ
         9KPzqq9Yz+Xek9thEBwb1hxG4RE2BMXein7EOEaNp8aruvGk13N+6glTTIgL7iBjci/B
         OvS5nH3CBDh2XG23YTlRN04vrysWYTmp0OAqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWFeoUCCAGrwFNZxgc3//5BRvEIhNROwr+Wf1EbQfmY=;
        b=uiYQQMCAFxU/r4iCXTtU+1JlL1COUat4opO7fh1Dc6FodfGyUpcoVvDSx2epJrgEco
         ddnG86iatAxI4AKnZTPiMwQVHL/ELO/GDPzeocFajNukwbGKRbe9dd4XpdNN5eJOyI3q
         c1YYUmaHCIw4RNW/OYFXxsK6crZASX7Ui7+3wpD3U09iZUe4HYdR1fmgNB98dg9gjtYS
         na9Y/N7MXM++NbOlcN4uG6FX07o2qNPV4gj3U+DDGQCWh6MoH5qrGFBuuvZmR27uqJZb
         g7wK6r9kxGc9umTsTpvf+J0t+blFzmx4bYnj6nPNp4ZP5A8Z/NLoiWW59FC5tcXO+lgK
         es5g==
X-Gm-Message-State: AOAM532RLJ65M2RJF4WdFRqIfzAkoksx9h4dZid8jHP8zFK02XOrazrl
        xIDq9keu9sxyIVcnuRZMIZrOWm/czV4=
X-Google-Smtp-Source: ABdhPJxIXhSQlp7IBYAJdun8ixJwBidTfoH0vCTq4Bpcd71axdx8UyqerejHSWVginoBN3PoRnUxhg==
X-Received: by 2002:ad4:4b72:: with SMTP id m18mr5763900qvx.62.1589474435579;
        Thu, 14 May 2020 09:40:35 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id h12sm3018149qtb.19.2020.05.14.09.40.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 09:40:35 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id l3so1988810qvo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 09:40:35 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr4374233vsq.109.1589474077707;
 Thu, 14 May 2020 09:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200507200850.60646-1-dianders@chromium.org> <20200514162109.6qt5drd27hpilijh@holly.lan>
In-Reply-To: <20200514162109.6qt5drd27hpilijh@holly.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 May 2020 09:34:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+t_Wg5KadZBTGHMSEXY3c-t6DZAtdaLXys31QJJpGGA@mail.gmail.com>
Message-ID: <CAD=FV=X+t_Wg5KadZBTGHMSEXY3c-t6DZAtdaLXys31QJJpGGA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] kgdb: Support late serial drivers; enable early
 debug w/ boot consoles
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     Jason Wessel <jason.wessel@windriver.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Frank Rowand <frowand.list@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-serial@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Jiri Slaby <jslaby@suse.com>,
        kgdb-bugreport@lists.sourceforge.net,
        Sumit Garg <sumit.garg@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Gross <agross@kernel.org>, bp@alien8.de,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Enrico Weigelt <info@metux.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        James Morse <james.morse@arm.com>,
        Juergen Gross <jgross@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        jinho lim <jordan.lim@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 14, 2020 at 9:21 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, May 07, 2020 at 01:08:38PM -0700, Douglas Anderson wrote:
> > <snip>
> >
> > My first attempt was to try to get the existing "ekgdboc" to work
> > earlier.  I tried that for a bit until I realized that it needed to
> > work at the tty layer and I couldn't find any serial drivers that
> > managed to register themselves to the tty layer super early at boot.
> > The only documented use of "ekgdboc" is "ekgdboc=kbd" and that's a bit
> > of a special snowflake.  Trying to get my serial driver and all its
> > dependencies to probe normally and register the tty driver super early
> > at boot seemed like a bad way to go.  In fact, all the complexity
> > needed to do something like this is why the system already has a
> > special concept of a "boot console" that lives only long enough to
> > transition to the normal console.
> >
> > <snip>
> >
> > The devices I had for testing were:
> > - arm32: rk3288-veyron-jerry
> > - arm64: rk3399-gru-kevin
> > - arm64: qcom-sc7180-trogdor (not mainline yet)
> >
> > These are the devices I tested this series on.  I tried to test
> > various combinations of enabling/disabling various options and I
> > hopefully caught the corner cases, but I'd appreciate any extra
> > testing people can do.  Notably I didn't test on x86, but (I think) I
> > didn't touch much there so I shouldn't have broken anything.
>
> I have tested a slightly earlier version using qemu and will test this
> set before it moves forwards.
>
>
> >  .../admin-guide/kernel-parameters.txt         |  20 ++
> >  Documentation/dev-tools/kgdb.rst              |  24 ++
> >  arch/arm64/Kconfig                            |   1 +
> >  arch/arm64/include/asm/debug-monitors.h       |   2 +
> >  arch/arm64/kernel/debug-monitors.c            |   2 +-
> >  arch/arm64/kernel/traps.c                     |   3 +
> >  arch/x86/Kconfig                              |   1 +
> >  drivers/tty/serial/8250/8250_early.c          |  23 ++
> >  drivers/tty/serial/amba-pl011.c               |  32 +++
> >  drivers/tty/serial/kgdboc.c                   | 268 ++++++++++++++++--
> >  drivers/tty/serial/qcom_geni_serial.c         |  32 +++
> >  include/linux/kgdb.h                          |   4 +
> >  kernel/debug/debug_core.c                     |  52 +++-
> >  lib/Kconfig.kgdb                              |  18 ++
> >  14 files changed, 436 insertions(+), 46 deletions(-)
>
> Any thoughts on how best to land these changes?
>
> AFAICT the arm64

I was hoping to get an Ack from Will or Catalin for my most recent
arm64 patch [1] and then it could land in your tree.  However, it
wouldn't be the end of the world if that landed later.  "kgdbwait"
would be broken if you used it together with "kgdb_earlycon" but
overall we'd still be in a better place than we were.


> and 8250/amba-pl011/qcom_geni_serial code
> could be applied independently of the kgdb changes

Right, that would be OK.  Nobody would actually be able to use
"kgdb_earlycon" until those landed but there would be no problem with
those two landing separately.


> (though we must keep
> changes to drivers/tty/serial/kgdboc alongside the kgdb changes).
>
> I can hoover them up but I'd need a solid set of acks and
> I don't think we've got that yet.

It would be nice for it to be explicit, but "get_maintainer" says that
Greg KH is the maintainer of serial drivers.  Git log confirms that he
also has been the one landing changes to these files.  Early-on he
provided his Reviewed-by for the series as a whole, so he's aware of
it and maybe would be fine w/ the serial changes landing through the
kgdb tree?

Greg: is that correct?


> I'd also be happy to ack where needed and let someone else pick it up
> (the other changes queued for kgdb this cycle are pretty small so we
> shouldn't see much conflict in kernel/debug/ ).

It feels to me that the kgdb tree is the best destination for all
these patches if possible.


[1] https://lore.kernel.org/r/20200513160501.1.I0b5edf030cc6ebef6ab4829f8867cdaea42485d8@changeid

-Doug
