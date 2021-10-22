Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D899F437923
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 16:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhJVOmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 10:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233145AbhJVOmu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 10:42:50 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429E1C061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Oct 2021 07:40:33 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id gn3so3147850pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Oct 2021 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t+jlPMA1dg4OfWoGGFCEON4a1V3lKsDj3UlO4kiDoNY=;
        b=HdWpvwuSquNCyQQNNZHuz34B3PGHXbpjbgIc56ZKSkY47WKBt8edHi5TFH7K9NsZTZ
         x9jrWUmX1EcpYUrli2pE2Od9CaoGexjyk6cb85wCPcHc6PBfUKsVkFrAM40X11cUl74V
         IFdFnm/bagNsLEqZnkMDUPkxTCHNKCkSEzsSqkSQovd54idWCytvgyGpYy88++uy/y5c
         NH+HWfJpiAmDY5GgiYeRtTw7nWOIpZIF/bq8Nd0yTtNZfz9oDOzaA1aTA/SkBoMqhEJ9
         cZYlZx0fhdbqNOxOMi9nT9Tv3PyAs/Gis7sUlmzfkwjPBd5Y9PoM99weniYmUhLvWA7k
         CCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t+jlPMA1dg4OfWoGGFCEON4a1V3lKsDj3UlO4kiDoNY=;
        b=NEXtIrCfzTBDZYNFwTbsU6KCwt+OMWqjTKi8UHX4VZCZ34TmSd6+9Eybg5rMq2BXEy
         n1ioGaUlmkgtcysrPLfPWOWyeFnEfqKBXwY/KzESL2kfEBATW7V+sCpEDlOt1mEs/+ur
         65ASiPDmq9VVX6ec77CWjCo1TnUgzgyJKIGJOUbQhGW+XR0hOf5aFQL5oX2fWa+RcpKq
         29BnfUOQCkD6gKsP0vPgBOOVr8qOPPCU0taW/vbzPjhMYUakIOxj5ziZ5h77z7Z22PbH
         jky+qEQm6t65MMr/8aNR3mrsYVhW7iJ3q32bkho42J8pNoPfogtD5F2ze4pNfYLmztt/
         vyLg==
X-Gm-Message-State: AOAM531SIzgtr0Bj2Hrld/DbEah1/BZ1L9akIiYsahAbaB5jPACmXVyw
        L6SAWNXcUukfm/3ne46vepLCzWsswmec
X-Google-Smtp-Source: ABdhPJwdl26K1EE7BngfpCdwlm20FGf2XpZtreqgiiOyqxwPfl2FPp9wW2521UQYko9SnFBxyURJKw==
X-Received: by 2002:a17:90a:6b4f:: with SMTP id x15mr15095023pjl.233.1634913632588;
        Fri, 22 Oct 2021 07:40:32 -0700 (PDT)
Received: from thinkpad ([59.92.97.72])
        by smtp.gmail.com with ESMTPSA id b3sm6618522pfm.54.2021.10.22.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 07:40:31 -0700 (PDT)
Date:   Fri, 22 Oct 2021 20:10:26 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
Message-ID: <20211022144026.GA7657@thinkpad>
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <20211009105132.GA204538@thinkpad>
 <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
 <20211022044229.GD3138@workstation>
 <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 22, 2021 at 11:20:00AM +0200, Aleksander Morgado wrote:
> Hey,
> 
> > > The successful boots seem to happen always on cold boots, and the
> > > success rate is low (30% or so) on some manual testing here. I haven't
> > > seen one single successful boot on system restarts, they all fail like
> > > in the previous email.
> > >
> > > When the boot is successful it looks like this:
> > >
> >
> > This looks to be a firmware issue. The device is in SYS_ERR state during
> > boot and that's expected. But what is strange is that the device stays
> > in SYS_ERR even after host issues RESET.
> >
> > Can you try the below diff and see if it does any good?
> >
> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > index fb99e3727155..a43c3ed77fb1 100644
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -104,7 +104,8 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
> >         /* L3 States */
> >         {
> >                 MHI_PM_LD_ERR_FATAL_DETECT,
> > -               MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE
> > +               MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE |
> > +               MHI_PM_SYS_ERR_PROCESS
> >         },
> >  };
> 
> Tested again in the RPi CM4 based setup, but didn't help, it's failing
> in the same way, still says PASS THROUGH state: SYS ERROR:
> 

Yes, that's expected. As I said, the device is going to a bad state and from the
host side, we could only try to recover it.

> [    7.032037] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
> [    7.039213] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> 0x600000000-0x600000fff 64bit]
> [    7.047759] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> [    7.054573] mhi-pci-generic 0000:01:00.0: using shared MSI
> [    7.060848] mhi mhi0: Requested to power ON
> [    7.065277] mhi mhi0: Attempting power on with EE: PASS THROUGH,
> state: SYS ERROR
> [    7.072799] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
> PASS THROUGH state: SYS ERROR
> [    7.081589] mhi mhi0: System error detected
> [    7.085867] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
> [    7.091886] mhi mhi0: Handling state transition: SYS ERROR
> [    7.097399] mhi mhi0: Transitioning from PM state: SYS ERROR Detect
> to: SYS ERROR Process
> [    7.105588] mhi-pci-generic 0000:01:00.0: firmware crashed (6)
> 

What happened after this point? Can you share the complete log?

> I've tested the same patches in my desktop PC (based on 5.13.1, and
> even without this last addition) and the boot process is much more
> stable and I cannot see the "firmware crashed" errors reported. My
> assumption right now is that the pci_generic.c entries we're adding
> are correct, but there's some limitation in this system that is making
> the EM9191 boot fail, but I still don't know which limitation it is.
> The memory addresses in the "BAR 0: assigned" log are definitely
> different in the RPi CM4, and also the shared MSI limitation. I recall
> Thomas saying that he also tested on a desktop PC forcing the shared
> MSI limitation and he had the same kind of firmware errors reported;
> I'll also try to test that.
> 

I think the PCI behaviour could be the issue between these 2 setups. But for
knowing exactly what's happening we need to get the log of the modem (I don't
think you can get that though).

Thanks,
Mani
