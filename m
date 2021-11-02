Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14BA944338F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 17:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbhKBQrM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 12:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234796AbhKBQqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 12:46:49 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB98C0613B9
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Nov 2021 09:14:17 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id f4so19701344edx.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Nov 2021 09:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jm0pbGKrUiiBf4C+3zKCptakkWWwoyD0We1v50NVxSY=;
        b=v7JHOgYHJ/I5aXQXqDZueAPcvrmsPT9SrwQKIEElocqtX8TYxZL4l7+CXd2OOqLZmZ
         XzMoBHJ7P0DX/u38aKg0ucaKrZSFLTUUaGgYIJx/YKSoltFN8GZj9m0PIlRLawXjZAkJ
         4qNTvkvdkRsFN0SwCUcPeZTQ7fFmU5Od3LuiPHJVsB4iFMnKdUEAmAKOGT8VM6DJaf7y
         qnuNdlvp1xZ3rZzxeQH10QktElWWzdz+Uizow1URtZQrVrXYgdpsjNNcSryUwi2c7j6s
         TwY7Wtmneus4IPKfUZ/08wUXUxr9k6YZ5wE9p+odOVW2e5CPslP0RZQgYZ2fx9IJuAlU
         zT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jm0pbGKrUiiBf4C+3zKCptakkWWwoyD0We1v50NVxSY=;
        b=GZxfRFXP2A9v+0ffn5QKDovJLRTHtC+Ku191QQB18Q34NPR11e2FVWOhhgNmtsvk6l
         I3d9YZb1LdhTo8y8r3rNSIwSQHEyDbrzO8BeRsUplv7g1y6lvo8//xQx3Kqqw6/LmLq8
         LbLWkk9NGXlp+0h9FtjFVkvO4dNk0R6/lrZ3W4WFz6L/6VwqLnSjcDoHylLU/R2UBcPB
         N03OWyT5C7bbmxrooXUo35uwAP1VkJDiQWuzBDVguwwHUQ5X6Wd96WbJ7BHJXKLcZeFz
         uFzxNkGgWdxROUeNSrU3nObiAt2Qjov/HYolGTFxsF+CIql/RJ5InwnKteY1kYY01W4w
         6zdg==
X-Gm-Message-State: AOAM531NBNeZRPBQnbkrmK1E2F1XdbDfl+9RW3hYF2ZumJbrKxxSPHdZ
        kf9ozlmwhxIyiD16Oh6bfOzM21B7ocQ1rwA60Hkc7Q==
X-Google-Smtp-Source: ABdhPJw/9YbCe53BZw5jHOSmd8ZVTrZkhSmnhnaTvb+0/836Zln/TfkASibLhrJBdLpnSjb1rNk2VGbwYiPC3/7yoI8=
X-Received: by 2002:a17:907:939:: with SMTP id au25mr45618613ejc.166.1635869649904;
 Tue, 02 Nov 2021 09:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <20211009105132.GA204538@thinkpad> <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
 <20211022044229.GD3138@workstation> <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
 <20211022144026.GA7657@thinkpad> <CAAP7ucJGkAKqyvUJJnCgX8AejsHSaY0AeAxKoCJahAeVLw5ThQ@mail.gmail.com>
 <20211102105035.GB5646@thinkpad>
In-Reply-To: <20211102105035.GB5646@thinkpad>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Tue, 2 Nov 2021 17:13:58 +0100
Message-ID: <CAAP7ucLVtOR7+NJiWK_is0yv+zWKB9vmxpy4PyO5FQdVUE6uzA@mail.gmail.com>
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

Hey Mani,

> > [    7.189547] mhi mhi0: Transitioning from PM state: Linkdown or
> > Error Fatal Detect to: SYS ERROR Process
>
> Hmm, I think the use of sync_power_up might be causing the issue here as it
> forces the MHI state to fatal error.
>
> Ignore the previous diff and try the below one:
>
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 59a4896a8030..b1e8c7de4e54 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -637,7 +637,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>         if (err)
>                 goto err_try_reset;
>
> -       err = mhi_sync_power_up(mhi_cntrl);
> +       err = mhi_async_power_up(mhi_cntrl);
>         if (err)
>                 goto err_unprepare;
>

