Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBFAF4390E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 10:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhJYINY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 04:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhJYINX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 04:13:23 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF457C061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 01:11:00 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 5so23113060edw.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 01:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PnhiRluVA1GNBrhFVGJbj++exaHVmSGlB3qublUqPH4=;
        b=VpJ0kesizmK4UZkktIS6HfFg6UD0a8GcxnjEBUqRU3LmR9zqcVDzu1C9F83dr+JCFA
         fzsBw1S9h2o+GWo4Z9dSIiRbWspgabIj8GW0nzo6w62/5vaoX/yWR+eBIRbHK+qqvRou
         65a6/jM1ZGmh07lszu8l1pvPxya0J8vjULb3aQcP76Kuj2umzamviEdHyg23wXJiMo0i
         FcV5nWphG1dhksKVrW2Wqp87FoHmbKfDKQtolkTfHPwxxYiiQ5Hdfxu2z0e8YxB9yFSz
         FWQ0cIq1u7aEO4NgaQNjPm1CCTKCSCi5mlnO87Utw0WbA9oRFdLb8L43sQAt0Yr+rrll
         ElYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PnhiRluVA1GNBrhFVGJbj++exaHVmSGlB3qublUqPH4=;
        b=X9TK8B8wQ4HQ4O7zUZNIj7E8fLSFDDr3yIUZBzXfoLljBEqUFLgLUZoAxod3eorN2Q
         8EgiS4ZG/kyOu17kDCFpiYB9GDEnhB6puQQMqLUV/9/dWn9fvAkUC4gk3v4e8fQ3peEe
         FHVBDwEQt4dlkJ1Mh66jZ9iBQQWbK/CopYuEvIHNWHC2sQJ0Lq6PfvpJSN2XIB1lux4q
         avfZYTLVZwLYjSVZuoT0ZU1CBv/9brzF5bit7aJ6I68og1uZH3QnbeD1OtLHRW0pZe2e
         d+qRM1JBCP+oWKv9p65M3Pe6Y/hAHt3Qz0eTz7KgrhFZF2K8WSTBZCvqHFxA8A0Fpucu
         gH+A==
X-Gm-Message-State: AOAM531cuWuuPJ2BPd3XqQwogAOf42AH21kMmeCV15KX2LbdKih0Lxzf
        Rmb+qEFvNaiqBnKID6wtWj5U5MUztxabO1Bp6TW3xQ==
X-Google-Smtp-Source: ABdhPJzy98VKWURQnyalt+cBJkrADKlmfjd/Gw1w5XOH20NUEZ6NAqexOmUf13tdYGdm/wWxIxO6TJexv98PKTYO7tg=
X-Received: by 2002:a05:6402:278a:: with SMTP id b10mr24480584ede.134.1635149459454;
 Mon, 25 Oct 2021 01:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <20211009105132.GA204538@thinkpad> <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
 <20211022044229.GD3138@workstation> <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
 <20211022144026.GA7657@thinkpad>
In-Reply-To: <20211022144026.GA7657@thinkpad>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Mon, 25 Oct 2021 10:10:48 +0200
Message-ID: <CAAP7ucJGkAKqyvUJJnCgX8AejsHSaY0AeAxKoCJahAeVLw5ThQ@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Mani,

> > > > The successful boots seem to happen always on cold boots, and the
> > > > success rate is low (30% or so) on some manual testing here. I haven't
> > > > seen one single successful boot on system restarts, they all fail like
> > > > in the previous email.
> > > >
> > > > When the boot is successful it looks like this:
> > > >
> > >
> > > This looks to be a firmware issue. The device is in SYS_ERR state during
> > > boot and that's expected. But what is strange is that the device stays
> > > in SYS_ERR even after host issues RESET.
> > >
> > > Can you try the below diff and see if it does any good?
> > >
> > > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > > index fb99e3727155..a43c3ed77fb1 100644
> > > --- a/drivers/bus/mhi/core/pm.c
> > > +++ b/drivers/bus/mhi/core/pm.c
> > > @@ -104,7 +104,8 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
> > >         /* L3 States */
> > >         {
> > >                 MHI_PM_LD_ERR_FATAL_DETECT,
> > > -               MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE
> > > +               MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE |
> > > +               MHI_PM_SYS_ERR_PROCESS
> > >         },
> > >  };
> >
> > Tested again in the RPi CM4 based setup, but didn't help, it's failing
> > in the same way, still says PASS THROUGH state: SYS ERROR:
> >
>
> Yes, that's expected. As I said, the device is going to a bad state and from the
> host side, we could only try to recover it.
>
> > [    7.032037] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
> > [    7.039213] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> > 0x600000000-0x600000fff 64bit]
> > [    7.047759] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> > [    7.054573] mhi-pci-generic 0000:01:00.0: using shared MSI
> > [    7.060848] mhi mhi0: Requested to power ON
> > [    7.065277] mhi mhi0: Attempting power on with EE: PASS THROUGH,
> > state: SYS ERROR
> > [    7.072799] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
> > PASS THROUGH state: SYS ERROR
> > [    7.081589] mhi mhi0: System error detected
> > [    7.085867] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
> > [    7.091886] mhi mhi0: Handling state transition: SYS ERROR
> > [    7.097399] mhi mhi0: Transitioning from PM state: SYS ERROR Detect
> > to: SYS ERROR Process
> > [    7.105588] mhi-pci-generic 0000:01:00.0: firmware crashed (6)
> >
>
> What happened after this point? Can you share the complete log?
>

