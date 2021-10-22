Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F70643749F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 11:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbhJVJWb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 05:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbhJVJWb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 05:22:31 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DA8C061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Oct 2021 02:20:13 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w19so4380906edd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Oct 2021 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LJsHu5FhyHjrg/HufZs7c4yGYOytkBGnU/9yiXXqIOI=;
        b=XExAgHy9EYvb4FGC3BkEZmVr1M+XG7DbSDNl0PtuWeET7ir/lflU71kAMAQJOMqu0T
         tFe7iApDS4NBQvPjPefsx6+MeEkAQl8DuuDt4cCbaIBaw7wY/bSY3GMykfe76ZGD8CNs
         nk5WYoenUSdzxziJBQAH5mUw1v3Yaaxmup0nnYnUtng6nv3tymXtDb7mgY40VGq7nh/e
         jKhQ2rpcqrnlWkr4vAt7zsaaIvcetpaTQr9T9ubBTEMs3vLv5Uc5/5FwT7j/N3LR2XuG
         2YHkHjeTRSB3JwRxyMrEEjh/SwsoEVYiU6UQoopaVXHmv8u7jeDOJ4yytTfLvYJeO1N2
         GJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LJsHu5FhyHjrg/HufZs7c4yGYOytkBGnU/9yiXXqIOI=;
        b=QOvWT6gaiO4QTSqZHqob+dqOwmYZVho2FO5AhX4AhGsI02J+roQT4VvMDkyS2HOwgp
         YR4gW4wvzzLWtG+6djRBRV0Jfn38RaqtFz8eNv1KYqbsXPeHdK7gq1I05OGYzu+FMa/m
         yk2gOyrwQ+UqsrSabMqRGd1t6nurdH3Zg30kfDlY3YYgg/QOjqT94LnZDXhLffO9dEgD
         bgSvKQbAbxHfTsgFJ1QnEws62Ubr+nChffOTixlaNp7LWJw781Cqry3x+oAhjxIImT+M
         QgABJkmS31PgbMFlBtw4AHX9TazWMdsAO9HGPdAo4c2adUPQs8HNa6m32hFpRDL9Kh5W
         ECrQ==
X-Gm-Message-State: AOAM531zNEEnY84BOiRs6iE1m7tR3AoXfNwIzWJkwHp3XQss2NKoeRQR
        R0TWasXJrjD08JhbANquk4je01Ac3GVKcvvwHjJfIVx03qc88A==
X-Google-Smtp-Source: ABdhPJyjmYwjT+tXhl2GQwBzJm5QDkhqMiOwikLUbXBoPPmOMFFICL0oOra73OJGNWc9vPJEVAO++WU6CTBKxnH6exk=
X-Received: by 2002:a05:6402:cb2:: with SMTP id cn18mr15210371edb.249.1634894411741;
 Fri, 22 Oct 2021 02:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <20211009105132.GA204538@thinkpad> <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
 <20211022044229.GD3138@workstation>
In-Reply-To: <20211022044229.GD3138@workstation>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Fri, 22 Oct 2021 11:20:00 +0200
Message-ID: <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
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

Hey,

> > The successful boots seem to happen always on cold boots, and the
> > success rate is low (30% or so) on some manual testing here. I haven't
> > seen one single successful boot on system restarts, they all fail like
> > in the previous email.
> >
> > When the boot is successful it looks like this:
> >
>
> This looks to be a firmware issue. The device is in SYS_ERR state during
> boot and that's expected. But what is strange is that the device stays
> in SYS_ERR even after host issues RESET.
>
> Can you try the below diff and see if it does any good?
>
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index fb99e3727155..a43c3ed77fb1 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -104,7 +104,8 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
>         /* L3 States */
>         {
>                 MHI_PM_LD_ERR_FATAL_DETECT,
> -               MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE
> +               MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE |
> +               MHI_PM_SYS_ERR_PROCESS
>         },
>  };

Tested again in the RPi CM4 based setup, but didn't help, it's failing
in the same way, still says PASS THROUGH state: SYS ERROR:

[    7.032037] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
[    7.039213] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    7.047759] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
[    7.054573] mhi-pci-generic 0000:01:00.0: using shared MSI
[    7.060848] mhi mhi0: Requested to power ON
[    7.065277] mhi mhi0: Attempting power on with EE: PASS THROUGH,
state: SYS ERROR
[    7.072799] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
PASS THROUGH state: SYS ERROR
[    7.081589] mhi mhi0: System error detected
[    7.085867] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
[    7.091886] mhi mhi0: Handling state transition: SYS ERROR
[    7.097399] mhi mhi0: Transitioning from PM state: SYS ERROR Detect
to: SYS ERROR Process
[    7.105588] mhi-pci-generic 0000:01:00.0: firmware crashed (6)

I've tested the same patches in my desktop PC (based on 5.13.1, and
even without this last addition) and the boot process is much more
stable and I cannot see the "firmware crashed" errors reported. My
assumption right now is that the pci_generic.c entries we're adding
are correct, but there's some limitation in this system that is making
the EM9191 boot fail, but I still don't know which limitation it is.
The memory addresses in the "BAR 0: assigned" log are definitely
different in the RPi CM4, and also the shared MSI limitation. I recall
Thomas saying that he also tested on a desktop PC forcing the shared
MSI limitation and he had the same kind of firmware errors reported;
I'll also try to test that.

Here are the logs in my desktop pc for reference:
oct 21 09:24:06 ares kernel: mhi-pci-generic 0000:17:00.0: MHI PCI
device found: sierra-em919x
oct 21 09:24:06 ares kernel: mhi-pci-generic 0000:17:00.0: BAR 0:
assigned [mem 0xb5e01000-0xb5e01fff 64bit]
oct 21 09:24:06 ares kernel: mhi mhi0: Requested to power ON
oct 21 09:24:06 ares kernel: mhi mhi0: Power on setup success
oct 21 09:24:06 ares kernel: mhi mhi0: Handling state transition: READY
oct 21 09:24:06 ares kernel: mhi mhi0: Device in READY State
oct 21 09:24:06 ares kernel: mhi mhi0: Initializing MHI registers
oct 21 09:24:06 ares kernel: mhi mhi0: State change event to state: M0
oct 21 09:24:06 ares kernel: mhi mhi0: Received EE event: MISSION MODE
oct 21 09:24:06 ares kernel: mhi mhi0: Handling state transition: MISSION MODE
oct 21 09:24:06 ares kernel: mhi mhi0: Processing Mission Mode transition
oct 21 09:24:06 ares kernel: mhi_net mhi0_IP_HW0: 100: Updating
channel state to: START
oct 21 09:24:06 ares kernel: mhi_net mhi0_IP_HW0: 100: Channel state
change to START successful
oct 21 09:24:06 ares kernel: mhi_net mhi0_IP_HW0: 101: Updating
channel state to: START
oct 21 09:24:06 ares kernel: mhi_net mhi0_IP_HW0: 101: Channel state
change to START successful
oct 21 09:24:08 ares kernel: mhi mhi0: Allowing M3 transition
oct 21 09:24:08 ares kernel: mhi mhi0: Waiting for M3 completion
oct 21 09:24:08 ares kernel: mhi mhi0: State change event to state: M3

-- 
Aleksander
https://aleksander.es
