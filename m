Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD7942AD5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 21:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbhJLTk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 15:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbhJLTk4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 15:40:56 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458B2C061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 12:38:54 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i20so485086edj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 12:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GG+oaoFpBqGSFzrIzXNFPGlyDbOKnkqrhssfstgYMcU=;
        b=uKHsSB3g6fnLqWy4fW4IcNHDMKX9Y3m/1+RsyPmvmfL8yVKcUieNUYLNE6HDpbRHBg
         ElpMrp1iRVa98bRnG0OYxcLj/cq2hduAJQj3vqCCaWy3CeNQdzJHvoouioWwMSWJb0P7
         glh9DCpKF4iCiR/KPx8I8qapF3+oyR3RQqZ02WeFVgP5QV9/GHCunrJbHJJaR+SHVWnv
         I4X/dGtX1VRL42pXgSyNwpckSy1cr1KLBpmnZCF/LY7M6qA2dotTUHJNn7L9E7YnGvgH
         gOKr3WnpR2T/ByudNIM/shKwgvGG8+xqzslswEG6oDJ9qvSY9z4LU4HHPvW6n8nO/kpn
         HbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GG+oaoFpBqGSFzrIzXNFPGlyDbOKnkqrhssfstgYMcU=;
        b=jnZokduNFLNJq+bPfGvB1JTbMfLpk+ftV90K0EKqJYIFgqgWsHJ9xznSFtZJYqL+l5
         EbiCPxa3gEuBWcf+TNNU73qArUST1SLiigCRhuCFTZ3k+5roKhWZTz1jtWGa2hZ2gsOE
         g7olyYeAN3sS4MivaMOPBqFuDFkuJKfZZGw8FB2VUkQN9nUO/Nkvof0SB46j+1EwdjQE
         oMxKHBQKo4IEZWXkmNeyc6F5XqdoZtrPGwP75zMDfA3kyK0r4As9rlC1GxgtAS2Ph//B
         tDhcpNOl7kb8ZdwbC8e8e6SfaZ5PJNDOvfze74MJtxR/X8ICMpKCFMU0QJuJw+ZpjBBb
         WkWA==
X-Gm-Message-State: AOAM531YZ8JvYXkqDX0kKaG2IO3YimbcQicDeq2Gmo8+try1ilG2OAN2
        d6vxD+GEx2WtwnXN3wVxlEMwQYYEjn9geXlC+yZ3P4EDKCvGkw==
X-Google-Smtp-Source: ABdhPJz7I3a6rzRxHFqz3xi+myifVxnM2gBV+lMgYoS99z14cSukRaAzV30GaMxs35WTmOgMMp/N0xUfxxqxqlYVULU=
X-Received: by 2002:a50:9347:: with SMTP id n7mr2367312eda.249.1634067532770;
 Tue, 12 Oct 2021 12:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <20211009105132.GA204538@thinkpad>
In-Reply-To: <20211009105132.GA204538@thinkpad>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Tue, 12 Oct 2021 21:38:41 +0200
Message-ID: <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        hemantk@codeaurora.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey

> > I'm working on a setup using a RPi CM4 based board and a Sierra
> > Wireless EM9191 module, running OpenWRT 21.02 and backported mhi+wwan
> > drivers (from latest 5.15 rc). The kernel also has the
> > mhi_pci_dev_info entry written by Thomas, as per
> > https://forum.sierrawireless.com/t/sierra-wireless-airprime-em919x-pcie-support/24927
> >
> > The EM9191 is now running 02.08.01.00 (latest firmware from Sierra),
> > upgraded in several steps back from the original 01.04.01.02 the
> > module came with. The firmware upgrades were done with
> > qmi-firmware-update and the module in USB mode  in a desktop PC.
> >
> > Most of the system boots end up with the mhi driver reporting that the
> > module firmware crashed in different ways:
> >
> > [    7.060730] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
> > [    7.067906] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> > 0x600000000-0x600000fff 64bit]
> > [    7.076455] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> > [    7.083277] mhi-pci-generic 0000:01:00.0: using shared MSI
> > [    7.089508] mhi mhi0: Requested to power ON
> > [    7.094080] mhi mhi0: Attempting power on with EE: PASS THROUGH,
> > state: SYS ERROR
> > [    7.180371] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
> > PASS THROUGH state: SYS ERROR
> > [    7.187146] mhi mhi0: Power on setup success
> > [    7.187219] mhi mhi0: Handling state transition: PBL
> > [    7.189165] mhi mhi0: System error detected
> > [    7.189178] mhi mhi0: Device MHI is not in valid state
> > [    7.189189] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
> > [    7.213682] mhi mhi0: Handling state transition: SYS ERROR
> > [    7.219183] mhi mhi0: Transitioning from PM state: Linkdown or
> > Error Fatal Detect to: SYS ERROR Process
> > [    7.228590] mhi-pci-generic 0000:01:00.0: firmware crashed (6)
> > [    7.234429] mhi mhi0: Failed to transition from PM state: Linkdown
> > or Error Fatal Detect to: SYS ERROR Process
> > [    7.244433] mhi mhi0: Exiting with PM state: Linkdown or Error
> > Fatal Detect, MHI state: RESET
> > [    7.252963] mhi mhi0: Handling state transition: DISABLE
> > [    7.258278] mhi mhi0: Processing disable transition with PM state:
> > Linkdown or Error Fatal Detect
> > [    7.267155] mhi mhi0: Waiting for all pending event ring processing
> > to complete
> > [    7.274480] mhi mhi0: Waiting for all pending threads to complete
> > [    7.280576] mhi mhi0: Reset all active channels and remove MHI devices
> > [    7.287110] mhi mhi0: Resetting EV CTXT and CMD CTXT
> > [    7.292077] mhi mhi0: Exiting with PM state: DISABLE, MHI state: RESET
> > [    7.298683] mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
> > [    7.306184] mhi-pci-generic: probe of 0000:01:00.0 failed with error -110
> >
> > Some of the boots successfully finish and I can talk to both the QMI
> > and MBIM ports exposed by the WWAN subsystem, but the success rate is
> > extremely low.
> >
>
> Can you share the success log also?
>

