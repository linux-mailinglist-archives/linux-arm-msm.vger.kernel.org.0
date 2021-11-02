Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865A944341B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 17:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbhKBQ63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 12:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235174AbhKBQ6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 12:58:21 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F53BC061714
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Nov 2021 09:55:46 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z20so78698767edc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Nov 2021 09:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tYIH9BCKXM4QKHhqZXBOALqx1r1d4NNcaJHOgWVbZZk=;
        b=Exx/IDY92yPi6J6hrLpYS/bypaxwpotwWwEcNFHC35zdFNcX71KPbcu4gZQ2rPxGSG
         AtdPjN/GoGsP6QptsabhKIlmk3U8sLsk0NVt/UDM9I8It6koLXBJrJIxYCJ7OXMD70zk
         gs0K2lebtTrsL9cCkwnivr3UsYkzuEnxIfhnoEiAV7nm17NyL0OFheko1yLFkSc2fs8Q
         BHqE7yuU9FsJTP4rURuzoulU5YUAMA637OYUtbOH+/+so2DYkvmOkd1fJC10thL9/ZRP
         S/bcd1FdOlHQ/c2FRJo/pTbuKvoi05UTJSHbdqJHUkDV172P7HyiqAbZZZ4zyhdpQKxo
         XB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tYIH9BCKXM4QKHhqZXBOALqx1r1d4NNcaJHOgWVbZZk=;
        b=lYYywFxX8iAtx6e5Hksbb38MY74alDRR3sEg0YAIeZl4EKouVeeCvB5aVmqFnREQz/
         fsMVCsdPadTdRXH4UJCLFCdMZb2OmGd7rc36EIKXNIOhkADaX5SFpNvyMRhCHLusH5Lz
         8Ae2X8RPMlvQ/Mj2x1ij6c6QeK6gQX402o+n0maDGk+uzYfWGZOut4o8tlLtHk3PMB3W
         r/r2xX+pBigPEBYIc3MliPFyGWCQyqINfrh8WShKRPQF3CqTVLojDPRHq54e9HgkjY0q
         VxBmUuElDO6SGkNy9bkmLA7ReRwXvb3WbtRJW68x6RTtZHz4eJotOFqagq9Ve8OfjZ8q
         AgBw==
X-Gm-Message-State: AOAM531rmVVTkZFjvYfc5yMc2Yi8MMHWySZ7W4o3mOXSgCMs6IViHPmY
        mgD3WgwOAzhMh/CUphW08/ZIGx4FRXU1jP/7xT3k7g==
X-Google-Smtp-Source: ABdhPJyhFg7iw77QE3x3d9WfSrydYtw1Qal8WrmttQkpuxl0MUjRRq3qZFgfG87jp5HCLbIYH1H3sfLimv4fI5LHHYM=
X-Received: by 2002:a17:906:a217:: with SMTP id r23mr46121473ejy.548.1635872145076;
 Tue, 02 Nov 2021 09:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <20211009105132.GA204538@thinkpad> <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
 <20211022044229.GD3138@workstation> <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
 <20211022144026.GA7657@thinkpad> <CAAP7ucJGkAKqyvUJJnCgX8AejsHSaY0AeAxKoCJahAeVLw5ThQ@mail.gmail.com>
 <20211102105035.GB5646@thinkpad> <CAAP7ucLVtOR7+NJiWK_is0yv+zWKB9vmxpy4PyO5FQdVUE6uzA@mail.gmail.com>
 <20211102162259.GC5646@thinkpad>
