Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1030448064
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 14:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237799AbhKHNlo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 08:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237209AbhKHNln (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 08:41:43 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74034C061570
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 05:38:58 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id x15so31331427edv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 05:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8goefwJhuSrgEXVUb6TltoykX+GCQSW2V6YEVBB0iVc=;
        b=vE9EzvxXXArBvmqvgzWXthyjiKHW6dpt33VHf91Hc2W/B9GwOas5SjWo2MBTDax4Kn
         ib9mFV2V32s2SW07smOr+1hCoj0ROavl7Ba+tKnymn/acc3fd6WeNCsUPIiFvujd9yyR
         HBSHH5o4zs+aAQ+7wa79l/VIRVubvmD0252igl9pEsgvNPCNLEGdsT91RVlWtubhr35I
         V5WdJSu1qHI+2sPb/Ka+ZU2tLCAz3+VFpu77Tv/Ee3A+Jpzj6JTmQnuCr2KksZDikC5u
         EgJ7x0XKGQoc9iSAhYZjSeyaydgfbfgLDw9yYIdJorqbUeVlKeZEJMVMvaQ8Saz2RMFH
         6NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8goefwJhuSrgEXVUb6TltoykX+GCQSW2V6YEVBB0iVc=;
        b=0PF6GKDOXatBF5oviPiQCDDhev8Uozfi90dIhS3u/36Fr1PpSm4YyG7qqLkpo+TxJ6
         gAVQN+wmryIoX8QKX4RIA7RPn2dxSfma1F5pfoWgEAGZ5Z/TtDVBD9QhK51MsqC1VGcq
         dMSkpkYXgLKLMeDuih08syXwYlj3LHT4Ob4fzzHn3R4hOy6BwvxYNTw0KuQHfjD90PqD
         jEtAlAx/fFex1lQc3MFIipGjk9AiHHyXU7MDv1xFBTwItxqtpsuuOI+TG+/llS4/e749
         JC4xxmhdJ5WKY1COPqU+wTIlYwfjRgGzPqJwGZemH7SLJL5meoA2Njlxa2QZVSknnpwR
         7dkQ==
X-Gm-Message-State: AOAM531HF5Iq+InDKzm3A6l4MDma8LqMeDG3MhwI03NXa76pmbXWDTqb
        lPqkGcOkjZZtVbbFa+gxaJfzhbRJxqSXJHoxQuzT0g==
X-Google-Smtp-Source: ABdhPJyMlfSloPeVxeACmFjLicLwZYnTecmqAvusbspM15l5esTRpZu+VZZkHzj4/GKt8/E2Tya3Ymdc8Xr3LkvVFi0=
X-Received: by 2002:a17:906:4fc5:: with SMTP id i5mr21084457ejw.475.1636378736839;
 Mon, 08 Nov 2021 05:38:56 -0800 (PST)
MIME-Version: 1.0
References: <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
 <20211022044229.GD3138@workstation> <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
 <20211022144026.GA7657@thinkpad> <CAAP7ucJGkAKqyvUJJnCgX8AejsHSaY0AeAxKoCJahAeVLw5ThQ@mail.gmail.com>
 <20211102105035.GB5646@thinkpad> <CAAP7ucLVtOR7+NJiWK_is0yv+zWKB9vmxpy4PyO5FQdVUE6uzA@mail.gmail.com>
 <20211102162259.GC5646@thinkpad> <CAAP7ucLLaYVBgLU7Fp5r21wtnqBhoYK-+9=qr3Rf1O1S81xDBw@mail.gmail.com>
 <20211102180912.GD5646@thinkpad> <20211108074044.GA6161@thinkpad>
In-Reply-To: <20211108074044.GA6161@thinkpad>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Mon, 8 Nov 2021 14:38:45 +0100
Message-ID: <CAAP7ucKgovKQUN8wBpBEpLTKWDWGp6MvPD0ASBw8Feb=OC6jDQ@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
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

Hey Mani,

> On Tue, Nov 02, 2021 at 11:39:12PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Nov 02, 2021 at 05:55:34PM +0100, Aleksander Morgado wrote:
> > > > > > > [    7.189547] mhi mhi0: Transitioning from PM state: Linkdown or
> > > > > > > Error Fatal Detect to: SYS ERROR Process
> > > > > >
> > > > > > Hmm, I think the use of sync_power_up might be causing the issue here as it
> > > > > > forces the MHI state to fatal error.
> > > > > >
> > > > > > Ignore the previous diff and try the below one:
> > > > > >
> > > > > > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > > > > > index 59a4896a8030..b1e8c7de4e54 100644
> > > > > > --- a/drivers/bus/mhi/pci_generic.c
> > > > > > +++ b/drivers/bus/mhi/pci_generic.c
> > > > > > @@ -637,7 +637,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
> > > > > >         if (err)
> > > > > >                 goto err_try_reset;
> > > > > >
> > > > > > -       err = mhi_sync_power_up(mhi_cntrl);
> > > > > > +       err = mhi_async_power_up(mhi_cntrl);
> > > >
> > > > Doh! Sorry, I modified the wrong function. Here is the correct one:
> > > >
> > > > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > > > index 59a4896a8030..1e3c74bfbe34 100644
> > > > --- a/drivers/bus/mhi/pci_generic.c
> > > > +++ b/drivers/bus/mhi/pci_generic.c
> > > > @@ -743,7 +743,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > > >                 goto err_unregister;
> > > >         }
> > > >
> > > > -       err = mhi_sync_power_up(mhi_cntrl);
> > > > +       err = mhi_async_power_up(mhi_cntrl);
> > > >         if (err) {
> > > >                 dev_err(&pdev->dev, "failed to power up MHI controller\n");
> > > >                 goto err_unprepare;
> > > >
> > > > Let's see how it goes :)
> > > >
> > >
> > > Oh, wow, what a difference a single extra byte in the correct place makes! :D
> > >
> > > This looks waaaaay better; I've rebooted the board at least 10 times
> > > now and all of them worked nicely, at least just the process to probe
> > > the device and get the control and net ports exposed looks very
> > > reliable now. I'll test the setup with ModemManager in the next days
> > > and see how everything goes. Thank you very much!
> > >
> >
> > That's great to hear! Let me know how your testing goes with ModemManager. I'll
> > then submit a patch to fix the pci-generic driver.
> >
>
> Can you please test the attached patch? We had an internal discussion and came
> to a conclusion that the device is not handling the SYS_ERR case during host
> bootup. So we need to adjust the SYS_ERR logic handling in host to workaround
> it.
>

I reverted the previous patch and added this one; seems to be working
well. See debug log:

[    0.099473] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
[    0.099497] brcm-pcie fd500000.pcie:   No bus range found for
/scb/pcie@7d500000, using [bus 00-ff]
[    0.099534] brcm-pcie fd500000.pcie:      MEM
0x0600000000..0x0603ffffff -> 0x00f8000000
[    0.099568] brcm-pcie fd500000.pcie:   IB MEM
0x0000000000..0x00bfffffff -> 0x0000000000
[    0.149884] brcm-pcie fd500000.pcie: link up, 5 GT/s x1 (SSC)
[    0.150042] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
[    0.150061] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.150080] pci_bus 0000:00: root bus resource [mem
0x600000000-0x603ffffff] (bus address [0xf8000000-0xfbffffff])
[    0.150121] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
[    0.150212] pci 0000:00:00.0: PME# supported from D0 D3hot
[    0.153399] pci 0000:00:00.0: bridge configuration invalid ([bus
ff-ff]), reconfiguring
[    0.153521] pci 0000:01:00.0: [17cb:0306] type 00 class 0xff0000
[    0.153583] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    0.153613] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x00000fff 64bit]
[    0.153771] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.153822] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5 GT/s x1 link at 0000:00:00.0 (capable of 31.506 Gb/s with
16 GT/s x2 link)
[    0.156875] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    0.156914] pci 0000:00:00.0: BAR 8: assigned [mem 0x600000000-0x6000fffff]
[    0.156935] pci 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    0.156967] pci 0000:01:00.0: BAR 2: assigned [mem
0x600001000-0x600001fff 64bit]
[    0.156996] pci 0000:00:00.0: PCI bridge to [bus 01]
[    0.157011] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
[    0.157156] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
[    0.157275] pcieport 0000:00:00.0: PME: Signaling with IRQ 38
[    0.157498] pcieport 0000:00:00.0: AER: enabled with IRQ 38
[    7.029598] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
[    7.036761] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    7.045318] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
[    7.052156] mhi-pci-generic 0000:01:00.0: using shared MSI
[    7.058407] mhi mhi0: Requested to power ON
[    7.062644] mhi mhi0: Attempting power on with EE: PASS THROUGH,
state: SYS ERROR
[   31.712022] mhi mhi0: Power on setup success
[   31.712113] mhi mhi0: Handling state transition: PBL
[   31.716353] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
MISSION MODE state: READY
[   31.729790] mhi mhi0: Device in READY State
[   31.733990] mhi mhi0: Initializing MHI registers
[   31.738704] mhi mhi0: Wait for device to enter SBL or Mission mode
[   31.815817] mhi mhi0: State change event to state: M0
[   31.820899] mhi mhi0: Received EE event: MISSION MODE
[   31.825955] mhi mhi0: Handling state transition: MISSION MODE
[   31.825964] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   31.831706] mhi mhi0: Processing Mission Mode transition
[   31.845374] mhi_net mhi0_IP_HW0: 100: Updating channel state to: START
[   31.865484] mhi_net mhi0_IP_HW0: 100: Channel state change to START
successful
[   31.865486] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   31.885952] mhi_net mhi0_IP_HW0: 101: Updating channel state to: START
[   31.900721] mhi_net mhi0_IP_HW0: 101: Channel state change to START
successful
[   31.900724] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   34.355880] mhi mhi0: Allowing M3 transition
[   34.360195] mhi mhi0: Waiting for M3 completion
[   34.375625] mhi mhi0: State change event to state: M3
[   38.168330] mhi_wwan_ctrl mhi0_DUN: 32: Updating channel state to: START
[   38.192041] mhi mhi0: Entered with PM state: M3, MHI state: M3
[   38.227956] mhi mhi0: State change event to state: M0
[   38.233062] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.244311] mhi_wwan_ctrl mhi0_DUN: 32: Channel state change to
START successful
[   38.244313] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.259829] mhi_wwan_ctrl mhi0_DUN: 33: Updating channel state to: START
[   38.269556] mhi_wwan_ctrl mhi0_DUN: 33: Channel state change to
START successful
[   38.269559] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.303920] mhi_wwan_ctrl mhi0_DIAG: 4: Updating channel state to: START
[   38.312881] mhi_wwan_ctrl mhi0_DIAG: 4: Channel state change to
START successful
[   38.312887] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.328385] mhi_wwan_ctrl mhi0_DIAG: 5: Updating channel state to: START
[   38.342113] mhi_wwan_ctrl mhi0_DIAG: 5: Channel state change to
START successful
[   38.342115] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.380484] mhi_wwan_ctrl mhi0_DIAG: mhi_ul_xfer_cb: status: 0 xfer_len: 5
[   38.387387] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: 0
receive_len: 58
[   38.394623] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.402731] mhi_wwan_ctrl mhi0_DIAG: 5: Updating channel state to: RESET
[   38.412993] mhi_wwan_ctrl mhi0_DIAG: 5: Channel state change to
RESET successful
[   38.412995] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.428487] mhi mhi0: Marking all events for chan: 5 as stale
[   38.434231] mhi mhi0: Finished marking events as stale events
[   38.439975] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.447373] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.454773] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.462172] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.469571] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.476967] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.484364] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.491761] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.499158] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.506555] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.513951] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.521349] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.526634] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 4
[   38.528746] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.535527] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 3
[   38.542914] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.549951] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 6
[   38.557342] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.571770] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.579167] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.586564] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.593961] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.601357] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.608754] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.616151] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.623548] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.630945] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.638341] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.645737] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.653134] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.660531] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.667927] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.675325] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.682721] mhi_wwan_ctrl mhi0_DIAG: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.690120] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.690139] mhi_wwan_ctrl mhi0_DIAG: 5: successfully reset
[   38.703696] mhi_wwan_ctrl mhi0_DIAG: 4: Updating channel state to: RESET
[   38.714240] mhi_wwan_ctrl mhi0_DIAG: 4: Channel state change to
RESET successful
[   38.714242] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.729761] mhi mhi0: Marking all events for chan: 4 as stale
[   38.735523] mhi mhi0: Finished marking events as stale events
[   38.741315] mhi_wwan_ctrl mhi0_DIAG: 4: successfully reset
[   38.749124] mhi_wwan_ctrl mhi0_QMI: 14: Updating channel state to: START
[   38.751835] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 9
[   38.762634] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 8
[   38.769692] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 39
[   38.776840] mhi_wwan_ctrl mhi0_QMI: 14: Channel state change to
START successful
[   38.776845] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.777142] mhi_wwan_ctrl mhi0_DUN: 33: Updating channel state to: RESET
[   38.784281] mhi_wwan_ctrl mhi0_QMI: 15: Updating channel state to: START
[   38.794145] mhi_wwan_ctrl mhi0_DUN: 33: Channel state change to
RESET successful
[   38.794147] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.802739] mhi_wwan_ctrl mhi0_QMI: 15: Channel state change to
START successful
[   38.802740] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   38.805745] mhi mhi0: Marking all events for chan: 33 as stale
[   38.805748] mhi mhi0: Finished marking events as stale events
[   38.848247] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.855561] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.862872] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.870185] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.877496] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.884807] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.892117] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.899428] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.906738] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.914049] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.921359] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.928669] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.935980] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.943290] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.950601] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.957911] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.965222] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.972532] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.979842] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.987152] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   38.994462] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.001772] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.009083] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.016393] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.023703] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.031013] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.038323] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.045634] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.052944] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.060255] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.067565] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.074910] mhi_wwan_ctrl mhi0_DUN: 33: successfully reset
[   39.080401] mhi_wwan_ctrl mhi0_DUN: 32: Updating channel state to: RESET
[   39.092830] mhi_wwan_ctrl mhi0_DUN: 32: Channel state change to
RESET successful
[   39.092833] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   39.108353] mhi mhi0: Marking all events for chan: 32 as stale
[   39.114190] mhi mhi0: Finished marking events as stale events
[   39.119965] mhi_wwan_ctrl mhi0_DUN: 32: successfully reset
[   39.910315] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 12
[   39.917246] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 12
[   39.924405] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 223
[   39.931651] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   39.944797] mhi_wwan_ctrl mhi0_QMI: 15: Updating channel state to: RESET
[   39.954196] mhi_wwan_ctrl mhi0_QMI: 15: Channel state change to
RESET successful
[   39.954198] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   39.969693] mhi mhi0: Marking all events for chan: 15 as stale
[   39.975525] mhi mhi0: Finished marking events as stale events
[   39.981273] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.988587] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   39.995898] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.003210] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.010521] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.017832] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.025143] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.032453] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.039764] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.047076] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.054386] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.061697] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.069007] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.076318] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.083628] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.090939] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.098249] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.105560] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.112871] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.120181] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.127492] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.134803] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.142113] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.149423] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.156734] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.164045] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.171356] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.178667] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.185977] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.193287] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.200598] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: -107
receive_len: 0
[   40.207934] mhi_wwan_ctrl mhi0_QMI: 15: successfully reset
[   40.213422] mhi_wwan_ctrl mhi0_QMI: 14: Updating channel state to: RESET
[   40.225553] mhi_wwan_ctrl mhi0_QMI: 14: Channel state change to
RESET successful
[   40.225555] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   40.241050] mhi mhi0: Marking all events for chan: 14 as stale
[   40.246884] mhi mhi0: Finished marking events as stale events
[   40.252647] mhi_wwan_ctrl mhi0_QMI: 14: successfully reset
[   40.259068] mhi_wwan_ctrl mhi0_QMI: 14: Updating channel state to: START
[   40.268178] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   40.271816] mhi_wwan_ctrl mhi0_QMI: 14: Channel state change to
START successful
[   40.283691] mhi_wwan_ctrl mhi0_QMI: 15: Updating channel state to: START
[   40.293126] mhi_wwan_ctrl mhi0_QMI: 15: Channel state change to
START successful
[   40.293129] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.388917] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 12
[   41.395829] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 12
[   41.402981] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 223
[   41.410234] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.438041] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 16
[   41.444932] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   41.452076] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.463093] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   41.469971] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 77
[   41.477111] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.497724] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 16
[   41.504615] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 17
[   41.511503] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   41.518647] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   41.525820] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.553652] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 16
[   41.560554] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   41.567707] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.587928] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 16
[   41.594830] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   41.601982] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.613012] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 16
[   41.619896] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   41.627031] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 27
[   41.634168] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 16
[   41.641048] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   41.648195] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.659376] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 16
[   41.666256] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   41.673398] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.684442] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 16
[   41.691329] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   41.698471] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.709331] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 16
[   41.716212] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   41.723352] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.723731] mhi_wwan_ctrl mhi0_DUN: 32: Updating channel state to: START
[   41.741600] mhi_wwan_ctrl mhi0_DUN: 32: Channel state change to
START successful
[   41.741602] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.757124] mhi_wwan_ctrl mhi0_DUN: 33: Updating channel state to: START
[   41.766019] mhi_wwan_ctrl mhi0_DUN: 33: Channel state change to
START successful
[   41.766023] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.785341] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 6
[   41.792144] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   41.799024] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 294
[   41.806249] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 5
[   41.813302] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 6
[   41.820349] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   41.827225] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 26
[   41.834358] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 6
[   41.841145] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 6
[   41.848188] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   41.855067] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 197
[   41.862287] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 6
[   41.869334] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 11
[   41.876206] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   41.883079] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 52
[   41.890210] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 6
[   41.897256] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 6
[   41.904041] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   41.910913] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 29
[   41.918045] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 6
[   41.925090] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 7
[   41.931874] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   41.938746] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 77
[   41.945888] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.958858] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 27
[   41.965739] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 20
[   41.972871] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 29
[   41.980011] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   41.990655] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   41.997534] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 26
[   42.004674] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.016836] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.023719] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 42
[   42.030857] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.041906] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.048787] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 145
[   42.056018] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.068150] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.075056] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   42.082221] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.094405] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 20
[   42.101285] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 27
[   42.108424] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.120823] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.127729] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 148
[   42.134982] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.147132] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.154012] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 148
[   42.161242] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.173040] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.179927] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 20
[   42.187068] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.198434] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.205317] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 152
[   42.212544] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.223609] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.230493] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 152
[   42.237722] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.250242] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.257126] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 152
[   42.264356] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.276996] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 35
[   42.283883] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 59
[   42.291028] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.302840] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.309720] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 28
[   42.316863] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.329098] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.335985] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 28
[   42.343122] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 12
[   42.350258] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 26
[   42.357131] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 25
[   42.364273] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.375434] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.382315] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 46
[   42.389454] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.401267] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.408174] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 23
[   42.415338] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.428215] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.435097] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 294
[   42.442327] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.454144] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.461025] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 294
[   42.468256] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.479429] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 20
[   42.486314] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 24
[   42.493454] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.504504] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.511385] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 152
[   42.518612] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.529675] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 12
[   42.536560] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 20
[   42.543702] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.554858] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.561738] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 26
[   42.568878] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.581755] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 18
[   42.588637] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 736
[   42.595869] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.608518] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 17
[   42.615403] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 46
[   42.622543] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.633622] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 18
[   42.640509] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 736
[   42.647741] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.660219] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 18
[   42.667125] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 739
[   42.674378] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.685479] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 24
[   42.692373] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 20
[   42.699507] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 50
[   42.706646] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.717880] mhi_wwan_ctrl mhi0_QMI: mhi_ul_xfer_cb: status: 0 xfer_len: 13
[   42.724764] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 20
[   42.731898] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0
receive_len: 156
[   42.739125] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.749313] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 10
[   42.756197] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 49
[   42.763336] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.774589] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 11
[   42.781473] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 6
[   42.788527] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   42.800278] mhi_wwan_ctrl mhi0_DUN: mhi_ul_xfer_cb: status: 0 xfer_len: 10
[   42.807183] mhi_wwan_ctrl mhi0_DUN: mhi_dl_xfer_cb: status: 0 receive_len: 36
[   42.814347] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   44.343867] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 12
[   44.351051] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   46.858056] mhi mhi0: Allowing M3 transition
[   46.862369] mhi mhi0: Waiting for M3 completion
[   46.903504] mhi mhi0: State change event to state: M3
[   48.979995] mhi mhi0: Entered with PM state: M3, MHI state: M3
[   48.997968] mhi mhi0: State change event to state: M0
[   49.003080] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   49.107630] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 12
[   49.114796] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   51.189638] mhi mhi0: Allowing M3 transition
[   51.193961] mhi mhi0: Waiting for M3 completion
[   51.214179] mhi mhi0: State change event to state: M3
[   57.364001] mhi mhi0: Entered with PM state: M3, MHI state: M3
[   57.396293] mhi mhi0: State change event to state: M0
[   57.401406] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   57.438409] mhi_wwan_ctrl mhi0_QMI: mhi_dl_xfer_cb: status: 0 receive_len: 12
[   57.445550] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   59.869534] mhi mhi0: Allowing M3 transition
[   59.873851] mhi mhi0: Waiting for M3 completion
[   59.893867] mhi mhi0: State change event to state: M3


-- 
Aleksander
https://aleksander.es
