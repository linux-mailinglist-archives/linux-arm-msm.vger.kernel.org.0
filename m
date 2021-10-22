Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38A9437100
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 06:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbhJVEov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 00:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbhJVEov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 00:44:51 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 531C1C061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 21:42:34 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id y1so1869238plk.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 21:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i5V7y5pXA5lYyDak5hdi70DPlqls4lRj45oVVI0zLrI=;
        b=VIm+BxLyNqbgebLvA0WE4hWdvpBSYgggot92l0Vv6+NzmYAuG7JCo9qVd/0MNLBI9L
         4fQ5ChZSiYDiZ08yGhHopz1rcAZSJq0a4VNlElCvUvtwWFHXSa3T270tYAz2xfu+cz2F
         7AppsPMubgxOr6Q1bHLBjoNDV8jDD5Jmd6zmD2Nve3kQlPZ6tXw5dvjxbGXjawbTEkB+
         ja/CZ4bHgbKRqpK5tU3E7lV03pjWI41xnrVwr86FL1+qPlj5PgooZAo/o/uDc4CeuAFG
         IoveHuApTo3+JwTjhK8yDiREU8NekyHlLSSNbtWrj8uqQfsFNZPwZ+03I1X78jIUm4rS
         2YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i5V7y5pXA5lYyDak5hdi70DPlqls4lRj45oVVI0zLrI=;
        b=GrcLOQK1xlWrLgV64Fhraq+QhgKPbMja9fsKR8zl1Wr/dZTSW2wrMl170H32rC47JU
         aCqYu7iZuf5WF2Pd7/nQnm6P0SLcoce5/ZBdcpYAltlipxffoaPYGoRfYfOrnhNGkj7M
         JMJCe4uf162JjPA0Ua+c5TblVSzuCOVZD4kpj/pv1hdSsm8vfoN4jadh0apPocGHcGRO
         aNJzwN/h051GrtjSSowYmoYc6X22QMA7oc1Wppbvsgr+vYx5No+90eawCi92H6JggMxc
         Fd/hNSp2CdcVVAOOG4SEDaDYadp0Z5uQYAfPiPgTjS8BhtZJQMldel80BwrRw21CN10a
         F8dA==
X-Gm-Message-State: AOAM530zxjR9Gf7N+LC3Zkfc4RjfN+2sA0H1NabpRRHfczdoPAmrekCU
        gw9Q2RLfj+woTmFzwzFBCelM
X-Google-Smtp-Source: ABdhPJw/EVeKxnEYgtP09503B2YoNf+gU18YOpz5xpvL5oj6EnS/Ho8POD/DV5SYNrvCJrXEikSgXg==
X-Received: by 2002:a17:90b:1c02:: with SMTP id oc2mr11833440pjb.52.1634877753587;
        Thu, 21 Oct 2021 21:42:33 -0700 (PDT)
Received: from workstation ([202.21.43.206])
        by smtp.gmail.com with ESMTPSA id a27sm7751627pfl.20.2021.10.21.21.42.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 21:42:32 -0700 (PDT)
Date:   Fri, 22 Oct 2021 10:12:29 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        hemantk@codeaurora.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
Message-ID: <20211022044229.GD3138@workstation>
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <20211009105132.GA204538@thinkpad>
 <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Aleksander,

On Tue, Oct 12, 2021 at 09:38:41PM +0200, Aleksander Morgado wrote:
> Hey
> 

[...]

> The successful boots seem to happen always on cold boots, and the
> success rate is low (30% or so) on some manual testing here. I haven't
> seen one single successful boot on system restarts, they all fail like
> in the previous email.
> 
> When the boot is successful it looks like this:
> 

This looks to be a firmware issue. The device is in SYS_ERR state during
boot and that's expected. But what is strange is that the device stays
in SYS_ERR even after host issues RESET.

Can you try the below diff and see if it does any good?

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index fb99e3727155..a43c3ed77fb1 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -104,7 +104,8 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
        /* L3 States */
        {
                MHI_PM_LD_ERR_FATAL_DETECT,
-               MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE
+               MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE |
+               MHI_PM_SYS_ERR_PROCESS
        },
 };

Thanks,
Mani