In-Reply-To: <20211102162259.GC5646@thinkpad>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Tue, 2 Nov 2021 17:55:34 +0100
Message-ID: <CAAP7ucLLaYVBgLU7Fp5r21wtnqBhoYK-+9=qr3Rf1O1S81xDBw@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> > > > [    7.189547] mhi mhi0: Transitioning from PM state: Linkdown or
> > > > Error Fatal Detect to: SYS ERROR Process
> > >
> > > Hmm, I think the use of sync_power_up might be causing the issue here as it
> > > forces the MHI state to fatal error.
> > >
> > > Ignore the previous diff and try the below one:
> > >
> > > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > > index 59a4896a8030..b1e8c7de4e54 100644
> > > --- a/drivers/bus/mhi/pci_generic.c
> > > +++ b/drivers/bus/mhi/pci_generic.c
> > > @@ -637,7 +637,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
> > >         if (err)
> > >                 goto err_try_reset;
> > >
> > > -       err = mhi_sync_power_up(mhi_cntrl);
> > > +       err = mhi_async_power_up(mhi_cntrl);
>
> Doh! Sorry, I modified the wrong function. Here is the correct one:
>
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 59a4896a8030..1e3c74bfbe34 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -743,7 +743,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>                 goto err_unregister;
>         }
>
> -       err = mhi_sync_power_up(mhi_cntrl);
> +       err = mhi_async_power_up(mhi_cntrl);
>         if (err) {
>                 dev_err(&pdev->dev, "failed to power up MHI controller\n");
>                 goto err_unprepare;
>
> Let's see how it goes :)
>

Oh, wow, what a difference a single extra byte in the correct place makes! :D

This looks waaaaay better; I've rebooted the board at least 10 times
now and all of them worked nicely, at least just the process to probe
the device and get the control and net ports exposed looks very
reliable now. I'll test the setup with ModemManager in the next days
and see how everything goes. Thank you very much!

[    0.099778] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
[    0.099801] brcm-pcie fd500000.pcie:   No bus range found for
/scb/pcie@7d500000, using [bus 00-ff]
[    0.099839] brcm-pcie fd500000.pcie:      MEM
0x0600000000..0x0603ffffff -> 0x00f8000000
[    0.099891] brcm-pcie fd500000.pcie:   IB MEM
0x0000000000..0x00bfffffff -> 0x0000000000
[    0.149936] brcm-pcie fd500000.pcie: link up, 5 GT/s x1 (SSC)
[    0.150094] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
[    0.150113] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.150131] pci_bus 0000:00: root bus resource [mem
0x600000000-0x603ffffff] (bus address [0xf8000000-0xfbffffff])
[    0.150172] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
[    0.150263] pci 0000:00:00.0: PME# supported from D0 D3hot
[    0.153442] pci 0000:00:00.0: bridge configuration invalid ([bus
ff-ff]), reconfiguring
[    0.153565] pci 0000:01:00.0: [17cb:0306] type 00 class 0xff0000
[    0.153627] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    0.153657] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x00000fff 64bit]
[    0.153815] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.153867] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5 GT/s x1 link at 0000:00:00.0 (capable of 31.506 Gb/s with
16 GT/s x2 link)
[    0.156925] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    0.156963] pci 0000:00:00.0: BAR 8: assigned [mem 0x600000000-0x6000fffff]
[    0.156985] pci 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    0.157016] pci 0000:01:00.0: BAR 2: assigned [mem
0x600001000-0x600001fff 64bit]
[    0.157045] pci 0000:00:00.0: PCI bridge to [bus 01]
[    0.157060] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
[    0.157204] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
[    0.157322] pcieport 0000:00:00.0: PME: Signaling with IRQ 38
[    0.157550] pcieport 0000:00:00.0: AER: enabled with IRQ 38
[    7.054135] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
[    7.061303] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    7.069852] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
[    7.076642] mhi-pci-generic 0000:01:00.0: using shared MSI
[    7.082916] mhi mhi0: Requested to power ON
[    7.087228] mhi mhi0: Attempting power on with EE: PASS THROUGH,
state: SYS ERROR
[    7.094732] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
PASS THROUGH state: SYS ERROR
[    7.103513] mhi mhi0: System error detected
[    7.107695] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
[    7.113584] mhi mhi0: Handling state transition: SYS ERROR
[    7.119072] mhi mhi0: Transitioning from PM state: SYS ERROR Detect
to: SYS ERROR Process
[    7.127249] mhi-pci-generic 0000:01:00.0: firmware crashed (6)
[   14.646025] mhi mhi0: local ee: PASS THROUGH state: RESET device
ee: MISSION MODE state: READY
[   14.654700] mhi mhi0: Power on setup success
[   14.654712] mhi mhi0: Triggering MHI Reset in device
[   39.907896] mhi mhi0: Waiting for all pending event ring processing
to complete
[   39.915245] mhi mhi0: Waiting for all pending threads to complete
[   39.921363] mhi mhi0: Reset all active channels and remove MHI devices
[   39.927909] mhi mhi0: Resetting EV CTXT and CMD CTXT
[   39.932898] mhi mhi0: Exiting with PM state: SYS ERROR Process, MHI
state: RESET
[   39.940493] mhi mhi0: Handling state transition: PBL
[   39.945480] mhi mhi0: Device MHI is not in valid state
[   39.950633] mhi mhi0: Handling state transition: READY
[   39.955789] mhi mhi0: Device in READY State
[   39.959985] mhi mhi0: Initializing MHI registers
[   40.072692] mhi mhi0: State change event to state: M0
[   40.072714] mhi mhi0: local ee: MISSION MODE state: READY device
ee: MISSION MODE state: M0
[   40.086132] mhi mhi0: Received EE event: MISSION MODE
[   40.086135] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   40.099321] mhi mhi0: Handling state transition: MISSION MODE
[   40.105093] mhi mhi0: Processing Mission Mode transition
[   40.111360] mhi-pci-generic 0000:01:00.0: failed to suspend device: -16
[   40.118190] mhi_net mhi0_IP_HW0: 100: Updating channel state to: START
[   40.142376] mhi_net mhi0_IP_HW0: 100: Channel state change to START
successful
[   40.142379] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   40.157833] mhi_net mhi0_IP_HW0: 101: Updating channel state to: START
[   40.176197] mhi_net mhi0_IP_HW0: 101: Channel state change to START
successful
[   40.176200] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.595902] mhi mhi0: Allowing M3 transition
[   42.600217] mhi mhi0: Waiting for M3 completion
[   42.615163] mhi mhi0: State change event to state: M3
[   42.615184] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M3


-- 
Aleksander
https://aleksander.es