The successful boots seem to happen always on cold boots, and the
success rate is low (30% or so) on some manual testing here. I haven't
seen one single successful boot on system restarts, they all fail like
in the previous email.

When the boot is successful it looks like this:

[    0.099938] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
[    0.099961] brcm-pcie fd500000.pcie:   No bus range found for
/scb/pcie@7d500000, using [bus 00-ff]
[    0.099999] brcm-pcie fd500000.pcie:      MEM
0x0600000000..0x0603ffffff -> 0x00f8000000
[    0.100032] brcm-pcie fd500000.pcie:   IB MEM
0x0000000000..0x00bfffffff -> 0x0000000000
[    0.149955] brcm-pcie fd500000.pcie: link up, 5 GT/s x1 (SSC)
[    0.150114] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
[    0.150133] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.150152] pci_bus 0000:00: root bus resource [mem
0x600000000-0x603ffffff] (bus address [0xf8000000-0xfbffffff])
[    0.150193] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
[    0.150282] pci 0000:00:00.0: PME# supported from D0 D3hot
[    0.153464] pci 0000:00:00.0: bridge configuration invalid ([bus
ff-ff]), reconfiguring
[    0.153589] pci 0000:01:00.0: [17cb:0306] type 00 class 0xff0000
[    0.153650] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    0.153680] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x00000fff 64bit]
[    0.153838] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.153889] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5 GT/s x1 link at 0000:00:00.0 (capable of 31.506 Gb/s with
16 GT/s x2 link)
[    0.156944] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    0.156983] pci 0000:00:00.0: BAR 8: assigned [mem 0x600000000-0x6000fffff]
[    0.157004] pci 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    0.157035] pci 0000:01:00.0: BAR 2: assigned [mem
0x600001000-0x600001fff 64bit]
[    0.157064] pci 0000:00:00.0: PCI bridge to [bus 01]
[    0.157079] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
[    0.157222] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
[    0.157340] pcieport 0000:00:00.0: PME: Signaling with IRQ 38
[    0.157567] pcieport 0000:00:00.0: AER: enabled with IRQ 38
[    7.052080] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
[    7.059284] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    7.067839] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
[    7.074676] mhi-pci-generic 0000:01:00.0: using shared MSI
[    7.080858] mhi mhi0: Requested to power ON
[    7.085357] mhi mhi0: Attempting power on with EE: PASS THROUGH,
state: SYS ERROR
[    7.431361] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
PASS THROUGH state: RESET
[    7.432247] mhi mhi0: Power on setup success
[    7.440015] mhi mhi0: Handling state transition: PBL
[    8.387907] mhi mhi0: Device in READY State
[    8.392128] mhi mhi0: Initializing MHI registers
[    8.396815] mhi mhi0: Wait for device to enter SBL or Mission mode
[   14.148059] mhi mhi0: State change event to state: M0
[   14.148076] mhi mhi0: local ee: PASS THROUGH state: READY device
ee: MISSION MODE state: M0
[   14.161518] mhi mhi0: Received EE event: MISSION MODE
[   14.161522] mhi mhi0: local ee: PASS THROUGH state: M0 device ee:
MISSION MODE state: M0
[   14.174684] mhi mhi0: Handling state transition: MISSION MODE
[   14.180447] mhi mhi0: Processing Mission Mode transition
[   14.186199] mhi_net mhi0_IP_HW0: 100: Updating channel state to: START
[   14.361842] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   14.363918] mhi_net mhi0_IP_HW0: 100: Channel state change to START
successful
[   14.377324] mhi_net mhi0_IP_HW0: 101: Updating channel state to: START
[   14.490249] mhi_net mhi0_IP_HW0: 101: Channel state change to START
successful
[   14.490255] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
[   16.835372] mhi mhi0: Allowing M3 transition
[   16.839695] mhi mhi0: Waiting for M3 completion
[   16.966594] mhi mhi0: State change event to state: M3
[   16.966615] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M3
[   20.460243] mhi_wwan_ctrl mhi0_DUN: 32: Updating channel state to: START
[   20.484117] mhi mhi0: Entered with PM state: M3, MHI state: M3
[   20.499999] mhi mhi0: State change event to state: M0
[   20.500021] mhi mhi0: local ee: MISSION MODE state: M3 device ee:
MISSION MODE state: M0
[   20.517791] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
MISSION MODE state: M0
....