> [    0.099938] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
> [    0.099961] brcm-pcie fd500000.pcie:   No bus range found for
> /scb/pcie@7d500000, using [bus 00-ff]
> [    0.099999] brcm-pcie fd500000.pcie:      MEM
> 0x0600000000..0x0603ffffff -> 0x00f8000000
> [    0.100032] brcm-pcie fd500000.pcie:   IB MEM
> 0x0000000000..0x00bfffffff -> 0x0000000000
> [    0.149955] brcm-pcie fd500000.pcie: link up, 5 GT/s x1 (SSC)
> [    0.150114] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
> [    0.150133] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.150152] pci_bus 0000:00: root bus resource [mem
> 0x600000000-0x603ffffff] (bus address [0xf8000000-0xfbffffff])
> [    0.150193] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
> [    0.150282] pci 0000:00:00.0: PME# supported from D0 D3hot
> [    0.153464] pci 0000:00:00.0: bridge configuration invalid ([bus
> ff-ff]), reconfiguring
> [    0.153589] pci 0000:01:00.0: [17cb:0306] type 00 class 0xff0000
> [    0.153650] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
> [    0.153680] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x00000fff 64bit]
> [    0.153838] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
> [    0.153889] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
> limited by 5 GT/s x1 link at 0000:00:00.0 (capable of 31.506 Gb/s with
> 16 GT/s x2 link)
> [    0.156944] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> [    0.156983] pci 0000:00:00.0: BAR 8: assigned [mem 0x600000000-0x6000fffff]
> [    0.157004] pci 0000:01:00.0: BAR 0: assigned [mem
> 0x600000000-0x600000fff 64bit]
> [    0.157035] pci 0000:01:00.0: BAR 2: assigned [mem
> 0x600001000-0x600001fff 64bit]
> [    0.157064] pci 0000:00:00.0: PCI bridge to [bus 01]
> [    0.157079] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
> [    0.157222] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
> [    0.157340] pcieport 0000:00:00.0: PME: Signaling with IRQ 38
> [    0.157567] pcieport 0000:00:00.0: AER: enabled with IRQ 38
> [    7.052080] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
> [    7.059284] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> 0x600000000-0x600000fff 64bit]
> [    7.067839] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> [    7.074676] mhi-pci-generic 0000:01:00.0: using shared MSI
> [    7.080858] mhi mhi0: Requested to power ON
> [    7.085357] mhi mhi0: Attempting power on with EE: PASS THROUGH,
> state: SYS ERROR
> [    7.431361] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
> PASS THROUGH state: RESET
> [    7.432247] mhi mhi0: Power on setup success
> [    7.440015] mhi mhi0: Handling state transition: PBL
> [    8.387907] mhi mhi0: Device in READY State
> [    8.392128] mhi mhi0: Initializing MHI registers
> [    8.396815] mhi mhi0: Wait for device to enter SBL or Mission mode
> [   14.148059] mhi mhi0: State change event to state: M0
> [   14.148076] mhi mhi0: local ee: PASS THROUGH state: READY device
> ee: MISSION MODE state: M0
> [   14.161518] mhi mhi0: Received EE event: MISSION MODE
> [   14.161522] mhi mhi0: local ee: PASS THROUGH state: M0 device ee:
> MISSION MODE state: M0
> [   14.174684] mhi mhi0: Handling state transition: MISSION MODE
> [   14.180447] mhi mhi0: Processing Mission Mode transition
> [   14.186199] mhi_net mhi0_IP_HW0: 100: Updating channel state to: START
> [   14.361842] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
> MISSION MODE state: M0
> [   14.363918] mhi_net mhi0_IP_HW0: 100: Channel state change to START
> successful
> [   14.377324] mhi_net mhi0_IP_HW0: 101: Updating channel state to: START
> [   14.490249] mhi_net mhi0_IP_HW0: 101: Channel state change to START
> successful
> [   14.490255] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
> MISSION MODE state: M0
> [   16.835372] mhi mhi0: Allowing M3 transition
> [   16.839695] mhi mhi0: Waiting for M3 completion
> [   16.966594] mhi mhi0: State change event to state: M3
> [   16.966615] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
> MISSION MODE state: M3
> [   20.460243] mhi_wwan_ctrl mhi0_DUN: 32: Updating channel state to: START
> [   20.484117] mhi mhi0: Entered with PM state: M3, MHI state: M3
> [   20.499999] mhi mhi0: State change event to state: M0
> [   20.500021] mhi mhi0: local ee: MISSION MODE state: M3 device ee:
> MISSION MODE state: M0
> [   20.517791] mhi mhi0: local ee: MISSION MODE state: M0 device ee:
> MISSION MODE state: M0
> ....
> 
> When in this state, ModemManager/qmicli/mbimcli can pick up the device
> right away, without any issues observed there. Haven't tested data
> connection yet.
> 
> root@OpenWrt:~# mmcli -m 0
>   -----------------------------
>   General  |              path: /org/freedesktop/ModemManager1/Modem/0
>            |         device id: 58a66d754412bf0a8ec2a840f111856d85a4b053
>   -----------------------------
>   Hardware |      manufacturer: Sierra Wireless, Incorporated
>            |             model: EM9191
>            | firmware revision: SWIX55C_02.08.01.00 58f60e jenkins
> 2021/03/12 18:05:48
>            |    carrier config: default
>            |      h/w revision: 0.2
>            |         supported: gsm-umts, lte, 5gnr
>            |           current: gsm-umts, lte, 5gnr
>            |      equipment id: XXXXXXXXXXXXXX
>   -----------------------------
>   System   |            device:
> /sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0
>            |           drivers: mhi-pci-generic, mhi_net
>            |            plugin: generic
>            |      primary port: wwan0qmi0
>            |             ports: mhi_hwip0 (net), wwan0at0 (at),
> wwan0mbim0 (mbim),
>            |                    wwan0qcdm0 (qcdm), wwan0qmi0 (qmi)
>   -----------------------------
>   Status   |             state: failed
>            |     failed reason: sim-missing
>            |       power state: on
>            |    signal quality: 0% (cached)
>   -----------------------------
>   Modes    |         supported: allowed: 3g; preferred: none
>            |                    allowed: 4g; preferred: none
>            |                    allowed: 3g, 4g; preferred: 4g
>            |                    allowed: 3g, 4g; preferred: 3g
>            |                    allowed: 5g; preferred: none
>            |                    allowed: 3g, 5g; preferred: 5g
>            |                    allowed: 3g, 5g; preferred: 3g
>            |                    allowed: 4g, 5g; preferred: 5g
>            |                    allowed: 4g, 5g; preferred: 4g
>            |                    allowed: 3g, 4g, 5g; preferred: 5g
>            |                    allowed: 3g, 4g, 5g; preferred: 4g
>            |                    allowed: 3g, 4g, 5g; preferred: 3g
>            |           current: allowed: any; preferred: none
>   -----------------------------
>   Bands    |         supported: utran-1, utran-3, utran-4, utran-6,
> utran-5, utran-8,
>            |                    utran-9, utran-2, eutran-1, eutran-2,
> eutran-3, eutran-4, eutran-5,
>            |                    eutran-7, eutran-8, eutran-12,
> eutran-13, eutran-14, eutran-17,
>            |                    eutran-18, eutran-19, eutran-20,
> eutran-25, eutran-26, eutran-28,
>            |                    eutran-29, eutran-30, eutran-32,
> eutran-34, eutran-38, eutran-39,
>            |                    eutran-40, eutran-41, eutran-42,
> eutran-46, eutran-48, eutran-66,
>            |                    eutran-71, utran-19
>   -----------------------------
>   IP       |         supported: ipv4, ipv6, ipv4v6
>   -----------------------------
>   SIM      |    sim slot paths: slot 1: none (active)
> 
> root@OpenWrt:~# qmicli -d /dev/wwan0qmi0 -p --dms-get-capabilities
> [/dev/wwan0qmi0] Device capabilities retrieved:
>     Max TX channel rate: '50000000'
>     Max RX channel rate: '100000000'
>            Data Service: 'non-simultaneous-cs-ps'
>                     SIM: 'supported'
>                Networks: 'umts, lte, 5gnr'
> 
> root@OpenWrt:~# mbimcli -d /dev/wwan0mbim0 -p --query-device-caps
> [/dev/wwan0mbim0] Device capabilities retrieved:
>           Device type: 'embedded'
>        Cellular class: 'gsm'
>           Voice class: 'no-voice'
>             SIM class: 'removable'
>            Data class: 'umts, hsdpa, hsupa, lte, custom'
>              SMS caps: 'pdu-receive, pdu-send'
>             Ctrl caps: 'reg-manual'
>          Max sessions: '15'
>     Custom data class: '5G/TDS'
>             Device ID: 'XXXXXXXXXXX'
>         Firmware info: '02.08.01.00_GENERI_020.007_001'
>         Hardware info: 'EM9191'
> 
> -- 
> Aleksander
> https://aleksander.es