Same thing I think, see the logs below:

root@OpenWrt:~# dmesg | grep -E "mhi|pci"
[    0.099139] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
[    0.099163] brcm-pcie fd500000.pcie:   No bus range found for
/scb/pcie@7d500000, using [bus 00-ff]
[    0.099200] brcm-pcie fd500000.pcie:      MEM
0x0600000000..0x0603ffffff -> 0x00f8000000
[    0.099234] brcm-pcie fd500000.pcie:   IB MEM
0x0000000000..0x00bfffffff -> 0x0000000000
[    0.145977] brcm-pcie fd500000.pcie: link up, 5 GT/s x1 (SSC)
[    0.146136] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
[    0.146155] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.146173] pci_bus 0000:00: root bus resource [mem
0x600000000-0x603ffffff] (bus address [0xf8000000-0xfbffffff])
[    0.146214] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
[    0.146305] pci 0000:00:00.0: PME# supported from D0 D3hot
[    0.149482] pci 0000:00:00.0: bridge configuration invalid ([bus
ff-ff]), reconfiguring
[    0.149605] pci 0000:01:00.0: [17cb:0306] type 00 class 0xff0000
[    0.149667] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    0.149698] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x00000fff 64bit]
[    0.149856] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.149906] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5 GT/s x1 link at 0000:00:00.0 (capable of 31.506 Gb/s with
16 GT/s x2 link)
[    0.152957] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    0.152995] pci 0000:00:00.0: BAR 8: assigned [mem 0x600000000-0x6000fffff]
[    0.153017] pci 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    0.153047] pci 0000:01:00.0: BAR 2: assigned [mem
0x600001000-0x600001fff 64bit]
[    0.153077] pci 0000:00:00.0: PCI bridge to [bus 01]
[    0.153092] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
[    0.153237] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
[    0.153354] pcieport 0000:00:00.0: PME: Signaling with IRQ 38
[    0.153579] pcieport 0000:00:00.0: AER: enabled with IRQ 38
[    7.068355] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
[    7.075535] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    7.084077] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
[    7.090865] mhi-pci-generic 0000:01:00.0: using shared MSI
[    7.096975] mhi mhi0: Requested to power ON
[    7.101275] mhi mhi0: Attempting power on with EE: PASS THROUGH,
state: SYS ERROR
[    7.143799] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
PASS THROUGH state: SYS ERROR
[    7.152590] mhi mhi0: System error detected
[    7.156796] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
[    7.162671] mhi mhi0: Power on setup success
[    7.166957] mhi mhi0: Handling state transition: SYS ERROR
[    7.172442] mhi mhi0: Transitioning from PM state: Linkdown or
Error Fatal Detect to: SYS ERROR Process
[    7.181832] mhi-pci-generic 0000:01:00.0: firmware crashed (6)
[    7.187661] mhi mhi0: Failed to transition from PM state: Linkdown
or Error Fatal Detect to: SYS ERROR Process
[    7.197659] mhi mhi0: Exiting with PM state: Linkdown or Error
Fatal Detect, MHI state: RESET
[    7.206180] mhi mhi0: Handling state transition: PBL
[    7.211140] mhi mhi0: Device MHI is not in valid state
[    7.216273] mhi mhi0: Handling state transition: DISABLE
[    7.221580] mhi mhi0: Processing disable transition with PM state:
Linkdown or Error Fatal Detect
[    7.230449] mhi mhi0: Waiting for all pending event ring processing
to complete
[    7.237762] mhi mhi0: Waiting for all pending threads to complete
[    7.243851] mhi mhi0: Reset all active channels and remove MHI devices
[    7.250374] mhi mhi0: Resetting EV CTXT and CMD CTXT
[    7.255335] mhi mhi0: Exiting with PM state: DISABLE, MHI state: RESET
[    7.261895] mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
[    7.269057] mhi-pci-generic: probe of 0000:01:00.0 failed with error -110


-- 
Aleksander
https://aleksander.es