When in this state, ModemManager/qmicli/mbimcli can pick up the device
right away, without any issues observed there. Haven't tested data
connection yet.

root@OpenWrt:~# mmcli -m 0
  -----------------------------
  General  |              path: /org/freedesktop/ModemManager1/Modem/0
           |         device id: 58a66d754412bf0a8ec2a840f111856d85a4b053
  -----------------------------
  Hardware |      manufacturer: Sierra Wireless, Incorporated
           |             model: EM9191
           | firmware revision: SWIX55C_02.08.01.00 58f60e jenkins
2021/03/12 18:05:48
           |    carrier config: default
           |      h/w revision: 0.2
           |         supported: gsm-umts, lte, 5gnr
           |           current: gsm-umts, lte, 5gnr
           |      equipment id: XXXXXXXXXXXXXX
  -----------------------------
  System   |            device:
/sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0
           |           drivers: mhi-pci-generic, mhi_net
           |            plugin: generic
           |      primary port: wwan0qmi0
           |             ports: mhi_hwip0 (net), wwan0at0 (at),
wwan0mbim0 (mbim),
           |                    wwan0qcdm0 (qcdm), wwan0qmi0 (qmi)
  -----------------------------
  Status   |             state: failed
           |     failed reason: sim-missing
           |       power state: on
           |    signal quality: 0% (cached)
  -----------------------------
  Modes    |         supported: allowed: 3g; preferred: none
           |                    allowed: 4g; preferred: none
           |                    allowed: 3g, 4g; preferred: 4g
           |                    allowed: 3g, 4g; preferred: 3g
           |                    allowed: 5g; preferred: none
           |                    allowed: 3g, 5g; preferred: 5g
           |                    allowed: 3g, 5g; preferred: 3g
           |                    allowed: 4g, 5g; preferred: 5g
           |                    allowed: 4g, 5g; preferred: 4g
           |                    allowed: 3g, 4g, 5g; preferred: 5g
           |                    allowed: 3g, 4g, 5g; preferred: 4g
           |                    allowed: 3g, 4g, 5g; preferred: 3g
           |           current: allowed: any; preferred: none
  -----------------------------
  Bands    |         supported: utran-1, utran-3, utran-4, utran-6,
utran-5, utran-8,
           |                    utran-9, utran-2, eutran-1, eutran-2,
eutran-3, eutran-4, eutran-5,
           |                    eutran-7, eutran-8, eutran-12,
eutran-13, eutran-14, eutran-17,
           |                    eutran-18, eutran-19, eutran-20,
eutran-25, eutran-26, eutran-28,
           |                    eutran-29, eutran-30, eutran-32,
eutran-34, eutran-38, eutran-39,
           |                    eutran-40, eutran-41, eutran-42,
eutran-46, eutran-48, eutran-66,
           |                    eutran-71, utran-19
  -----------------------------
  IP       |         supported: ipv4, ipv6, ipv4v6
  -----------------------------
  SIM      |    sim slot paths: slot 1: none (active)

root@OpenWrt:~# qmicli -d /dev/wwan0qmi0 -p --dms-get-capabilities
[/dev/wwan0qmi0] Device capabilities retrieved:
    Max TX channel rate: '50000000'
    Max RX channel rate: '100000000'
           Data Service: 'non-simultaneous-cs-ps'
                    SIM: 'supported'
               Networks: 'umts, lte, 5gnr'

root@OpenWrt:~# mbimcli -d /dev/wwan0mbim0 -p --query-device-caps
[/dev/wwan0mbim0] Device capabilities retrieved:
          Device type: 'embedded'
       Cellular class: 'gsm'
          Voice class: 'no-voice'
            SIM class: 'removable'
           Data class: 'umts, hsdpa, hsupa, lte, custom'
             SMS caps: 'pdu-receive, pdu-send'
            Ctrl caps: 'reg-manual'
         Max sessions: '15'
    Custom data class: '5G/TDS'
            Device ID: 'XXXXXXXXXXX'
        Firmware info: '02.08.01.00_GENERI_020.007_001'
        Hardware info: 'EM9191'

-- 
Aleksander
https://aleksander.es
