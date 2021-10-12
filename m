Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F0242AD6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 21:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbhJLTrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 15:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJLTrG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 15:47:06 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87DDC061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 12:45:04 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id p13so836155edw.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 12:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LaGMKIM6JpauQwM39jx8Ax8Xyn95pAg4AlTWcMEq/pA=;
        b=5hgYeIF7eCrelwY34QMmL2JmKZq44QL+1JLzzDnHrK5bxQB3q99T0SlT51iv/3ENM4
         EeTwVjH5DyAVMcuSflbTmCK4HqvN4jNmFP4OHLz22GcmOjgRAzDWbgv8bhAIvRcDXlJz
         uP85p2AifvN5hTd8PDDtCnr2TymPQ++OYZ8ZO+JW6YTlXJ+WR1zJPFXiuAYH6VB/Wxrg
         aEm7PJlvA4gpCXozTk/jXJ28offEdgmTmiGQhpJxS5hcSooe1yDuijlC2CQXM4EBpcl/
         ZAKykOzmIMtMrnDgxWavcpDWmBnLAuW7+AYsQEGdC/lngI4T8sLBi2nh3WGxhV/KoPBH
         R7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LaGMKIM6JpauQwM39jx8Ax8Xyn95pAg4AlTWcMEq/pA=;
        b=XrMlVj0DOjA2r7BmxTJXFbhGvQH34Bdb+A6yHq0RVOTgj3Ps69/4PRe7LFqtnL11Kw
         dFWOAJgFz4VBxCtjnTQ64NjgcryuxAmnPwmXUXIbx7mL5fRKGpejlKc781uluqNK0mgf
         qIbhtzkvUm6sLvEhXbqIGuQBSp85GHMKd0c/QzQASA5RuvLeHHJl3m9xKkLuz5/KKQ+7
         tmA1eKM2gz9EVCR4PjWQPGVCSRBUwJp7V+wQYDxHPN8wTW1MYqL972h9XQuehW2ox8cj
         NqhWx1wyv4p/7J3PGMrKX3i1SBsHujoxRXn0ixDi6MqyCdXa9j10mWOjeKFpJ0kLOwKi
         2bdA==
X-Gm-Message-State: AOAM5317Buxwlj1IgcKFWnvugqd54B5/tS6EeXRDeHx9D/FKvYxI37A3
        fnKbdjziufxKwUVStP6eQ73asEYGc5rEcH4aigyqqA==
X-Google-Smtp-Source: ABdhPJw16Iwe/BarY8aqczPUP176eyIMjWrp9f8QnwSgxH7FkvstGSWulLYT42pNVHy0W5qG0HwxWgLDT+Tl0pEUNF4=
X-Received: by 2002:a50:c006:: with SMTP id r6mr2478236edb.289.1634067903373;
 Tue, 12 Oct 2021 12:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
In-Reply-To: <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Tue, 12 Oct 2021 21:44:52 +0200
Message-ID: <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, hemantk@codeaurora.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
> > [    7.060730] mhi-pci-generic 0000:01:00.0: MHI PCI device found:
> > sierra-em919x
> > [    7.067906] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> > 0x600000000-0x600000fff 64bit]
> > [    7.076455] mhi-pci-generic 0000:01:00.0: enabling device (0000 ->
> > 0002)
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
> > [    7.280576] mhi mhi0: Reset all active channels and remove MHI
> > devices
> > [    7.287110] mhi mhi0: Resetting EV CTXT and CMD CTXT
> > [    7.292077] mhi mhi0: Exiting with PM state: DISABLE, MHI state:
> > RESET
> > [    7.298683] mhi-pci-generic 0000:01:00.0: failed to power up MHI
> > controller
> > [    7.306184] mhi-pci-generic: probe of 0000:01:00.0 failed with error
> > -110
> >
> > Some of the boots successfully finish and I can talk to both the QMI
> > and MBIM ports exposed by the WWAN subsystem, but the success rate is
> > extremely low.
> >
> > Thomas, are you seeing similar issues in your setup?
>
> On our setup, using i.MX6DL based board and a PCIe Sierra Wireless
> EM9190 module, running Yocto and Linux 5.13, we don't have much success
> for the moment, qmi and mbim commands very often end in timeout.
>
> Otherwise, when responses are received, we also can observe strange
> things: unexpected messages, response to previous commands or queue
> buffer issue.
>

Are you testing this with qmicli + mbimcli + ModemManager? And if so,
are you running the qmicli/mbimcli commands with the "-p" option in
order to always use the intermediate qmi-proxy/mbim-proxy? I'd suggest
to always do that to avoid having multiple processes talking to the
ports at the same time.


> I updated the topic opened on the Sierra Wireless forum, with our
> latest progress and as well as additional information.
>
> In addition, we observed some strange behavior of the EM919x after warm
> reboots.
>

Is the log after the warm reboots similar to the one I showed in my
first email, i.e. with the 2 reported "firmware crashes"? Or does it
look totally different?
And, do you always see the module booting properly on cold boots? Or
do you see failed boots like the one i showed in my first email?

-- 
Aleksander
https://aleksander.es