Here it is, including all pci and mhi related logs:

root@OpenWrt:~# dmesg | grep -E "mhi|pci"
[    0.100084] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
[    0.100108] brcm-pcie fd500000.pcie:   No bus range found for
/scb/pcie@7d500000, using [bus 00-ff]
[    0.100146] brcm-pcie fd500000.pcie:      MEM
0x0600000000..0x0603ffffff -> 0x00f8000000
[    0.100179] brcm-pcie fd500000.pcie:   IB MEM
0x0000000000..0x00bfffffff -> 0x0000000000
[    0.149979] brcm-pcie fd500000.pcie: link up, 5 GT/s x1 (SSC)
[    0.150139] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
[    0.150158] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.150177] pci_bus 0000:00: root bus resource [mem
0x600000000-0x603ffffff] (bus address [0xf8000000-0xfbffffff])
[    0.150218] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
[    0.150310] pci 0000:00:00.0: PME# supported from D0 D3hot
[    0.153509] pci 0000:00:00.0: bridge configuration invalid ([bus
ff-ff]), reconfiguring
[    0.153633] pci 0000:01:00.0: [17cb:0306] type 00 class 0xff0000
[    0.153695] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    0.153724] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x00000fff 64bit]
[    0.153882] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.153933] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5 GT/s x1 link at 0000:00:00.0 (capable of 31.506 Gb/s with
16 GT/s x2 link)
[    0.156989] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    0.157028] pci 0000:00:00.0: BAR 8: assigned [mem 0x600000000-0x6000fffff]
[    0.157049] pci 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    0.157081] pci 0000:01:00.0: BAR 2: assigned [mem
0x600001000-0x600001fff 64bit]
[    0.157109] pci 0000:00:00.0: PCI bridge to [bus 01]
[    0.157125] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
[    0.157269] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
[    0.157388] pcieport 0000:00:00.0: PME: Signaling with IRQ 38
[    0.157615] pcieport 0000:00:00.0: AER: enabled with IRQ 38
[    7.078915] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
[    7.086096] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    7.094681] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
[    7.101507] mhi-pci-generic 0000:01:00.0: using shared MSI
[    7.107746] mhi mhi0: Requested to power ON
[    7.112093] mhi mhi0: Attempting power on with EE: PASS THROUGH,
state: SYS ERROR
[    7.160844] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
PASS THROUGH state: SYS ERROR
[    7.169642] mhi mhi0: System error detected
[    7.173895] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
[    7.179762] mhi mhi0: Power on setup success
[    7.179833] mhi mhi0: Handling state transition: SYS ERROR
[    7.189547] mhi mhi0: Transitioning from PM state: Linkdown or
Error Fatal Detect to: SYS ERROR Process
[    7.198951] mhi-pci-generic 0000:01:00.0: firmware crashed (6)
[    7.204792] mhi mhi0: Waiting for all pending event ring processing
to complete
[    7.212102] mhi mhi0: Waiting for all pending threads to complete
[    7.218195] mhi mhi0: Reset all active channels and remove MHI devices
[    7.224726] mhi mhi0: Resetting EV CTXT and CMD CTXT
[    7.229702] mhi mhi0: Exiting with PM state: SYS ERROR Process, MHI
state: RESET
[    7.237103] mhi mhi0: Handling state transition: PBL
[    7.242071] mhi mhi0: Device MHI is not in valid state
[    7.247229] mhi mhi0: Handling state transition: DISABLE
[    7.252560] mhi mhi0: Processing disable transition with PM state:
SYS ERROR Process
[    7.260333] mhi mhi0: Triggering MHI Reset in device
[   14.716598] mhi mhi0: local ee: MISSION MODE state: RESET device
ee: MISSION MODE state: READY
[   14.739911] mhi mhi0: Waiting for all pending event ring processing
to complete
[   14.747239] mhi mhi0: Waiting for all pending threads to complete
[   14.753336] mhi mhi0: Reset all active channels and remove MHI devices
[   14.759867] mhi mhi0: Resetting EV CTXT and CMD CTXT
[   14.764834] mhi mhi0: Error moving from PM state: SYS ERROR Process
to: DISABLE
[   14.772146] mhi mhi0: Exiting with PM state: SYS ERROR Process, MHI
state: RESET
[   14.779545] mhi mhi0: Handling state transition: READY
[   14.784685] mhi mhi0: Device in READY State
[   14.788869] mhi mhi0: Initializing MHI registers
[   14.793593] mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
[   14.800842] mhi-pci-generic: probe of 0000:01:00.0 failed with error -110

> > I've tested the same patches in my desktop PC (based on 5.13.1, and
> > even without this last addition) and the boot process is much more
> > stable and I cannot see the "firmware crashed" errors reported. My
> > assumption right now is that the pci_generic.c entries we're adding
> > are correct, but there's some limitation in this system that is making
> > the EM9191 boot fail, but I still don't know which limitation it is.
> > The memory addresses in the "BAR 0: assigned" log are definitely
> > different in the RPi CM4, and also the shared MSI limitation. I recall
> > Thomas saying that he also tested on a desktop PC forcing the shared
> > MSI limitation and he had the same kind of firmware errors reported;
> > I'll also try to test that.
> >
>
> I think the PCI behaviour could be the issue between these 2 setups. But for
> knowing exactly what's happening we need to get the log of the modem (I don't
> think you can get that though).
>

Nope, I can't :/

-- 
Aleksander
https://aleksander.es
